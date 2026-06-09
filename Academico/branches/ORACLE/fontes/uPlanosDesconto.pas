unit uPlanosDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  checklst, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, ComCtrls;

type
  TfrmPlanosDesconto = class(TForm)
    Panel3: TPanel;
    dtcPlanosDesconto: TDataSource;
    lst: TCheckListBox;
    tblPlanos: TUMZQuery;
    tblPlanosCodigo: TIntegerField;
    tblPlanosDescricaoPlano: TStringField;
    tblPlanosPercentualDesconto: TFloatField;
    tblPlanosValorDesconto: TFloatField;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    pmQtd: TPopupMenu;
    btnAplicar: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAplicarEmDia: TSpeedButton;
    btnSair: TSpeedButton;
    ckManterDesconto: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grd: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbPlano: TLabel;
    lbDescricao: TLabel;
    lbValidade: TLabel;
    lbParcInicio: TLabel;
    lbParcFim: TLabel;
    lbPercentual: TLabel;
    tblPlanoscd_acao_movimento: TLargeintField;
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure ckManterDescontoClick(Sender: TObject);
    procedure dtcPlanosDescontoDataChange(Sender: TObject; Field: TField);
    procedure btnSairClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure tblPlanosNewRecord(DataSet: TDataSet);
    procedure CalcularMatricular( n : Integer );
    procedure AplicarDescontoMatricular( opc : Integer );
    procedure lstClickCheck(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure btnAplicarEmDiaClick(Sender: TObject);
  private
    { Private declarations }
    Percentual : Currency;
  public
    { Public declarations }
  end;

var
  frmPlanosDesconto: TfrmPlanosDesconto;

implementation

uses uMatricular, uDM, uUsuario;

{$R *.DFM}

procedure TfrmPlanosDesconto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanosDesconto.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TfrmPlanosDesconto.FormShow(Sender: TObject);
Var
  i : smallInt;

begin

  PageControl1.ActivePageIndex := 0;

  Screen.Cursor := crHourGlass;

  if not tblPlanos.Active then tblPlanos.Open;

  lst.Items := frmMatricular.lst.Items;

  { Verificar se tem Plano de Desconto Programado para o Aluno }

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger :=  frmMatricular.tblMatriculasAnoSemestre.AsInteger;
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := frmMatricular.tblTurmasCodigo.AsString;
  DM.tblDeptoCursoTurma.Open;

  DM.qAux2.Close;
  DM.qAux2.SQL.Clear;
  DM.qAux2.SQL.Text :=
         ' SELECT pd.*, p.nm_pessoa, d.*, de.descricao From pessoas_descontos pd ' +
         ' INNER JOIN pessoas p ON (pd.cd_pessoa = p.cd_pessoa) ' +
         ' INNER JOIN planosdesconto d ON (pd.cd_desconto = d.codigo) ' +
         ' INNER JOIN departamentos de ON (pd.cd_depto = de.codigo) ' +
         ' WHERE pd.cd_pessoa = :cd_pessoa AND pd.cd_depto = :cd_depto '+
         ' AND dt_inicio <= :data1 AND dt_fim >= :data2 ' +
         ' AND pd.cd_pessoa_indicada = 0  ';

  DM.qAux2.ParamByName('cd_pessoa').AsInteger := frmMatricular.tblMatriculasCodigoAluno.AsInteger;
  DM.qAux2.ParamByName('cd_depto').AsInteger := DM.tblDeptoCursoTurmaDepto.AsInteger;
  DM.qAux2.ParamByName('data1').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual);
  DM.qAux2.ParamByName('data2').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual);

  DM.qAux2.Open;

  if not Dm.qAux2.IsEmpty then begin
     tblPlanos.Locate('Codigo',Dm.qAux2.FieldByName('codigo').AsString, []);

     { Aplicar Plano Programado }

     Percentual := DM.qAux2.FieldByName('vl_percentual').AsCurrency;

	   For i:= 0 to lst.Items.Count - 1 do begin
	       if (StrToInt(Copy(lst.items[i],9, 2)) >=  Dm.qAux2.FieldByName('nr_parc_inicio').AsInteger) AND
            (StrToInt(Copy(lst.items[i],9, 2)) <=  Dm.qAux2.FieldByName('nr_parc_fim').AsInteger)
         then begin
			          lst.Checked[i] := True;
			          CalcularMatricular( i);
	       end;
	   end;
      frmMatricular.ObsPlanoDesconto := DM.qAux2.FieldByName('ds_historico').AsString;
     lbPlano.Caption := DM.qAux2.FieldByName('descricao').AsString;
     lbDescricao.Caption := DM.qAux2.FieldByName('ds_historico').AsString;
     lbValidade.Caption := FormatDateTime('dd/mm/yyyy',DM.qAux2.FieldByName('dt_fim').AsDateTime);
     lbParcInicio.Caption := DM.qAux2.FieldByName('nr_parc_inicio').AsString;
     lbParcFim.Caption := DM.qAux2.FieldByName('nr_parc_fim').AsString;
     lbPercentual.Caption := FloatToStrF(DM.qAux2.FieldByName('vl_percentual').AsCurrency, ffNumber, 7, 2) + ' %';

     PageControl1.Pages[1].Visible := True;
     PageControl1.ActivePageIndex := 1;

  end else begin

     Percentual := 0;
     lbPlano.Caption := 'Nenhum Plano / Convênio programado';
     lbDescricao.Caption := '';
     lbValidade.Caption := '';
     lbParcInicio.Caption := '';
     lbParcFim.Caption := '';
     lbPercentual.Caption := '';

  end;

  btnAplicar.Enabled := True;
  btnSelecionar.Enabled := True;
  lst.Enabled := True;

  Screen.Cursor := crDefault;

end;

procedure TfrmPlanosDesconto.tblPlanosNewRecord(DataSet: TDataSet);
begin

  DM.qAux2.Close;
  DM.qAux2.SQL.Clear;
  
  Dm.qAux2.SQL.Add( 'select Max(Codigo) from PlanosDesconto' );
  Dm.qAux2.Open;
  tblPlanosCodigo.AsInteger := Dm.qAux2.Fields[0].AsInteger + 1;

end;

procedure TfrmPlanosDesconto.CalcularMatricular( n : Integer);
var
  dblAux, dblValor : Double;
begin

  dblValor := frmMatricular.ArrayValores[n];

  if lst.Checked[ n ] then begin

     if ( Percentual > 0 ) and  ( PageControl1.TabIndex = 1 ) then begin

        dblAux := RoundFloat( ( dblValor - ( dblValor * Percentual ) / 100 ), 2 );

     end else begin

         if tblPlanosPercentualDesconto.Value = 0 then begin
            // Desconto Em Valor

            dblAux := dblValor - tblPlanosValorDesconto.Value;

         end
         else begin
            // Desconto em %

            dblAux := RoundFloat( ( dblValor - ( dblValor * tblPlanosPercentualDesconto.Value ) / 100 ), 2 );

         end;

     end;

     dblAux := dblAux + frmMatricular.ArrayValorExtra[n];
     
  end
  else begin

     dblAux := dblValor + frmMatricular.ArrayValorExtra[n];

  end;

  if ckManterDesconto.Checked then begin
    dblAux := dblAux -  frmMatricular.ArrayDescontosExtraPlano[n];

    dblAux := dblAux - (( frmMatricular.ArrayDescontosPlano[n] / dblValor ) * dblAux);
  end;

  lst.Items.Strings[n] := 'PARCELA ' + Format( '%.2d', [frmMatricular.ArrayParcelas[n]] ) + ' - ' +
    FormatDateTime( 'dd/mm/yyyy', frmMatricular.ArrayDatas[n] ) + ' - ' + Format( '%8.2n', [dblAux] );

end;

procedure TfrmPlanosDesconto.lstClickCheck(Sender: TObject);
var
  flgAux : Boolean;
begin
  if lst.Checked[lst.ItemIndex] then
    flgAux := True
  else
    flgAux := False;

  CalcularMatricular( lst.ItemIndex );

  lst.Checked[lst.ItemIndex] := flgAux;
end;

procedure TfrmPlanosDesconto.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   if not DM.UsuarioLogado.TemPermissao(2020, npAcesso, false) then
      AllowChange := False
   else
      AllowChange := True;   
end;

procedure TfrmPlanosDesconto.btnSelecionarClick(Sender: TObject);
var
  n : Integer;
begin
  for n := 0 to lst.Items.Count - 1 do
  begin
    lst.ItemIndex := n;
    lst.Checked[n] := True;
    CalcularMatricular( n );
    lst.Checked[n] := True;
  end;
end;

procedure TfrmPlanosDesconto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6 : btnAplicarEmDiaClick( nil );
    VK_F7 : btnAplicarClick( nil );
    VK_F8 : btnSelecionarClick( nil );
    VK_F12 : if btnSair.Enabled then btnSairClick( nil );
  end;
end;

procedure TfrmPlanosDesconto.btnAplicarClick(Sender: TObject);
begin

  frmMatricular.iAcaoDesconto := tblPlanoscd_acao_movimento.AsInteger;

  AplicarDescontoMatricular(2);
  
end;

procedure TfrmPlanosDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPlanosDesconto.AplicarDescontoMatricular( opc : Integer );
var
  n : Integer;
  dblAux, dblValor : Double;
begin

  if Mensagem( 'Deseja aplicar o desconto selecionado ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin

    frmMatricular.lst.Items := lst.Items;
    frmMatricular.lngPlano := tblPlanosCodigo.AsInteger;
//    frmMatricular.lngPlanoOpc := opc;

    For n := 0 to lst.Count -1 do begin

       if lst.Checked[n] then begin

          dblValor := frmMatricular.ArrayValores[n];

          if (PageControl1.ActivePageIndex = 1) AND (Percentual > 0)  then begin

             dblAux := RoundFloat( ( ( dblValor * Percentual ) / 100 ), 2 );
          
          end else begin

             if tblPlanosPercentualDesconto.Value = 0 then begin
                // Desconto Em Valor

                dblAux :=  tblPlanosValorDesconto.Value;

             end
             else begin
                // Desconto em %

                dblAux := RoundFloat( ( ( dblValor * tblPlanosPercentualDesconto.Value ) / 100 ), 2 );

             end;
          
          end;

          if ckManterDesconto.Checked then begin
             if opc = 1 then begin // Valor Desconto
                //frmMatricular.ArrayDescontos[n] := dblAux + frmMatricular.ArrayDescontosPlano[n];
                frmMatricular.ArrayDescontos[n] := dblAux + (( frmMatricular.ArrayDescontosPlano[n] / dblValor ) * (dblValor - dblAux));
                frmMatricular.ArrayDescontosExtra[n] := frmMatricular.ArrayDescontosExtraPlano[n];
             end
             else begin
               frmMatricular.ArrayDescontosExtra[n] := dblAux + frmMatricular.ArrayDescontosExtraPlano[n];
               frmMatricular.ArrayDescontos[n] := RoundFloat((frmMatricular.ArrayDescontosPlano[n] / dblValor) * (dblValor - frmMatricular.ArrayDescontosExtra[n]) , 2) ;
             end;
          end
          else begin
             if opc = 1 then begin // Valor Desconto
                frmMatricular.ArrayDescontos[n] := dblAux;
                frmMatricular.ArrayDescontosExtra[n] := 0;
             end
             else begin
               frmMatricular.ArrayDescontosExtra[n] := dblAux;
               frmMatricular.ArrayDescontos[n] := 0;
             end;

          end;


       end;

    end;

    Close();

  end
  else begin

    // Cancelou a mensagem, manter o calculo do plano de pagamento
    
    frmMatricular.lngPlano := 0;
    frmMatricular.CalcularVencimento();
    Close();
    
  end;
end;


procedure TfrmPlanosDesconto.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmPlanosDesconto.pmQtdPopup(Sender: TObject);
begin

  DM.quantidade_registros(tblPlanos, pmQtd);

end;

procedure TfrmPlanosDesconto.btnAplicarEmDiaClick(Sender: TObject);
begin

  AplicarDescontoMatricular(1);
  
end;

procedure TfrmPlanosDesconto.dtcPlanosDescontoDataChange(Sender: TObject; Field: TField);
var i : integer;
begin

  For i:=0 To lst.Count - 1 do begin

     if lst.Checked[i] then begin

        CalcularMatricular(i);

     end;

  end;

end;

procedure TfrmPlanosDesconto.ckManterDescontoClick(Sender: TObject);
var i : integer;
begin

  For i:=0 To lst.Count - 1 do begin

     if lst.Checked[i] then begin

        CalcularMatricular(i);

     end;

  end;

end;

end.

