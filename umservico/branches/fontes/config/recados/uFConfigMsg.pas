unit uFConfigMsg;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ActiveX, MsHTML, ExtCtrls, Buttons, StdCtrls, ToolWin, ComCtrls,
   OleCtrls, SHDocVw, ImgList, StrUtils;

const
   IDM_MARCADOR = 2184;
   IDM_MARCADOR_LISTA = 2185;
   IDM_OUTDENT = 2187;
   IDM_INDENT = 2186;
   IDM_ALINHARESQ = 59;
   IDM_CENTRALIZAR = 57;
   IDM_ALINHADIR = 60;
   IDM_IMAGEM = 2168;
   IDM_LINHAHORIZ = 2150;
   IDM_RECORTAR = 16;
   IDM_COPIAR = 15;
   IDM_COLAR = 26;
   IDM_HYPERLINK = 2124;
   IDM_DESFAZER = 43;

type
   TfConfigMsg = class(TForm)
    procedure wbEditorNavigateComplete2(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
   published
      pnVariaveis: TPanel;
      pnTitVariaveis: TPanel;
      bvSep3: TBevel;
      pnAjuda: TPanel;
      bvSep4: TBevel;
      spSeparador: TSplitter;
      pnMensagem: TPanel;
      pnTitMensagem: TPanel;
      bvSep5: TBevel;
      tvVars: TTreeView;
      cdCores: TColorDialog;
      liImagens: TImageList;
      bnSep1: TToolButton;
      bnSalvar: TToolButton;
      bnSep2: TToolButton;
      bnCancelar: TToolButton;
      bnSep3: TToolButton;
      pnFormat1: TPanel;
      bnBold: TSpeedButton;
      bnItalic: TSpeedButton;
      bnUnderlined: TSpeedButton;
      bnColor: TSpeedButton;
      bnFormat2: TPanel;
      bnNumList: TSpeedButton;
      bnBullet: TSpeedButton;
      bnDecIndent: TSpeedButton;
      bnIncIndent: TSpeedButton;
      bnFormat3: TPanel;
      bnAlignLeft: TSpeedButton;
      bnCenter: TSpeedButton;
      bnAlignRight: TSpeedButton;
      pnImagem: TPanel;
      bnHR: TSpeedButton;
      pnSpace: TPanel;
      pnEdicao: TPanel;
      bnCortar: TSpeedButton;
      bnCopiar: TSpeedButton;
      bnColar: TSpeedButton;
      bnHiperLink: TSpeedButton;
      bnDesfazer: TSpeedButton;
      lbFonte: TLabel;
      cbFonte: TComboBox;
      pnTamanho: TPanel;
      lbTamanho: TLabel;
      cbTamanho: TComboBox;
      pnFormatacao: TPanel;
      pnBotoesCima: TPanel;
      tbOpcoes: TToolBar;
      bvSep1: TBevel;
      bvSep2: TBevel;
      wbEditor: TWebBrowser;
      procedure wbEditorDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; var Accept: Boolean);
      procedure wbEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure wbEditorCommandStateChange(ASender: TObject; Command: Integer;
         Enable: WordBool);
      procedure tvVarsMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure bnSalvarClick(Sender: TObject);
      procedure bnCancelarClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Negrito(Sender: TObject);
      procedure Italico(Sender: TObject);
      procedure Sublinhado(Sender: TObject);
      procedure ListaNumerica(Sender: TObject);
      procedure ListaBullet(Sender: TObject);
      procedure AlinhaEsquerda(Sender: TObject);
      procedure AlinhaDireita(Sender: TObject);
      procedure AlinhaCentro(Sender: TObject);
      procedure LinhaHorizontal(Sender: TObject);
      procedure Cortar(Sender: TObject);
      procedure Copiar(Sender: TObject);
      procedure Colar(Sender: TObject);
      procedure Desfazer(Sender: TObject);
      procedure Hiperlink(Sender: TObject);
      procedure SelecionaFonte(Sender: TObject);
      procedure SelecionaTamanho(Sender: TObject);
      procedure SelecionaCor(Sender: TObject);
      procedure Identa(Sender: TObject);
      procedure Deidenta(Sender: TObject);
   strict private
      FSVariavel: string;
      FSMsg: string;
      constructor Create(AOwner: TComponent; const ASlVariaveis: TStringList;
         const ASMsg: string);
      function GetIEHandle(AWebBrowser: TWebBrowser; AClassName: string): HWND;
      procedure SaveBodyHTMLToStream(const Stream: TStream);
      procedure MontaArvoreVars(const ASlVariaveis: TStringList);
      procedure LoadFromString(const HTML: string);
      procedure LoadFromStream(const Stream: TStream);
      procedure NavigateToURL(const URL: string);
      procedure InternalLoadDocumentFromStream(const Stream: TStream);
   private
      function GetBrowserHTML: string;
   public
      class function GetMensagem(const ASlVariaveis: TStringList; var ASMensagem: string; AOwner: TComponent): boolean;
   end;

var
   fConfigMsg: TfConfigMsg;
   HTMLDocumento: IHTMLDocument2;

implementation

{$R *.dfm}

{ TfConfigMsg }

procedure TfConfigMsg.AlinhaCentro(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_CENTRALIZAR, 0);
end;

procedure TfConfigMsg.AlinhaDireita(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_ALINHADIR, 0);
end;

procedure TfConfigMsg.AlinhaEsquerda(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_ALINHARESQ, 0);
end;

procedure TfConfigMsg.bnCancelarClick(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
end;

procedure TfConfigMsg.bnSalvarClick(Sender: TObject);
begin
   Self.ModalResult := mrOk;
end;

procedure TfConfigMsg.Colar(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_COLAR, 0);
end;

procedure TfConfigMsg.Copiar(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_COPIAR, 0);
end;

procedure TfConfigMsg.Cortar(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_RECORTAR, 0);
end;

constructor TfConfigMsg.Create(AOwner: TComponent;
   const ASlVariaveis: TStringList; const ASMsg: string);
begin
   inherited Create(AOwner);
   Self.MontaArvoreVars(ASlVariaveis);
   Self.FSMsg := ASMsg;
end;

procedure TfConfigMsg.Deidenta(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_OUTDENT, 0);
end;

procedure TfConfigMsg.Desfazer(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_DESFAZER, 0);
end;

procedure TfConfigMsg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfConfigMsg.FormCreate(Sender: TObject);
begin
   OleInitialize(nil);
end;

procedure TfConfigMsg.FormDestroy(Sender: TObject);
begin
   OleUninitialize;
end;

procedure TfConfigMsg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5: bnSalvarClick(nil);
      VK_F6: bnCancelarClick(nil);   
   end;
end;

procedure TfConfigMsg.FormShow(Sender: TObject);
begin
   Self.NavigateToURL('about:blank');
   Self.LoadFromString(Self.FSMsg);
   cbFonte.Items := Screen.Fonts;
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
end;

function TfConfigMsg.GetBrowserHTML: string;
var
   LStringStream: TStringStream;
begin
   Result := '';
   LStringStream := TStringStream.Create('');
   try
      Self.SaveBodyHTMLToStream(LStringStream);
      Result := LStringStream.DataString;
   finally
      LStringStream.Free;
   end;
end;

function TfConfigMsg.GetIEHandle(AWebBrowser: TWebBrowser;
   AClassName: string): HWND;
var
   hwndChild, hwndTmp: HWND;
   oleCtrl: TOleControl;
   szClass: array[0..255] of char;
begin
   oleCtrl := AWebBrowser;
   hwndTmp := oleCtrl.Handle;
   while True do
   begin
      hwndChild := GetWindow(hwndTmp, GW_CHILD);
      GetClassName(hwndChild, szClass, SizeOf(szClass));
      if string(szClass) = AClassName then
      begin
         Result := hwndChild;
         Exit;
      end;
      hwndTmp := hwndChild;
   end;
   Result := 0;
end;

class function TfConfigMsg.GetMensagem(const ASlVariaveis: TStringList;
  var ASMensagem: string; AOwner: TComponent): boolean;
begin
   fConfigMsg := TfConfigMsg.Create(AOwner, ASlVariaveis, ASMensagem);
   Result := fConfigMsg.ShowModal = mrOk;
   if Result then
      ASMensagem := fConfigMsg.GetBrowserHTML;
end;

procedure TfConfigMsg.Hiperlink(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_HYPERLINK, 0);
end;

procedure TfConfigMsg.Identa(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_INDENT, 0);
end;

procedure TfConfigMsg.InternalLoadDocumentFromStream(const Stream: TStream);
var
   PersistStreamInit: IPersistStreamInit;
   StreamAdapter: IStream;
begin
   Assert(Assigned(wbEditor.Document));
   if wbEditor.Document.QueryInterface(IPersistStreamInit, PersistStreamInit) = S_OK then
   begin
      if PersistStreamInit.InitNew = S_OK then
      begin
         StreamAdapter:= TStreamAdapter.Create(Stream);
         PersistStreamInit.Load(StreamAdapter);
      end;
   end;
end;

procedure TfConfigMsg.Italico(Sender: TObject);
begin
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Italic', False, 0);
end;

procedure TfConfigMsg.LinhaHorizontal(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_LINHAHORIZ, 0);
end;

procedure TfConfigMsg.ListaBullet(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_MARCADOR_LISTA, 0);
end;

procedure TfConfigMsg.ListaNumerica(Sender: TObject);
begin
   SendMessage(Self.GetIEHandle(wbEditor, 'Internet Explorer_Server'),
      WM_COMMAND, IDM_MARCADOR, 0);
end;

procedure TfConfigMsg.MontaArvoreVars(const ASlVariaveis: TStringList);
var
   I: integer;
begin
   tvVars.Items.Clear;
   for I := 0 to ASlVariaveis.Count - 1 do
      tvVars.Items.Add(tvVars.TopItem, ASlVariaveis.Strings[I]);
end;

procedure TfConfigMsg.NavigateToURL(const URL: string);
var
   Flags: OleVariant;
begin
   Flags := navNoHistory;
   if AnsiStartsText('res://', URL) or
      AnsiStartsText('file://', URL) or
      AnsiStartsText('about:', URL) or
      AnsiStartsText('javascript:', URL) or
      AnsiStartsText('mailto:', URL) then
      Flags := Flags or navNoReadFromCache or navNoWriteToCache;
   wbEditor.Navigate(WideString(URL), Flags);
   while wbEditor.ReadyState <> READYSTATE_COMPLETE do
   begin
      Sleep(5);
      Application.ProcessMessages;
   end;
end;

procedure TfConfigMsg.Negrito(Sender: TObject);
begin
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Bold', False, 0);
end;

procedure TfConfigMsg.SaveBodyHTMLToStream(const Stream: TStream);
var
   HTMLStr: string;
   Doc: IHTMLDocument2;
   BodyElement: IHTMLElement;
begin
   Assert(Assigned(wbEditor.Document));
   if wbEditor.Document.QueryInterface(IHTMLDocument2, Doc) = S_OK then
   begin
      BodyElement := Doc.body;
      if Assigned(BodyElement) then
      begin
         HTMLStr := BodyElement.innerHTML;
         Stream.WriteBuffer(HTMLStr[1], Length(HTMLStr));
      end;
   end;
end;

procedure TfConfigMsg.SelecionaCor(Sender: TObject);
begin
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
   if cdCores.Execute then
      HTMLDocumento.execCommand('ForeColor', False, cdCores.Color)
   else
      Abort;
end;

procedure TfConfigMsg.SelecionaFonte(Sender: TObject);
begin
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('FontName', False, cbFonte.Text);
end;

procedure TfConfigMsg.SelecionaTamanho(Sender: TObject);
begin
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('FontSize', False, cbTamanho.ItemIndex + 1);
end;

procedure TfConfigMsg.LoadFromStream(const Stream: TStream);
begin
   Self.NavigateToURL('about:blank');
   Self.InternalLoadDocumentFromStream(Stream);
end;

procedure TfConfigMsg.LoadFromString(const HTML: string);
var
   ssHTML: TStringStream;
begin
   ssHTML := TStringStream.Create(HTML);
   try
      Self.LoadFromStream(ssHTML);
   finally
      ssHTML.Free;
   end;
end;

procedure TfConfigMsg.Sublinhado(Sender: TObject);
begin
   HTMLDocumento := wbEditor.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Underline', False, 0);
end;

procedure TfConfigMsg.tvVarsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if tvVars.GetNodeAt(X, Y) <> nil then
   begin
      Self.FSVariavel := '[[' + tvVars.GetNodeAt(X, Y).Text + ']]';
      tvVars.BeginDrag(True);
   end;
end;

procedure TfConfigMsg.wbEditorCommandStateChange(ASender: TObject;
  Command: Integer; Enable: WordBool);
begin
   if not Assigned(ASender) or not (ASender is TWebBrowser) then
      Exit;
   if TOleEnum(Command) <> CSC_UPDATECOMMANDS then
      Exit;
   if not Assigned(wbEditor.Document as IHTMLDocument2) then
      Exit;
   if Assigned((wbEditor.Document as IHTMLDocument2).selection as IHTMLSelectionObject) and
      (((wbEditor.Document as IHTMLDocument2).selection as IHTMLSelectionObject).type_ = 'Text') then
      Self.SetFocus;
end;

procedure TfConfigMsg.wbEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
   tvVars.EndDrag(Source = tvVars);
   ((wbEditor.Document as HTMLDocument).body as HTMLBody).insertAdjacentText(
      'BeforeEnd', Self.FSVariavel);
end;

procedure TfConfigMsg.wbEditorDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept := Source = tvVars;
end;

procedure TfConfigMsg.wbEditorNavigateComplete2(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
begin
   (wbEditor.Document as IHTMLDocument2).designMode := 'On';
end;

end.
