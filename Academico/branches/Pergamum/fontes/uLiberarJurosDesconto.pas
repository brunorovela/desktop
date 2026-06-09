unit uLiberarJurosDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, ZConnection;

type
  TfLiberarJurosDescontos = class(TForm)
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label1: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    dtcMensalidades: TDataSource;
    lbParcela: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    meAbonos: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iJurosAntigo: integer;
    iDescAntigo: integer;
  end;

var
  fLiberarJurosDescontos: TfLiberarJurosDescontos;

implementation

uses
   uMensalidades, uDM, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

{$R *.dfm}

procedure TfLiberarJurosDescontos.Button1Click(Sender: TObject);
var
   sLog: String;
begin
   sLog:= '';
   if DM.tblMensalidades.FieldByName('sn_liberar_juros').Value <> iJurosAntigo then begin
      if DBCheckBox1.Checked then begin
         sLog := sLog + ' liberando os juros após Vencimento';
      end
      else begin
         sLog := sLog + ' não liberando os juros após Vencimento';
      end;
   end;

   if DM.tblMensalidades.FieldByName('sn_liberar_descontos').Value <> iDescAntigo then begin
      if DM.tblMensalidades.FieldByName('sn_liberar_juros').Value <> iJurosAntigo then begin
         sLog := sLog + ' e ';
      end;
      if DBCheckBox2.Checked then begin
         sLog := sLog + ' liberando os descontos após Vencimento ';
      end
      else begin
         sLog := sLog + ' não concedendo os descontos após Vencimento. ';
      end;
   end;

   if sLog <> '' then begin
      DM.setLog(2058, 'Alteração',
         DM.tblMensalidades.FieldByName('codigoaluno').AsString+';'+DM.tblMensalidades.FieldByName('anosemestre').AsString+';'+
         DM.tblMensalidades.FieldByName('turma').AsString+';'+DM.tblMensalidades.FieldByName('parcela').AsString+';'+
         FormatDateTime('dd/mm/yyyy',DM.tblMensalidades.FieldByName('datavencimento').AsDateTime)
         ,DM.tblMensalidadescd_coligada.AsInteger, sLog);
      DM.tblMensalidades.Post();
      Self.ModalResult := mrOK;
   end else begin
      Self.ModalResult := mrCancel;
   end;
end;

procedure TfLiberarJurosDescontos.Button2Click(Sender: TObject);
begin
   Self.Close();
end;

procedure TfLiberarJurosDescontos.FormShow(Sender: TObject);
var
   qAbonos : TUMZQuery;
begin
   lbParcela.Caption := DM.tblMensalidadesParcela.AsString + ' - '
                     +  FormatDateTime('dd/mm/yyyy', Dm.tblMensalidadesDataVencimento.AsDateTime)
                     + ' '
                     +  DM.tblMensalidadesds_historico.AsString;

   DM.CriarConsulta(qAbonos);

   qAbonos.SQL.Text := Format(
     ' SELECT parcela, datavencimento, ds_historico ' +
     '   FROM mensalidades ' +
     '  WHERE codigoaluno = :codigoaluno AND cd_coligada IN ( %s ) ' +
     '    AND ( sn_liberar_juros = 1 OR sn_liberar_descontos = 1 ) ' +
     '  ORDER BY datavencimento DESC ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qAbonos.ParamByName('codigoaluno').AsInteger := DM.tblMensalidadescodigoaluno.AsInteger;

   qAbonos.Open();

   meAbonos.Lines.Clear();

   while not qAbonos.Eof do begin
      meAbonos.Lines.Add(qAbonos.FieldByName('parcela').AsString + ' - '
                     +  FormatDateTime('dd/mm/yyyy', qAbonos.FieldByName('datavencimento').AsDateTime)
                     + ' '
                     +  qAbonos.FieldByName('ds_historico').AsString);

      qAbonos.Next();
   end;

   FreeAndNil(qAbonos);


end;

end.

