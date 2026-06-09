unit UFMatricularDescontoProg;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ZAbstractRODataset, UZDataset, StdCtrls, Mask, DBCtrls, ExtCtrls,
   Buttons;

type
   TfMatricularDescontoProg = class(TForm)
      qryDescontoProg: TUMZReadOnlyQuery;
      dsDescontoProg: TDataSource;
      lblDepto: TLabel;
      dbeDepto: TDBEdit;
      lblPlano: TLabel;
      dbePlano: TDBEdit;
      lblInicio: TLabel;
      dbeInicio: TDBEdit;
      lblFim: TLabel;
      dbeFim: TDBEdit;
      lblParcelaIni: TLabel;
      dbeParcelaIni: TDBEdit;
      lblParcelaFim: TLabel;
      dbeParcelaFim: TDBEdit;
      lblPercentual: TLabel;
      dbePercentual: TDBEdit;
      lblHistorico: TLabel;
      dbeHistorico: TDBEdit;
      pnlOrientacao: TPanel;
      lblOrientacao: TLabel;
      imgIcone: TImage;
      bbtnConfirmar: TBitBtn;
      rbDescontoCondicional: TRadioButton;
      rbDescontoFixo: TRadioButton;
    qryDescontoProgCD_DESCONTO_PESSOA: TLargeintField;
    qryDescontoProgCD_DESCONTO: TLargeintField;
    qryDescontoProgCD_DEPTO: TIntegerField;
    qryDescontoProgDT_INICIO: TDateTimeField;
    qryDescontoProgDT_FIM: TDateTimeField;
    qryDescontoProgVL_PERCENTUAL: TFloatField;
    qryDescontoProgNR_PARC_INICIO: TSmallintField;
    qryDescontoProgNR_PARC_FIM: TIntegerField;
    qryDescontoProgDS_HISTORICO: TStringField;
    qryDescontoProgDS_PLANO: TStringField;
    qryDescontoProgCD_TIPO_DESCONTO: TSmallintField;
    qryDescontoProgCD_ACAO_MOVIMENTO: TLargeintField;
    qryDescontoProgNM_DEPTO: TStringField;
    qryTiposTituloDesc: TUMZReadOnlyQuery;
    qryTiposTituloDescCD_DESCONTO_PESSOA: TIntegerField;
    qryTiposTituloDescCD_TIPO_TITULO: TSmallintField;
    qryTiposTituloDescCD_COLIGADA: TSmallintField;
    qryDescontoProgVL_DESCONTO: TFloatField;
    lblValorDesconto: TLabel;
    dbeValorDesconto: TDBEdit;
    lblNota: TLabel;
    qryDescontoProgDS_TIPO_DESCONTO: TStringField;
    lblTipoDesconto: TLabel;
    dbeTipoDesconto: TDBEdit;
    qryDescontoProgSN_CONDICIONAL: TSmallintField;
   end;

var
   fMatricularDescontoProg: TfMatricularDescontoProg;

implementation

{$R *.dfm}

end.
