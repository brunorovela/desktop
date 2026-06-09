unit uMensalidadeFinCartao;

interface

uses
   Classes, Contnrs, uMensalidadesBaixarParcelaClass, SysUtils, udm, General,
   StdCtrls, UZDataset, ZAbstractRODataset;
   
Type
  TMBFinCartao = class(TObject)

  private
    Campos     : TStringList;
  protected

  public
    constructor Create();
    destructor Destroy; override;

    procedure defineCampos();
    procedure setValorCampo( ds_campo: string; ds_valor: string );
    procedure inserir();
    procedure atualizar();
    procedure apagar();
    function getDataTransacao() : TDateTime;
    function getValorCampo( ds_campo: string) : string;
end;

implementation

{ TMBFinCartao }

procedure TMBFinCartao.apagar;
var
   qyFinCartao : TUMZQuery;
begin
   try
      DM.CriarConsulta( qyFinCartao );
      qyFinCartao.Close();
      qyFinCartao.SQL.Clear();
      qyFinCartao.SQL.Add('DELETE FROM fin_cartoes ');
      qyFinCartao.SQL.Add('WHERE ');
      qyFinCartao.SQL.Add('cd_cartao = :cd_cartao ');
      qyFinCartao.ParamByName('cd_cartao').AsString := Self.getValorCampo('cd_cartao');
      qyFinCartao.ExecSQL;

      DM.CriarConsulta( qyFinCartao );
      qyFinCartao.Close();
      qyFinCartao.SQL.Clear();
      qyFinCartao.SQL.Add('DELETE FROM fin_cartoes_parcelas ');
      qyFinCartao.SQL.Add('WHERE ');
      qyFinCartao.SQL.Add('cd_cartao = :cd_cartao ');
      qyFinCartao.ParamByName('cd_cartao').AsString := Self.getValorCampo('cd_cartao');
      qyFinCartao.ExecSQL;
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinCartao, E );
   end;

   FreeAndNil( qyFinCartao );
end;

procedure TMBFinCartao.atualizar;
var
   qyFinCartao : TUMZQuery;
begin
   try
      DM.CriarConsulta( qyFinCartao );
      qyFinCartao.Close();
      qyFinCartao.SQL.Clear();
      qyFinCartao.SQL.Add( 'UPDATE fin_cartoes SET ' );
      qyFinCartao.SQL.Add( 'tp_transacao = '    + QuotedStr( getValorCampo('tp_transacao'))     + ', ' );
      qyFinCartao.SQL.Add( 'nr_parcelas = '     + QuotedStr( getValorCampo('nr_parcelas'))      + ', ' );
      qyFinCartao.SQL.Add( 'nr_finalizacao = '  + QuotedStr( getValorCampo('nr_finalizacao'))   + ', ' );
      qyFinCartao.SQL.Add( 'nm_rede = '         + QuotedStr( getValorCampo('nm_rede'))          + ', ' );
      qyFinCartao.SQL.Add( 'nr_nsu = '          + QuotedStr( getValorCampo('nr_nsu')));
      qyFinCartao.SQL.Add( 'WHERE');
      qyFinCartao.SQL.Add( 'cd_cartao = ' + getValorCampo('cd_cartao') );

      qyFinCartao.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinCartao, E );
   end;

   FreeAndNil( qyFinCartao );

end;

constructor TMBFinCartao.Create;
begin
   defineCampos();
end;

procedure TMBFinCartao.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['cd_cartao']       := '';
   Campos.Values['dt_transacao']    := '';
   Campos.Values['vl_transacao']    := '0';
   Campos.Values['tp_transacao']    := '';
   Campos.Values['nr_parcelas']     := '1';
   Campos.Values['nr_nsu']          := '';
   Campos.Values['nr_finalizacao']  := '';
   Campos.Values['nm_rede']         := '';
end;

destructor TMBFinCartao.Destroy;
begin
  inherited;

  Campos.Free;
end;

function TMBFinCartao.getDataTransacao: TDateTime;
var
   dt_transacao   : string;
   data_transacao : TDateTime;
   qyFinCartao    : TUMZQuery;
begin
   dt_transacao := getValorCampo('dt_transacao');

   if dt_transacao = '' then
   begin
      DM.CriarConsulta( qyFinCartao );
      qyFinCartao.Close();
      qyFinCartao.SQL.Clear();
      qyFinCartao.SQL.Add( 'SELECT dt_transacao FROM fin_cartoes ' );
      qyFinCartao.SQL.Add( 'WHERE cd_cartao = ' + QuotedStr( getValorCampo('cd_cartao')) );
      qyFinCartao.Open();

      data_transacao := qyFinCartao.FieldByName('dt_transacao').AsDateTime;

      dt_transacao := DateToStr( data_transacao );
   end;

   Result := StrToDate( dt_transacao );
end;

function TMBFinCartao.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

procedure TMBFinCartao.inserir;
var
   qyFinCartao : TUMZQuery;
begin
   try
      DM.CriarConsulta( qyFinCartao );
      qyFinCartao.Close();
      qyFinCartao.SQL.Clear();
      qyFinCartao.SQL.Add( 'INSERT INTO fin_cartoes ' );
      qyFinCartao.SQL.Add( '(dt_transacao, vl_transacao, tp_transacao, nr_parcelas, nr_nsu) ' );
      qyFinCartao.SQL.Add( ' VALUES ( now(), ' );
      qyFinCartao.SQL.Add( QuotedStr( getValorCampo('vl_transacao')) + ',');
      qyFinCartao.SQL.Add( QuotedStr( getValorCampo('tp_transacao')) + ',');
      qyFinCartao.SQL.Add( QuotedStr( getValorCampo('nr_parcelas')) + ',');
      qyFinCartao.SQL.Add( QuotedStr( getValorCampo('nr_nsu')) + ')' );

      qyFinCartao.ExecSQL();
   except on E: EZDatabaseError do
      TrataErroBanco( qyFinCartao, E );
   end;

   FreeAndNil( qyFinCartao );
end;

procedure TMBFinCartao.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.
