unit uCursosCoordenadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Buttons, uItemCombo,
  UMLookupComboBox;

type
  Tfrm_CursosCoordenadores = class(TForm)
    Bevel7: TBevel;
    Panel3: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyCursos: TUMZQuery;
    Bevel2: TBevel;
    Panel5: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    qyCursoscodigo: TStringField;
    qyCursosapelido: TStringField;
    srcCursos: TDataSource;
    dbgCursos: TDBGrid;
    grdCoordenadores: TDBGrid;
    srcCoordenadores: TDataSource;
    qyCoordenadores: TUMZQuery;
    qyCoordenadorescd_coordenador: TIntegerField;
    qyCoordenadorescd_pessoa: TIntegerField;
    qyCoordenadorescd_curso: TStringField;
    qyCoordenadorescd_tipo: TIntegerField;
    qyCoordenadoresnm_pessoa: TStringField;
    tbIncluir: TToolButton;
    tbAlterar: TToolButton;
    tbExcluir: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    tbSalvar: TToolButton;
    tbCancelar: TToolButton;
    qyCoordenadoresnr_permissao: TSmallintField;
    qyCoordenadoresds_tipo: TStringField;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    btnCodigoAluno: TSpeedButton;
    pnDadosCurso: TPanel;
    pnCursosTit: TPanel;
    lbCodigoCurso: TLabel;
    lbDescricaoCurso: TLabel;
    bvSep1: TBevel;
    dbtCodCurso: TDBText;
    dbtDescCurso: TDBText;
    spSep1: TSplitter;
    qyCoordenadoresCD_COLIGADA: TIntegerField;
    qyCursoscd_coligada: TIntegerField;
    btnMostraCursosAtivos: TButton;
    qyCursosnm_coligada: TStringField;
    qyUnidades: TUMZQuery;
    qyDepartamentos: TUMZQuery;
    Label5: TLabel;
    qyCursosFiltro: TUMZQuery;
    dsUnidades: TDataSource;
    dsDepartamentos: TDataSource;
    dsCursosFiltro: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    qyCursosFiltroDS_CURSO: TStringField;
    qyCursosFiltroCD_CURSO: TStringField;
    qyUnidadesnm_coligada: TStringField;
    qyUnidadescd_coligada: TIntegerField;
    cbUnidade: TComboBox;
    cbDepto: TComboBox;
    cbCurso: TComboBox;
    qyDepartamentoscodigo: TSmallintField;
    qyDepartamentosdescricao: TStringField;
    procedure cbCursoChange(Sender: TObject);
    procedure cbDeptoChange(Sender: TObject);
    procedure cbUnidadeChange(Sender: TObject);
    procedure btnMostraCursosAtivosClick(Sender: TObject);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure qyCoordenadoresCalcFields(DataSet: TDataSet);
    procedure qyCoordenadoresBeforeEdit(DataSet: TDataSet);
    procedure qyCoordenadoresAfterPost(DataSet: TDataSet);
    procedure srcCursosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure qyCoordenadoresNewRecord(DataSet: TDataSet);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbAlterarClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure srcCoordenadoresStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure mostraCursosAtivos(apenasFiltra: boolean);
    procedure filtraDepartamentos();
    procedure filtraCursos();
  public
    { Public declarations }
  end;
const
   TEXTO_BOTAO_TODAS = 'Mostrar todos os cursos';
   TEXTO_BOTAO_ATIVAS = 'Mostrar os cursos ativos';
var
  frm_CursosCoordenadores: Tfrm_CursosCoordenadores;
  Coluna, Linha: integer;
  cd_item: array[1..50] of integer;
  cd_horario: array[1..50] of integer;
  cd_disciplina: array[1..50] of integer;
  ds_disciplina: array[1..50] of string;
  professor: array[1..50] of integer;
  cd_coorde : integer;

implementation

uses Main, uDM, uFSelecionarTurma, StrUtils, uFSelecionarPessoa, uUsuario;

{$R *.dfm}

procedure Tfrm_CursosCoordenadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CursosCoordenadores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if tbIncluir.Enabled  then tbIncluirClick( nil );
    VK_F3 : if tbAlterar.Enabled  then tbAlterarClick( nil );
    VK_F9 : if tbExcluir.Enabled  then tbExcluirClick( nil );
    VK_F5 : if tbSalvar.Enabled   then tbSalvarClick( nil );
    VK_F6 : if tbCancelar.Enabled then tbCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure Tfrm_CursosCoordenadores.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CursosCoordenadores.cbCursoChange(Sender: TObject);
begin
   mostraCursosAtivos(true);
end;

procedure Tfrm_CursosCoordenadores.cbDeptoChange(Sender: TObject);
begin
   filtraCursos;
   mostraCursosAtivos(true);
end;

procedure Tfrm_CursosCoordenadores.cbUnidadeChange(Sender: TObject);
var
   itemCombo: TItemCombo;
begin
   if TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo <> '0' then
   begin
      filtraDepartamentos;
      filtraCursos;
      mostraCursosAtivos(true);
   end
   else
   begin
      cbDepto.Clear;
      cbCurso.Clear;

      itemCombo := TItemCombo.Create('0', 'Selecione');

      cbDepto.AddItem(itemCombo.descricao, itemCombo);
      cbDepto.ItemIndex := 0;
      
      cbCurso.AddItem(itemCombo.descricao, itemCombo);
      cbCurso.ItemIndex := 0;

      mostraCursosAtivos(true);   
   end;
end;

procedure Tfrm_CursosCoordenadores.filtraCursos;
var
   itemCombo: TItemCombo;
begin
   qyCursosFiltro.Close;

   qyCursosFiltro.SQL.Text := 'SELECT '+
   '   cm.DS_CURSO, '+
	'   cm.CD_CURSO '+
   'FROM '+
   '   cursos_mestre AS cm '+
   'INNER JOIN cursos_coligadas AS cc ON(cc.CD_CURSO = cm.CD_CURSO) '+
   'WHERE 1=1 ';
   if StrToInt(TItemCombo(cbDepto.Items.Objects[cbDepto.ItemIndex]).getCodigo) <> 0 then
      qyCursosFiltro.SQL.add('AND cc.CD_DEPTO = :codigo ');
      
   if StrToInt(TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo) <> 0 then
      qyCursosFiltro.SQL.Add('AND cc.cd_coligada = :cd_coligada ');

   if btnMostraCursosAtivos.Caption = TEXTO_BOTAO_TODAS then
      qyCursosFiltro.SQL.Add('AND cm.SN_ATIVO = ''S'' ');

   qyCursosFiltro.SQL.Add(' ORDER BY cm.DS_CURSO');

   if StrToInt(TItemCombo(cbDepto.Items.Objects[cbDepto.ItemIndex]).getCodigo) <> 0 then
      qyCursosFiltro.ParamByName('codigo').AsInteger := StrToInt(TItemCombo(cbDepto.Items.Objects[cbDepto.ItemIndex]).getCodigo);

   if StrToInt(TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo) <> 0 then   
      qyCursosFiltro.ParamByName('cd_coligada').AsInteger := StrToInt(TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo);
   
   qyCursosFiltro.Open;                                                                                       

   cbCurso.Clear;

   itemCombo := TItemCombo.Create('0', 'Selecione');

   cbCurso.AddItem(itemCombo.getDescricao, itemCombo);
   
   while not qyCursosFiltro.Eof do
   begin
      itemCombo := TItemCombo.Create(qyCursosFiltroCD_CURSO.AsString, qyCursosFiltroDS_CURSO.AsString);
      cbCurso.AddItem(itemCombo.getDescricao, itemCombo);
      qyCursosFiltro.Next;
   end;

   cbCurso.ItemIndex := 0;
end;

procedure Tfrm_CursosCoordenadores.filtraDepartamentos;
var
   itemCombo: TItemCombo;
begin
   qyDepartamentos.Close;
   qyDepartamentos.ParamByName('cd_coligada').AsInteger := StrToInt(TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo);
   qyDepartamentos.Open;

   cbDepto.Clear;
   cbCurso.Clear;

   itemCombo := TItemCombo.Create('0', 'Selecione');

   cbDepto.AddItem(itemCombo.getDescricao, itemCombo);

   while not qyDepartamentos.Eof do
   begin
      itemCombo := TItemCombo.Create(IntToStr(qyDepartamentoscodigo.AsInteger), qyDepartamentosdescricao.AsString);
      cbDepto.AddItem(itemCombo.getDescricao, itemCombo);
      qyDepartamentos.Next;
   end;

   cbDepto.ItemIndex := 0;
end;

procedure Tfrm_CursosCoordenadores.btnMostraCursosAtivosClick(Sender: TObject);
begin
   mostraCursosAtivos(false);
end;

procedure Tfrm_CursosCoordenadores.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_CursosCoordenadores.srcCoordenadoresStateChange(Sender: TObject);
var
  bEditando : boolean;
begin

   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
   bEditando := ( qyCoordenadores.State in [dsEdit, dsInsert] );

   tbIncluir.Enabled  := not bEditando;
   tbAlterar.Enabled  := not bEditando;
   tbExcluir.Enabled  := not bEditando;
   btnFechar.Enabled  := not bEditando;

   tbSalvar.Enabled   := bEditando;
   tbCancelar.Enabled := bEditando;
end;

procedure Tfrm_CursosCoordenadores.tbIncluirClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1116, npIncluir, true) then
   begin
      grdCoordenadores.SetFocus();
      qyCoordenadores.Insert();
   end;
end;

procedure Tfrm_CursosCoordenadores.tbAlterarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1116, npAlterar, true) then
   begin
      grdCoordenadores.SetFocus();
      qyCoordenadores.Edit();
   end;
end;

procedure Tfrm_CursosCoordenadores.tbSalvarClick(Sender: TObject);
var
   iCodPessoa, iColigada: integer;
begin

   if not (qyCoordenadores.State in [dsInsert, dsEdit]) then
   begin
      Exit;
   end;

   //Caso não tenha uma pessoa selecionada, exibe um erro e aborta.
   if not( qyCoordenadorescd_pessoa.AsInteger > 0) then
   begin
      Mensagem('Por favor selecione uma pessoa antes de salvar!',  'Alerta', MB_ICONEXCLAMATION );
      Exit;
   end;

  // Armazena os dados a serem alterados antes de dar o post e atualizar a query
  iCodPessoa := qyCoordenadorescd_pessoa.AsInteger;
  iColigada := qyCoordenadoresCD_COLIGADA.AsInteger;

  qyCoordenadores.Post();
  
  // Chama a função que atualiza os grupos das pessoas
  DM.atualizarGruposPessoa(iCodPessoa, iColigada);
end;

procedure Tfrm_CursosCoordenadores.tbCancelarClick(Sender: TObject);
begin
  qyCoordenadores.Cancel();
end;

procedure Tfrm_CursosCoordenadores.tbExcluirClick(Sender: TObject);
var
   iCodPessoa, iColigada: integer;
begin
  // Armazena os dados a serem alterados antes de dar o post e atualizar a query
  iCodPessoa := qyCoordenadorescd_pessoa.AsInteger;
  iColigada := qyCoordenadoresCD_COLIGADA.AsInteger;
  
   if DM.UsuarioLogado.TemPermissao(1116, npExcluir, true) then
      if Mensagem('Tem certeza que deseja excluir o coordenador selecionado ?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) = mrYes Then begin
         qyCoordenadores.Delete;
      end;

  // Chama a função que atualiza os grupos das pessoas
  DM.atualizarGruposPessoa(iCodPessoa, iColigada);  
end;

procedure Tfrm_CursosCoordenadores.qyCoordenadoresNewRecord(DataSet: TDataSet);
begin
   DataSet.FieldByName('cd_curso').AsString := qyCursos.FieldByName('codigo').AsString;
   DataSet.FieldByName('cd_coligada').AsInteger := qyCursoscd_coligada.AsInteger;
end;

procedure Tfrm_CursosCoordenadores.FormShow(Sender: TObject);
var
   SQL_CURSOS_ATIVO: String;
   i: integer;
   itemCombo: TItemCombo;
begin
   cbUnidade.Perform(CB_SETDROPPEDWIDTH, 400, 0);
   cbDepto.Perform(CB_SETDROPPEDWIDTH, 400, 0);
   cbCurso.Perform(CB_SETDROPPEDWIDTH, 400, 0);

   qyCursos.SQLList.Values[qyCursos.Connection.Protocol] := Format(qyCursos.SQLList.Values[qyCursos.Connection.Protocol], [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);
   qyCursos.Open;

   itemCombo := TItemCombo.Create('0', 'Selecione');

   cbUnidade.AddItem(itemCombo.getDescricao, itemCombo);
   cbDepto.AddItem(itemCombo.getDescricao, itemCombo);
   cbCurso.AddItem(itemCombo.getDescricao, itemCombo);


   for I := 0 to DM.ArrayColigadasUsuario.Count - 1 do
   begin
      cbUnidade.AddItem( TItemCombo(DM.ArrayColigadasUsuario.Objects[I]).getDescricao(), TItemCombo(DM.ArrayColigadasUsuario.Objects[I]) );
   end;

   cbUnidade.ItemIndex := 0;
   cbDepto.ItemIndex := 0;
   cbCurso.ItemIndex := 0;

   qyUnidades.ParamByName('cd_pessoa').AsInteger := DM.iCdPessoaLogado;
   qyUnidades.SQL.Text := Format(qyUnidades.SQL.Text, [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);
   qyUnidades.Open;
end;

procedure Tfrm_CursosCoordenadores.mostraCursosAtivos(apenasFiltra: boolean);
var
   SQL_CURSOS_ATIVO : string;
   SQL_CURSOS : string;
   condUnidade, condDepto, condCurso, Coligadas: string;
begin

   condUnidade := ' ';
   condDepto := ' ';
   condCurso := ' ';
   Coligadas := ' AND CC.CD_COLIGADA IN (%s) ';

   Coligadas := Format(Coligadas, [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada]);

   qyCursos.Close();

   if TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo <> '0' then
      condUnidade := ' AND cc.cd_coligada = '+TItemCombo(cbUnidade.Items.Objects[cbUnidade.ItemIndex]).getCodigo;

   if TItemCombo(cbDepto.Items.Objects[cbDepto.ItemIndex]).getCodigo <> '0' then
      condDepto := ' AND d.codigo = '+TItemCombo(cbDepto.Items.Objects[cbDepto.ItemIndex]).getCodigo;

   if TItemCombo(cbCurso.Items.Objects[cbCurso.ItemIndex]).getCodigo <> '0' then
      condCurso := ' AND cm.CD_CURSO = '+QuotedStr(TItemCombo(cbCurso.Items.Objects[cbCurso.ItemIndex]).getCodigo);    

   
   SQL_CURSOS_ATIVO := ' SELECT cm.CD_CURSO AS codigo, cm.DS_APELIDO AS apelido, '+
                '        cc.CD_COLIGADA AS cd_coligada, FIRST_OCCURRENCE(c.nm_coligada) as nm_coligada ' +
                ' FROM cursos_mestre cm ' +
                '      INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = cm.CD_CURSO AND cc.SN_ATIVO = 1) ' +
                '      INNER JOIN coligadas c on(c.cd_coligada = cc.cd_coligada)                         '+
                '      INNER JOIN departamentos AS d ON(d.codigo = cc.CD_DEPTO)                   '+
                ' WHERE ' +
                '       cm.SN_ATIVO = ''S'' '+Coligadas+condUnidade+condDepto+condCurso+
                ' GROUP BY cm.CD_CURSO, cm.DS_APELIDO, cc.CD_COLIGADA '+
                ' ORDER BY cm.cd_curso                                 ';
                
   SQL_CURSOS := ' SELECT cm.CD_CURSO AS codigo, cm.DS_APELIDO AS apelido, '+
                '        cc.CD_COLIGADA AS cd_coligada,  FIRST_OCCURRENCE(c.nm_coligada) as nm_coligada  ' +
                ' FROM cursos_mestre cm ' +
                '      INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = cm.CD_CURSO AND cc.SN_ATIVO = 1) ' +
                '      INNER JOIN coligadas c on(c.cd_coligada = cc.cd_coligada)                         '+
                '      INNER JOIN departamentos AS d ON(d.codigo = cc.CD_DEPTO)                   '+
                ' WHERE 1=1 '+Coligadas+condUnidade+condDepto+condCurso+
                ' GROUP BY cm.CD_CURSO, cm.DS_APELIDO, cc.CD_COLIGADA '+
                ' ORDER BY cm.cd_curso                                 ';

   if apenasFiltra then
      if btnMostraCursosAtivos.Caption = TEXTO_BOTAO_TODAS then
      begin
         qyCursos.SQLList.Values[qyCursos.Connection.Protocol] := SQL_CURSOS_ATIVO;
         qyCursos.Open();
         exit;
      end
      else
      begin
         qyCursos.SQLList.Values[qyCursos.Connection.Protocol] := SQL_CURSOS;
         qyCursos.Open();
         exit;
      end;

   if (btnMostraCursosAtivos.Caption = TEXTO_BOTAO_TODAS) then
   begin
      qyCursos.SQLList.Values[qyCursos.Connection.Protocol] := SQL_CURSOS;
      btnMostraCursosAtivos.Caption := TEXTO_BOTAO_ATIVAS;
   end else begin
      qyCursos.SQLList.Values[qyCursos.Connection.Protocol] := SQL_CURSOS_ATIVO;
      btnMostraCursosAtivos.Caption := TEXTO_BOTAO_TODAS;
   end;
   qyCursos.Open();
end;

procedure Tfrm_CursosCoordenadores.srcCursosDataChange(Sender: TObject;
  Field: TField);
begin
   qyCoordenadores.Close;
   qyCoordenadores.ParamByName('codigo').AsString := qyCursoscodigo.AsString;
   qyCoordenadores.ParamByName('cd_coligada').AsInteger :=  qyCursoscd_coligada.AsInteger;
   qyCoordenadores.Open;
end;

procedure Tfrm_CursosCoordenadores.qyCoordenadoresAfterPost(DataSet: TDataSet);
begin
  DataSet.Close;
  DataSet.Open;
end;

procedure Tfrm_CursosCoordenadores.qyCoordenadoresBeforeEdit(DataSet: TDataSet);
begin
  cd_coorde := qyCoordenadores.FieldByName('cd_pessoa').AsInteger;
end;

procedure Tfrm_CursosCoordenadores.qyCoordenadoresCalcFields(DataSet: TDataSet);
begin
   if ( DataSet.FieldByName('cd_tipo').AsInteger = 1 ) then begin
      DataSet.FieldByName('ds_tipo').AsString := 'Coordenador';
   end
   else if ( DataSet.FieldByName('cd_tipo').AsInteger = 2 ) then begin
      DataSet.FieldByName('ds_tipo').AsString := 'Auxiliar';
   end
   else if ( DataSet.FieldByName('cd_tipo').AsInteger = 3 ) then begin
      DataSet.FieldByName('ds_tipo').AsString := 'Direção';
   end
   else begin
      DataSet.FieldByName('ds_tipo').AsString := ' - ';
   end;
end;

procedure Tfrm_CursosCoordenadores.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Pessoa }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa, qyCoordenadores.FieldByName('cd_pessoa').AsInteger);

   if resultado_filtro.filtrado then
   begin
      if NOT (qyCoordenadores.State in [dsInsert, dsEdit]) then
      begin
         qyCoordenadores.Insert();
      end;

      qyCoordenadores.FieldByName('cd_pessoa').AsInteger := resultado_filtro.cd_pessoa;
   end;

end;

end.

