object frmMensalidadeBaixaCartao: TfrmMensalidadeBaixaCartao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cart'#227'o Cr'#233'dito / D'#233'bito'
  ClientHeight = 202
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblVlTotal: TLabel
    Left = 120
    Top = 40
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 25
    Align = alTop
    Caption = 'TRANSA'#199#195'O VIA CART'#195'O'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object txtVlTotal: TUMEditMonetario
    Left = 120
    Top = 59
    Width = 169
    Height = 41
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '0,00'
    Mascara = '###,###,##0.00'
    EnterProximoCampo = True
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 136
    Width = 396
    Height = 66
    Align = alBottom
    TabOrder = 2
    object btnIniciarTransacao: TButton
      Left = 80
      Top = 6
      Width = 225
      Height = 49
      Cursor = crHandPoint
      Caption = 'Iniciar Transa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnIniciarTransacaoClick
    end
  end
  object pnInfo: TPanel
    Left = 0
    Top = 106
    Width = 396
    Height = 30
    Align = alBottom
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 336
    Top = 31
    Width = 52
    Height = 17
    Caption = 'Admin'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object terminal_ativo: TTimer
    Enabled = False
    OnTimer = terminal_ativoTimer
    Left = 8
    Top = 32
  end
  object tempo_transacao: TTimer
    Enabled = False
    OnTimer = tempo_transacaoTimer
    Left = 48
    Top = 32
  end
end
