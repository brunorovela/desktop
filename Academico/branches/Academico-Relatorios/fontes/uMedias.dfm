object Form1: TForm1
  Left = 200
  Top = 128
  Width = 544
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 112
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
  object Query1: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select * from FichaIndividual where'
      'MediaFinal is not NULL')
    Left = 32
    Top = 72
    object Query1AnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'FichaIndividual.AnoSemestre'
    end
    object Query1Turma: TStringField
      FieldName = 'Turma'
      Origin = 'FichaIndividual.Turma'
      Size = 15
    end
    object Query1CodigoGrade: TStringField
      FieldName = 'CodigoGrade'
      Origin = 'FichaIndividual.CodigoGrade'
    end
    object Query1CodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'FichaIndividual.CodigoAluno'
    end
    object Query1Curso: TStringField
      FieldName = 'Curso'
      Origin = 'FichaIndividual.Curso'
      Size = 15
    end
    object Query1Disciplina: TSmallintField
      FieldName = 'Disciplina'
      Origin = 'FichaIndividual.Disciplina'
    end
    object Query1Grau: TSmallintField
      FieldName = 'Grau'
      Origin = 'FichaIndividual.Grau'
    end
    object Query1Serie: TSmallintField
      FieldName = 'Serie'
      Origin = 'FichaIndividual.Serie'
    end
    object Query1Nota1: TFloatField
      FieldName = 'Nota1'
      Origin = 'FichaIndividual.Nota1'
    end
    object Query1Falta1: TSmallintField
      FieldName = 'Falta1'
      Origin = 'FichaIndividual.Falta1'
    end
    object Query1Exame1: TFloatField
      FieldName = 'Exame1'
      Origin = 'FichaIndividual.Exame1'
    end
    object Query1Nota2: TFloatField
      FieldName = 'Nota2'
      Origin = 'FichaIndividual.Nota2'
    end
    object Query1Falta2: TSmallintField
      FieldName = 'Falta2'
      Origin = 'FichaIndividual.Falta2'
    end
    object Query1Exame2: TFloatField
      FieldName = 'Exame2'
      Origin = 'FichaIndividual.Exame2'
    end
    object Query1Nota3: TFloatField
      FieldName = 'Nota3'
      Origin = 'FichaIndividual.Nota3'
    end
    object Query1Falta3: TSmallintField
      FieldName = 'Falta3'
      Origin = 'FichaIndividual.Falta3'
    end
    object Query1Exame3: TFloatField
      FieldName = 'Exame3'
      Origin = 'FichaIndividual.Exame3'
    end
    object Query1Nota4: TFloatField
      FieldName = 'Nota4'
      Origin = 'FichaIndividual.Nota4'
    end
    object Query1Falta4: TSmallintField
      FieldName = 'Falta4'
      Origin = 'FichaIndividual.Falta4'
    end
    object Query1Exame4: TFloatField
      FieldName = 'Exame4'
      Origin = 'FichaIndividual.Exame4'
    end
    object Query1NotaExame: TFloatField
      FieldName = 'NotaExame'
      Origin = 'FichaIndividual.NotaExame'
    end
    object Query1FloatField2aEpoca: TFloatField
      FieldName = '2aEpoca'
      Origin = 'FichaIndividual.2aEpoca'
    end
    object Query1MediaFinal: TFloatField
      FieldName = 'MediaFinal'
      Origin = 'FichaIndividual.MediaFinal'
    end
    object Query1Frequencia: TSmallintField
      FieldName = 'Frequencia'
      Origin = 'FichaIndividual.Frequencia'
    end
    object Query1TotalFaltas: TSmallintField
      FieldName = 'TotalFaltas'
      Origin = 'FichaIndividual.TotalFaltas'
    end
    object Query1Situacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'FichaIndividual.Situacao'
    end
    object Query1Usuario: TIntegerField
      FieldName = 'Usuario'
      Origin = 'FichaIndividual.Usuario'
    end
    object Query1CodigoEscola: TSmallintField
      FieldName = 'CodigoEscola'
      Origin = 'FichaIndividual.CodigoEscola'
    end
  end
end

