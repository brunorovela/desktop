object frmCobrancaAltera: TfrmCobrancaAltera
  Left = 0
  Top = 0
  Caption = 'Cobran'#231'a'
  ClientHeight = 337
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 25
    Width = 457
    Height = 4
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitLeft = -361
    ExplicitWidth = 779
  end
  object Label1: TLabel
    Left = 159
    Top = 44
    Width = 81
    Height = 13
    Caption = 'Data da Inclus'#227'o'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 303
    Top = 44
    Width = 82
    Height = 13
    Caption = 'Data da Retirada'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 159
    Top = 94
    Width = 81
    Height = 13
    Caption = 'Data da Inclus'#227'o'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 303
    Top = 94
    Width = 82
    Height = 13
    Caption = 'Data da Retirada'
    FocusControl = DBEdit4
  end
  object Label7: TLabel
    Left = 159
    Top = 140
    Width = 81
    Height = 13
    Caption = 'Data da Inclus'#227'o'
  end
  object Label8: TLabel
    Left = 303
    Top = 140
    Width = 82
    Height = 13
    Caption = 'Data da Retirada'
  end
  object Label5: TLabel
    Left = 32
    Top = 240
    Width = 61
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object Label6: TLabel
    Left = 32
    Top = 272
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object Label9: TLabel
    Left = 159
    Top = 185
    Width = 81
    Height = 13
    Caption = 'Data da Inclus'#227'o'
  end
  object Label10: TLabel
    Left = 303
    Top = 185
    Width = 82
    Height = 13
    Caption = 'Data da Retirada'
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'COBRAN'#199'A'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object DBCheckBox1: TDBCheckBox
    Left = 32
    Top = 65
    Width = 97
    Height = 17
    Caption = 'Incluso no SPC'
    DataField = 'sn_spc'
    DataSource = dtcCobranca
    TabOrder = 0
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBEdit1: TDBEdit
    Left = 159
    Top = 63
    Width = 128
    Height = 21
    DataField = 'dt_spc_inclusao'
    DataSource = dtcCobranca
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 303
    Top = 63
    Width = 128
    Height = 21
    DataField = 'dt_spc_retirada'
    DataSource = dtcCobranca
    TabOrder = 2
  end
  object DBCheckBox2: TDBCheckBox
    Left = 32
    Top = 111
    Width = 108
    Height = 17
    Caption = 'Incluso no Jur'#237'dico'
    DataField = 'sn_juridico'
    DataSource = dtcCobranca
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBEdit3: TDBEdit
    Left = 159
    Top = 110
    Width = 128
    Height = 21
    DataField = 'dt_juridico_inclusao'
    DataSource = dtcCobranca
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 303
    Top = 110
    Width = 128
    Height = 21
    DataField = 'dt_juridico_retirada'
    DataSource = dtcCobranca
    TabOrder = 5
  end
  object btConfirmar: TBitBtn
    Left = 245
    Top = 303
    Width = 97
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 6
    OnClick = btConfirmarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btCancelar: TBitBtn
    Left = 348
    Top = 303
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 8
    OnClick = btCancelarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object dbchSerasa: TDBCheckBox
    Left = 32
    Top = 157
    Width = 121
    Height = 17
    Caption = 'Incluso no SERASA'
    DataField = 'SN_SERASA'
    DataSource = dtcCobranca
    TabOrder = 9
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBEdit5: TDBEdit
    Left = 159
    Top = 155
    Width = 128
    Height = 21
    DataField = 'DT_SERASA_INCLUSAO'
    DataSource = dtcCobranca
    TabOrder = 10
  end
  object DBEdit6: TDBEdit
    Left = 303
    Top = 155
    Width = 128
    Height = 21
    DataField = 'DT_SERASA_RETIRADA'
    DataSource = dtcCobranca
    TabOrder = 11
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 159
    Top = 271
    Width = 272
    Height = 21
    DataField = 'dsSituacoes'
    DataSource = dtcCobranca
    TabOrder = 12
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 159
    Top = 240
    Width = 272
    Height = 21
    DataField = 'dsResposaveis'
    DataSource = dtcCobranca
    TabOrder = 13
  end
  object DBEdit7: TDBEdit
    Left = 159
    Top = 200
    Width = 128
    Height = 21
    DataField = 'DT_CARTORIO_INCLUSAO'
    DataSource = dtcCobranca
    TabOrder = 14
  end
  object DBEdit8: TDBEdit
    Left = 303
    Top = 200
    Width = 128
    Height = 21
    DataField = 'DT_CARTORIO_RETIRADA'
    DataSource = dtcCobranca
    TabOrder = 15
  end
  object dbCartorio: TDBCheckBox
    Left = 32
    Top = 202
    Width = 121
    Height = 17
    Caption = 'Incluso no Cart'#243'rio'
    DataField = 'SN_CARTORIO'
    DataSource = dtcCobranca
    TabOrder = 16
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object qyCobranca: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   CD_COBRANCA,'
      '   CD_PESSOA,'
      '   DT_REGISTRO,'
      '   CD_SITUACAO,'
      '   SN_SPC,'
      '   DT_SPC_INCLUSAO,'
      '   DT_SPC_RETIRADA,'
      '   SN_JURIDICO,'
      '   DT_JURIDICO_INCLUSAO,'
      '   DT_JURIDICO_RETIRADA,'
      '   SN_SERASA,'
      '   DT_SERASA_INCLUSAO,'
      '   DT_SERASA_RETIRADA,'
      '   CD_RESPONSAVEL,'
      '   DT_RETORNO,'
      '   SN_CARTORIO,'
      '   DT_CARTORIO_INCLUSAO,'
      '   DT_CARTORIO_RETIRADA'
      'FROM '
      '   FIN_COBRANCA'
      'WHERE'
      '   CD_COBRANCA = :CD_COBRANCA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_cobranca'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 306
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_cobranca'
        ParamType = ptUnknown
      end>
    object qyCobrancadsResposaveis: TStringField
      FieldKind = fkLookup
      FieldName = 'dsResposaveis'
      LookupDataSet = qyResposaveis
      LookupKeyFields = 'codigo'
      LookupResultField = 'nm_usuario'
      KeyFields = 'cd_responsavel'
      Size = 50
      Lookup = True
    end
    object qyCobrancadsSituacoes: TStringField
      FieldKind = fkLookup
      FieldName = 'dsSituacoes'
      LookupDataSet = qySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_valor'
      KeyFields = 'cd_situacao'
      Size = 50
      Lookup = True
    end
    object qyCobrancaCD_COBRANCA: TLargeintField
      FieldName = 'CD_COBRANCA'
    end
    object qyCobrancaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qyCobrancaDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
    end
    object qyCobrancaCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
    end
    object qyCobrancaSN_SPC: TSmallintField
      FieldName = 'SN_SPC'
    end
    object qyCobrancaDT_SPC_INCLUSAO: TDateTimeField
      FieldName = 'DT_SPC_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobrancaDT_SPC_RETIRADA: TDateTimeField
      FieldName = 'DT_SPC_RETIRADA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobrancaSN_JURIDICO: TSmallintField
      FieldName = 'SN_JURIDICO'
    end
    object qyCobrancaDT_JURIDICO_INCLUSAO: TDateTimeField
      FieldName = 'DT_JURIDICO_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobrancaDT_JURIDICO_RETIRADA: TDateTimeField
      FieldName = 'DT_JURIDICO_RETIRADA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobrancaCD_RESPONSAVEL: TLargeintField
      FieldName = 'CD_RESPONSAVEL'
    end
    object qyCobrancaDT_RETORNO: TDateTimeField
      FieldName = 'DT_RETORNO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobrancaSN_SERASA: TSmallintField
      FieldName = 'SN_SERASA'
    end
    object qyCobrancaDT_SERASA_INCLUSAO: TDateTimeField
      FieldName = 'DT_SERASA_INCLUSAO'
    end
    object qyCobrancaDT_SERASA_RETIRADA: TDateTimeField
      FieldName = 'DT_SERASA_RETIRADA'
    end
    object qyCobrancaSN_CARTORIO: TSmallintField
      FieldName = 'SN_CARTORIO'
    end
    object qyCobrancaDT_CARTORIO_INCLUSAO: TDateTimeField
      FieldName = 'DT_CARTORIO_INCLUSAO'
    end
    object qyCobrancaDT_CARTORIO_RETIRADA: TDateTimeField
      FieldName = 'DT_CARTORIO_RETIRADA'
    end
  end
  object dtcCobranca: TDataSource
    AutoEdit = False
    DataSet = qyCobranca
    Left = 104
    Top = 306
  end
  object qyResposaveis: TUMZQuery
    Connection = DM.db
    SortedFields = 'NM_USUARIO'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   US.CD_PESSOA CODIGO,'
      '   US.NM_PESSOA NM_USUARIO'
      'FROM'
      '   PESSOAS US'
      '      JOIN NU_GRUPOS_PESSOAS NP ON'
      '         (US.CD_PESSOA = NP.CD_PESSOA)'
      '      JOIN NU_GRUPOS_PERMISSOES NGP ON'
      '         (NP.CD_GRUPO = NGP.CD_GRUPO)'
      '         JOIN NU_MODULOS_ACOES NMA ON'
      '            (NGP.CD_ACAO = NMA.CD_ACAO)'
      'WHERE '
      
        '   (US.SN_BLOQUEADO != 1 OR COALESCE(NGP.NR_PERMISSAO,0) != 0) A' +
        'ND'
      '   NMA.DS_CHAVE = '#39'2053'#39)
    Params = <>
    IndexFieldNames = 'NM_USUARIO Asc'
    Left = 40
    Top = 306
    object qyResposaveisCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qyResposaveisNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      ReadOnly = True
      Size = 60
    end
  end
  object qySituacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   CD_MODULO,'
      '   CD_SITUACAO,'
      '   DS_VALOR,'
      '   DS_SIGLA,'
      '   CD_AUXILIAR,'
      '   ME_DESCRICAO'
      'FROM'
      '   SITUACOES'
      'WHERE'
      '   CD_MODULO = 2053'
      'ORDER BY'
      '   DS_VALOR')
    Params = <>
    Left = 8
    Top = 306
    object qySituacoesCODIGO: TLargeintField
      FieldName = 'CODIGO'
    end
    object qySituacoesCD_MODULO: TLargeintField
      FieldName = 'CD_MODULO'
    end
    object qySituacoesCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qySituacoesDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
    object qySituacoesDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 50
    end
    object qySituacoesCD_AUXILIAR: TLargeintField
      FieldName = 'CD_AUXILIAR'
    end
    object qySituacoesME_DESCRICAO: TMemoField
      FieldName = 'ME_DESCRICAO'
      BlobType = ftMemo
    end
  end
end
