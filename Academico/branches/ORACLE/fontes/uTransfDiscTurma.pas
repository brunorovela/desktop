unit uTransfDiscTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, General, ComCtrls, Mask, uMensagem;

type
  TfrmTransfDisc = class(TForm)
    Panel1: TPanel;
    pnTitulo: TPanel;
    pnFooter: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Panel2: TPanel;
    grd: TDBGrid;
    qryListaTurmaDisc: TUMZQuery;
    dtcListaTurmaDisc: TDataSource;
    qryListaTurmaDiscdescricao: TStringField;
    qryListaTurmaDisccd_turma: TStringField;
    qryListaTurmaDisccd_curso: TStringField;
    qryListaTurmaDiscetapa: TIntegerField;
    UMZQuery1: TUMZQuery;
    Panel3: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    lblNomeAluno: TLabel;
    Label2: TLabel;
    txtAnoSemestre: TMaskEdit;
    qryQtdVagasPreechidas: TUMZQuery;
    qryListaTurmaDiscnr_restricao: TIntegerField;
    qryListaTurmaDiscqtd_vagas: TLargeintField;
    qryListaTurmaDiscqtd_vagas_total: TIntegerField;
    procedure grdDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function getQtdVagasTurmaPreenchidas(): boolean;
  private
    APreReq: TStringList;
    APreReqEsp: TStringList;
    AConfHor: TStringList;
    ARestricaoDisc : TStringList;
  public
    disciplina, turma, curso: String;
    anosemestre, cd_pessoa, etapa : integer;
  end;

var
  frmTransfDisc: TfrmTransfDisc;

implementation
  uses
     uDM, ufTrocaDeTurma, uUsuario, uFuncoesGerais;
{$R *.dfm}

procedure TfrmTransfDisc.btnOkClick(Sender: TObject);
CONST
   DS_MSG = ' Deseja realmente trocar a turma desta disciplina? ';
var
   sChave, sMsg : String;
   slRet, slDados: TStringList;
   i : integer;
   parametros: TParamsIni;
begin
   sMsg := '';

   if ( qryListaTurmaDisccd_turma.IsNull ) then
   begin
      Mensagem(
         'Selecione uma turma para avançar!',
         'Atenção',
         MB_OK + MB_ICONEXCLAMATION
      );
      ModalResult := mrNone;
   end
   else begin
      //verifica horarios

      sChave := qryListaTurmaDisccd_curso.AsString + ':' + disciplina;

      if (( qryListaTurmaDiscnr_restricao.AsInteger and 4) = 4) then
      begin
          slRet := VerificaConflitoHorario(
            cd_pessoa,
            anosemestre,
            turma,
            StrToInt(disciplina)
          );

         AConfHor := TStringList.Create();

         AConfHor.AddObject(sChave, slRet);

         i := AConfHor.IndexOf(sChave);
         if (i <> -1)  then
         begin
            slDados := TStringList(AConfHor.Objects[i]);
            if (slDados.Count > 0) then
               begin
               //tem conflito de horarios
               for i := 0 to slDados.Count - 1 do
               begin
                  sMsg := sMsg +  '- ' + slDados.Strings[i]+Chr(13);
               end;

               parametros.titulo := 'Atenção';
               parametros.mensagens.msgPrincipal := sMsg;
               parametros.mensagens.msgTopo := 'A Disciplina Selecionada Possui Conflito de Horário:';
               parametros.dimensao.altura := 400;
               parametros.dimensao.largura := 800;

               if (DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false )) then
               begin
                  parametros.opcoes := (BT_YESNO + ICO_WARNING);
                  parametros.mensagens.msgRodape := 'Deseja continuar?';

                  with TfrmMensagem.create(Self, parametros) do
                  begin
                     ShowModal;
                     if (getResposta <> RESP_YES) then
                     begin
                        ModalResult := mrNone;
                        Exit;
                     end;
                  end;
               end
               else begin
                  parametros.mensagens.msgRodape := ' Você não tem autorização para prosseguir. ';
                  parametros.opcoes := (BT_OK + ICO_WARNING);
                  grd.SelectedRows.CurrentRowSelected := False;
                  with TfrmMensagem.create(Self, parametros) do
                  begin
                     ShowModal;
                  end;
               end;
            end;
         end;
      end;        

      // Verifica a qtd de vagas na turma 
      if not ( getQtdVagasTurmaPreenchidas() ) then
      begin
         Mensagem(
            'Não há mais vagas disponíveis para esta turma!',
            'Atenção',
            MB_OK + MB_ICONEXCLAMATION
         );

         ModalResult := mrNone;
         Exit;
      end;

      if Mensagem(DS_MSG, 'Atenção', MB_YESNO) = ID_NO then
      begin
         ModalResult := mrNone;
         Exit;
      end;

      ModalResult := mrOk;
   end;
end;

function TfrmTransfDisc.getQtdVagasTurmaPreenchidas: boolean;
begin
   qryQtdVagasPreechidas.Close();

   qryQtdVagasPreechidas.ParamByName('cd_curso').AsString := curso;
   qryQtdVagasPreechidas.ParamByName('cd_turma').AsString := qryListaTurmaDisccd_turma.AsString;
   qryQtdVagasPreechidas.ParamByName('anosemestre').AsInteger := anosemestre;
   qryQtdVagasPreechidas.ParamByName('disciplina').AsString := disciplina;
   qryQtdVagasPreechidas.ParamByName('etapa').AsInteger := etapa;
                       
   qryQtdVagasPreechidas.Open();

   result := true; 

   if ( qryQtdVagasPreechidas.FieldByName('nr_vagas_preenchidas').AsInteger >= qryListaTurmaDiscqtd_vagas_total.AsInteger )
   then
      result := false;
end;

procedure TfrmTransfDisc.grdDblClick(Sender: TObject);
begin
   btnOkClick(nil);
end;

procedure TfrmTransfDisc.FormShow(Sender: TObject);
begin
   qryListaTurmaDisc.Close();

   qryListaTurmaDisc.ParamByName('disciplina').AsString := disciplina;
   qryListaTurmaDisc.ParamByName('turma').AsString := turma;
   qryListaTurmaDisc.ParamByName('anosemestre').AsInteger := anosemestre;
   qryListaTurmaDisc.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qryListaTurmaDisc.ParamByName('SN_MOSTRA_HORARIOS').AsString := DM.variavel_parametro('sn_mostra_disciplinas_horarios');

   qryListaTurmaDisc.Open();

end;

end.
