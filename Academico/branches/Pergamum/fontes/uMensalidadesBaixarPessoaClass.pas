unit uMensalidadesBaixarPessoaClass;

interface

uses
   Classes, Contnrs, uMensalidadesBaixarParcelaClass, UZDataset, SysUtils, udm;

Type
  TMBPessoa = class(TObject)

  private
    Campos        : TStringList;
    ListaParcelas : TObjectList;
  protected

  public
    constructor Create();
    destructor Destroy; override;

    procedure defineCampos();
    procedure adicionaParcela( dsMensalidade : TUMZQuery; cd_mensalidade_selecioada : string );
    procedure setValorCampo( ds_campo: string; ds_valor: string );
    function getValorCampo( ds_campo: string) : string;
    function getListaParcelas(atualizar_pagamento: boolean = false) : TObjectList;
    function getValorPago( vl_nominal : double; vl_desconto : double; vl_juros : double ) : double;
end;

implementation


{ TMBPessoa }

procedure TMBPessoa.adicionaParcela( dsMensalidade : TUMZQuery; cd_mensalidade_selecioada : string );
var
   objParcela        : TMBParcela;
   cd_mensalidade    : string;
   vl_pago           : double;
begin
   if ListaParcelas = nil then
   begin
      ListaParcelas := TObjectList.Create();
   end;

   while not dsMensalidade.Eof do
   begin
      objParcela := TMBParcela.Create();

      cd_mensalidade := dsMensalidade.FieldByName('cd_mensalidade').AsString;

      if cd_mensalidade = cd_mensalidade_selecioada then
      begin
         vl_pago := Self.getValorPago(
                     dsMensalidade.FieldByName('vl_nominal').AsFloat,
                     dsMensalidade.FieldByName('desconto_calc').AsFloat,
                     dsMensalidade.FieldByName('juros_calc').AsFloat );

         objParcela.setValorCampo( 'sn_ativo',    '1' );
         objParcela.setValorCampo( 'valorpago',   FloatToStr(vl_pago)  );
      end
      else
      begin
         objParcela.setValorCampo( 'sn_ativo',    '0' );
         objParcela.setValorCampo( 'valorpago',   '0' );
      end;

      objParcela.setValorCampo( 'parcela',         dsMensalidade.FieldByName('parcela').AsString         );
      objParcela.setValorCampo( 'datavencimento',  dsMensalidade.FieldByName('datavencimento').AsString  );
      objParcela.setValorCampo( 'ds_tipo_titulo',  dsMensalidade.FieldByName('ds_tipo_titulo').AsString  );
      objParcela.setValorCampo( 'vl_nominal',      dsMensalidade.FieldByName('vl_nominal').AsString      );
      objParcela.setValorCampo( 'valordesconto',   dsMensalidade.FieldByName('desconto_calc').AsString   );
      objParcela.setValorCampo( 'valorjuros_fixo', dsMensalidade.FieldByName('valorjuros').AsString      );
      objParcela.setValorCampo( 'valorjuros',      dsMensalidade.FieldByName('juros_calc').AsString      );
      objParcela.setValorCampo( 'valortotal',      dsMensalidade.FieldByName('valortotal').AsString      );
      objParcela.setValorCampo( 'desconto_calc',   dsMensalidade.FieldByName('desconto_calc').AsString   );
      objParcela.setValorCampo( 'juros_calc',      dsMensalidade.FieldByName('juros_calc').AsString      );
//      objParcela.setValorCampo( 'datapagamento',   dsMensalidade.FieldByName('datapagamento').AsString   );
      objParcela.setValorCampo( 'hr_atual',        FormatDateTime('hh:mm', now()));
      objParcela.setValorCampo( 'cd_mensalidade',  dsMensalidade.FieldByName('cd_mensalidade').AsString  );
      objParcela.setValorCampo( 'situacao',        dsMensalidade.FieldByName('situacao').AsString        );
      objParcela.setValorCampo( 'anosemestre',     dsMensalidade.FieldByName('anosemestre').AsString     );
      objParcela.setValorCampo( 'depto',           dsMensalidade.FieldByName('depto').AsString           );
//      objParcela.setValorCampo( 'cd_coligada',     dsMensalidade.FieldByName('cd_coligada').AsString     );
//      objParcela.setValorCampo( 'cd_centro_custo', dsMensalidade.FieldByName('cd_centro_custo').AsString );
//      objParcela.setValorCampo( 'cd_plano_conta',  dsMensalidade.FieldByName('cd_plano_conta').AsString  );
//      objParcela.setValorCampo( 'cd_caixa',        dsMensalidade.FieldByName('cd_caixa').AsString        );
//      objParcela.setValorCampo( 'cd_resp',         dsMensalidade.FieldByName('cd_resp').AsString         );
//      objParcela.setValorCampo( 'usuario',         dsMensalidade.FieldByName('usuario').AsString         );
//      objParcela.setValorCampo( 'nossonumero',     dsMensalidade.FieldByName('nossonumero').AsString     );
//      objParcela.setValorCampo( 'valorextra',      dsMensalidade.FieldByName('valorextra').AsString      );
//      objParcela.setValorCampo( 'descontoextra',   dsMensalidade.FieldByName('descontoextra').AsString   );
      objParcela.setValorCampo( 'turma',           dsMensalidade.FieldByName('turma').AsString           );
      objParcela.setValorCampo( 'codigoaluno',     dsMensalidade.FieldByName('codigoaluno').AsString     );

      ListaParcelas.Add( objParcela );

      dsMensalidade.next;
   end;

end;

constructor TMBPessoa.Create;
begin
   //define os campos da tabela
   defineCampos();
end;

procedure TMBPessoa.defineCampos;
begin
   Campos := TStringList.Create();
   Campos.Values['cd_pessoa']       := '';
   Campos.Values['nm_pessoa']       := '';
   Campos.Values['ds_turma']        := '';
   Campos.Values['nr_anosemestre']  := '';
end;

destructor TMBPessoa.Destroy;
begin
   inherited;

   Campos.Free;

   if Self.ListaParcelas <> nil then
   begin
      Self.ListaParcelas.Clear;
   end;
end;

function TMBPessoa.getListaParcelas(atualizar_pagamento: boolean = false): TObjectList;
var
   qryCarregarPagamento: TUMZQuery;
   objParcela : TMBParcela;
   iParcela: integer;
begin
   if not atualizar_pagamento then
   begin
      Result := ListaParcelas;
   end
   else   // precisou recarregar as datas de pagamento, pois elas não eram carregadas na inicialização
   begin
      DM.CriarConsulta( qryCarregarPagamento );
      for iParcela := 0 to ListaParcelas.Count - 1 do
      begin
         objParcela := (ListaParcelas.items[iParcela] as TMBParcela);
         qryCarregarPagamento.SQL.text := 'SELECT datapagamento,usuario FROM mensalidades WHERE cd_mensalidade = '+objParcela.getValorCampo('cd_mensalidade');
         qryCarregarPagamento.open();

         if qryCarregarPagamento.FieldByName('datapagamento').AsString <> '' then begin
            objParcela.setValorCampo('datapagamento',qryCarregarPagamento.FieldByName('datapagamento').AsString);
         end;
         if qryCarregarPagamento.FieldByName('usuario').AsString <> '' then begin
            objParcela.setValorCampo('usuario',qryCarregarPagamento.FieldByName('usuario').AsString);
         end;
         ListaParcelas.items[iParcela] := objParcela;
      end;
      Result :=ListaParcelas;
   end;
end;

function TMBPessoa.getValorCampo(ds_campo: string): string;
begin
   Result := Campos.Values[ds_campo];
end;

function TMBPessoa.getValorPago(vl_nominal, vl_desconto, vl_juros: double): double;
begin
   Result := vl_nominal - vl_desconto + vl_juros;
end;

procedure TMBPessoa.setValorCampo(ds_campo, ds_valor: string);
begin
   Campos.Values[ds_campo] := ds_valor;
end;

end.
