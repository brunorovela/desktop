object fmObsHistorico: TfmObsHistorico
  Left = 152
  Top = 116
  Caption = 'Observa'#231'oes Hist'#243'rico'
  ClientHeight = 453
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 578
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 274
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      Visible = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = Button4Click
    end
    object buEscola: TButton
      Left = 10
      Top = 8
      Width = 75
      Height = 25
      Caption = 'E&scola'
      TabOrder = 4
      OnClick = buEscolaClick
    end
  end
  object pcHistorico: TPageControl
    Left = 0
    Top = 105
    Width = 578
    Height = 307
    ActivePage = tshist
    Align = alClient
    TabOrder = 1
    object tshist: TTabSheet
      Caption = 'Hist'#243'rico'
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 570
        Height = 279
        Align = alClient
        DataField = 'Observacoes'
        DataSource = dsHist
        MaxLength = 30000
        TabOrder = 0
      end
    end
    object tsSerie: TTabSheet
      Caption = 'S'#233'ries'
      object grSerie: TDBGrid
        Left = 0
        Top = 0
        Width = 570
        Height = 279
        Align = alClient
        DataSource = dsSerie
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'anosemestre'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'grau'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'serie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'situacao'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dssit'
            Title.Caption = 'Desc. Situa'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigoescola'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmescola'
            Width = 263
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 105
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 27
      Height = 13
      Caption = 'C&urso'
    end
    object DBText2: TDBText
      Left = 19
      Top = 31
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'descricao'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 54
      Width = 63
      Height = 13
      Caption = 'C'#243'digo &Aluno'
    end
    object DBText1: TDBText
      Left = 24
      Top = 77
      Width = 52
      Height = 16
      AutoSize = True
      DataField = 'nome'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object eeAluno: TEdit
      Left = 104
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object eeCurso: TEdit
      Left = 104
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object dsHist: TDataSource
    DataSet = quHist
    Left = 336
  end
  object quHist: TUMZQuery
    Connection = DM.db
    BeforePost = quHistBeforePost
    SQL.Strings = (
      'SELECT CODIGOALUNO , CURSO , OBSERVACOES'
      'FROM OBSERVACOESHISTORICO OBSERVACOESHISTORICO'
      'WHERE ( OBSERVACOESHISTORICO.CODIGOALUNO = :CDALUNO) AND'
      '      ( OBSERVACOESHISTORICO.CURSO       = :CURSO)')
    Params = <
      item
        DataType = ftInteger
        Name = 'cdAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cdAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object quHistCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object quHistCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object quHistObservacoes: TMemoField
      FieldName = 'Observacoes'
      BlobType = ftMemo
    end
  end
  object usHist: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 416
  end
  object qualuno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT NOME FROM ALUNOS WHERE (CODIGO = :CODIGO)')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qualunonome: TStringField
      FieldName = 'nome'
      Size = 45
    end
  end
  object DataSource1: TDataSource
    DataSet = qualuno
    Left = 288
    Top = 48
  end
  object qucurso: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT DESCRICAO FROM CURSOS WHERE (CODIGO = :CODIGO)')
    Params = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qucursodescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
  end
  object DataSource2: TDataSource
    DataSet = qucurso
    Left = 384
    Top = 48
  end
  object dsSerie: TDataSource
    DataSet = quSerie
    Left = 128
    Top = 88
  end
  object quSerie: TUMZQuery
    Connection = DM.db
    OnCalcFields = quSerieCalcFields
    UpdateObject = usSerie
    CachedUpdates = True
    BeforePost = quSerieBeforePost
    SQL.Strings = (
      'SELECT * FROM HISTORICOSERIES'
      'WHERE CODIGOALUNO = :CODIGOALUNO')
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end>
    object quSeriecodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
    end
    object quSeriecurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
    object quSerieanosemestre: TIntegerField
      DisplayLabel = 'Ano/Sem'
      FieldName = 'anosemestre'
      DisplayFormat = '####/#'
      EditFormat = '____/_'
    end
    object quSeriegrau: TSmallintField
      DisplayLabel = 'Grau'
      FieldName = 'grau'
    end
    object quSerieserie: TSmallintField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'serie'
    end
    object quSeriesituacao: TSmallintField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacao'
    end
    object quSeriecodigoescola: TSmallintField
      FieldName = 'codigoescola'
    end
    object quSerienmescola: TStringField
      DisplayLabel = 'Ds. Escola'
      DisplayWidth = 26
      FieldKind = fkLookup
      FieldName = 'nmescola'
      LookupDataSet = quEscola
      LookupKeyFields = 'codigo'
      LookupResultField = 'nome'
      KeyFields = 'codigoescola'
      Lookup = True
    end
    object quSeriedssit: TStringField
      FieldKind = fkLookup
      FieldName = 'dssit'
      LookupDataSet = qusit
      LookupKeyFields = 'CD_SITUACAO'
      LookupResultField = 'DS_SITUACAO'
      KeyFields = 'situacao'
      Size = 40
      Lookup = True
    end
  end
  object usSerie: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from HISTORICOSERIE'
      'where'
      '  CODIGOALUNO = :OLD_CODIGOALUNO and'
      '  CURSO = :OLD_CURSO and'
      '  ANOSEMESTRE = :OLD_ANOSEMESTRE and'
      '  GRAU = :OLD_GRAU and'
      '  SERIE = :OLD_SERIE and'
      '  SITUACAO = :OLD_SITUACAO and'
      '  CODIGOESCOLA = :OLD_CODIGOESCOLA')
    InsertSQL.Strings = (
      'insert into HISTORICOSERIE'
      '  (CODIGOALUNO, CURSO, ANOSEMESTRE, GRAU, SERIE, SITUACAO, '
      'CODIGOESCOLA)'
      'values'
      
        '  (:CODIGOALUNO, :CURSO, :ANOSEMESTRE, :GRAU, :SERIE, :SITUACAO,' +
        ' '
      ':CODIGOESCOLA)')
    ModifySQL.Strings = (
      'update HISTORICOSERIE'
      'set'
      '  CODIGOALUNO = :CODIGOALUNO,'
      '  CURSO = :CURSO,'
      '  ANOSEMESTRE = :ANOSEMESTRE,'
      '  GRAU = :GRAU,'
      '  SERIE = :SERIE,'
      '  SITUACAO = :SITUACAO,'
      '  CODIGOESCOLA = :CODIGOESCOLA'
      'where'
      '  CODIGOALUNO = :OLD_CODIGOALUNO and'
      '  CURSO = :OLD_CURSO and'
      '  ANOSEMESTRE = :OLD_ANOSEMESTRE and'
      '  GRAU = :OLD_GRAU and'
      '  SERIE = :OLD_SERIE and'
      '  SITUACAO = :OLD_SITUACAO and'
      '  CODIGOESCOLA = :OLD_CODIGOESCOLA')
    UseSequenceFieldForRefreshSQL = False
    Left = 224
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOESCOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_GRAU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_SITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CODIGOESCOLA'
        ParamType = ptUnknown
      end>
  end
  object dsEscola: TDataSource
    DataSet = quEscola
    Left = 280
    Top = 88
  end
  object quEscola: TUMZQuery
    Connection = DM.db
    CachedUpdates = True
    SQL.Strings = (
      'SELECT CODIGO,NOME,CIDADE FROM ESCOLAS'
      'ORDER BY NOME')
    Params = <>
    Left = 328
    Top = 88
    object quEscolacodigo: TSmallintField
      FieldName = 'codigo'
    end
    object quEscolanome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object quEscolacidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
  end
  object qusit: TUMZQuery
    SQL.Strings = (
      'SELECT * FROM SITUACAO')
    Params = <>
    Left = 584
    Top = 80
  end
  object dssit: TDataSource
    DataSet = qusit
    Left = 536
    Top = 80
  end
end
