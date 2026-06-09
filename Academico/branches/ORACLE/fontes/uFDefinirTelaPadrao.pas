unit uFDefinirTelaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, ToolWin, ComCtrls, ImgList;

const
   MODULO_ACADEMICO = 'ACADEMICO';
   MODULO_FINANCEIRO = 'FINANCEIRO';
   MSG_NENHUMA_TELA = 'Nenhuma tela foi definida.';

type
  TArrayPadroes = class(TStringList)
   strict private
      FDescricao, FChave, FFuncao: string;
      FObjeto: TArrayPadroes;
      FSelecionavel, FIsFinanceiro: Boolean;
  private
    function GetObjetoByChave(ds_chave: String): TArrayPadroes;
   public
      constructor Create(const ds_descricao, ds_chave: String; const sn_selecionavel: Boolean; const ds_funcao: String = ''; sn_financeiro: Boolean = False); overload;

      property Chave: string read FChave write FChave;
      property Descricao: string read FDescricao write FDescricao;
      property Funcao: string read FFuncao write FFuncao;
      property Selecionavel: Boolean read FSelecionavel write FSelecionavel;
      property Objeto: TArrayPadroes read FObjeto write FObjeto;
      property IsFinanceiro: Boolean read FIsFinanceiro write FIsFinanceiro;
      property ObjetoByChave[ds_chave: String]: TArrayPadroes read GetObjetoByChave;
  end;

  TfDefinirTelaPadrao = class(TForm)
    Panel1: TPanel;
    pnItens: TPanel;
    ltb1: TListBox;
    Panel2: TPanel;
    Label1: TLabel;
    lbTelaPadraoSistema: TLabel;
    Button1: TButton;
    ToolBar1: TToolBar;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ImageList: TImageList;
    ToolButton1: TToolButton;
    btnFechar: TToolButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure ltb1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   FNivelAtual: Integer;
   FArraySelecionado: array of String;
   FTelaPadrao, FTelaPadraoIsFinanceiro, FSalvarTelaPadrao: String;
   FSalvarTelaInicialIsFinanceiro: Boolean;

    { Private declarations }
    FArrayModulos: TArrayPadroes;
    function GetSalvarTelaPadrao: String;
    procedure SetSalvarTelaPadrao(const Value: String);

    procedure CarregarMenusAcademico();
    procedure CarregarMenusFinanceiro();

    procedure CriaNovaLista( Sender: TObject; tag_atual: Integer );
    procedure DestroiListasOutroNivel( tag_limit: Integer );
    procedure SalvarTelaPadrao( tela_padrao: String; sn_financeiro: Boolean );

    function GetTelaSelecionada(): String;

    property SalvarTelaInicial: String read GetSalvarTelaPadrao write SetSalvarTelaPadrao;
    property SalvarTelaInicialIsFinanceiro: Boolean read FSalvarTelaInicialIsFinanceiro write FSalvarTelaInicialIsFinanceiro;
  public
    { Public declarations }
  end;

var
  fDefinirTelaPadrao: TfDefinirTelaPadrao;

implementation

uses Main, Menus, uDM, General;

{$R *.dfm}

procedure TfDefinirTelaPadrao.btnCancelarClick(Sender: TObject);
begin
   SalvarTelaInicial := '';
   SalvarTelaInicialIsFinanceiro := False;
end;

procedure TfDefinirTelaPadrao.btnSalvarClick(Sender: TObject);
begin
   lbTelaPadraoSistema.Caption := GetTelaSelecionada();
   SalvarTelaPadrao(SalvarTelaInicial, SalvarTelaInicialIsFinanceiro);

   SalvarTelaInicial := '';
   SalvarTelaInicialIsFinanceiro := False;
end;

procedure TfDefinirTelaPadrao.Button1Click(Sender: TObject);
begin
   if (Mensagem('Tem certeza que deseja remover a tela padrão de visualização no acesso ao sistema?', 'Atenção', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes) then
      Exit;

   SalvarTelaInicial := '';
   SalvarTelaInicialIsFinanceiro := False;

   SalvarTelaPadrao('', False);
   lbTelaPadraoSistema.Caption := MSG_NENHUMA_TELA;
end;

procedure TfDefinirTelaPadrao.CarregarMenusAcademico;
var
   I, J, MenuSelecionado, SubMenuSelecionado,
   SubMenuSelecionadoMenos: Integer;

   NomeFuncao: String;
   ArrayPopUpMenu: array of TPopupMenu;
begin
   MenuSelecionado := -1;
   SubMenuSelecionado := -1;
   SubMenuSelecionadoMenos := 0;

   // Menu
   FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].AddObject( 'Cadastros', TArrayPadroes.Create( 'Cadastros', 'popAcademicoCadastros', false ) );
   FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].AddObject( 'Pessoas', TArrayPadroes.Create( 'Pessoas', 'popAcademicosPessoas', false ) );
   FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].AddObject( 'Matrículas', TArrayPadroes.Create( 'Matrículas', 'popAcademicoMatriculas', false ) );
   FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].AddObject( 'Secretaria', TArrayPadroes.Create( 'Secretaria', 'popAcademicoSecretaria', false ) );
   FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].AddObject( 'Relatórios', TArrayPadroes.Create( 'Relatórios', 'popAcademicoRelatorios', false ) );

   SetLength(ArrayPopUpMenu, 5);

   ArrayPopUpMenu[0] := PrincipalForm.popAcademicoCadastros;
   ArrayPopUpMenu[1] := PrincipalForm.popAcademicosPessoas;
   ArrayPopUpMenu[2] := PrincipalForm.popAcademicoMatriculas;
   ArrayPopUpMenu[3] := PrincipalForm.popAcademicoSecretaria;
   ArrayPopUpMenu[4] := PrincipalForm.popAcademicoRelatorios;

   for J := Low(ArrayPopUpMenu) to Length(ArrayPopUpMenu) - 1 do
   begin
      // Adiciona os itens
      for I := 0 to ArrayPopUpMenu[J].Items.Count - 1 do
      begin
         if (ArrayPopUpMenu[J].Items.Items[I].Caption <> '-') then
         begin
            // GetFuncaoEvento = GetFuncaoEvento(PrincipalForm.popAcademicoCadastros.Items.Items[I]);
            // Nome do item = PrincipalForm.popAcademicoCadastros.Items.Items[I].Caption;
            NomeFuncao := GetFuncaoEvento(ArrayPopUpMenu[J].Items.Items[I]);

            if (NomeFuncao = FTelaPadrao) AND (FTelaPadrao <> '') AND (FTelaPadraoIsFinanceiro <> 'S') then
            begin
               lbTelaPadraoSistema.Caption :=
                  'Acadêmico -> ' +
                  FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].ObjetoByChave[ArrayPopUpMenu[J].Name].Descricao + ' -> ' +
                  ArrayPopUpMenu[J].Items.Items[I].Caption;

               ltb1.ItemIndex := 0;
               ltb1Click(ltb1);
               MenuSelecionado := J;
               SubMenuSelecionado := I - SubMenuSelecionadoMenos;
            end;            

            {if (NomeFuncao <> '') then
            begin}
               FArrayModulos.ObjetoByChave[MODULO_ACADEMICO].ObjetoByChave[ArrayPopUpMenu[J].Name].AddObject(
                  ReplaceStr(ArrayPopUpMenu[J].Items.Items[I].Caption, '&', ''),
                  TArrayPadroes.Create(
                     ReplaceStr(ArrayPopUpMenu[J].Items.Items[I].Caption, '&', ''),
                     ReplaceStr(ArrayPopUpMenu[J].Items.Items[I].Caption, '&', ''),
                     (trim(NomeFuncao) <> ''), NomeFuncao
                  )
               );
            {end;}
         end else begin
            Inc(SubMenuSelecionadoMenos);
         end;
      end;
   end;

   if (MenuSelecionado >= 0) AND (SubMenuSelecionado >= 0) then
   begin
      TListBox(pnItens.FindComponent('ltb2')).ItemIndex := MenuSelecionado;
      ltb1Click(TListBox(pnItens.FindComponent('ltb2')));
      TListBox(pnItens.FindComponent('ltb3')).ItemIndex := SubMenuSelecionado;
      ltb1Click(TListBox(pnItens.FindComponent('ltb3')));

      SalvarTelaInicial := '';
      SalvarTelaInicialIsFinanceiro := False;
   end;
end;

procedure TfDefinirTelaPadrao.CarregarMenusFinanceiro;
var
   I, J, MenuSelecionado, SubMenuSelecionado,
   SubMenuSelecionadoMenos: Integer;
   NomeFuncao: String;
   ArrayPopUpMenu: array of TPopupMenu;
begin
   MenuSelecionado := -1;
   SubMenuSelecionado := -1;

   // Menu
   FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].AddObject( 'Cadastros', TArrayPadroes.Create( 'Cadastros', 'popFinanceiroCadastros', false ) );
   FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].AddObject( 'Pessoas', TArrayPadroes.Create( 'Pessoas', 'popAcademicosPessoas', false ) );
   FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].AddObject( 'Recebimentos', TArrayPadroes.Create( 'Recebimentos', 'popFinanceiroMensalidades', false ) );
   FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].AddObject( 'Tesouraria', TArrayPadroes.Create( 'Tesouraria', 'popFinanceiroCaixa', false ) );
   FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].AddObject( 'Compromissos', TArrayPadroes.Create( 'Compromissos', 'pmFinanceiroContasPagar', false ) );
   FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].AddObject( 'Relatórios', TArrayPadroes.Create( 'Relatórios', 'popFinanceiroRelatorios', false ) );

   SetLength(ArrayPopUpMenu, 6);

   ArrayPopUpMenu[0] := PrincipalForm.popFinanceiroCadastros;
   ArrayPopUpMenu[1] := PrincipalForm.popAcademicosPessoas;
   ArrayPopUpMenu[2] := PrincipalForm.popFinanceiroMensalidades;
   ArrayPopUpMenu[3] := PrincipalForm.popFinanceiroCaixa;
   ArrayPopUpMenu[4] := PrincipalForm.popFinanceiroContasPagar;
   ArrayPopUpMenu[5] := PrincipalForm.popFinanceiroRelatorios;

   for J := Low(ArrayPopUpMenu) to Length(ArrayPopUpMenu) - 1 do
   begin
      // Adiciona os itens
      for I := 0 to ArrayPopUpMenu[J].Items.Count - 1 do
      begin
         if (ArrayPopUpMenu[J].Items.Items[I].Caption <> '-') then
         begin
            // GetFuncaoEvento = GetFuncaoEvento(PrincipalForm.popAcademicoCadastros.Items.Items[I]);
            // Nome do item = PrincipalForm.popAcademicoCadastros.Items.Items[I].Caption;
            NomeFuncao := GetFuncaoEvento(ArrayPopUpMenu[J].Items.Items[I]);

            if (NomeFuncao = FTelaPadrao) AND (FTelaPadrao <> '') AND (FTelaPadraoIsFinanceiro = 'S') then
            begin
               lbTelaPadraoSistema.Caption :=
                  'Financeiro -> ' +
                  FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].ObjetoByChave[ArrayPopUpMenu[J].Name].Descricao + ' -> ' +
                  ArrayPopUpMenu[J].Items.Items[I].Caption;

               ltb1.ItemIndex := 1;
               ltb1Click(ltb1);
               MenuSelecionado := J;
               SubMenuSelecionado := I - SubMenuSelecionadoMenos;
            end;

            {if ( NomeFuncao <> '' ) then
            begin}
               FArrayModulos.ObjetoByChave[MODULO_FINANCEIRO].ObjetoByChave[ArrayPopUpMenu[J].Name].AddObject(
                  ReplaceStr(ArrayPopUpMenu[J].Items.Items[I].Caption, '&', ''),
                  TArrayPadroes.Create(
                     ReplaceStr(ArrayPopUpMenu[J].Items.Items[I].Caption, '&', ''),
                     ReplaceStr(ArrayPopUpMenu[J].Items.Items[I].Caption, '&', ''),
                     (trim(NomeFuncao) <> ''), NomeFuncao, True
                  )
               );
            {end;} 
         end else begin
            Inc(SubMenuSelecionadoMenos);
         end;
      end;
   end;

   if (MenuSelecionado >= 0) AND (SubMenuSelecionado >= 0) then
   begin
      TListBox(pnItens.FindComponent('ltb2')).ItemIndex := MenuSelecionado;
      ltb1Click(TListBox(pnItens.FindComponent('ltb2')));
      TListBox(pnItens.FindComponent('ltb3')).ItemIndex := SubMenuSelecionado;
      ltb1Click(TListBox(pnItens.FindComponent('ltb3')));

      SalvarTelaInicial := '';
      SalvarTelaInicialIsFinanceiro := False;
   end;
end;

procedure TfDefinirTelaPadrao.CriaNovaLista(Sender: TObject; tag_atual: Integer);
   function GetObjetoItems(primeira_tag, atual_tag: Integer; objeto: TArrayPadroes): TArrayPadroes;
   begin
      if ( primeira_tag = atual_tag ) then
      begin
         Result := objeto;
      end else begin
         if primeira_tag = 1 then
         begin
            Result := GetObjetoItems(primeira_tag+1, atual_tag, objeto.ObjetoByChave[
               TArrayPadroes(
                  TListBox(FindComponent('ltb'+IntToStr(primeira_tag))).Items
                     .Objects[TListBox(FindComponent('ltb'+IntToStr(primeira_tag))).ItemIndex]
               ).Chave
            ]);
         end else begin
            Result := GetObjetoItems(primeira_tag+1, atual_tag, objeto.ObjetoByChave[
               TArrayPadroes(
                  TListBox(pnItens.FindComponent('ltb'+IntToStr(primeira_tag))).Items
                     .Objects[TListBox(pnItens.FindComponent('ltb'+IntToStr(primeira_tag))).ItemIndex]
               ).Chave
            ]);
         end;
      end;      
   end;
var
   new_listbox: TListBox;
   new_tag: Integer;
   LObjeto: TArrayPadroes;
begin
   new_tag := tag_atual + 1;

   DestroiListasOutroNivel( new_tag );

   SetLength(FArraySelecionado, tag_atual);
   FArraySelecionado[tag_atual-1] := TListBox(Sender).Items[TListBox(Sender).ItemIndex];

   if not TArrayPadroes(TListBox(Sender).Items.Objects[TListBox(Sender).ItemIndex]).Selecionavel then
   begin
      SalvarTelaInicial := '';
      SalvarTelaInicialIsFinanceiro := False;

      LObjeto := GetObjetoItems(1, new_tag, FArrayModulos);
      //LObjeto := FArrayModulos.ObjetoByChave[TArrayPadroes(TListBox(Sender).Items.Objects[TListBox(Sender).ItemIndex]).Chave];

      if (pnItens.FindComponent('ltb' + IntToStr(new_tag)) = nil) then
      begin
         new_listbox := TListBox.Create(pnItens);

         with new_listbox do
         begin
            Tag := new_tag;
            Parent := pnItens;
            Name := 'ltb' + IntToStr(new_tag);
            if new_tag > 1 then
               Width := 200
            else
               Width := 160;            
            Align := alRight;
            Align := alLeft;
            //TListBox(Sender).Items.Objects[TListBox(Sender).ItemIndex]
            Items.Assign(LObjeto);
            OnClick := ltb1Click;
         end;
      end else begin
         TListBox(pnItens.FindComponent('ltb' + IntToStr(new_tag))).Items.Assign(LObjeto);
      end;
   end else begin
      SalvarTelaInicial := TArrayPadroes(TListBox(Sender).Items.Objects[TListBox(Sender).ItemIndex]).Funcao;
      SalvarTelaInicialIsFinanceiro := TArrayPadroes(TListBox(Sender).Items.Objects[TListBox(Sender).ItemIndex]).IsFinanceiro;
   end;
end;

procedure TfDefinirTelaPadrao.DestroiListasOutroNivel(tag_limit: Integer);
var
   I: Integer;
begin
   for I := 0 to pnItens.ComponentCount - 1 do
   begin
      if (pnItens.Components[I] is TListBox) AND
         (TListBox(pnItens.Components[I]).Tag > tag_limit) then
         pnItens.Components[I].Destroy;
   end;
end;

procedure TfDefinirTelaPadrao.FormCreate(Sender: TObject);
begin
   FArrayModulos := TArrayPadroes.Create;

   FArrayModulos.AddObject( 'Acadêmico', TArrayPadroes.Create( 'Acadêmico', MODULO_ACADEMICO, False ) );
   FArrayModulos.AddObject( 'Financeiro', TArrayPadroes.Create( 'Financeiro', MODULO_FINANCEIRO, False ) );
   ltb1.Items.Assign(FArrayModulos);

   FTelaPadrao := DM.Get_Parametro_usuario_valor('TelaPadrao', 'SISTEMA');
   FTelaPadraoIsFinanceiro := DM.Get_Parametro_usuario_valor('TelaPadrao.IsFinanceiro', 'SISTEMA');
   lbTelaPadraoSistema.Caption := MSG_NENHUMA_TELA;
   SalvarTelaInicial := '';
   SalvarTelaInicialIsFinanceiro := False;

   CarregarMenusAcademico();
   CarregarMenusFinanceiro();
end;

procedure TfDefinirTelaPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5: if btnSalvar.Enabled then btnSalvarClick( nil );
      VK_F6: if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F12: btnFecharClick( nil );
   end;
end;

procedure TfDefinirTelaPadrao.FormShow(Sender: TObject);
begin
   FNivelAtual := 1;
end;

function TfDefinirTelaPadrao.GetSalvarTelaPadrao: String;
begin
   Result := FSalvarTelaPadrao;
end;

function TfDefinirTelaPadrao.GetTelaSelecionada: String;
var
   I: Integer;
begin
   Result := '';
   for I := Low(FArraySelecionado) to Length(FArraySelecionado) - 2 do
      Result := Result + FArraySelecionado[I] + ' -> ';

   if Length(FArraySelecionado) = 0 then
      Result := MSG_NENHUMA_TELA
   else
      Result := Result + FArraySelecionado[Length(FArraySelecionado)-1];
end;

procedure TfDefinirTelaPadrao.ltb1Click(Sender: TObject);
begin
   CriaNovaLista(Sender, TListBox(Sender).Tag);
end;

procedure TfDefinirTelaPadrao.SalvarTelaPadrao(tela_padrao: String; sn_financeiro: Boolean);
begin
   DM.Set_Parametro_usuario_valor('TelaPadrao', tela_padrao, 'SISTEMA');
   if sn_financeiro then
      DM.Set_Parametro_usuario_valor('TelaPadrao.IsFinanceiro', 'S', 'SISTEMA')
   else
      DM.Set_Parametro_usuario_valor('TelaPadrao.IsFinanceiro', 'N', 'SISTEMA');
end;

procedure TfDefinirTelaPadrao.SetSalvarTelaPadrao(const Value: String);
begin
   btnSalvar.Enabled := (trim(Value) <> '');
   btnCancelar.Enabled := (trim(Value) <> '');   

   FSalvarTelaPadrao := Value;
end;

procedure TfDefinirTelaPadrao.btnFecharClick(Sender: TObject);
begin
   Close();
end;

{ TArrayPadroes }

constructor TArrayPadroes.Create(const ds_descricao, ds_chave: String;
  const sn_selecionavel: Boolean; const ds_funcao: String = ''; sn_financeiro: Boolean = False);
begin
   FDescricao := ds_descricao;
   FChave := ds_chave;
   FSelecionavel := sn_selecionavel;
   FFuncao := ds_funcao;
   FIsFinanceiro := sn_financeiro;
end;

function TArrayPadroes.GetObjetoByChave(ds_chave: String): TArrayPadroes;
var
   I: Integer;
begin
   for I := 0 to Self.Count - 1 do
   begin
      if TArrayPadroes(Self.Objects[I]).Chave = ds_chave then
      begin
         Result := TArrayPadroes(Self.Objects[I]);
         break;
      end;
   end;      
end;

end.
