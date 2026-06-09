unit uDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Db;

type
  TfrmDesconto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditValor: TDBEdit;
    txtDesconto: TEdit;
    pnlValor: TPanel;
    EditFinal: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure txtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EditFinalKeyPress(Sender: TObject; var Key: Char);
    procedure EditFinalEnter(Sender: TObject);
    procedure txtDescontoEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    dblValor : Single;
    dblDesconto : Double;
    { Public declarations }
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses uMensalidades, uDM, Main;

{$R *.DFM}

procedure TfrmDesconto.EditValorKeyPress(Sender: TObject; var Key: Char);
var
  dblAux : Double;
begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin

    if ( EditValor.Text = '' ) Then // ( RoundFloat( Dm.tblMensalidadesDescontoExtra.Value, 0 ) = 0 ) then
    begin
      Key := #0;
      SelectNext( TWinControl( Sender ), True, True );
      Exit;
    end;

    try
      dblAux := StrToFloat( EditValor.Text );
      EditFinal.Text := FloatToStr(
	RoundFloat( ( dblValor -  dblAux ) , 2 ) );

      EditValor.SetFocus;
      btnOk.Enabled := True;
      btnOkClick( nil );

    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      Key := #0;
      Exit;
    end;


    try
    dblAux := StrToFloat( EditValor.Text );
    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      EditValor.SetFocus;
      EditValor.SelectAll;
      Key := #0;
      Exit;
    end;
    Key := #0;
  end;
end;


procedure TfrmDesconto.txtDescontoKeyPress(Sender: TObject; var Key: Char);
var
  dblAux : Single;
begin
  if Key = '.' then Key := ',';
  if Key = #13 then
  begin

    if txtDesconto.Text = '' then
    begin
      Key := #0;
      SelectNext( TWinControl( Sender ), True, True );
      Exit;
    end;

    try
      dblAux := StrToFloat( txtDesconto.Text );
      EditFinal.Text := FloatToStr(
        RoundFloat( ( dblValor - ( dblValor * dblAux ) / 100 ), 2 ) );

      EditValor.SetFocus;
      btnOk.Enabled := True;
      btnOkClick( nil );

    except
      Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      Key := #0;
      Exit;
    end;
    Key := #0;

  end;

end;

procedure TfrmDesconto.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  pnlValor.Caption := 'R$ ' + Format( '%8.2n', [dblValor] ) + '   ';
  txtDesconto.SetFocus;
end;


procedure TfrmDesconto.EditFinalKeyPress(Sender: TObject; var Key: Char);
var
  dblAux : Double;
begin
  if Key = '.' then Key := ',';

end;



procedure TfrmDesconto.EditFinalEnter(Sender: TObject);
begin
  btnOk.Enabled := True;
//  btnCancel.Enabled := True;
end;

procedure TfrmDesconto.txtDescontoEnter(Sender: TObject);
begin
  btnOk.Enabled := False;
//  btnCancel.Enabled := False;
end;



procedure TfrmDesconto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  dblAux : Double;
begin

    if ModalResult = mrCancel then
    begin
      if DM.tblMensalidades.State in [dsInsert, dsEdit] then DM.tblMensalidades.Cancel;
      CanClose := True;
      Exit;
    end;

    if Mensagem( 'Deseja realmente dar desconto à mensalidade ?', Application.Title,
                 MB_YESNO + MB_ICONQUESTION ) = ID_YES then
    begin
      try
      dblAux := StrToFloat( EditFinal.Text );
      dblAux := RoundFloat( dblAux, 2 );
      if DataHoje > frmMensalidades.tblMensalidadesDataVencimento.AsDateTime then
        DM.tblMensalidadesDescontoExtra.Value :=
          RoundFloat( ( ( dblValor - dblAux ) / dblDesconto ), 2 )
      else
        DM.tblMensalidadesDescontoExtra.Value := RoundFloat( ( dblValor - dblAux ), 2 );
      except
        Mensagem( 'Valor inválido.', Application.Title, MB_OK + MB_ICONSTOP );
        EditFinal.SetFocus;
        EditFinal.SelectAll;
        CanClose := False;
      end;
    end;

end;

procedure TfrmDesconto.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.

