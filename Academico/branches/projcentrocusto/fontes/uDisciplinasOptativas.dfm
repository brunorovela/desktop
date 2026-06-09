object fDisciplinasOptativas: TfDisciplinasOptativas
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Disciplinas Optativas'
  ClientHeight = 294
  ClientWidth = 426
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
  object tvDisciplinasOptativas: TTreeView
    Left = 0
    Top = 0
    Width = 426
    Height = 294
    Align = alClient
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnMouseDown = tvDisciplinasOptativasMouseDown
  end
  object qDisciplinasOptativas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'disc_optativa.codigo cd_disciplina_optativa,'
      #9'disc_optativa.descricao descricao_optativa,'
      #9'disc_generica.codigo cd_disciplina_generica,'
      #9'disc_generica.descricao descricao_generica'
      'FROM'
      #9'turmas t'
      #9'INNER JOIN grades_disciplinas gd_optativa ON ('
      #9#9'gd_optativa.cd_grade = t.cd_grade AND'
      #9#9'gd_optativa.cd_curso = t.curso'
      #9')'
      #9'INNER JOIN disciplinas disc_optativa ON ('
      #9#9'disc_optativa.codigo = gd_optativa.cd_disciplina AND'
      #9#9'disc_optativa.curso = t.curso'
      #9')'
      #9'INNER JOIN grades_disciplinas gd_generica ON ('
      #9#9'gd_generica.cd_grade = t.cd_grade AND'
      #9#9'gd_generica.cd_curso = t.curso AND'
      '    gd_generica.nr_serie = t.serie'
      #9')'
      #9'INNER JOIN disciplinas disc_generica ON ('
      #9#9'disc_generica.codigo = gd_generica.cd_disciplina AND'
      #9#9'disc_generica.curso = t.curso'
      #9')'
      #9'LEFT JOIN turmas_disciplinas_optativas tdo ON ('
      #9#9'tdo.nr_anosemestre = t.anosemestre AND'
      #9#9'tdo.cd_curso = t.curso AND'
      #9#9'tdo.cd_turma = t.codigo AND'
      #9#9'tdo.cd_disciplina_optativa = gd_optativa.cd_disciplina AND'
      #9#9'tdo.cd_disciplina_generica = gd_generica.cd_disciplina'
      #9')'
      'WHERE'
      #9't.codigo LIKE :cd_turma AND'
      #9't.anosemestre = :nr_anosemestre AND'
      #9'gd_optativa.nr_serie = -100 AND'
      '  gd_generica.sn_optativa = 1 AND'
      #9'tdo.cd_turma IS NULL'
      'ORDER BY'
      '  disc_generica.descricao,'
      '  disc_optativa.descricao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end>
    object qDisciplinasOptativascd_disciplina_optativa: TIntegerField
      FieldName = 'cd_disciplina_optativa'
    end
    object qDisciplinasOptativasdescricao_optativa: TStringField
      FieldName = 'descricao_optativa'
      Size = 150
    end
    object qDisciplinasOptativascd_disciplina_generica: TIntegerField
      FieldName = 'cd_disciplina_generica'
    end
    object qDisciplinasOptativasdescricao_generica: TStringField
      FieldName = 'descricao_generica'
      Size = 150
    end
  end
end
