unit uMensalidadesNotificacoes;

interface

type
   TMensalidadesNotificacoes = class(TObject)
      class procedure Notificar(const cd_mensalidade: Integer);
   end;

implementation

uses uLoginManager, UZDataset, SysUtils;

{ TMensalidadesNotificacoes }

class procedure TMensalidadesNotificacoes.Notificar(
  const cd_mensalidade: Integer);
const
   SQL_INSERIR_NOTIFICACAO =
      ' INSERT INTO mensalidades_notificar (cd_mensalidade, dt_solicitacao, cd_pessoa_solicitante) ' +
      ' VALUES (:cd_mensalidade, NOW(), :cd_pessoa_solicitante) ';
var
   qyInserirNotificacao : TUMZQuery;
begin
   TLoginManager.GetInstancia().GetDM().CriarConsulta(qyInserirNotificacao);
   qyInserirNotificacao.SQL.Text := SQL_INSERIR_NOTIFICACAO;
   qyInserirNotificacao.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;
   qyInserirNotificacao.ParamByName('cd_pessoa_solicitante').AsInteger := TLoginManager.GetInstancia().GetDM().GetUsuarioLogado.Pessoa.Codigo;
   qyInserirNotificacao.ExecSQL();

   FreeAndNil(qyInserirNotificacao);
end;

end.
