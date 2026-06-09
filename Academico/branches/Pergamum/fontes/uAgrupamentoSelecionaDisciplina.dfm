object frmAgrupamentoSelecionaDisciplina: TfrmAgrupamentoSelecionaDisciplina
  Left = 0
  Top = 0
  Caption = 'Selecione, arraste e solte'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDisciplinasTurmas: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 300
    Align = alClient
    DataSource = dsDisciplinasTurmas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = dbgDisciplinasTurmasColEnter
    OnTitleClick = dbgDisciplinasTurmasTitleClick
    Columns = <
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'curso'
        Title.Caption = 'Curso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_turma'
        Title.Caption = 'Turma'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_sigla'
        Title.Caption = 'Sigla'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_descricao'
        Title.Caption = 'Disciplina'
        Visible = True
      end>
  end
  object dsDisciplinasTurmas: TDataSource
    DataSet = qryDisciplinasTurmasU
    Left = 232
    Top = 112
  end
  object qryDisciplinasTurmasU: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select distinct'
      #9'uni_t.codigo as cd_turma,'
      #9'uni_d.sigla as ds_sigla,'
      #9'uni_d.descricao as ds_descricao,'
      #9'uni_d.cd_disciplina_pai,'
      '                uni_d.codigo as cd_disciplina,'
      '               uni_d.curso'
      'from '
      ''
      'disciplinas  as uni_d '
      ''
      'INNER JOIN turmas as uni_t ON ('
      '   uni_t.curso = uni_d.curso'#9
      ')'
      ''
      'INNER JOIN grades g ON ( '
      #9#9'g.CD_GRADE = uni_t.cd_grade AND '
      #9#9'g.CD_CURSO = uni_t.curso AND'
      #9#9'g.SN_ATIVO = '#39'S'#39
      ')'
      'INNER JOIN grades_disciplinas gd ON ('
      #9#9'gd.CD_GRADE = g.CD_GRADE AND'
      #9#9'gd.CD_CURSO = g.CD_CURSO AND'
      #9#9'uni_t.serie = gd.NR_SERIE'
      ')'
      'WHERE'
      '     uni_t.anosemestre = :nr_anosemestre and'
      '     uni_d.cd_disciplina_pai= :cd_disciplina_pai'
      '    and uni_t.cd_coligada in (%s)'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cd_disciplina_pai'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 200
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cd_disciplina_pai'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryDisciplinasTurmasUcd_turma: TStringField
      FieldName = 'cd_turma'
      Size = 50
    end
    object qryDisciplinasTurmasUds_sigla: TStringField
      FieldName = 'ds_sigla'
      Size = 5
    end
    object qryDisciplinasTurmasUds_descricao: TStringField
      FieldName = 'ds_descricao'
      Size = 150
    end
    object qryDisciplinasTurmasUcd_disciplina_pai: TStringField
      FieldName = 'cd_disciplina_pai'
      Required = True
      Size = 255
    end
    object qryDisciplinasTurmasUcd_disciplina: TIntegerField
      FieldName = 'cd_disciplina'
    end
    object qryDisciplinasTurmasUcurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
  end
end
