object frm_mensa_baixar: Tfrm_mensa_baixar
  Left = 315
  Top = 201
  Hint = 'Desbloquear para lan'#231'ar em outra conta.'
  ActiveControl = EditDataPagto
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Baixa de Mensalidade'
  ClientHeight = 412
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 412
    Align = alClient
    TabOrder = 0
    object Bevel3: TBevel
      Left = 1
      Top = 1
      Width = 311
      Height = 8
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitTop = 0
    end
    object Bevel4: TBevel
      Left = 1
      Top = 362
      Width = 311
      Height = 8
      Align = alBottom
      Shape = bsSpacer
      ExplicitTop = 1
    end
    object Bevel5: TBevel
      Left = 1
      Top = 9
      Width = 8
      Height = 353
      Align = alLeft
      Shape = bsSpacer
      ExplicitTop = 1
      ExplicitHeight = 311
    end
    object Bevel6: TBevel
      Left = 304
      Top = 9
      Width = 8
      Height = 353
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 311
    end
    object Panel2: TPanel
      Left = 9
      Top = 9
      Width = 295
      Height = 353
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object DBText1: TDBText
        Left = 192
        Top = 31
        Width = 79
        Height = 14
        Alignment = taRightJustify
        DataField = 'CodigoAluno'
        DataSource = DM.dtcMensalidades
      end
      object Label1: TLabel
        Left = 88
        Top = 47
        Width = 48
        Height = 16
        Alignment = taRightJustify
        Caption = 'Parcela:'
      end
      object DBText3: TDBText
        Left = 152
        Top = 47
        Width = 119
        Height = 17
        Alignment = taRightJustify
        DataField = 'Parcela'
        DataSource = DM.dtcMensalidades
      end
      object Label2: TLabel
        Left = 64
        Top = 63
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Caption = 'Vencimento:'
      end
      object DBText4: TDBText
        Left = 144
        Top = 63
        Width = 127
        Height = 16
        Alignment = taRightJustify
        DataField = 'DataVencimento'
        DataSource = DM.dtcMensalidades
      end
      object Label3: TLabel
        Left = 103
        Top = 79
        Width = 33
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor:'
      end
      object Label4: TLabel
        Left = 39
        Top = 164
        Width = 101
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data Pagamento:'
      end
      object Label5: TLabel
        Left = 49
        Top = 260
        Width = 91
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor Recebido:'
      end
      object Bevel1: TBevel
        Left = 10
        Top = 96
        Width = 271
        Height = 4
        Style = bsRaised
      end
      object lblAluno: TLabel
        Left = 8
        Top = 5
        Width = 265
        Height = 16
        AutoSize = False
        Caption = 'lblAluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 17
        Top = 111
        Width = 174
        Height = 16
        Caption = 'Baixar mensalidade na Conta:'
      end
      object Label7: TLabel
        Left = 92
        Top = 31
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
      end
      object Bevel2: TBevel
        Left = 10
        Top = 24
        Width = 271
        Height = 4
        Style = bsRaised
      end
      object sbBloqueaConta: TSpeedButton
        Left = 260
        Top = 130
        Width = 23
        Height = 21
        AllowAllUp = True
        GroupIndex = 1
        Down = True
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
        OnClick = sbBloqueaContaClick
      end
      object Label8: TLabel
        Left = 30
        Top = 196
        Width = 110
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor do Desconto:'
      end
      object Label9: TLabel
        Left = 18
        Top = 228
        Width = 122
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor de Multa/Juros:'
      end
      object sbBloquearDesconto: TSpeedButton
        Left = 260
        Top = 193
        Width = 23
        Height = 21
        AllowAllUp = True
        GroupIndex = 2
        Down = True
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
        OnClick = sbBloquearDescontoClick
      end
      object sbBloquearJuros: TSpeedButton
        Left = 260
        Top = 225
        Width = 23
        Height = 21
        AllowAllUp = True
        GroupIndex = 3
        Down = True
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
        OnClick = sbBloquearJurosClick
      end
      object lbValorTotal: TLabel
        Left = 205
        Top = 80
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'lbValorTotal'
      end
      object lbMoedaRecebimento: TLabel
        Left = 17
        Top = 292
        Width = 123
        Height = 16
        Alignment = taRightJustify
        Caption = 'Moeda Recebimento:'
      end
      object lbValorRecebimento: TLabel
        Left = 46
        Top = 327
        Width = 94
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor na Moeda:'
      end
      object sbBloqueiaData: TSpeedButton
        Left = 260
        Top = 159
        Width = 23
        Height = 24
        AllowAllUp = True
        GroupIndex = 4
        Down = True
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
        OnClick = sbBloqueiaDataClick
      end
      object sbBloqueiaValor: TSpeedButton
        Left = 260
        Top = 257
        Width = 23
        Height = 21
        AllowAllUp = True
        GroupIndex = 5
        Down = True
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
        OnClick = sbBloqueiaValorClick
      end
      object EditDataPagto: TDBEdit
        Left = 149
        Top = 160
        Width = 107
        Height = 24
        DataField = 'DataPagamento'
        DataSource = DM.dtcMensalidades
        TabOrder = 1
        OnExit = EditDataPagtoExit
        OnKeyPress = EditDataPagtoKeyPress
      end
      object EditValor: TDBEdit
        Left = 149
        Top = 256
        Width = 107
        Height = 24
        DataField = 'ValorPago'
        DataSource = DM.dtcMensalidades
        TabOrder = 4
        OnExit = EditValorExit
        OnKeyPress = EditValorKeyPress
      end
      object cbContas: TComboBox
        Left = 16
        Top = 130
        Width = 242
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 0
        OnDropDown = cbContasDropDown
        OnKeyPress = cbContasKeyPress
      end
      object EditDesconto: TDBEdit
        Left = 149
        Top = 192
        Width = 107
        Height = 24
        DataField = 'ValorDesconto'
        DataSource = DM.dtcMensalidades
        TabOrder = 2
        OnExit = EditDescontoExit
        OnKeyPress = EditDescontoKeyPress
      end
      object EditJuros: TDBEdit
        Left = 149
        Top = 224
        Width = 107
        Height = 24
        DataField = 'ValorJuros'
        DataSource = DM.dtcMensalidades
        TabOrder = 3
        OnExit = EditJurosExit
        OnKeyPress = EditJurosKeyPress
      end
      object EditValorMoeda: TDBEdit
        Left = 149
        Top = 319
        Width = 107
        Height = 24
        TabStop = False
        DataField = 'vl_pago_moeda'
        DataSource = DM.dtcMensalidades
        TabOrder = 6
        OnExit = EditValorMoedaExit
        OnKeyPress = EditValorMoedaKeyPress
      end
      object CBMoeda: TDBLookupComboBox
        Left = 149
        Top = 288
        Width = 108
        Height = 24
        DataField = 'cd_moeda_pgto'
        DataSource = DM.dtcMensalidades
        KeyField = 'cd_moeda'
        ListField = 'ds_moeda'
        ListSource = dsMoedas
        TabOrder = 5
        TabStop = False
        OnCloseUp = CBMoedaCloseUp
        OnKeyPress = CBMoedaKeyPress
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 370
      Width = 311
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnOk: TBitBtn
        Left = 146
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Ok'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnOkClick
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
      object btnCancel: TBitBtn
        Left = 226
        Top = 6
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
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
    end
  end
  object qyMoedas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_moedas ORDER BY ds_moeda')
    Params = <>
    Left = 8
    Top = 368
    object qyMoedasds_moeda: TStringField
      FieldName = 'ds_moeda'
      Origin = 'WMESTRE12.fin_moedas.ds_moeda'
      Size = 50
    end
    object qyMoedasds_sigla: TStringField
      FieldName = 'ds_sigla'
      Origin = 'WMESTRE12.fin_moedas.ds_sigla'
      Size = 30
    end
    object qyMoedascd_moeda: TLargeintField
      FieldName = 'cd_moeda'
      Required = True
    end
  end
  object dsMoedas: TDataSource
    DataSet = qyMoedas
    Left = 40
    Top = 368
  end
end
