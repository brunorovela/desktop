object frm_Compromisso_Baixar: Tfrm_Compromisso_Baixar
  Left = 216
  Top = 190
  Caption = 'Baixar Compromisso'
  ClientHeight = 447
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BAIXAR COMPROMISSO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object pnConta: TPanel
    Left = 0
    Top = 191
    Width = 399
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label14: TLabel
      Left = 17
      Top = -2
      Width = 178
      Height = 13
      Caption = 'Efetuar Pagamento atrav'#233's da Conta:'
    end
    object Label16: TLabel
      Left = 16
      Top = 44
      Width = 104
      Height = 13
      Caption = 'Forma de Pagamento:'
    end
    object Label17: TLabel
      Left = 286
      Top = 45
      Width = 95
      Height = 13
      Caption = 'N'#250'mero do Cheque:'
    end
    object cbFormaPgto: TComboBox
      Left = 16
      Top = 59
      Width = 264
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbFormaPgtoChange
      OnKeyPress = cbFormaPgtoKeyPress
    end
    object edNrCheque: TEdit
      Left = 286
      Top = 60
      Width = 96
      Height = 21
      TabOrder = 2
      OnKeyPress = edNrChequeKeyPress
    end
    object cbContas: TComboBox
      Left = 17
      Top = 17
      Width = 366
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cbContasKeyPress
    end
  end
  object pnCompromisso: TPanel
    Left = 0
    Top = 25
    Width = 399
    Height = 122
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 263
      Top = 6
      Width = 56
      Height = 13
      Caption = 'Cod. T'#237'tulo:'
    end
    object Label4: TLabel
      Left = 52
      Top = 54
      Width = 44
      Height = 13
      Caption = 'Hist'#243'rico:'
    end
    object Label5: TLabel
      Left = 38
      Top = 35
      Width = 58
      Height = 13
      Caption = 'Documento:'
    end
    object Label9: TLabel
      Left = 37
      Top = 73
      Width = 59
      Height = 13
      Caption = 'Vencimento:'
    end
    object DBText2: TDBText
      Left = 17
      Top = 2
      Width = 337
      Height = 17
      DataField = 'nm_pessoa'
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 286
      Top = 37
      Width = 97
      Height = 17
      Alignment = taRightJustify
      DataField = 'cd_titulo'
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 103
      Top = 35
      Width = 106
      Height = 17
      DataField = 'nr_documento'
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 102
      Top = 54
      Width = 281
      Height = 17
      DataField = 'ds_despesa'
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText6: TDBText
      Left = 102
      Top = 73
      Width = 137
      Height = 17
      DataField = 'dt_vencimento'
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 17
      Top = 92
      Width = 79
      Height = 13
      Caption = 'Valor Pendende:'
    end
    object DBText10: TDBText
      Left = 102
      Top = 92
      Width = 161
      Height = 17
      DataField = 'valPendente'
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel5: TBevel
      Left = 17
      Top = 25
      Width = 366
      Height = 4
      Style = bsRaised
    end
    object Bevel6: TBevel
      Left = 17
      Top = 112
      Width = 366
      Height = 4
      Style = bsRaised
    end
  end
  object pnBaixa: TPanel
    Left = 0
    Top = 280
    Width = 399
    Height = 125
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label7: TLabel
      Left = 139
      Top = 6
      Width = 94
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Valor Total a Pagar:'
      ParentBiDiMode = False
    end
    object Label8: TLabel
      Left = 162
      Top = 32
      Width = 71
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Valor de Multa:'
      ParentBiDiMode = False
    end
    object Label12: TLabel
      Left = 163
      Top = 58
      Width = 70
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Valor de Juros:'
      ParentBiDiMode = False
    end
    object Label13: TLabel
      Left = 83
      Top = 84
      Width = 146
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Valor L'#237'quido do Compromisso:'
      ParentBiDiMode = False
    end
    object Bevel2: TBevel
      Left = 17
      Top = 114
      Width = 366
      Height = 4
      Style = bsRaised
    end
    object txtValorTotalPago: TUMEditMonetario
      Left = 248
      Top = 3
      Width = 133
      Height = 21
      TabOrder = 0
      Text = '0,00'
      OnExit = txtValorTotalPagoExit
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtValorMulta: TUMEditMonetario
      Left = 248
      Top = 29
      Width = 133
      Height = 21
      TabOrder = 1
      Text = '0,00'
      OnExit = txtValorMultaExit
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtValorJuros: TUMEditMonetario
      Left = 248
      Top = 55
      Width = 133
      Height = 21
      TabOrder = 2
      Text = '0,00'
      OnExit = txtValorJurosExit
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
    object txtValorLiquidado: TUMEditMonetario
      Left = 248
      Top = 81
      Width = 133
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0,00'
      Mascara = '###,###,##0.00'
      CasasDecimais = 2
      EnterProximoCampo = True
    end
  end
  object btnConfirmar: TBitBtn
    Left = 187
    Top = 411
    Width = 107
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 5
    OnClick = btnConfirmarClick
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 300
    Top = 411
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btnCancelarClick
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
  object pnAcaoMovimento: TPanel
    Left = 0
    Top = 147
    Width = 399
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label15: TLabel
      Left = 27
      Top = 5
      Width = 98
      Height = 13
      Caption = 'A'#231#227'o do Movimento:'
    end
    object Bevel1: TBevel
      Left = 17
      Top = 32
      Width = 366
      Height = 4
      Style = bsRaised
    end
    object cbAcaoMovimento: TComboBox
      Left = 136
      Top = 3
      Width = 247
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cbAcaoMovimentoKeyPress
    end
  end
  object qyCompromisso: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyCompromissoCalcFields
    SQL.Strings = (
      'SELECT'
      '   CP.CD_TIPO_TITULO,'
      '   CP.DT_VENCIMENTO,'
      '   CP.CD_CAIXA,'
      '   CP.NR_CHEQUE,'
      '   CP.CD_TITULO,'
      '   CP.DS_DESPESA,'
      '   CP.NR_DOCUMENTO,'
      '   CP.CD_COLIGADA,'
      '   CP.CD_FORMA_PGTO,'
      '   P.NM_PESSOA,'
      '   ROUND(SUM(M.VL_ENTRADA),2) VL_ENTRADAS,'
      '   ROUND(SUM(M.VL_SAIDA),2) VL_SAIDAS,'
      '   CP.cd_titulo_principal'
      'FROM'
      '   FIN_CONTAS_PAGAR CP'
      '      LEFT JOIN FIN_MOV_CP M ON'
      '         (M.CD_TITULO = CP.CD_TITULO) AND'
      '         (M.CD_COLIGADA = CP.CD_COLIGADA)'
      '      JOIN PESSOAS P ON'
      '         (CP.CD_PESSOA = P.CD_PESSOA)'
      'WHERE'
      '   CP.CD_TITULO = :CD_TITULO AND'
      '   CP.CD_COLIGADA = :CD_COLIGADA'
      'GROUP BY'
      '   CP.CD_TIPO_TITULO,'
      '   CP.DT_VENCIMENTO,'
      '   CP.CD_CAIXA,'
      '   CP.NR_CHEQUE,'
      '   CP.CD_TITULO,'
      '   CP.DS_DESPESA,'
      '   CP.NR_DOCUMENTO,'
      '   CP.CD_COLIGADA,'
      '   CP.CD_FORMA_PGTO,'
      '   P.NM_PESSOA')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   CP.CD_TIPO_TITULO,'#13#10'   CP.DT_VENCIMENTO,'#13#10'   C' +
        'P.CD_CAIXA,'#13#10'   CP.NR_CHEQUE,'#13#10'   CP.CD_TITULO,'#13#10'   CP.DS_DESPES' +
        'A,'#13#10'   CP.NR_DOCUMENTO,'#13#10'   CP.CD_COLIGADA,'#13#10'   CP.CD_FORMA_PGTO' +
        ','#13#10'   P.NM_PESSOA,'#13#10'   ROUND(SUM(M.VL_ENTRADA),2) VL_ENTRADAS,'#13#10 +
        '   ROUND(SUM(M.VL_SAIDA),2) VL_SAIDAS,'#13#10'FROM'#13#10'   FIN_CONTAS_PAGA' +
        'R CP'#13#10'      LEFT JOIN FIN_MOV_CP M ON'#13#10'         (M.CD_TITULO = C' +
        'P.CD_TITULO) AND'#13#10'         (M.CD_COLIGADA = CP.CD_COLIGADA)'#13#10'   ' +
        '   JOIN PESSOAS P ON'#13#10'         (CP.CD_PESSOA = P.CD_PESSOA)'#13#10'WHE' +
        'RE'#13#10'   CP.CD_TITULO = :CD_TITULO AND'#13#10'   CP.CD_COLIGADA = :CD_CO' +
        'LIGADA'#13#10'GROUP BY'#13#10'   CP.CD_TIPO_TITULO,'#13#10'   CP.DT_VENCIMENTO,'#13#10' ' +
        '  CP.CD_CAIXA,'#13#10'   CP.NR_CHEQUE,'#13#10'   CP.CD_TITULO,'#13#10'   CP.DS_DES' +
        'PESA,'#13#10'   CP.NR_DOCUMENTO,'#13#10'   CP.CD_COLIGADA,'#13#10'   CP.CD_FORMA_P' +
        'GTO,'#13#10'   P.NM_PESSOA'
      
        'mysql-5=SELECT'#13#10'   CP.CD_TIPO_TITULO,'#13#10'   CP.DT_VENCIMENTO,'#13#10'   ' +
        'CP.CD_CAIXA,'#13#10'   CP.NR_CHEQUE,'#13#10'   CP.CD_TITULO,'#13#10'   CP.DS_DESPE' +
        'SA,'#13#10'   CP.NR_DOCUMENTO,'#13#10'   CP.CD_COLIGADA,'#13#10'   CP.CD_FORMA_PGT' +
        'O,'#13#10'   P.NM_PESSOA,'#13#10'   ROUND(SUM(M.VL_ENTRADA),2) VL_ENTRADAS,'#13 +
        #10'   ROUND(SUM(M.VL_SAIDA),2) VL_SAIDAS,'#13#10'   CP.cd_titulo_princip' +
        'al'#13#10'FROM'#13#10'   FIN_CONTAS_PAGAR CP'#13#10'      LEFT JOIN FIN_MOV_CP M O' +
        'N'#13#10'         (M.CD_TITULO = CP.CD_TITULO) AND'#13#10'         (M.CD_COL' +
        'IGADA = CP.CD_COLIGADA)'#13#10'      JOIN PESSOAS P ON'#13#10'         (CP.C' +
        'D_PESSOA = P.CD_PESSOA)'#13#10'WHERE'#13#10'   CP.CD_TITULO = :CD_TITULO AND' +
        #13#10'   CP.CD_COLIGADA = :CD_COLIGADA'#13#10'GROUP BY'#13#10'   CP.CD_TITULO')
    Left = 320
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyCompromissodescTipoTitulo: TStringField
      FieldKind = fkLookup
      FieldName = 'descTipoTitulo'
      LookupDataSet = DM.qyTiposTitulo
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'CD_TIPO_TITULO'
      Lookup = True
    end
    object qyCompromissodes_completa_titulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'des_completa_titulo'
      Calculated = True
    end
    object qyCompromissovalPendente: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valPendente'
      Calculated = True
    end
    object qyCompromissoCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qyCompromissoDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object qyCompromissoCD_CAIXA: TLargeintField
      FieldName = 'CD_CAIXA'
    end
    object qyCompromissoNR_CHEQUE: TLargeintField
      FieldName = 'NR_CHEQUE'
    end
    object qyCompromissoCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
    end
    object qyCompromissoDS_DESPESA: TStringField
      FieldName = 'DS_DESPESA'
      Size = 255
    end
    object qyCompromissoNR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
      Size = 50
    end
    object qyCompromissoCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
    object qyCompromissoCD_FORMA_PGTO: TIntegerField
      FieldName = 'CD_FORMA_PGTO'
    end
    object qyCompromissoNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qyCompromissoVL_ENTRADAS: TFloatField
      FieldName = 'VL_ENTRADAS'
      ReadOnly = True
    end
    object qyCompromissoVL_SAIDAS: TFloatField
      FieldName = 'VL_SAIDAS'
      ReadOnly = True
    end
    object qyCompromissocd_titulo_principal: TLargeintField
      FieldName = 'cd_titulo_principal'
    end
  end
  object scrCompromisso: TDataSource
    DataSet = qyCompromisso
    Left = 352
    Top = 72
  end
  object qyAcao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_tipos_movimento '
      'where cd_tipo_movimento = 1'
      'ORDER by ds_movimento')
    Params = <>
    Left = 320
    Top = 105
  end
  object srcAcao: TDataSource
    DataSet = qyAcao
    Left = 352
    Top = 105
  end
  object UMZQuery1: TUMZQuery
    Params = <>
    Left = 48
    Top = 8
  end
end
