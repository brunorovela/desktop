unit uResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, ComCtrls, StdCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Ucrpe32,
  ClassRegistros, UMDateTimePicker, Buttons;

type
  TfrmResumo = class(TForm)
    Panel1: TPanel;
    btnImprimir: TButton;
    btnFechar: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    cbUsuarios: TComboBox;
    Label2: TLabel;
    cbData: TComboBox;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    sbPropriedades: TSpeedButton;
    procedure sbPropriedadesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    aUsuarios : array of integer;
  public
    CaixaDepto : Integer; // Código do Caixa Depto que será impresso
    TipoCaixa : Integer;
    Coligada  : Integer;
    { Public declarations }
  end;

var
  frmResumo: TfrmResumo;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmResumo.FormShow(Sender: TObject);
Var
  qyUsuarios : TUMZQuery;
  i : Integer;
begin
  DM.CriarConsulta(qyUsuarios);

  // Listar todos os usuários que um dia fizeram lancamento no caixa
  qyUsuarios.SQL.Text :=
    ' SELECT p.cd_pessoa as codigo, p.nm_pessoa as nome ' +
    '   FROM fin_contas_usuarios as u ' +
    '  INNER JOIN pessoas as p ON (p.cd_pessoa = u.cd_usuario) ' +
    '  GROUP BY p.cd_pessoa, p.nm_pessoa ' +
    '  ORDER BY p.nm_pessoa ';
  qyUsuarios.Open();

  SetLength(aUsuarios, qyUsuarios.RecordCount + 1 );

  cbUsuarios.Clear();

  cbUsuarios.Items.Add('Todos os Usuários');
  aUsuarios[0] := 0;
  
  i := 1;

  while not qyUsuarios.Eof do begin

    cbUsuarios.Items.Add( qyUsuarios.FieldByName('nome').AsString );
    aUsuarios[i] := qyUsuarios.FieldByName('codigo').AsInteger;

    inc(i);

    qyUsuarios.Next();

  end;

  cbData.Clear();

  if TipoCaixa = 3 then begin

     cbData.Items.Add('Abertura do Caixa');

  end;

  cbData.Items.Add('Movimentação');
  cbData.Items.Add('Compensação');
  cbData.Items.Add('Registro no Sistema');

  cbData.ItemIndex := 0;
  cbUsuarios.ItemIndex := 0;  

  FreeAndNil(qyUsuarios);

  umdtInicial.Date := DataHoje;
  umdtFinal.Date := DataHoje;
end;

procedure TfrmResumo.sbPropriedadesClick(Sender: TObject);
begin
   //Mostra a Janela de configuracao da impressora
   PrincipalForm.Rel.Printer.Prompt;
   PrincipalForm.Rel.Printer.SetCurrent;
end;

procedure TfrmResumo.btnImprimirClick(Sender: TObject);
Var
   filtro : string;
   sShowFiltro : String;
   sData : String;
   lstFormulas : TStringList;
   lstSQLExp : TStringList;
   wMes, wAno, wDia : Word;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
  { Imprimir o Relátório utilizando a Função PRINTRPT }

  lstFormulas := TStringList.Create;
  lstFormulas.Clear;

  // Enviar a expressão de saldos e saldos compensados
  lstSQLExp := TStringList.Create();
  lstSQLExp.Clear;

  //GET_SALDO(CAIXA,COLIGADA,DATA,NULL);
  //GET_SALDO_COMP(CAIXA,COLIGADA,DATA,NULL);

  lstSQLExp.Add('saldo=GET_SALDO(' + IntToStr(CaixaDepto) + ', ' + IntToStr(Coligada) + ', ''' + FormatDateTime( 'yyyy-mm-dd', umdtInicial.Date) + ''', NULL)');
  lstSQLExp.Add('saldo_compensado=GET_SALDO_COMP(' + IntToStr(CaixaDepto) + ', ' + IntToStr(Coligada) + ', ''' + FormatDateTime( 'yyyy-mm-dd', umdtInicial.Date) + ''', NULL)');

  
  if TipoCaixa = 3 then begin

     case cbData.ItemIndex of
       0 : begin
             sData := '{fin_controle_caixa.dt_abertura}';
             sShowFiltro := 'Abertura do caixa De: ';
           end;
       1 : begin
             sData := '{fin_mov_tesouraria.dt_movimento}';
             sShowFiltro := 'Movimentação De: ';
           end;
       2 : begin
             sData := '{fin_mov_tesouraria.dt_compensacao}';
             sShowFiltro := 'Compensação De: ';
           end;
       3 : begin
             sData := '{fin_mov_tesouraria.dt_registro}';
             sShowFiltro := 'Registro no Sistema De: ';
           end;
     end;

     sShowFiltro := sShowFiltro + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date);
     sShowFiltro := sShowFiltro + ' Até: ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date );

     lstFormulas.Add('ds_filtro="' + sShowFiltro+'"');

     DecodeDate(umdtInicial.Date, wAno, wMes, wDia);

     filtro := sData+' >= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ';

     DecodeDate(umdtFinal.Date, wAno, wMes, wDia);

     filtro := filtro +
        ' and ' + sData+' <= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ';

     filtro := filtro +
        ' and ' + '{fin_cadastro_contas.cd_caixa} = ' + IntToStr(CaixaDepto) +
        ' and {fin_cadastro_contas.cd_coligada} = ' + IntToStr(Coligada) ;

     if cbUsuarios.ItemIndex >= 1 then begin

        filtro := filtro + ' and {fin_mov_tesouraria.cd_usuario} = ' + IntToStr(aUsuarios[cbUsuarios.ItemIndex]);

     end;

     infoRelatorio := PrincipalForm.GetInfoRpt('repResumoCaixaDepto');
     sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

     PodeExportar := True;
     if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
     PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, filtro, '', lstFormulas , nil, nil, lstSQLExp,  True, False, nil, PodeExportar);
  end
  else begin

     case cbData.ItemIndex of
       0 : begin
              sData := '{fin_mov_tesouraria.dt_movimento}';
              sShowFiltro := 'Movimentação De: ';
           end;
       1 : begin
             sData := '{fin_mov_tesouraria.dt_compensacao}';
             sShowFiltro := 'Compensação De: ';
           end;
       2 : begin
             sData := '{fin_mov_tesouraria.dt_registro}';
             sShowFiltro := 'Registro no Sistema De: ';
           end;
     end;
     sShowFiltro := sShowFiltro + FormatDateTime( 'dd/mm/yyyy', umdtInicial.Date);
     sShowFiltro := sShowFiltro + ' Até: ' + FormatDateTime( 'dd/mm/yyyy', umdtFinal.Date );

     lstFormulas.Add('ds_filtro="' + sShowFiltro+'"');

     DecodeDate(umdtInicial.Date, wAno, wMes, wDia);

     filtro := sData+' >= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ';

     DecodeDate(umdtFinal.Date, wAno, wMes, wDia);

     filtro := filtro +
        ' and ' + sData+' <= ' + 'Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ') ';

     filtro := filtro +
        ' and ' + '{fin_cadastro_contas.cd_caixa} = ' + IntToStr(CaixaDepto) +
        ' and {fin_cadastro_contas.cd_coligada} = ' + IntToStr(Coligada) ;

     if cbUsuarios.ItemIndex >= 1 then begin

        filtro := filtro + ' and {fin_mov_tesouraria.cd_usuario} = ' + IntToStr(aUsuarios[cbUsuarios.ItemIndex]);

     end;

     // Passar as datas para as formulas

     //processa formulas
     DecodeDate(umdtInicial.Date, wAno, wMes, wDia);
     lstFormulas.Add('dt_inicio=Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')');
     DecodeDate(umdtFinal.Date, wAno, wMes, wDia);
     lstFormulas.Add('dt_fim=Date(' + intToStr(wano) + ', ' + intToStr(wmes) + ', ' + intToStr(wDia) + ')');

     infoRelatorio := PrincipalForm.GetInfoRpt('repResumoMvtoBanco');
     sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

     PodeExportar := True;
     if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;
      
     PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, filtro, '', lstFormulas, nil, nil, lstSQLExp, True, False, nil, PodeExportar);
  end;


end;

procedure TfrmResumo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

