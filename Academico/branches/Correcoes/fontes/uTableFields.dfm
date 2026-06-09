object frmTableFields: TfrmTableFields
  Left = 541
  Top = 111
  BorderStyle = bsSizeToolWin
  Caption = 'Sele'#231#227'o'
  ClientHeight = 351
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRegistros: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlRegistros'
    TabOrder = 0
    ExplicitTop = 97
    ExplicitHeight = 254
    object Tree: TTreeView
      Left = 0
      Top = 0
      Width = 539
      Height = 351
      Align = alClient
      DragMode = dmAutomatic
      Indent = 19
      MultiSelect = True
      MultiSelectStyle = [msControlSelect, msShiftSelect, msVisibleOnly]
      TabOrder = 0
      OnDragDrop = TreeDragDrop
      ExplicitHeight = 254
    end
  end
  object qry: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 136
    Top = 168
  end
  object tblDisciplinas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'd.CURSO AS curso,'
      #9'd.SIGLA AS sigla,'
      #9'd.DESCRICAO AS descricao,'
      #9'd.codigo AS codigo'
      'FROM'
      
        #9'DISCIPLINAS d INNER JOIN cursos_coligada cc ON (cc.cd_curso = d' +
        '.curso)'
      'WHERE'
      #9'd.curso like :Curso AND cc.cd_coligada IN ( [cd_coligada_in] )'
      'ORDER BY'
      '  d.CURSO, d.DESCRICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object tblDisciplinasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'Disciplinas.Curso'
      Size = 15
    end
    object tblDisciplinasSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'Disciplinas.Sigla'
      Size = 10
    end
    object tblDisciplinasDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 100
    end
    object tblDisciplinascodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.disciplinas.codigo'
      DisplayFormat = '00000000000'
    end
  end
  object qyMatriculas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '  T.CURSO,'
      '  T.CODIGO AS TURMA,'
      '  D.CODIGO AS DISCIPLINA,'
      '  D.DESCRICAO'
      'FROM '
      '   TURMAS T '
      '   JOIN GRADES_DISCIPLINAS GR ON '
      '      (T.CURSO = GR.CD_CURSO) AND '
      '      (T.CD_GRADE = GR.CD_GRADE) AND'
      '      (T.SERIE = GR.NR_SERIE)'
      '   JOIN DISCIPLINAS D ON '
      '      (D.CURSO = T.CURSO) AND'
      '      (D.CODIGO = GR.CD_DISCIPLINA)'
      'WHERE'
      '  T.ANOSEMESTRE = :ANOSEMESTRE'
      'ORDER BY'
      '  T.CURSO,'
      '  T.CODIGO,'
      '  D.DESCRICAO')
    Params = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qyMatriculasCurso: TStringField
      FieldName = 'Curso'
      FixedChar = True
      Size = 15
    end
    object qyMatriculasTurma: TStringField
      FieldName = 'Turma'
      FixedChar = True
      Size = 15
    end
    object qyMatriculasDisciplina: TIntegerField
      DisplayWidth = 10
      FieldName = 'Disciplina'
      DisplayFormat = '00000000000'
    end
    object qyMatriculasDescricao: TStringField
      FieldName = 'Descricao'
      FixedChar = True
      Size = 100
    end
  end
  object qyProcSelAreas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   proc_sel_areas'
      'ORDER BY'
      '   cd_area')
    Params = <>
    Left = 40
    Top = 264
    object qyProcSelAreascd_area: TStringField
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.proc_sel_areas.cd_area'
      Size = 15
    end
    object qyProcSelAreasds_area: TStringField
      FieldName = 'ds_area'
      Origin = 'WMESTRE12.proc_sel_areas.ds_area'
      Size = 100
    end
  end
  object qyProcSelDisc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   psad.*,'
      '   d.sigla, '
      '   d.descricao'
      'FROM'
      '   proc_sel_areas_disc psad'
      
        '      INNER JOIN disciplinas d ON (d.codigo = psad.cd_disc AND d' +
        '.curso = psad.cd_curso)'
      'WHERE'
      '   psad.cd_area = :cd_area'
      'ORDER BY'
      '   d.descricao')
    Params = <
      item
        DataType = ftString
        Name = 'cd_area'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_area'
        ParamType = ptUnknown
      end>
    object qyProcSelDisccd_area: TStringField
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.proc_sel_areas_disc.cd_area'
      Size = 15
    end
    object qyProcSelDisccd_disc: TIntegerField
      FieldName = 'cd_disc'
      Origin = 'WMESTRE12.proc_sel_areas_disc.cd_disc'
      DisplayFormat = '0000000'
    end
    object qyProcSelDisccd_curso: TStringField
      FieldName = 'cd_curso'
      Origin = 'WMESTRE12.proc_sel_areas_disc.cd_curso'
      Size = 15
    end
    object qyProcSelDiscsigla: TStringField
      FieldName = 'sigla'
      Origin = 'WMESTRE12.disciplinas.sigla'
      Size = 10
    end
    object qyProcSelDiscdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 100
    end
  end
  object qyGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        #9't.Curso, t.Codigo AS Turma, d.Codigo AS Disciplina, d.Descricao' +
        ', pd.Professor'
      'FROM'
      '   professoresdisciplinas pd'
      
        '  INNER JOIN cursos c ON (pd.curso = c.codigo) AND (gd.anosemest' +
        're = c.anosemestre)'
      
        '  INNER JOIN turmas t ON (c.anosemestre = t.anosemestre) AND (pd' +
        '.curso = t.curso)'
      
        '  INNER JOIN gradecurricular gd ON  (t.serie = gd.serie) AND (t.' +
        'turno = gd.turno) AND (pd.curso = gd.curso)'
      
        '  INNER JOIN disciplinas d ON (gd.disciplina = d.codigo) AND (pd' +
        '.curso = d.curso) AND (d.codigo = pd.disciplina)'
      'WHERE'
      '  (t.anosemestre = :AnoSemestre) AND (pd.professor = :Professor)')
    Params = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Professor'
        ParamType = ptUnknown
        Value = 1
      end>
    Left = 280
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Professor'
        ParamType = ptUnknown
        Value = 1
      end>
    object qyGradeCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object qyGradeTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object qyGradeDisciplina: TIntegerField
      FieldName = 'Disciplina'
      DisplayFormat = '00000000000'
    end
    object qyGradeDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qyGradeProfessor: TIntegerField
      FieldName = 'Professor'
    end
  end
  object tblCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select codigo, apelido from cursos'
      'GROUP BY codigo'
      'order by apelido')
    Params = <>
    Left = 248
    Top = 168
    object tblCursoscodigo: TStringField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.cursos.codigo'
      Size = 15
    end
    object tblCursosapelido: TStringField
      FieldName = 'apelido'
      Origin = 'WMESTRE12.cursos.apelido'
      Size = 50
    end
  end
end
