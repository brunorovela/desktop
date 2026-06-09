unit uParametros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, md5, Menus;

type
  Parametros = (NaoDefinido, Academico, Biblioteca, Configuracao, DadosCliente, ExtraCurriculares, Financeiro, Geral, LeitoraGabarito, TerminalAcesso, VestibularEstatisticas);

  TfrmParametros = class(TForm)
    Panel3: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    DBNavigator1: TDBNavigator;
    dsParam: TDataSource;
    tblParam: TQuery;
    tblParamds_variavel: TStringField;
    tblParamsn_restrito: TStringField;
    tblParamds_variavel_usuario: TMemoField;
    qyCategorias: TQuery;
    srcCategorias: TDataSource;
    tblParamcd_categoria: TIntegerField;
    tblParamds_categoria: TStringField;
    Panel1: TPanel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel3: TBevel;
    Bevel7: TBevel;
    tblParamcd_tipo: TSmallintField;
    GroupBox1: TGroupBox;
    bdeDs_valor: TEdit;
    rgDs_Valor: TRadioGroup;
    anosemDs_Valor: TMaskEdit;
    udAnoSemestre: TUpDown;
    tblParamvalor_grade: TStringField;
    DBText1: TDBText;
    Bevel2: TBevel;
    Bevel4: TBevel;
    DBText2: TDBText;
    Bevel6: TBevel;
    DBMemo1: TDBMemo;
    Bevel8: TBevel;
    DBText3: TDBText;
    Label4: TLabel;
    tblParamds_tipo: TStringField;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    pmPorCategoria: TPopupMenu;
    qyCategoriascd_categoria: TIntegerField;
    qyCategoriasds_categoria: TStringField;
    tblParamds_valor: TMemoField;
    procedure FormDestroy(Sender: TObject);
    procedure ItemClick(Sender: TObject);
    procedure qyCategoriasAfterOpen(DataSet: TDataSet);
    procedure ToolButton3Click(Sender: TObject);
    procedure bdeDs_valorKeyPress(Sender: TObject; var Key: Char);
    procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure rgDs_ValorEnter(Sender: TObject);
    procedure bdeDs_valorEnter(Sender: TObject);
    procedure tblParamBeforePost(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure dsParamDataChange(Sender: TObject; Field: TField);
    procedure dsParamStateChange(Sender: TObject);
    procedure bdeDs_variavelKeyPress(Sender: TObject; var Key: Char);
    procedure bdeDs_variavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblParamCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    item_anterior : TMenuItem;
    filtros : string;
    podeAlterar : boolean;
    tipoParametros : Parametros;
  public
    { Public declarations }
    procedure Filtra(tipo:Parametros; DataBaseName, SessionName : string; permAlterar : boolean);
  end;

var
  frmParametros: TfrmParametros;

implementation

uses uDM;

{$R *.DFM}

procedure TfrmParametros.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParametros.btnAlterarClick(Sender: TObject);
begin
  tblParam.Edit;
end;

procedure TfrmParametros.btnSalvarClick(Sender: TObject);
var
  local : Pointer;
begin

  tblParam.Post;

  local := tblParam.GetBookmark;
  tblParam.Close;
  tblParam.Open;
  tblParam.GotoBookmark(local);
end;

procedure TfrmParametros.btnCancelarClick(Sender: TObject);
begin
  tblParam.Cancel;
end;

procedure TfrmParametros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tblParam.Close;
   qyCategorias.Close;
   Action := caFree;
end;

procedure TfrmParametros.FormDestroy(Sender: TObject);
begin
   frmParametros := nil;
end;

procedure TfrmParametros.btnFecharClick(Sender: TObject);
begin
  tblParam.Close;

  Close;
end;

procedure TfrmParametros.dsParamDataChange(Sender: TObject; Field: TField);
begin
  bdeDs_valor.Enabled := podeAlterar AND (tblParam.FieldByName('cd_tipo').AsInteger in [0,1,3,4,5,7,8,9]);
  rgDs_Valor.Enabled := podeAlterar AND (tblParam.FieldByName('cd_tipo').AsInteger = 2);
  anosemDs_Valor.Enabled := podeAlterar AND (tblParam.FieldByName('cd_tipo').AsInteger = 6);
  udAnoSemestre.Enabled := podeAlterar AND (tblParam.FieldByName('cd_tipo').AsInteger = 6);
  

  case tblParam.FieldByName('cd_tipo').AsInteger of

    2 : begin
      if UpperCase(tblParam.FieldByName('ds_valor').AsString) = 'S' then
        rgDs_Valor.ItemIndex := 0
      else if UpperCase(tblParam.FieldByName('ds_valor').AsString) = 'N' then
        rgDs_Valor.ItemIndex := 1;
    end;

    4, 5 : bdeDs_valor.PasswordChar := '*';

    6 : anosemDs_Valor.Text := tblParam.FieldByName('ds_valor').AsString;

    else bdeDs_valor.PasswordChar := #0;

  end;

  bdeDs_valor.Text := tblParam.FieldByName('ds_valor').AsString;

end;

procedure TfrmParametros.dsParamStateChange(Sender: TObject);
begin
  DBNavigator1.Enabled := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled := podeAlterar AND (TDataSource( Sender ).State in [dsBrowse]);
  btnSalvar.Enabled := podeAlterar AND (TDataSource( Sender ).State in [dsEdit, dsInsert]);
  btnCancelar.Enabled := podeAlterar AND (TDataSource( Sender ).State in [dsEdit, dsInsert]);
end;

procedure TfrmParametros.bdeDs_variavelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure TfrmParametros.bdeDs_variavelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN : SelectNext( TWinControl( Sender ), True, True );
    VK_UP : SelectNext( TWinControl( Sender ), False, True );
  end;
end;

procedure TfrmParametros.tblParamCalcFields(DataSet: TDataSet);
begin

  case tblParam.FieldByName('cd_tipo').AsInteger of
    0 : tblParam.FieldByName('ds_tipo').AsString := 'Texto';
    1 : tblParam.FieldByName('ds_tipo').AsString := 'Número';
    2 : tblParam.FieldByName('ds_tipo').AsString := 'Sim ou Não';
    3 : tblParam.FieldByName('ds_tipo').AsString := 'Apenas uma letra';
    4 : tblParam.FieldByName('ds_tipo').AsString := 'Texto cript. (pode-se escrever qualquer coisa)';
    5 : tblParam.FieldByName('ds_tipo').AsString := 'Senha (pode-se escrever qualquer coisa)';
    6 : tblParam.FieldByName('ds_tipo').AsString := 'Ano/Semestre';
    7 : tblParam.FieldByName('ds_tipo').AsString := 'Data';
    8 : tblParam.FieldByName('ds_tipo').AsString := 'Hora';
    9 : tblParam.FieldByName('ds_tipo').AsString := 'Data e Hora';
    else tblParam.FieldByName('ds_tipo').AsString := 'Tipo desconhecido !!!';
  end;

  case tblParam.FieldByName('cd_tipo').AsInteger of

    4, 5 : tblParam.FieldByName('valor_grade').AsString := '********************************';

    else tblParam.FieldByName('valor_grade').AsString := tblParam.FieldByName('ds_valor').AsString;

  end;

end;

procedure TfrmParametros.tblParamBeforePost(DataSet: TDataSet);
begin

  case tblParam.FieldByName('cd_tipo').AsInteger of

    1 : begin
      if Length(bdeDs_valor.Text) > 0 then begin
        try
          tblParam.FieldByName('ds_valor').AsInteger := StrToInt(bdeDs_valor.Text);
        except
          tblParam.FieldByName('ds_valor').AsString := tblParam.FieldByName('valor_grade').AsString;
          Mensagem('Esta parâmetro deve possuir um valor numérico !', Application.Title, MB_OK+MB_ICONEXCLAMATION);
        end;
      end
      else begin
        tblParam.FieldByName('ds_valor').AsString := bdeDs_valor.Text;
      end;
    end;

    2 : begin
      if rgDs_Valor.ItemIndex = 0 then
        tblParam.FieldByName('ds_valor').AsString := 'S'
      else if rgDs_Valor.ItemIndex = 1 then
        tblParam.FieldByName('ds_valor').AsString := 'N';
    end;

    3 : begin
      if Length(bdeDs_valor.Text) > 1 then begin
        tblParam.FieldByName('ds_valor').AsString := tblParam.FieldByName('valor_grade').AsString;
        Mensagem('Esta parâmetro deve possuir em seu valor apenas uma letra !', Application.Title, MB_OK+MB_ICONEXCLAMATION);
      end
      else
        tblParam.FieldByName('ds_valor').AsString := bdeDs_valor.Text;
    end;

    4 : begin
      if tblParam.FieldByName('ds_valor').AsString <> bdeDs_valor.Text then
        tblParam.FieldByName('ds_valor').AsString := MD5Print(MD5String(bdeDs_valor.Text));
    end;

    6 : begin
      tblParam.FieldByName('ds_valor').AsString := anosemDs_Valor.Text;
    end;

    7 : begin
      if Length(bdeDs_valor.Text) > 0 then begin
        try
          tblParam.FieldByName('ds_valor').AsString := FormatDateTime('dd/mm/yyyy',StrToDateTime(bdeDs_valor.Text));
        except
          tblParam.FieldByName('ds_valor').AsString := tblParam.FieldByName('valor_grade').AsString;
          Mensagem('Esta parâmetro deve possuir uma data !', Application.Title, MB_OK+MB_ICONEXCLAMATION);
        end;
      end
      else begin
        tblParam.FieldByName('ds_valor').AsString := bdeDs_valor.Text;
      end;
    end;

    8 : begin
      if Length(bdeDs_valor.Text) > 0 then begin
        try
          tblParam.FieldByName('ds_valor').AsString := FormatDateTime('hh:MM:ss',StrToDateTime(bdeDs_valor.Text));
        except
          tblParam.FieldByName('ds_valor').AsString := tblParam.FieldByName('valor_grade').AsString;
          Mensagem('Esta parâmetro deve possuir uma hora !', Application.Title, MB_OK+MB_ICONEXCLAMATION);
        end;
      end
      else begin
        tblParam.FieldByName('ds_valor').AsString := bdeDs_valor.Text;
      end;
    end;

    9 : begin
      if Length(bdeDs_valor.Text) > 0 then begin
        try
          tblParam.FieldByName('ds_valor').AsString := FormatDateTime('dd/mm/yyyy hh:MM:ss',StrToDateTime(bdeDs_valor.Text));
        except
          tblParam.FieldByName('ds_valor').AsString := tblParam.FieldByName('valor_grade').AsString;
          Mensagem('Esta parâmetro deve possuir uma data e hora !', Application.Title, MB_OK+MB_ICONEXCLAMATION);
        end;
      end
      else begin
        tblParam.FieldByName('ds_valor').AsString := bdeDs_valor.Text;
      end;
    end;

    else begin
      tblParam.FieldByName('ds_valor').AsString := bdeDs_valor.Text;
    end;

  end;

end;

procedure TfrmParametros.bdeDs_valorEnter(Sender: TObject);
begin
  if (not (tblParam.State in [dsEdit,dsInsert])) AND (tblParam.Active) then
    tblParam.Edit;
end;

procedure TfrmParametros.rgDs_ValorEnter(Sender: TObject);
begin
  if not (tblParam.State in [dsEdit,dsInsert]) then
    tblParam.Edit;
end;

procedure TfrmParametros.udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
begin

  if not (tblParam.State in [dsEdit,dsInsert]) then
    tblParam.Edit;

  if Button = btNext then
  begin
     anosemDs_Valor.text := DM.incrementar_ano_semestre(anosemDs_Valor.Text);
  end
  else
  begin
    anosemDs_Valor.text := DM.decrementar_ano_semestre(anosemDs_Valor.Text);
  end;

end;

procedure TfrmParametros.bdeDs_valorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (tblParam.State in [dsEdit,dsInsert]) then
    tblParam.Edit;
end;

procedure TfrmParametros.ToolButton3Click(Sender: TObject);
var
  pt : TPoint;
begin
  GetCursorPos(pt);

  pmPorCategoria.Popup(pt.X,pt.Y);
end;

procedure TfrmParametros.qyCategoriasAfterOpen(DataSet: TDataSet);
var
  item : TMenuItem;
begin

  with qyCategorias do begin
    First();
    while not Eof do begin
      item := TMenuItem.Create(pmPorCategoria);
      item.Name := 'cat_'+FieldByName('cd_categoria').AsString;
      item.Caption := FieldByName('ds_categoria').AsString;
      item.OnClick := ItemClick;

      pmPorCategoria.Items.Add(item);

      Next();
    end;
  end;

  item := TMenuItem.Create(pmPorCategoria);
  item.Name := 'N1';
  item.Caption := '-';
  pmPorCategoria.Items.Add(item);

  item := TMenuItem.Create(pmPorCategoria);
  item.Name := 'cat_todas';
  item.Caption := 'Todas';
  item.OnClick := ItemClick;
  item.Checked := True;
  pmPorCategoria.Items.Add(item);
  item_anterior := item;
  
end;

procedure TfrmParametros.ItemClick(Sender: TObject);
var
  item : TMenuItem;
  cd_categoria : integer;
begin
  if item_anterior <> nil then item_anterior.Checked := False;

  item := TMenuItem(Sender);

  item.Checked := True;
  if item.Name = 'cat_todas' then begin
    with tblParam do begin
      Close();
      SQL.Text := 'SELECT * FROM parametros WHERE sn_restrito = ''N'' AND '+filtros+' ORDER BY ds_variavel';
      Open();
    end;
  end
  else begin
    cd_categoria := StrToInt(copy(item.Name,5));

    with tblParam do begin
      Close();
      SQL.Text := 'SELECT * FROM parametros WHERE sn_restrito = ''N'' AND '+filtros+' AND cd_categoria = :cd_categoria ORDER BY ds_variavel';
      ParamByName('cd_categoria').AsInteger := cd_categoria;
      Open();
    end;
  end;

  item_anterior := item;
end;

procedure TfrmParametros.Filtra(tipo:Parametros; DataBaseName, SessionName : string; permAlterar : boolean);
begin

  tipoParametros := tipo;
  podeAlterar := permAlterar;

  if (DataBaseName <> '') AND (SessionName <> '') then begin
    tblParam.DatabaseName := DataBaseName;
    tblParam.SessionName := SessionName;

    qyCategorias.DatabaseName := DataBaseName;
    qyCategorias.SessionName := SessionName;
  end;

  filtros := '1 = 1';

  case tipoParametros of
    Academico              : filtros := 'cd_categoria = 15';
    Biblioteca             : filtros := 'cd_categoria = 10';
    DadosCliente           : filtros := 'cd_categoria = 3';
    ExtraCurriculares      : filtros := 'cd_categoria = 14';
    Financeiro             : filtros := 'cd_categoria = 16';
    Geral                  : filtros := 'cd_categoria = 1';
    LeitoraGabarito        : filtros := 'cd_categoria = 13';
    TerminalAcesso         : filtros := 'cd_categoria = 12';
    VestibularEstatisticas : filtros := '1 = 2';
  end;

  filtros := filtros + ' ';

  with qyCategorias do begin
    Close();
    SQL.Text := ' ' +
      'SELECT ' +
      '  * ' +
      'FROM ' +
      '  parametros_categorias ' +
      'WHERE ' +
         filtros +
      'ORDER BY ' +
      '  ds_categoria ';
    Open();
  end;

  with tblParam do begin
    Close();
    SQL.Text := ' ' +
      'SELECT ' +
      '  * ' +
      'FROM ' +
      '  parametros ' +
      'WHERE ' +
      '  sn_restrito = ''N'' AND ' +
         filtros +
      'ORDER BY ' +
      '  ds_variavel ';
    Open();
  end;

  if not podeAlterar then
    Mensagem('Você não tem permissão para fazer alterações nos parâmetros.'+chr(13)+'Por isso os campos de valor estarão sempre inativos.', Application.Title, MB_OK+MB_ICONINFORMATION);

end;

end.
