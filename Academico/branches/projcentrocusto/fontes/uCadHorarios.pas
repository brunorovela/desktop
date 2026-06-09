unit uCadHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons;

type
   Tfrm_Horarios = class(TForm)
      Bevel7: TBevel;
      Panel3: TPanel;
      Panel1: TPanel;
      Bevel5: TBevel;
      grd: TDBGrid;
      Panel2: TPanel;
      Panel4: TPanel;
      Bevel6: TBevel;
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
      tblHorarios: TUMZQuery;
      dsHorarios: TDataSource;
      pmQtd: TPopupMenu;
      Label2: TLabel;
      DBEdit2: TDBEdit;
      Label3: TLabel;
      DBEdit3: TDBEdit;
      Label4: TLabel;
      DBEdit4: TDBEdit;
      tblHorariosds_horario: TStringField;
      tblHorarioshr_inicio: TTimeField;
      tblHorarioscodigo: TSmallintField;
      tblHorarioshr_fim: TTimeField;
      tblHorariosds_chave: TStringField;
      DBEdit1: TDBEdit;
      Label1: TLabel;
      Label5: TLabel;
      lcbTurnos: TDBLookupComboBox;
      tblTurnos: TUMZQuery;
      tblTurnoscodigo: TStringField;
      tblTurnosdescricao: TStringField;
      dsTurnos: TDataSource;
      Label6: TLabel;
      tblHorariosturno: TStringField;
      Label7: TLabel;
      DBEdit5: TDBEdit;
      tblHorariosds_categoria: TStringField;
      Label8: TLabel;
      DBEdit6: TDBEdit;
      spSeparador: TSplitter;
      Bevel1: TBevel;
      tblHorarioscd_horario_urania: TLargeintField;
      Label9: TLabel;
      DBEdit7: TDBEdit;
      UpDown1: TUpDown;
      tblHorariosqtd_aulas: TSmallintField;
      tblHorariosDS_TURNO: TStringField;
      tblHorariossn_ativo: TIntegerField;
      tblHorariosdt_cadastro: TDateTimeField;
      tblHorariosdt_exclusao: TDateTimeField;
      procedure tblHorariosBeforePost(DataSet: TDataSet);
      procedure dsHorariosDataChange(Sender: TObject; Field: TField);
      procedure tblHorarioshr_fimChange(Sender: TField);
      procedure tblHorarioshr_inicioChange(Sender: TField);
      procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
         NewValue: Smallint; Direction: TUpDownDirection);
      procedure grdTitleClick(Column: TColumn);
      procedure FormCreate(Sender: TObject);
      procedure tblHorariosAfterPost(DataSet: TDataSet);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure btnSairClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnInserirClick(Sender: TObject);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure dsHorariosStateChange(Sender: TObject);
      procedure pmQtdPopup(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
   const
      SQL_LISTA_HORARIOS =
         ' SELECT codigo, ds_horario, hr_inicio, hr_fim, ds_sigla, turno, ' +
         '        ds_chave, ds_categoria, cd_horario_urania, qtd_aulas, ' +
         '        sn_ativo, dt_cadastro, dt_exclusao ' +
         ' FROM horarios ' +
         ' WHERE sn_ativo = 1 ';
      SQL_LISTA_HORARIOS_ORDER = ' ORDER BY turno, hr_inicio, ds_horario ';
   private
      { Private declarations }
      FColunaFiltrada: TColumn;
      FOrdemColunaFiltrada : String;

      procedure LocateHourly(const ABeginTime, AEndTime: TTime);
   public
      { Public declarations }
   end;

var
  frm_Horarios: Tfrm_Horarios;

implementation

uses Main, uDM, uHorario, uFCorrecaoTurmasHorarios;

{$R *.dfm}

procedure Tfrm_Horarios.FormShow(Sender: TObject);
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   tblHorarios.SQL.Text := SQL_LISTA_HORARIOS;
   tblHorarios.SQL.Add(SQL_LISTA_HORARIOS_ORDER);

   tblHorarios.Close;
   tblHorarios.Open;
   tblTurnos.Close;
   tblTurnos.Open;

   FOrdemColunaFiltrada := 'ASC';
end;

procedure Tfrm_Horarios.grdTitleClick(Column: TColumn);
const
   SQL_GET_HORARIOS =
      'SELECT '+
         'codigo,ds_horario,hr_inicio,hr_fim,ds_sigla,turno,ds_chave,'+
         'ds_categoria,cd_horario_urania, qtd_aulas '+
      'FROM '+
         'horarios '+
      'ORDER BY '+
         '%s';
begin
   if Self.FColunaFiltrada <> Column then
   begin
      if Assigned(Self.FColunaFiltrada) then
      begin                 
         Self.FColunaFiltrada.Title.Font.Style := Self.FColunaFiltrada.Title.Font.Style - [fsBold];
      end;

      Self.FOrdemColunaFiltrada := 'ASC';

      Self.FColunaFiltrada := Column;
      Self.FColunaFiltrada.Title.Font.Style := Self.FColunaFiltrada.Title.Font.Style + [fsBold];
   end else begin
      if Self.FOrdemColunaFiltrada = 'DESC' then
         Self.FOrdemColunaFiltrada := 'ASC'
      else
         Self.FOrdemColunaFiltrada := 'DESC';
   end;

   Self.tblHorarios.Close;
   Self.tblHorarios.SQL.Text := SQL_LISTA_HORARIOS;
   Self.tblHorarios.SQL.Add('ORDER BY ' + Column.FieldName + ' ' + Self.FOrdemColunaFiltrada);
   Self.tblHorarios.Open;
end;

procedure Tfrm_Horarios.LocateHourly(const ABeginTime, AEndTime: TTime);
var
   LBeginTime, LEndTime: TTime;
begin
   LBeginTime := EncodeTime(06, 00, 00, 000);
   LEndTime := EncodeTime(23, 59, 59, 999);

   if (ABeginTime >= LBeginTime) and (AEndTime <= LEndTime) and
      (AEndTime > ABeginTime) then
   begin
      LEndTime := EncodeTime(12, 59, 59, 000);
      if (ABeginTime < LEndTime) and (AEndTime <= LEndTime) then
      begin
         if tblHorarios.State in [dsEdit, dsInsert] then
            tblHorariosturno.AsString := 'M'
         else
            lcbTurnos.KeyValue := 'M';
      end
      else
      begin
         LBeginTime := EncodeTime(12, 00, 00, 000);
         LEndTime := EncodeTime(18, 00, 00, 000);
         if (ABeginTime >= LBeginTime) and (AEndTime <= LEndTime) then
         begin
            if tblHorarios.State in [dsEdit, dsInsert] then
               tblHorariosturno.AsString := 'V'
            else
               lcbTurnos.KeyValue := 'V';
         end
         else
         begin
            LBeginTime := EncodeTime(18, 00, 00, 000);
            LEndTime := EncodeTime(23, 59, 59, 999);
            if (ABeginTime >= LBeginTime) and (LEndTime <= LEndTime) then
            begin
               if tblHorarios.State in [dsEdit, dsInsert] then
                  tblHorariosturno.AsString := 'N'
               else
                  lcbTurnos.KeyValue := 'N'
            end
            else if tblHorarios.State in [dsEdit, dsInsert] then
               tblHorariosturno.AsString := 'S'
            else
               lcbTurnos.KeyValue := 'S'
         end;
      end;
   end
   else if tblHorarios.State in [dsEdit, dsInsert] then
         tblHorariosturno.Clear
      else
         lcbTurnos.KeyValue := Null;
end;

procedure Tfrm_Horarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Horarios.FormCreate(Sender: TObject);
begin
   if DM.variavel_parametro('horario_integracao_urania') = 'S' then
   begin
      Self.Label8.Visible := true;
      Self.DBEdit6.Visible := true;
   end
   else
   begin
      Self.Label8.Visible := false;
      Self.DBEdit6.Visible := false;
   end;
end;

procedure Tfrm_Horarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Horarios.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Horarios.btnExcluirClick(Sender: TObject);
const
   MSG_PERGUNTA_VINCULO_HORARIOS =
      'Neste horário que está sendo removido existem turmas relacionadas. Deseja vincular estas turmas a outros horários?';
var
   horario: THorario;
   str, chave: String;
begin
   horario := THorario.Create(tblHorarios.FieldByName('codigo').AsInteger);

   if horario.TemTurmasHorariosVinculado() then
   begin
      case Mensagem(MSG_PERGUNTA_VINCULO_HORARIOS, 'Atenção', MB_YESNOCANCEL + MB_ICONEXCLAMATION + MB_DEFBUTTON3, Handle) of
         mrYes: begin
            if TfrmCorrecaoTurmasHorarios.corrigirTurmasHorarios(THorario.Create(
                  tblHorarioscodigo.AsInteger
               )) then
            begin
               tblHorarios.Close();
               tblHorarios.Open();
            end;
         end;
         mrNo: begin
            str := Format(
               'Desativação horário [%d]: %s; Hr Início: %s; Hr Fim: %s; Turno: %s; Categoria: %s; Chave: %s',
               [
                  tblHorarioscodigo.AsInteger,
                  tblHorariosds_horario.AsString, tblHorarioshr_inicio.AsString,
                  tblHorarioshr_fim.AsString, tblHorariosDS_TURNO.AsString,
                  tblHorariosds_categoria.AsString, tblHorariosds_chave.AsString
               ]
            );
            chave := tblHorarioscodigo.AsString;

            tblHorarios.Edit();
            tblHorariossn_ativo.AsInteger := 0;
            tblHorariosdt_exclusao.AsDateTime := DM.DataAtual();
            tblHorarios.Post();

            DM.setLog(1025, 'Exclusão', chave, 0, str);
         end;
         mrCancel:;
      end;
   end else begin
      if Mensagem( 'Deseja realmente excluir ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
      begin
         str := Format(
            'Exclusão horário [%d]: %s; Hr Início: %s; Hr Fim: %s; Turno: %s; Categoria: %s; Chave: %s',
            [
               tblHorarioscodigo.AsInteger,
               tblHorariosds_horario.AsString, tblHorarioshr_inicio.AsString,
               tblHorarioshr_fim.AsString, tblHorariosDS_TURNO.AsString,
               tblHorariosds_categoria.AsString, tblHorariosds_chave.AsString
            ]
         );
         chave := tblHorarioscodigo.AsString;

         tblHorarios.Delete;

         DM.setLog(1025, 'Exclusão', chave, 0, str);
      end;
   end;
end;

procedure Tfrm_Horarios.btnFecharClick(Sender: TObject);
begin
   tblHorarios.Close;
   tblHorarios.Open;
   Close;
end;

procedure Tfrm_Horarios.btnInserirClick(Sender: TObject);
begin
   DBEdit2.SetFocus;
   tblHorarios.Insert;
end;

procedure Tfrm_Horarios.btnAlterarClick(Sender: TObject);
begin
   DBEdit2.SetFocus;
   tblHorarios.Edit;
   Self.tblTurnos.Locate('codigo', tblHorarios.FieldByName('turno').AsString, [loCaseInsensitive]);
end;

procedure Tfrm_Horarios.btnCancelarClick(Sender: TObject);
begin
   tblHorarios.Cancel;
end;

procedure Tfrm_Horarios.dsHorariosDataChange(Sender: TObject; Field: TField);
begin
   if tblHorarios.State = dsBrowse then
      LocateHourly(tblHorarioshr_inicio.AsDateTime, tblHorarioshr_fim.AsDateTime);
end;

procedure Tfrm_Horarios.dsHorariosStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblHorarios.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblHorarios.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblHorarios.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblHorarios.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblHorarios.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblHorarios.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_Horarios.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblHorarios, pmQtd);
end;

procedure Tfrm_Horarios.tblHorariosAfterPost(DataSet: TDataSet);
begin

   tblHorarios.Close();
   tblHorarios.Open();

end;

procedure Tfrm_Horarios.tblHorariosBeforePost(DataSet: TDataSet);
begin
   if tblHorarios.State IN [dsInsert] then
   begin
      tblHorariosdt_cadastro.AsDateTime := DM.DataAtual;
      tblHorariossn_ativo.AsInteger := 1;
   end;
end;

procedure Tfrm_Horarios.tblHorarioshr_fimChange(Sender: TField);
begin
   LocateHourly(tblHorarioshr_inicio.AsDateTime, tblHorarioshr_fim.AsDateTime);
end;

procedure Tfrm_Horarios.tblHorarioshr_inicioChange(Sender: TField);
begin
   LocateHourly(tblHorarioshr_inicio.AsDateTime, tblHorarioshr_fim.AsDateTime);
end;

procedure Tfrm_Horarios.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
begin
   if (Direction in [updUp, updDown]) AND not (tblHorarios.State IN [dsInsert, dsEdit]) then
   begin
      tblHorarios.Edit();
   end;   

   if Direction = updUp then
   begin
      tblHorariosqtd_aulas.AsInteger := tblHorariosqtd_aulas.AsInteger+1;
   end
   else if Direction = updDown then
   begin
      tblHorariosqtd_aulas.AsInteger := tblHorariosqtd_aulas.AsInteger-1;
   end;   
end;

procedure Tfrm_Horarios.btnSalvarClick(Sender: TObject);
var
   tipo, str, chave: String;
begin
   chave := '';

   grd.SetFocus();

   if tblHorarios.State = dsInsert then
   begin
      tipo := 'Inclusão';
      str := Format(
         'Inclusão horário [%d]: %s; Hr Início: %s; Hr Fim: %s; Turno: %s; Categoria: %s; Chave: %s',
         [
            tblHorarioscodigo.AsInteger,
            tblHorariosds_horario.AsString, tblHorarioshr_inicio.AsString,
            tblHorarioshr_fim.AsString, tblHorariosDS_TURNO.AsString,
            tblHorariosds_categoria.AsString, tblHorariosds_chave.AsString
         ]
      );
   end else if tblHorarios.State = dsEdit then
   begin
      chave := tblHorarioscodigo.AsString;
      tipo := 'Alteração';
      str := Format(
         'Alteração horário [%d]: %s; Hr Início: %s; Hr Fim: %s; Turno: %s; Categoria: %s; Chave: %s',
         [
            tblHorarioscodigo.AsInteger,
            tblHorariosds_horario.AsString, tblHorarioshr_inicio.AsString,
            tblHorarioshr_fim.AsString, tblHorariosDS_TURNO.AsString,
            tblHorariosds_categoria.AsString, tblHorariosds_chave.AsString
         ]
      );
   end;

   tblHorarios.Post;

   if chave = '' then
      chave := IntToStr(DM.LastInsert);

   DM.setLog(1025, tipo, chave, 0, str);
end;

end.

