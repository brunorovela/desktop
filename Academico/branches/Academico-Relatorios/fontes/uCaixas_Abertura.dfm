object frm_Caixas_Abertura: Tfrm_Caixas_Abertura
  Left = 300
  Top = 304
  ActiveControl = btnConfirmar
  BorderStyle = bsDialog
  Caption = 'Abertura de Caixa'
  ClientHeight = 185
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object lbDataTitulo: TLabel
    Left = 45
    Top = 45
    Width = 145
    Height = 20
    Alignment = taRightJustify
    Caption = 'Data da Abertura:'
  end
  object lbData: TLabel
    Left = 200
    Top = 45
    Width = 141
    Height = 20
    Caption = '10/10/2000 10:30'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSaldoTitulo: TLabel
    Left = 86
    Top = 77
    Width = 104
    Height = 20
    Alignment = taRightJustify
    Caption = 'Saldo Inicial:'
  end
  object lbSaldo: TLabel
    Left = 200
    Top = 77
    Width = 84
    Height = 20
    Caption = 'R$ 150,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 136
    Top = 13
    Width = 54
    Height = 20
    Alignment = taRightJustify
    Caption = 'Conta:'
  end
  object lbConta: TLabel
    Left = 200
    Top = 13
    Width = 197
    Height = 20
    Caption = 'Caixa '#250'nico Uninformare'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtMsg: TLabel
    Left = 10
    Top = 111
    Width = 437
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Confira o Saldo de Fechamento.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtMsg2: TLabel
    Left = 9
    Top = 127
    Width = 441
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Ap'#243's a confirma'#231#227'o n'#227'o ser'#225' poss'#237'vel efetuar lan'#231'amentos no mesm' +
      'o caixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 155
    Width = 453
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object btnConfirmar: TBitBtn
      Left = 196
      Top = 0
      Width = 119
      Height = 27
      Caption = 'Confirmar'
      Default = True
      ModalResult = 1
      TabOrder = 0
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
      Left = 324
      Top = 0
      Width = 109
      Height = 27
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
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

