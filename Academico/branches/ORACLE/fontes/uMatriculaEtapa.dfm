object FrmMatricula_Etapa: TFrmMatricula_Etapa
  Left = 0
  Top = 0
  Width = 580
  Height = 335
  TabOrder = 0
  TabStop = True
  object Label14: TLabel
    Left = 3
    Top = 15
    Width = 486
    Height = 26
    Caption = 'Selecione abaixo a turma principal do aluno (Turma Matr'#237'cula)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object grd: TDBGrid
    Left = 3
    Top = 71
    Width = 558
    Height = 227
    BorderStyle = bsNone
    DataSource = dtcTurmas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vagas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd_matriculas'
        Title.Caption = 'Qtd. Matriculas'
        Visible = True
      end>
  end
  object ckbEtapaSeguinte: TCheckBox
    Left = 3
    Top = 304
    Width = 217
    Height = 17
    TabStop = False
    Caption = 'Exibir Somente a etapa seguinte'
    TabOrder = 1
  end
  object tblTurmas: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select Turmas.*, Cursos.Depto '
      'from Turmas,  Cursos '
      'where Turmas.AnoSemestre = :AnoSemestre '
      'AND Turmas.Curso = Cursos.Codigo '
      'AND Cursos.AnoSemestre = Turmas.AnoSemestre '
      'AND Cursos.Codigo = :Curso'
      'order by Turmas.Codigo'
      '')
    Left = 544
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object tblTurmasAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Turmas.AnoSemestre'
    end
    object tblTurmasCodigo: TStringField
      DisplayLabel = 'Turma'
      DisplayWidth = 15
      FieldName = 'Codigo'
      Origin = 'Turmas.Codigo'
      Size = 15
    end
    object tblTurmasSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'Turmas.Serie'
    end
    object tblTurmasCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'Turmas.Curso'
      Size = 15
    end
    object tblTurmasTurno: TStringField
      FieldName = 'Turno'
      Origin = 'Turmas.Turno'
      Size = 1
    end
    object tblTurmasDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Origin = 'Turmas.Descricao'
      Size = 40
    end
    object tblTurmasContrato: TStringField
      FieldName = 'Contrato'
      Origin = 'Turmas.Contrato'
      Size = 50
    end
    object tblTurmasVagas: TSmallintField
      FieldName = 'Vagas'
      Origin = 'Turmas.Vagas'
    end
    object tblTurmasHoraInicio: TDateTimeField
      FieldName = 'HoraInicio'
      Origin = 'Turmas.HoraInicio'
    end
    object tblTurmasHoraFim: TDateTimeField
      FieldName = 'HoraFim'
      Origin = 'Turmas.HoraFim'
    end
    object tblTurmasDataInicio: TDateTimeField
      FieldName = 'DataInicio'
      Origin = 'Turmas.DataInicio'
    end
    object tblTurmasDataFim: TDateTimeField
      FieldName = 'DataFim'
      Origin = 'Turmas.DataFim'
    end
    object tblTurmasIdadeConclusao: TSmallintField
      FieldName = 'IdadeConclusao'
      Origin = 'Turmas.IdadeConclusao'
    end
    object tblTurmasDataConclusao: TDateTimeField
      FieldName = 'DataConclusao'
      Origin = 'Turmas.DataConclusao'
    end
    object tblTurmasDepto: TSmallintField
      FieldName = 'Depto'
      Origin = 'WMESTRE12.Cursos.Depto'
    end
    object tblTurmasqtd_matriculas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qtd_matriculas'
      Calculated = True
    end
    object tblTurmascd_centro: TIntegerField
      FieldName = 'cd_centro'
    end
    object tblTurmascd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
  end
  object dtcTurmas: TDataSource
    DataSet = tblTurmas
    Left = 544
    Top = 276
  end
end

