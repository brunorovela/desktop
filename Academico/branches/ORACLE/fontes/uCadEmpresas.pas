unit uCadEmpresas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus, StrUtils;

type
  Tfrm_Empresas = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
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
    tblEmpresa: TUMZQuery;
    dsEmpresa: TDataSource;
    tblEmpresacd_empresa: TIntegerField;
    tblEmpresanm_empresa: TStringField;
    tblEmpresanm_razao_social: TStringField;
    tblEmpresads_endereco: TStringField;
    tblEmpresads_complemento: TStringField;
    tblEmpresads_bairro: TStringField;
    tblEmpresads_cidade: TStringField;
    tblEmpresads_estado: TStringField;
    tblEmpresads_cep: TStringField;
    tblEmpresanm_contato: TStringField;
    tblEmpresads_telefone1: TStringField;
    tblEmpresads_telefone2: TStringField;
    tblEmpresads_email: TStringField;
    tblEmpresads_site: TStringField;
    tblEmpresacd_area_atuacao: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    tblEmpresadescEstado: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    qMax: TUMZQuery;
    tblEmpresads_cnpj: TStringField;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    pmQtd: TPopupMenu;
    qMaxUltimo: TIntegerField;
    DBCHKConvenio: TDBCheckBox;
    tblEmpresasn_convenio: TSmallintField;
    pnlFiltros: TPanel;
    qryFiltros: TUMZReadOnlyQuery;
    qryFiltroscd_empresa: TIntegerField;
    qryFiltrosnm_empresa: TStringField;
    ledEmpresa: TLabeledEdit;
    lblTotal: TLabel;
    sbLimpar: TSpeedButton;
    spLocalizar: TSpeedButton;
    qyAux: TUMZQuery;
    procedure sbLimparClick(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure ledEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsEmpresaStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblEmpresaNewRecord(DataSet: TDataSet);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
  private
    sUltimoFiltro : string;
    iQtdGeral     : Integer;
    procedure localizar(nm_empresa : string);
    function validaCNPJ(numCNPJ: String): boolean;
    function validaCNPJRepetido(CNPJ: String; cd_empresa: integer): boolean;
  public
  end;

var
   frm_Empresas: Tfrm_Empresas;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Empresas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Empresas.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     tblEmpresa.Delete;
  end;
end;

procedure Tfrm_Empresas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_Empresas.btnFecharClick(Sender: TObject);
begin
   DM.tblEmpresa.Close;
   DM.tblEmpresa.Open;
   Close;
end;

procedure Tfrm_Empresas.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure Tfrm_Empresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Empresas.btnInserirClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   tblEmpresa.Insert;
end;

procedure Tfrm_Empresas.btnAlterarClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   tblEmpresa.Edit;
end;

procedure Tfrm_Empresas.btnSalvarClick(Sender: TObject);
Var
   xCodigo: Integer;
   salva: boolean;
   CNPJ: String;
begin
   CNPJ := DBEdit14.Text;
   salva := true;
   xCodigo := tblEmpresacd_empresa.AsInteger;

   if CNPJ <> '00000000000000' then
   begin
      if (NOT validaCNPJ(CNPJ)) then
      begin
         Mensagem('CNPJ inválido!', 'Anteção', MB_OK + MB_ICONEXCLAMATION);
         salva := false
      end
      else
      begin
         if validaCNPJRepetido(CNPJ,xCodigo) then
         begin
            salva := false;
         end;
      end;
   end;
   
   if not salva then
   begin
      exit;
   end;

   tblEmpresa.Post;
   tblEmpresa.Close;
   tblEmpresa.Open;
   tblEmpresa.Locate('cd_empresa', xCodigo, []);
end;

procedure Tfrm_Empresas.btnCancelarClick(Sender: TObject);
begin
   tblEmpresa.Cancel;
end;

procedure Tfrm_Empresas.dsEmpresaStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblEmpresa.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblEmpresa.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblEmpresa.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblEmpresa.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblEmpresa.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblEmpresa.State in [dsInsert, dsEdit]);
end;



procedure Tfrm_Empresas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));
  tblEmpresa.Close;
  tblEmpresa.Open;
  sUltimoFiltro := '';
end;

procedure Tfrm_Empresas.tblEmpresaNewRecord(DataSet: TDataSet);
begin
   qMax.Close;
   qMax.Open;

   try
       tblEmpresacd_empresa.AsInteger := qMaxUltimo.AsInteger + 1;
   except
       tblEmpresacd_empresa.AsInteger := 1;
   end;

end;

function Tfrm_Empresas.validaCNPJ(numCNPJ: String): boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
   ret:=False;
   cnpj:='';

   if Length(numCNPJ) = 18 then
      if (Copy(numCNPJ,3,1) + Copy(numCNPJ,7,1) + Copy(numCNPJ,11,1) + Copy(numCNPJ,16,1) = '../-') then
         begin
            cnpj:=Copy(numCNPJ,1,2) + Copy(numCNPJ,4,3) + Copy(numCNPJ,8,3) + Copy(numCNPJ,12,4) + Copy(numCNPJ,17,2);
            ret:=True;
         end;

      if Length(numCNPJ) = 14 then
      begin
         cnpj:=numCNPJ;
         ret:=True;
      end;

      if ret then
      begin
         try
            total:=0;
            for x:=1 to 12 do
            begin
               if x < 5 then
                  Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
               else
                  Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
               end;

               dg1:=11 - (total mod 11);

               if dg1 > 9 then
                  dg1:=0;
                  total:=0;

               for x:=1 to 13 do
               begin
                  if x < 6 then
                     Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
                  else
                     Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
               end;

               dg2:=11 - (total mod 11);

               if dg2 > 9 then
                  dg2:=0;

               if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
                  ret:=True
               else
                  ret:=False;
         except
            ret:=False;
         end;

         case AnsiIndexStr( cnpj,
               ['00000000000000','11111111111111','22222222222222','33333333333333','44444444444444',
               '55555555555555','66666666666666','77777777777777','88888888888888','99999999999999']
            ) of 0..9:  ret:=False;
         end;

      end;
   ValidaCNPJ:=ret;
end;

function Tfrm_Empresas.validaCNPJRepetido(CNPJ: String; cd_empresa: integer): boolean;
begin
   Result := false;

   qyAux.SQL.Text := 'SELECT e.nm_empresa, e.ds_cnpj FROM ';
   qyAux.SQL.Add('empresas e ');
   qyAux.SQL.Add('WHERE e.ds_cnpj = :CNPJ AND e.cd_empresa <> :cd_empresa');
   qyAux.ParamByName('CNPJ').AsString := CNPJ;
   qyAux.ParamByName('cd_empresa').AsInteger := cd_empresa;

   qyAux.Open;

   if not qyAux.Eof then
   begin
      Mensagem('Este CNPJ ja está sendo usado pela empresa: '+CHR(13)+
      'Nome: '+qyAux.FieldByName('nm_empresa').AsString, 'Anteção', MB_OK + MB_ICONQUESTION);
      Result := true;
   end;

   qyAux.Close;
end;

procedure Tfrm_Empresas.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   IF KEY = #13 tHEN
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;

procedure Tfrm_Empresas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblEmpresa, pmQtd);
end;


procedure Tfrm_Empresas.sbLimparClick(Sender: TObject);
begin
   ledEmpresa.Text := '';
end;

procedure Tfrm_Empresas.spLocalizarClick(Sender: TObject);
begin
   try
     localizar(ledEmpresa.Text);      
   except on E: Exception do
   end;

end;

procedure Tfrm_Empresas.ledEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      spLocalizarClick(nil);
end;

procedure Tfrm_Empresas.localizar(nm_empresa : string);
begin
   if (nm_empresa <> sUltimoFiltro) then
   begin
      iQtdGeral := 1;
      qryFiltros.Close;
      qryFiltros.ParamByName('nm_empresa').AsString := '%'+nm_empresa+'%';
      qryFiltros.Open;
      qryFiltros.First;
      sUltimoFiltro := nm_empresa;
   end
   else
   begin
      if (qryFiltros.Active = false) then
      begin
         qryFiltros.Close;
         qryFiltros.ParamByName('nm_empresa').AsString := '%'+nm_empresa+'%';
         qryFiltros.Open;
      end;
      if(iQtdGeral < qryFiltros.RecordCount)then
      begin
         iQtdGeral := iQtdGeral + 1;
         qryFiltros.Next;
      end
      else
      begin
         iQtdGeral := 1;
         qryFiltros.First; 
      end;
   end;
   tblEmpresa.Locate('cd_empresa',qryFiltroscd_empresa.AsInteger,[]);
   if(qryFiltros.RecordCount <> 0)then
   begin
      lblTotal.Caption := '('+ IntToStr(iQtdGeral)+'/'+IntToStr(qryFiltros.RecordCount)+')';
   end
   else
   begin
      lblTotal.Caption := 'Nenhum registro.';  
   end;
end;

end.

