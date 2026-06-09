unit uBiblioMultaEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGrids, Provider, SqlExpr, DB,
  uDM, StdCtrls, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TFrmMultaEmprestimo = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    dgMultas: TDBGrid;
    sbBaixar: TSpeedButton;
    sbIsentar: TSpeedButton;
    SpeedButton3: TSpeedButton;
    dsMultas: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    lbCodPessoa: TLabel;
    Label3: TLabel;
    lbNome: TLabel;
    tblMultas: TUMZQuery;
    Panel3: TPanel;
    Label2: TLabel;
    lbMultaPendente: TLabel;
    Label4: TLabel;
    rgFiltro: TRadioGroup;
    tblMultascd_multa: TIntegerField;
    tblMultascd_pessoa: TIntegerField;
    tblMultasdt_multa: TDateTimeField;
    tblMultasvl_multa: TFloatField;
    tblMultasvl_pago: TFloatField;
    tblMultasdt_pagamento: TDateTimeField;
    tblMultascd_situacao: TIntegerField;
    tblMultasds_situacao: TStringField;
    sbMotivo: TSpeedButton;
    qyMultas: TUMZQuery;
    qyMultascd_multa: TIntegerField;
    qyMultascd_pessoa: TIntegerField;
    qyMultasdt_multa: TDateTimeField;
    qyMultasvl_multa: TFloatField;
    qyMultasvl_pago: TFloatField;
    qyMultasdt_pagamento: TDateTimeField;
    qyMultascd_situacao: TIntegerField;
    tblMultasnr_nossonumero: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbBaixarClick(Sender: TObject);
    procedure sbIsentarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tblMultasAfterOpen(DataSet: TDataSet);
    procedure rgFiltroClick(Sender: TObject);
    Procedure Filtra;
    procedure dgMultasDblClick(Sender: TObject);
    procedure sbMotivoClick(Sender: TObject);
  private
    { Private declarations }
    CodigoPessoa : Integer;
    Nome : String;
  public
    { Public declarations }
    Function TemMulta(CodPessoa : Integer; NomPessoa : String; cd_situacao: integer ; MostraTela: boolean) : Boolean;
    Function RegistraMulta( dt_entrega, dt_devolucao: TDateTime; cd_registro, cd_pessoa: integer ): integer;
  end;

var
  FrmMultaEmprestimo: TFrmMultaEmprestimo;

implementation

uses
   VarUtils, uBiblioMotivos, Main, uBiblioMultaEmprestimoLivros;

{$R *.dfm}

function TFrmMultaEmprestimo.TemMulta(CodPessoa: Integer;
  NomPessoa: String; cd_situacao: integer ; MostraTela: boolean): Boolean;
begin
   Nome := NomPessoa;
   CodigoPessoa := CodPessoa;

   case cd_situacao of
      0: rgFiltro.ItemIndex := 3;
      1: rgFiltro.ItemIndex := 2;
      2: rgFiltro.ItemIndex := 1;
      4: rgFiltro.ItemIndex := 4;
    else
      rgFiltro.ItemIndex := 0;
   end;

   Filtra;

   if tblMultas.RecordCount = 0 Then
      result := False
   Else
      Begin
         Result := True;
         lbCodPessoa.Caption := IntToStr(CodigoPessoa);
         lbNome.Caption := Nome;
         if MostraTela then
           ShowModal;
      End;
end;

procedure TFrmMultaEmprestimo.sbBaixarClick(Sender: TObject);
var
  n: integer;
  valor,vl_multa: Currency;
  dt_multa: TDateTime;
  vlr: string;
begin

valor := 0;

if (dgMultas.SelectedRows.Count < 1) OR (rgFiltro.ItemIndex <> 1) then
begin
      Mensagem('Selecione pelo menos uma multa pendente. ', 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
end;

if Pos( 'biblio' , DM.variavel_parametro('biblio_forma_cobranca') ) <= 0 then begin
  Mensagem('A biblioteca não tem permissão para dar baixa em multas.'+chr(13)+'Para dar baixa é necessário utilizar o módulo financeiro.',  'Atenção', MB_OK + MB_ICONWARNING);
  Abort;
end;

if dgMultas.SelectedRows.Count = 1 then
begin
  while (valor > tblMultas.FieldByName('vl_multa').AsCurrency) OR (valor = 0) do
  begin

    vlr := tblMultas.FieldByName('vl_multa').AsString;

    if not InputQuery('Baixar','Valor a baixar',vlr) then
      Abort;

    valor := StrToFloat( vlr );

    if (valor > tblMultas.FieldByName('vl_multa').AsCurrency) OR (valor = 0) then
      Mensagem('O valor a baixar deve ser menor do que o valor da multa e diferente de zero.',  'Atenção', MB_OK + MB_ICONWARNING);
  end;

  tblMultas.Edit;
  tblMultas.FieldByName('dt_pagamento').AsString := DateToStr(DataHoje);
  tblMultas.FieldByName('vl_pago').AsCurrency := valor;

  {
  // Retirado na versão 2004.5.2.15 por Jonathan
  DM.qAux2.Close;
  DM.qAux2.SQL.Clear;
  DM.qAux2.SQL.Add('UPDATE mensalidades SET datapagamento = :dt_pagamento, valorpago = :vl_pago, situacao = :cd_situacao WHERE nossonumero = :nr_nossonumero');
  DM.qAux2.ParamByName('dt_pagamento').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
  DM.qAux2.ParamByName('vl_pago').AsCurrency := valor;
  DM.qAux2.ParamByName('nr_nossonumero').AsString := tblMultas.FieldByName('nr_nossonumero').AsString;
  }

  if valor = tblMultas.FieldByName('vl_multa').AsCurrency then
  begin
    tblMultas.FieldByName('cd_situacao').AsInteger := 0;
    tblMultas.Post;

    {
    // Retirado na versão 2004.5.2.15 por Jonathan
    if DM.variavel_parametro('biblio_multa_sn_gera_mensalidade') = 'S' then begin
      DM.qAux2.ParamByName('cd_situacao').Asinteger := 0;
      DM.qAux2.ExecSQL;
    end;
    }
  end
  else
  begin
    tblMultas.FieldByName('cd_situacao').AsInteger := 1;
    dt_multa := tblMultas.FieldByName('dt_multa').AsDateTime;
    vl_multa := tblMultas.FieldByName('vl_multa').AsCurrency;
    tblMultas.Post;
    tblMultas.Insert;
    tblMultas.FieldByName('cd_pessoa').AsInteger := CodigoPessoa;
    tblMultas.FieldByName('dt_multa').AsString := DateToStr(dt_multa);
    tblMultas.FieldByName('vl_multa').AsCurrency := vl_multa - valor;
    tblMultas.FieldByName('cd_situacao').AsInteger := 2;
    tblMultas.Post;

    {
    // Retirado na versão 2004.5.2.15 por Jonathan
    if DM.variavel_parametro('biblio_multa_sn_gera_mensalidade') = 'S' then begin
      DM.qAux2.ParamByName('cd_situacao').Asinteger := 1;
      DM.qAux2.ExecSQL;
      DM.GeraMensalidade( tblMultas.FieldByName( 'cd_pessoa' ).AsInteger, vl_multa-valor );
    end;
    }

  end;

end
else
begin

  for n:= 0 to dgMultas.SelectedRows.Count - 1 do
  begin

    with FrmMultaEmprestimo do
    begin
     dgMultas.DataSource.DataSet.GotoBookmark(Pointer(dgMultas.SelectedRows.Items[n]));

     tblMultas.Edit;
     tblMultas.FieldByName('dt_pagamento').AsString := DateToStr(DataHoje);
     tblMultas.FieldByName('cd_situacao').AsInteger := 0;
     tblMultas.FieldByName('vl_pago').AsCurrency := tblMultas.FieldByName('vl_multa').AsCurrency;

     {
    // Retirado na versão 2004.5.2.15 por Jonathan
     if DM.variavel_parametro('biblio_multa_sn_gera_mensalidade') = 'S' then begin
       DM.qAux2.Close;
       DM.qAux2.SQL.Clear;
       DM.qAux2.SQL.Add('UPDATE mensalidades SET datapagamento = :dt_pagamento, valorpago = :vl_pago, situacao = :cd_situacao WHERE nossonumero = :nr_nossonumero');
       DM.qAux2.ParamByName('dt_pagamento').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
       DM.qAux2.ParamByName('vl_pago').AsCurrency := tblMultas.FieldByName('vl_multa').AsCurrency;
       DM.qAux2.ParamByName('nr_nossonumero').AsString := tblMultas.FieldByName('nr_nossonumero').AsString;
       DM.qAux2.ParamByName('cd_situacao').Asinteger := 0;
       DM.qAux2.ExecSQL;
     end;
     }

     tblMultas.Post;
     valor := valor + tblMultas.FieldByName('vl_multa').AsCurrency;
    end;

  end;

end;

Filtra;
Mensagem('Cobrar do usuário R$ ' + FloatToStrF(valor, ffNumber,7,2),  'Atenção', MB_OK + MB_ICONWARNING);

end;

procedure TFrmMultaEmprestimo.sbIsentarClick(Sender: TObject);
var
  n: integer;
  valor: Currency;
begin

   if (dgMultas.SelectedRows.Count < 1) OR (rgFiltro.ItemIndex <> 1) then
   begin
      Mensagem('Selecione pelo menos uma multa pendente. ',  'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
   end;

   if Pos( 'biblio' , DM.variavel_parametro('biblio_forma_cobranca') ) <= 0 then
   begin
      Mensagem('A biblioteca não tem permissão para isentar multas.'+chr(13)+'Para isentar é necessário utilizar o módulo financeiro.',  'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
   end;

   valor := 0;

   Application.CreateForm( TfmMotivos, fmMotivos );

   fmMotivos.pnlUsuario.Caption := DM.sLogin;
   fmMotivos.ShowModal;

   if fmMotivos.ModalResult = mrCancel then
      Abort;

   for n:= 0 to dgMultas.SelectedRows.Count - 1 do
   begin

      with FrmMultaEmprestimo do
      begin
         dgMultas.DataSource.DataSet.GotoBookmark(Pointer(dgMultas.SelectedRows.Items[n]));

         tblMultas.Edit;
         tblMultas.FieldByName('dt_pagamento').AsString := DateToStr(DataHoje);
         tblMultas.FieldByName('vl_pago').AsCurrency := 0;
         tblMultas.FieldByName('cd_situacao').AsInteger := 4;

         tblMultas.Post;
         valor := valor + tblMultas.FieldByName('vl_multa').AsCurrency;


         { Salvando os motivos}
         DM.qyMotivos.Open;
         DM.qyMotivos.Insert;
         DM.qyMotivoscd_aluno.AsInteger := StrToInt(lbCodPessoa.Caption);
         DM.qyMotivosmotivo.AsString := fmMotivos.txtMotivo.Text;
         DM.qyMotivosdt_motivo.AsString := DateToStr(DataHoje);
         DM.qyMotivoscd_autorizadopor.AsInteger := DM.iCdPessoaLogado;
         DM.qyMotivoscd_multa.AsInteger := tblMultas.FieldByName('cd_multa').AsInteger;
         DM.qyMotivos.Post;
         DM.qyMotivos.Close;
      end;
   end;

   Filtra;
   Mensagem('As multas perdoadas resultam em R$ ' + FloatToStrF(valor, ffNumber,7,2),  'Atenção', MB_OK + MB_ICONWARNING);
end;

procedure TFrmMultaEmprestimo.SpeedButton3Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmMultaEmprestimo.tblMultasAfterOpen(DataSet: TDataSet);
begin
   DM.qAux1.Close;
   DM.qAux1.SQL.Text := 'SELECT SUM(VL_MULTA) TOTAL FROM bibliotecamultas';
   DM.qAux1.SQL.Add(' WHERE cd_pessoa = :CODIGOPESSOA ');
   DM.qAux1.SQL.Add(' AND cd_situacao = 2 ');

   DM.qAux1.ParamByName('CODIGOPESSOA').AsInteger := CodigoPessoa;

   DM.qAux1.Open;

   lbMultaPendente.Caption := FloatToStrF(DM.qAux1.FieldByName('total').AsCurrency, ffCurrency, 7, 2);

end;

procedure TFrmMultaEmprestimo.rgFiltroClick(Sender: TObject);
begin
  Filtra;
end;

Procedure TFrmMultaEmprestimo.Filtra;
Begin

  sbMotivo.Enabled := (rgFiltro.ItemIndex = 4);

  if rgFiltro.ItemIndex = 1 then
  begin
    sbBaixar.Enabled := True;
    sbIsentar.Enabled := True;
  end
  else
  begin
    sbBaixar.Enabled := False;
    sbIsentar.Enabled := False;
  end;

  tblMultas.Close;
  tblMultas.SQL.Clear;
  tblMultas.SQL.Add('SELECT *                                                   ');
  tblMultas.SQL.Add('FROM bibliotecamultas                                      ');
  tblMultas.SQL.Add('WHERE cd_pessoa = :cd_pessoa                               ');

  if rgFiltro.ItemIndex > 0 then
    tblMultas.SQL.Add('AND cd_situacao = :cd_situacao                           ');

  tblMultas.ParamByName('cd_pessoa').AsInteger := CodigoPessoa;

  case rgFiltro.ItemIndex of
    1: tblMultas.ParamByName('cd_situacao').AsInteger := 2;
    2: tblMultas.ParamByName('cd_situacao').AsInteger := 1;
    3: tblMultas.ParamByName('cd_situacao').AsInteger := 0;
    4: tblMultas.ParamByName('cd_situacao').AsInteger := 4;
  end;

  tblMultas.SQL.Add('ORDER BY dt_multa DESC                                   ');
  tblMultas.Open;

End;

procedure TFrmMultaEmprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if fmMotivos <> nil then
   begin
      fmMotivos.Free;
      fmMotivos := nil;
   end;

   if FrmMultaEmprestimoLivros <> nil then
   begin
      FrmMultaEmprestimoLivros.Free;
      FrmMultaEmprestimoLivros := nil;
   end;
end;

procedure TFrmMultaEmprestimo.dgMultasDblClick(Sender: TObject);
begin
   if FrmMultaEmprestimoLivros = nil then
      Application.CreateForm(TFrmMultaEmprestimoLivros, FrmMultaEmprestimoLivros);

   FrmMultaEmprestimoLivros.TemEmprestimo(tblMultas.FieldByName('cd_multa').AsInteger);
end;

procedure TFrmMultaEmprestimo.sbMotivoClick(Sender: TObject);
Var n : word;
begin
   Application.CreateForm( TfmMotivos, fmMotivos );

   DM.qyMotivos.Open;
   DM.qyMotivos.Filter := 'cd_multa = ' + tblMultas.FieldByName('cd_multa').AsString;

   if DM.qyMotivos.FieldByName('motivo').AsString = '' then
      Abort;

   DM.FindUserCodigo(DM.qyMotivoscd_autorizadopor.AsInteger);

   for n := 0 to fmMotivos.ComponentCount - 1 do
     if TWinControl( fmMotivos.Components[n] ).Tag = 0 then
       TWinControl( fmMotivos.Components[n] ).Enabled := False;

   fmMotivos.pnlUsuario.Caption := DM.tblUsuariosnome2.AsString;
   fmMotivos.txtMotivo.Text := DM.qyMotivos.FieldByName('motivo').AsString;
   fmMotivos.txtMotivo.Enabled := false;

fmMotivos.ShowModal;

end;

Function TFrmMultaEmprestimo.RegistraMulta( dt_entrega, dt_devolucao: TDateTime; cd_registro, cd_pessoa: integer ): integer;
var
  multa: Currency;
  cd_multa: integer;
  dias: integer;
begin

      { Pegar Informações sobre o Registro }
      DM.tblNomeAcervo.Close;
      DM.tblNomeAcervo.Params.ParamByName('REGISTRO').AsInteger := cd_registro;
      DM.tblNomeAcervo.Open;

          if dt_entrega > dt_devolucao Then
          Begin

             // Colocar Parametro de Valor da Multa
             if DM.variavel_parametro('biblioteca_multa_sn_dias_uteis') = 'N' then
               dias := Trunc(dt_entrega - dt_devolucao)
             else
               dias := DM.DiasUteis('biblioteca', dt_devolucao + 1, dt_entrega);

             if DM.tblNomeAcervovl_multa_dia.AsCurrency > 0 Then // Verificar se tem multa
             Begin
                  multa := DM.tblNomeAcervovl_multa_dia.AsCurrency * dias;
                  qyMultas.Close;
                  qyMultas.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
                  qyMultas.ParamByName('dt_multa').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
                  qyMultas.Open;
                  if not qyMultas.Eof then
                  begin
                    qyMultas.Edit;
                    qyMultas.FieldByName('vl_multa').AsCurrency := qyMultas.FieldByName('vl_multa').AsCurrency + multa;
                    cd_multa := qyMultas.FieldByName('cd_multa').AsInteger;
                    qyMultas.Post;
                  end
                  else
                  begin
                    qyMultas.Insert;
                    qyMultas.FieldByName('cd_pessoa').AsInteger := cd_pessoa;
                    qyMultas.FieldByName('dt_multa').AsString := DateToStr(DataHoje);
                    qyMultas.FieldByName('vl_multa').AsCurrency := multa;
                    qyMultas.FieldByName('cd_situacao').AsInteger := 2;
                    qyMultas.Post;
                    DM.qAux1.Close;
                    DM.qAux1.SQL.Clear;
                    DM.qAux1.SQL.Add('SELECT MAX(cd_multa) AS cd FROM bibliotecamultas');
                    DM.qAux1.Open;
                    cd_multa := DM.qAux1.FieldByName('cd').AsInteger;
                  end;

             End;

             { Gerar mensalidade, de acordo com parâmetro }
             // Retirado na versão 2004.5.2.15 por Jonathan
             //if DM.variavel_parametro('biblio_multa_sn_gera_mensalidade') = 'S' then
             //   DM.GeraMensalidade( cd_pessoa, multa );
             { / Gerar mensalidade, de acordo com parâmetro }

             Mensagem('Foi registrado multa de R$ ' + FloattoStrF(multa, ffNumber, 7,2) + ' referente atraso.',  'Atenção', MB_OK + MB_ICONWARNING);

           End
           else { Caso não exista multa, retorna valor NULO }
            cd_multa := 0;


           Result := cd_multa;

end;

end.

