object FrmParametrosGerais: TFrmParametrosGerais
  Left = 228
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Par'#226'metros Gerais do Sistema'
  ClientHeight = 380
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 64
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object Label2: TLabel
    Left = 67
    Top = 94
    Width = 63
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object Label3: TLabel
    Left = 84
    Top = 125
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label4: TLabel
    Left = 103
    Top = 155
    Width = 27
    Height = 13
    Caption = 'Bairro'
  end
  object Label5: TLabel
    Left = 97
    Top = 186
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label6: TLabel
    Left = 46
    Top = 216
    Width = 84
    Height = 13
    Caption = 'Estado Abreviado'
    FocusControl = DBEdit2
  end
  object Label7: TLabel
    Left = 50
    Top = 246
    Width = 80
    Height = 13
    Caption = 'Estado Completo'
    FocusControl = DBEdit3
  end
  object Label8: TLabel
    Left = 101
    Top = 277
    Width = 29
    Height = 13
    Caption = 'E-Mail'
    FocusControl = DBEdit4
  end
  object Label9: TLabel
    Left = 88
    Top = 307
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = DBEdit5
  end
  object DBEdit1: TDBEdit
    Left = 144
    Top = 60
    Width = 320
    Height = 21
    DataField = 'NomeFantasia'
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 144
    Top = 213
    Width = 320
    Height = 21
    DataField = 'Estado'
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 144
    Top = 243
    Width = 320
    Height = 21
    DataField = 'EstadoCompleto'
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 144
    Top = 274
    Width = 320
    Height = 21
    DataField = 'Email'
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 144
    Top = 304
    Width = 320
    Height = 21
    DataField = 'Telefone'
    TabOrder = 8
  end
  object DBEdit6: TDBEdit
    Left = 144
    Top = 91
    Width = 320
    Height = 21
    DataField = 'RazaSocial'
    TabOrder = 1
  end
  object DBEdit7: TDBEdit
    Left = 144
    Top = 121
    Width = 320
    Height = 21
    DataField = 'Endereco'
    TabOrder = 2
  end
  object DBEdit8: TDBEdit
    Left = 144
    Top = 152
    Width = 320
    Height = 21
    DataField = 'Bairro'
    TabOrder = 3
  end
  object DBEdit9: TDBEdit
    Left = 144
    Top = 182
    Width = 320
    Height = 21
    DataField = 'Cidade'
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 376
    Top = 344
    Width = 86
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 10
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 280
    Top = 344
    Width = 91
    Height = 25
    Caption = '&Confirmar'
    ModalResult = 8
    TabOrder = 9
    OnClick = BitBtn2Click
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
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 497
    Height = 33
    Caption = 'PARAMETROS GERAIS DO SISTEMA'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
end

