{*******************************************************************************

  Contém as classes e tipos usados na integração TASY - UNIMESTRE

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  Uninformare Informática
  http://www.uninformare.com.br/

  @author Uninformare Informática
  @version 28/04/2008
  
*******************************************************************************}
unit uSvcTestaServico;

interface

uses
   SysUtils, Variants, Classes, uSvcClasses, IniFiles, uCFuncArquivos;

type
   TUMSvcTestaServico = class(TUMServiceDefault)
   private
      { Private declarations }
   public
      { Public declarations }
      constructor Create();                        //construtor
      procedure onLoadServico(); override;                  //executa ao iniciar o serviço
      function processa(): IUMServiceAppRet; override;       //efetua a integração
      procedure onUnloadServico(); override;                //executa ao finalizar o serviço
      procedure stopProcessamento(); override;               //pára o serviço
   end;

implementation

uses
  uCFuncDatas;

{ TUMSvcTestaServico }

{**
  Construtor da classe.
  Incializa as classe e os arquivos de configuração para conexão.
}
constructor TUMSvcTestaServico.Create;
begin
   inherited Create();
   //carrega os arquivos de configurção que contém as
   //informações para conexão com as bases de dados
end;


{**
  Operações iniciais na primeira chamada do serviço.
  Abre conexão com o UNIMESTRE(MySQL), abre conexão com o TASY(Oracle).
  Se não conseguir efetuar conexão com uma ou outra base de dados,
  aborta o procedimento.
}

procedure TUMSvcTestaServico.onLoadServico;
begin
  //inicializa aqui os bereguetes
end;

{**
  Destrutor da classe.
  Destrói as variáveis e finaliza as conexões abertas.
}
procedure TUMSvcTestaServico.onUnloadServico;
begin
   //libera os objetos de configuração
end;

{**
  Faz o processamento da integração.
}
function TUMSvcTestaServico.processa: IUMServiceAppRet;
begin
   Result := srSuccess;
end;


procedure TUMSvcTestaServico.stopProcessamento;
begin
   //tratar aqui de forma que quando for chamado, pare tudo que esteja fazendo
   //e retorne
end;

initialization
   RegisterClass(TUMSvcTestaServico);
   
finalization
   UnRegisterClass(TUMSvcTestaServico);



end.
