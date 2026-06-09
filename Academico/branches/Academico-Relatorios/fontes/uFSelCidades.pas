unit uFSelCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, ImgList, ComCtrls, ToolWin,
  ZAbstractRODataset, UZDataset;

const
   // Array que é acessado usando o Type "TUMSqlConsulta"
   TUMListaSqlCidades : array[1..2] of String = (

      // Todos os estados, somente tabela estados
      ' SELECT DISTINCT e.ds_estado AS uf, m.cd_municipio AS codigo, m.ds_municipio AS descricao ' +
      ' FROM estados e ' +
      '      INNER JOIN municipios m ON ( m.cd_estado = e.cd_mec ) ' +
      ' [$condicao$] ' +
      ' ORDER BY e.ds_estado, m.ds_municipio ',

      // Somente estados de coligadas existentes
      ' SELECT DISTINCT e.ds_estado AS uf, m.cd_municipio AS codigo, m.ds_municipio AS descricao ' +
      ' FROM coligadas c ' +
      '      INNER JOIN estados e ON ( e.ds_uf = c.ds_estado ) ' +
      '      INNER JOIN municipios m ON ( m.cd_estado = e.cd_mec AND m.ds_municipio = c.ds_cidade ) ' +
      ' [$condicao$] ' +
      ' ORDER BY e.ds_estado, m.ds_municipio '

   );

type
   TUMSqlConsultaCidades = (sccPadrao = 1, sccFromColigadas = 2);

  TfrmSelCidades = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnMarcarTodos: TToolButton;
    btnDesmarcarTodos: TToolButton;
    ToolButton3: TToolButton;
    btnSalvar: TToolButton;
    ToolButton2: TToolButton;
    btnFechar: TToolButton;
    ToolButton4: TToolButton;
    ilToolBar: TImageList;
    clbCidades: TCheckListBox;
    paCabecalho: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
  private
    { Private declarations }
    FListaEstadosSelecionadas: TStringList;

    procedure CarregarRegistros(var listaRegistros: TUMZReadOnlyQuery);
    procedure CarregarSelecionados(selecionados: String);
    procedure MarcarTodos();
    procedure DesmarcarTodos();
  public
    { Public declarations }
    Filtrar: Boolean;
    
    procedure CarregaTelaFiltro( condicao: String; selecionados: String = '';
         TipoConsulta: TUMSqlConsultaCidades = sccPadrao );

    // Esta função recupera todas cidades filtradas pelo nome
    // ex: 'Blumenau, Indaial'
    function GetStrCidadesSelecionadas(sem_aspas: boolean = False): String;
    // Esta função recupera todas cidades filtradas pelo código
    // Criada para ser utilizada em filtros, NUNCA utilizar nos sql's
    // a função por NOME.
    // Ex: '1, 2, 3'
    function GetIntCidadesSelecionadas(): String;
  end;

var
  frmSelCidades: TfrmSelCidades;

implementation

uses uDM, General, uItemCombo;

{$R *.dfm}

procedure TfrmSelCidades.btnDesmarcarTodosClick(Sender: TObject);
begin
   DesmarcarTodos();
end;

procedure TfrmSelCidades.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmSelCidades.btnMarcarTodosClick(Sender: TObject);
begin
   MarcarTodos();
end;

procedure TfrmSelCidades.btnSalvarClick(Sender: TObject);
begin
   Filtrar := True;
   Close();
end;

procedure TfrmSelCidades.CarregarRegistros(var listaRegistros: TUMZReadOnlyQuery);
begin
   while not listaRegistros.Eof do
   begin
      clbCidades.AddItem(
         listaRegistros.FieldByName( 'uf' ).AsString + ' - ' +
         listaRegistros.FieldByName( 'descricao' ).AsString,
         TItemCombo.Create(
            listaRegistros.FieldByName( 'codigo' ).AsString,
            listaRegistros.FieldByName( 'descricao' ).AsString
         )
      );
                                                                                 
      listaRegistros.Next;
   end;
end;

procedure TfrmSelCidades.CarregarSelecionados(selecionados: String);
var
   arrSelecionados: TStringList;
   I: Integer;
begin
   arrSelecionados := TStringList.Create;
   SplitString(selecionados, ',', arrSelecionados);

   if ( clbCidades.Items.Count > 0 ) then
   begin
      for I := 0 to clbCidades.Items.Count - 1 do
      begin
         // Recebe TRUE caso o código do estado esteja no array "arrSelecionados"
         clbCidades.Checked[ I ] := ( arrSelecionados.IndexOf( TItemCombo( clbCidades.Items.Objects[ I ] ).codigo ) > -1 );
      end;
   end;
end;

procedure TfrmSelCidades.CarregaTelaFiltro(condicao: String; selecionados: String;
      TipoConsulta: TUMSqlConsultaCidades);
var
   qyListaCidades: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyListaCidades);
   qyListaCidades.SQL.Text := TUMListaSqlCidades[ Ord( TipoConsulta ) ];

   condicao := Trim( condicao );
   if ( Length( condicao ) > 0 ) then
   begin
      condicao := 'WHERE e.ds_uf IN (' + condicao + ')';
   end;
   qyListaCidades.SQL.Text := StringReplace( qyListaCidades.SQL.Text, '[$condicao$]', condicao, [] );

   qyListaCidades.Open();

   // Se tem registro
   if not qyListaCidades.Eof then
   begin
      CarregarRegistros( qyListaCidades );

      // Carrega os registros já selecionados
      CarregarSelecionados( selecionados );
   end;

   FreeAndNil( qyListaCidades );

   Self.ShowModal;
end;

procedure TfrmSelCidades.DesmarcarTodos;
var
   I: Integer;
begin
   for I := 0 to clbCidades.Items.Count - 1 do
      clbCidades.Checked[I] := False;
end;

procedure TfrmSelCidades.FormShow(Sender: TObject);
begin
   Filtrar := False;
end;

function TfrmSelCidades.GetIntCidadesSelecionadas(): String;
var
   I: Integer;
   Separador: String;
begin
   Result := '';
   Separador := '';

   for I := 0 to clbCidades.Items.Count - 1 do
   begin
      if clbCidades.Checked[I] then
      begin
         Result := Result + Separador + TItemCombo( clbCidades.Items.Objects[I] ).codigo;
         Separador := ',';
      end;
   end;
end;

function TfrmSelCidades.GetStrCidadesSelecionadas(sem_aspas: boolean): String;
var
   I: Integer;
   Separador: String;
begin
   Result := '';
   Separador := '';

   for I := 0 to clbCidades.Items.Count - 1 do
   begin
      if clbCidades.Checked[I] then
      begin
         if ( not sem_aspas ) then
            Result := Result + Separador + QuotedStr( TItemCombo( clbCidades.Items.Objects[I] ).descricao )
         else
            Result := Result + Separador + TItemCombo( clbCidades.Items.Objects[I] ).descricao;
         
         Separador := ',';
      end;
   end;
end;

procedure TfrmSelCidades.MarcarTodos;
var
   I: Integer;
begin
   for I := 0 to clbCidades.Items.Count - 1 do
      clbCidades.Checked[I] := True;
end;

end.
