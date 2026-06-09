object frmResumo: TfrmResumo
  Left = 434
  Top = 313
  BorderStyle = bsDialog
  Caption = 'Resumo do Caixa'
  ClientHeight = 232
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 232
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 2
      Width = 251
      Height = 192
      TabOrder = 2
      object Label3: TLabel
        Left = 54
        Top = 126
        Width = 54
        Height = 14
        Caption = 'Data inicial:'
      end
      object Label4: TLabel
        Left = 54
        Top = 154
        Width = 48
        Height = 14
        Caption = 'Data final:'
      end
      object Label1: TLabel
        Left = 8
        Top = 15
        Width = 114
        Height = 14
        Caption = 'Imprimir movimentos de:'
      end
      object Label2: TLabel
        Left = 8
        Top = 71
        Width = 116
        Height = 14
        Caption = 'Selecionar pela data de:'
      end
      object datDe: TDateTimePicker
        Left = 119
        Top = 126
        Width = 122
        Height = 22
        Date = 35955.000000000000000000
        Format = 'dd/MM/yyyy'
        Time = 35955.000000000000000000
        TabOrder = 0
      end
      object datAte: TDateTimePicker
        Left = 119
        Top = 154
        Width = 122
        Height = 22
        Date = 35955.999988425930000000
        Format = 'dd/MM/yyyy'
        Time = 35955.999988425930000000
        TabOrder = 1
      end
      object cbUsuarios: TComboBox
        Left = 8
        Top = 32
        Width = 233
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 2
        Text = 'Todos os Usu'#225'rios'
        Items.Strings = (
          'Todos os Usu'#225'rios'
          'Admin'
          '')
      end
      object cbData: TComboBox
        Left = 8
        Top = 88
        Width = 233
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 3
        Text = 'Abertura do Caixa'
        Items.Strings = (
          'Abertura do Caixa'
          'Movimenta'#231#227'o'
          'Compensa'#231#227'o')
      end
    end
    object btnImprimir: TButton
      Left = 37
      Top = 200
      Width = 89
      Height = 25
      Caption = 'F7 Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnFechar: TButton
      Left = 134
      Top = 200
      Width = 89
      Height = 25
      Caption = 'F12 Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
end
