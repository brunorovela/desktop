unit uReclassificar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, DB, ZConnection, UMComboBox,
  ZSqlProcessor;

type
  TfrmReclassificar = class(TForm)
    pnTitulo: TPanel;
    btnConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edMovimento: TEdit;
    Label2: TLabel;
    edHistorico: TEdit;
    edData: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edValor: TEdit;
    cbDe: TComboBox;
    Label5: TLabel;
    cbPara: TComboBox;
    sbConta: TSpeedButton;
    edPara: TEdit;
    Label6: TLabel;
    sbCentro: TSpeedButton;
    cbCentro: TComboBox;
    edCentro: TEdit;
    qrySelectMovimento: TUMZReadOnlyQuery;
    qryMovimento: TUMZReadOnlyQuery;
    qryMovimentoCD_CONTA: TIntegerField;
    qryMovimentoCONTA: TStringField;
    qryInsApropria: TUMZQuery;
    cbUnidadeEnsino: TUMComboBox;
    Label7: TLabel;
    qryMovimentoDS_CONTA: TMemoField;
    srcUpdate: TZSQLProcessor;
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure sbCentroClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbDeChange(Sender: TObject);
    procedure cbCentroChange(Sender: TObject);
    procedure edCentroExit(Sender: TObject);
    procedure cbParaKeyPress(Sender: TObject; var Key: Char);
    procedure cbDeKeyPress(Sender: TObject; var Key: Char);
    procedure cbParaChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure sbContaClick(Sender: TObject);
    procedure edParaExit(Sender: TObject);
    procedure edParaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edMovimentoExit(Sender: TObject);
    procedure edMovimentoKeyPress(Sender: TObject; var Key: Char);
  strict private
      procedure CarregarContas();

  private
    { Private declarations }
    ListaPlanoContas : Array of Integer;
    ListaCentroCustos: Array of Integer;
    ListaCentrosOrigem: Array of Integer;
    ListaContasOrigem: Array of Integer;
    ListaValoresOrigem: Array of Currency;

    Procedure SelecionarMovimento();

    Function ProcuraCodigo(codigo : Integer; ListaCodigos : array of integer) : Integer;
    
  public
    { Public declarations }
  end;

var
  frmReclassificar: TfrmReclassificar;

implementation

uses uDM, uSelConta, uSelCentro, uListaColigadas, uColigada;

{$R *.dfm}

procedure TfrmReclassificar.edParaExit(Sender: TObject);
begin
   cbPara.ItemIndex := ProcuraCodigo(RC_StrToInt(edPara.Text), ListaPlanoContas);
end;

procedure TfrmReclassificar.edParaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin

       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
       Exit;

   end
   else
   if not (key in ['0'..'9',#8]) then
   begin

       Key := #0;
       exit;

   end;
end;

procedure TfrmReclassificar.BitBtn2Click(Sender: TObject);
begin
   Close();
end;

procedure TfrmReclassificar.btnConfirmarClick(Sender: TObject);
begin

   if cbPara.ItemIndex = -1 then begin

     Mensagem('Atenção' + CHR(13) + CHR(13) + 'Você precisa selecionar uma conta válida para reclassificar o lançamento.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     Exit;

   end;

   if cbCentro.ItemIndex = -1 then begin

     Mensagem('Atenção' + CHR(13) + CHR(13) + 'Você precisa selecionar um centro de custo válido para reclassificar o lançamento.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     Exit;

   end;

   if Mensagem('Atenção' + CHR(13) + CHR(13) +
            'Este procedimento irá alterar a conta e/ou centro de custo do movimento na tesouraria e na origem (se houver).' + CHR(13) + CHR(13) +
            'Deseja continuar? ', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) <>  mrYes then begin
       Exit;
   end;

   qryMovimento.ParamByName('CD_MOVIMENTO_TE').AsString := edMovimento.Text;
   qryMovimento.ParamByName('DE').AsString := cbDe.Text;
   qryMovimento.Open;

   if not qryMovimento.IsEmpty then
   begin
      srcUpdate.ParamByName('CD_CONTA_PARA').AsString := edPara.Text;
      srcUpdate.ParamByName('CD_CENTRO_PARA').AsString := edCentro.Text;
      srcUpdate.ParamByName('CD_MOVIMENTO_TE').AsString := edMovimento.Text;
      srcUpdate.ParamByName('DS_CONTA').AsString := cbDe.Text;
      srcUpdate.ParamByName('CD_MENSALIDADE').AsInteger := qrySelectMovimento.FieldByName('CD_MENSALIDADE').AsInteger;
      srcUpdate.Execute;
   end else begin
      qryInsApropria.ParamByName('cd_movimento_te').AsString := edMovimento.Text;
      qryInsApropria.ParamByName('cd_conta').AsString := edPara.Text;
      qryInsApropria.ParamByName('cd_coligada').AsInteger := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;
      qryInsApropria.ParamByName('cd_centro').AsString := edCentro.Text;
      qryInsApropria.ParamByName('vl_movimento').AsFloat := StrToFloat(edValor.Text);
      qryInsApropria.ExecSQL;
   end;


   Mensagem('Lançamento reclassificado com sucesso', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);

   edHistorico.Clear();
   edData.Clear();
   edValor.Clear();
   cbDe.Clear();
   cbPara.ItemIndex := -1;
   cbCentro.ItemIndex := -1;

   edPara.Clear();
   edCentro.Clear();

   edMovimento.Clear();

   edMovimento.SetFocus();
   btnConfirmar.Enabled := false;   
   
end;

procedure TfrmReclassificar.CarregarContas;
var
   qyContas : TUMZReadOnlyQuery;
   contador, I : Integer;
   qyBuscaColigada: TUMZReadOnlyQuery;
   encontrouColigada: Boolean;
begin

   DM.CriarConsulta(qyBuscaColigada);

   qyBuscaColigada.SQL.Text :=
      'SELECT '+
	   '  cd_coligada '+
      'FROM '+
	   '  fin_mov_tesouraria '+
      'WHERE '+
	   '  cd_movimento_te = :codigo';

   qyBuscaColigada.ParamByName('codigo').AsString := edMovimento.Text;

   qyBuscaColigada.Open();

   encontrouColigada := False;

   if not (qyBuscaColigada.Eof) then
   begin

      if Length(qyBuscaColigada.FieldByName('cd_coligada').asString) > 0 then
      begin

         for I := 0 to cbUnidadeEnsino.Items.Count do
         begin

            if (qyBuscaColigada.FieldByName('cd_coligada').AsInteger =
               TColigada(cbUnidadeEnsino.Items.Objects[ I ]).Codigo) then
            begin

               cbUnidadeEnsino.ItemIndex := I;
               encontrouColigada := True;
               Break;

            end;

         end;
         
      end;

   end;

   cbPara.Items.Clear();
   cbCentro.Items.Clear();

   edPara.Text := '';
   edCentro.Text := '';

   cbDe.Enabled := ( cbUnidadeEnsino.ItemIndex > -1 ) AND
                   ( cbUnidadeEnsino.Items.Objects[ cbUnidadeEnsino.ItemIndex ] is TColigada );
   cbPara.Enabled := cbDe.Enabled;
   cbCentro.Enabled := cbDe.Enabled;
   sbConta.Enabled := cbDe.Enabled;
   sbCentro.Enabled := cbDe.Enabled;

   DM.CriarConsulta(qyContas);

   if encontrouColigada = False then
   begin
      Exit;
   end;

   qyContas.SQL.Text := Format(
      ' SELECT cd_conta, ds_conta ' +
      '   FROM fin_plano_contas ' +
      '  WHERE tp_conta = 1 AND cd_coligada IN ( %d ) ' +
      '    AND sn_ativo = 1 ' +
      '  ORDER BY ds_conta ',
      [TColigada(cbUnidadeEnsino.Items.Objects[ cbUnidadeEnsino.ItemIndex ]).Codigo]
   );

   qyContas.Open();
   SetLength(ListaPlanoContas, qyContas.RecordCount);

   while not qyContas.Eof do
   begin
      ListaPlanoContas[qyContas.RecNo-1] := qyContas.FieldByName('cd_conta').AsInteger;
      cbPara.Items.Add(qyContas.FieldByName('ds_conta').AsString);

      qyContas.Next;
   end;

   if cbPara.Items.Count > 1 then
   begin
      cbPara.ItemIndex := -1;
   end else begin
      cbPara.ItemIndex := 0;
   end;

   // Carregar Plano de Contas
   qyContas.Close();
   qyContas.SQL.Text := Format(
      ' SELECT cd_centro, ds_centro ' +
      '   FROM fin_centro_custos ' +
      '  WHERE tp_centro = 1 AND cd_coligada IN ( %d ) ' +
      '    AND sn_ativo = 1 ' +
      '  ORDER BY ds_centro ', [TColigada(cbUnidadeEnsino.Items.Objects[ cbUnidadeEnsino.ItemIndex ]).Codigo] );

   qyContas.Open();
   SetLength(ListaCentroCustos, qyContas.RecordCount);

   while not qyContas.Eof do
   begin
      ListaCentroCustos[qyContas.RecNo-1] := qyContas.FieldByName('cd_centro').AsInteger;
      cbCentro.Items.Add(qyContas.FieldByName('ds_centro').AsString);

      qyContas.Next();
   end;

   if cbCentro.Items.Count > 1 then
   begin
      cbCentro.ItemIndex := -1;
   end else begin
      cbCentro.ItemIndex := 0;
   end;

   FreeAndNil(qyContas);
end;

procedure TfrmReclassificar.cbCentroChange(Sender: TObject);
begin
   edCentro.Text := IntToStr(ListaCentroCustos[cbCentro.ItemIndex]);
end;

procedure TfrmReclassificar.cbDeChange(Sender: TObject);
begin
   edCentro.Text := IntToStr(ListaCentrosOrigem[cbDe.ItemIndex]);
   cbCentro.ItemIndex := ProcuraCodigo(RC_StrToInt(edCentro.Text), ListaCentroCustos);

   edPara.Text := IntToStr(ListaContasOrigem[cbDe.ItemIndex]);
   cbPara.ItemIndex := ProcuraCodigo(RC_StrToInt(edPara.Text), ListaPlanoContas);
end;

procedure TfrmReclassificar.cbDeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      SelectNext(Sender as TWinControl, true, true);
      Key := #0;
   end;
end;

procedure TfrmReclassificar.cbParaChange(Sender: TObject);
begin
   edPara.Text := IntToStr(ListaPlanoContas[cbPara.ItemIndex]);
end;

procedure TfrmReclassificar.cbParaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
     SelectNext(Sender as TWinControl, true, true);
     Key := #0;
   end;

end;

procedure TfrmReclassificar.cbUnidadeEnsinoChange(Sender: TObject);
begin
   if cbUnidadeEnsino.ItemIndex > 0 then
   begin
      CarregarContas();
   end;
end;

procedure TfrmReclassificar.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
   if cbUnidadeEnsino.ItemIndex > 0 then
   begin
      CarregarContas();
   end;
end;

procedure TfrmReclassificar.edCentroExit(Sender: TObject);
begin
   cbCentro.ItemIndex := ProcuraCodigo(RC_StrToInt(edCentro.Text), ListaCentroCustos);
end;

procedure TfrmReclassificar.edMovimentoExit(Sender: TObject);
begin
   if trim(edMovimento.Text) <> '' then
   begin
      SelecionarMovimento();
   end
   else
   begin
      edHistorico.Clear();
      edData.Clear();
      edValor.Clear();
      cbDe.Clear();
      cbPara.ItemIndex := -1;
   end;
end;

procedure TfrmReclassificar.edMovimentoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
     SelectNext(Sender as TWinControl, true, true);
     Key := #0;
   end;

   if not (Key in ['0'..'9', #8]) then begin
      Key := #0;
   end;
end;

procedure TfrmReclassificar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmReclassificar := nil;
   Action := caFree;
end;

procedure TfrmReclassificar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_F6, VK_F12, VK_ESCAPE : BitBtn2Click( nil );  //Botao Fechar
   end;
end;

procedure TfrmReclassificar.FormShow(Sender: TObject);
var
   listaColigadas: TListaColigadas;
   i, codigo_coligada, j: Integer;
   nome, separador: String;
   componente: TComponent; 
begin

   listaColigadas := DM.GetUsuarioLogado.GetListaColigadasFilhaSelecionada;

   for I := 0 to listaColigadas.Count - 1 do
   begin
      cbUnidadeEnsino.AddItem(
         TColigada(listaColigadas[ i ]).Nome,
         listaColigadas[ i ]
      );
   end;
   
end;

function TfrmReclassificar.ProcuraCodigo(codigo: Integer;
  ListaCodigos: array of integer): Integer;
var
   n : word;
begin
   result := -1;

   For n := 0 to Length(ListaCodigos) do
   begin
       if ListaCodigos[n] = Codigo then
       begin
          result := n;
          exit;
       end
   end;

end;

procedure TfrmReclassificar.sbCentroClick(Sender: TObject);
begin
   // Seleção de Plano de Contas
   frm_selCentro.ShowModal;

   if frm_selCentro.flgSearch then
   begin
      edCentro.Text := frm_selCentro.qyCentroscd_centro.AsString;
      cbCentro.ItemIndex := ProcuraCodigo(RC_StrToInt(edCentro.Text), ListaCentroCustos);
   end;
end;

procedure TfrmReclassificar.sbContaClick(Sender: TObject);
begin
   // Seleção de Plano de Contas
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      edPara.Text := frm_SelConta.qyPlanosContascd_conta.AsString;
      cbPara.ItemIndex := ProcuraCodigo(RC_StrToInt(edPara.Text), ListaPlanoContas);
   end;
end;

procedure TfrmReclassificar.SelecionarMovimento;
var
   sMov : String;
   i : Integer;
begin
   sMov := edMovimento.Text;

   if Trim(edMovimento.Text) = '' then
   begin
      Exit;
   end;

   qrySelectMovimento.close;
   qrySelectMovimento.ParamByName('CD_MOVIMENTO_TE').AsString := edMovimento.Text;
   qrySelectMovimento.Open;

   if qrySelectMovimento.IsEmpty then
   begin
       edHistorico.Clear;
       edData.Clear;
       edValor.Clear;
       cbDe.Clear;
       cbPara.ItemIndex := -1;
       btnConfirmar.Enabled := false;
       SetLength(ListaCentrosOrigem, 0);
       SetLength(ListaContasOrigem, 0);
       SetLength(ListaValoresOrigem, 0);
   end
   else
   begin

      // Verificar se está tentando classificar uma conta que tem um compromisso vinculado. Não permitir

      if (qrySelectMovimento.FieldByName('CD_TITULO').AsInteger > 0) then begin
         Mensagem('Este lançamento foi originado de um compromisso. ' + CHR(13) +
                  'Você deverá reclassificar este lançamento pela planilha de compromissos, alterando o título de código [' + qrySelectMovimento.FieldByName('CD_TITULO').AsString + '].', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);
         edHistorico.Clear;
         edData.Clear;
         edValor.Clear;
         cbDe.Clear;
         cbPara.ItemIndex := -1;
         btnConfirmar.Enabled := false;
         SetLength(ListaCentrosOrigem, 0);
         SetLength(ListaContasOrigem, 0);
         SetLength(ListaValoresOrigem, 0);
         Exit;
      end;


      edHistorico.Text := qrySelectMovimento.FieldByName('ds_movimento').AsString;
      edData.Text := FormatDateTime('dd/mm/yyyy', qrySelectMovimento.FieldByName('dt_movimento').AsDateTime);
      edValor.Text := FloatToStrF(qrySelectMovimento.FieldByName('vl_movimento').AsCurrency, ffFixed, 15, 2);
      cbDe.Clear;
      SetLength(ListaCentrosOrigem, qrySelectMovimento.RecordCount);
      SetLength(ListaContasOrigem, qrySelectMovimento.RecordCount);
      SetLength(ListaValoresOrigem, qrySelectMovimento.RecordCount);

      i := 0;

      while not qrySelectMovimento.EOF do
      begin
         cbDe.Items.Add(qrySelectMovimento.FieldByName('ds_conta').AsString);
         ListaCentrosOrigem[i] := qrySelectMovimento.FieldByName('cd_centro').AsInteger;
         ListaContasOrigem[i] := qrySelectMovimento.FieldByName('cd_conta').AsInteger;
         ListaValoresOrigem[i] := qrySelectMovimento.FieldByName('vl_movimento').AsCurrency;
         Inc(i);
         qrySelectMovimento.Next;
      end;

      cbDe.ItemIndex := 0;
      edCentro.Text := IntToStr(ListaCentrosOrigem[0]);
      cbCentro.ItemIndex := ProcuraCodigo(RC_StrToInt(edCentro.Text), ListaCentroCustos);
      edPara.Text := IntToStr(ListaContasOrigem[0]);
      cbPara.ItemIndex := ProcuraCodigo(RC_StrToInt(edPara.Text), ListaPlanoContas);
      btnConfirmar.Enabled := not DM.EstaBloqueado(qrySelectMovimento.FieldByName('dt_movimento').AsDateTime, true);

      CarregarContas;

      edCentro.Text := IntToStr(ListaCentrosOrigem[cbDe.ItemIndex]);
      cbCentro.ItemIndex := ProcuraCodigo(RC_StrToInt(edCentro.Text), ListaCentroCustos);

      edPara.Text := IntToStr(ListaContasOrigem[cbDe.ItemIndex]);
      cbPara.ItemIndex := ProcuraCodigo(RC_StrToInt(edPara.Text), ListaPlanoContas);

   end;
end;

end.

