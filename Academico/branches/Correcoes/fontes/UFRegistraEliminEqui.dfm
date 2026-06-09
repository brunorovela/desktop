object fRegistraEliminEqui: TfRegistraEliminEqui
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Registrar motivo para elimina'#231#227'o de equival'#234'ncia'
  ClientHeight = 545
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 20
    Width = 550
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 248
    ExplicitTop = 312
    ExplicitWidth = 50
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 520
    Width = 550
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitLeft = 192
    ExplicitTop = 536
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = 'REGISTRAR MOTIVO PARA ELIMINA'#199#195'O DE EQUIVAL'#202'NCIA'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlDados: TPanel
    Left = 0
    Top = 23
    Width = 550
    Height = 497
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lblAluno: TLabel
      Left = 8
      Top = 3
      Width = 27
      Height = 13
      Caption = 'Aluno'
      FocusControl = dbeAluno
    end
    object lblDisciplina: TLabel
      Left = 274
      Top = 46
      Width = 43
      Height = 13
      Caption = 'Disciplina'
      FocusControl = dbeDisciplina
    end
    object lblCurso: TLabel
      Left = 8
      Top = 46
      Width = 28
      Height = 13
      Caption = 'Curso'
      FocusControl = dbeCurso
    end
    object lblSituacao: TLabel
      Left = 8
      Top = 303
      Width = 108
      Height = 13
      Caption = 'Situa'#231#227'o da elimina'#231#227'o'
      FocusControl = dblcSituacao
    end
    object lblMotivo: TLabel
      Left = 8
      Top = 346
      Width = 99
      Height = 13
      Caption = 'Motivo da elimina'#231#227'o'
    end
    object dbeAluno: TDBEdit
      Left = 8
      Top = 19
      Width = 415
      Height = 21
      DataField = 'NM_PESSOA'
      DataSource = dsAluno
      ReadOnly = True
      TabOrder = 0
    end
    object dbeDisciplina: TDBEdit
      Left = 274
      Top = 62
      Width = 260
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsDisciplina
      ReadOnly = True
      TabOrder = 2
    end
    object dbeCurso: TDBEdit
      Left = 8
      Top = 62
      Width = 260
      Height = 21
      DataField = 'DS_CURSO'
      DataSource = dsCurso
      ReadOnly = True
      TabOrder = 1
    end
    object rgEquivalencia: TGroupBox
      Left = 8
      Top = 89
      Width = 526
      Height = 208
      Caption = 'Disciplina equivalente'
      TabOrder = 3
      object lblProfessor: TLabel
        Left = 12
        Top = 107
        Width = 46
        Height = 13
        Caption = 'Professor'
        FocusControl = dbeProfessor
      end
      object lblInstituicaoEq: TLabel
        Left = 12
        Top = 21
        Width = 99
        Height = 13
        Caption = 'Institui'#231#227'o de ensino'
        FocusControl = dbeInstituicaoEq
      end
      object lblCursoEq: TLabel
        Left = 12
        Top = 64
        Width = 28
        Height = 13
        Caption = 'Curso'
        FocusControl = dbeCursoEq
      end
      object lblDisciplinaEq: TLabel
        Left = 268
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Disciplina'
        FocusControl = dbeDisciplinaEq
      end
      object lblAnoSemestreEq: TLabel
        Left = 429
        Top = 21
        Width = 67
        Height = 13
        Caption = 'Ano/semestre'
        FocusControl = dbeAnoSemestreEq
      end
      object lblCargaHorariaEq: TLabel
        Left = 12
        Top = 150
        Width = 66
        Height = 13
        Caption = 'Carga hor'#225'ria'
        FocusControl = dbeCargaHorariaEq
      end
      object lblNotaEq: TLabel
        Left = 108
        Top = 150
        Width = 23
        Height = 13
        Caption = 'Nota'
        FocusControl = dbeNotaEq
      end
      object lblFrequenciaEq: TLabel
        Left = 300
        Top = 150
        Width = 65
        Height = 13
        Caption = '% frequ'#234'ncia'
        FocusControl = dbeFrequenciaEq
      end
      object lblConteudoEq: TLabel
        Left = 396
        Top = 150
        Width = 118
        Height = 13
        Caption = '% conte'#250'do equivalente'
        FocusControl = dbeConteudoEq
      end
      object lblConceitoEq: TLabel
        Left = 204
        Top = 150
        Width = 42
        Height = 13
        Caption = 'Conceito'
        FocusControl = dbeConceitoEq
      end
      object dbeProfessor: TDBEdit
        Left = 12
        Top = 123
        Width = 506
        Height = 21
        DataField = 'NM_PESSOA'
        DataSource = dsProfessor
        ReadOnly = True
        TabOrder = 4
      end
      object dbeInstituicaoEq: TDBEdit
        Left = 12
        Top = 37
        Width = 411
        Height = 21
        DataField = 'NM_INSTITUICAO_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 0
      end
      object dbeCursoEq: TDBEdit
        Left = 12
        Top = 80
        Width = 250
        Height = 21
        DataField = 'NM_CURSO_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 2
      end
      object dbeDisciplinaEq: TDBEdit
        Left = 268
        Top = 80
        Width = 250
        Height = 21
        DataField = 'NM_DISCIPLINA_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 3
      end
      object dbeAnoSemestreEq: TDBEdit
        Left = 429
        Top = 37
        Width = 89
        Height = 21
        DataField = 'NR_ANOSEMESTRE_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 1
      end
      object dbeCargaHorariaEq: TDBEdit
        Left = 12
        Top = 166
        Width = 90
        Height = 21
        DataField = 'VL_CARGA_HORARIA_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 5
      end
      object dbeNotaEq: TDBEdit
        Left = 108
        Top = 166
        Width = 90
        Height = 21
        DataField = 'VL_NOTA_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 6
      end
      object dbeFrequenciaEq: TDBEdit
        Left = 300
        Top = 166
        Width = 90
        Height = 21
        DataField = 'VL_FREQUENCIA_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 8
      end
      object dbeConteudoEq: TDBEdit
        Left = 396
        Top = 166
        Width = 122
        Height = 21
        DataField = 'VL_CONTEUDO_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 9
      end
      object dbeConceitoEq: TDBEdit
        Left = 204
        Top = 166
        Width = 90
        Height = 21
        DataField = 'DS_CONCEITO_EQ'
        DataSource = dsLogEquivalencias
        ReadOnly = True
        TabOrder = 7
      end
    end
    object dblcSituacao: TDBLookupComboBox
      Left = 8
      Top = 319
      Width = 315
      Height = 21
      DataField = 'DS_SITUACAO'
      DataSource = dsLogEquivalencias
      TabOrder = 4
    end
    object dbmMotivo: TDBMemo
      Left = 8
      Top = 365
      Width = 526
      Height = 124
      DataField = 'TX_MOTIVO'
      DataSource = dsLogEquivalencias
      ScrollBars = ssBoth
      TabOrder = 5
    end
  end
  object stbOpcoes: TToolBar
    Left = 0
    Top = 523
    Width = 550
    Height = 22
    Align = alBottom
    ButtonWidth = 74
    Caption = 'stbOpcoes'
    DrawingStyle = dsGradient
    Images = ilOpcoes
    List = True
    ShowCaptions = True
    TabOrder = 2
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'btnSep1'
      Style = tbsSeparator
    end
    object btnConfirmar: TToolButton
      Left = 8
      Top = 0
      Caption = 'Confirmar'
      ImageIndex = 0
      OnClick = btnConfirmarClick
    end
    object btnSep2: TToolButton
      Left = 82
      Top = 0
      Width = 8
      Caption = 'btnSep2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btncancelar: TToolButton
      Left = 90
      Top = 0
      Caption = 'Cancelar'
      ImageIndex = 1
      OnClick = btncancelarClick
    end
  end
  object qryLogEquivalencias: TUMZQuery
    Connection = DM.db
    UpdateObject = updLogEquivalencias
    SQL.Strings = (
      'SELECT'
      '   CD_EQUIVALENCIA_LOG,'
      '   CD_USUARIO,'
      '   DT_LOG,'
      '   CD_SITUACAO,'
      '   CD_ALUNO,'
      '   CD_DISCIPLINA,'
      '   CD_CURSO,'
      '   CD_PROFESSOR_EQ,'
      '   NM_INSTITUICAO_EQ,'
      '   NM_CURSO_EQ,'
      '   NM_DISCIPLINA_EQ,'
      '   NR_ANOSEMESTRE_EQ,'
      '   VL_CARGA_HORARIA_EQ,'
      '   VL_NOTA_EQ,'
      '   VL_FREQUENCIA_EQ,'
      '   VL_CONTEUDO_EQ,'
      '   DS_CONCEITO_EQ,'
      '   TP_ACAO,'
      '   TX_MOTIVO,'
      '   NR_FICHA_EXCLUIDA'
      'FROM'
      '   UNI_EQUIVALENCIAS_LOGS'
      'WHERE'
      '   CD_ALUNO = :CD_ALUNO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    object qryLogEquivalenciasDS_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_SITUACAO'
      LookupDataSet = qrySituacoes
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_VALOR'
      KeyFields = 'CD_SITUACAO'
      Lookup = True
    end
    object qryLogEquivalenciasCD_EQUIVALENCIA_LOG: TLargeintField
      FieldName = 'CD_EQUIVALENCIA_LOG'
      Required = True
    end
    object qryLogEquivalenciasCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object qryLogEquivalenciasDT_LOG: TDateTimeField
      FieldName = 'DT_LOG'
    end
    object qryLogEquivalenciasCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
      Required = True
    end
    object qryLogEquivalenciasCD_ALUNO: TIntegerField
      FieldName = 'CD_ALUNO'
      Required = True
    end
    object qryLogEquivalenciasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
      Required = True
    end
    object qryLogEquivalenciasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryLogEquivalenciasCD_PROFESSOR_EQ: TLargeintField
      FieldName = 'CD_PROFESSOR_EQ'
    end
    object qryLogEquivalenciasNM_INSTITUICAO_EQ: TStringField
      FieldName = 'NM_INSTITUICAO_EQ'
      Size = 100
    end
    object qryLogEquivalenciasNM_CURSO_EQ: TStringField
      FieldName = 'NM_CURSO_EQ'
      Size = 100
    end
    object qryLogEquivalenciasNR_ANOSEMESTRE_EQ: TIntegerField
      FieldName = 'NR_ANOSEMESTRE_EQ'
      DisplayFormat = '0000/0'
    end
    object qryLogEquivalenciasVL_CARGA_HORARIA_EQ: TFloatField
      FieldName = 'VL_CARGA_HORARIA_EQ'
    end
    object qryLogEquivalenciasVL_NOTA_EQ: TFloatField
      FieldName = 'VL_NOTA_EQ'
    end
    object qryLogEquivalenciasVL_FREQUENCIA_EQ: TFloatField
      FieldName = 'VL_FREQUENCIA_EQ'
    end
    object qryLogEquivalenciasVL_CONTEUDO_EQ: TFloatField
      FieldName = 'VL_CONTEUDO_EQ'
    end
    object qryLogEquivalenciasDS_CONCEITO_EQ: TStringField
      FieldName = 'DS_CONCEITO_EQ'
      Size = 10
    end
    object qryLogEquivalenciasTP_ACAO: TStringField
      FieldName = 'TP_ACAO'
      Required = True
      Size = 1
    end
    object qryLogEquivalenciasTX_MOTIVO: TMemoField
      FieldName = 'TX_MOTIVO'
      BlobType = ftMemo
    end
    object qryLogEquivalenciasNR_FICHA_EXCLUIDA: TStringField
      FieldName = 'NR_FICHA_EXCLUIDA'
      Size = 1
    end
    object qryLogEquivalenciasnm_disciplina_eq: TMemoField
      FieldName = 'nm_disciplina_eq'
      OnGetText = qryLogEquivalenciasnm_disciplina_eqGetText
      BlobType = ftMemo
      Size = 1000
    end
  end
  object qrySituacoes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_VALOR'
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   CD_MODULO,'
      '   CD_SITUACAO,'
      '   DS_VALOR,'
      '   DS_SIGLA'
      'FROM'
      '   SITUACOES'
      'WHERE'
      '   CD_MODULO = 1010')
    Params = <>
    IndexFieldNames = 'DS_VALOR Asc'
    Left = 416
    Top = 456
    object qrySituacoesCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Required = True
    end
    object qrySituacoesCD_MODULO: TLargeintField
      FieldName = 'CD_MODULO'
    end
    object qrySituacoesCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qrySituacoesDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
    object qrySituacoesDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 50
    end
  end
  object qryUsuario: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   NM_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_USUARIO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    DataSource = dsLogEquivalencias
    Left = 88
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qryUsuarioNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsLogEquivalencias: TDataSource
    DataSet = qryLogEquivalencias
    Left = 40
    Top = 456
  end
  object dsUsuario: TDataSource
    DataSet = qryUsuario
    Left = 88
    Top = 456
  end
  object qryAluno: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NM_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_ALUNO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    DataSource = dsLogEquivalencias
    Left = 144
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    object qryAlunoNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryAlunoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
  end
  object dsAluno: TDataSource
    DataSet = qryAluno
    Left = 144
    Top = 456
  end
  object qryDisciplina: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_DISCIPLINA_PAI,'
      '   CODIGO,'
      '   CURSO,'
      '   SIGLA,'
      '   DESCRICAO'
      'FROM'
      '   DISCIPLINAS'
      'WHERE'
      '   CODIGO = :CD_DISCIPLINA AND'
      '   CURSO = :CD_CURSO')
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
      end>
    DataSource = dsLogEquivalencias
    Left = 200
    Top = 416
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
      end>
    object qryDisciplinaCD_DISCIPLINA_PAI: TStringField
      FieldName = 'CD_DISCIPLINA_PAI'
      Required = True
      Size = 255
    end
    object qryDisciplinaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryDisciplinaCURSO: TStringField
      FieldName = 'CURSO'
      Size = 15
    end
    object qryDisciplinaSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 5
    end
    object qryDisciplinaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
  end
  object dsDisciplina: TDataSource
    DataSet = qryDisciplina
    Left = 200
    Top = 456
  end
  object qryCurso: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_CURSO,'
      '   DS_CURSO'
      'FROM'
      '   CURSOS_MESTRE'
      'WHERE'
      '   CD_CURSO = :CD_CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    DataSource = dsLogEquivalencias
    Left = 256
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
    object qryCursoCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryCursoDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
  end
  object dsCurso: TDataSource
    DataSet = qryCurso
    Left = 256
    Top = 456
  end
  object qryProfessor: TUMZReadOnlyQuery
    Connection = DM.db
    AfterOpen = qryProfessorAfterOpen
    SQL.Strings = (
      'SELECT'
      '   NM_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_PROFESSOR_EQ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROFESSOR_EQ'
        ParamType = ptUnknown
      end>
    DataSource = dsLogEquivalencias
    Left = 320
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PROFESSOR_EQ'
        ParamType = ptUnknown
      end>
    object qryProfessorNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsProfessor: TDataSource
    DataSet = qryProfessor
    Left = 320
    Top = 456
  end
  object ilOpcoes: TImageList
    Left = 376
    Top = 456
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFF83F00000000
      F9FFE00F00000000F0FFCFC700000000F0FF87E300000000E07FA3F300000000
      C07F31F900000000843F38F9000000001E3F3C7900000000FE1F3E3900000000
      FF1F3F1900000000FF8F9F8B00000000FFC78FC300000000FFE3C7E700000000
      FFF8E00F00000000FFFFF83F0000000000000000000000000000000000000000
      000000000000}
  end
  object updLogEquivalencias: TZUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO UNI_EQUIVALENCIAS_LOGS ('
      
        '   CD_USUARIO, DT_LOG, CD_SITUACAO, CD_ALUNO, CD_DISCIPLINA, CD_' +
        'CURSO,'
      
        '   CD_PROFESSOR_EQ, NM_INSTITUICAO_EQ, NM_CURSO_EQ, NM_DISCIPLIN' +
        'A_EQ,'
      
        '   NR_ANOSEMESTRE_EQ, VL_CARGA_HORARIA_EQ, VL_NOTA_EQ, VL_FREQUE' +
        'NCIA_EQ,'
      
        '   VL_CONTEUDO_EQ, DS_CONCEITO_EQ, TP_ACAO, TX_MOTIVO, NR_FICHA_' +
        'EXCLUIDA'
      ')'
      'VALUES ('
      
        '   :CD_USUARIO, NOW(), :CD_SITUACAO, :CD_ALUNO, :CD_DISCIPLINA, ' +
        ':CD_CURSO,'
      
        '   :CD_PROFESSOR_EQ, :NM_INSTITUICAO_EQ, :NM_CURSO_EQ, :NM_DISCI' +
        'PLINA_EQ,'
      
        '   :NR_ANOSEMESTRE_EQ, :VL_CARGA_HORARIA_EQ, :VL_NOTA_EQ, :VL_FR' +
        'EQUENCIA_EQ,'
      
        '   :VL_CONTEUDO_EQ, :DS_CONCEITO_EQ, :TP_ACAO, :TX_MOTIVO, :NR_F' +
        'ICHA_EXCLUIDA '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '   CD_EQUIVALENCIA_LOG,'
      '   CD_USUARIO,'
      '   DT_LOG,'
      '   CD_SITUACAO,'
      '   CD_ALUNO,'
      '   CD_DISCIPLINA,'
      '   CD_CURSO,'
      '   CD_PROFESSOR_EQ,'
      '   NM_INSTITUICAO_EQ,'
      '   NM_CURSO_EQ,'
      '   NM_DISCIPLINA_EQ,'
      '   NR_ANOSEMESTRE_EQ,'
      '   VL_CARGA_HORARIA_EQ,'
      '   VL_NOTA_EQ,'
      '   VL_FREQUENCIA_EQ,'
      '   VL_CONTEUDO_EQ,'
      '   DS_CONCEITO_EQ,'
      '   TP_ACAO,'
      '   TX_MOTIVO'
      'FROM'
      '   UNI_EQUIVALENCIAS_LOGS'
      'WHERE'
      '   CD_ALUNO = :CD_ALUNO')
    UseSequenceFieldForRefreshSQL = False
    Left = 40
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_SITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end
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
        Name = 'CD_PROFESSOR_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NM_INSTITUICAO_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NM_CURSO_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NM_DISCIPLINA_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_CARGA_HORARIA_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_NOTA_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_FREQUENCIA_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_CONTEUDO_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONCEITO_EQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TP_ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TX_MOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_FICHA_EXCLUIDA'
        ParamType = ptUnknown
      end>
  end
  object qryEquivalencia: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CODIGOEQUIVALENCIAS,'
      '   CODIGOALUNO,'
      '   DISCIPLINA,'
      '   CURSO,'
      '   EQ_INSTITUICAO,'
      '   EQ_CURSO,'
      '   EQ_DISCIPLINA,'
      '   EQ_ANOSEMESTRE,'
      '   EQ_CH,'
      '   EQ_NOTA,'
      '   CD_PROFESSOR,'
      '   DS_CONCEITO,'
      '   EQ_FREQUENCIA,'
      '   EQ_EQUIVALENCIA'
      'FROM'
      '   EQUIVALENCIASDISCIPLINAS'
      'WHERE'
      '   CODIGOEQUIVALENCIAS = :CD_EQUIVALENCIA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_EQUIVALENCIA'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EQUIVALENCIA'
        ParamType = ptUnknown
      end>
    object qryEquivalenciaCODIGOEQUIVALENCIAS: TIntegerField
      FieldName = 'CODIGOEQUIVALENCIAS'
      Required = True
    end
    object qryEquivalenciaCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
    object qryEquivalenciaDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
    end
    object qryEquivalenciaCURSO: TStringField
      FieldName = 'CURSO'
      Size = 15
    end
    object qryEquivalenciaEQ_INSTITUICAO: TStringField
      FieldName = 'EQ_INSTITUICAO'
      Size = 100
    end
    object qryEquivalenciaEQ_CURSO: TStringField
      FieldName = 'EQ_CURSO'
      Size = 100
    end
    object qryEquivalenciaEQ_ANOSEMESTRE: TSmallintField
      FieldName = 'EQ_ANOSEMESTRE'
    end
    object qryEquivalenciaEQ_CH: TFloatField
      FieldName = 'EQ_CH'
    end
    object qryEquivalenciaEQ_NOTA: TFloatField
      FieldName = 'EQ_NOTA'
    end
    object qryEquivalenciaCD_PROFESSOR: TIntegerField
      FieldName = 'CD_PROFESSOR'
    end
    object qryEquivalenciaDS_CONCEITO: TStringField
      FieldName = 'DS_CONCEITO'
      Size = 10
    end
    object qryEquivalenciaEQ_FREQUENCIA: TFloatField
      FieldName = 'EQ_FREQUENCIA'
    end
    object qryEquivalenciaEQ_EQUIVALENCIA: TFloatField
      FieldName = 'EQ_EQUIVALENCIA'
    end
    object qryEquivalenciaeq_disciplina: TMemoField
      FieldName = 'eq_disciplina'
      OnGetText = qryEquivalenciaeq_disciplinaGetText
      BlobType = ftMemo
      Size = 1000
    end
  end
  object qEliminaDisc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Delete From EquivalenciasDisciplinas '
      'Where CodigoAluno = :CodigoAluno'
      'AND Disciplina = :Disciplina'
      'AND Curso = :Curso')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 416
    Top = 411
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
  end
  object qEliminaEquiv: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Delete From Equivalencias'
      'Where CodigoAluno = :CodigoAluno'
      'AND Disciplina = :Disciplina'
      'AND Curso = :Curso')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 411
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
  end
  object qExluiFichaIndividual: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE'
      '   F.*'
      'FROM'
      '   Equivalencias e'
      
        'INNER JOIN EquivalenciasDisciplinas ed ON (e.codigoaluno = ed.co' +
        'digoaluno AND e.disciplina = ed.disciplina AND e.curso = ed.curs' +
        'o)'
      
        'INNER JOIN fichaindividual f ON (f.disciplina = ed.disciplina an' +
        'd ed.codigoaluno = f.codigoaluno and ed.curso = f.curso)'
      'WHERE'#9' '
      '   F.turmamatricula = :turmamatricula'
      'AND '
      '   F.turma = '#39'HISTORICO'#39
      'AND '
      '   F.codigoaluno = :codigoaluno'
      'AND '
      '   F.disciplina = :disciplina'
      'AND '
      '   F.curso = :curso'
      'AND '
      
        '   F.SITUACAO IN (SELECT CD_SITUACAO FROM SITUACAO WHERE CD_SITU' +
        'ACAO_PAI = 12)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turmamatricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turmamatricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
  end
end
