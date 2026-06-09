object frm_ContasPagar_BaixarCompromisso: Tfrm_ContasPagar_BaixarCompromisso
  Left = 458
  Top = 189
  BorderStyle = bsDialog
  Caption = 'Baixar Compromisso a Pagar'
  ClientHeight = 416
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 742
    Height = 10
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 406
    Width = 742
    Height = 10
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 10
    Width = 10
    Height = 396
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel4: TBevel
    Left = 732
    Top = 10
    Width = 10
    Height = 396
    Align = alRight
    Shape = bsSpacer
  end
  object Label19: TLabel
    Left = 16
    Top = 72
    Width = 101
    Height = 14
    Caption = 'Saldo atual do Caixa:'
  end
  object Label20: TLabel
    Left = 20
    Top = 92
    Width = 40
    Height = 16
    Caption = '          '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel12: TBevel
    Left = 16
    Top = 88
    Width = 105
    Height = 22
  end
  object Label21: TLabel
    Left = 24
    Top = 80
    Width = 101
    Height = 14
    Caption = 'Saldo atual do Caixa:'
  end
  object Label22: TLabel
    Left = 28
    Top = 100
    Width = 40
    Height = 16
    Caption = '          '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel13: TBevel
    Left = 24
    Top = 96
    Width = 105
    Height = 22
  end
  object Label9: TLabel
    Left = 16
    Top = 8
    Width = 81
    Height = 14
    Caption = 'Plano de Contas:'
  end
  object DBText4: TDBText
    Left = 22
    Top = 26
    Width = 99
    Height = 17
    DataField = 'ds_conta'
    DataSource = srcPlanoContas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel17: TBevel
    Left = 16
    Top = 23
    Width = 113
    Height = 22
  end
  object pgCompromisso: TPageControl
    Left = 10
    Top = 10
    Width = 722
    Height = 396
    ActivePage = tsCaixa
    Align = alClient
    MultiLine = True
    TabOrder = 0
    OnChanging = pgCompromissoChanging
    object tsInfGerais: TTabSheet
      Caption = 'Informa'#231#245'es Gerais'
      object Bevel5: TBevel
        Left = 0
        Top = 339
        Width = 714
        Height = 28
        Align = alBottom
        Shape = bsTopLine
      end
      object sbAvancar: TSpeedButton
        Left = 624
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F6 Avan'#231'ar'
        Flat = True
        Glyph.Data = {
          DA010000424DDA010000000000003600000028000000090000000F0000000100
          180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
          4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
          4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
          4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
          E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
          DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
          E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
          0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
          00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
          FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
          2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
          E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
          DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
          E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
        OnClick = sbAvancarClick
      end
      object sbCancelar: TSpeedButton
        Left = 539
        Top = 345
        Width = 85
        Height = 22
        Caption = 'Cancelar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
          FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbCancelarClick
      end
      object Label1: TLabel
        Left = 8
        Top = 56
        Width = 110
        Height = 14
        Caption = 'Tipo de Movimenta'#231#227'o:'
      end
      object Label2: TLabel
        Left = 312
        Top = 56
        Width = 112
        Height = 14
        Caption = 'Data da Movimenta'#231#227'o:'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 8
        Top = 152
        Width = 72
        Height = 14
        Caption = 'Valor a Baixar:'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 8
        Top = 200
        Width = 28
        Height = 14
        Caption = 'Multa:'
        FocusControl = deMulta
      end
      object Label6: TLabel
        Left = 109
        Top = 200
        Width = 30
        Height = 14
        Caption = 'Juros:'
        FocusControl = deJuros
      end
      object Label7: TLabel
        Left = 209
        Top = 200
        Width = 49
        Height = 14
        Caption = 'Desconto:'
        FocusControl = deDesconto
      end
      object Label10: TLabel
        Left = 312
        Top = 200
        Width = 66
        Height = 14
        Caption = 'Valor L'#237'quido:'
        FocusControl = DBEdit8
      end
      object Label13: TLabel
        Left = 8
        Top = 248
        Width = 63
        Height = 14
        Caption = 'Observa'#231#227'o:'
      end
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 77
        Height = 14
        Caption = 'Valor Pendente:'
      end
      object Bevel7: TBevel
        Left = 8
        Top = 24
        Width = 121
        Height = 22
      end
      object Label18: TLabel
        Left = 8
        Top = 104
        Width = 139
        Height = 14
        Caption = 'Descri'#231#227'o da movimenta'#231#227'o:'
      end
      object lbValorPendente: TLabel
        Left = 13
        Top = 27
        Width = 40
        Height = 16
        Caption = '          '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit2: TDBEdit
        Left = 312
        Top = 72
        Width = 129
        Height = 22
        DataField = 'dt_movimento'
        DataSource = srcMovimentacao
        Enabled = False
        TabOrder = 7
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 168
        Width = 144
        Height = 22
        DataField = 'vl_saida'
        DataSource = srcMovimentacao
        TabOrder = 2
      end
      object deMulta: TDBEdit
        Left = 8
        Top = 216
        Width = 95
        Height = 22
        DataField = 'vl_multa'
        DataSource = srcMovimentacao
        TabOrder = 3
        OnExit = deMultaExit
      end
      object deJuros: TDBEdit
        Left = 109
        Top = 216
        Width = 95
        Height = 22
        DataField = 'vl_juros'
        DataSource = srcMovimentacao
        TabOrder = 4
        OnExit = deJurosExit
      end
      object deDesconto: TDBEdit
        Left = 209
        Top = 216
        Width = 95
        Height = 22
        DataField = 'vl_desconto'
        DataSource = srcMovimentacao
        TabOrder = 5
        OnExit = deDescontoExit
      end
      object DBEdit8: TDBEdit
        Left = 312
        Top = 216
        Width = 144
        Height = 22
        DataField = 'vl_liquido'
        DataSource = srcMovimentacao
        Enabled = False
        TabOrder = 8
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 8
        Top = 72
        Width = 297
        Height = 22
        DataField = 'cd_movimento'
        DataSource = srcMovimentacao
        KeyField = 'cd_movimento'
        ListField = 'ds_movimento'
        ListSource = DM.srcTiposMovto2
        TabOrder = 0
      end
      object moObservacao: TMemo
        Left = 8
        Top = 264
        Width = 297
        Height = 65
        TabOrder = 6
      end
      object deDescricao: TDBEdit
        Left = 8
        Top = 120
        Width = 297
        Height = 22
        DataField = 'ds_movimento'
        DataSource = srcMovimentacao_TE
        TabOrder = 1
      end
    end
    object tsCaixa: TTabSheet
      Caption = 'Caixa'
      ImageIndex = 2
      object Bevel9: TBevel
        Left = 0
        Top = 339
        Width = 714
        Height = 28
        Align = alBottom
        Shape = bsTopLine
      end
      object sbAvancarCaixa: TSpeedButton
        Left = 624
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F6 Avan'#231'ar'
        Flat = True
        Glyph.Data = {
          DA010000424DDA010000000000003600000028000000090000000F0000000100
          180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
          4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
          4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
          4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
          E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
          DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
          E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
          0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
          00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
          FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
          2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
          E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
          DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
          E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
        OnClick = sbAvancarCaixaClick
      end
      object sbCancelarCaixa: TSpeedButton
        Left = 539
        Top = 345
        Width = 85
        Height = 22
        Caption = 'Cancelar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
          FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbCancelarClick
      end
      object Label14: TLabel
        Left = 16
        Top = 16
        Width = 89
        Height = 14
        Caption = 'Selecione o Caixa:'
      end
      object Bevel10: TBevel
        Left = 152
        Top = 32
        Width = 545
        Height = 22
      end
      object Label15: TLabel
        Left = 152
        Top = 16
        Width = 97
        Height = 14
        Caption = 'Descri'#231#227'o do Caixa:'
      end
      object Label16: TLabel
        Left = 16
        Top = 72
        Width = 101
        Height = 14
        Caption = 'Saldo atual do Caixa:'
      end
      object Bevel11: TBevel
        Left = 16
        Top = 88
        Width = 105
        Height = 22
      end
      object SpeedButton1: TSpeedButton
        Left = 120
        Top = 32
        Width = 23
        Height = 22
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
        OnClick = SpeedButton1Click
      end
      object lbds_Caixa: TLabel
        Left = 157
        Top = 36
        Width = 40
        Height = 16
        Caption = '          '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbSaldoAtual: TLabel
        Left = 20
        Top = 92
        Width = 40
        Height = 16
        Caption = '          '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 16
        Top = 208
        Width = 91
        Height = 14
        Caption = 'Data de Libera'#231#227'o:'
        FocusControl = deLiberacao
      end
      object Label23: TLabel
        Left = 152
        Top = 72
        Width = 58
        Height = 14
        Caption = 'Novo Saldo:'
      end
      object Bevel14: TBevel
        Left = 152
        Top = 88
        Width = 105
        Height = 22
      end
      object lbNovoSaldo: TLabel
        Left = 157
        Top = 92
        Width = 40
        Height = 16
        Caption = '          '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbVoltarCaixa: TSpeedButton
        Left = 454
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F5 Voltar'
        Flat = True
        Glyph.Data = {
          DA010000424DDA010000000000003600000028000000090000000F0000000100
          180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
          E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
          DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
          4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
          00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
          DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
          00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
          0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
          55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
          FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
          2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
          00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
          FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
          0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
        OnClick = sbVoltarCaixaClick
      end
      object edCaixa: TEdit
        Left = 16
        Top = 32
        Width = 105
        Height = 22
        ReadOnly = True
        TabOrder = 0
      end
      object drgPagamentoEm: TDBRadioGroup
        Left = 16
        Top = 120
        Width = 233
        Height = 73
        Caption = ' Pagamento em: '
        DataField = 'tp_cheque_dinheiro'
        DataSource = srcMovimentacao_TE
        Items.Strings = (
          'Cheque'
          'Dinheiro')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2')
        OnClick = drgPagamentoEmClick
      end
      object deLiberacao: TDBEdit
        Left = 16
        Top = 224
        Width = 233
        Height = 22
        DataField = 'dt_liberacao'
        DataSource = srcMovimentacao_TE
        TabOrder = 2
      end
    end
    object tsPlanoContas: TTabSheet
      Caption = 'Plano de Contas'
      ImageIndex = 1
      object Bevel6: TBevel
        Left = 0
        Top = 339
        Width = 714
        Height = 28
        Align = alBottom
        Shape = bsTopLine
      end
      object sbVoltar: TSpeedButton
        Left = 454
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F5 Voltar'
        Flat = True
        Glyph.Data = {
          DA010000424DDA010000000000003600000028000000090000000F0000000100
          180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
          E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
          DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
          4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
          00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
          DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
          00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
          0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
          55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
          FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
          2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
          00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
          FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
          0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
        OnClick = sbVoltarClick
      end
      object sbFinalizar: TSpeedButton
        Left = 624
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F6 Finalizar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          00000000000000000000000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000848400008484000084840000848400008484000084
          84000084840000848400008484000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          00000000000000000000008484000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbFinalizarClick
      end
      object sbCancelarPlano: TSpeedButton
        Left = 539
        Top = 345
        Width = 85
        Height = 22
        Caption = 'Cancelar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
          FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbCancelarPlanoClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 57
        Align = alTop
        TabOrder = 0
        object Label12: TLabel
          Left = 16
          Top = 8
          Width = 98
          Height = 14
          Caption = 'Valor a ser baixado:'
        end
        object Bevel8: TBevel
          Left = 16
          Top = 23
          Width = 113
          Height = 22
        end
        object DBText1: TDBText
          Left = 22
          Top = 26
          Width = 99
          Height = 17
          DataField = 'vl_liquido'
          DataSource = srcMovimentacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 144
          Top = 8
          Width = 139
          Height = 14
          Caption = 'Descri'#231#227'o da movimenta'#231#227'o:'
        end
        object Bevel15: TBevel
          Left = 144
          Top = 24
          Width = 553
          Height = 22
        end
        object DBText3: TDBText
          Left = 150
          Top = 26
          Width = 539
          Height = 17
          DataField = 'ds_movimento'
          DataSource = srcMovimentacao_TE
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 57
        Width = 714
        Height = 56
        Align = alTop
        TabOrder = 1
        object Bevel20: TBevel
          Left = 486
          Top = 23
          Width = 67
          Height = 22
        end
        object Bevel19: TBevel
          Left = 286
          Top = 23
          Width = 200
          Height = 22
        end
        object Bevel18: TBevel
          Left = 206
          Top = 23
          Width = 67
          Height = 22
        end
        object Bevel16: TBevel
          Left = 6
          Top = 23
          Width = 200
          Height = 22
        end
        object Label11: TLabel
          Left = 568
          Top = 8
          Width = 29
          Height = 14
          Caption = 'Valor:'
          FocusControl = deValor
        end
        object DBText2: TDBText
          Left = 8
          Top = 26
          Width = 99
          Height = 17
          DataField = 'ds_conta'
          DataSource = srcPlanoContas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 7
          Top = 8
          Width = 81
          Height = 14
          Caption = 'Plano de Contas:'
        end
        object Label25: TLabel
          Left = 207
          Top = 8
          Width = 68
          Height = 14
          Caption = 'Classifica'#231#227'o:'
        end
        object DBText5: TDBText
          Left = 209
          Top = 26
          Width = 62
          Height = 17
          DataField = 'pc_cd_classificacao'
          DataSource = srcPlanoContas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 287
          Top = 8
          Width = 87
          Height = 14
          Caption = 'Centro de Custos:'
        end
        object DBText6: TDBText
          Left = 288
          Top = 26
          Width = 195
          Height = 17
          DataField = 'ds_centro'
          DataSource = srcPlanoContas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 487
          Top = 8
          Width = 68
          Height = 14
          Caption = 'Classifica'#231#227'o:'
        end
        object DBText7: TDBText
          Left = 488
          Top = 26
          Width = 64
          Height = 17
          DataField = 'pcc_cd_classificacao'
          DataSource = srcPlanoContas
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object deValor: TDBEdit
          Left = 568
          Top = 22
          Width = 88
          Height = 22
          DataField = 'vl_movimento'
          DataSource = srcPlanoContas
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 113
        Width = 714
        Height = 226
        Align = alClient
        DataSource = srcPlanoContas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_conta'
            Title.Caption = 'Plano de Contas'
            Width = 210
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pc_cd_classificacao'
            Title.Caption = 'Classifica'#231#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_centro'
            Title.Caption = 'Centro de Custos'
            Width = 210
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pcc_cd_classificacao'
            Title.Caption = 'Classifica'#231#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_movimento'
            Title.Caption = 'Valor'
            Visible = True
          end>
      end
    end
  end
  object qyPlanoContas: TUMZQuery
    CachedUpdates = True
    AfterInsert = qyPlanoContasAfterInsert
    AfterPost = qyPlanoContasAfterPost
    Connection = db
    
    
    SQL.Strings = (
      'SELECT'
      '   a.*,'
      '   pc.ds_conta,'
      '   pc.cd_classificacao AS pc_cd_classificacao,'
      '   pcc.ds_centro,'
      '   pcc.cd_classificacao AS pcc_cd_classificacao'
      'FROM'
      '   apropriacao_cp a,'
      '   plano_contas pc,'
      '   plano_centro_custos pcc'
      'WHERE'
      '   pc.cd_conta = a.cd_conta AND'
      '   pcc.cd_centro = a.cd_centro AND'
      '   a.cd_titulo = :cd_titulo AND'
      '   a.nr_sequencia = :nr_sequencia')
    UpdateObject = updPlanoContas
    Left = 134
    Top = 369
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
    object qyPlanoContascd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.apropriacao_cp.cd_titulo'
    end
    object qyPlanoContasnr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.apropriacao_cp.nr_sequencia'
    end
    object qyPlanoContascd_conta: TIntegerField
      FieldName = 'cd_conta'
      Origin = 'WMESTRE12.apropriacao_cp.cd_conta'
    end
    object qyPlanoContascd_centro: TIntegerField
      FieldName = 'cd_centro'
      Origin = 'WMESTRE12.apropriacao_cp.cd_centro'
    end
    object qyPlanoContasvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.apropriacao_cp.vl_movimento'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyPlanoContasds_conta: TStringField
      FieldName = 'ds_conta'
      Origin = 'WMESTRE12.plano_contas.ds_conta'
      Size = 255
    end
    object qyPlanoContasds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.plano_centro_custos.ds_centro'
      Size = 255
    end
    object qyPlanoContaspc_cd_classificacao: TStringField
      FieldName = 'pc_cd_classificacao'
      Origin = 'WMESTRE12.plano_contas.cd_classificacao'
    end
    object qyPlanoContaspcc_cd_classificacao: TStringField
      FieldName = 'pcc_cd_classificacao'
      Origin = 'WMESTRE12.plano_centro_custos.cd_classificacao'
    end
  end
  object srcPlanoContas: TDataSource
    DataSet = qyPlanoContas
    Left = 166
    Top = 369
  end
  object qyMovimentacao: TUMZQuery
    Connection = db
    
    
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   movimentacao_cp')
    Left = 22
    Top = 368
    object qyMovimentacaocd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.movimentacao_cp.cd_titulo'
    end
    object qyMovimentacaonr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.movimentacao_cp.nr_sequencia'
    end
    object qyMovimentacaocd_movimento: TIntegerField
      FieldName = 'cd_movimento'
      Origin = 'WMESTRE12.movimentacao_cp.cd_movimento'
    end
    object qyMovimentacaodt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.movimentacao_cp.dt_movimento'
    end
    object qyMovimentacaovl_entrada: TFloatField
      FieldName = 'vl_entrada'
      Origin = 'WMESTRE12.movimentacao_cp.vl_entrada'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_saida: TFloatField
      FieldName = 'vl_saida'
      Origin = 'WMESTRE12.movimentacao_cp.vl_saida'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_multa: TFloatField
      FieldName = 'vl_multa'
      Origin = 'WMESTRE12.movimentacao_cp.vl_multa'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_juros: TFloatField
      FieldName = 'vl_juros'
      Origin = 'WMESTRE12.movimentacao_cp.vl_juros'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      Origin = 'WMESTRE12.movimentacao_cp.vl_desconto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_liquido: TFloatField
      FieldName = 'vl_liquido'
      Origin = 'WMESTRE12.movimentacao_cp.vl_liquido'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaocd_movimento_te: TIntegerField
      FieldName = 'cd_movimento_te'
      Origin = 'WMESTRE12.movimentacao_cp.cd_movimento_te'
    end
    object qyMovimentacaods_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.movimentacao_cp.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
  end
  object srcMovimentacao: TDataSource
    DataSet = qyMovimentacao
    Left = 54
    Top = 368
  end
  object updPlanoContas: TZUpdateSQL
    ModifySQL.Strings = (
      'update apropriacao_cp'
      'set'
      '  cd_titulo = :cd_titulo,'
      '  nr_sequencia = :nr_sequencia,'
      '  cd_conta = :cd_conta,'
      '  cd_centro = :cd_centro,'
      '  vl_movimento = :vl_movimento'
      'where'
      '  cd_titulo = :OLD_cd_titulo and'
      '  nr_sequencia = :OLD_nr_sequencia and'
      '  cd_conta = :OLD_cd_conta and'
      '  cd_centro = :OLD_cd_centro and'
      '  vl_movimento = :OLD_vl_movimento')
    InsertSQL.Strings = (
      'insert into apropriacao_cp'
      '  (cd_titulo, nr_sequencia, cd_conta, cd_centro, vl_movimento)'
      'values'
      
        '  (:cd_titulo, :nr_sequencia, :cd_conta, :cd_centro, :vl_movimen' +
        'to)')
    DeleteSQL.Strings = (
      'delete from apropriacao_cp'
      'where'
      '  cd_titulo = :OLD_cd_titulo and'
      '  nr_sequencia = :OLD_nr_sequencia and'
      '  cd_conta = :OLD_cd_conta and'
      '  cd_centro = :OLD_cd_centro and'
      '  vl_movimento = :OLD_vl_movimento')
    Left = 102
    Top = 369
  end
  object qyMovimentacao_TE: TUMZQuery
    Connection = db
    
    
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   movimentacao_te')
    Left = 22
    Top = 337
    object qyMovimentacao_TEcd_movimento_te: TIntegerField
      FieldName = 'cd_movimento_te'
      Origin = 'WMESTRE12.movimentacao_te.cd_movimento_te'
    end
    object qyMovimentacao_TEcd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.movimentacao_te.cd_caixa'
    end
    object qyMovimentacao_TEdt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.movimentacao_te.dt_movimento'
    end
    object qyMovimentacao_TEnr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.movimentacao_te.nr_sequencia'
    end
    object qyMovimentacao_TEcd_movimento: TIntegerField
      FieldName = 'cd_movimento'
      Origin = 'WMESTRE12.movimentacao_te.cd_movimento'
    end
    object qyMovimentacao_TEds_movimento: TStringField
      FieldName = 'ds_movimento'
      Origin = 'WMESTRE12.movimentacao_te.ds_movimento'
      Size = 255
    end
    object qyMovimentacao_TEds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.movimentacao_te.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyMovimentacao_TEtp_cheque_dinheiro: TStringField
      FieldName = 'tp_cheque_dinheiro'
      Origin = 'WMESTRE12.movimentacao_te.tp_cheque_dinheiro'
      FixedChar = True
      Size = 1
    end
    object qyMovimentacao_TEvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.movimentacao_te.vl_movimento'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacao_TEdt_liberacao: TDateTimeField
      FieldName = 'dt_liberacao'
      Origin = 'WMESTRE12.movimentacao_te.dt_liberacao'
    end
    object qyMovimentacao_TEcd_origem: TIntegerField
      FieldName = 'cd_origem'
      Origin = 'WMESTRE12.movimentacao_te.cd_origem'
    end
    object qyMovimentacao_TEnr_documento: TStringField
      FieldName = 'nr_documento'
      Origin = 'WMESTRE12.movimentacao_te.nr_documento'
      Size = 50
    end
  end
  object srcMovimentacao_TE: TDataSource
    DataSet = qyMovimentacao_TE
    Left = 54
    Top = 337
  end
  object qyPlanoContas_TE: TUMZQuery
    Connection = db
    
    
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   apropriacao_te')
    Left = 134
    Top = 337
    object qyPlanoContas_TEnr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.apropriacao_te.nr_sequencia'
    end
    object qyPlanoContas_TEcd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.apropriacao_te.cd_caixa'
    end
    object qyPlanoContas_TEdt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.apropriacao_te.dt_movimento'
    end
    object qyPlanoContas_TEcd_conta: TIntegerField
      FieldName = 'cd_conta'
      Origin = 'WMESTRE12.apropriacao_te.cd_conta'
    end
    object qyPlanoContas_TEcd_centro: TIntegerField
      FieldName = 'cd_centro'
      Origin = 'WMESTRE12.apropriacao_te.cd_centro'
    end
    object qyPlanoContas_TEvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.apropriacao_te.vl_movimento'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
  end
  object srcPlanoContas_TE: TDataSource
    DataSet = qyPlanoContas_TE
    Left = 166
    Top = 337
  end
end

