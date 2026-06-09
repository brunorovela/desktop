unit UTranslatedConsts;

interface

uses
   Consts, Windows;

procedure TranslateConst(SourceStr: PResStringRec; NewStr: PChar);

implementation

const
   SMsgDlgAtencao = 'Atenção';
   SMsgDlgErro = 'Erro';
   SMsgDlgInformacao = 'Informação';
   SMsgDlgConfirmacao = 'Confirmação';
   SMsgDlgSim = '&Sim';
   SMsgDlgNao = '&Não';
   SMsgDlgCancelar = 'Cancelar';
   SMsgDlgAjuda = '&Ajuda';
   SMsgDlgSemAjuda = 'Ajuda não disponível';
   SMsgDlgAjudaAjuda = 'Ajuda';
   SMsgDlgAbortar = '&Abortar';
   SMsgDlgRepetir = '&Repetir';
   SMsgDlgIgnorar = '&Ignorar';
   SMsgDlgTodos = '&Todos';
   SMsgDlgTodosNao = 'Nã&o para Todos';
   SMsgDlgTodosSim = 'Sim para &Todos';

procedure TranslateConst(SourceStr: PResStringRec; NewStr: PChar);
var
   OldProtect: DWORD;
begin
   VirtualProtect(SourceStr, SizeOf(SourceStr^), PAGE_EXECUTE_READWRITE, @OldProtect);
   SourceStr^.Identifier := Integer(NewStr);
   VirtualProtect(SourceStr, SizeOf(SourceStr^), OldProtect, @OldProtect);
end;

initialization
   TranslateConst(@SMsgDlgWarning, SMsgDlgAtencao);
   TranslateConst(@SMsgDlgError, SMsgDlgErro);
   TranslateConst(@SMsgDlgInformation, SMsgDlgInformacao);
   TranslateConst(@SMsgDlgConfirm, SMsgDlgConfirmacao);
   TranslateConst(@SMsgDlgYes, SMsgDlgSim);
   TranslateConst(@SMsgDlgNo, SMsgDlgNao);
   TranslateConst(@SMsgDlgCancel, SMsgDlgCancelar);
   TranslateConst(@SMsgDlgHelp, SMsgDlgAjuda);
   TranslateConst(@SMsgDlgHelpNone, SMsgDlgSemAjuda);
   TranslateConst(@SMsgDlgHelpHelp, SMsgDlgAjudaAjuda);
   TranslateConst(@SMsgDlgAbort, SMsgDlgAbortar);
   TranslateConst(@SMsgDlgRetry, SMsgDlgRepetir);
   TranslateConst(@SMsgDlgIgnore, SMsgDlgIgnorar);
   TranslateConst(@SMsgDlgAll, SMsgDlgTodos);
   TranslateConst(@SMsgDlgNoToAll, SMsgDlgTodosNao);
   TranslateConst(@SMsgDlgYesToAll, SMsgDlgTodosSim);

end.
