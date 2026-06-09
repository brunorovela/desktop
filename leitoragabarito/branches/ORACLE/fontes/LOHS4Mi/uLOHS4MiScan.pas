unit uLOHS4MiScan;

interface

uses
   OMR_Actx_TLB, ActiveX, Classes, SysUtils, IniFiles, Dialogs;

type
   TUMLOHSScan = class(TObject)
   strict private
      FIPorta: integer;
      FBRetono: boolean;
      FClocks: String;
      FConfig: TIniFile;
      FSlDados: TStringList;
      FLOHS: TLOHS;
      procedure LOHSLeituraRealizada(ASender: TObject; var Leitura: OleVariant;
         NumClocks: Integer);
      procedure LOHSErroDetectado(ASender: TObject; CodigoErro: integer;
         var MensagemErro: OleVariant);
      procedure LOHSConectado(ASender: TObject);
   public
      constructor Create;
      destructor Destroy; override;
      procedure Conecta;
      procedure Desconecta;
      procedure LeFormulario;
      procedure Salva;
   end;

implementation

{ TUMLOHSScan }

procedure TUMLOHSScan.Conecta;
begin
   Self.FLOHS.Conecta(Self.FIPorta, 0);
end;

constructor TUMLOHSScan.Create;
begin
   Self.FConfig := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'LOHS4Mi.ini');
   Self.FBRetono := Self.FConfig.ReadBool('Configuracao', 'Retorno', true);
   Self.FIPorta := Self.FConfig.ReadInteger('Configuracao', 'Porta', 2);
   Self.FClocks := Self.FConfig.Readstring('Configuracao', 'Clocks', '30:2');
   Self.FSlDados := TStringList.Create;
   Self.FLOHS := TLOHS.Create(nil);
   Self.FLOHS.OnLeituraRealizada := Self.LOHSLeituraRealizada;
   Self.FLOHS.OnErroDetectado := Self.LOHSErroDetectado;
   Self.FLOHS.OnConectado := Self.LOHSConectado;
end;

procedure TUMLOHSScan.Desconecta;
begin
   Self.FLOHS.TxNivelDeCinza := 0;
   Self.FLOHS.LeituraDuplaHabilitada := 0;
   Self.FLOHS.Desconecta;
end;

destructor TUMLOHSScan.Destroy;
begin
   FreeAndNil(Self.FConfig);
   FreeAndNil(Self.FSlDados);
   FreeAndNil(Self.FLOHS);
   inherited;
end;

procedure TUMLOHSScan.LeFormulario;
begin
   Self.FLOHS.LeFormulario;
end;

procedure TUMLOHSScan.LOHSConectado(ASender: TObject);
begin
   Self.FLOHS.TxNivelDeCinza := 1;
   Self.FLOHS.LeituraDuplaHabilitada := Ord(Self.FBRetono);
end;

procedure TUMLOHSScan.LOHSErroDetectado(ASender: TObject; CodigoErro: integer;
  var MensagemErro: OleVariant);
const
   MSG_ERRO = 'Ocorreu um erro na leitura do cartão:' + #13 + '(%d) %s';
begin
   ShowMessage(Format(MSG_ERRO, [CodigoErro, MensagemErro]));
end;

procedure TUMLOHSScan.LOHSLeituraRealizada(ASender: TObject;
  var Leitura: OleVariant; NumClocks: Integer);
const
   COLUNAS = 12;
var
   LINHAS : Integer;
   LDados: array of array of char;
   Linha, Coluna, Indice, Inicio: integer;
   LSAux: string;
begin
   LINHAS := ( StrToInt( copy( FClocks, 0, 2 )) * StrToInt( copy(FClocks, 2)) );
   LSAux := Leitura;
   for Linha := 1 to LINHAS do
      for Coluna := 1 to COLUNAS do
         LDados[Linha][Coluna] := '1';
   Indice := 1;
   Inicio := Ord(LSAux[1]);
   while (Ord(LSAux[Indice]) <= LINHAS) and (Ord(LSAux[Indice]) >= Inicio) do
   begin
      LDados[Ord(LSAux[Indice])][Ord(LSAux[Indice + 1])] := '0';
      Inc(Indice, 3);
   end;
   LSAux := '';
   Self.FSlDados.Clear;
   for Linha := 1 to LINHAS do
   begin
      for Coluna := 1 to COLUNAS do
         LSAux := LSAux + LDados[Linha][Coluna];
      Self.FSlDados.Add(LSAux);
      LSAux := '';
   end;
end;

procedure TUMLOHSScan.Salva;
begin
   Self.FSlDados.SaveToFile('LOHS4MISCAN.DAT');
end;

initialization
   CoInitialize(nil);

finalization
   CoUninitialize;

end.
