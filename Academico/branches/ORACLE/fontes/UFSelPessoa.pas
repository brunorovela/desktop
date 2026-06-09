unit UFSelPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset;

type
  TFSelPessoa = class(TForm)
    pnlTitulo: TPanel;
    pnlPrincipal: TPanel;
    bvlSep2: TBevel;
    pnlRodaPe: TPanel;
    bvlSep1: TBevel;
    pnlGrid: TPanel;
    bvlSep3: TBevel;
    pnlTop: TPanel;
    dbgPessoa: TDBGrid;
    ledCodigo: TLabeledEdit;
    ledNome: TLabeledEdit;
    sbSelecione: TSpeedButton;
    sbFechar: TSpeedButton;
    qryPessoas: TUMZQuery;
    dsPessoas: TDataSource;
    qryPessoasCD_PESSOA: TIntegerField;
    qryPessoasNM_PESSOA: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgPessoaTitleClick(Column: TColumn);
    procedure dbgPessoaDblClick(Sender: TObject);
    procedure sbSelecioneClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure addPessoaColigada(ICodPessoa : integer);
    procedure filtrar();
  public
    { Public declarations }
  end;
const
   SqlOrigem =
   'SELECT                                                            '+
   '  p.CD_PESSOA, UPPER( p.NM_PESSOA)  as  NM_PESSOA                 '+
   'FROM                                                              '+
   '  PESSOAS p                                                       '+
   '  LEFT JOIN NU_GRUPOS_PESSOAS ngp ON(p.CD_PESSOA = NGP.CD_PESSOA  '+
   '  AND (NGP.CD_COLIGADA != :cd_coligada ))';
   SqlAgrupamento =
   'GROUP BY                                                          '+
   '  p.CD_PESSOA,p.NM_PESSOA                                         ';
   SqlAdicionaColigada  = ''+
   'INSERT INTO                                                       '+
   '  NU_GRUPOS_PESSOAS                                               '+
   'VALUES                                                            '+
   '  (null,:cd_grupo,:cd_pessoa ,:cd_coligada )                      ';
var
  FSelPessoa: TFSelPessoa;

implementation
uses
   UFcontrolePerm , uDm, uColigada, uColigadaMatriz;

{$R *.dfm}

procedure TFSelPessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
     sbFechar.OnClick(nil);
      
end;

procedure TFSelPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   begin
      if dbgPessoa.Focused then
         sbSelecione.click()
      else
         Filtrar();
   end
   else
   if key = #123 then
      sbFechar.OnClick(nil);
end;

procedure TFSelPessoa.FormShow(Sender: TObject);
begin
// Não filtra mais ao abrir a tela pois demorava muito para listar
//   filtrar;
   ledCodigo.SetFocus();
end;

procedure TFSelPessoa.sbFecharClick(Sender: TObject);
begin
   FControlePerm.qryPessoasColigadas.Close;
   FControlePerm.qryPessoasColigadas.Open;
   Close;
end;

procedure TFSelPessoa.sbSelecioneClick(Sender: TObject);
begin
   addPessoaColigada(qryPessoasCD_PESSOA.AsInteger);
end;

procedure TFSelPessoa.addPessoaColigada(ICodPessoa : integer);
begin
   if FControlePerm.cbColigadas.Items.Objects[FControlePerm.cbColigadas.ItemIndex] is TColigadaMatriz then
   begin
      TColigadaMatriz(FControlePerm.cbColigadas.Items.Objects[FControlePerm.cbColigadas.ItemIndex]).IncluirGrupoUsuario(ICodPessoa, FControlePerm.getCodGrupo);
   end else begin
      TColigada(FControlePerm.cbColigadas.Items.Objects[FControlePerm.cbColigadas.ItemIndex]).IncluirGrupoUsuario(ICodPessoa, FControlePerm.getCodGrupo);
   end;

   FControlePerm.qryPessoasColigadas.Close;
   FControlePerm.qryPessoasColigadas.Open;

   Close;

end;

procedure TFSelPessoa.dbgPessoaDblClick(Sender: TObject);
begin
   sbSelecione.Click;
end;

procedure TFSelPessoa.dbgPessoaTitleClick(Column: TColumn);
begin
   if Column.FieldName = 'CD_PESSOA' then
   begin
      qryPessoas.Close;
      qryPessoas.SortedFields := 'CD_PESSOA';
      qryPessoas.Open;
      Column.Title.Font.Color := clBlue;
      dbgPessoa.Columns[1].Title.Font.Color := clBlack;
   end
   else
   if Column.FieldName = 'NM_PESSOA' then
   begin
      qryPessoas.Close;
      qryPessoas.SortedFields := 'NM_PESSOA';
      qryPessoas.Open;
      Column.Title.Font.Color := clBlue;
      dbgPessoa.Columns[0].Title.Font.Color := clBlack;
   end

end;

procedure TFSelPessoa.filtrar();
var
   cd_coligada : Integer;
begin
   if FControlePerm.cbColigadas.Items.Objects[FControlePerm.cbColigadas.ItemIndex] is TColigadaMatriz then
   begin
      cd_coligada := TColigadaMatriz(FControlePerm.cbColigadas.Items.Objects[FControlePerm.cbColigadas.ItemIndex]).Codigo;
   end else begin
      cd_coligada := TColigada(FControlePerm.cbColigadas.Items.Objects[FControlePerm.cbColigadas.ItemIndex]).Codigo;
   end;

   qryPessoas.Close;
   qryPessoas.SQL.Text := SqlOrigem;
   if ledCodigo.Text <> '' then
   begin
      qryPessoas.SQL.Text := qryPessoas.SQL.Text +
                             'WHERE             '+
                             '   p.CD_PESSOA =  '+
                             ledCodigo.Text      +
                             ' '+
                             SqlAgrupamento;
      qryPessoas.ParamByName('cd_coligada').AsInteger := cd_coligada;
   end
   else
   if ledNome.Text <> '' then
   begin
      qryPessoas.SQL.Text := qryPessoas.SQL.Text +
                             'WHERE             '+
                             '   p.NM_PESSOA like  '''+
                             '%'+ledNome.Text+'%'+      ''''+
                             SqlAgrupamento;
      qryPessoas.ParamByName('cd_coligada').AsInteger := cd_coligada;
   end
   else
   begin
      qryPessoas.SQL.Text := SqlOrigem + SqlAgrupamento;
      qryPessoas.ParamByName('cd_coligada').AsInteger := cd_coligada;
   end;
   qryPessoas.SortedFields := 'NM_PESSOA';
   qryPessoas.Open;
end;

end.
