unit uInscrever;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, DBTables, ComCtrls, Mask, DBCtrls,
  Buttons, CheckLst, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  uFSelecionarPessoa;

type
  Tfrm_Inscrever = class(TForm)
    srcMatricula: TDataSource;
    txtEstado: TLabel;
    ScrollBox1: TScrollBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    sbPessoa: TSpeedButton;
    DBText1: TDBText;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label17: TLabel;
    bt1: TSpeedButton;
    ck1: TCheckBox;
    Label4: TLabel;
    bt2: TSpeedButton;
    ck2: TCheckBox;
    Label9: TLabel;
    bt3: TSpeedButton;
    ck3: TCheckBox;
    Label13: TLabel;
    bt4: TSpeedButton;
    ck4: TCheckBox;
    Label6: TLabel;
    bt5: TSpeedButton;
    ck5: TCheckBox;
    Label10: TLabel;
    bt6: TSpeedButton;
    ck6: TCheckBox;
    Label14: TLabel;
    bt7: TSpeedButton;
    Label7: TLabel;
    ck7: TCheckBox;
    bt8: TSpeedButton;
    ck8: TCheckBox;
    Label11: TLabel;
    Label15: TLabel;
    ck9: TCheckBox;
    bt9: TSpeedButton;
    ck12: TCheckBox;
    Label16: TLabel;
    Label12: TLabel;
    ck11: TCheckBox;
    bt11: TSpeedButton;
    bt10: TSpeedButton;
    ck10: TCheckBox;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    pnAtividadesIsentas: TPanel;
    Panel4: TPanel;
    cklAtividades: TCheckListBox;
    Label5: TLabel;
    pnAtividadesPagas: TPanel;
    Panel6: TPanel;
    Label18: TLabel;
    cklAtividadesPagas: TCheckListBox;
    Splitter1: TSplitter;
    qyMatricula: TUMZQuery;
    qyMatriculaAtividades: TUMZQuery;
    qyMatriculanm_pessoa: TStringField;
    qyMatriculaAtividadesnr_anosemestre: TIntegerField;
    qyMatriculaAtividadescd_atividade: TIntegerField;
    qyMatriculaAtividadescd_pessoa: TIntegerField;
    qyMatriculaAtividadesnr_mes: TIntegerField;
    qyMatriculaAtividadesvl_atividade: TFloatField;
    qyMatriculaAtividadesds_observacao: TMemoField;
    qyMatriculaAtividadessn_paga: TSmallintField;
    qyMatriculaCD_PESSOA: TIntegerField;
    qyMatriculaNR_ANOSEMESTRE: TIntegerField;
    qyMatriculaNR_MES: TIntegerField;
    qyMatriculaCD_TIPO_PESSOA: TIntegerField;
    qyMatriculaVL_TOTAL: TFloatField;
    qyMatriculaVL_DESCONTOS: TFloatField;
    qyMatriculaVL_PAGO: TFloatField;
    qyMatriculaDT_EMISSAO: TDateTimeField;
    qyMatriculaDT_PAGAMENTO: TDateTimeField;
    qyMatriculaCD_TURMA_MATRICULA: TStringField;
    dsTiposPessoa: TDataSource;
    qryTiposPessoa: TUMZReadOnlyQuery;
    qryTiposPessoaCD_TIPO_PESSOA: TIntegerField;
    qryTiposPessoaDS_TIPO_PESSOA: TStringField;
    qryTiposPessoaDS_OBSERVACAO: TMemoField;
    qryTiposPessoaSN_ATIVO: TSmallintField;
    qryTiposPessoaTP_PESSOA: TStringField;
    qyMatriculaDS_TIPO_PESSOA: TStringField;
    qryValoresPessoas: TUMZReadOnlyQuery;
    qryValoresPessoasCD_ATIVIDADE: TIntegerField;
    qryValoresPessoasCD_TIPO_PESSOA: TIntegerField;
    qryValoresPessoasNR_ANOSEMESTRE: TIntegerField;
    qryAtividades: TUMZReadOnlyQuery;
    qryAtividadesCD_ATIVIDADE: TIntegerField;
    qryAtividadesNR_ANOSEMESTRE: TIntegerField;
    qryAtividadesCD_PROFESSOR: TIntegerField;
    qryAtividadesCD_TIPO_TITULO: TIntegerField;
    qryAtividadesCD_CENTRO: TLargeintField;
    qryAtividadesCD_COLIGADA: TIntegerField;
    qryAtividadesDS_ATIVIDADE: TStringField;
    qryAtividadesDS_OBSERVACAO: TMemoField;
    qryAtividadesDS_SIGLA: TStringField;
    procedure dsTiposPessoaDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure cklAtividadesPagasClick(Sender: TObject);
    procedure cklAtividadesClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPessoaClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    Procedure LimparAtividades;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure srcMatriculaStateChange(Sender: TObject);
  private
    { Private declarations }
    FSaving: Boolean;
    FOpenning: Boolean;
  public
    { Public declarations }
    iMes : Integer;

    Procedure InserirNovo;

    Procedure AjustaAtividades;

  end;

var
  frm_Inscrever: Tfrm_Inscrever;
  finalizou, primeira_matricula_feita: boolean;
  matriculas: array[0..4] of string; 

implementation

uses Main, uDM, uInscricoesPlanilha, StrUtils;

{$R *.dfm}

procedure Tfrm_Inscrever.FormPaint(Sender: TObject);
begin
//  PapelParede(Sender);
end;

procedure Tfrm_Inscrever.FormResize(Sender: TObject);
begin
     AjustaAtividades;

end;

procedure Tfrm_Inscrever.FormShow(Sender: TObject);
begin

  // Posição na tela
  AjustaAtividades;

  // Filtra a matrícula pelo código 999999 e insere novo registro
  InserirNovo;
end;

procedure Tfrm_Inscrever.InserirNovo;
begin

  qyMatricula.Close();
  qyMatricula.ParamByName('CD_PESSOA').AsInteger := 999999;
  qyMatricula.ParamByName('NR_ANOSEMESTRE').AsString :=
      frm_Inscricoes_Planilha.txtAnoSemestre.Text;
  qyMatricula.Open();

  qyMatriculaAtividades.Close();
  qyMatriculaAtividades.ParamByName('CdPessoa').AsInteger := 999999;
  qyMatriculaAtividades.ParamByName('AnoSem').AsString :=
      frm_Inscricoes_Planilha.txtAnoSemestre.Text;
  qyMatriculaAtividades.Open();

  qyMatricula.Insert;

  DBEdit1.SetFocus;

  qyMatriculanr_anosemestre.AsString :=
      frm_Inscricoes_Planilha.txtAnoSemestre.Text;

  // Seleciona o Mês atual como padrão
  case iMes of
    1 : ck1.Checked := true;
    2 : ck2.Checked := true;
    3 : ck3.Checked := true;
    4 : ck4.Checked := true;
    5 : ck5.Checked := true;
    6 : ck6.Checked := true;
    7 : ck7.Checked := true;
    8 : ck8.Checked := true;
    9 : ck9.Checked := true;
    10 : ck10.Checked := true;
    11 : ck11.Checked := true;
    12 : ck12.Checked := true;
  end;

  finalizou := False;

end;

procedure Tfrm_Inscrever.LimparAtividades;
var
  i : integer;
begin

  for i := 0 to cklAtividades.Count - 1 do begin
      cklAtividades.Checked[i] := False;
      cklAtividades.ItemEnabled[i] := False;
      cklAtividadesPagas.Checked[i] := False;
      cklAtividadesPagas.ItemEnabled[i] := False;
  end;

end;

procedure Tfrm_Inscrever.sbPessoaClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

  if resultado.filtrado then
  begin

    qyMatriculaCD_PESSOA.AsInteger := resultado.cd_pessoa;

    if resultado.aba = afpEstudante then begin

      if IntToStr(resultado.nr_anosemestre) = frm_Inscricoes_Planilha.txtAnoSemestre.Text then begin

         qyMatriculacd_turma_matricula.AsString := resultado.cd_turma;

      end;
      
    end;
    
  end;

end;

procedure Tfrm_Inscrever.TodosClick(Sender: TObject);
var
  mes: string;
  i: integer;
begin

  mes := MidStr( TCheckBox( Sender ).Name, 3, 2 );

  for i := StrToInt( mes ) to 12 do
  begin

    if TCheckBox( frm_Inscrever.FindComponent( 'ck'+IntToStr( i ) ) ).Checked then
      TCheckBox( frm_Inscrever.FindComponent( 'ck'+IntToStr( i ) ) ).Checked := False
    else
      TCheckBox( frm_Inscrever.FindComponent( 'ck'+IntToStr( i ) ) ).Checked := True;

  end;

end;

procedure Tfrm_Inscrever.AjustaAtividades;
begin
    pnAtividadesIsentas.Width := (frm_Inscrever.Width - 4) DIV 2;
end;

procedure Tfrm_Inscrever.cklAtividadesClick(Sender: TObject);
var
   i : Integer;
   iCont : Integer;
begin

   iCont := 0;

   for i := 0 to cklAtividades.Count - 1 do begin

      if cklAtividades.Checked[i] then begin
         INC(iCont);
         cklAtividadesPagas.Checked[i] := False;
      end;

   end;

   if iCont > 1  then begin
      MessageBox(Handle, PChar('Você está selecionando mais de uma atividade Isenta para este aluno.'), PChar('Atenção'), MB_ICONWARNING + MB_OK);
      exit;
   end;

end;

procedure Tfrm_Inscrever.cklAtividadesPagasClick(Sender: TObject);
var
   i : Integer;
begin

   for i := 0 to cklAtividadesPagas.Count - 1 do begin

      if cklAtividadesPagas.Checked[i] then begin
         cklAtividades.Checked[i] := False;
      end;

   end;

end;

procedure Tfrm_Inscrever.dsTiposPessoaDataChange(Sender: TObject;
  Field: TField);
var
   I: Integer;
   LEnabled: Boolean;
begin
   if not FSaving then
   begin
      cklAtividades.Items.BeginUpdate;
      cklAtividadesPagas.Items.BeginUpdate;
   
      cklAtividades.Clear;
      cklAtividadesPagas.Clear;

      qryAtividades.First;
      while not qryAtividades.Eof do
      begin
         LEnabled := (not FOpenning) and
               qryValoresPessoas.Locate('CD_ATIVIDADE;NR_ANOSEMESTRE',
                     VarArrayOf([qryAtividadesCD_ATIVIDADE.AsInteger,
                                 qryAtividadesNR_ANOSEMESTRE.AsInteger]),
                     []);

         I := cklAtividades.Items.AddObject(qryAtividadesDS_ATIVIDADE.AsString,
               qryAtividades.GetBookmark);
         cklAtividades.ItemEnabled[I] := LEnabled;
         cklAtividades.Checked[I] := False;

         I := cklAtividadesPagas.Items.AddObject(
               qryAtividadesDS_ATIVIDADE.AsString, qryAtividades.GetBookmark);
         cklAtividadesPagas.ItemEnabled[I] := LEnabled;
         cklAtividadesPagas.Checked[I] := False;

         qryAtividades.Next;
      end;

      cklAtividades.Items.EndUpdate;
      cklAtividadesPagas.Items.EndUpdate;
   end;
end;

procedure Tfrm_Inscrever.SpeedButton1Click(Sender: TObject);
begin

  finalizou := False;
  Close;

end;

procedure Tfrm_Inscrever.SpeedButton2Click(Sender: TObject);
const
   SQLMatriculas =
      'SELECT ' +
         'CD_PESSOA,' +
         'NR_ANOSEMESTRE,' +
         'NR_MES,' +
         'CD_TIPO_PESSOA,' +
         'VL_TOTAL,' +
         'VL_DESCONTOS,' +
         'VL_PAGO,' +
         'DT_EMISSAO,' +
         'DT_PAGAMENTO,' +
         'CD_TURMA_MATRICULA '+
      'FROM ' +
         'EXTRA_MATRICULAS ' +
      'WHERE ' +
         'CD_PESSOA = :CD_PESSOA AND ' +
         'NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND ' +
         'NR_MES = :NR_MES';
var
  i, mes : integer;
  iQtdAtividades : Integer;
  cValorTotal : Currency;
  cValorDesconto : Currency;
  cDescontoExtra : Currency;
  MatPessoa : Integer;
  MatTipo   : Integer;
  MatAnoSem : Integer;
begin
   FSaving := True;

  // Tem que selecionar o tipo de pessoa
  if qyMatriculacd_tipo_pessoa.AsInteger = 0 then begin

    MessageBox(Handle, PChar('Selecione o tipo de pessoa.'), PChar('Atenção'), MB_ICONWARNING + MB_OK);
    DBLookupComboBox1.SetFocus;
    Exit;
    
  end;

  MatPessoa := qyMatriculacd_pessoa.AsInteger;
  MatTipo := qyMatriculacd_tipo_pessoa.AsInteger;
  MatAnoSem := qyMatriculanr_anosemestre.AsInteger;

  //  Vai do primeiro ao último mês
  for mes := 1 to 12 do begin

      // verificar se o mês está selecionado
      if TCheckBox( frm_Inscrever.FindComponent( 'ck'+IntToStr( mes ) ) ).Checked then begin

        // Selecionar a matrícula do aluno, verificar se existe

        qyMatricula.Close;
        qyMatricula.SQL.Text := SQLMatriculas;
        qyMatricula.ParamByName('CD_PESSOA').AsInteger := MatPessoa;
        qyMatricula.ParamByName('NR_ANOSEMESTRE').AsInteger := MatAnoSem;
        qyMatricula.ParamByName('NR_MES').AsInteger := mes;

        qyMatricula.Open();

        if qyMatricula.Eof then
           qyMatricula.Insert
        else
           qyMatricula.Edit;

//        if qyMatricula.State <> dsInsert then
//           qyMatricula.Insert;
        qyMatriculaDT_EMISSAO.AsDateTime := DataHoje;

        qyMatriculaDT_EMISSAO.AsDateTime := DataHoje;

        qyMatriculaCD_PESSOA.AsInteger := MatPessoa;
        qyMatriculaNR_ANOSEMESTRE.AsInteger := MatAnoSem;
        qyMatriculaCD_TIPO_PESSOA.AsInteger := MatTipo;
        qyMatriculaVL_PAGO.AsFloat := 0;
        qyMatriculaNR_MES.AsInteger := mes;

        try
            qyMatricula.Post;
        except
            qyMatricula.Cancel;
        end;

        // Verificar Atividades Pagas e Não pagas
        for i := 0 to cklAtividades.Count - 1 do begin


          // Verifica se a atividade atual está selecionada (Pagas ou não pagas)
          if cklAtividades.Checked[i] or cklAtividadesPagas.Checked[i] then
          begin

            qryAtividades.GotoBookmark(TBookmark(cklAtividades.Items.Objects[i]));

            // Verificando o valor da atividade
            DM.qyAtividadesValores.Close;
            DM.qyAtividadesValores.ParamByName('nr_anosemestre').AsInteger := qyMatricula.FieldByName('nr_anosemestre').AsInteger;
            DM.qyAtividadesValores.ParamByName('cd_tipo_pessoa').AsInteger := qyMatricula.FieldByName('cd_tipo_pessoa').AsInteger;
            DM.qyAtividadesValores.ParamByName('cd_atividade').AsInteger := qryAtividadesCD_ATIVIDADE.AsInteger;
            DM.qyAtividadesValores.Open;

            qyMatriculaAtividades.Insert;

            qyMatriculaAtividades.FieldByName('nr_anosemestre').AsInteger := qyMatricula.FieldByName('nr_anosemestre').AsInteger;
            qyMatriculaAtividades.FieldByName('cd_pessoa').AsInteger := qyMatricula.FieldByName('cd_pessoa').AsInteger;
            qyMatriculaAtividades.FieldByName('cd_atividade').AsInteger := qryAtividadesCD_ATIVIDADE.AsInteger;
            qyMatriculaAtividades.FieldByName('nr_mes').AsInteger := mes;
            qyMatriculaAtividades.FieldByName('ds_observacao').AsString := '';

            if cklAtividadesPagas.Checked[i] then begin
               qyMatriculaAtividadessn_paga.AsInteger := 1;
               qyMatriculaAtividades.FieldByName('vl_atividade').AsCurrency := DM.qyAtividadesValores.FieldByName('vl_atividade').AsCurrency;
            end
            else begin
               qyMatriculaAtividadessn_paga.AsInteger := 0;
               qyMatriculaAtividades.FieldByName('vl_atividade').AsCurrency := 0;
            end;

            try
               qyMatriculaAtividades.Post;
            except
               qyMatriculaAtividades.Cancel;
            end;

//            qyMatricula.Insert;

          end

        end;

        // Atualizar o tipo e também os valores

        iQtdAtividades :=  Dm.BuscarNroAtividades(MatAnoSem, MatPessoa, mes );
        cValorTotal    :=  Dm.BuscarValorBruto(MatAnoSem, MatPessoa, mes, MatTipo);
        cValorDesconto :=  Dm.BuscarValorDesconto(MatAnoSem, iQtdAtividades, MatTipo, cValorTotal );
        cDescontoExtra :=  Dm.BuscarDescontoExtra(MatAnoSem, iQtdAtividades, MatTipo);

        cValorTotal := cValorTotal - cDescontoExtra;

        if cValorTotal = cVAlorDesconto then begin
           cValorTotal := 0;
           cValorDesconto := 0;
        end;

        // Atualizar o valor para o Mes atual

        with DM.qyAux2 do begin

           Close;
           SQL.Clear;
           SQL.Add(
            ' UPDATE extra_matriculas                          ' +
            ' SET cd_tipo_pessoa = :CdTipo, vl_total = :VlTotal, vl_descontos = :VlDesconto ' +
            ' WHERE cd_pessoa = :CdPessoa AND nr_anosemestre = :NrAnoSemestre AND nr_mes = :NrMes '
           );

           ParambyName('CdPessoa').AsInteger := MatPessoa;
           ParambyName('CdTipo').AsInteger := MatTipo;
           ParamByName('NrAnoSemestre').AsInteger := MatAnoSem;
           ParamByName('NrMes').AsInteger :=  mes;
           ParamByName('VlTotal').AsFloat := cValorTotal;
           ParamByName('VlDesconto').AsFloat := cValorDesconto;
           ExecSQL;

        end;

      end; { / Verifica se o mês atual está selecionado (01.01) }

  end; { / Vai do primeiro ao último mês (01) }

  LimparAtividades;

  InserirNovo;

  FSaving := False;

end; { FormCloseQuery }

procedure Tfrm_Inscrever.srcMatriculaStateChange(Sender: TObject);
begin

  if qyMatricula.State in [dsInsert] then
    txtEstado.Caption := 'Inserindo'
  else if qyMatricula.State in [dsEdit] then
    txtEstado.Caption := 'Editando'
  else if qyMatricula.State = dsOpening then
    txtEstado.Caption := 'Aberto'
  else if qyMatricula.State in [dsInactive] then
    txtEstado.Caption := 'Inativo';

end;

procedure Tfrm_Inscrever.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qyMatricula.Cancel;
  Action := caFree;
end;

procedure Tfrm_Inscrever.FormCreate(Sender: TObject);
begin
   FSaving := False;
   FOpenning := True;
   qryAtividades.ParamByName('NR_ANOSEMESTRE').AsString :=
         frm_Inscricoes_Planilha.txtAnoSemestre.Text;
   qryAtividades.Open;
   qryValoresPessoas.Open;
   qryTiposPessoa.Open;
   FOpenning := False;
end;

end.
