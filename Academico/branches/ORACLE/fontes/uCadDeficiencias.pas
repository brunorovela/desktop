unit uCadDeficiencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, Grids, DBGrids, ExtCtrls, StdCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmCadDeficiencias = class(TForm)
    bvInfoPessoa: TBevel;
    lbInfoPessoa: TLabel;
    lbPessoa: TLabel;
    lbAjuda: TLabel;
    pnTopo: TPanel;
    tblDeficiencias: TUMZQuery;
    dtcDeficiencias: TDataSource;
    pmQtd: TPopupMenu;
    grdDeficiencias: TDBGrid;
    tblDeficienciascd_pessoa_deficiencia: TIntegerField;
    tblDeficienciascd_situacao: TIntegerField;
    tblDeficienciasds_valor: TStringField;
    tblDeficienciassn_portador: TStringField;
    procedure grdDeficienciasCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grdDeficienciasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    //procedure grdDeficienciasDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoAluno : Longint;
  end;

var
  frmCadDeficiencias: TfrmCadDeficiencias;

implementation

  uses Main, uUsuario, uDM, General;


{$R *.dfm}

procedure TfrmCadDeficiencias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3 : grdDeficienciasCellClick( nil );
    VK_F4 : grdDeficienciasCellClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure TfrmCadDeficiencias.FormShow(Sender: TObject);
begin
  tblDeficiencias.Close;
  tblDeficiencias.ParamByName('cd_pessoa').AsInteger := CodigoAluno;
  tblDeficiencias.Open;
end;

procedure TfrmCadDeficiencias.grdDeficienciasCellClick(Column: TColumn);
Var
   qDeficientes           : TUMZQuery;
   cd_situacao            : integer;
   cd_pessoa_deficiencia  : integer;
   linhaseleciionada : pointer;
begin
   
  //Inicia as variáveis
  qDeficientes            := nil;
  cd_situacao             := 0;
  cd_pessoa_deficiencia   := 0;

  if not DM.UsuarioLogado.TemPermissao( 1056, npAcesso, True ) then Exit;

    if CodigoAluno <> 0 then
    begin

      //Recupera o código cd_situacao do défite da pessoa na tabela de situações
      cd_situacao           := tblDeficiencias.FieldByName('cd_situacao').AsInteger;

      //Procura a pessoa selecionada na tabela de portadores de necessidades especiais
      DM.CriarConsulta(qDeficientes);
      qDeficientes.Close;
      qDeficientes.SQL.Text := 'SELECT * FROM pessoas_deficiencias WHERE cd_pessoa = :cd_pessoa AND cd_deficiencia = :cd_deficiencia';
      qDeficientes.ParamByName('cd_pessoa').Value       := CodigoAluno;
      qDeficientes.ParamByName('cd_deficiencia').Value  := cd_situacao;
      qDeficientes.Open;

      //Verifica se existe algum registro desse aluno na tabela de pessoas_deficiencias
      if ( qDeficientes.RecordCount = 1) then
      begin
        //Permissão para apagar registro
        if not DM.UsuarioLogado.TemPermissao( 1056, npExcluir, True ) then Exit;

        if Mensagem('Você realmente deseja desmarcar o item selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin

          //Apaga o registro da tabela de pessoas portadoras de necessidades especiais
          cd_pessoa_deficiencia := tblDeficiencias.FieldByName('cd_pessoa_deficiencia').AsInteger;

          linhaseleciionada := tblDeficiencias.GetBookmark();
          qDeficientes.Close;
          qDeficientes.SQL.Text := 'DELETE FROM pessoas_deficiencias WHERE cd_pessoa_deficiencia = :cd_pessoa_deficiencia';
          qDeficientes.ParamByName('cd_pessoa_deficiencia').Value  := cd_pessoa_deficiencia;
          qDeficientes.ExecSQL;
        end;
      end
      else if (qDeficientes.RecordCount = 0) then
      begin
        //Permissão para apagar registro
        if not DM.UsuarioLogado.TemPermissao( 1056, npAlterar, True ) then Exit;

        //Adiciona um registro na tabela de portadores de necessidades especiais
        try
           linhaseleciionada := tblDeficiencias.GetBookmark();
           qDeficientes.Close;
           qDeficientes.SQL.Text := 'INSERT INTO pessoas_deficiencias (cd_pessoa, cd_deficiencia) VALUES (:cd_pessoa, :cd_deficiencia)';
           qDeficientes.ParamByName('cd_pessoa').Value       := CodigoAluno;
           qDeficientes.ParamByName('cd_deficiencia').Value  := cd_situacao;
           qDeficientes.ExecSQL;
        except on E: Exception do
        end;


        //Pega o ID criado recentemente para não perder a seleção
        qDeficientes.Close;
        if (DM.db.Protocol = DB_PROTOCOL_MYSQL) then
        begin
           qDeficientes.SQL.Text := 'SELECT LAST_INSERT_ID() AS cd_pessoa_deficiencia';
        end
        else
        begin
           qDeficientes.SQL.Text := 'SELECT LAST_INSERT_ID() AS cd_pessoa_deficiencia FROM dual';
        end;
        qDeficientes.Open;
        cd_pessoa_deficiencia := qDeficientes.FieldByName('cd_pessoa_deficiencia').AsInteger;
      end
      else
      begin
        Mensagem('Não foi possivel executar a ação porque a seleção está trazendo mais de um registro.', 'Aviso', MB_OK + MB_ICONINFORMATION);
      end;

      //Libera objeto da memória
      qDeficientes.Close;
      FreeAndNil( qDeficientes );

      //Atualiza a listagem fechando e abrindo novamente a tabela.
      tblDeficiencias.close;
      tblDeficiencias.ParamByName('cd_pessoa').AsInteger := CodigoAluno;
      tblDeficiencias.open;

      {Quando é desmarcado um item ele pega a linha selecionada e volta pra mesma}
      if linhaseleciionada <> nil then
      begin
         tblDeficiencias.GotoBookmark(linhaseleciionada);
      end;
      tblDeficiencias.Locate('cd_pessoa_deficiencia', cd_pessoa_deficiencia, [loCaseInsensitive]);

    end
    else
    begin
       Mensagem('Nenhuma pessoa foi selecionada!','Atenção', MB_OK + MB_ICONINFORMATION);
    end;
end;
{
procedure TfrmCadDeficiencias.grdDeficienciasDblClick(Sender: TObject);
Var
   qDeficientes           : TUMZQuery;
   cd_situacao            : integer;
   cd_pessoa_deficiencia  : integer;
begin

  //Inicia as variáveis
  qDeficientes            := nil;
  cd_situacao             := 0;
  cd_pessoa_deficiencia   := 0;

  if not DM.UsuarioLogado.TemPermissao( 1056, npAcesso, True ) then Exit;

    if CodigoAluno <> 0 then
    begin

      //Recupera o código cd_situacao do défite da pessoa na tabela de situações
      cd_situacao           := tblDeficiencias.FieldByName('cd_situacao').AsInteger;

      //Procura a pessoa selecionada na tabela de portadores de necessidades especiais
      DM.CriarConsulta(qDeficientes);
      qDeficientes.Close;
      qDeficientes.SQL.Text := 'SELECT * FROM pessoas_deficiencias WHERE cd_pessoa = :cd_pessoa AND cd_deficiencia = :cd_deficiencia';
      qDeficientes.ParamByName('cd_pessoa').Value       := CodigoAluno;
      qDeficientes.ParamByName('cd_deficiencia').Value  := cd_situacao;
      qDeficientes.Open;

      //Verifica se existe algum registro desse aluno na tabela de pessoas_deficiencias
      if ( qDeficientes.RecordCount = 1) then
      begin
        //Permissão para apagar registro
        if not DM.UsuarioLogado.TemPermissao( 1056, npExcluir, True ) then Exit;

        if Mensagem('Você realmente deseja desmarcar o item selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin

          //Apaga o registro da tabela de pessoas portadoras de necessidades especiais
          cd_pessoa_deficiencia := tblDeficiencias.FieldByName('cd_pessoa_deficiencia').AsInteger;
          
          qDeficientes.Close;
          qDeficientes.SQL.Text := 'DELETE FROM pessoas_deficiencias WHERE cd_pessoa_deficiencia = :cd_pessoa_deficiencia';
          qDeficientes.ParamByName('cd_pessoa_deficiencia').Value  := cd_pessoa_deficiencia;
          qDeficientes.ExecSQL;
        end;
      end
      else if (qDeficientes.RecordCount = 0) then
      begin
        //Permissão para apagar registro
        if not DM.UsuarioLogado.TemPermissao( 1056, npAlterar, True ) then Exit;

        //Adiciona um registro na tabela de portadores de necessidades especiais
        try
           qDeficientes.Close;
           qDeficientes.SQL.Text := 'INSERT INTO pessoas_deficiencias (cd_pessoa, cd_deficiencia) VALUES (:cd_pessoa, :cd_deficiencia)';
           qDeficientes.ParamByName('cd_pessoa').Value       := CodigoAluno;
           qDeficientes.ParamByName('cd_deficiencia').Value  := cd_situacao;
           qDeficientes.ExecSQL;
        except on E: Exception do
        end;


        //Pega o ID criado recentemente para não perder a seleção
        qDeficientes.Close;
        if (DM.db.Protocol = DB_PROTOCOL_MYSQL) then
        begin
           qDeficientes.SQL.Text := 'SELECT LAST_INSERT_ID() AS cd_pessoa_deficiencia';
        end
        else
        begin
           qDeficientes.SQL.Text := 'SELECT LAST_INSERT_ID() AS cd_pessoa_deficiencia FROM dual';
        end;
        qDeficientes.Open;
        cd_pessoa_deficiencia := qDeficientes.FieldByName('cd_pessoa_deficiencia').AsInteger;
      end
      else
      begin
        Mensagem('Não foi possivel executar a ação porque a seleção está trazendo mais de um registro.', 'Aviso', MB_OK + MB_ICONINFORMATION);
      end;

      //Libera objeto da memória
      qDeficientes.Close;
      FreeAndNil( qDeficientes );

      //Atualiza a listagem fechando e abrindo novamente a tabela.
      tblDeficiencias.close;
      tblDeficiencias.ParamByName('cd_pessoa').AsInteger := CodigoAluno;
      tblDeficiencias.open;

      tblDeficiencias.Locate('cd_pessoa_deficiencia', cd_pessoa_deficiencia, [loPartialKey]);
    end
    else
    begin
       Mensagem('Nenhuma pessoa foi selecionada!','Atenção', MB_OK + MB_ICONINFORMATION);
    end;
end;
 }
procedure TfrmCadDeficiencias.grdDeficienciasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRectangle : TRect;
begin
  if Column.FieldName = 'sn_portador' then
  begin
    Self.grdDeficiencias.Canvas.FillRect(Rect);
    CheckBoxRectangle.Left := Rect.Left + 2;
    CheckBoxRectangle.Right := Rect.Right - 2;
    CheckBoxRectangle.Top := Rect.Top + 2;
    CheckBoxRectangle.Bottom := Rect.Bottom - 2;
    DrawFrameControl(Self.grdDeficiencias.Canvas.Handle, CheckBoxRectangle, DFC_BUTTON, CtrlState[(Column.Field.AsString = '1')]);
  end;

end;

procedure TfrmCadDeficiencias.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.


