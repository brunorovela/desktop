object frmFinCreditosCPVisualizar: TfrmFinCreditosCPVisualizar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cr'#233'ditos'
  ClientHeight = 529
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 21
    Width = 478
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 304
    ExplicitTop = 248
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 504
    Width = 478
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitLeft = 128
    ExplicitTop = 432
    ExplicitWidth = 50
  end
  object bvlSep3: TBevel
    AlignWithMargins = True
    Left = 3
    Top = 219
    Width = 472
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 208
    ExplicitTop = 328
    ExplicitWidth = 50
  end
  object bvlSep4: TBevel
    Left = 0
    Top = 271
    Width = 478
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 304
    ExplicitTop = 384
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    Caption = 'CR'#201'DITOS COM O FORNECEDOR'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlCreditos: TPanel
    Left = 0
    Top = 24
    Width = 478
    Height = 192
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object dbgCreditos: TSortedDBGrid
      Left = 0
      Top = 0
      Width = 478
      Height = 192
      Align = alClient
      DataSource = dsCreditos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      SortedFields.Strings = (
        'DT_REGISTRO')
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_TITULO'
          Title.Caption = 'T'#237'tulo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REGISTRO'
          Title.Caption = 'Registro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_CREDITO'
          Title.Caption = 'Cr'#233'dito'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_USADO'
          Title.Caption = 'Usado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DEVOLUCAO'
          Title.Caption = 'Devolvido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DISPONIVEL'
          Title.Caption = 'Dispon'#237'vel'
          Visible = True
        end>
    end
  end
  object tlbAcoes: TToolBar
    Left = 0
    Top = 507
    Width = 478
    Height = 22
    Align = alBottom
    ButtonWidth = 85
    Caption = 'tlbAcoes'
    Images = ilAcoes
    List = True
    ShowCaptions = True
    TabOrder = 4
    object btnDevolver: TToolButton
      Left = 0
      Top = 0
      AutoSize = True
      Caption = 'F9 Devolver'
      Enabled = False
      ImageIndex = 0
      OnClick = btnDevolverClick
    end
    object btnExcluir: TToolButton
      Left = 89
      Top = 0
      AutoSize = True
      Caption = 'F4 Excluir'
      ImageIndex = 1
      OnClick = btnExcluirClick
    end
    object btnSep2: TToolButton
      Left = 166
      Top = 0
      Width = 8
      Caption = 'btnSep2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 174
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 2
      OnClick = btnFecharClick
    end
  end
  object pnlResumo: TPanel
    Left = 0
    Top = 225
    Width = 478
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblTotais: TLabel
      Left = 3
      Top = 22
      Width = 64
      Height = 13
      Caption = 'Totalizadores'
    end
    object lblTotalCredito: TLabel
      Left = 70
      Top = 3
      Width = 35
      Height = 13
      Caption = 'Cr'#233'dito'
    end
    object lblTotalUsado: TLabel
      Left = 172
      Top = 3
      Width = 30
      Height = 13
      Caption = 'Usado'
    end
    object lblTotalDisponivel: TLabel
      Left = 376
      Top = 3
      Width = 48
      Height = 13
      Caption = 'Dispon'#237'vel'
    end
    object lblTotalDevolucao: TLabel
      Left = 274
      Top = 3
      Width = 47
      Height = 13
      Caption = 'Devolvido'
    end
    object dbeTotalCredito: TDBEdit
      Left = 70
      Top = 19
      Width = 96
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'SUM_CREDITO'
      DataSource = dsCreditos
      ReadOnly = True
      TabOrder = 0
    end
    object dbeTotalUsado: TDBEdit
      Left = 172
      Top = 19
      Width = 96
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'SUM_USADO'
      DataSource = dsCreditos
      ReadOnly = True
      TabOrder = 1
    end
    object dbeTotalDisponivel: TDBEdit
      Left = 376
      Top = 19
      Width = 96
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'SUM_DISPONIVEL'
      DataSource = dsCreditos
      ReadOnly = True
      TabOrder = 3
    end
    object dbeTotalDevolucao: TDBEdit
      Left = 274
      Top = 19
      Width = 96
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'SUM_DEVOLVIDO'
      DataSource = dsCreditos
      ReadOnly = True
      TabOrder = 2
    end
  end
  object pnlDevolucao: TPanel
    Left = 0
    Top = 274
    Width = 478
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object lblDevolucaoConta: TLabel
      Left = 59
      Top = 35
      Width = 29
      Height = 13
      Caption = 'Conta'
    end
    object lblDevolucaoPlano: TLabel
      Left = 12
      Top = 59
      Width = 76
      Height = 13
      Caption = 'Plano de contas'
    end
    object sbDevolucaoPlano: TSpeedButton
      Left = 414
      Top = 56
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbDevolucaoPlanoClick
    end
    object lblDevolucaoCentro: TLabel
      Left = 6
      Top = 83
      Width = 82
      Height = 13
      Caption = 'Centro de custos'
    end
    object sbDevolucaoCentro: TSpeedButton
      Left = 414
      Top = 80
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbDevolucaoCentroClick
    end
    object lblDevolucaoValor: TLabel
      Left = 64
      Top = 107
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lblDevolucaoHistorico: TLabel
      Left = 47
      Top = 126
      Width = 41
      Height = 13
      Caption = 'Hist'#243'rico'
    end
    object bvlSep5: TBevel
      AlignWithMargins = True
      Left = 3
      Top = 26
      Width = 472
      Height = 3
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 640
      ExplicitTop = 136
      ExplicitWidth = 50
    end
    object pnlDevolucaoTitulo: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 472
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Devolver cr'#233'ditos para...'
      TabOrder = 0
    end
    object dblcConta: TDBLookupComboBox
      Left = 91
      Top = 32
      Width = 320
      Height = 21
      KeyField = 'CD_CAIXA'
      ListField = 'DS_CAIXA'
      ListSource = dsContas
      TabOrder = 1
    end
    object edtDevolucaoPlanoCodigo: TEdit
      Left = 91
      Top = 56
      Width = 64
      Height = 21
      TabOrder = 2
      OnChange = edtDevolucaoPlanoCodigoChange
      OnExit = edtDevolucaoPlanoCodigoExit
      OnKeyPress = edtDevolucaoPlanoCodigoKeyPress
    end
    object edtDevolucaoPlanoNome: TEdit
      Left = 155
      Top = 56
      Width = 256
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edtDevolucaoCentroCodigo: TEdit
      Left = 91
      Top = 80
      Width = 64
      Height = 21
      TabOrder = 4
      OnChange = edtDevolucaoCentroCodigoChange
      OnExit = edtDevolucaoCentroCodigoExit
      OnKeyPress = edtDevolucaoCentroCodigoKeyPress
    end
    object edtDevolucaoCentroNome: TEdit
      Left = 155
      Top = 80
      Width = 256
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object edtDevolucaoValor: TUMEditMonetario
      Left = 91
      Top = 104
      Width = 64
      Height = 21
      TabOrder = 6
      Text = '0,00'
      OnChange = edtDevolucaoValorChange
      OnExit = edtDevolucaoValorExit
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object mmDevolucaoHistorico: TMemo
      Left = 91
      Top = 128
      Width = 320
      Height = 96
      MaxLength = 255
      ScrollBars = ssBoth
      TabOrder = 7
      OnChange = mmDevolucaoHistoricoChange
    end
  end
  object qryCreditos: TZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  C.CD_CREDITO,'
      '  C.CD_TITULO,'
      '  C.VL_CREDITO,'
      '  C.DS_MOTIVO,'
      '  C.DT_REGISTRO,'
      '  C.DT_ALTERACAO,'
      '  C.CD_USUARIO,'
      '  COALESCE('
      '    ('
      '      SELECT'
      '        SUM(COALESCE(M.VL_SAIDA, 0))'
      '      FROM'
      '        FIN_MOV_CP M'
      '      WHERE'
      '        M.CD_TITULO_CREDITO = C.CD_TITULO'
      '    ),'
      '  0) VL_USADO,'
      '  COALESCE('
      '    ('
      '      SELECT'
      '        SUM(COALESCE(D.VL_DEVOLVIDO, 0))'
      '      FROM'
      '        FIN_CREDITO_CP_DEVOLUCAO D'
      '      WHERE'
      '        C.CD_CREDITO = D.CD_CREDITO'
      '    ),'
      '  0) VL_DEVOLUCAO'
      'FROM'
      '  FIN_CREDITO_CP C'
      '    JOIN FIN_CONTAS_PAGAR M ON'
      '      (C.CD_TITULO = M.CD_TITULO)'
      'WHERE'
      '  M.CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryCreditosCD_CREDITO: TLargeintField
      FieldName = 'CD_CREDITO'
      Required = True
    end
    object qryCreditosCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
      Required = True
    end
    object qryCreditosVL_CREDITO: TFloatField
      FieldName = 'VL_CREDITO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryCreditosDS_MOTIVO: TStringField
      FieldName = 'DS_MOTIVO'
      Required = True
      Size = 255
    end
    object qryCreditosDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Required = True
    end
    object qryCreditosDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object qryCreditosCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object qryCreditosVL_USADO: TFloatField
      FieldName = 'VL_USADO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qryCreditosVL_DEVOLUCAO: TFloatField
      FieldName = 'VL_DEVOLUCAO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dspCreditos: TDataSetProvider
    DataSet = qryCreditos
    Left = 208
    Top = 160
  end
  object cdsCreditos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspCreditos'
    StoreDefs = True
    OnCalcFields = cdsCreditosCalcFields
    Left = 240
    Top = 160
    object cdsCreditosCD_CREDITO: TLargeintField
      FieldName = 'CD_CREDITO'
      Required = True
    end
    object cdsCreditosCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
      Required = True
    end
    object cdsCreditosVL_CREDITO: TFloatField
      FieldName = 'VL_CREDITO'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object cdsCreditosDS_MOTIVO: TStringField
      FieldName = 'DS_MOTIVO'
      Required = True
      Size = 255
    end
    object cdsCreditosDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Required = True
    end
    object cdsCreditosDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object cdsCreditosCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object cdsCreditosVL_USADO: TFloatField
      FieldName = 'VL_USADO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object cdsCreditosVL_DEVOLUCAO: TFloatField
      FieldName = 'VL_DEVOLUCAO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object cdsCreditosVL_DISPONIVEL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VL_DISPONIVEL'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsCreditosSUM_CREDITO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SUM_CREDITO'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_CREDITO)'
    end
    object cdsCreditosSUM_USADO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SUM_USADO'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_USADO)'
    end
    object cdsCreditosSUM_DISPONIVEL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SUM_DISPONIVEL'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_CREDITO) - SUM(VL_USADO) - SUM(VL_DEVOLUCAO)'
    end
    object cdsCreditosSUM_DEVOLVIDO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'SUM_DEVOLVIDO'
      Active = True
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(VL_DEVOLUCAO)'
    end
  end
  object dsCreditos: TDataSource
    DataSet = cdsCreditos
    OnDataChange = dsCreditosDataChange
    Left = 272
    Top = 160
  end
  object ilAcoes: TImageList
    Left = 144
    Top = 160
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000BF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF000000BF00
      0000BF000000BF000000BF000000000000000000000000000000000000000000
      0000BF0000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF0000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF000000BF00
      0000BF000000BF00000000000000000000000000000000000000000000000000
      000000000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF000000BF00
      0000BF0000000000000000000000000000000000000000000000000000000000
      000000000000BF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF000000BF00
      000000000000BF00000000000000000000000000000000000000000000000000
      000000000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF0000000000
      00000000000000000000BF000000BF0000000000000000000000000000000000
      0000BF0000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF000000BF000000BF000000BF00
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFF9E3FF0000
      FFFFFFF983FF0000FFFFE3F3000F0000FFFFE3F3003F0000FFE7E1C7002F0000
      C1F3F08F000F0000C3FBF81F000F0000C7FBFC3F00010000CBFBF81F00010000
      DCF3F09F00010000FF07E1C7000F0000FFFF83E3000F0000FFFF8FF1002F0000
      FFFFFFFF803F0000FFFFFFFFE3FF000000000000000000000000000000000000
      000000000000}
  end
  object qryContas: TZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_CAIXA'
    SQL.Strings = (
      'SELECT'
      '  CC.CD_CAIXA,'
      '  CC.CD_COLIGADA,'
      '  CC.DS_CAIXA'
      'FROM'
      '  FIN_CADASTRO_CONTAS CC'
      '    JOIN FIN_CONTAS_USUARIOS CU ON'
      '      (CC.CD_CAIXA = CU.CD_CAIXA) AND'
      '      (CC.CD_COLIGADA = CU.CD_COLIGADA)'
      '    JOIN COLIGADAS C ON'
      '      (CC.CD_COLIGADA = C.CD_COLIGADA)'
      'WHERE'
      '  CC.SN_ATIVA = '#39'S'#39' AND'
      '  CU.CD_USUARIO = :CD_USUARIO AND'
      '  C.CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ AND'
      '  ('
      '    CC.CD_COLIGADA IN (1) OR'
      '    CC.SN_TODAS_COLIGADAS = 1'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_CAIXA Asc'
    Left = 304
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    object qryContasCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
      Required = True
    end
    object qryContasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryContasDS_CAIXA: TStringField
      FieldName = 'DS_CAIXA'
      Size = 255
    end
  end
  object dsContas: TDataSource
    DataSet = qryContas
    OnDataChange = dsContasDataChange
    Left = 336
    Top = 160
  end
end
