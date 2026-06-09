unit uPessoasInfoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uPessoasInformacoes, Mask, DBCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  DB, ZConnection, dblookup, uItemCombo, UMComboBox, ComCtrls;

type
  TfPessoasInfoCad = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    qryPessoas: TUMZQuery;
    qryPessoascd_pessoa: TIntegerField;
    qryPessoasnm_pessoa: TStringField;
    PageControl1: TPageControl;
    tsInfo: TTabSheet;
    tsObs: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    sbSelecionaPessoa: TSpeedButton;
    lblFone2: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    Label11: TLabel;
    cbNomePessoa: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    dblcMunicipios: TDBLookupComboBox;
    dblcEstados: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    cbUnidadeEnsino: TUMComboBox;
    pannelobs: TPanel;
    Panel4: TPanel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Panel2: TPanel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Panel5: TPanel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    Label12: TLabel;
    cbFormaConheceu: TComboBox;
    DBEdit4: TDBEdit;
    lblFone1: TLabel;
    DBEdit11: TDBEdit;
    lblFone3: TLabel;
    DBEdit12: TDBEdit;
    lblFone4: TLabel;
    DBEdit13: TDBEdit;
    Label1: TLabel;
    btnCodigoCurso: TSpeedButton;
    dtRetorno: TDateTimePicker;
    dbDsInformacao: TDBMemo;
    btnCodigoTurma: TSpeedButton;
    checksnretorno: TCheckBox;
    Label4: TLabel;
    btnAreaAssunto: TSpeedButton;
    Panel6: TPanel;
    lbl11: TLabel;
    DBMemo1: TDBMemo;
    Label14: TLabel;
    cbAreaAssunto: TUMComboBox;
    procedure btnAreaAssuntoClick(Sender: TObject);
    procedure checksnretornoClick(Sender: TObject);
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure cbNomePessoaExit(Sender: TObject);
    procedure sbSelecionaPessoaClick(Sender: TObject);
    procedure cbNomePessoaChange(Sender: TObject);
    procedure cbNomePessoaSelect(Sender: TObject);
    procedure cbNomePessoaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    procedure montaCombo(codigo : Integer);
    procedure preencheComboAreaAssunto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPessoasInfoCad: TfPessoasInfoCad;
  

implementation

uses
   uFSelecionarCurso, uFSelecionarTurma, uDM, uFSelecionarPessoa, uListaColigadas, uColigada, uFCadAssuntoArea;

{$R *.dfm}

procedure TfPessoasInfoCad.btnOkClick(Sender: TObject);
var
   qyDataRetorno: TUMZQuery;
begin
   DM.CriarConsulta(qyDataRetorno);
   qyDataRetorno.SQL.Text := 'select sn_obrigatorio from nu_cadastro_obrigatorio_campo where ds_chave = ''dtRetorno'' AND cd_cadastro = 53';
   qyDataRetorno.Open;

   if qyDataRetorno.FieldByName('sn_obrigatorio').AsInteger = 1 then
   begin
      if checksnretorno.Checked = False then
      begin
         Mensagem('Favor informe uma data de retorno!','Atenção', MB_OK , Handle);
         abort;
      end;
   end;
   qyDataRetorno.Close;

   PageControl1.ActivePage := tsInfo;

   DBEdit1.SetFocus;
   dbDsInformacao.SetFocus;

   if not(DM.CamposObrigatoriosPreenchidos(self)) then
   begin
      exit;
   end;

   if ((cbUnidadeEnsino.ItemIndex = -1) or (cbUnidadeEnsino.Text = 'Selecione uma Unidade de Ensino')) then
   begin
      Mensagem('Selecione uma Unidade de Ensino','Atenção', MB_OK , Handle);
      abort;
   end;

   if fPessoasInformacoes.qyPessoasInfocd_turma.AsString = '' then
   begin
      Mensagem('Favor selecionar uma turma!','Atenção', MB_OK , Handle);
      DBEdit7.SetFocus;
   end
   else
   begin
                                                                   
      fPessoasInformacoes.qyPessoasInfods_area_assunto.AsString := cbAreaAssunto.Text;

      if checksnretorno.Checked = True then
      begin
         fPessoasInformacoes.qyPessoasInfodt_retorno.AsDateTime := dtRetorno.DateTime;
      end
      else
      begin
         fPessoasInformacoes.qyPessoasInfodt_retorno.Clear;
      end;      
      
      if(fPessoasInformacoes.qyPessoasInfonm_usuario.IsNull)then
         fPessoasInformacoes.qyPessoasInfonm_usuario.AsString := DM.sLogin;

      if StrToInt(TItemCombo(cbFormaConheceu.Items.Objects[cbFormaConheceu.ItemIndex]).getCodigo) <> 0 then
         fPessoasInformacoes.qyPessoasInfocd_conhecimento.AsInteger := StrToInt(TItemCombo(cbFormaConheceu.Items.Objects[cbFormaConheceu.ItemIndex]).getCodigo);

      if (StrToInt(TItemCombo(cbFormaConheceu.Items.Objects[cbFormaConheceu.ItemIndex]).getCodigo) = 0) and (fPessoasInformacoes.qyPessoasInfo.state = dsEdit) then
         fPessoasInformacoes.qyPessoasInfocd_conhecimento.Clear;

      fPessoasInformacoes.qyPessoasInfocd_coligada.AsInteger := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;
      fPessoasInformacoes.qyPessoasInfo.Post;
      fPessoasInformacoes.qyPessoasInfo.Close();
      fPessoasInformacoes.qyPessoasInfo.Open();
      fPessoasInformacoes.preencheAreaAssuntos;
      fPessoasInformacoes.Filtrar;
      Close();
   end;
end;

procedure TfPessoasInfoCad.cbNomePessoaChange(Sender: TObject);
begin
   fPessoasInformacoes.qyPessoasInfonm_pessoa.AsString := cbNomePessoa.Text;

end;

procedure TfPessoasInfoCad.cbNomePessoaExit(Sender: TObject);
begin
   try
      if (cbNomePessoa.ItemIndex = -1) AND qryPessoas.Active then
      begin
         if qryPessoas.Locate('nm_pessoa', cbNomePessoa.Text, [loCaseInsensitive]) then
         begin
            fPessoasInformacoes.qyPessoasInfonm_pessoa.AsString :=
               qryPessoasnm_pessoa.AsString;
            fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger :=
            qryPessoascd_pessoa.AsInteger;
         end;
      end;
   except on E: Exception do
   end;

end;

procedure TfPessoasInfoCad.cbNomePessoaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      qryPessoas.Close;
      qryPessoas.ParamByName('nm_pessoa').AsString := cbNomePessoa.Text + '%';
      qryPessoas.Open;
      cbNomePessoa.Items.Clear;
      while not qryPessoas.Eof do
      begin
         cbNomePessoa.AddItem(qryPessoasnm_pessoa.AsString, qryPessoas.GetBookmark);
         qryPessoas.Next;
      end;
      cbNomePessoa.SelectAll;
   end;
end;

procedure TfPessoasInfoCad.cbNomePessoaSelect(Sender: TObject);
begin
   if cbNomePessoa.Items.Objects[cbNomePessoa.ItemIndex] <> nil then
   begin
      qryPessoas.GotoBookmark(Pointer(cbNomePessoa.Items.Objects[cbNomePessoa.ItemIndex]));
      fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := qryPessoascd_pessoa.AsInteger;
      fPessoasInformacoes.qyPessoasInfonm_pessoa.AsString := qryPessoasnm_pessoa.AsString;
   end;
end;

procedure TfPessoasInfoCad.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
end;

procedure TfPessoasInfoCad.checksnretornoClick(Sender: TObject);
begin

   if checksnretorno.Checked then
   begin
      dtRetorno.Enabled := True;
   end;

   if not(checksnretorno.Checked) then
   begin
      dtRetorno.Enabled := False;
   end;
end;

procedure TfPessoasInfoCad.btnAreaAssuntoClick(Sender: TObject);
var
   i: Integer;
begin
   Application.CreateForm(TuFrmCadAssuntoArea, uFrmCadAssuntoArea);
   if uFrmCadAssuntoArea.ShowModal = mrOk then
   begin
      preencheComboAreaAssunto;
      fPessoasInformacoes.qyPessoasInfods_area_assunto.AsString := uFrmCadAssuntoArea.qyAreasAssuntosds_valor.AsString;
      for I := 0 to cbAreaAssunto.Items.Count - 1 do
      begin
         if cbAreaAssunto.Items[i] = uFrmCadAssuntoArea.qyAreasAssuntosds_valor.AsString then
         begin
            cbAreaAssunto.ItemIndex := i;
         end;
      end;
   end;
end;

procedure TfPessoasInfoCad.btnCancelClick(Sender: TObject);
begin
    fPessoasInformacoes.qyPessoasInfo.Cancel();
    Close;
end;

procedure TfPessoasInfoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryPessoas.Close;
   if fPessoasInformacoes.qyPessoasInfo.state in [dsInsert, dsEdit] then
      fPessoasInformacoes.qyPessoasInfo.Cancel;  
   Action := caFree;
end;

procedure TfPessoasInfoCad.FormShow(Sender: TObject);
var
   arrObs : TStringList;
   tamanho_janela, i: Integer;
   qrySituacoes: TUMZQuery;
begin

   dtRetorno.Date := DM.DataAtual();

   if (fPessoasInformacoes.qyPessoasInfods_area_assunto.AsString <> '') then
   begin
   end;

   montaCombo(fPessoasInformacoes.qyPessoasInfocd_coligada.AsInteger);
   arrObs := TStringList.Create();
   
   tamanho_janela := 0;

   if DM.variavel_parametro('contatos_campos_obs') <> '' then
   begin
      SplitString(DM.variavel_parametro('contatos_campos_obs'), ';', arrObs);

      if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') ) then
      begin
         Panel5.Visible := True;
         Label8.Caption := arrObs[0];
         Label8.Visible := True;
         DBEdit8.Visible := True;
         if not( (arrObs[1] = null) or (trim(arrObs[1]) = '') )then
         begin
            Panel4.Visible := True;
            Label9.Caption := arrObs[1];
            Label9.Visible := True;
            DBEdit9.Visible := True;
            if not( (arrObs[2] = null) or (trim(arrObs[2]) = '') )then
            begin
               Panel2.Visible := True;
               Label10.Caption := arrObs[2];
               Label10.Visible := True;
               DBEdit10.Visible := True;
               if not( (arrObs[3] = null) or (trim(arrObs[3]) = '') )then
               begin
                  Panel6.Visible := True;
                  lbl11.Caption := arrObs[3];
                  lbl11.Visible := True;
                  DBMemo1.Visible := True;
               end;
            end;
         end;
      end;
   end else
   begin
      tsObs.Destroy;
   end;

   if fPessoasInformacoes.qyPessoasInfo.State = dsEdit then
      cbNomePessoa.Text := fPessoasInformacoes.qyPessoasInfonm_pessoa.AsString;

   dbDsInformacao.SetFocus();

   DM.CriarConsulta(qrySituacoes);
   qrySituacoes.SQL.Text := 'SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1 ORDER BY ds_valor';
   qrySituacoes.Open;

   cbFormaConheceu.Clear;
   cbFormaConheceu.AddItem( 'Selecione', TItemCombo.Create('0', 'Selecione') );
   cbFormaConheceu.ItemIndex := 0;

   preencheComboAreaAssunto;

   i := 1;

   if checksnretorno.State = cbGrayed then
   begin
      checksnretorno.Checked :=  False;
   end;

   if ((fPessoasInformacoes.qyPessoasInfodt_retorno.AsDateTime = 1) or
      (fPessoasInformacoes.qyPessoasInfodt_retorno.asString = '')) then
   begin
      checksnretorno.Checked := False;
   end
   else
   begin
      checksnretorno.Checked := True;
      dtRetorno.DateTime := fPessoasInformacoes.qyPessoasInfodt_retorno.AsDateTime;
   end;

   checksnretornoClick(self);

   while not qrySituacoes.Eof do
   begin
      cbFormaConheceu.AddItem(qrySituacoes.FieldByName('ds_valor').AsString, TItemCombo.Create( qrySituacoes.FieldByName('cd_situacao').AsString, qrySituacoes.FieldByName('ds_valor').AsString ) );

      if StrToInt(qrySituacoes.FieldByName('cd_situacao').AsString) = fPessoasInformacoes.qyPessoasInfocd_conhecimento.AsInteger then
         cbFormaConheceu.ItemIndex := i;

      inc(i);
      qrySituacoes.Next;
   end;

   lblFone1.Caption := DM.variavel_parametro('pessoascontatos_telefone1');
   lblFone2.Caption := DM.variavel_parametro('pessoascontatos_telefone2');
   lblFone3.Caption := DM.variavel_parametro('pessoascontatos_telefone3');
   lblFone4.Caption := DM.variavel_parametro('pessoascontatos_telefone4');

   cbFormaConheceu.AddItem( 'Outro', TItemCombo.Create('8', 'Outro') );

   if fPessoasInformacoes.qyPessoasInfocd_conhecimento.AsInteger = 8 then
      cbFormaConheceu.ItemIndex := i;
end;

procedure TfPessoasInfoCad.sbSelecionaPessoaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      cbNomePessoa.Text := resultado_filtro.nm_pessoa;
      fPessoasInformacoes.qyPessoasInfocd_pessoa.AsInteger := resultado_filtro.cd_pessoa;
      fPessoasInformacoes.qyPessoasInfonm_pessoa.AsString := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfPessoasInfoCad.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then begin
       SelectNext(Sender As TWinControl, True, True);
       Key := #0;
   end;
end;

procedure TfPessoasInfoCad.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Curso }

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Por favor informe uma unidade de ensino!','Atenção', MB_OK , Handle);
      abort;
   end;

   resultado_filtro := TfrmSelecionarCurso.Filtrar([], TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);

   if not resultado_filtro.filtrado then Exit;

   fPessoasInformacoes.qyPessoasInfods_curso.AsString := resultado_filtro.ds_curso;

   montaCombo( resultado_filtro.cd_coligada );
end;

procedure TfPessoasInfoCad.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Por favor informe uma unidade de ensino!','Atenção', MB_OK , Handle);
      abort;
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([], -1, TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);

   if not resultado_filtro.filtrado then Exit;

   fPessoasInformacoes.qyPessoasInfocd_turma.AsString := resultado_filtro.cd_turma;

   montaCombo( resultado_filtro.cd_coligada );
end;

procedure TfPessoasInfoCad.montaCombo(codigo : Integer);
begin
   DM.CarregaColigadas(cbUnidadeEnsino);
end;

procedure TfPessoasInfoCad.preencheComboAreaAssunto;
var
   i: Integer;
   qyAreasAssuntos: TUMZQuery;
begin
   cbAreaAssunto.Items.Clear;

   i:=0;
   DM.CriarConsulta(qyAreasAssuntos);

   qyAreasAssuntos.SQL.Text := 'SELECT * from situacoes where cd_modulo = 1035';

   qyAreasAssuntos.Open;

   while not (qyAreasAssuntos.Eof) do
   begin

      cbAreaAssunto.Items.Add(qyAreasAssuntos.fieldbyname('ds_valor').AsString);

      if (fPessoasInformacoes.qyPessoasInfods_area_assunto.AsString = qyAreasAssuntos.FieldByName('ds_valor').AsString) then
      begin
         cbAreaAssunto.ItemIndex := i;
      end;

      qyAreasAssuntos.Next;
      i := i + 1;
   end;
end;

end.

