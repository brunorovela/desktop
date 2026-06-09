unit uEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, DB, ZConnection, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, uDM;

type
  TfrmEstados = class(TForm)
    paCabecalho: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    pcEstados: TPageControl;
    tsPaises: TTabSheet;
    tsEstados: TTabSheet;
    tsCidades: TTabSheet;
    qyPaises: TUMZQuery;
    qyEstados: TUMZQuery;
    qyCidades: TUMZQuery;
    dsPaises: TDataSource;
    dsCidades: TDataSource;
    dsEstados: TDataSource;
    qyPaisesds_pais: TStringField;
    qyPaisesds_sigla: TStringField;
    qyPaisesds_nacionalidade: TStringField;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbPais: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBGrid2: TDBGrid;
    qyEstadosds_uf: TStringField;
    qyEstadosds_estado: TStringField;
    qyEstadoscd_pais: TIntegerField;
    Label5: TLabel;
    dsUF: TDBEdit;
    Label6: TLabel;
    dbEstado: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBGrid3: TDBGrid;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    dbMunicipio: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    pnPais: TPanel;
    pnEstados: TPanel;
    qyPaisescd_pais: TLargeintField;
    qyEstadoscd_mec: TLargeintField;
    qyCidadesDS_MUNICIPIO: TStringField;
    qyCidadesUF: TStringField;
    qyCidadesCD_ESTADO: TLargeintField;
    qyCidadesCD_MUNICIPIO: TLargeintField;
    qyCidadesNR_ANO: TIntegerField;
    qyCidadesNR_CEP_INI: TIntegerField;
    qyCidadesNR_CEP_FIM: TIntegerField;
    qyCidadesNR_PRACA: TLargeintField;
    qyCidadesch_municipio: TIntegerField;
    qyCidadescd_municipio_correio: TIntegerField;
    qyCidadesds_uf: TStringField;
    qyCidadesds_municipio_sem_acento: TStringField;
    procedure dsUFKeyPress(Sender: TObject; var Key: Char);
    procedure qyEstadosBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qyEstadosNewRecord(DataSet: TDataSet);
    procedure qyCidadesNewRecord(DataSet: TDataSet);
    procedure dsCidadesStateChange(Sender: TObject);
    procedure dsEstadosStateChange(Sender: TObject);
    procedure dsPaisesStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcEstadosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pcEstadosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iUltimaGuia : Integer;
    Procedure FiltraPaises();
    Procedure FiltraEstados();
    Procedure FiltraMunicipios(); 
  public
    { Public declarations }
  end;

var
  frmEstados: TfrmEstados;

implementation

uses uUsuario, Main;

{$R *.dfm}

{ TfrmEstados }

procedure TfrmEstados.btnAlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1054, npAlterar, True ) then Exit;
  
  case pcEstados.ActivePageIndex of
    0 : begin
        dbPais.SetFocus();
        qyPaises.Edit();
    end;
    1 : begin
        dsUF.SetFocus();
        qyEstados.Edit();

    end;
    2 : begin
        dbMunicipio.SetFocus();
        qyCidades.Edit();
    end;  
  end;

end;

procedure TfrmEstados.btnCancelarClick(Sender: TObject);
begin

  case pcEstados.ActivePageIndex of
    0 : begin
        qyPaises.Cancel();
    end;
    1 : begin
        qyEstados.Cancel();
    end;
    2 : begin
        qyCidades.Cancel();
    end;
  end;

end;

procedure TfrmEstados.btnExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1054, npExcluir, True ) then Exit;

  case pcEstados.ActivePageIndex of
    0 : begin

        IF Mensagem('Atenção: ' + CHR(13) + CHR(13) +
                 'Tem certeza que deseja excluir o País "' + qyPaisesds_pais.AsString + '"? ',
                 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) = mrYes
        then begin
           qyPaises.Delete();
        end;

    end;
    1 : begin

        IF Mensagem('Atenção: ' + CHR(13) + CHR(13) +
                 'Tem certeza que deseja excluir o Estado "' + qyEstadosds_estado.AsString + '"? ',
                 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) = mrYes
        then begin
           qyEstados.Delete();
        end;

    end;
    2 : begin
    
        IF Mensagem('Atenção: ' + CHR(13) + CHR(13) +
                 'Tem certeza que deseja excluir o Município "' + qyCidadesds_municipio.AsString + '"? ',
                 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) = mrYes
        then begin
           qyCidades.Delete();
        end;

    end;
  end;

end;

procedure TfrmEstados.btnFecharClick(Sender: TObject);
begin
   qyCidades.Close();
   qyEstados.Close();
   qyPaises.Close();

   Close();
end;

procedure TfrmEstados.btnIncluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1054, npIncluir, True ) then Exit;

  case pcEstados.ActivePageIndex of
    0 : begin
        dbPais.SetFocus();
        qyPaises.Insert();
    end;
    1 : begin
        dsUF.SetFocus();
        qyEstados.Insert();
    end;
    2 : begin
        dbMunicipio.SetFocus();
        qyCidades.Insert();
    end;
  end;
end;

procedure TfrmEstados.btnSalvarClick(Sender: TObject);
begin

  case pcEstados.ActivePageIndex of
    0 : begin
        qyPaises.Post();
        FiltraPaises();
    end;
    1 : begin
        qyEstados.Post();
        FiltraEstados();
    end;
    2 : begin
        qyCidades.Post();
        FiltraMunicipios();
    end;
  end;

end;

procedure TfrmEstados.dsCidadesStateChange(Sender: TObject);
begin
  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmEstados.dsEstadosStateChange(Sender: TObject);
begin
  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmEstados.dsPaisesStateChange(Sender: TObject);
begin
  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmEstados.dsUFKeyPress(Sender: TObject; var Key: Char);
begin

   {Se o tamanho do UF for 2, o país for Brasil e a tecla pressionada
   não for backspace é cancelada a tecla pressionada, mantendo assim um limite
   de 2 caracteres para UFs brasileiros}
   if ((Length(dsUF.Text) = 2) AND (qyPaisesds_pais.AsString = 'BRASIL') AND (Key <> #8)) then
   Begin
      Key := #0;
   end;
   
end;

procedure TfrmEstados.FiltraEstados;
begin

  qyEstados.Close();
  qyEstados.SQL.Text :=
    ' SELECT * FROM estados WHERE cd_pais = ' + qyPaisescd_pais.AsString + ' ORDER BY ds_estado ';
  qyEstados.Open();
  
end;

procedure TfrmEstados.FiltraMunicipios;
begin
  qycidades.Close();
  qyCidades.ParamByName('uf').AsString := qyEstadosds_uf.AsString;
  qycidades.Open();
end;

procedure TfrmEstados.FiltraPaises;
begin

   qyCidades.Close();
   qyEstados.Close();

   qyPaises.Close();
   qyPaises.SQL.Text :=
    ' SELECT * FROM paises ORDER BY ds_pais ';
   qyPaises.Open();
   
end;

procedure TfrmEstados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmEstados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnIncluir.Enabled then btnIncluirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnFechar.Enabled then btnFecharClick( nil );
  end;

end;

procedure TfrmEstados.FormShow(Sender: TObject);
begin
   pcEstados.ActivePage := tsPaises;
   FiltraPaises();
end;

procedure TfrmEstados.pcEstadosChange(Sender: TObject);
begin
   case pcEstados.ActivePageIndex of
      0 : begin
          dsPaisesStateChange(dsPaises);
      end; 
      1 : begin
          if iUltimaGuia = 0 then begin
             FiltraEstados();
          end;
          dsEstadosStateChange(dsEstados);
          pnPais.Caption := UpperCase(qyPaisesds_pais.AsString);
      end;
      2 : begin
          FiltraMunicipios();
          dsCidadesStateChange(dsCidades);
          pnEstados.Caption := UpperCase(qyEstadosds_estado.AsString);
      end;
   end;



end;

procedure TfrmEstados.pcEstadosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   iUltimaGuia := pcEstados.ActivePageIndex;
end;

procedure TfrmEstados.qyCidadesNewRecord(DataSet: TDataSet);
begin
   if (Length(qyEstadosds_uf.AsString) = 0) or (qyEstadoscd_mec.AsInteger = 0) then
   begin
     Mensagem('Identificamos que o país selecionado não possui nenhum estado/província. ' + #13#13 +
              'Caso o país não possua estados/província, a sugestão é que seja cadastrado um estado/província com o mesmo nome do país.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     Abort;
   end;

   // Usar o código do estado selecionado
   qyCidadesuf.AsString := qyEstadosds_uf.AsString;
   qyCidadescd_estado.AsInteger := qyEstadoscd_mec.AsInteger;
end;

procedure TfrmEstados.qyEstadosBeforePost(DataSet: TDataSet);
var
   qyMaiorCdMec : TUMZQuery;
   qyUpdateUFCidade: TUMZQuery;
begin
   if Trim(qyEstadosds_uf.AsString) = '' then begin

       Mensagem('O campo UF deve ser preenchido com uma sigla para o estado.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
       dsUF.SetFocus();
       Abort;
       
   end;


   if Trim(qyEstadoscd_mec.AsString) = '' then
   begin
      if(Mensagem('O campo código do Mec não foi preenchido. Deseja continuar?', 'UNIMESTRE', MB_YESNO + MB_ICONWARNING) = mrNo) then
      begin
         DBEdit7.SetFocus();
         Abort;
      end else begin
         Dm.CriarConsulta(qyMaiorCdMec);
         qyMaiorCdMec.SQL.Add('SELECT (max(cd_mec) +1) as cd_mec FROM estados');
         qyMaiorCdMec.Open;
         qyEstadoscd_mec.AsString := qyMaiorCdMec.FieldByName('cd_mec').AsString;
      end;
   end;

   if (qyEstados.State = dsEdit) then
   begin

      if (qyEstadosds_uf.OldValue <> qyEstadosds_uf.AsString) then
      begin
         dm.CriarConsulta(qyUpdateUFCidade);

         qyUpdateUFCidade.SQL.Text := '' +
         '  UPDATE municipios SET uf = :novo_uf WHERE uf = :antigo_uf AND cd_estado = :cd_estado';

         qyUpdateUFCidade.ParamByName('novo_uf').asString := qyEstadosds_uf.AsString;
         qyUpdateUFCidade.ParamByName('antigo_uf').asString := qyEstadosds_uf.OldValue;
         qyUpdateUFCidade.ParamByName('cd_estado').AsInteger := qyEstadoscd_mec.AsInteger;

         qyUpdateUFCidade.ExecSQL;
      end;
      
   end;         
end;

procedure TfrmEstados.qyEstadosNewRecord(DataSet: TDataSet);
begin
  // Usar o código do pais selecionado
  qyEstadoscd_pais.AsInteger := qyPaisescd_pais.AsInteger;
end;

end.

