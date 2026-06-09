unit uAgrupamentoDisciplinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, uDM, DB, DBTables, DBCtrls,
  ToolWin, Grids, DBGrids, dblookup, Buttons, ImgList, General, 
  ZAbstractRODataset, ZAbstractDataset, UZDataset, UMComboBox;


type
  TfrmAgrupamentoDisciplinas = class(TForm)
    pnlTitulo: TPanel;
    bvlSep1: TBevel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    btIncluir_Pessoa: TToolButton;
    btAlterar_Pessoa: TToolButton;
    btExcluir_Pessoa: TToolButton;
    ToolButton4: TToolButton;
    btSalvar_Pessoa: TToolButton;
    btCancelar_Pessoa: TToolButton;
    ToolButton8: TToolButton;
    btFechar_Pessoa: TToolButton;
    ToolButton2: TToolButton;
    dsDispDisciplinaAgrupamento: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    lblAnoSemestre: TLabel;
    meAnoSemestre: TMaskEdit;
    upAnoSemestre: TUpDown;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dsDisciplinaPai: TDataSource;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    btnDell: TBitBtn;
    btnAdd: TBitBtn;
    dsDispDisciplinasAgrupadas: TDataSource;
    ImageList1: TImageList;
    dsDispDisciplinasAgrupadasCompletar: TDataSource;
    qryDisciplinaPaiU: TUMZQuery;
    qryDispDisciplinasAgrupadasU: TUMZQuery;
    qryDispDisciplinasAgrupadasCompletarU: TUMZQuery;
    qryDispDisciplinaAgrupamentoU: TUMZQuery;
    qryApagaDispDisciplinasAgrupadasU: TUMZQuery;
    qryDispDisciplinasAgrupadasUcd_agrupamento: TIntegerField;
    qryDispDisciplinasAgrupadasUcd_disciplina: TIntegerField;
    qryDispDisciplinasAgrupadasUcd_turma: TStringField;
    qryDispDisciplinasAgrupadasCompletarUcd_agrupamento: TIntegerField;
    qryDispDisciplinasAgrupadasCompletarUcd_disciplina: TIntegerField;
    qryDispDisciplinasAgrupadasCompletarUcd_turma: TStringField;
    qryDispDisciplinasAgrupadasCompletarUdescricao: TStringField;
    qryDispDisciplinaAgrupamentoUcd_agrupamento: TLargeintField;
    qryDispDisciplinaAgrupamentoUnm_agrupamento: TStringField;
    qryDispDisciplinaAgrupamentoUnr_anosemestre: TIntegerField;
    qryDispDisciplinaAgrupamentoUcd_curso: TStringField;
    qryDispDisciplinaAgrupamentoUcd_disciplina_pai: TStringField;
    qryDisciplinaPaiUcd_disciplina_pai: TStringField;
    qryDisciplinaPaiUcodigo: TIntegerField;
    qryDisciplinaPaiUordem: TSmallintField;
    qryDisciplinaPaiUcurso: TStringField;
    qryDisciplinaPaiUsigla: TStringField;
    qryDisciplinaPaiUdescricao: TStringField;
    qryDisciplinaPaiUementa_backup: TMemoField;
    qryDisciplinaPaiUid_disciplina: TLargeintField;
    qryDisciplinaPaiUqtd_frases_fixas: TSmallintField;
    qryDisciplinaPaiUcd_disc_mec: TIntegerField;
    qryDisciplinaPaiUsn_bloqueado: TSmallintField;
    qryDisciplinaPaiUsn_ementa_padrao: TSmallintField;
    qryDispDisciplinaAgrupamentoUcd_coligada: TSmallintField;
    cbUnidades: TComboBox;
    Label5: TLabel;
    cbDisciplinasPai: TUMComboBox;
    procedure cbDisciplinasPaiChange(Sender: TObject);
    procedure qryDispDisciplinaAgrupamentoUBeforePost(DataSet: TDataSet);
    procedure dsDispDisciplinasAgrupadasCompletarDataChange(Sender: TObject;
      Field: TField);
    procedure cbUnidadesSelect(Sender: TObject);
    procedure qryDispDisciplinaAgrupamentoAfterRefresh(DataSet: TDataSet);
    procedure dsDispDisciplinasAgrupadasStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsDispDisciplinaAgrupamentoStateChange(Sender: TObject);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnDellClick(Sender: TObject);
    procedure dsDispDisciplinaAgrupamentoDataChange(Sender: TObject;
      Field: TField);
    procedure btCancelar_PessoaClick(Sender: TObject);
    procedure btSalvar_PessoaClick(Sender: TObject);
    procedure btExcluir_PessoaClick(Sender: TObject);
    procedure btAlterar_PessoaClick(Sender: TObject);
    procedure btIncluir_PessoaClick(Sender: TObject);
    procedure qryDispDisciplinaAgrupamentoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryDispDisciplinaAgrupamentoAfterOpen(DataSet: TDataSet);
    procedure btFechar_PessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure upAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
  private

    procedure carregaDisciplinasPai();

  public
    { Public declarations }
    procedure VerificaDBGrid2();
  end;

var
  frmAgrupamentoDisciplinas: TfrmAgrupamentoDisciplinas;

implementation

uses uAgrupamentoSelecionaDisciplina, uUsuario, uItemCombo;

{$R *.dfm}

procedure TfrmAgrupamentoDisciplinas.btAlterar_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1626, npAlterar, true) then Exit;
   // if not PasswordDlg.Autorizar( 1626, taAlterar, True ) then Exit;

   qryDispDisciplinaAgrupamentoU.Edit;
end;

procedure TfrmAgrupamentoDisciplinas.btCancelar_PessoaClick(Sender: TObject);
begin
   qryDispDisciplinaAgrupamentoU.Cancel;
end;

procedure TfrmAgrupamentoDisciplinas.btExcluir_PessoaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 1626, npExcluir, true) then Exit;
   // if not PasswordDlg.Autorizar( 1626, taDeletar, True ) then Exit;

   if qryDispDisciplinaAgrupamentoU.RecordCount > 0 then
   begin

      if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin

         qryApagaDispDisciplinasAgrupadasU.Close;
         qryApagaDispDisciplinasAgrupadasU.ParamByName('cd_agrupamento').AsInteger := qryDispDisciplinaAgrupamentoUcd_agrupamento.asinteger;
         qryApagaDispDisciplinasAgrupadasU.ExecSQL;
         qryApagaDispDisciplinasAgrupadasU.Close;

         qryDispDisciplinaAgrupamentoU.Delete;

      end;
   end;
end;

procedure TfrmAgrupamentoDisciplinas.btFechar_PessoaClick(Sender: TObject);
begin
   close();
end;

procedure TfrmAgrupamentoDisciplinas.btIncluir_PessoaClick(Sender: TObject);
begin

     if not DM.UsuarioLogado.TemPermissao( 1626, npIncluir, true) then Exit;
     // if not PasswordDlg.Autorizar( 1626, taIncluir, True ) then Exit;

     qryDispDisciplinaAgrupamentoU.Insert;

     qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString := inttostr( DM.GetAnoSemestreAtual );
     meAnoSemestre.Text := inttostr( DM.GetAnoSemestreAtual );

     qryDispDisciplinasAgrupadasU.Close;

     VerificaDBGrid2();
end;

procedure TfrmAgrupamentoDisciplinas.btnAddClick(Sender: TObject);
var codigo : integer;
begin

   if ( qryDispDisciplinaAgrupamentoU.State = dsInsert ) then
   begin
      qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString := meAnoSemestre.Text;
      qryDispDisciplinaAgrupamentoU.Post();

      codigo := dm.LastInsert;

      qryDispDisciplinaAgrupamentoU.close();
      qryDispDisciplinaAgrupamentoU.open();

      qryDispDisciplinaAgrupamentoU.Locate( 'cd_agrupamento', codigo, []);

   end;
  

   if ( qryDispDisciplinaAgrupamentoU.State = dsEdit ) then
   begin
      qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString := meAnoSemestre.Text;
      qryDispDisciplinaAgrupamentoU.Post();

      codigo := qryDispDisciplinaAgrupamentoUcd_agrupamento.AsInteger;

      qryDispDisciplinaAgrupamentoU.close();
      qryDispDisciplinaAgrupamentoU.open();

      qryDispDisciplinaAgrupamentoU.Locate( 'cd_agrupamento', codigo, []);
   end;


   Application.CreateForm(TfrmAgrupamentoSelecionaDisciplina , frmAgrupamentoSelecionaDisciplina );

   frmAgrupamentoSelecionaDisciplina.selecionaDisciplinas(
      meAnoSemestre.Text,
      TItemCombo(cbDisciplinasPai.Items.Objects[cbDisciplinasPai.ItemIndex]).codigo
   );

   frmAgrupamentoSelecionaDisciplina.Show;
end;

procedure TfrmAgrupamentoDisciplinas.btnDellClick(Sender: TObject);
begin

 if ( ( qryDispDisciplinasAgrupadasU.Locate( 'cd_agrupamento;cd_disciplina;cd_turma',
      VarArrayOf(
         [  qryDispDisciplinasAgrupadasCompletarUcd_agrupamento.AsInteger,
            qryDispDisciplinasAgrupadasCompletarUcd_disciplina.asstring,
            qryDispDisciplinasAgrupadasCompletarUcd_turma.asstring ]
      ),
   [loCaseInsensitive]))) then
   begin
      if not qryDispDisciplinasAgrupadasU.Eof then
      begin
         qryDispDisciplinasAgrupadasU.Delete;
      end;
   end;

   qryDispDisciplinasAgrupadasCompletarU.Close;
   qryDispDisciplinasAgrupadasCompletarU.ParamByName('cd_agrupamento').asinteger := qryDispDisciplinaAgrupamentoUcd_agrupamento.asinteger;
   qryDispDisciplinasAgrupadasCompletarU.Open;

   VerificaDBGrid2;
end;

procedure TfrmAgrupamentoDisciplinas.btSalvar_PessoaClick(Sender: TObject);
var
  CodColigada : Integer;
  indexDiscPai : Integer;
begin
   // Seta a coligada com a coligada selecionada
   CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());
   indexDiscPai  := cbDisciplinasPai.ItemIndex;

   if CodColigada <> 0 then begin
     qryDispDisciplinaAgrupamentoU.FieldByName('cd_coligada').AsInteger := CodColigada;
   end;

   if ( qryDispDisciplinaAgrupamentoU.State = dsEdit ) or ( qryDispDisciplinaAgrupamentoU.State = dsInsert ) then
   begin
      qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString := meAnoSemestre.Text;
      qryDispDisciplinaAgrupamentoUcd_disciplina_pai.AsString := TItemCombo(cbDisciplinasPai.Items.Objects[indexDiscPai]).codigo;
      qryDispDisciplinaAgrupamentoU.Post();
      qryDispDisciplinaAgrupamentoU.close();
      qryDispDisciplinaAgrupamentoU.open();
   end;
end;

procedure TfrmAgrupamentoDisciplinas.carregaDisciplinasPai;
var
   qryDisciplinasPai: TUMZReadOnlyQuery;
const
   SQL_DISCIPLINAS_PAI = ''+
      ' SELECT '+
      ' 	d.cd_disciplina_pai, '+
      ' 	CONCAT(d.cd_disciplina_pai, '' - '', d.descricao) as descricao '+
      ' FROM '+
      ' 	disciplinas as d '+
      ' GROUP BY '+
      ' 	d.cd_disciplina_pai '+
      ' ORDER BY '+
      ' 	d.cd_disciplina_pai ';
begin

   DM.CriarConsulta(qryDisciplinasPai);

   qryDisciplinasPai.SQL.Text := SQL_DISCIPLINAS_PAI;
   qryDisciplinasPai.Open;

   while not qryDisciplinasPai.Eof do
   begin
      cbDisciplinasPai.AddItem(
         qryDisciplinasPai.FieldByName('descricao').AsString,
         TItemCombo.Create(
            qryDisciplinasPai.FieldByName('cd_disciplina_pai').AsString,
            qryDisciplinasPai.FieldByName('descricao').AsString
         )
      );

      qryDisciplinasPai.Next;
   end;

   qryDisciplinasPai.Free;
end;

procedure TfrmAgrupamentoDisciplinas.cbDisciplinasPaiChange(Sender: TObject);
var
   indexDisciplinaPai : integer;
begin
   if((qryDispDisciplinaAgrupamentoU.Active) and
   not((qryDispDisciplinaAgrupamentoU.State = dsEdit ) or ( qryDispDisciplinaAgrupamentoU.State = dsInsert ))) then
   begin
      indexDisciplinaPai := cbDisciplinasPai.ItemIndex;
      qryDispDisciplinaAgrupamentoU.Edit;
      cbDisciplinasPai.ItemIndex := indexDisciplinaPai;
   end;
end;

procedure TfrmAgrupamentoDisciplinas.cbUnidadesSelect(Sender: TObject);
var
   CodColigada : Integer;
begin
   qryDispDisciplinaAgrupamentoU.Edit;

   CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());

   if CodColigada <> 0 then begin
      qryDispDisciplinaAgrupamentoU.FieldByName('cd_coligada').AsString := TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo();
   end;
end;

procedure TfrmAgrupamentoDisciplinas.DBGrid2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
   codigo : Integer;
begin

   // quando recebe o drag drop
   if Source is TDBGrid then
   begin


      if ( qryDispDisciplinaAgrupamentoU.State = dsInsert ) then
      begin

         qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString := meAnoSemestre.Text;
         qryDispDisciplinaAgrupamentoU.post();

         codigo := qryDispDisciplinaAgrupamentoUcd_agrupamento.AsInteger;
         qryDispDisciplinaAgrupamentoU.close();
         qryDispDisciplinaAgrupamentoU.open();

         qryDispDisciplinaAgrupamentoU.Locate( 'cd_agrupamento',
             codigo,
         [loCaseInsensitive]);
      end;



      if ( not( qryDispDisciplinasAgrupadasU.Locate( 'cd_disciplina;cd_turma',
         VarArrayOf(
            [frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasUcd_disciplina.asstring, frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasUcd_turma.asstring ]
         ),
      [loCaseInsensitive]))) then
      begin

         if qryDispDisciplinasAgrupadasU.State <> dsInsert then
         begin
            qryDispDisciplinasAgrupadasU.Close;
            qryDispDisciplinasAgrupadasU.Open;
            qryDispDisciplinasAgrupadasU.Insert;
         end;

         qryDispDisciplinasAgrupadasUcd_agrupamento.asinteger   := qryDispDisciplinaAgrupamentoUcd_agrupamento.asinteger;

         qryDispDisciplinasAgrupadasUcd_disciplina.AsString     := frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasUcd_disciplina.asstring;
         qryDispDisciplinasAgrupadasUcd_turma.asstring          := frmAgrupamentoSelecionaDisciplina.qryDisciplinasTurmasUcd_turma.asstring;
         qryDispDisciplinasAgrupadasU.Post;
         qryDispDisciplinasAgrupadasU.close;
         qryDispDisciplinasAgrupadasU.open;
         qryDispDisciplinasAgrupadasCompletarU.Close;
         qryDispDisciplinasAgrupadasCompletarU.Open;
      end;


      frmAgrupamentoSelecionaDisciplina.SetFocus;
   end;

   VerificaDBGrid2;
end;

procedure TfrmAgrupamentoDisciplinas.DBGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TDBGrid);
end;

procedure TfrmAgrupamentoDisciplinas.dsDispDisciplinaAgrupamentoDataChange(
  Sender: TObject; Field: TField);
var
   i, CodColigada : Integer;
begin

   if not (qryDispDisciplinaAgrupamentoU.State in [dsInsert,dsEdit]) then begin
      cbUnidades.ItemIndex := 0;
   end;

   for i := 0 to cbUnidades.Items.Count - 1 do
   begin
      CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[i]).getCodigo());

      // Verifica se a coligada selecionada é a coligada que está varrendo
      if (CodColigada = qryDispDisciplinaAgrupamentoU.FieldByName('cd_coligada').AsInteger) and
         (qryDispDisciplinaAgrupamentoU.FieldByName('cd_coligada').AsInteger <> 0) and
          not (qryDispDisciplinaAgrupamentoU.State in [dsInsert,dsEdit]) then begin
         cbUnidades.ItemIndex := i;
      end;
   end;

   meAnoSemestre.Text := qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString;
   
   qryDispDisciplinasAgrupadasU.close;
   qryDispDisciplinasAgrupadasU.ParamByName('cd_agrupamento').asINteger := qryDispDisciplinaAgrupamentoUcd_agrupamento.AsInteger;
   qryDispDisciplinasAgrupadasU.open;

   for I := 0 to cbDisciplinasPai.Items.Count - 1 do
   begin
      if TItemCombo(cbDisciplinasPai.Items.Objects[i]).codigo = qryDispDisciplinaAgrupamentoUcd_disciplina_pai.AsString then
      begin
         cbDisciplinasPai.ItemIndex := i;         
      end;
   end;
end;

procedure TfrmAgrupamentoDisciplinas.dsDispDisciplinaAgrupamentoStateChange(
  Sender: TObject);
begin
   {Habilitando e Desabilitando os botoes}
  btIncluir_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispDisciplinaAgrupamento.State in [dsBrowse, dsInactive]);

  btAlterar_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispDisciplinaAgrupamento.State in [dsBrowse, dsInactive]);

  btSalvar_Pessoa.Enabled      := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (dsDispDisciplinaAgrupamento.State in [dsInsert, dsEdit]);

  btCancelar_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (dsDispDisciplinaAgrupamento.State in [dsInsert, dsEdit]);

  btExcluir_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispDisciplinaAgrupamento.State in [dsBrowse, dsInactive]);

  btFechar_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispDisciplinaAgrupamento.State in [dsBrowse, dsInactive]);


   if dsDispDisciplinaAgrupamento.State = dsInsert Then
          if not DM.UsuarioLogado.TemPermissao( 1626, npIncluir, true) then BEGIN;
	       // if not PasswordDlg.Autorizar( 1626, taIncluir, True ) then Begin
	       qryDispDisciplinaAgrupamentoU.Cancel;
	       Exit;
      End;

      if dsDispDisciplinaAgrupamento.State = dsEdit Then
          if not DM.UsuarioLogado.TemPermissao( 1626, npAlterar, true) then BEGIN;
	       // if not PasswordDlg.Autorizar( 1626, taAlterar, True ) then Begin
	          qryDispDisciplinaAgrupamentoU.Cancel;
	       Exit;
	    End;

end;

procedure TfrmAgrupamentoDisciplinas.dsDispDisciplinasAgrupadasCompletarDataChange(
  Sender: TObject; Field: TField);
begin
   VerificaDBGrid2();
end;

procedure TfrmAgrupamentoDisciplinas.dsDispDisciplinasAgrupadasStateChange(
  Sender: TObject);
begin
   qryDispDisciplinasAgrupadasCompletarU.Close;
   qryDispDisciplinasAgrupadasCompletarU.ParamByName('cd_agrupamento').asinteger := qryDispDisciplinaAgrupamentoUcd_agrupamento.asinteger;
   qryDispDisciplinasAgrupadasCompletarU.Open;
end;

procedure TfrmAgrupamentoDisciplinas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmAgrupamentoDisciplinas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Passando os campos com Enter para todos os controles que}
  {nao sao tdbgrid e tdbMemo}
  case Key of
    VK_F2 : if btIncluir_Pessoa.Enabled then btIncluir_PessoaClick( nil );
    VK_F3 : if btAlterar_Pessoa.Enabled then btAlterar_PessoaClick( nil );
    VK_F5 : if btSalvar_Pessoa.Enabled then btSalvar_PessoaClick( nil );
    VK_F9 : if btExcluir_Pessoa.Enabled then btExcluir_PessoaClick( nil );
    VK_F6 : if btCancelar_Pessoa.Enabled then btCancelar_PessoaClick( nil );
    VK_F12 : if btFechar_Pessoa.Enabled then btFechar_PessoaClick( nil );
  end;

end;

procedure TfrmAgrupamentoDisciplinas.FormShow(Sender: TObject);
var
   i : Integer;
   SQLAgrupamentoDisciplinas : string;
begin
   carregaDisciplinasPai;

   qryDispDisciplinaAgrupamentoU.Close;

   SQLAgrupamentoDisciplinas := 'SELECT cd_agrupamento, nm_agrupamento, nr_anosemestre, cd_curso, cd_disciplina_pai, cd_coligada FROM disp_disciplina_agrupamento WHERE cd_coligada IN (' + DM.GetColigadas() + ') OR cd_coligada IS NULL';

   qryDispDisciplinaAgrupamentoU.SQL.Text := SQLAgrupamentoDisciplinas;

   qryDispDisciplinaAgrupamentoU.Open;

   cbUnidades.AddItem('Selecione', TItemCombo.Create( '0', 'Selecione' ));

   cbUnidades.ItemIndex := 0;

   for i := 0 to DM.ArrayColigadasUsuario.Count - 1 do
   begin
      cbUnidades.Items.AddObject(
        TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getDescricao(),
        DM.ArrayColigadasUsuario.Objects[i]
      );

      // Verifica se a coligada selecionada é a coligada que está varrendo
      if StrToInt(TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getCodigo()) = qryDispDisciplinaAgrupamentoU.FieldByName('cd_coligada').AsInteger then begin
        cbUnidades.ItemIndex := i+1;
      end

   end;

   if dm.UsaAnosemestre = true then
   begin
         meAnoSemestre.Text := inttostr( DM.GetAnoSemestreAtual );
   end
   else
   begin
      meAnoSemestre.Visible   := False;
      upAnoSemestre.Visible   := False;
      meAnoSemestre.Text      := '1';
      lblAnoSemestre.Visible  := False;
   end;

   qryDisciplinaPaiU.Open;
end;

procedure TfrmAgrupamentoDisciplinas.qryDispDisciplinaAgrupamentoAfterOpen(
  DataSet: TDataSet);
begin
   if qryDispDisciplinaAgrupamentoUnr_anosemestre.asString = '' then
   begin
   
      if ( qryDispDisciplinaAgrupamentoU.State = dsInsert ) and ( meAnoSemestre.Text <> '' ) then
      begin
         qryDispDisciplinaAgrupamentoUnr_anosemestre.asString := meAnoSemestre.Text;
      end
      else
      begin
         if ( qryDispDisciplinaAgrupamentoU.State = dsEdit ) then
         begin
            qryDispDisciplinaAgrupamentoUnr_anosemestre.asString := dm.variavel_parametro('profes_coorde_anosem');

               if dm.UsaAnosemestre = true then
               begin
                  meAnoSemestre.Text := dm.variavel_parametro('profes_coorde_anosem');
               end
               else
               begin
                  meAnoSemestre.Text := '1';
               end;
         end;
      end;

   end;


   if dm.UsaAnosemestre = true then
   begin
      meAnoSemestre.Text := qryDispDisciplinaAgrupamentoUnr_anosemestre.asString;
   end
   else
   begin
      meAnoSemestre.Text := '1';
   end;

   VerificaDBGrid2;
   
end;

procedure TfrmAgrupamentoDisciplinas.qryDispDisciplinaAgrupamentoAfterRefresh(
  DataSet: TDataSet);
begin
   VerificaDBGrid2;
end;

procedure TfrmAgrupamentoDisciplinas.qryDispDisciplinaAgrupamentoAfterScroll(
  DataSet: TDataSet);
begin

   if qryDispDisciplinaAgrupamentoUnr_anosemestre.asString = '' then
   begin
   
      if ( qryDispDisciplinaAgrupamentoU.State = dsInsert ) and ( meAnoSemestre.Text <> '' ) then
      begin
         qryDispDisciplinaAgrupamentoUnr_anosemestre.asString := meAnoSemestre.Text;
      end
      else
      begin
         if ( qryDispDisciplinaAgrupamentoU.State = dsEdit ) then
         begin
          qryDispDisciplinaAgrupamentoUnr_anosemestre.asString := dm.variavel_parametro('profes_coorde_anosem');
            meAnoSemestre.Text := dm.variavel_parametro('profes_coorde_anosem');
         end;
      end;

   end;

   meAnoSemestre.Text := qryDispDisciplinaAgrupamentoUnr_anosemestre.asString;

   VerificaDBGrid2;

end;

procedure TfrmAgrupamentoDisciplinas.qryDispDisciplinaAgrupamentoUBeforePost(
  DataSet: TDataSet);
begin
   if ( TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo = '0' ) then
   begin
      Mensagem( 'Você deve seleiconar uma unidade de ensino.', '', MB_ICONEXCLAMATION + MB_OK, Handle );
      Abort();
   end;   
end;

procedure TfrmAgrupamentoDisciplinas.upAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
begin

   if ( qryDispDisciplinaAgrupamentoU.State <> dsInsert ) then
   begin
      qryDispDisciplinaAgrupamentoU.edit;
   end;


   if meAnoSemestre.Text = '' then
   begin
      meAnoSemestre.text := inttostr( DM.GetAnoSemestreAtual() );
   end;

   if Button = btNext then
      meAnoSemestre.Text := DM.incrementar_ano_semestre(meAnoSemestre.Text)
   else
      meAnoSemestre.Text := DM.decrementar_ano_semestre(meAnoSemestre.Text);

   qryDispDisciplinaAgrupamentoUnr_anosemestre.AsString := meAnoSemestre.Text;
end;



procedure TfrmAgrupamentoDisciplinas.VerificaDBGrid2();
begin
   {
      habilita ou desabilita
      botao
   }
   if qryDispDisciplinasAgrupadasCompletarU.RecordCount > 0  then
   begin
      cbDisciplinasPai.Enabled := false;
      meAnoSemestre.Enabled := false;
      upAnoSemestre.Enabled := false;
   end
   else
   begin
      cbDisciplinasPai.Enabled := true;
      meAnoSemestre.Enabled := true;
      upAnoSemestre.Enabled := true;
   end;
end;


end.
