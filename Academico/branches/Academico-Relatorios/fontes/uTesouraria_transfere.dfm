object frm_Tesouraria_Transfere: Tfrm_Tesouraria_Transfere
  Left = 256
  Top = 189
  BorderStyle = bsDialog
  Caption = 'Transfer'#234'ncia entre contas'
  ClientHeight = 348
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel2: TBevel
    Left = 16
    Top = 209
    Width = 409
    Height = 92
  end
  object Bevel1: TBevel
    Left = 16
    Top = 40
    Width = 409
    Height = 161
  end
  object bv1: TBevel
    Left = 0
    Top = 25
    Width = 439
    Height = 10
    Align = alTop
    Shape = bsSpacer
  end
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 94
    Height = 16
    Caption = 'Transferir de:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 216
    Width = 38
    Height = 16
    Caption = 'Para:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 74
    Width = 38
    Height = 16
    Alignment = taRightJustify
    Caption = 'Conta:'
  end
  object Label4: TLabel
    Left = 51
    Top = 104
    Width = 35
    Height = 16
    Alignment = taRightJustify
    Caption = 'Valor:'
  end
  object Label6: TLabel
    Left = 48
    Top = 242
    Width = 38
    Height = 16
    Alignment = taRightJustify
    Caption = 'Conta:'
  end
  object Label5: TLabel
    Left = 30
    Top = 136
    Width = 56
    Height = 16
    Alignment = taRightJustify
    Caption = 'Hist'#243'rico:'
  end
  object Label7: TLabel
    Left = 30
    Top = 267
    Width = 56
    Height = 16
    Alignment = taRightJustify
    Caption = 'Hist'#243'rico:'
  end
  object SpeedButton1: TSpeedButton
    Left = 400
    Top = 268
    Width = 17
    Height = 22
    Caption = '='
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label8: TLabel
    Left = 54
    Top = 168
    Width = 32
    Height = 16
    Alignment = taRightJustify
    Caption = 'Data:'
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'TRANSFER'#202'NCIA ENTRE CONTAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object edContaDe: TEdit
    Left = 96
    Top = 72
    Width = 305
    Height = 24
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object edValor: TEdit
    Left = 96
    Top = 104
    Width = 305
    Height = 24
    TabOrder = 0
    OnExit = edValorExit
    OnKeyPress = edValorKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 307
    Width = 439
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object btnConfirmar: TBitBtn
      Left = 185
      Top = 4
      Width = 119
      Height = 27
      Caption = 'Confirmar'
      TabOrder = 0
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
      Left = 305
      Top = 4
      Width = 109
      Height = 27
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
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
  end
  object cbContaPara: TComboBox
    Left = 96
    Top = 237
    Width = 305
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    OnChange = cbContaParaChange
  end
  object edHistoricoDe: TEdit
    Left = 96
    Top = 136
    Width = 305
    Height = 24
    TabOrder = 1
  end
  object edHistoricoPara: TEdit
    Left = 96
    Top = 267
    Width = 305
    Height = 24
    TabOrder = 4
  end
  object umdtAjuste: TUMDateTimePicker
    Left = 96
    Top = 166
    Width = 305
    Height = 21
    BevelOuter = bvNone
    TabOrder = 2
    ImgBotaoCalendario.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
      D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
      C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
      A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
      3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
      D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
      97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
      BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
      F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
      E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
      81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
      ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
      D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
      BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
      FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
      ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
      D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
      F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
      DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
      49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
      ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
      83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
      287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
      E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
      9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
    Date = 42256.000000000000000000
    InverterPosicaoCalendario = False
    MostraCalenadarioDesdeCampoTexto = False
  end
end
