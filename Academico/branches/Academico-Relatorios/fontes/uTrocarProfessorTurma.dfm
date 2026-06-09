object frmTrocarProfessorTurma: TfrmTrocarProfessorTurma
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 345
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 16
    Top = 66
    Width = 105
    Height = 13
    Caption = 'Professor substitu'#237'do:'
    WordWrap = True
  end
  object Label9: TLabel
    Left = 125
    Top = 66
    Width = 149
    Height = 13
    Caption = 'PROFESSOR_SUBSTITUIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'TROCAR PROFESSOR TURMA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 411
    Height = 320
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 375
      Height = 26
      Caption = 
        'Voc'#234' est'#225' utilizando um procedimento para trocar o professor atu' +
        'al da turma, para isso '#233' necess'#225'rio informar algumas configura'#231#245 +
        'es a serem utilizadas:'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 16
      Top = 42
      Width = 34
      Height = 13
      Caption = 'Turma:'
      WordWrap = True
    end
    object lbTurma: TLabel
      Left = 53
      Top = 42
      Width = 41
      Height = 13
      Caption = 'TURMA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 57
      Width = 47
      Height = 13
      Caption = 'Disciplina:'
      WordWrap = True
    end
    object lbDisciplina: TLabel
      Left = 67
      Top = 57
      Width = 65
      Height = 13
      Caption = 'DISCIPLINA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbProfessorSubstituido: TLabel
      Left = 125
      Top = 72
      Width = 149
      Height = 13
      Caption = 'PROFESSOR_SUBSTITUIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 72
      Width = 105
      Height = 13
      Caption = 'Professor substitu'#237'do:'
      WordWrap = True
    end
    object Label10: TLabel
      Left = 16
      Top = 87
      Width = 101
      Height = 13
      Caption = 'Professor substituto:'
      WordWrap = True
    end
    object lbProfessorSubstituto: TLabel
      Left = 125
      Top = 87
      Width = 143
      Height = 13
      Caption = 'PROFESSOR_SUBSTITUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 112
      Width = 377
      Height = 3
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 14
      Top = 213
      Width = 377
      Height = 3
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 16
      Top = 164
      Width = 271
      Height = 13
      Caption = 'Efetuar as altera'#231#245'es de aulas/provas a partir da etapa:'
      WordWrap = True
    end
    object ckManterProfessorAI: TCheckBox
      Left = 16
      Top = 225
      Width = 289
      Height = 17
      Caption = 'Manter professor substitu'#237'do na Avalia'#231#227'o Institucional'
      TabOrder = 3
    end
    object Button1: TButton
      Left = 99
      Top = 285
      Width = 100
      Height = 25
      Caption = 'Confirmar a troca'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 205
      Top = 285
      Width = 100
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 6
      OnClick = Button2Click
    end
    object ckatribuircronogramas: TCheckBox
      Left = 16
      Top = 248
      Width = 271
      Height = 17
      Caption = 'Atribuir os cronogramas para o professor substituto'
      TabOrder = 4
    end
    object ckTransferirAulas: TCheckBox
      Left = 16
      Top = 122
      Width = 233
      Height = 17
      Caption = 'Atribuir as aulas para o professor substituto'
      TabOrder = 0
    end
    object ckTransferirProvas: TCheckBox
      Left = 16
      Top = 142
      Width = 241
      Height = 17
      Caption = 'Atribuir as provas para o professor substituto'
      TabOrder = 1
    end
    object cbEtapa: TComboBox
      Left = 16
      Top = 179
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
  end
end
