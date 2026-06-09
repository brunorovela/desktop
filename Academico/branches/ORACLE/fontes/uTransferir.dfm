object frmTransferir: TfrmTransferir
  Left = 184
  Top = 159
  ActiveControl = EditDataVencimento
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Prorrogar Vencimento'
  ClientHeight = 185
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 258
    Height = 185
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBText1: TDBText
      Left = 8
      Top = 8
      Width = 57
      Height = 14
      DataField = 'CodigoAluno'
      DataSource = frmMensalidades.dtcMensalidades
    end
    object DBText2: TDBText
      Left = 8
      Top = 24
      Width = 241
      Height = 14
      DataField = 'Nome'
    end
    object Label1: TLabel
      Left = 56
      Top = 48
      Width = 48
      Height = 16
      Caption = 'Parcela:'
    end
    object DBText3: TDBText
      Left = 112
      Top = 48
      Width = 119
      Height = 17
      Alignment = taRightJustify
      DataField = 'Parcela'
      DataSource = frmMensalidades.dtcMensalidades
    end
    object Label2: TLabel
      Left = 31
      Top = 64
      Width = 72
      Height = 16
      Caption = 'Vencimento:'
    end
    object DBText4: TDBText
      Left = 104
      Top = 64
      Width = 127
      Height = 16
      Alignment = taRightJustify
      DataField = 'DataVencimento'
      DataSource = frmMensalidades.dtcMensalidades
    end
    object Label3: TLabel
      Left = 70
      Top = 80
      Width = 33
      Height = 16
      Caption = 'Valor:'
    end
    object DBText5: TDBText
      Left = 104
      Top = 80
      Width = 127
      Height = 16
      Alignment = taRightJustify
      DataField = 'ValorTotalCalc'
      DataSource = frmMensalidades.dtcMensalidades
    end
    object Label4: TLabel
      Left = 19
      Top = 120
      Width = 103
      Height = 16
      Caption = 'Data Vencimento:'
    end
    object Bevel1: TBevel
      Left = 10
      Top = 104
      Width = 233
      Height = 4
      Style = bsRaised
    end
    object EditDataVencimento: TDBEdit
      Left = 126
      Top = 116
      Width = 107
      Height = 24
      DataField = 'DataVencimento'
      DataSource = DM.dtcMensalidades
      TabOrder = 0
      OnKeyPress = EditDataVencimentoKeyPress
    end
    object btnOk: TBitBtn
      Left = 86
      Top = 153
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
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
      Left = 166
      Top = 153
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
      TabOrder = 2
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
