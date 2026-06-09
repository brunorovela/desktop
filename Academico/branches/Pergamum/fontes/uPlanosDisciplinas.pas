unit uPlanosDisciplinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, StdCtrls, Mask,
  ComCtrls, ImgList, ToolWin, Menus, DBCGrids;

type
  TfPlanosDisciplinas = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Label14: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown1: TUpDown;
    Bevel5: TBevel;
    Bevel7: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qyPlanos: TUMZQuery;
    qyPlanosds_plano: TStringField;
    dsPlanos: TDataSource;
    qyItens: TUMZQuery;
    qyItensvl_parcela: TFloatField;
    qyItensvl_desconto: TFloatField;
    qyItensdt_inicial: TDateTimeField;
    qyTiposTitulos: TUMZQuery;
    dsItens: TDataSource;
    qyTiposTituloscd_tipo_titulo: TSmallintField;
    qyTiposTitulosds_tipo_titulo: TStringField;
    qyItensdescTipoTitulo: TStringField;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbCodigo: TDBEdit;
    dbDescricao: TDBEdit;
    pgPlano: TPageControl;
    tsItens: TTabSheet;
    tsTurmas: TTabSheet;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Label4: TLabel;
    dbMinDisc: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    Label10: TLabel;
    DBCheckBox1: TDBCheckBox;
    bdVencDemais: TDBEdit;
    DBEdit7: TDBEdit;
    btnIncluirItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    btnSalvarItem: TSpeedButton;
    Label12: TLabel;
    Panel7: TPanel;
    sbAdicionarCurso: TSpeedButton;
    sbAdicionarTurma: TSpeedButton;
    sbExcluirTurma: TSpeedButton;
    qyTurmas: TUMZQuery;
    qyTurmascd_turma: TStringField;
    qyTurmasds_turma: TStringField;
    qyTurmasserie: TSmallintField;
    qyTurmasds_curso: TStringField;
    qyTurmascd_curso: TStringField;
    DBGrid2: TDBGrid;
    dsTurma: TDataSource;
    sbExcluirTudo: TSpeedButton;
    qyPlanoscd_plano: TLargeintField;
    qyPlanosnr_anosem: TIntegerField;
    qyItenscd_plano_item: TLargeintField;
    qyItenscd_plano: TLargeintField;
    qyItensnr_disc_min: TSmallintField;
    qyItensnr_disc_max: TSmallintField;
    qyItenssn_pode_repetir: TSmallintField;
    qyItenscd_tipo_titulo: TLargeintField;
    qyItensnr_parcelas: TIntegerField;
    qyTurmasid_plano_turma: TLargeintField;
    qyTurmascd_plano: TLargeintField;
    qyTurmasnr_anosem: TIntegerField;
    qyItensdt_primeira_parc: TDateTimeField;
    qyItenssn_dia_util: TSmallintField;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    dbchUltimoMes: TDBCheckBox;
    sbCopia: TSpeedButton;
    DBCheckBox3: TDBCheckBox;
    qyItenssn_ultimo_dia_mes: TSmallintField;
    qyItensDT_SEGUNDA_PARC: TDateTimeField;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Bevel3: TBevel;
    procedure qyPlanosAfterInsert(DataSet: TDataSet);
    procedure qyItensDT_SEGUNDA_PARCChange(Sender: TField);
    procedure sbCopiaClick(Sender: TObject);
    procedure qyItensnr_disc_maxGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyItensdt_primeira_parcChange(Sender: TField);
    procedure qyItensBeforeInsert(DataSet: TDataSet);
    procedure qyItensBeforeEdit(DataSet: TDataSet);
    procedure qyPlanosBeforeEdit(DataSet: TDataSet);
    procedure qyPlanosBeforeInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbExcluirTudoClick(Sender: TObject);
    procedure sbAdicionarCursoClick(Sender: TObject);
    procedure sbExcluirTurmaClick(Sender: TObject);
    procedure sbAdicionarTurmaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure dsPlanosStateChange(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure qyItensnr_disc_minGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbMinDiscKeyPress(Sender: TObject; var Key: Char);
    procedure qyItensNewRecord(DataSet: TDataSet);
    procedure qyPlanosNewRecord(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Filtrar();
    procedure VincularTurma(CdTurma : String; CdAnoSemestre : Integer);
    procedure VincularCurso(CdCurso : String; CdAnoSemestre : Integer);

  public
    bChecando : Boolean;
    { Public declarations }
  end;

var
  fPlanosDisciplinas: TfPlanosDisciplinas;

implementation

uses
   uDM, Main, uFSelecionarTurma, uFSelecionarCurso, uUsuario, UFCopiaPlanoAfrica;

{$R *.DFM}

{ TfPlanosDisciplinas }

procedure TfPlanosDisciplinas.btnAlterarClick(Sender: TObject);
begin
   dbDescricao.SetFocus();
   qyPlanos.Edit();
end;

procedure TfPlanosDisciplinas.btnCancelarClick(Sender: TObject);
begin
   qyPlanos.Cancel();
end;

procedure TfPlanosDisciplinas.btnExcluirClick(Sender: TObject);
Var
   qyAux : TUMZQuery;
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npExcluir, True ) then Exit;

   if Mensagem('Deseja excluir o plano de pagamento selecionado e desvincular todas as turma deste plano?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes then Exit;

   DM.CriarConsulta( qyAux );

   qyAux.Close();
   qyAux.SQL.Text :=
     ' DELETE FROM fin_plano_turmas      ' +
     ' WHERE cd_plano = ' + qyPlanoscd_plano.AsString;

   qyAux.ExecSQL();

   qyPlanos.Delete();   
end;

procedure TfPlanosDisciplinas.btnInserirClick(Sender: TObject);
begin
   
   dbDescricao.SetFocus();
   qyPlanos.Insert();

end;

procedure TfPlanosDisciplinas.btnSalvarClick(Sender: TObject);
begin
   qyPlanos.Post();
   Filtrar();
end;

procedure TfPlanosDisciplinas.btnSalvarItemClick(Sender: TObject);
var
   wMonth,wDay,wYear : Word;
begin
   if ( qyItens.State <> dsBrowse ) and ( qyItenssn_ultimo_dia_mes.AsInteger = 1 )then
   begin
      DecodeDate(qyItensdt_inicial.AsDateTime,wYear,wMonth,wDay);
      qyItensdt_inicial.AsDateTime := EncodeDate(wYear,wMonth,daysPerMonth[wMonth]);
   end;
   qyItens.Post();
   qyItens.Close();
   qyItens.Open();
end;

procedure TfPlanosDisciplinas.dbMinDiscKeyPress(Sender: TObject; var Key: Char);
begin
     if UpperCase(Key) = 'G' then begin

        if qyItens.State in [dsInsert, dsEdit] then begin

           qyItens.Edit();

        end;

      TDBEdit(Sender).Field.AsInteger := -1;

   end;
end;

procedure TfPlanosDisciplinas.dsItensStateChange(Sender: TObject);
begin

   btnInserir.Enabled  := not (qyItens.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled  := not (qyItens.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled  := not (qyItens.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled   := (not (qyItens.State in [dsInsert, dsEdit])) AND (qyPlanos.State in [dsInsert, dsEdit]);
   btnCancelar.Enabled := not (qyItens.State in [dsInsert, dsEdit]) AND (qyPlanos.State in [dsInsert, dsEdit]);
   btnFechar.Enabled   := not (qyItens.State in [dsInsert, dsEdit]);
   btnIncluirItem.Enabled := not (qyItens.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled     := not (qyItens.State in [dsInsert, dsEdit]);
   btnSalvarItem.Enabled  := (qyItens.State in [dsInsert, dsEdit]);

end;

procedure TfPlanosDisciplinas.dsPlanosStateChange(Sender: TObject);
begin

   btnInserir.Enabled  := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnAlterar.Enabled  := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled  := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnSalvar.Enabled   := (qyPlanos.State in [dsInsert, dsEdit]);
   btnCancelar.Enabled := (qyPlanos.State in [dsInsert, dsEdit]);
   btnFechar.Enabled   := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnIncluirItem.Enabled := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnExcluir.Enabled     := not (qyPlanos.State in [dsInsert, dsEdit]);
   btnSalvarItem.Enabled  := (not (qyPlanos.State in [dsInsert, dsEdit])) AND (qyItens.State in [dsInsert, dsEdit]);
   sbCopia.Enabled := (qyPlanos.State = dsBrowse) and (not qyPlanos.IsEmpty)
         and DM.UsuarioLogado.TemPermissao(2006, npIncluir, False);
end;

procedure TfPlanosDisciplinas.Filtrar;
begin

   qyPlanos.Close();
   qyPlanos.SQL.Text :=
     ' SELECT * FROM fin_plano_pgto ' +
     ' WHERE nr_anosem = ' + txtAnoSemestre.Text +
     ' ORDER BY ds_plano ';
   qyPlanos.Open();

   qyItens.Close();
   qyItens.Open();

   qyTurmas.Close();
   qyTurmas.Open();
end;

procedure TfPlanosDisciplinas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfPlanosDisciplinas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F10: sbCopia.Click;
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;

end;

procedure TfPlanosDisciplinas.FormShow(Sender: TObject);
begin
   txtAnoSemestre.text := IntToStr(ano_semestre);

   pgPlano.ActivePageIndex := 0;
   bChecando := false;
   Filtrar();
end;

procedure TfPlanosDisciplinas.qyItensBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npAlterar, True ) then Exit;
end;

procedure TfPlanosDisciplinas.qyItensBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npIncluir, True ) then Exit;
end;

procedure TfPlanosDisciplinas.qyItensdt_primeira_parcChange(Sender: TField);
begin
   if (qyItens.State = dsInsert) and (
      (qyItensdt_inicial.AsString = '') or (qyItensnr_parcelas.AsInteger = 1)) then
   begin
      qyItensDT_SEGUNDA_PARC.AsDateTime := qyItensdt_primeira_parc.AsDateTime;
      qyItensdt_inicial.AsDateTime := qyItensdt_primeira_parc.AsDateTime;
   end;
end;

procedure TfPlanosDisciplinas.qyItensDT_SEGUNDA_PARCChange(Sender: TField);
begin
   if (qyItens.State = dsInsert) and (qyItensdt_inicial.IsNull or
      (qyItensdt_inicial.AsDateTime = qyItensdt_primeira_parc.AsDateTime) or
      (qyItensnr_parcelas.AsInteger = 2)) then
   begin
      qyItensdt_inicial.AsDateTime := qyItensDT_SEGUNDA_PARC.AsDateTime;
   end;   
end;

procedure TfPlanosDisciplinas.qyItensNewRecord(DataSet: TDataSet);
begin
   qyItenscd_plano.AsInteger := qyPlanoscd_plano.AsInteger;
end;

procedure TfPlanosDisciplinas.qyItensnr_disc_maxGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.AsInteger = -1 then
      Text := 'GC'
   else
      Text := TField(Sender).AsString;
end;

procedure TfPlanosDisciplinas.qyItensnr_disc_minGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   DisplayText := True;

   if Sender.AsInteger = -1 then
      Text := 'GC'
   else
      Text := TField(Sender).AsString;
end;

procedure TfPlanosDisciplinas.qyPlanosAfterInsert(DataSet: TDataSet);
var
  qyUltimoCodigoPlano : TUMZReadOnlyQuery;
  iCodPlano: Integer;
begin
   DM.CriarConsulta(qyUltimoCodigoPlano);

   qyUltimoCodigoPlano.SQL.Text := 'SELECT MAX(cd_plano) as ultimo FROM fin_plano_pgto ORDER BY ds_plano';
   qyUltimoCodigoPlano.Open();

   iCodPlano := 1;

   if qyUltimoCodigoPlano.RecordCount > 0 then
   begin
      if not qyUltimoCodigoPlano.FieldByName('ultimo').IsNull then
      begin
        iCodPlano := qyUltimoCodigoPlano.FieldByName('ultimo').AsInteger;
        Inc( iCodPlano );
      end;
   end;
   qyPlanoscd_plano.Value := iCodPlano;
end;

procedure TfPlanosDisciplinas.qyPlanosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npAlterar, True ) then Exit;
end;

procedure TfPlanosDisciplinas.qyPlanosBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npIncluir, True ) then Exit;
end;

procedure TfPlanosDisciplinas.qyPlanosNewRecord(DataSet: TDataSet);
begin
   qyPlanosnr_anosem.AsString := txtAnoSemestre.Text;
end;

procedure TfPlanosDisciplinas.sbAdicionarCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npIncluir, True ) then Exit;

   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      VincularCurso(resultado_filtro.cd_curso, resultado_filtro.nr_anosemestre);
   end;
end;

procedure TfPlanosDisciplinas.sbAdicionarTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   if not DM.UsuarioLogado.TemPermissao( 2006, npIncluir, True ) then Exit;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      VincularTurma(resultado_filtro.cd_turma, resultado_filtro.nr_anosemestre);
   end;
end;

procedure TfPlanosDisciplinas.sbCopiaClick(Sender: TObject);
begin
   Application.CreateForm(TfCopiaPlanoAfrica, fCopiaPlanoAfrica);
   fCopiaPlanoAfrica.PlanoOrigem := qyPlanoscd_plano.AsInteger;
   fCopiaPlanoAfrica.Left := sbCopia.ClientOrigin.X;
   fCopiaPlanoAfrica.Top := sbCopia.ClientOrigin.Y + sbCopia.Height;
   fCopiaPlanoAfrica.ShowModal;
end;

procedure TfPlanosDisciplinas.sbExcluirTudoClick(Sender: TObject);
var
   sMsg : string;
   sChave : string;
   qyAux : TUMZQuery;
begin

   if not DM.UsuarioLogado.TemPermissao( 2006, npExcluir, True ) then Exit;

   if Mensagem('Deseja desvincular todas as turma deste plano?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes then Exit;

   // Desvincular a turma do plano

   DM.CriarConsulta( qyAux );

   qyAux.Close();
   qyAux.SQL.Text :=
     ' DELETE FROM fin_plano_turmas      ' +
     ' WHERE cd_plano = ' + qyTurmascd_plano.AsString;

   qyAux.ExecSQL();

   qyTurmas.Close();
   qyTurmas.Open();

end;


procedure TfPlanosDisciplinas.sbExcluirTurmaClick(Sender: TObject);
var
   sMsg : string;
   sChave : string;
   qyAux : TUMZQuery;
begin

   if not DM.UsuarioLogado.TemPermissao( 2006, npExcluir, True ) then Exit;

   if Mensagem('Deseja desvincular todas a turma selecionada deste plano?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes then Exit;

   // Desvincular a turma do plano

   DM.CriarConsulta( qyAux );

   qyAux.Close();
   qyAux.SQL.Text :=
     ' DELETE FROM fin_plano_turmas      ' +
     ' WHERE cd_plano = ' + qyTurmascd_plano.AsString +
     '   AND cd_turma = "' + qyTurmascd_turma.AsString + '" ' +
     '   AND nr_anosem = ' + qyTurmasnr_anosem.AsString;

   qyAux.ExecSQL();

   qyTurmas.Close();
   qyTurmas.Open();

end;

procedure TfPlanosDisciplinas.btnIncluirItemClick(Sender: TObject);
begin
    dbMinDisc.SetFocus();
   qyItens.Insert();
end;

procedure TfPlanosDisciplinas.btnExcluirItemClick(Sender: TObject);
begin


   if qyItens.State in [dsInsert, dsEdit] then begin

      qyItens.Cancel();

   end else begin

      if Mensagem('Excluir este item do plano? ', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then exit;

      qyItens.Delete();

   end;

end;

procedure TfPlanosDisciplinas.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfPlanosDisciplinas.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then begin
    txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  Filtrar();

end;

procedure TfPlanosDisciplinas.VincularCurso(CdCurso: String; CdAnoSemestre: Integer);
Var
  qyAux : TUMZQuery;
begin
   // Vincular a Turma do plano

   DM.CriarConsulta(qyAux);
   
   qyAux.Close();
   qyAux.SQL.Text :=
     ' REPLACE INTO fin_plano_turmas (cd_plano, cd_turma, nr_anosem) ' +
     ' SELECT ' + qyPlanoscd_plano.AsString + ', codigo, anosemestre ' +
     ' FROM turmas WHERE curso = "' + CdCurso + '" AND anosemestre = ' + IntToStr(CdAnoSemestre);

   qyAux.ExecSQL();

   qyTurmas.Close();
   qyTurmas.Open();

   FreeAndNil(qyAux);

end;

procedure TfPlanosDisciplinas.VincularTurma(CdTurma: String; CdAnoSemestre: Integer);
Var
  qyAux : TUMZQuery;
begin
   DM.CriarConsulta(qyAux);

   qyAux.Close();
   qyAux.SQL.Text :=
     ' REPLACE INTO fin_plano_turmas (cd_plano, cd_turma, nr_anosem) ' +
     ' VALUES (' + qyPlanoscd_plano.AsString + ', "'+CdTurma+'", '+IntToStr(CdAnoSemestre)+ ' )';

   qyAux.ExecSQL();

   qyTurmas.Close();
   qyTurmas.Open();

   FreeAndNil(qyAux);

end;

end.

