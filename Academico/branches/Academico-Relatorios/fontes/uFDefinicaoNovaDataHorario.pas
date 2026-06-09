unit uFDefinicaoNovaDataHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uListaExecucao, ImgList, Buttons,
  UMDateTimePicker, DateUtils, uFGerenciaConflitoHorario, Contnrs, uUCadastroHorariosTurma;

type
  TfrmDefinicaoNovaDataHorario = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    lbDataAnterior: TLabel;
    Label3: TLabel;
    Button1: TBitBtn;
    Button2: TBitBtn;
    umdtData: TUMDateTimePicker;
    procedure umdtDataChangeDate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  strict private
    { Private declarations }
    FDataAnterior : TDatetime;
  public
    { Public declarations }
    class function definirNovoHorario(
      var ListaExecucao : TListaExecucao;
      ListaHorariosDasDisciplinas: TStringList;
      const nr_anosemestre: Integer;
      const cd_turma: String;
      var sMensagemErro:String;
      HorariosTurma :THorariosTurmaGrid;
      var mostrarConflitoAula: Boolean
    ): Boolean;
    
    class function verificaConflitoHorario(
      var ListaExecucao: TListaExecucao;
      const nr_anosemestre: Integer;
      const cd_turma_base: String;
      const data: TDateTime;
      var sMensagemErro: String;
      HorariosTurma : THorariosTurmaGrid;
      ListaHorariosDasDisciplinas: TStringList;
      var mostrarConflitoAula: Boolean;
      listaHorariosNaoExcluidos : TStringList = nil;
      passagemRecursiva : Boolean = false;
      listaDatasOriginais : TStringList = nil
    ): Boolean;
    class procedure ajustarDatasInicioFim(var ListaExecucao: TListaExecucao; const data: TDateTime);
    class procedure restauraDatasOriginais(listaDatasOriginais: TStringList;listaHorariosConflito: TStringList);
  end;

implementation

uses uGeneral, uDM, uFReajusteAulasHorarios, UZDataset;

{$R *.dfm}

{ TfrmDefinicaoNovaDataHorario }

class function TfrmDefinicaoNovaDataHorario.definirNovoHorario(
  var ListaExecucao: TListaExecucao; ListaHorariosDasDisciplinas: TStringList;
  const nr_anosemestre: Integer; const cd_turma: String; var sMensagemErro: String;
  HorariosTurma : THorariosTurmaGrid; var mostrarConflitoAula: Boolean): Boolean;
var
   frmDefinicaoNovaDataHorario: TfrmDefinicaoNovaDataHorario;
   I : Integer;
begin
   frmDefinicaoNovaDataHorario := TfrmDefinicaoNovaDataHorario.Create(nil);
   Result := ( frmDefinicaoNovaDataHorario.ShowModal() = mrYes );

   if Result then
   begin
      // Verifica se a nova data escolhida para o horário conflita com data de horários anteriores (inativos)
      Result := TfrmDefinicaoNovaDataHorario.verificaConflitoHorario(ListaExecucao, nr_anosemestre, cd_turma, frmDefinicaoNovaDataHorario.umdtData.Date, sMensagemErro, HorariosTurma, ListaHorariosDasDisciplinas, mostrarConflitoAula);
      if NOT(Result) then
      begin
         Exit;
      end;

      if(mostrarConflitoAula) then
      begin
         Result := TfrmReajusteAulasTurma.ajustarAulasHoras(
                    ListaExecucao,
                    ListaHorariosDasDisciplinas,
                    nr_anosemestre,
                    cd_turma,
                    frmDefinicaoNovaDataHorario.umdtData.Date);
         if NOT(Result) then
         begin
            Exit;
         end;
      end;

      // Preenche as datas de inicio/fim dos horários que foram inseridos ou excluidos       
      TfrmDefinicaoNovaDataHorario.ajustarDatasInicioFim(ListaExecucao, frmDefinicaoNovaDataHorario.umdtData.Date);
   end;
end;

procedure TfrmDefinicaoNovaDataHorario.FormShow(Sender: TObject);
begin
   umdtData.setDate(TGeneral.CalcularData(Now(), cddIncremento, cdtDia));
   umdtDataChangeDate(nil);
end;

class procedure TfrmDefinicaoNovaDataHorario.restauraDatasOriginais(
  listaDatasOriginais, listaHorariosConflito: TStringList);
var
   i:integer;
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);

   //Atualiza as datas para voltarem a original, mantendo as novas datas que n entraram em conflito
   if(listaHorariosConflito <> nil) then
   begin

      for I := 0 to listaHorariosConflito.Count - 1 do
      begin
         qryUpdate.SQL.Text := listaDatasOriginais.Values[listaHorariosConflito.Strings[i]];
         qryUpdate.ExecSQL;
      end;
      
   end else begin

      for I := 0 to listaDatasOriginais.Count - 1 do
      begin
         qryUpdate.SQL.Text := listaDatasOriginais.ValueFromIndex[i];
         qryUpdate.ExecSQL;
      end;
   end;
end;

procedure TfrmDefinicaoNovaDataHorario.umdtDataChangeDate(
  Sender: TObject);
begin
   FDataAnterior := umdtData.getDate;
   FDataAnterior := TGeneral.CalcularData(FDataAnterior, cddDecremento, cdtDia);

   lbDataAnterior.Caption := FormatDateTime('dd/mm/yyyy', FDataAnterior)
end;

class function TfrmDefinicaoNovaDataHorario.verificaConflitoHorario(
   var ListaExecucao: TListaExecucao; const nr_anosemestre: Integer; const cd_turma_base: String;
   const data: TDateTime; var sMensagemErro: String; HorariosTurma : THorariosTurmaGrid; ListaHorariosDasDisciplinas: TStringList;
   var mostrarConflitoAula: Boolean; listaHorariosNaoExcluidos : TStringList; passagemRecursiva :  Boolean;
   listaDatasOriginais : TStringList): Boolean;
const
   SQL_CHECA_CONFLITO_AULAS =
         ' SELECT ' +
         '     thc.cd_turmas_horarios cd_chave ' +
         '  FROM ' +
         '     turmas_horarios_config thc ' +
         '  WHERE ' +
         '     thc.nr_anosemestre = :nr_anosemestre AND ' +
         '     thc.cd_turma_base LIKE :cd_turma_base AND ' +
         '     thc.cd_horario = :cd_horario AND ' +
         '     thc.nr_dia_semana = :nr_dia_semana AND ' +
         '     ((thc.dt_inicial > SUBDATE(DATE_FORMAT(:data, "%Y-%m-%d"), INTERVAL 1 DAY)) OR (thc.dt_final >= SUBDATE(DATE_FORMAT(:data, "%Y-%m-%d"), INTERVAL 1 DAY)))';
   SQL_CHECA_CONFLITO_AULAS_DISC =
         ' SELECT ' +
         '     thc.nr_dia_semana,         ' +
         '     d.descricao ds_disciplina, ' +
         '     COALESCE(DATE_FORMAT(thc.dt_inicial, "%d/%m/%Y"), "Primeiro horário da turma") dt_inicial, ' +
         '     COALESCE(DATE_FORMAT(thc.dt_final, "%d/%m/%Y"), "Horário atual da turma") dt_final, ' +
         '     CONCAT(h.codigo, " - ", h.ds_horario, " (", h.hr_inicio, " - ",	h.hr_fim,")") ds_horario, ' +
         '     thc.cd_turmas_horarios cd_chave ' +
         '  FROM ' +
         '     turmas_horarios_config thc ' +
         '     INNER JOIN horarios h ON (h.codigo = thc.cd_horario) ' +
         '     INNER JOIN turmas t ON (t.codigo = thc.cd_turma_base AND t.anosemestre = thc.nr_anosemestre) ' +
         '     INNER JOIN disciplinas d ON (d.codigo = thc.cd_disciplina AND t.curso = d.curso) ' +
         '  WHERE ' +
         '     thc.nr_anosemestre = :nr_anosemestre AND ' +
         '     thc.cd_turma_base LIKE :cd_turma_base AND ' +
         '     thc.cd_horario = :cd_horario AND ' +
         '     thc.nr_dia_semana = :nr_dia_semana AND ' +
         '     ((thc.dt_inicial > SUBDATE(DATE_FORMAT(:data, "%Y-%m-%d"), INTERVAL 1 DAY)) OR (thc.dt_final >= SUBDATE(DATE_FORMAT(:data, "%Y-%m-%d"), INTERVAL 1 DAY)))';
var
   i,K: Integer;
   ExecucaoHorarioTurma : TExecucaoHorarioTurma;
   qryChecaConflitoHorario: TUMZReadOnlyQuery;
   horariosConflitam: TStringList;
   resultadoModalOk,apenasExclusao,horarioJaExcluido,resultadoExcluido: Boolean;
   mensagemErroInterna: String;
   listaHorariosConflito:TStringList;
begin
   horariosConflitam := TStringList.Create;
   
   DM.CriarConsulta(qryChecaConflitoHorario);
   qryChecaConflitoHorario.SQL.Text := SQL_CHECA_CONFLITO_AULAS;

   if(passagemRecursiva) then
   begin
      mensagemErroInterna := 'A data "'+DateToStr(data)+'" definida para a nova tabela de horários está conflitando '+#13+'com datas de horários já existentes, sendo: '+#13#13;         sMensagemErro := mensagemErroInterna;
      qryChecaConflitoHorario.SQL.Text := SQL_CHECA_CONFLITO_AULAS_DISC;
      listaHorariosConflito := TStringList.Create;
   end;

   Result := True;
   resultadoExcluido := true;

   for i := 0 to ListaExecucao.Count() - 1 do
   begin
      if ( ListaExecucao.Item[i] is TExecucaoHorarioTurma ) then
      begin
         ExecucaoHorarioTurma := TExecucaoHorarioTurma(ListaExecucao.Item[i]);

         { Verifica se o usuario está eliminando um horário que existia na grade de horarios,
           nesse caso o horário que estava ativo será colocado com inativo e uma data final,
           mas para isso a data final que será incluída não deve conflitar com nenhuma outra data
           daquele horario/dia_da_semana }
         if ExecucaoHorarioTurma.TipoExecucao = teDelete then
         begin

            //Apenas verifica conflito nesse horário se existir um registro de inclusão no msm dia/horario
            //Caso contrario é uma exclusão e deve ser tratada na tela de Reajuste de horários
            apenasExclusao := true;
            for k := 0 to ListaExecucao.Count() - 1 do
            begin
               if((I <> K) AND
                 (TExecucaoHorarioTurma(ListaExecucao.Item[k]).Horario = ExecucaoHorarioTurma.Horario) AND
                 (TExecucaoHorarioTurma(ListaExecucao.Item[k]).DiaSemana = ExecucaoHorarioTurma.DiaSemana)) THEN
               begin
                  apenasExclusao := false;
                  break;
               end;
            end;

            //se é apenas exclusão não verifica o conflito
            if apenasExclusao then
            begin
               continue;
            end;

            qryChecaConflitoHorario.Close;
            qryChecaConflitoHorario.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
            qryChecaConflitoHorario.ParamByName('cd_turma_base').AsString := cd_turma_base;
            qryChecaConflitoHorario.ParamByName('cd_horario').AsInteger := ExecucaoHorarioTurma.Horario;
            qryChecaConflitoHorario.ParamByName('nr_dia_semana').AsInteger := ExecucaoHorarioTurma.DiaSemana;
            qryChecaConflitoHorario.ParamByName('data').AsDate := data;
            qryChecaConflitoHorario.Open;

            if qryChecaConflitoHorario.RecordCount > 0 then
            begin
            
               while not qryChecaConflitoHorario.Eof do
               begin
                  if listaHorariosNaoExcluidos <> nil then
                  begin

                     //Se este horário ja não foi excluido então realmente existe um conflito com as novas datas selecionadas pelo usuário
                     if not(listaHorariosNaoExcluidos.Values[qryChecaConflitoHorario.FieldByName('cd_chave').AsString] = '1') then
                     begin
                        qryChecaConflitoHorario.Next;
                        continue;
                     end;

                     //Se chegar até aqui temos um conflito
                     resultadoExcluido := false;
                  end;

                  // Verifica se o horário que está sendo verificado já não foi incluído como um horário conflitante
                  if horariosConflitam.IndexOf(qryChecaConflitoHorario.FieldByName('cd_chave').AsString) = -1 then
                  begin
                     horariosConflitam.Add(qryChecaConflitoHorario.FieldByName('cd_chave').AsString);

                     if(passagemRecursiva) then
                     begin
                        listaHorariosConflito.Add(qryChecaConflitoHorario.FieldByName('cd_chave').AsString);
                        mensagemErroInterna := mensagemErroInterna + 'Disciplina: ' + qryChecaConflitoHorario.FieldByName('ds_disciplina').AsString+#13;
                        mensagemErroInterna := mensagemErroInterna + 'Data inicial: ' + qryChecaConflitoHorario.FieldByName('dt_inicial').AsString+#13;
                        mensagemErroInterna := mensagemErroInterna + 'Data final: ' + qryChecaConflitoHorario.FieldByName('dt_final').AsString+#13;
                        mensagemErroInterna := mensagemErroInterna + 'Horário: ' + qryChecaConflitoHorario.FieldByName('ds_horario').AsString+#13;
                        mensagemErroInterna := mensagemErroInterna + 'Dia da semana: ' + LongDayNames[qryChecaConflitoHorario.FieldByName('nr_dia_semana').AsInteger]+#13#13;
                     end;
                  end;

                  qryChecaConflitoHorario.Next;
               end;

               Result := False;
            end;

         end;

      end;
   end;

   //Se for a verificação que ja tem excluidos, temos de verificar a outra variável
   if (listaHorariosNaoExcluidos <> nil) AND (Result = false) then
   begin
      Result := resultadoExcluido;
   end;

   // Mostra a tela para verificar os conflitos caso o retorno não seja True
   if not Result then
   begin

      //Se é passagem recursiva e ainda deu erro mostra a msg e restaura as datas originais
      if(passagemRecursiva) then
      begin
         self.restauraDatasOriginais(listaDatasOriginais,listaHorariosConflito);
         sMensagemErro := mensagemErroInterna;
         exit;
      end;

      Application.CreateForm( TformGerenciaConflitoHorario, formGerenciaConflitoHorario );
      formGerenciaConflitoHorario.setHorariosConflitam(horariosConflitam);
      formGerenciaConflitoHorario.setHorariosTurma(HorariosTurma);
      formGerenciaConflitoHorario.setDataInicioNovoHorario(data);
      formGerenciaConflitoHorario.setDadosReajusteAulas(ListaExecucao,nr_anosemestre,cd_turma_base,ListaHorariosDasDisciplinas);
      formGerenciaConflitoHorario.ShowModal;

      resultadoModalOk := (formGerenciaConflitoHorario.ModalResult = mrOk);
      mostrarConflitoAula := formGerenciaConflitoHorario.getMostrarConflitoAula;
      listaDatasOriginais := formGerenciaConflitoHorario.getSqlRestauraDatasOriginais;

      result := resultadoModalOk;

      if not(resultadoModalOk) then
      begin
         self.restauraDatasOriginais(listaDatasOriginais,nil);
         sMensagemErro := 'Não foi possivel efetuar a alteração nos horários';
      end else begin

         //Se retornou "Ok" da modal chama denovo para verificar os conflitos, caso continua a ter conflito mostra a mensagem para o usuário
         result := self.verificaConflitoHorario(
            ListaExecucao,
            nr_anosemestre,
            cd_turma_base,
            data,
            sMensagemErro,
            HorariosTurma,
            ListaHorariosDasDisciplinas,
            mostrarConflitoAula,
            formGerenciaConflitoHorario.getListaHorariosNaoExcluidos,
            true,
            listaDatasOriginais
         );

      end;

      FreeAndNil(formGerenciaConflitoHorario);
   end;

end;

class procedure TfrmDefinicaoNovaDataHorario.ajustarDatasInicioFim(var ListaExecucao: TListaExecucao; const data: TDateTime);
var
   i: Integer;
begin

   { Varre a lista de horários que serão executados (inclusões e exclusões),
     quando for inserção de um novo horário é preenchida a data de início do mesmo,
     quando for exclusão de um horário é preenchida a data de fim do mesmo
     (como sendo um dia anterior a data repassada }
   for i := 0 to ListaExecucao.Count() - 1 do
   begin
      if ( ListaExecucao.Item[i] is TExecucaoHorarioTurma ) then
      begin
         // Caso inclusão de novo horário preenche a data de inicio
         if TExecucaoHorarioTurma(ListaExecucao.Item[i]).TipoExecucao = teInsert then
         begin
            TExecucaoHorarioTurma(ListaExecucao.Item[i]).SetDataInicio(data);
         end
         // Caso exclusão de horário existente, preenche a data de fim do mesmo (um dia anterior a data repassada)
         else if TExecucaoHorarioTurma(ListaExecucao.Item[i]).TipoExecucao = teDelete then
         begin
            TExecucaoHorarioTurma(ListaExecucao.Item[i]).SetDataFim(IncDay(data, -1));
         end;
      end;
   end;

end;

end.
