unit UCompromisso_apropria_altera_caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, udm, General, UItemCompromisso,
  UMEditNumerico, UMEditMonetario, uFinApropriaTesouraria,Contnrs,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, UMComboBox,
  uBuscaCentro, uCentroCusto, uTesouraria_Gerar;

type
  TfrmApropriaAlteraCaixa = class(TForm)
    pbBotoesInferiores: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    cmbPlanoContas: TComboBox;
    lbPlanoContas: TLabel;
    lbCentroCusto: TLabel;
    lbVlNota: TLabel;
    txtVlNota: TUMEditMonetario;
    pnTitulo: TPanel;
    lbConta: TLabel;
    lbCentro: TLabel;
    txtCdConta: TUMEditNumerico;
    txtCdCentro: TUMEditNumerico;
    sbPlanoContas: TSpeedButton;
    edPorcentagem: TUMEditMonetario;
    Label1: TLabel;
    edCentroCusto: TEdit;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbPlanoContasClick(Sender: TObject);
    procedure txtCdCentroExit(Sender: TObject);
    procedure txtCdContaExit(Sender: TObject);
    procedure txtVlNotaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure txtCdCentroKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPlanoContasKeyPress(Sender: TObject; var Key: Char);
    procedure txtCdContaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCentroCustoChange(Sender: TObject);
    procedure cmbPlanoContasChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  strict private

  private
     objApropriacao              : TFinApropriaTesouraria;
     
     objCentroSelecionado        : TCentroCusto;
     
     cd_apropriacao_selecionada  : integer;

     form_estado                 : string;
     cd_titulo                   : string;
     cd_conta_selecionada        : string;
    { Private declarations }
  public
    ListaApropriacoes : TObjectList;
    procedure getListaPlanoContas();
//    procedure getListaCentroCustos();
    procedure limpaTodosObjetos();
    procedure carregaDados();
    procedure setCdApropriacaoSelecionada( valor: integer );
    procedure setCdTitulo( valor: string );
    procedure alterar();
    procedure inserir();
    procedure setFormEstado( valor: string );
    procedure SelecionaPlanoConta(cd_conta: string);
    procedure SelecionaCentroCusto(cd_centro: string);
    procedure setContaSelecionada( valor: string );
    function getFormEstado() : string;
    function getCdApropriacaoSelecionada(): integer;
    function getCdTitulo() : string;
    function getContaSelecionada() : string;
    { Public declarations }
  end;

var
  frmApropriaAlteraCaixa: TfrmApropriaAlteraCaixa;

implementation

uses uSelConta, uListaColigadas, uColigada, uCompromisso_cadastro;

{$R *.dfm}

procedure TfrmApropriaAlteraCaixa.alterar;
var
    cd_conta      : string;
    cd_centro     : string;
    vl_movimento  : string;
begin
   if cmbPlanoContas.ItemIndex > -1 then
   begin
      cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();
   end;

   if objCentroSelecionado <> nil then
   begin
      cd_centro := IntToStr(objCentroSelecionado.Centro);
   end;

   vl_movimento := txtVlNota.getValorString();

   (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaTesouraria).setValorCampo( 'cd_conta',      cd_conta );
   (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaTesouraria).setValorCampo( 'cd_centro',     cd_centro );
   (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaTesouraria).setValorCampo( 'vl_movimento',  vl_movimento );

   cmbPlanoContas.SetFocus;
   Self.Close();
end;

procedure TfrmApropriaAlteraCaixa.btnCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmApropriaAlteraCaixa.btnConfirmarClick(Sender: TObject);
begin
   if Self.getFormEstado() = 'inserir' then
   begin
      Self.inserir();
   end
   else
   begin
      Self.alterar();
   end;
end;

procedure TfrmApropriaAlteraCaixa.carregaDados;
var
   i, cd_coligada : integer;
   cd_conta       : string;
   cd_centro      : string;
   vl_movimento   : string;
begin
   cd_conta       := (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaTesouraria).getValorCampo('cd_conta');
   cd_centro      := (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaTesouraria).getValorCampo('cd_centro');
   vl_movimento   := (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaTesouraria).getValorCampo('vl_movimento');

   //seleciona a conta com base no código recuperado da base
   if  (cd_conta <> '0') and (cd_conta <> '')  then
   begin
      for i := 0 to cmbPlanoContas.Items.Count - 1 do
      begin
         if ( (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).getCodigo = cd_conta ) then
         begin
            cmbPlanoContas.ItemIndex := i;

            cmbPlanoContas.OnChange( nil );

            break;
         end;
      end;
   end;

   if cd_centro <> '' then
   begin
      objCentroSelecionado := TCentroCusto.Create(StrToInt(cd_centro));
      edCentroCusto.Text := objCentroSelecionado.Descricao;
      txtCdCentro.Text := IntToStr(objCentroSelecionado.Centro);
   end;

   txtVlNota.setValorString(vl_movimento);
end;

{procedure TfrmApropriaAlteraCaixa.CarregarColigadas;
var
   ListaColigadasFilhas : TListaColigadas;
   I : Integer;
begin
   ListaColigadasFilhas := DM.UsuarioLogado.GetListaColigadasFilhaSelecionada();

   for I := 0 to ListaColigadasFilhas.Count - 1 do
   begin
      cbUnidadeEnsino.AddItem(
         ListaColigadasFilhas.Items[I].Nome,
         ListaColigadasFilhas.Items[I]
      );
   end;
end;}

procedure TfrmApropriaAlteraCaixa.cmbCentroCustoChange(Sender: TObject);
var
   cd_centro: string;
begin
   if objCentroSelecionado <> nil then
   begin
      cd_centro := IntToStr(objCentroSelecionado.Centro);

      txtCdCentro.text := cd_centro;
   end;

end;

procedure TfrmApropriaAlteraCaixa.cmbCentroCustoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAlteraCaixa.cmbPlanoContasChange(Sender: TObject);
var
   cd_conta: string;
begin
   if cmbPlanoContas.ItemIndex > -1 then
   begin
      cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();

      txtCdConta.Text := cd_conta;
   end;
end;

procedure TfrmApropriaAlteraCaixa.cmbPlanoContasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAlteraCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Self.limpaTodosObjetos();

   Action := caFree;
end;

procedure TfrmApropriaAlteraCaixa.FormShow(Sender: TObject);
begin

   Self.getListaPlanoContas();
//   Self.getListaCentroCustos();
   cmbPlanoContas.SetFocus;

   if trim(Self.getContaSelecionada()) <> '' then
   begin
      txtCdConta.Text := Self.getContaSelecionada();
      txtCdConta.OnExit( nil );
   end;                        

   if Self.getFormEstado() = 'alterar' then
   begin
      Self.carregaDados();
      edPorcentagem.Enabled := False;
   end;

   objApropriacao := nil;
end;

function TfrmApropriaAlteraCaixa.getCdApropriacaoSelecionada: integer;
begin
   Result := Self.cd_apropriacao_selecionada;
end;

function TfrmApropriaAlteraCaixa.getCdTitulo: string;
begin
   Result := Self.cd_titulo;
end;

function TfrmApropriaAlteraCaixa.getContaSelecionada: string;
begin
   Result := Self.cd_conta_selecionada;
end;

function TfrmApropriaAlteraCaixa.getFormEstado: string;
begin
   Result := Self.form_estado;
end;

//procedure TfrmApropriaAlteraCaixa.getListaCentroCustos;
//var
//   qyCentroCusto     : TUMZQuery;
//   objItem           : TItemCompromisso;
//begin
//   qyCentroCusto     := nil;
//
//   DM.CriarConsulta( qyCentroCusto );
//   qyCentroCusto.Close();
//   qyCentroCusto.SQL.Clear;
//   qyCentroCusto.SQL.Add('SELECT                                         ');
//   qyCentroCusto.SQL.Add(' cd_centro, cd_classificacao, ds_centro        ');
//   qyCentroCusto.SQL.Add('FROM                                           ');
//   qyCentroCusto.SQL.Add(' fin_config_centro_custos                      ');
//   qyCentroCusto.SQL.Add('WHERE                                          ');
//   qyCentroCusto.SQL.Add(' tp_centro = 1  AND sn_ativo = 1               ');
//   qyCentroCusto.SQL.Add(' AND cd_coligada_matriz = :cd_coligada_matriz  ');
//   qyCentroCusto.SQL.Add('ORDER BY ds_centro '  );
//   qyCentroCusto.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
//   qyCentroCusto.Open();
//
//   while not qyCentroCusto.Eof do
//   begin
//      objItem := TItemCompromisso.Create(
//         qyCentroCusto.FieldByName('cd_centro').AsString,
//         trim(qyCentroCusto.FieldByName('cd_classificacao').AsString + '  ' +
//                         qyCentroCusto.FieldByName('ds_centro').AsString)
//      );
//
//      cmbCentroCusto.Items.AddObject( objItem.getDescricao, objItem );
//
//      qyCentroCusto.Next;
//   end;
//
//   FreeAndNil( qyCentroCusto );
//
//end;

procedure TfrmApropriaAlteraCaixa.getListaPlanoContas;
var
   qyPlanoConta      : TUMZQuery;
   objItem           : TItemCompromisso;
begin
   qyPlanoConta      := nil;

   DM.CriarConsulta( qyPlanoConta );
   qyPlanoConta.Close();
   qyPlanoConta.SQL.Clear;
   qyPlanoConta.SQL.Add('SELECT                                         ');
   qyPlanoConta.SQL.Add(' cd_conta, ds_conta                            ');
   qyPlanoConta.SQL.Add('FROM                                           ');
   qyPlanoConta.SQL.Add(' fin_config_plano_contas                       ');
   qyPlanoConta.SQL.Add('WHERE                                          ');
   qyPlanoConta.SQL.Add(' cd_coligada_matriz = :cd_coligada_matriz      ');
   qyPlanoConta.SQL.Add(' AND sn_ativo = 1                              ');
   qyPlanoConta.SQL.Add('ORDER BY ds_conta                              ');

   qyPlanoConta.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   qyPlanoConta.Open();

   while not qyPlanoConta.Eof do
   begin
      objItem := TItemCompromisso.Create(
         qyPlanoConta.FieldByName('cd_conta').AsString,
         qyPlanoConta.FieldByName('ds_conta').AsString
      );

      cmbPlanoContas.Items.AddObject( objItem.getDescricao, objItem );

      qyPlanoConta.Next;
   end;

   FreeAndNil( qyPlanoConta );

end;

procedure TfrmApropriaAlteraCaixa.inserir();
var
   vl_movimento,
   cd_conta,
   ds_conta,
   cd_centro,
   ds_centro            : string;

   i: Integer;

   vl_total,
   vl_total_inserido    : Double;

   arrCentrosFilhos     : TList;
begin

   if cmbPlanoContas.ItemIndex > -1 then
   begin
      cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();
      ds_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getDescricao();
   end;

   if objCentroSelecionado <> nil then
   begin
      cd_centro := IntToStr(objCentroSelecionado.Centro);
      ds_centro := objCentroSelecionado.Descricao;
   end;

   if (edPorcentagem.getValor > 0) and (txtVlNota.getValor = 0) then
   begin
      vl_total :=
         (edPorcentagem.getValor / 100) *
         (StrToFloat(frm_Tesouraria_Gerar.edValorDinheiro.Text) +
         StrToFloat(frm_Tesouraria_Gerar.edValorCheque.Text));
   end;

   if txtVlNota.getValor > 0 then
   begin
      vl_total := txtVlNota.getValor;
   end;

   if (trim(cd_conta)    <> '') and
      (trim(ds_conta)      <> '') and (trim(cd_centro)   <> '') and
      (trim(ds_centro)     <> '') and 
      (vl_total > 0) then
   begin

      if objCentroSelecionado.TipoCentro = 1 then
      begin
         objApropriacao := TFinApropriaTesouraria.Create;

         //adiciona na lista apenas o unico critério existente
         objApropriacao.setValorCampo( 'cd_conta',       cd_conta );
         objApropriacao.setValorCampo( 'cd_centro',      cd_centro );
         objApropriacao.setValorCampo( 'vl_movimento',   FloatToStr(vl_total) );

         ListaApropriacoes.Add( objApropriacao );
         objApropriacao := nil;
      end;

      if objCentroSelecionado.TipoCentro = 2 then
      begin
         arrCentrosFilhos := TList.Create;
         arrCentrosFilhos.Clear;

         DM.getArraysFilhosSinteticos(
            StrToInt(cd_centro),
            arrCentrosFilhos,
            true
         );

         for I := 0 to arrCentrosFilhos.Count - 1 do
         begin
            TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo', cd_titulo );
            TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_conta', cd_conta );
            
            TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo(
               'cd_coligada',
               IntToStr(TColigada(frm_Tesouraria_gerar.cbUnidadeEnsino.Items.Objects[frm_Tesouraria_gerar.cbUnidadeEnsino.ItemIndex]).Codigo)
            );
                                                       
            if (arrCentrosFilhos.Count - 1) = I then
            begin
               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', FloatToStr(vl_total - vl_total_inserido) );
            end
            else
            begin
               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', FloatToStr( RoundFloat(vl_total/arrCentrosFilhos.Count, 2)));
            end;

            vl_total_inserido := vl_total_inserido +  RoundFloat((vl_total/arrCentrosFilhos.Count), 2);
            vl_total_inserido := RoundFloat(vl_total_inserido, 2);

            ListaApropriacoes.Add( TFinApropriaTesouraria(arrCentrosFilhos.Items[i]) );
         end;
      end;
   end;
end;

procedure TfrmApropriaAlteraCaixa.limpaTodosObjetos;
var
   i: integer;
begin
   //libera a lista de planos de contas
   for i := cmbPlanoContas.Items.Count - 1 downto 0 do
   begin
      (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbPlanoContas.Clear;

   objCentroSelecionado := nil;

   if Self.objApropriacao <> nil then
   begin
      FreeAndNil( objApropriacao );
   end;
end;

procedure TfrmApropriaAlteraCaixa.sbPlanoContasClick(Sender: TObject);
var
   cd_plano_conta : integer;
   ds_plano_conta : string;
   i              : integer;
begin
   cd_plano_conta := 0;
   ds_plano_conta := '';
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      cd_plano_conta := frm_SelConta.qyPlanosContas.FieldByName('cd_conta').AsInteger;
      ds_plano_conta := frm_SelConta.qyPlanosContas.FieldByName('ds_conta').AsString;
   end;

   if  (cd_plano_conta <> 0) and (ds_plano_conta <> '')  then
   begin

      for i := 0 to cmbPlanoContas.Items.Count - 1 do
      begin
         if ( (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).getCodigo = IntToStr(cd_plano_conta) ) then
         begin
            cmbPlanoContas.ItemIndex   := i;
            
            //executa a rotina para preencher o campo historico com o plano de contas se estiver vazio
            cmbPlanoContas.OnChange(nil);
            break;
         end;
      end;
   end;

end;

procedure TfrmApropriaAlteraCaixa.setCdApropriacaoSelecionada(valor: integer);
begin
   Self.cd_apropriacao_selecionada := valor;
end;

procedure TfrmApropriaAlteraCaixa.setCdTitulo(valor: string);
begin
   Self.cd_titulo := valor;
end;

procedure TfrmApropriaAlteraCaixa.setContaSelecionada(valor: string);
begin
   Self.cd_conta_selecionada := valor;
end;

procedure TfrmApropriaAlteraCaixa.setFormEstado(valor: string);
begin
   Self.form_estado := valor;
end;

procedure TfrmApropriaAlteraCaixa.SpeedButton1Click(Sender: TObject);
var
   retorno: TResultadoBuscaCentro;
begin

   retorno := TfrmBuscaCentro.getInstancia.ShowModal();

   if retorno.objCentro <> nil then
   begin
      edCentroCusto.Text := retorno.objCentro.Descricao;
      txtCdCentro.Text := IntToStr(retorno.objCentro.Centro);
      objCentroSelecionado := retorno.objCentro;
   end;
end;

procedure TfrmApropriaAlteraCaixa.txtCdCentroExit(Sender: TObject);
begin
   Self.SelecionaCentroCusto( txtCdCentro.Text );
end;

procedure TfrmApropriaAlteraCaixa.txtCdCentroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAlteraCaixa.txtCdContaExit(Sender: TObject);
begin
   Self.SelecionaPlanoConta( txtCdConta.Text );
end;

procedure TfrmApropriaAlteraCaixa.txtCdContaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAlteraCaixa.txtVlNotaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAlteraCaixa.SelecionaCentroCusto(cd_centro: string);
var
   i                 : integer;
   cd_centro_lista   : string;
   bEncontrou        : boolean;
begin
   bEncontrou := false;

   if txtCdCentro.Text = '' then
   begin
      Exit;
   end;

   try
      objCentroSelecionado := TCentroCusto.Create(StrToInt(txtCdCentro.Text));

      edCentroCusto.Text := objCentroSelecionado.Descricao;

      if objCentroSelecionado.Descricao = '' then
      begin
         raise Exception.Create('Erro');
      end;

   except
      on E: Exception do
      begin
         Mensagem( 'Código inválido', 'Atenção', MB_OK + MB_ICONWARNING );
         txtCdCentro.SetFocus;
      end;
   end;
end;

procedure TfrmApropriaAlteraCaixa.SelecionaPlanoConta(cd_conta: string);
var
   i              : integer;
   cd_conta_lista : string;
   bEncontrou     : boolean;
begin
   bEncontrou := false;
   if trim(cd_conta) <> '' then
   begin
      for i := 0 to cmbPlanoContas.Items.Count - 1 do
      begin
         cd_conta_lista := (cmbPlanoContas.Items.Objects[ i ] as TItemCompromisso).getCodigo();

         if cd_conta_lista = cd_conta then
         begin
            cmbPlanoContas.ItemIndex := i;
            bEncontrou := true;
            break;
         end;
      end;
   end;

   if (bEncontrou = false) and (trim(cd_conta) <> '') then
   begin
      Mensagem( 'Código inválido', 'Atenção', MB_OK + MB_ICONWARNING );
      cmbPlanoContas.ItemIndex := -1;
   end;
end;

end.
