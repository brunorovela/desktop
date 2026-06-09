unit uSvcIntegraPessoasArquivo;

interface

uses
   uSvcClasses, uDMConexao, IniFiles, SysUtils, Windows, Classes, FileCtrl,
   uArquivoIntegracao;

type

   TUMSvcIntegraPessoasArquivo = class(TUMServiceDefault)
   strict private
      { Retorna um StringList que contem todos os caminhos de arquivos ".txt"
        dentro do diretório passado como parâmetro }
      function GetArquivos(Diretorio: String): TStringList;

      function TemAtributo(Attr, Val: Integer): Boolean;

   public
      constructor Create();
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
   end;

implementation

{ TUMSvcIntegraPessoasArquivo }

constructor TUMSvcIntegraPessoasArquivo.Create;
begin
   inherited;
end;

function TUMSvcIntegraPessoasArquivo.GetArquivos(Diretorio: String): TStringList;
var
   F: TSearchRec;
   Ret: Integer;
begin
   Result := TStringList.Create;

   Ret := FindFirst(Diretorio+'\*.txt', faAnyFile, F);

   while Ret = 0 do
   begin

      if not(TemAtributo(F.Attr, faDirectory)) then
      begin
         Result.Add(Diretorio + '\' + F.Name);
      end;
      
      Ret := FindNext(F);
   end;
end;

procedure TUMSvcIntegraPessoasArquivo.onLoadServico;
begin
   inherited;
end;

procedure TUMSvcIntegraPessoasArquivo.onUnloadServico;
begin
   inherited;
end;

function TUMSvcIntegraPessoasArquivo.processa: IUMServiceAppRet;
var
   i: Integer;
   ArquivosIntegra: TStringList;
begin

   Result := srExecutando;

   if Self.Config.ReadString('Arquivos', 'Integrar' , 'N') = 'S' then
   begin
      if DirectoryExists(Self.Config.ReadString('Arquivos', 'CaminhoPasta', 'S')) then
      begin
         ArquivosIntegra := Self.GetArquivos(Self.Config.ReadString('Arquivos', 'CaminhoPasta', 'S'));

         for I := 0 to ArquivosIntegra.Count - 1 do
         begin
            TArquivoIntegracao.Create(ArquivosIntegra.Strings[i], Self.Config);
         end;
      end;
   end;
end;

procedure TUMSvcIntegraPessoasArquivo.stopProcessamento;
begin
   inherited;
end;

function TUMSvcIntegraPessoasArquivo.TemAtributo(Attr, Val: Integer): Boolean;
begin
   Result := Attr and Val = Val;
end;

initialization
   RegisterClass(TUMSvcIntegraPessoasArquivo);

finalization
   UnRegisterClass(TUMSvcIntegraPessoasArquivo);

end.
