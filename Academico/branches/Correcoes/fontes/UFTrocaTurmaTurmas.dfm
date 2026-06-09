object frmTrocaTurmaTurmas: TfrmTrocaTurmaTurmas
  AlignWithMargins = True
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 156
  ClientWidth = 160
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object dbllTurmas: TDBLookupListBox
    Left = 0
    Top = 0
    Width = 160
    Height = 156
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    KeyField = 'CD_TURMA'
    ListField = 'CD_TURMA'
    ListSource = dsTurmas
    TabOrder = 0
    OnClick = dbllTurmasClick
  end
  object qryTurmas: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'CD_TURMA'
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'T.CODIGO CD_TURMA,'
      '  G.CD_DISCIPLINA,'
      '  G.CD_CURSO,'
      '  T.ANOSEMESTRE NR_ANOSEMESTRE,'
      '  (g.nr_serie = -100) SN_OPTATIVA'
      'FROM'
      #9'TURMAS T'
      #9#9'JOIN GRADES_DISCIPLINAS G ON'
      #9#9#9'(T.CURSO = G.CD_CURSO) AND'
      #9#9#9'(T.SERIE = G.NR_SERIE) AND'
      #9#9#9'(T.CD_GRADE = G.CD_GRADE)'
      'WHERE'
      #9'G.CD_DISCIPLINA = :CD_DISCIPLINA AND'
      #9'G.CD_CURSO = :CD_CURSO AND'
      #9'T.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '  T.CODIGO != :CD_TURMA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'CD_TURMA Asc'
    Left = 24
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end>
    object qryTurmasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryTurmasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
      Required = True
    end
    object qryTurmasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryTurmasNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object qryTurmasSN_OPTATIVA: TSmallintField
      FieldName = 'SN_OPTATIVA'
    end
  end
  object dsTurmas: TDataSource
    DataSet = qryTurmas
    Left = 24
    Top = 96
  end
end
