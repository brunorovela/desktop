object frmImpVencidos: TfrmImpVencidos
  Left = 226
  Top = 164
  Caption = 'Relat'#243'rio de Vencidos...'
  ClientHeight = 167
  ClientWidth = 378
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 3
    Width = 360
    Height = 110
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 78
      Width = 77
      Height = 14
      Caption = 'Vencimento at'#233':'
    end
    object Label3: TLabel
      Left = 207
      Top = 47
      Width = 65
      Height = 14
      Caption = 'Ano/Sem. de:'
    end
    object Label4: TLabel
      Left = 204
      Top = 77
      Width = 68
      Height = 14
      Caption = 'Ano/Sem. at'#233':'
    end
    object Label5: TLabel
      Left = 35
      Top = 20
      Width = 53
      Height = 14
      Caption = 'C'#243'd.Aluno:'
    end
    object Label6: TLabel
      Left = 55
      Top = 49
      Width = 33
      Height = 14
      Caption = 'Turma:'
    end
    object datAte: TDateTimePicker
      Left = 93
      Top = 74
      Width = 103
      Height = 22
      Date = 35796.913871759260000000
      Time = 35796.913871759260000000
      TabOrder = 2
      OnKeyPress = datDeKeyPress
    end
    object EditAnoDe: TMaskEdit
      Left = 277
      Top = 43
      Width = 73
      Height = 22
      EditMask = '9999/9;1;_'
      MaxLength = 6
      TabOrder = 3
      Text = '    / '
      OnKeyPress = datDeKeyPress
    end
    object EditAnoAte: TMaskEdit
      Left = 277
      Top = 73
      Width = 73
      Height = 22
      EditMask = '9999/9;1;_'
      MaxLength = 6
      TabOrder = 4
      Text = '    / '
      OnKeyPress = datDeKeyPress
    end
    object EditCodigoAluno: TEdit
      Left = 93
      Top = 16
      Width = 73
      Height = 22
      TabOrder = 0
      OnKeyPress = datDeKeyPress
    end
    object EditTurma: TEdit
      Left = 93
      Top = 45
      Width = 73
      Height = 22
      TabOrder = 1
      OnKeyPress = datDeKeyPress
    end
  end
  object btnImprimir: TButton
    Left = 184
    Top = 119
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
    TabStop = False
    OnClick = btnImprimirClick
  end
  object btnFechar: TButton
    Left = 280
    Top = 119
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
    TabStop = False
    OnClick = btnFecharClick
  end
  object chkEspecial: TCheckBox
    Left = 8
    Top = 120
    Width = 97
    Height = 17
    Caption = 'Especial'
    TabOrder = 3
  end
end
