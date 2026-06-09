object frmImpMatriculas: TfrmImpMatriculas
  Left = 224
  Top = 116
  Width = 297
  Height = 308
  Caption = 'Imprimir...'
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
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object btnImprimir: TButton
    Left = 96
    Top = 249
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
    Left = 192
    Top = 249
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 233
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 37
      Top = 121
      Width = 33
      Height = 14
      Caption = 'Turma:'
    end
    object radDiplomasTurma: TRadioButton
      Left = 16
      Top = 96
      Width = 121
      Height = 17
      Caption = 'Dip&lomas da Turma:'
      TabOrder = 0
    end
    object chkVerso: TCheckBox
      Left = 32
      Top = 168
      Width = 121
      Height = 17
      Caption = 'Verso do Diploma'
      TabOrder = 1
      OnClick = chkVersoClick
    end
    object radDesistencia: TRadioButton
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Desist'#234'ncia'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object radTransferencia: TRadioButton
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = 'Transfer'#234'ncia'
      TabOrder = 3
    end
    object radAtestado: TRadioButton
      Left = 16
      Top = 64
      Width = 129
      Height = 17
      Caption = 'Atestado de Matr'#237'cula'
      TabOrder = 4
    end
    object txtAnoSemestre: TMaskEdit
      Left = 149
      Top = 117
      Width = 55
      Height = 22
      EditMask = '9999/9;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 5
      Text = '19931'
    end
    object UpDown1: TUpDown
      Left = 200
      Top = 116
      Width = 16
      Height = 24
      Min = -100
      TabOrder = 6
      OnClick = UpDown1Click
    end
    object txtTurma: TEdit
      Left = 77
      Top = 117
      Width = 67
      Height = 22
      TabOrder = 7
    end
    object radDiplomasAluno: TRadioButton
      Left = 16
      Top = 144
      Width = 177
      Height = 17
      Caption = 'Dip&loma do Aluno selecionado'
      TabOrder = 8
    end
    object chkDataAtual: TCheckBox
      Left = 32
      Top = 192
      Width = 73
      Height = 17
      Caption = 'Data atual'
      TabOrder = 9
    end
  end
end

