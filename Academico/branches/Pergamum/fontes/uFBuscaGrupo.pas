unit uFBuscaGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, StdCtrls, Grids, DBGrids, ZDataset;

type
  TFBuscaGrupos = class(TForm)
    pnPrincipal: TPanel;
    qryGrupos: TUMZQuery;
    Tree: TTreeView;
    qryGruposCD_GRUPO: TIntegerField;
    qryGruposDS_NOME_GRUPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Filtrar(bHierarquia : Boolean);
  public
    { Public declarations }
  end;

var
  FBuscaGrupos: TFBuscaGrupos;

implementation

uses uItemCombo, uDM;

{$R *.dfm}

procedure TFBuscaGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFBuscaGrupos.FormShow(Sender: TObject);
begin
   Filtrar(true);

   while not qryGrupos.Eof do
   begin
      Tree.Items.AddObject( Tree.TopItem, qryGruposds_nome_grupo.AsString, TItemCombo.Create(qryGruposcd_grupo.AsString, qryGruposds_nome_grupo.AsString) );
      qryGrupos.Next
   end;

end;

procedure TFBuscaGrupos.Filtrar(bHierarquia : Boolean);
{
var
   qryVerificaGrupo     : TUMZQuery;
   qryGruposHierarquia  : TUMZQuery;
   bUsuarioComun        : Boolean;
}
begin
   qryGrupos.Close;
   qryGrupos.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
   qryGrupos.Open;
   {
   bUsuarioComun := true ;

   // ve se a pessoa logada faz parte do grupo 1 que sempre sera o admin
   DM.CriarConsulta(qryVerificaGrupo);
   qryVerificaGrupo.SQL.Text := 'SELECT                                                              '+
                                '  ngp.cd_pessoa, g.CD_GRUPO cd_grupo, g.ds_nome_grupo               '+
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
      '	 ngp.cd_grupo , ngp.cd_coligada                                     ';
      qryGruposHierarquia.ParamByName('pessoa').AsInteger := DM.iCdPessoaLogado;
      qryGruposHierarquia.Open;

      qryGrupos.SQL.Text :=  qryGrupos.SQL.Text         +
      ' AND cd_grupo IN ( '+qryGruposHierarquia.FieldByName('grupo').AsString+' )';
   end;

   qryGrupos.SQL.Text := qryGrupos.SQL.Text                      +
                         'ORDER BY                                 '+
                         '   ds_nome_grupo                         ';
   qryGrupos.Open
   }
end;

procedure TFBuscaGrupos.TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
   Tree.BeginDrag(True);
end;

end.
