unit uAgrupamentoHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, uDM, DB, DBTables, DBCtrls,
  ToolWin, Grids, DBGrids, dblookup, Buttons, ImgList, General,
  ZAbstractRODataset, ZAbstractDataset, UZDataset;


type
  TfrmAgrupamentoHorarios = class(TForm)
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
    dsDispHorarios: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    dbgDispHorariosUnimestre: TDBGrid;
    Label3: TLabel;
    btnDell: TBitBtn;
    btnAdd: TBitBtn;
    dsDispHorariosUnimestre: TDataSource;
    ImageList1: TImageList;
    Panel2: TPanel;
    dbgDispHorarios: TDBGrid;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    dsTurnos: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    qryDispHorariosU: TUMZQuery;
    qryDispHorariosUnimestreU: TUMZQuery;
    qryDispHorariosUnimestreUpdateU: TUMZQuery;
    qryApagaDispHorariosUnimestreU: TUMZQuery;
    qryTurnosU: TUMZQuery;
    qryDispHorariosUcd_horario: TLargeintField;
    qryDispHorariosUds_nome: TStringField;
    qryDispHorariosUds_chave_integracao: TStringField;
    qryDispHorariosUcd_turno: TStringField;
    qryDispHorariosUnimestreUcd_uni_horario: TLargeintField;
    qryDispHorariosUnimestreUcd_horario: TLargeintField;
    qryDispHorariosUnimestreUpdateUcd_uni_horario: TLargeintField;
    qryDispHorariosUnimestreUpdateUcd_horario: TLargeintField;
    qryTurnosUcodigo: TStringField;
    qryTurnosUdescricao: TStringField;
    qryDispHorariosUnimestreUds_horario: TStringField;
    qryDispHorariosUnimestreUhr_inicio: TTimeField;
    qryDispHorariosUnimestreUhr_fim: TTimeField;
    qryDispHorariosUnimestreUds_sigla: TStringField;
    qryDispHorariosUnimestreUturno: TStringField;
    qryDispHorariosUnimestreUds_chave: TStringField;
    qryDispHorariosUnimestreUcd_horario_urania: TLargeintField;
    qryDispHorariosUnimestreUds_categoria: TStringField;
    qryDispHorariosUnimestreUqtd_aulas: TSmallintField;
    cbUnidades: TComboBox;
    Label5: TLabel;
    qryDispHorariosUcd_coligada: TIntegerField;
    procedure cbUnidadesSelect(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsDispHorariosStateChange(Sender: TObject);
    procedure dbgDispHorariosUnimestreDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDispHorariosUnimestreDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnDellClick(Sender: TObject);
    procedure dsDispHorariosDataChange(Sender: TObject;
      Field: TField);
    procedure btCancelar_PessoaClick(Sender: TObject);
    procedure btSalvar_PessoaClick(Sender: TObject);
    procedure btExcluir_PessoaClick(Sender: TObject);
    procedure btAlterar_PessoaClick(Sender: TObject);
    procedure btIncluir_PessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btFechar_PessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgrupamentoHorarios: TfrmAgrupamentoHorarios;

implementation

uses uAgrupamentoSelecionaDisciplina, uAgrupamentoSelecionaHorarios, uUsuario,
  uItemCombo;

{$R *.dfm}

procedure TfrmAgrupamentoHorarios.btAlterar_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 30003, npAlterar, true) then Exit;
   // if not PasswordDlg.Autorizar( 30003, taAlterar, True ) then Exit;
   qryDispHorariosU.Edit;
end;

procedure TfrmAgrupamentoHorarios.btCancelar_PessoaClick(Sender: TObject);
begin
   qryDispHorariosU.Cancel;
end;

procedure TfrmAgrupamentoHorarios.btExcluir_PessoaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 30003, npAlterar, true) then Exit;
   // if not PasswordDlg.Autorizar( 30003, taDeletar, True ) then Exit;

   if qryDispHorariosU.RecordCount > 0 then
   begin

      if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin                           
         qryApagaDispHorariosUnimestreU.Close;
         qryApagaDispHorariosUnimestreU.ParamByName('cd_horario').AsInteger := qryDispHorariosUcd_horario.asinteger;
         qryApagaDispHorariosUnimestreU.ExecSQL;
         qryApagaDispHorariosUnimestreU.Close;

         qryDispHorariosU.Delete;
      end;
   end;
end;

procedure TfrmAgrupamentoHorarios.btFechar_PessoaClick(Sender: TObject);
begin
   close();
end;

procedure TfrmAgrupamentoHorarios.btIncluir_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 30003, npIncluir, true) then Exit;
   // if not PasswordDlg.Autorizar( 30003, taIncluir, True ) then Exit;

   DBEdit1.SetFocus;
      
   qryDispHorariosU.Close;
   qryDispHorariosU.Open;
   qryDispHorariosU.Insert;

   DBEdit1.SetFocus;
end;

procedure TfrmAgrupamentoHorarios.btnAddClick(Sender: TObject);
var
   codigo : Integer;
begin

   if ( qryDispHorariosU.State = dsInsert ) then
   begin

      qryDispHorariosU.Post();
      codigo := dm.LastInsert;


      qryDispHorariosU.Close();
      qryDispHorariosU.Open();


     qryDispHorariosU.Locate( 'cd_horario', codigo, []);

   end;

   Application.CreateForm(TfrmAgrupamentoSelecionaHorarios, frmAgrupamentoSelecionaHorarios );
   frmAgrupamentoSelecionaHorarios.Show;
end;

procedure TfrmAgrupamentoHorarios.btnDellClick(Sender: TObject);
begin
   qryDispHorariosUnimestreUpdateU.Delete;
   qryDispHorariosUnimestreU.Close;
   qryDispHorariosUnimestreU.Open;
end;

procedure TfrmAgrupamentoHorarios.btSalvar_PessoaClick(Sender: TObject);
var
  CodColigada : Integer;
begin
  // Seta a coligada com a coligada selecionada
  CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());

  if CodColigada <> 0 then begin
     qryDispHorariosU.FieldByName('cd_coligada').AsInteger := CodColigada;
  end;

   if ( qryDispHorariosU.State = dsEdit ) or ( qryDispHorariosU.State = dsInsert ) then
   begin
     qryDispHorariosU.Post();
     qryDispHorariosU.close();
     qryDispHorariosU.open();
   end;
end;

procedure TfrmAgrupamentoHorarios.cbUnidadesSelect(Sender: TObject);
var
   CodColigada : Integer;
begin
   qryDispHorariosU.Edit;

   CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());

   if CodColigada <> 0 then begin
      qryDispHorariosU.FieldByName('cd_coligada').AsString := TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo();
   end;
end;

procedure TfrmAgrupamentoHorarios.dbgDispHorariosUnimestreDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var
  codigo : integer;
begin

   // quando recebe o drag drop
   if Source is TDBGrid then
   begin


      if ( qryDispHorariosU.State = dsInsert ) then
      begin

         qryDispHorariosU.post();

         codigo := qryDispHorariosUcd_horario.AsInteger;
         qryDispHorariosU.close();
         qryDispHorariosU.open();

         qryDispHorariosU.Locate( 'cd_horario',
             codigo,
         [loCaseInsensitive]);
      end;
                                                                                      


      if ( not( qryDispHorariosUnimestreUpdateU.Locate( 'cd_uni_horario',
         frmAgrupamentoSelecionaHorarios.qryHorariosUcodigo.AsInteger
         ,
      [loCaseInsensitive]))) then
      begin

         if qryDispHorariosUnimestreUpdateU.State <> dsInsert then
         begin
            qryDispHorariosUnimestreUpdateU.Insert;
         end;

         qryDispHorariosUnimestreUpdateUcd_uni_horario.asinteger   := frmAgrupamentoSelecionaHorarios.qryHorariosUcodigo.asinteger;
         qryDispHorariosUnimestreUpdateUcd_horario.asinteger       := qryDispHorariosUcd_horario.AsInteger;

         qryDispHorariosUnimestreUpdateU.Post;
         qryDispHorariosUnimestreUpdateU.close;
         qryDispHorariosUnimestreUpdateU.open;

         qryDispHorariosUnimestreU.close;
         qryDispHorariosUnimestreU.open;

      end;


      frmAgrupamentoSelecionaHorarios.SetFocus;
   end;
end;

procedure TfrmAgrupamentoHorarios.dbgDispHorariosUnimestreDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TDBGrid);
end;

procedure TfrmAgrupamentoHorarios.dsDispHorariosDataChange(
  Sender: TObject; Field: TField);
var
   i, CodColigada : Integer;
begin

   if not (qryDispHorariosU.State in [dsInsert,dsEdit]) then begin
      cbUnidades.ItemIndex := 0;
   end;

   for i := 0 to cbUnidades.Items.Count - 1 do
   begin
      CodColigada := StrToInt(TItemCombo(cbUnidades.Items.Objects[i]).getCodigo());

      // Verifica se a coligada selecionada é a coligada que está varrendo
      if (CodColigada = qryDispHorariosU.FieldByName('cd_coligada').AsInteger) and
         (qryDispHorariosU.FieldByName('cd_coligada').AsInteger <> 0) and
          not (qryDispHorariosU.State in [dsInsert,dsEdit]) then begin
         cbUnidades.ItemIndex := i;
      end;
   end;

//
//   qryDispHorariosUnimestre.close;
//   qryDispHorariosUnimestre.ParamByName('cd_horario').AsInteger := qryDispHorarioscd_horario.AsInteger;
//   qryDispHorariosUnimestre.Open;
//
//   qryDispHorariosUnimestreUpdate.close;
//   qryDispHorariosUnimestreUpdate.ParamByName('cd_horario').AsInteger := qryDispHorarioscd_horario.AsInteger;
//   qryDispHorariosUnimestreUpdate.Open;

   
end;

procedure TfrmAgrupamentoHorarios.dsDispHorariosStateChange(Sender: TObject);
begin
  {Habilitando e Desabilitando os botoes}
  btIncluir_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispHorarios.State in [dsBrowse, dsInactive]);

  btAlterar_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispHorarios.State in [dsBrowse, dsInactive]);

  btSalvar_Pessoa.Enabled      := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (dsDispHorarios.State in [dsInsert, dsEdit]);

  btCancelar_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (dsDispHorarios.State in [dsInsert, dsEdit]);

  btExcluir_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispHorarios.State in [dsBrowse, dsInactive]);

  btFechar_Pessoa.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (dsDispHorarios.State in [dsBrowse, dsInactive]);


   if dsDispHorarios.State = dsInsert Then
           if not DM.UsuarioLogado.TemPermissao( 30003, npIncluir, true) then Begin
//	       if not PasswordDlg.Autorizar( 30003, taIncluir, True ) then Begin
	       qryDispHorariosU.Cancel;
	       Exit;
      End;

      if dsDispHorarios.State = dsEdit Then
          if not DM.UsuarioLogado.TemPermissao( 30003, npAlterar, true) then Begin
	       // if not PasswordDlg.Autorizar( 30003, taAlterar, True ) then Begin
	          qryDispHorariosU.Cancel;
	       Exit;
	    End;

end;

procedure TfrmAgrupamentoHorarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmAgrupamentoHorarios.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmAgrupamentoHorarios.FormShow(Sender: TObject);
var
   i : Integer;
   SQLAgrupamentoHorarios : string;
begin

  qryDispHorariosU.Close;

  SQLAgrupamentoHorarios := 'SELECT cd_horario, ds_nome, ds_chave_integracao, cd_turno, cd_coligada FROM disp_horarios WHERE cd_coligada IN (' + DM.GetColigadas() + ') OR cd_coligada IS NULL ORDER BY ds_nome';

  qryDispHorariosU.SQL.Text := SQLAgrupamentoHorarios;

  qryDispHorariosU.Open;

  cbUnidades.AddItem('Selecione', TItemCombo.Create( '0', 'Selecione' ));

  cbUnidades.ItemIndex := 0;

  for i := 0 to DM.ArrayColigadasUsuario.Count - 1 do
  begin
     cbUnidades.Items.AddObject(
        TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getDescricao(),
        DM.ArrayColigadasUsuario.Objects[i]
     );

     // Verifica se a coligada selecionada é a coligada que está varrendo
     if StrToInt(TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getCodigo()) = qryDispHorariosU.FieldByName('cd_coligada').AsInteger then begin
        cbUnidades.ItemIndex := i+1;
     end

  end;

  qryDispHorariosU.Open;
  qryDispHorariosUnimestreU.Open;
  qryDispHorariosUnimestreUpdateU.Open;
  qryTurnosU.Open;
end;


end.
