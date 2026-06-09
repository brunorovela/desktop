unit UFSelGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, UZDataset, Buttons, Grids,
  DBGrids, StdCtrls, ExtCtrls, ZDataset, UZDbcFuncs, ZDbcIntfs;

type
  TfSelGrupos = class(TForm)
    pnTop: TPanel;
    pnPrincipal: TPanel;
    bvSep1: TBevel;
    pnRodaPe: TPanel;
    bvSep2: TBevel;
    pnCampos: TPanel;
    pnGrid: TPanel;
    bevSep3: TBevel;
    lblCodigo: TLabel;
    lblNome: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    sbSelecione: TSpeedButton;
    sbFechar: TSpeedButton;
    dsGrupos: TDataSource;
    qryGrupos: TUMZQuery;
    qryGruposCD_GRUPO: TIntegerField;
    qryGruposDS_NOME_GRUPO: TStringField;
    dbgModulos: TDBGrid;
    qryGruposDS_PAPEL: TStringField;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgModulosTitleClick(Column: TColumn);
    procedure dbgModulosDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbSelecioneClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FCodSelecionado  : Integer;
    FNomeSelecionado : string;
    FflgResult       : Boolean;
    procedure setFflgResult(FlgResult : Boolean);
    procedure setCodSelecionado(CodSelecionado : Integer);
    procedure setNomeSelecionado(NomeSelecionado : string);
  public
    procedure Filtrar(bHierarquia : Boolean);
    function  getNomeSelecionado: string;
    function  getCodSelecionado: Integer;
    function  getFflgResult: Boolean;

    { Public declarations }
  end;

var
   fSelGrupos : TfSelGrupos;
   bPerm      : Boolean;

implementation

uses
   uDM;

{$R *.dfm}

procedure TfSelGrupos.dbgModulosDblClick(Sender: TObject);
begin
   sbSelecione.Click;
end;

procedure TfSelGrupos.dbgModulosTitleClick(Column: TColumn);
var
   I: Integer;
   Found: Boolean;
   SortedFields: TStringList;
begin
   Found := False;
   SortedFields := TStringList.Create;
   try
      SortedFields.Delimiter := ';';
      SortedFields.StrictDelimiter := True;
 
      SortedFields.NameValueSeparator := ' ';
 
      SortedFields.DelimitedText := qryGrupos.IndexFieldNames;
 
      for I := 0 to SortedFields.Count - 1 do
 
         if SortedFields.Names[I] = Column.FieldName then
         begin

            if SortedFields.ValueFromIndex[I] = 'Asc' then
            begin
               SortedFields.ValueFromIndex[I] := 'Desc';
               Column.Title.Font.Color := clRed;
               Column.Title.Font.Style := [fsBold];
            end
            else
            begin
               SortedFields.Delete(I);
               Column.Title.Font.Color := clWindowText;
               Column.Title.Font.Style := [];
            end;

            Found := True;
            Break;
         end;
 
      if not Found then
      begin
         SortedFields.Values[Column.FieldName] := 'Asc';
         Column.Title.Font.Color := clGreen;
         Column.Title.Font.Style := [fsBold];
      end;
 
      qryGrupos.IndexFieldNames := SortedFields.DelimitedText;
   finally
      SortedFields.Free;
   end;
end;

procedure TfSelGrupos.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#47..#59, #8]) then
      Key := #0;
end;

procedure TfSelGrupos.Filtrar(bHierarquia : Boolean);
{
var
   qryVerificaGrupo     : TUMZQuery;
   qryGruposHierarquia  : TUMZQuery;
   bUsuarioComun        : Boolean;
}
begin
   qryGrupos.Close;
   qryGrupos.ParamByName('CD_PESSOA').AsInteger := DM.UsuarioLogado.Pessoa.Codigo;

   if Trim(edCodigo.Text) <> '' then
   begin
      qryGrupos.Filter := Format('CD_GRUPO = %s', [edCodigo.Text]);
      qryGrupos.Filtered := True;
   end
   else if Trim(edNome.Text) <> '' then
   begin
      qryGrupos.Filter := Format('DS_NOME_GRUPO LIKE %s', [QuotedStr('*' + edNome.Text + '*')]);
      qryGrupos.Filtered := True;
   end
   else
   begin
      qryGrupos.Filter := '';
      qryGrupos.Filtered := False;
   end;
   qryGrupos.Open;
   {
   bUsuarioComun := true ;
   bPerm         := bHierarquia;
   // ve se a pessoa logada faz parte do grupo 1 que sempre sera o admin
   DM.CriarConsulta(qryVerificaGrupo);
   qryVerificaGrupo.SQL.Text := 'SELECT                                                              '+
                                '  ngp.cd_pessoa, g.CD_GRUPO  cd_grupo                               '+
                                'FROM                                                                '+
                                '  NU_GRUPOS g                                                       '+
                                '  INNER JOIN nu_grupos_pessoas ngp ON (ngp.cd_grupo = g.cd_grupo)   '+
                                'WHERE                                 '+
                                '  g.CD_GRUPO  = 1 AND                 '+
                                '  ngp.CD_PESSOA = '+IntToStr(DM.iCdPessoaLogado) ;
   qryVerificaGrupo.Open;
   if( qryVerificaGrupo.FieldByName('cd_grupo').AsInteger = 1) then
   begin
      bUsuarioComun := false;
   end;

   if (edCodigo.Text <> '') then
   begin
      qryGrupos.Close;
      qryGrupos.SQL.Text :=  SqlOrigem                      +
                             ' WHERE                        '+
                             '   cd_grupo = '+edCodigo.Text ;
      // se o pessoa nao estiver no grupo administradores
      if (bUsuarioComun) then
      begin
         qryGrupos.SQL.Text :=  qryGrupos.SQL.Text          +
                             ' AND  SN_BLOQUEADO = 0       ';
      end;
       // se poder ver apenas a hierarquia
      if(bHierarquia) then
      begin
         DM.CriarConsulta(qryGruposHierarquia);
         qryGruposHierarquia.SQL.Text :=
         ' SELECT                                                             '+
         '    ngp.cd_grupo ,group_concat(cd_grupo_liberado) as grupo          '+
         ' FROM                                                               '+
         '   nu_grupos_hierarquia ngh                                         '+
         '   INNER JOIN nu_grupos_pessoas ngp ON (ngp.cd_grupo = ngh.cd_grupo)'+
         ' WHERE                                                              '+
         '   ngp.cd_pessoa = :pessoa                                          '+
         ' GROUP BY                                                           '+
         '	 ngp.cd_pessoa                                                    ';
         qryGruposHierarquia.ParamByName('pessoa').AsInteger := DM.iCdPessoaLogado;
         qryGruposHierarquia.Open;

         qryGrupos.SQL.Text :=  qryGrupos.SQL.Text         +
         ' AND cd_grupo IN ( '+qryGruposHierarquia.FieldByName('grupo').AsString+' )';
      end;

      qryGrupos.SQL.Text :=  qryGrupos.SQL.Text             +
                             'ORDER BY                     '+
                             '   DS_NOME_GRUPO             ';

      qryGrupos.Open;
   end
   else if (edNome.Text <> '') then
   begin
      qryGrupos.Close;
      qryGrupos.SQL.Text :=  SqlOrigem                                    +
                             'WHERE                                      '+
                             '   DS_NOME_GRUPO like ''%'+edNome.Text+'%''';
      // se o pessoa nao estiver no grupo administradores
      if (bUsuarioComun) then
      begin
         qryGrupos.SQL.Text :=  qryGrupos.SQL.Text          +
                               ' AND  sn_bloqueado = 0     ';
      end;
       // se poder ver apenas a hierarquia
      if(bHierarquia) then
      begin
         DM.CriarConsulta(qryGruposHierarquia);
         qryGruposHierarquia.SQL.Text :=
         ' SELECT                                                             '+
         '    ngp.cd_grupo ,group_concat(cd_grupo_liberado) as grupo          '+
         ' FROM                                                               '+
         '   nu_grupos_hierarquia ngh                                         '+
         '   INNER JOIN nu_grupos_pessoas ngp ON (ngp.cd_grupo = ngh.cd_grupo)'+
         ' WHERE                                                              '+
         '   ngp.cd_pessoa = :pessoa                                          '+
         ' GROUP BY                                                           '+
         '	 ngp.cd_pessoa                                                    ';
         qryGruposHierarquia.ParamByName('pessoa').AsInteger := DM.iCdPessoaLogado;
         qryGruposHierarquia.Open;

         qryGrupos.SQL.Text :=  qryGrupos.SQL.Text         +
         ' AND cd_grupo IN ( '+qryGruposHierarquia.FieldByName('grupo').AsString+' )';
      end;

      qryGrupos.SQL.Text := qryGrupos.SQL.Text                         +
                            ' ORDER BY                                '+
                            '    ds_nome_grupo                         ';
      qryGrupos.Open;
   end
   else
   begin
      qryGrupos.Close;
      qryGrupos.SQL.Text := SqlOrigem;
      qryGrupos.SQL.Text := qryGrupos.SQL.Text             +
                            ' WHERE                       '+
                            ' 1=1                         ';

       // se o pessoa nao estiver no grupo administradores
      if (bUsuarioComun) then
      begin
         qryGrupos.SQL.Text := qryGrupos.SQL.Text            +
                               'AND                       '+
                               '   sn_bloqueado = 0         ';
      end;

       // se poder ver apenas a hierarquia
      if(bHierarquia) then
      begin
         DM.CriarConsulta(qryGruposHierarquia);
         qryGruposHierarquia.SQL.Text :=
         ' SELECT                                                             '+
         '    ngp.cd_grupo ,group_concat(cd_grupo_liberado) as grupo          '+
         ' FROM                                                               '+
         '   nu_grupos_hierarquia ngh                                         '+
         '   INNER JOIN nu_grupos_pessoas ngp ON (ngp.cd_grupo = ngh.cd_grupo)'+
         ' WHERE                                                              '+
         '   ngp.cd_pessoa = :pessoa                                          '+
         ' GROUP BY                                                           '+
         '	 ngp.cd_pessoa                                                    ';
         qryGruposHierarquia.ParamByName('pessoa').AsInteger := DM.iCdPessoaLogado;
         qryGruposHierarquia.Open;

         qryGrupos.SQL.Text :=  qryGrupos.SQL.Text         +
         ' AND cd_grupo IN ( '+qryGruposHierarquia.FieldByName('grupo').AsString+' )';
      end;

      qryGrupos.SQL.Text := qryGrupos.SQL.Text                      +
                            'ORDER BY                                 '+
                            '   ds_nome_grupo                         ';
      qryGrupos.Open

   end;
   }
end;

procedure TfSelGrupos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
     sbFechar.OnClick(nil);
end;

procedure TfSelGrupos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      if dbgModulos.Focused then
         sbSelecione.click()
      else
         Filtrar(true);
   end

end;

procedure TfSelGrupos.FormShow(Sender: TObject);
begin
   Filtrar(true);
   setFflgResult(false);
end;

procedure TfSelGrupos.sbFecharClick(Sender: TObject);
begin
   setFflgResult(false);
   Close;
end;

procedure TfSelGrupos.sbSelecioneClick(Sender: TObject);
begin
   if(qryGruposDS_NOME_GRUPO.AsString <> '') then
   begin
      setCodSelecionado(qryGruposCD_GRUPO.AsInteger);
      setNomeSelecionado(qryGruposDS_NOME_GRUPO.AsString);
      setFflgResult(true);
      Close;

   end
end;

function TfSelGrupos.getCodSelecionado(): Integer ;
begin
   Result := FCodSelecionado;
end;

procedure TfSelGrupos.setCodSelecionado(CodSelecionado : Integer);
begin
   FCodSelecionado := CodSelecionado; 
end;

function TfSelGrupos.getFflgResult : Boolean ;
begin
   Result := FflgResult;
end;

procedure TfSelGrupos.setFflgResult(FlgResult : Boolean);
begin
   FflgResult := FlgResult;
end;

function TfSelGrupos.getNomeSelecionado : string ;
begin
   Result := FNomeSelecionado;
end;

procedure TfSelGrupos.setNomeSelecionado(NomeSelecionado : string);
begin
   FNomeSelecionado := NomeSelecionado;
end;

end.
