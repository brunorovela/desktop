unit Inner;

interface

Uses
 Constantes;

type
  TInner = class(TObject)
  private

  public
   { PadraoCartao                : Integer;
    CountTentativasEnvioComando : Integer;
    TempoInicialPingOnLine      : TDateTime;
    EstadoAtual                 : enumEstadosInner;
    CountRepeatPingOnline       : Integer;
    Verificacao                 : Integer;
    Identificacao               : Integer;
    DoisLeitores                : Boolean;
    CountPingFail               : Integer;
    Numero                      : Integer;
    TempoColeta                 : Integer;
    Catraca                     : Boolean;
    Biometrico                  : Boolean;
    QtdDigitos                  : Integer;
    CntDoEvents                 : Integer;
    TipoLeitor                  : Integer;
    ValorLeitor1                : Integer;
    ValorLeitor2                : Integer;
    Teclado                     : Boolean;
    Temporizador                : TDateTime;
    EstadoSolicitacaoPingOnLine : enumEstadosInner;
    TempoInicialMensagem        : TDateTime;
    ListaBio                    : Boolean;
    Lista                       : Boolean;    }
  end;

implementation

end.
 