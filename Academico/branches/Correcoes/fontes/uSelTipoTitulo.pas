unit uSelTipoTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, Buttons, DB, ZConnection, uZDataSet;

type
  TfrmSelTipoTitulo = class(TForm)
    Panel3: TPanel;
    Bevel1: TBevel;
    cklbTitulos: TCheckListBox;
    btnConfirmar: TBitBtn;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    slTitulos : TStringList;
  end;

var
  frmSelTipoTitulo: TfrmSelTipoTitulo;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmSelTipoTitulo.btnConfirmarClick(Sender: TObject);
begin

//   ModalResult := mrOk;

//   CloseModal();

end;

procedure TfrmSelTipoTitulo.FormShow(Sender: TObject);
Var
   qyTipos : TUMZQuery;
begin
   DM.CriarConsulta(qyTipos);
   qyTipos.SQL.Text :=
     ' SELECT                                      ' +
     '    cd_tipo_titulo,                          ' +
     '    ds_tipo_titulo                           ' +
     ' FROM                                        ' +
     '    fin_config_tipos_titulo                  ' +
     ' WHERE                                       ' +
     '    ct_tipo_titulo = 1 AND sn_ativo = 1 AND  ' +
     '    cd_coligada_matriz = :cd_coligada_matriz ' +
     ' ORDER BY                                    ' +
     '    ds_tipo_titulo                           ';
   qyTipos.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyTipos.Open();

   cklbTitulos.Clear();
   slTitulos.Clear();

//   cklbTitulos.Items.Add('<< Titulos sem tipo definido >>');
//   slTitulos.Add('-1');

   while not qyTipos.Eof do begin
        cklbTitulos.Items.Add(qyTipos.FieldByName('ds_tipo_titulo').AsString);
        slTitulos.Add(qyTipos.FieldByName('cd_tipo_titulo').AsString);

        qyTipos.Next();
   end;

   FreeAndNil(qyTipos);
end;

procedure TfrmSelTipoTitulo.sbDesmarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (cklbTitulos.Items.Count-1) do
    cklbTitulos.Checked[i] := false;
end;

procedure TfrmSelTipoTitulo.sbMarcarClick(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to (cklbTitulos.Items.Count-1) do
    cklbTitulos.Checked[i] := true;

end;

end.

