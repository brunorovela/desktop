unit UCompromisso_apropria_altera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, udm, General, UItemCompromisso,
  UFinApropriaCPClass, UMEditMonetario, UZDataset, Contnrs, UMEditNumerico,
  uBuscaCentro, uCentroCusto, StrUtils;

type
  TfrmApropriaAltera = class(TForm)
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
    sbCentroCusto: TSpeedButton;
    procedure sbCentroCustoClick(Sender: TObject);
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
  private
     objApropriacao              : TFinApropriaCP;
     cd_apropriacao_selecionada  : integer;
     form_estado                 : string;
     cd_titulo                   : string;
     cd_conta_selecionada        : string;
     objCentroSelecionado        : TCentroCusto;
    { Private declarations }
  public
    cd_coligada_seleciona : Integer;
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
  frmApropriaAltera: TfrmApropriaAltera;

implementation

uses uSelConta, uCompromisso_cadastro;

{$R *.dfm}

procedure TfrmApropriaAltera.alterar;
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

   (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaCP).setValorCampo( 'cd_conta',      cd_conta );
   (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaCP).setValorCampo( 'cd_centro',     cd_centro );
   (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaCP).setValorCampo( 'vl_movimento',  vl_movimento );

   Self.Close();
end;

procedure TfrmApropriaAltera.btnCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmApropriaAltera.btnConfirmarClick(Sender: TObject);
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

procedure TfrmApropriaAltera.carregaDados;
var
   i              : integer;
   cd_conta       : string;
   cd_centro      : string;
   vl_movimento   : string;
begin
   cd_conta       := (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaCP).getValorCampo('cd_conta');
   cd_centro      := (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaCP).getValorCampo('cd_centro');
   vl_movimento   := (ListaApropriacoes.Items[Self.getCdApropriacaoSelecionada()] as TFinApropriaCP).getValorCampo('vl_movimento');

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

procedure TfrmApropriaAltera.cmbCentroCustoChange(Sender: TObject);
var
   cd_centro: string;
begin
   if objCentroSelecionado <> nil then
   begin
      cd_centro := IntToStr(objCentroSelecionado.Centro);

      txtCdCentro.text := cd_centro;
   end;

end;

procedure TfrmApropriaAltera.cmbCentroCustoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAltera.cmbPlanoContasChange(Sender: TObject);
var
   cd_conta: string;
begin
   if cmbPlanoContas.ItemIndex > -1 then
   begin
      cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();

      txtCdConta.Text := cd_conta;
   end;
end;

procedure TfrmApropriaAltera.cmbPlanoContasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAltera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Self.limpaTodosObjetos();

   Action := caFree;
end;

procedure TfrmApropriaAltera.FormShow(Sender: TObject);
begin
   Self.getListaPlanoContas();
//   Self.getListaCentroCustos();

   if trim(Self.getContaSelecionada()) <> '' then
   begin
      txtCdConta.Text := Self.getContaSelecionada();
      txtCdConta.OnExit( nil );
   end;                        

   if Self.getFormEstado() = 'alterar' then
   begin
      edPorcentagem.Enabled := False;
      Self.carregaDados();
   end;

   objApropriacao := nil;
end;

function TfrmApropriaAltera.getCdApropriacaoSelecionada: integer;
begin
   Result := Self.cd_apropriacao_selecionada;
end;

function TfrmApropriaAltera.getCdTitulo: string;
begin
   Result := Self.cd_titulo;
end;

function TfrmApropriaAltera.getContaSelecionada: string;
begin
   Result := Self.cd_conta_selecionada;
end;

function TfrmApropriaAltera.getFormEstado: string;
begin
   Result := Self.form_estado;
end;

//procedure TfrmApropriaAltera.getListaCentroCustos;
//var
//   qyCentroCusto     : TUMZQuery;
//   objItem           : TItemCompromisso;
//   cd_centro_custo   : string;
//   ds_centro_custo   : string;
//   cd_coligada       : integer;
//begin
//   cd_centro_custo   := '';
//   ds_centro_custo   := '';
//   qyCentroCusto     := nil;
//   cd_coligada       := Self.cd_coligada_seleciona;
//
//   DM.CriarConsulta( qyCentroCusto );
//   qyCentroCusto.Close();
//   qyCentroCusto.SQL.Clear;
//   qyCentroCusto.SQL.Add('SELECT                                         ');
//   qyCentroCusto.SQL.Add(' cd_centro, cd_classificacao, ds_centro        ');
//   qyCentroCusto.SQL.Add('FROM                                           ');
//   qyCentroCusto.SQL.Add(' fin_centro_custos                             ');
//   qyCentroCusto.SQL.Add('WHERE                                          ');
//   qyCentroCusto.SQL.Add(' tp_centro = 1 AND sn_ativo = 1               ');
//   qyCentroCusto.SQL.Add(' AND cd_coligada = ' + IntToStr( cd_coligada )  );
//   qyCentroCusto.SQL.Add('ORDER BY ds_centro '  );
//   qyCentroCusto.Open();
//
//   while not qyCentroCusto.Eof do
//   begin
//      cd_centro_custo := qyCentroCusto.FieldByName('cd_centro').AsString;
//      ds_centro_custo := concat(qyCentroCusto.FieldByName('cd_classificacao').AsString , '  ',
//                         qyCentroCusto.FieldByName('ds_centro').AsString);
//
//      ds_centro_custo := trim(ds_centro_custo);
//
//      objItem := TItemCompromisso.Create( cd_centro_custo, ds_centro_custo );
//
//      cmbCentroCusto.Items.AddObject( objItem.getDescricao, objItem );
//
//      qyCentroCusto.Next;
//   end;
//
//   FreeAndNil( qyCentroCusto );
//
//end;

procedure TfrmApropriaAltera.getListaPlanoContas;
var
   qyPlanoConta      : TUMZQuery;
   objItem           : TItemCompromisso;
   cd_plano_conta    : string;
   ds_plano_conta    : string;
   cd_coligada       : integer;
begin
   cd_plano_conta    := '';
   ds_plano_conta    := '';
   qyPlanoConta      := nil;
   cd_coligada       := Self.cd_coligada_seleciona;

   DM.CriarConsulta( qyPlanoConta );
   qyPlanoConta.Close();
   qyPlanoConta.SQL.Clear;
   qyPlanoConta.SQL.Add('SELECT                                         ');
   qyPlanoConta.SQL.Add(' cd_conta, ds_conta                            ');
   qyPlanoConta.SQL.Add('FROM                                           ');
   qyPlanoConta.SQL.Add(' fin_plano_contas                              ');
   qyPlanoConta.SQL.Add('WHERE                                          ');
   qyPlanoConta.SQL.Add(' tp_conta = 1                                  ');
   qyPlanoConta.SQL.Add(' AND cd_coligada = ' + IntToStr( cd_coligada )  );
   qyPlanoConta.SQL.Add(' AND sn_ativo = 1                              ');
   qyPlanoConta.SQL.Add(' AND tp_entrada_saida IN (0,2)                 ');
   qyPlanoConta.SQL.Add('ORDER BY ds_conta                              ');
   qyPlanoConta.Open();

   while not qyPlanoConta.Eof do
   begin
      cd_plano_conta := qyPlanoConta.FieldByName('cd_conta').AsString;
      ds_plano_conta := qyPlanoConta.FieldByName('ds_conta').AsString;

      objItem := TItemCompromisso.Create( cd_plano_conta, ds_plano_conta );

      cmbPlanoContas.Items.AddObject( objItem.getDescricao, objItem );

      qyPlanoConta.Next;
   end;

   FreeAndNil( qyPlanoConta );

end;

procedure TfrmApropriaAltera.inserir;
var
   vl_movimento,
   cd_coligada,
   cd_conta,
   ds_conta,
   cd_centro,
   ds_centro            : string;

   i: Integer;

   vl_total,
   vl_total_inserido    : Double;

   arrCentrosFilhos     : TList;
begin
   vl_movimento   := txtVlNota.getValorString();
   cd_coligada    := IntToStr(Self.cd_coligada_seleciona);

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
         (frmCompromissoCadastro.txtVlNota.getValor);
   end;

   if txtVlNota.getValor > 0 then
   begin
      vl_total := txtVlNota.getValor;   
   end;

   if (trim(cd_conta)    <> '') and
      (trim(ds_conta)      <> '') and (trim(cd_centro)   <> '') and
      (trim(ds_centro)     <> '') and (trim(cd_coligada) <> '') and
      (vl_total > 0) then
   begin

      if objCentroSelecionado.TipoCentro = 1 then
      begin
         objApropriacao := TFinApropriaCP.Create();

         //adiciona na lista apenas o unico critério existente
         objApropriacao.setValorCampo( 'cd_titulo',      cd_titulo );
         objApropriacao.setValorCampo( 'cd_coligada',    cd_coligada );
         objApropriacao.setValorCampo( 'cd_conta',       cd_conta );
         objApropriacao.setValorCampo( 'cd_centro',      cd_centro );
         objApropriacao.setValorCampo( 'vl_movimento',   frmCompromissoCadastro.getformataValorParaObjeto(vl_total));

         ListaApropriacoes.Add( objApropriacao );
         objApropriacao := nil;
      end;

      if objCentroSelecionado.TipoCentro = 2 then
      begin
         arrCentrosFilhos := TList.Create;
         arrCentrosFilhos.Clear;

         DM.getArraysFilhosSinteticos(
            StrToInt(cd_centro),
            arrCentrosFilhos
         );

         for I := 0 to arrCentrosFilhos.Count - 1 do
         begin

            TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo',      cd_titulo );
            TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_coligada',    cd_coligada );
            TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_conta',       cd_conta );

            if (arrCentrosFilhos.Count - 1) = I then
            begin
               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', frmCompromissoCadastro.getformataValorParaObjeto(vl_total - vl_total_inserido) );
            end
            else
            begin
               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', frmCompromissoCadastro.getformataValorParaObjeto(RoundFloat(vl_total/arrCentrosFilhos.Count, 2)) );
            end;

            vl_total_inserido := vl_total_inserido + (vl_total/arrCentrosFilhos.Count);
            vl_total_inserido := RoundFloat(vl_total_inserido, 2);

            ListaApropriacoes.Add( TFinApropriaCP(arrCentrosFilhos.Items[i]) );
         end;
      end;
   end;
end;

procedure TfrmApropriaAltera.limpaTodosObjetos;
var
   i: integer;
begin
   //libera a lista de planos de contas
   for i := cmbPlanoContas.Items.Count - 1 downto 0 do
   begin
      (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbPlanoContas.Clear;

   FreeAndNil(objCentroSelecionado);

   if Self.objApropriacao <> nil then
   begin
      FreeAndNil( objApropriacao );
   end;
end;

procedure TfrmApropriaAltera.sbCentroCustoClick(Sender: TObject);
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

procedure TfrmApropriaAltera.sbPlanoContasClick(Sender: TObject);
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

procedure TfrmApropriaAltera.setCdApropriacaoSelecionada(valor: integer);
begin
   Self.cd_apropriacao_selecionada := valor;
end;

procedure TfrmApropriaAltera.setCdTitulo(valor: string);
begin
   Self.cd_titulo := valor;
end;

procedure TfrmApropriaAltera.setContaSelecionada(valor: string);
begin
   Self.cd_conta_selecionada := valor;
end;

procedure TfrmApropriaAltera.setFormEstado(valor: string);
begin
   Self.form_estado := valor;
end;

procedure TfrmApropriaAltera.txtCdCentroExit(Sender: TObject);
begin
   Self.SelecionaCentroCusto( txtCdCentro.Text );
end;

procedure TfrmApropriaAltera.txtCdCentroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAltera.txtCdContaExit(Sender: TObject);
begin
   Self.SelecionaPlanoConta( txtCdConta.Text );
end;

procedure TfrmApropriaAltera.txtCdContaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAltera.txtVlNotaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmApropriaAltera.SelecionaCentroCusto(cd_centro: string);
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

procedure TfrmApropriaAltera.SelecionaPlanoConta(cd_conta: string);
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

   if (bEncontrou = false) and (trim(cd_conta) <> '0') and (trim(cd_conta) <> '') then
   begin
      Mensagem( 'Código inválido', 'Atenção', MB_OK + MB_ICONWARNING );
      cmbPlanoContas.ItemIndex := -1;
   end;
end;

end.
