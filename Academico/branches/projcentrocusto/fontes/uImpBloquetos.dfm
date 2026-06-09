object frmImpBloquetos: TfrmImpBloquetos
  Left = 259
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Imprimir Bloquetos...'
  ClientHeight = 250
  ClientWidth = 354
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
    Width = 354
    Height = 250
    Align = alClient
    TabOrder = 0
    object btnImprimir: TButton
      Left = 160
      Top = 208
      Width = 89
      Height = 28
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
      Left = 256
      Top = 211
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
    object GroupBox2: TGroupBox
      Left = 8
      Top = 3
      Width = 337
      Height = 182
      TabOrder = 2
      object Label1: TLabel
        Left = 45
        Top = 24
        Width = 33
        Height = 14
        Caption = 'Turma:'
      end
      object Label4: TLabel
        Left = 13
        Top = 56
        Width = 66
        Height = 14
        Caption = 'Aluno (In'#237'cio):'
      end
      object Label5: TLabel
        Left = 13
        Top = 88
        Width = 64
        Height = 14
        Caption = 'Aluno (Final):'
      end
      object Label2: TLabel
        Left = 213
        Top = 56
        Width = 16
        Height = 14
        Caption = 'De:'
      end
      object Label3: TLabel
        Left = 209
        Top = 88
        Width = 20
        Height = 14
        Caption = 'At'#233':'
      end
      object Label6: TLabel
        Left = 182
        Top = 24
        Width = 47
        Height = 14
        Caption = 'Ano/Sem.'
      end
      object txtTurma: TEdit
        Left = 85
        Top = 20
        Width = 89
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object txtCodigoInicio: TEdit
        Left = 85
        Top = 52
        Width = 89
        Height = 22
        TabOrder = 1
      end
      object txtCodigoFim: TEdit
        Left = 85
        Top = 84
        Width = 89
        Height = 22
        TabOrder = 2
      end
      object datDe: TDateTimePicker
        Left = 232
        Top = 52
        Width = 81
        Height = 22
        Date = 35974.913871759260000000
        Time = 35974.913871759260000000
        TabOrder = 3
      end
      object datAte: TDateTimePicker
        Left = 232
        Top = 84
        Width = 81
        Height = 22
        Date = 35974.913871759260000000
        Time = 35974.913871759260000000
        TabOrder = 4
      end
      object radTodos: TRadioButton
        Left = 188
        Top = 112
        Width = 133
        Height = 17
        Caption = 'Todos os Alunos/Turma'
        TabOrder = 5
      end
      object radManual: TRadioButton
        Left = 188
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Manualmente'
        TabOrder = 6
      end
      object radTodosBloquetos: TRadioButton
        Left = 188
        Top = 132
        Width = 125
        Height = 17
        Caption = 'Todos os Bloquetos'
        TabOrder = 7
      end
      object chk: TCheckBox
        Left = 16
        Top = 120
        Width = 161
        Height = 17
        Caption = 'Imprimir Bloquetos c/ B'#244'nus'
        TabOrder = 8
      end
      object txtAnoSemestre: TMaskEdit
        Left = 232
        Top = 20
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
        TabOrder = 9
        Text = '20001'
      end
      object UpDown1: TUpDown
        Left = 287
        Top = 19
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 10
        OnClick = UpDown1Click
      end
      object cbVisualizar: TCheckBox
        Left = 16
        Top = 152
        Width = 97
        Height = 17
        Caption = 'Visualizar'
        TabOrder = 11
      end
    end
  end
end

