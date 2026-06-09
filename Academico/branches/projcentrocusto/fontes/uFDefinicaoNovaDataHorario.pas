unit uFDefinicaoNovaDataHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uListaExecucao, ImgList, Buttons;

type
  TfrmDefinicaoNovaDataHorario = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    lbDataAnterior: TLabel;
    Label3: TLabel;
    dtpNovaData: TDateTimePicker;
    Button1: TBitBtn;
    Button2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure dtpNovaDataChange(Sender: TObject);
  strict private
    { Private declarations }
    FDataAnterior : TDatetime;
  public
    { Public declarations }
    class function definirNovoHorario(var ListaExecucao : TListaExecucao; ListaHorariosDasDisciplinas: TStringList; const nr_anosemestre: Integer; const cd_turma: String): Boolean;
  end;

implementation

uses uGeneral, uUCadastroHorariosTurma, uFReajusteAulasHorarios;

{$R *.dfm}

{ TfrmDefinicaoNovaDataHorario }

class function TfrmDefinicaoNovaDataHorario.definirNovoHorario(
  var ListaExecucao: TListaExecucao; ListaHorariosDasDisciplinas: TStringList;
  const nr_anosemestre: Integer; const cd_turma: String): Boolean;
var
   frmDefinicaoNovaDataHorario: TfrmDefinicaoNovaDataHorario;
   I : Integer;
begin
   frmDefinicaoNovaDataHorario := TfrmDefinicaoNovaDataHorario.Create(nil);
   Result := ( frmDefinicaoNovaDataHorario.ShowModal() = mrYes );

   if Result then
   begin
      Result := TfrmReajusteAulasTurma.ajustarAulasHoras(ListaExecucao, ListaHorariosDasDisciplinas, nr_anosemestre, cd_turma, frmDefinicaoNovaDataHorario.dtpNovaData.Date);
      if NOT(Result) then
      begin
         Exit;
      end; 

      for I := 0 to ListaExecucao.Count() - 1 do
      begin
         if ( ListaExecucao.Item[I] is TExecucaoHorarioTurma ) then
         begin
            if TExecucaoHorarioTurma(ListaExecucao.Item[I]).TipoExecucao = teInsert then
            begin
               TExecucaoHorarioTurma(ListaExecucao.Item[I]).SetDataInicio(frmDefinicaoNovaDataHorario.dtpNovaData.Date);
            end
            else if TExecucaoHorarioTurma(ListaExecucao.Item[I]).TipoExecucao = teDelete then
            begin
               TExecucaoHorarioTurma(ListaExecucao.Item[I]).SetDataFim(frmDefinicaoNovaDataHorario.FDataAnterior);
            end;
         end;
      end;
   end;
end;

procedure TfrmDefinicaoNovaDataHorario.dtpNovaDataChange(Sender: TObject);
begin
   FDataAnterior := dtpNovaData.DateTime;
   FDataAnterior := TGeneral.CalcularData(FDataAnterior, cddDecremento, cdtDia);

   lbDataAnterior.Caption := FormatDateTime('dd/mm/yyyy', FDataAnterior)
end;

procedure TfrmDefinicaoNovaDataHorario.FormShow(Sender: TObject);
begin
   dtpNovaData.DateTime := TGeneral.CalcularData(Now(), cddIncremento, cdtDia);
   dtpNovaDataChange(nil);
end;

end.
