unit uSvcImportacaoTerminalCatracaImpRegistro;

interface

type
   TImpTipo = (itEntrada, itSaida);
   TImpPessoaTipo = (iptAluno, iptProfessor, iptFuncionario, iptUnknown);
   TImpRegistro = class(TObject)
   private
      ATipo: TImpTipo;
      ACodigo: Integer;
      AData: TDateTime;
      AImportado: Boolean;
      AInvalido: Boolean;
      APessoaTipo: TImpPessoaTipo;
      AProcessado: Boolean;
      ANome: string;
      ACodigoEntrada: Integer;
      ADataEntrada: TDateTime;
      AAnoSemestre : String;
      AUsaMatricula: Boolean;
      AConteudo:String;
      function getTipo(): TImpTipo;
      function getCodigo(): Integer;
      function getData(): TDateTime;
      function getImportado(): Boolean;
      function getInvalido(): Boolean;
      function getPessoaTipo(): TImpPessoaTipo;
      function getProcessado(): Boolean;
      function getNome(): string;
      function getCodigoEntrada(): Integer;
      function getDataEntrada(): TDateTime;
      procedure setTipo(itTipo: TImpTipo);
      procedure setCodigo(iCodigo: Integer);
      procedure setData(dtData: TDateTime);
      procedure setImportado(bImportado: Boolean);
      procedure setInvalido(bInvalido: Boolean);
      procedure setPessoaTipo(iptTipo: TImpPessoaTipo);
      procedure setProcessado(bProcessado: Boolean);
      procedure setNome(sNome: string);
      procedure setCodigoEntrada(iCod: Integer);
      procedure setDataEntrada(dtEntrada: TDateTime);
   protected
   published
   public
      constructor Create();
      property Tipo: TImpTipo read getTipo write setTipo;
      property Codigo: Integer read getCodigo write setCodigo;
      property Data: TDateTime read getData write setData;
      property PessoaTipo: TImpPessoaTipo read getPessoaTipo write setPessoaTipo;
      property Importado: Boolean read getImportado write setImportado;
      property Invalido: Boolean read getInvalido write setInvalido;
      property Nome: string read getNome write setNome;
      property Processado: Boolean read getProcessado write setProcessado;
      property CodigoEntrada: Integer read getCodigoEntrada write setCodigoEntrada;
      property DataEntrada: TDateTime read getDataEntrada write setDataEntrada;
      property UsaMatricula: Boolean read AUsaMatricula write AUsaMatricula;
      property AnoSemestre: String read AAnoSemestre write AAnoSemestre;
      property Conteudo: String read AConteudo write AConteudo;
   end;
                  
implementation

{ TImpRegistro }

constructor TImpRegistro.Create;
begin
   inherited;
   AImportado := False;
   AProcessado := False;
   AInvalido := False; 
   AUsaMatricula := False;
end;

function TImpRegistro.getCodigo: Integer;
begin
   Result := ACodigo;
end;

function TImpRegistro.getCodigoEntrada: Integer;
begin
   Result := ACodigoEntrada;
end;

function TImpRegistro.getData: TDateTime;
begin
   Result := AData;
end;

function TImpRegistro.getDataEntrada: TDateTime;
begin
   Result := ADataEntrada;
end;

function TImpRegistro.getImportado: Boolean;
begin
   Result := AImportado;
end;

function TImpRegistro.getInvalido: Boolean;
begin
   Result := AInvalido;
end;

function TImpRegistro.getNome: string;
begin
   Result := ANome;
end;

function TImpRegistro.getPessoaTipo: TImpPessoaTipo;
begin
   Result := APessoaTipo;
end;

function TImpRegistro.getProcessado: Boolean;
begin
   Result := AProcessado;
end;

function TImpRegistro.getTipo: TImpTipo;
begin
   Result := ATipo;
end;

procedure TImpRegistro.setCodigo(iCodigo: Integer);
begin
   ACodigo := iCodigo;
end;

procedure TImpRegistro.setCodigoEntrada(iCod: Integer);
begin
   ACodigoEntrada := iCod;
end;

procedure TImpRegistro.setData(dtData: TDateTime);
begin
   AData := dtData;
end;

procedure TImpRegistro.setDataEntrada(dtEntrada: TDateTime);
begin
   ADataEntrada := dtEntrada;
end;

procedure TImpRegistro.setImportado(bImportado: Boolean);
begin
   AImportado := bImportado;
end;

procedure TImpRegistro.setInvalido(bInvalido: Boolean);
begin
   AInvalido := bInvalido;
end;

procedure TImpRegistro.setNome(sNome: string);
begin
   ANome := sNome;
end;

procedure TImpRegistro.setPessoaTipo(iptTipo: TImpPessoaTipo);
begin
   APessoaTipo := iptTipo;
end;

procedure TImpRegistro.setProcessado(bProcessado: Boolean);
begin
   AProcessado := bProcessado;
end;

procedure TImpRegistro.setTipo(itTipo: TImpTipo);
begin
   ATipo := itTipo;
end;

end.
