object frmImpAlunosAfrica: TfrmImpAlunosAfrica
  Left = 260
  Top = 192
  Caption = 'Imprimir...'
  ClientHeight = 180
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 245
    Height = 180
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 116
      Width = 65
      Height = 14
      Caption = 'Turma/Curso:'
    end
    object grpReimp: TRadioGroup
      Left = 8
      Top = 8
      Width = 225
      Height = 97
      Caption = ' Reimprimir: '
      Items.Strings = (
        'Contrato'
        'Requerimento')
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 144
      Top = 150
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
    object btnImprimir: TButton
      Left = 48
      Top = 150
      Width = 89
      Height = 25
      Caption = 'F7 Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnImprimirClick
    end
    object cmb: TComboBox
      Left = 88
      Top = 112
      Width = 145
      Height = 22
      ItemHeight = 14
      TabOrder = 3
    end
    object lstAnoSemestre: TListBox
      Left = 104
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 4
      Visible = False
    end
    object dat: TDateTimePicker
      Left = 104
      Top = 69
      Width = 89
      Height = 22
      Date = 35955.727549074070000000
      Time = 35955.727549074070000000
      TabOrder = 5
    end
    object lstCursos: TListBox
      Left = 160
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 6
      Visible = False
    end
    object lstRequerimento: TListBox
      Left = 160
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 7
      Visible = False
    end
    object lstTurma: TListBox
      Left = 176
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 8
      Visible = False
    end
  end
end
