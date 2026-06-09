object frmImpNegociacoes: TfrmImpNegociacoes
  Left = 355
  Top = 301
  Caption = 'Relat'#243'rio de Negocia'#231#245'es'
  ClientHeight = 125
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 125
    Align = alClient
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 3
      Width = 353
      Height = 78
      TabOrder = 0
      object Label2: TLabel
        Left = 152
        Top = 18
        Width = 83
        Height = 13
        Caption = 'Pagas a partir de:'
      end
      object Label1: TLabel
        Left = 98
        Top = 49
        Width = 137
        Height = 13
        Caption = 'Parc. do Per'#237'odo menor que:'
      end
      object Label3: TLabel
        Left = 301
        Top = 49
        Width = 4
        Height = 19
        Caption = '/'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object datDe: TDateTimePicker
        Left = 240
        Top = 13
        Width = 103
        Height = 22
        Date = 35796.913871759260000000
        Time = 35796.913871759260000000
        TabOrder = 0
      end
      object chkNegociadas: TCheckBox
        Left = 8
        Top = 48
        Width = 79
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Negociadas'
        TabOrder = 1
      end
      object txtAno: TEdit
        Left = 240
        Top = 45
        Width = 57
        Height = 21
        TabOrder = 2
        Text = '1997'
      end
      object txtSemestre: TEdit
        Left = 309
        Top = 45
        Width = 33
        Height = 21
        TabOrder = 3
        Text = '1'
      end
      object chkPagas: TCheckBox
        Left = 32
        Top = 16
        Width = 55
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Pagas'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object btnImprimir: TButton
      Left = 176
      Top = 93
      Width = 89
      Height = 25
      Caption = 'F7 Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnImprimirClick
      OnKeyDown = btnImprimirKeyDown
    end
    object btnFechar: TButton
      Left = 272
      Top = 93
      Width = 89
      Height = 25
      Caption = 'F12 Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnFecharClick
    end
  end
end
