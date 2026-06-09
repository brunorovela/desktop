object frmDinCh: TfrmDinCh
  Left = 206
  Top = 25
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Receber...'
  ClientHeight = 234
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 234
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 116
      Width = 51
      Height = 16
      Caption = 'Dinheiro:'
    end
    object Label2: TLabel
      Left = 16
      Top = 75
      Width = 48
      Height = 16
      Caption = 'Cheque:'
    end
    object pnlValor: TPanel
      Left = 11
      Top = 8
      Width = 188
      Height = 41
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object txtDin: TEdit
      Left = 70
      Top = 112
      Width = 129
      Height = 24
      ReadOnly = True
      TabOrder = 1
      OnEnter = txtDinEnter
      OnKeyPress = txtDinKeyPress
    end
    object txtCh: TEdit
      Left = 70
      Top = 72
      Width = 129
      Height = 24
      TabOrder = 0
      OnEnter = txtChEnter
      OnExit = txtChExit
      OnKeyPress = txtChKeyPress
    end
    object btnOk: TBitBtn
      Left = 21
      Top = 196
      Width = 75
      Height = 25
      Caption = 'OK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
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
      Left = 111
      Top = 196
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelClick
      Kind = bkCancel
    end
    object ckbDeposito: TCheckBox
      Left = 16
      Top = 156
      Width = 183
      Height = 17
      Caption = 'Tal'#227'o de Dep'#243'sito'
      TabOrder = 5
      OnClick = ckbDepositoClick
    end
    object pcDocumento: TPageControl
      Left = 224
      Top = 1
      Width = 238
      Height = 232
      ActivePage = tsTalao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 6
      object tsCheque: TTabSheet
        Caption = 'Registro dos Cheques'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object Label4: TLabel
          Left = 7
          Top = 21
          Width = 77
          Height = 16
          Caption = 'N'#186' do Banco:'
        end
        object Label5: TLabel
          Left = 7
          Top = 47
          Width = 86
          Height = 16
          Caption = 'N'#186' da Ag'#234'ncia:'
        end
        object Label6: TLabel
          Left = 7
          Top = 73
          Width = 58
          Height = 16
          Caption = 'N'#186' da CC:'
        end
        object Label7: TLabel
          Left = 7
          Top = 99
          Width = 84
          Height = 16
          Caption = 'N'#186' do Cheque:'
        end
        object Label8: TLabel
          Left = 7
          Top = 125
          Width = 99
          Height = 16
          Caption = 'Valor do Cheque:'
        end
        object Label9: TLabel
          Left = 7
          Top = 151
          Width = 83
          Height = 16
          Caption = 'Compensa'#231#227'o'
        end
        object Label10: TLabel
          Left = 7
          Top = 180
          Width = 40
          Height = 15
          Caption = 'TOTAL:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPosicao: TLabel
          Left = 138
          Top = -2
          Width = 59
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = '1 de 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblTotal: TLabel
          Left = 153
          Top = 180
          Width = 49
          Height = 15
          Alignment = taRightJustify
          Caption = 'R$ 00,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtCheque_Banco: TEdit
          Left = 122
          Top = 18
          Width = 79
          Height = 24
          TabOrder = 0
          OnChange = txtAlteraCheque
          OnKeyPress = txtCheque_BancoKeyPress
        end
        object txtCheque_Agencia: TEdit
          Left = 122
          Top = 44
          Width = 79
          Height = 24
          TabOrder = 1
          OnChange = txtAlteraCheque
          OnKeyPress = txtCheque_BancoKeyPress
        end
        object txtCheque_CC: TEdit
          Left = 122
          Top = 70
          Width = 79
          Height = 24
          TabOrder = 2
          OnChange = txtAlteraCheque
          OnKeyPress = txtCheque_BancoKeyPress
        end
        object txtCheque_nro: TEdit
          Left = 122
          Top = 96
          Width = 79
          Height = 24
          TabOrder = 3
          OnChange = txtAlteraCheque
          OnKeyPress = txtCheque_BancoKeyPress
        end
        object txtCheque_Valor: TEdit
          Left = 122
          Top = 122
          Width = 79
          Height = 24
          TabOrder = 4
          OnChange = txtAlteraCheque
          OnKeyPress = txtCheque_ValorKeyPress
        end
        object txtCheque_Data: TMaskEdit
          Left = 122
          Top = 148
          Width = 80
          Height = 24
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 5
          Text = '  /  /    '
          OnChange = txtAlteraCheque
          OnEnter = txtCheque_DataEnter
          OnKeyPress = txtCheque_DataKeyPress
        end
        object btChequeProx: TButton
          Left = 208
          Top = 20
          Width = 20
          Height = 20
          Hint = 'Ir para pr'#243'ximo Cheque'
          Caption = '>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btChequeProxClick
        end
        object btChequeAnt: TButton
          Left = 207
          Top = 44
          Width = 20
          Height = 20
          Hint = 'Voltar ao cheque anterior'
          Caption = '<'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = btChequeAntClick
        end
        object btChequeAdd: TButton
          Left = 207
          Top = 69
          Width = 20
          Height = 20
          Hint = 'Adicionar um Cheque'
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Fixedsys'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btChequeAddClick
        end
        object btChequeDel: TButton
          Left = 207
          Top = 94
          Width = 20
          Height = 20
          Hint = 'Remover um Cheque'
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Fixedsys'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = btChequeDelClick
        end
      end
      object tsTalao: TTabSheet
        Caption = 'Tal'#227'o de Dep'#243'sito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object Label3: TLabel
          Left = 7
          Top = 21
          Width = 22
          Height = 16
          Caption = 'N'#186' :'
        end
        object edNumeroTalao: TEdit
          Left = 48
          Top = 18
          Width = 153
          Height = 24
          TabOrder = 0
          OnChange = txtAlteraCheque
          OnExit = edNumeroTalaoExit
          OnKeyPress = txtCheque_BancoKeyPress
        end
      end
    end
  end
end
