object frm_Mensa_Outras_Baixas: Tfrm_Mensa_Outras_Baixas
  Left = 216
  Top = 190
  BorderStyle = bsDialog
  Caption = 'Desconto'
  ClientHeight = 338
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 90
    Width = 518
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'APLICAR DESCONTOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btnConfirmar: TBitBtn
    Left = 310
    Top = 302
    Width = 107
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
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
  object BitBtn2: TBitBtn
    Left = 423
    Top = 302
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = BitBtn2Click
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
  object pnCompromisso: TPanel
    Left = 0
    Top = 25
    Width = 518
    Height = 65
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 88
      Top = 10
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno:'
    end
    object Label4: TLabel
      Left = 279
      Top = 26
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Parcela:'
    end
    object Label5: TLabel
      Left = 85
      Top = 26
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma:'
    end
    object Label9: TLabel
      Left = 18
      Top = 42
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de Vencimento:'
    end
    object Label11: TLabel
      Left = 242
      Top = 42
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Pendente:'
    end
    object lbCodigo: TLabel
      Left = 128
      Top = 10
      Width = 377
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo - Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTurma: TLabel
      Left = 128
      Top = 26
      Width = 105
      Height = 13
      AutoSize = False
      Caption = 'Turma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDataVencimento: TLabel
      Left = 128
      Top = 42
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'Data de Vencimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbParcela: TLabel
      Left = 328
      Top = 26
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'Parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValorPendente: TLabel
      Left = 328
      Top = 42
      Width = 153
      Height = 13
      AutoSize = False
      Caption = 'Pendente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 95
    Width = 518
    Height = 201
    ActivePage = tsDesconto
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 3
    object tsDesconto: TTabSheet
      Caption = 'Baixa por Desconto'
      object Label15: TLabel
        Left = 46
        Top = 38
        Width = 72
        Height = 13
        Caption = 'A'#231#227'o de Baixa:'
      end
      object Label6: TLabel
        Left = 204
        Top = 67
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Parcela Final:'
      end
      object Label1: TLabel
        Left = 49
        Top = 67
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Parcela Inicial:'
      end
      object Label2: TLabel
        Left = 43
        Top = 98
        Width = 75
        Height = 13
        Caption = '% do Desconto:'
      end
      object Label7: TLabel
        Left = 267
        Top = 98
        Width = 91
        Height = 13
        Caption = 'Valor do Desconto:'
      end
      object Label8: TLabel
        Left = 33
        Top = 128
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Obs./Justificativa:'
      end
      object sbCadeado: TSpeedButton
        Left = 124
        Top = 6
        Width = 22
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
          333333333F777773FF333333008888800333333377333F3773F3333077870787
          7033333733337F33373F3308888707888803337F33337F33337F330777880887
          7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
          7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
          00333337777777777733333308033308033333337F7F337F7F33333308033308
          033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
          7333333373F77733733333333088888033333333373FFFF73333333333000003
          3333333333777773333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object rbDescontoExtra: TRadioButton
        Left = 33
        Top = 6
        Width = 90
        Height = 22
        Hint = 
          'Efetua a baixa do valor do desconto aplicado, de forma incondici' +
          'onal.  Utilizado para controle de Bolsas Fixas.'
        Caption = 'Desconto Fixo'
        TabOrder = 7
        OnClick = rbDescontoExtraClick
      end
      object rbDescontoEmDia: TRadioButton
        Left = 152
        Top = 8
        Width = 193
        Height = 17
        Hint = 
          'Aplica um desconto condicionado ao pagamento at'#233' a data programa' +
          'da. '
        Caption = 'Desconto Condicional'
        TabOrder = 8
        OnClick = rbDescontoEmDiaClick
      end
      object cbAcaoMovimento: TComboBox
        Left = 128
        Top = 35
        Width = 365
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnKeyPress = cbAcaoMovimentoKeyPress
        OnSelect = cbAcaoMovimentoSelect
      end
      object edParcelaFinal: TEdit
        Left = 277
        Top = 64
        Width = 49
        Height = 21
        TabOrder = 2
        OnKeyPress = edParcelaInicioKeyPress
      end
      object edParcelaInicio: TEdit
        Left = 128
        Top = 64
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = edParcelaInicioKeyPress
      end
      object edDescontoPerc: TEdit
        Left = 128
        Top = 94
        Width = 121
        Height = 21
        TabOrder = 3
        OnEnter = edDescontoPercEnter
        OnExit = edDescontoPercExit
        OnKeyPress = edDescontoPercKeyPress
      end
      object edValorDesconto: TEdit
        Left = 368
        Top = 94
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 4
        OnEnter = edValorDescontoEnter
        OnExit = edValorDescontoExit
        OnKeyPress = edValorDescontoKeyPress
      end
      object edObservacao: TEdit
        Left = 128
        Top = 124
        Width = 361
        Height = 21
        TabOrder = 5
        OnKeyPress = edObservacaoKeyPress
      end
      object ckbDescCondi: TCheckBox
        Left = 128
        Top = 151
        Width = 361
        Height = 19
        Caption = 'Ajustar desconto condicional proporcionalmente.'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object rbDesconto100: TRadioButton
        Left = 321
        Top = 8
        Width = 193
        Height = 17
        Caption = 'Desconto Financeiro 100%'
        TabOrder = 9
        OnClick = rbDesconto100Click
      end
      object edAcaoDesconto100: TEdit
        Left = 128
        Top = 36
        Width = 364
        Height = 21
        Enabled = False
        TabOrder = 10
      end
    end
    object tsCancelamento: TTabSheet
      Caption = 'Baixa Por Cancelamento'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label10: TLabel
        Left = 39
        Top = 84
        Width = 81
        Height = 13
        Caption = 'Valor a Cancelar:'
      end
      object Label12: TLabel
        Left = 49
        Top = 51
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Parcela Inicial:'
      end
      object Label13: TLabel
        Left = 204
        Top = 51
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Parcela Final:'
      end
      object Label14: TLabel
        Left = 20
        Top = 21
        Width = 98
        Height = 13
        Caption = 'A'#231#227'o do Movimento:'
      end
      object Label16: TLabel
        Left = 58
        Top = 112
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      object edValorCancelar: TEdit
        Left = 128
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 3
        OnKeyPress = edValorDescontoKeyPress
      end
      object edParcelaInicioCancelar: TEdit
        Left = 128
        Top = 48
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = edParcelaInicioKeyPress
      end
      object edParcelaFimCancelar: TEdit
        Left = 277
        Top = 48
        Width = 49
        Height = 21
        TabOrder = 2
        OnKeyPress = edParcelaInicioKeyPress
      end
      object cbAcaoMovimentoCancelar: TComboBox
        Left = 128
        Top = 19
        Width = 365
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnKeyPress = cbAcaoMovimentoKeyPress
      end
      object edObservacaoCancelar: TEdit
        Left = 128
        Top = 108
        Width = 361
        Height = 21
        TabOrder = 4
        OnKeyPress = edObservacaoKeyPress
      end
    end
  end
  object qyDesconto: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 480
    Top = 8
  end
  object qyAcao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_tipos_movimento '
      'where cd_tipo_movimento = 1'
      'ORDER by ds_movimento')
    Params = <>
    Left = 480
    Top = 49
  end
  object srcAcao: TDataSource
    DataSet = qyAcao
    Left = 448
    Top = 49
  end
  object qyAplica: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 440
    Top = 8
  end
  object qyPlanoDesconto: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'sn_condicional, percentualdesconto, valordesconto '
      'FROM '
      #9'PlanosDesconto'
      'WHERE'
      #9'cd_acao_movimento = :cd_acao_movimento')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_acao_movimento'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_acao_movimento'
        ParamType = ptUnknown
      end>
    object qyPlanoDescontovalordesconto: TFloatField
      FieldName = 'valordesconto'
    end
    object qyPlanoDescontopercentualdesconto: TFloatField
      FieldName = 'percentualdesconto'
    end
    object qyPlanoDescontosn_condicional: TSmallintField
      FieldName = 'sn_condicional'
    end
  end
end
