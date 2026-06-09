object fMatricularDescontoProg: TfMatricularDescontoProg
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'Desconto programado'
  ClientHeight = 398
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblDepto: TLabel
    Left = 54
    Top = 66
    Width = 45
    Height = 13
    Caption = 'Conv'#234'nio'
    FocusControl = dbeDepto
  end
  object lblPlano: TLabel
    Left = 11
    Top = 93
    Width = 88
    Height = 13
    Caption = 'Plano de desconto'
    FocusControl = dbePlano
  end
  object lblInicio: TLabel
    Left = 59
    Top = 120
    Width = 40
    Height = 13
    Caption = 'Validade'
    FocusControl = dbeInicio
  end
  object lblFim: TLabel
    Left = 193
    Top = 120
    Width = 6
    Height = 13
    Caption = 'a'
    FocusControl = dbeFim
  end
  object lblParcelaIni: TLabel
    Left = 59
    Top = 147
    Width = 40
    Height = 13
    Caption = 'Parcelas'
    FocusControl = dbeParcelaIni
  end
  object lblParcelaFim: TLabel
    Left = 154
    Top = 147
    Width = 6
    Height = 13
    Caption = 'a'
    FocusControl = dbeParcelaFim
  end
  object lblPercentual: TLabel
    Left = 48
    Top = 174
    Width = 51
    Height = 13
    Caption = 'Percentual'
    FocusControl = dbePercentual
  end
  object lblHistorico: TLabel
    Left = 59
    Top = 228
    Width = 41
    Height = 13
    Caption = 'Hist'#243'rico'
    FocusControl = dbeHistorico
  end
  object lblValorDesconto: TLabel
    Left = 22
    Top = 201
    Width = 77
    Height = 13
    Caption = 'Valor desconto*'
    FocusControl = dbeValorDesconto
  end
  object lblNota: TLabel
    Left = 102
    Top = 336
    Width = 376
    Height = 39
    Caption = 
      '* A aplica'#231#227'o do desconto prioriza o valor informado para o perc' +
      'entual de desconto conforme a programa'#231#227'o de desconto. Na aus'#234'nc' +
      'ia deste valor, ser'#225' aplicado o valor de desconto cadastrado no ' +
      'plano de desconto vinculado.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    WordWrap = True
  end
  object lblTipoDesconto: TLabel
    Left = 7
    Top = 255
    Width = 92
    Height = 13
    Caption = 'Forma de aplica'#231#227'o'
    FocusControl = dbeTipoDesconto
  end
  object dbeDepto: TDBEdit
    Left = 102
    Top = 63
    Width = 300
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'NM_DEPTO'
    DataSource = dsDescontoProg
    TabOrder = 1
  end
  object dbePlano: TDBEdit
    Left = 102
    Top = 90
    Width = 300
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'DS_PLANO'
    DataSource = dsDescontoProg
    TabOrder = 2
  end
  object dbeInicio: TDBEdit
    Left = 102
    Top = 117
    Width = 88
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'DT_INICIO'
    DataSource = dsDescontoProg
    TabOrder = 3
  end
  object dbeFim: TDBEdit
    Left = 202
    Top = 117
    Width = 88
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'DT_FIM'
    DataSource = dsDescontoProg
    TabOrder = 4
  end
  object dbeParcelaIni: TDBEdit
    Left = 102
    Top = 144
    Width = 49
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'NR_PARC_INICIO'
    DataSource = dsDescontoProg
    TabOrder = 5
  end
  object dbeParcelaFim: TDBEdit
    Left = 163
    Top = 144
    Width = 49
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'NR_PARC_FIM'
    DataSource = dsDescontoProg
    TabOrder = 6
  end
  object dbePercentual: TDBEdit
    Left = 102
    Top = 171
    Width = 88
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'VL_PERCENTUAL'
    DataSource = dsDescontoProg
    TabOrder = 7
  end
  object dbeHistorico: TDBEdit
    Left = 102
    Top = 225
    Width = 379
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'DS_HISTORICO'
    DataSource = dsDescontoProg
    TabOrder = 9
  end
  object pnlOrientacao: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 0
    object lblOrientacao: TLabel
      Left = 105
      Top = 14
      Width = 325
      Height = 26
      Caption = 
        'O aluno possui um desconto programado.O desconto ser'#225' aplicado a' +
        'utomaticamente nas parcelas do plano de pagamento selecionado.'
      WordWrap = True
    end
    object imgIcone: TImage
      Left = 0
      Top = 0
      Width = 99
      Height = 57
      Align = alLeft
      Center = True
      Picture.Data = {
        07544269746D6170F6060000424DF60600000000000036000000280000001800
        0000180000000100180000000000C0060000120B0000120B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBDBDBEBDBDBEBDBDBDBDBDBDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBCBDBDE7E7E7FFFFFFFFFFFF8C8C8C5C5B5C5A595A5959
        5A5858595656575656575554565252545252545151534F4F514F4F514C4D4F4C
        4D4F4B4C4E49494C49494C47484B46474A444548BDBDBDFFFFFFFFFFFF8E8D8E
        5D5C5D5C5B5C5A5A5B59595A5858595757585655575554565353555252545151
        535050524E4F514D4E504C4C4F4B4B4E4A4A4D48494C47484A464749BDBDBDFF
        FFFFFFFFFF8E8E8E605F607B7A7B9C9B9C9E9D9D5C5C5D9292928F8E8F757575
        7D7D7EAAA9A9A0A0A05353559F9E9FA09FA06D6D6E7C7C7D9594958F8E8F4949
        4C48494BBDBDBDFFFFFFFFFFFF8F8F8F626162A1A1A1CFCECECFCECE6B6A6BC8
        C7C7A9A8A88E8D8EABABACE8E8E8F1F1F05C5C5DE9E8E8E4E3E2949494B1B1B2
        AFAEAECECDCD494A4C4A4B4DBDBDBDFFFFFFFFFFFF9190906362627170719392
        928F8E8E5F5E5F8988898F8E8F7170716E6D6F8D8D8E8686875C5C5DDDDDDCA2
        A1A19898986B6B6D8686887A7A7B4D4E504C4D4FBDBDBEFFFFFFFFFFFF919191
        6665658E8D8DC3C3C2BFBEBE656465C7C6C69E9D9D919091939293B1B0B0B6B5
        B55E5E5FF5F4F4E7E6E69C9B9C959595C4C3C3B4B3B34E4E504E4F51BDBDBEFF
        FFFFFFFFFF939292686767A3A2A2E1E1E0EAE9E96E6D6DF2F2F2CDCCCCAEADAE
        ACACACD8D8D7E8E8E7616061F9F9F9F7F7F69D9D9EB2B2B3D3D3D2D8D7D75050
        52515153BEBEBEFFFFFFFFFFFF9393936968686A6969757374706F6F6462636E
        6D6D706F706463636463646E6D6E6867685C5B5C68676869696A5A5A5B5D5D5E
        6766675E5E60545455535354BEBEBEFFFFFFFFFFFF9493936C6B6BA09F9FD0CF
        CFCDCCCC6E6C6DE9E9E9AFAFAFA7A6A6A8A8A8BDBDBDD3D2D2626162DBDADAB9
        B9B9939393ADACADB9B8B8CECDCC545355555456BEBEBEFFFFFFFFFFFF959595
        6E6D6C9B9A9ADCDCDBD6D5D5706F6FDEDEDEC6C5C4A4A3A3A2A1A1CECDCDD7D7
        D7656465D5D4D4C4C3C3919091A7A6A7D3D2D2CDCDCD575658575658BEBEBEFF
        FFFFFFFFFF9695956F6E6D7674748988888583836967678281818483836F6E6E
        7170708382827C7B7B6160607C7C7C7D7C7D6565666C6B6C7C7C7C7171725959
        5A59585ABEBEBEFFFFFFFFFFFF979696727170A9A8A8D5D5D5E7E6E6767575EF
        EEEE9F9F9FB0AFAEB2B1B1B9B8B8D5D5D46A6969DBDBDAA7A7A79C9B9BB5B5B5
        B4B3B3D3D2D259595A5B5A5CBEBEBEFFFFFFFFFFFF989797737171939191BAB9
        B8BAB9B9737171C1C0C0B3B2B2979695959494B6B5B5BDBCBC686767B2B1B1B5
        B4B4878686969696A9A8A8ACACAC5D5C5D5D5C5DBEBEBEFFFFFFFFFFFF999897
        7674737472717A79787A78787876767876767775757573737573737472727270
        707170706F6E6E6F6E6E6E6D6E6C6B6C6C6B6C6665666160615F5E5FBEBEBFFF
        FFFFFFFFFF9A9998787675A19F9EF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9E4E4E46463
        63616061BFBFBFFFFFFFFFFFFF9B9A9A797776ABAAA9F3F3F2F3F3F2F3F3F2F3
        F3F2F3F3F2F3F3F2F3F3F2F3F3F2F3F3F2F3F3F2F3F3F2F3F3F2F3F3F2F3F3F2
        F3F3F2EDECEC666465636263BFBFBFFFFFFFFFFFFF9C9B9A7C7A78A9A8A7EBEB
        EAEBEBEAEBEBEAEBEBEAEBEBEAEBEBEAEBEBEAEBEBEAEBEBEAEBEBEAEBEBEAEB
        EBEAEBEBEAEBEBEAEBEBEAE6E5E5696768656464BFBFBFFFFFFFFFFFFF9D9C9B
        7E7C7AA7A5A4E4E3E2E4E3E2E4E3E3E4E3E2E4E3E2E4E3E3E4E3E2E4E3E2E4E3
        E3E4E3E2E4E3E3E4E3E2E4E3E2E4E3E3E4E3E2DEDDDC6A6969676666BFBFBFFF
        FFFFFFFFFF9E9C9C807D7C858382A6A4A3A6A4A3A5A3A2A5A3A2A4A2A1A3A2A1
        A3A1A0A2A0A0A1A09FA19F9FA09F9EA09E9E9F9E9D9E9D9C9E9C9C8E8D8D6B6A
        6A696868BFBFBFFFFFFFFFFFFF9E9E9C817E7D807D7C7F7C7B7E7B7A7D7A797B
        79787A7877797776787675777574767473757272737171727070716F6F706E6E
        6F6D6D6E6C6C6C6B6B6B6A6ABFBFBFFFFFFFFFFFFFBBBBBB9F9E9D9E9D9C9E9D
        9C9E9C9C9D9C9B9C9C9A9C9B9A9C9A9A9B9A999A9A999A99989A989799979798
        9797979796979696979595969595959595959494D9D9D9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
    end
  end
  object bbtnConfirmar: TBitBtn
    Left = 403
    Top = 291
    Width = 75
    Height = 25
    TabOrder = 13
    Kind = bkOK
  end
  object rbDescontoCondicional: TRadioButton
    Left = 102
    Top = 279
    Width = 184
    Height = 17
    Caption = 'Aplicar como desconto condicional'
    Checked = True
    TabOrder = 11
    TabStop = True
  end
  object rbDescontoFixo: TRadioButton
    Left = 102
    Top = 299
    Width = 151
    Height = 17
    Caption = 'Aplicar como desconto fixo'
    TabOrder = 12
  end
  object dbeValorDesconto: TDBEdit
    Left = 102
    Top = 198
    Width = 88
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'VL_DESCONTO'
    DataSource = dsDescontoProg
    TabOrder = 8
  end
  object dbeTipoDesconto: TDBEdit
    Left = 102
    Top = 252
    Width = 160
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelWidth = 3
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'DS_TIPO_DESCONTO'
    DataSource = dsDescontoProg
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object qryDescontoProg: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   P.CD_DESCONTO_PESSOA,'
      '   P.CD_DESCONTO,'
      '   P.CD_DEPTO,'
      '   P.DT_INICIO,'
      '   P.DT_FIM,'
      
        '   COALESCE(P.VL_PERCENTUAL, D.PERCENTUALDESCONTO) VL_PERCENTUAL' +
        ','
      '   P.NR_PARC_INICIO,'
      '   P.NR_PARC_FIM,'
      '   P.DS_HISTORICO,'
      '   D.DESCRICAOPLANO DS_PLANO,'
      '   D.CD_TIPO_DESCONTO,'
      '   D.CD_ACAO_MOVIMENTO,'
      '   T.DESCRICAO NM_DEPTO,'
      '   D.VALORDESCONTO VL_DESCONTO,'
      '   D.SN_CONDICIONAL,'
      '   CASE D.CD_TIPO_DESCONTO'
      '      WHEN 0 THEN '#39'Soma'#39
      '      WHEN 1 THEN '#39'Proporcional'#39
      '      WHEN 2 THEN '#39'Sobrepor'#39
      '   END DS_TIPO_DESCONTO'
      'FROM'
      '   PESSOAS_DESCONTOS P'
      ''
      '      JOIN PLANOSDESCONTO D ON'
      '         (P.CD_DESCONTO = D.CODIGO)'
      '         '
      '      JOIN DEPARTAMENTOS T ON'
      '         (P.CD_DEPTO = T.CODIGO)'
      'WHERE'
      '   P.CD_PESSOA = :CD_PESSOA AND'
      '   P.CD_DEPTO = :CD_DEPTO AND'
      '   COALESCE(P.CD_CURSO, :CD_CURSO) LIKE :CD_CURSO AND'
      '   P.TP_DESCONTO = 1 AND'
      '   CURDATE() BETWEEN P.DT_INICIO AND P.DT_FIM'
      'ORDER BY'
      '   P.CD_DESCONTO_PESSOA DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qryDescontoProgCD_DESCONTO_PESSOA: TLargeintField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryDescontoProgCD_DESCONTO: TLargeintField
      FieldName = 'CD_DESCONTO'
    end
    object qryDescontoProgCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
      Required = True
    end
    object qryDescontoProgDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qryDescontoProgDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
    object qryDescontoProgVL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
    end
    object qryDescontoProgNR_PARC_INICIO: TSmallintField
      FieldName = 'NR_PARC_INICIO'
    end
    object qryDescontoProgNR_PARC_FIM: TIntegerField
      FieldName = 'NR_PARC_FIM'
    end
    object qryDescontoProgDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Size = 150
    end
    object qryDescontoProgDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 255
    end
    object qryDescontoProgCD_TIPO_DESCONTO: TSmallintField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object qryDescontoProgCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object qryDescontoProgNM_DEPTO: TStringField
      FieldName = 'NM_DEPTO'
      Size = 50
    end
    object qryDescontoProgVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryDescontoProgDS_TIPO_DESCONTO: TStringField
      FieldName = 'DS_TIPO_DESCONTO'
      ReadOnly = True
      Size = 12
    end
    object qryDescontoProgSN_CONDICIONAL: TSmallintField
      FieldName = 'SN_CONDICIONAL'
    end
  end
  object dsDescontoProg: TDataSource
    DataSet = qryDescontoProg
    Left = 384
    Top = 104
  end
  object qryTiposTituloDesc: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_DESCONTO_PESSOA,'
      '   CD_TIPO_TITULO,'
      '   CD_COLIGADA'
      'FROM'
      '   FIN_TP_TITULOS_PESSOAS_DESC'
      'WHERE'
      '   CD_DESCONTO_PESSOA = :CD_DESCONTO_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    DataSource = dsDescontoProg
    Left = 424
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    object qryTiposTituloDescCD_DESCONTO_PESSOA: TIntegerField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryTiposTituloDescCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTiposTituloDescCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
end
