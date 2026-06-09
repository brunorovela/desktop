unit uImportarLayouts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFrmImportarLayouts = class(TForm)
    Label1: TLabel;
    cbLayouts: TComboBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    // Carregar os layouts do arquivo layouts.ini

    iFile : TIniFile;
    slLayouts : TStringList;

    Procedure CarregarLayouts;
  public
    { Public declarations }

    slItensLayout : TStringList;

    Function GetLayoutPadrao() : String;
    Function GetNomeLayoutPadrao() : String;

    Procedure CarregaItensLayout(sNomeLayout : String);
  end;

var
  FrmImportarLayouts: TFrmImportarLayouts;

implementation

{$R *.dfm}

{ TFrmImportarLayouts }

procedure TFrmImportarLayouts.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal();
end;

procedure TFrmImportarLayouts.btnConfirmarClick(Sender: TObject);
begin
   // Carregar os parametros conforme o layout

   // Carregar os itens do layout selecionado para um StringList
   CarregaItensLayout(slLayouts[cbLayouts.ItemIndex+1]);

   ModalResult := mrOk;
   CloseModal();
end;

procedure TFrmImportarLayouts.CarregaItensLayout(sNomeLayout: String);
begin

   iFile.ReadSectionValues(sNomeLayout, slItensLayout);

end;

procedure TFrmImportarLayouts.CarregarLayouts;
Var
  n : integer;
begin
   // Carregar os Layouts do Arquivo Layouts.ini

   // Preencher a stringlist com os layout

   cbLayouts.Clear;
   slLayouts.Clear();
   iFile.ReadSections(slLayouts);

   // Montar a combo com os Layouts;
   for n := 1 to slLayouts.Count - 1 do begin

      slItensLayout.Clear();
      iFile.ReadSectionValues(slLayouts.Strings[n], slItensLayout);

      cbLayouts.Items.Add( iFile.ReadString(slLayouts.Strings[n], 'Descricao-Layout', 'Layout ' + IntToStr(n) ) );
   end;

end;

procedure TFrmImportarLayouts.FormCreate(Sender: TObject);
begin
   iFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '/layouts.ini');

   slLayouts := TStringList.Create;
   slItensLayout := TStringList.Create;
end;

procedure TFrmImportarLayouts.FormShow(Sender: TObject);
begin
   CarregarLayouts();
end;

function TFrmImportarLayouts.GetLayoutPadrao: String;
Var
   sLayout : String;
begin

   sLayout := iFile.ReadString('INFO', 'Layout-Padrao', 'Nenhum Layout Padrão');

   result := sLayout;

end;

function TFrmImportarLayouts.GetNomeLayoutPadrao: String;
Var
   sLayout : String;
begin

   sLayout := iFile.ReadString('INFO', 'Layout-Padrao', 'Nenhum Layout Padrão');

   result := iFile.ReadString(sLayout, 'Descricao-Layout', 'Nenhum Layout Padrão');
end;

end.
