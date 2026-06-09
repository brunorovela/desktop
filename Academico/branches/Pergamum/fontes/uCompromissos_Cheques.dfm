object frm_compromisso_cheques: Tfrm_compromisso_cheques
  Left = 0
  Top = 0
  ActiveControl = cbContas
  BorderStyle = bsDialog
  Caption = 'Programar pagamento com cheque'
  ClientHeight = 271
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 495
    Height = 11
    Align = alTop
    Shape = bsSpacer
  end
  object Label1: TLabel
    Left = 10
    Top = 47
    Width = 62
    Height = 13
    Caption = 'C'#243'd. T'#237'tulo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 47
    Width = 58
    Height = 13
    Caption = 'Descri'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 72
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 159
    Height = 13
    Caption = 'Pagar compromisso com a Conta:'
  end
  object Label4: TLabel
    Left = 344
    Top = 88
    Width = 96
    Height = 13
    Caption = 'N'#250'mero do Cheque:'
  end
  object lbHistorico: TLabel
    Left = 8
    Top = 176
    Width = 152
    Height = 13
    Caption = 'Hist'#243'rico da baixa na tesouraria'
    Enabled = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PAGAMENTO COM CHEQUE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object edCodTitulo: TEdit
    Left = 80
    Top = 44
    Width = 73
    Height = 21
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object edDescricao: TEdit
    Left = 232
    Top = 44
    Width = 249
    Height = 21
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object cbContas: TComboBox
    Left = 8
    Top = 104
    Width = 329
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = cbContasChange
    OnKeyPress = cbContasKeyPress
  end
  object edCheque: TEdit
    Left = 344
    Top = 104
    Width = 137
    Height = 21
    TabOrder = 1
    OnKeyPress = edChequeKeyPress
  end
  object ckBaixarCompromisso: TCheckBox
    Left = 8
    Top = 144
    Width = 153
    Height = 17
    Caption = 'Baixar o compromisso'
    TabOrder = 2
    OnClick = ckBaixarCompromissoClick
    OnKeyPress = ckBaixarCompromissoKeyPress
  end
  object ckCompensar: TCheckBox
    Left = 168
    Top = 144
    Width = 153
    Height = 17
    Caption = 'Compensar o cheque'
    Enabled = False
    TabOrder = 3
    OnKeyPress = ckCompensarKeyPress
  end
  object btnConfirmar: TBitBtn
    Left = 265
    Top = 232
    Width = 105
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 5
    OnClick = btnConfirmarClick
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
  object btnCancelar: TBitBtn
    Left = 376
    Top = 232
    Width = 105
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
  object edHistorico: TEdit
    Left = 8
    Top = 192
    Width = 473
    Height = 21
    Enabled = False
    TabOrder = 4
    OnKeyPress = edHistoricoKeyPress
  end
end
