unit uPessoas_Descontos_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, ZConnection, DBCtrls, Mask, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons,
  ComCtrls;

type
  Tfrm_pessoas_Descontos_Cad = class(TForm)
    paCabecalho: TPanel;
    Bevel1: TBevel;
    btnCancelar: TButton;
    btnConfirmar: TButton;
    tblDescontos: TUMZQuery;
    dtcDescontos: TDataSource;
    tblDescontoscd_pessoa: TIntegerField;
    tblDescontoscd_desconto: TIntegerField;
    tblDescontosvl_anosem_inicio: TSmallintField;
    tblDescontosvl_anosem_fim: TSmallintField;
    tblDescontoscd_depto: TSmallintField;
    tblDescontossn_primeira_parcela: TStringField;
    Label1: TLabel;
    txtCodigoAluno: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    btnCodigoAluno: TSpeedButton;
    UpDown1: TUpDown;
    txtAnoSemInicio: TMaskEdit;
    txtAnoSemFim: TMaskEdit;
    UpDown2: TUpDown;
    tblDescontosdescDepto: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    tblDescontosdescPlanos: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtCodigoAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pessoas_Descontos_Cad: Tfrm_pessoas_Descontos_Cad;

implementation

uses uSel_Pessoas, uDM;

{$R *.DFM}

procedure Tfrm_pessoas_Descontos_Cad.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_pessoas_Descontos_Cad.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   Dm.tblDeptos.Close;
   Dm.tblDeptos.Open;

   Dm.tblPlanoDesc.Close;
   Dm.tblPlanoDesc.Open;

   txtCodigoAluno.SetFocus;
end;

procedure Tfrm_pessoas_Descontos_Cad.txtCodigoAlunoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext( TWinControl( Sender ), True, True );
    Key := #0;
  end;

end;

procedure Tfrm_pessoas_Descontos_Cad.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F6 : btnCancelarClick( nil );
    VK_F7 : btnConfirmarClick( nil );
  end;
end;

procedure Tfrm_pessoas_Descontos_Cad.btnCancelarClick(Sender: TObject);
begin
  tblDescontos.Cancel;
  close;
end;

procedure Tfrm_pessoas_Descontos_Cad.btnConfirmarClick(Sender: TObject);
begin
   tblDescontos.Post;
   Close;
end;

procedure Tfrm_pessoas_Descontos_Cad.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if tblDescontos.State in [dsInsert, dsEdit] Then
       CanClose := False;
end;

procedure Tfrm_pessoas_Descontos_Cad.btnCodigoAlunoClick(Sender: TObject);
begin
  { Pesquisar Aluno }

  frm_Sel_Pessoa.Tipo_Pessoa := Pessoa;
  frm_Sel_Pessoa.ShowModal;

  if frm_Sel_Pessoa.flgSearch then
  Begin
     txtCodigoAluno.Text := frm_Sel_Pessoa.qryPessoa.FieldByName('cd_pessoa').AsString;
  End
  else Exit;


end;

procedure Tfrm_pessoas_Descontos_Cad.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
begin

  intAno := StrToInt(Copy(txtAnoSemInicio.Text,1,4));
  intSemestre := StrToInt(Copy(txtAnoSemInicio.Text,5,1));

  if Button = btNext then
  begin
    Inc( intSemestre );
    if intSemestre = 3 then
    begin
      Inc( intAno );
      intSemestre := 1;
    end;
  end
  else
  begin
    Dec( intSemestre );
    if intSemestre = 0 then
    begin
      Dec( intAno );
      intSemestre := 2;
    end;
  end;

  txtAnoSemInicio.Text := IntToStr( intAno ) + IntToStr( intSemestre );

end;

procedure Tfrm_pessoas_Descontos_Cad.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
begin

  intAno := StrToInt(Copy(txtAnoSemFim.Text,1,4));
  intSemestre := StrToInt(Copy(txtAnoSemFim.Text,5,1));

  if Button = btNext then
  begin
    Inc( intSemestre );
    if intSemestre = 3 then
    begin
      Inc( intAno );
      intSemestre := 1;
    end;
  end
  else
  begin
    Dec( intSemestre );
    if intSemestre = 0 then
    begin
      Dec( intAno );
      intSemestre := 2;
    end;
  end;

  txtAnoSemFim.Text := IntToStr( intAno ) + IntToStr( intSemestre );

end;
end.



