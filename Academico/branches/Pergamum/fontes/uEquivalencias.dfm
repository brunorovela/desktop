object frmEquivalencias: TfrmEquivalencias
  Left = 208
  Top = 125
  Caption = 'Eq'#252'ival'#234'ncia de Disciplinas'
  ClientHeight = 588
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 25
    Width = 874
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 864
  end
  object Bevel7: TBevel
    Left = 0
    Top = 558
    Width = 874
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 552
    ExplicitWidth = 864
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'EQUIVAL'#202'NCIAS DE DISCIPLINAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object grd: TDBGrid
    Left = 0
    Top = 28
    Width = 874
    Height = 164
    Align = alTop
    DataSource = dtcMatriculas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmQtdMatriculas
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = grdCellClick
    OnTitleClick = grdTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoAluno'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turma'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AnoSemestre'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEmissao'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataSaida'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEntrada'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diploma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QualSituacao'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SituacaoEsc'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 401
    Height = 358
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel6: TBevel
      Left = 0
      Top = 25
      Width = 401
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 313
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 401
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'DISCIPLINAS NA INSTITUI'#199#195'O'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 393
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 28
      Width = 401
      Height = 330
      Align = alClient
      DataSource = dsEquiv
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmQtdEquiv
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'disciplina'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 187
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Serie'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nota'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_conceito'
          Title.Caption = 'Conceito'
          Width = 58
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 409
    Top = 200
    Width = 465
    Height = 358
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 401
    ExplicitWidth = 473
    object Bevel5: TBevel
      Left = 0
      Top = 25
      Width = 465
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 543
    end
    object grdDisc: TDBGrid
      Left = 0
      Top = 28
      Width = 465
      Height = 330
      Align = alClient
      DataSource = dsDiscEquiv
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmQtdDiscEquiv
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = grdDiscDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Eq_Curso'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'eq_disciplina'
          Title.Caption = 'Disciplina'
          Width = 176
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Eq_AnoSemestre'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'eq_ch'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Eq_Nota'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_conceito'
          Title.Caption = 'Conceito'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Eq_Frequencia'
          Title.Caption = 'Frequ'#234'ncia'
          Width = 58
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'eq_equivalencia'
          Title.Caption = 'Equival'#234'ncia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_situacao'
          Title.Caption = 'Situacao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descSituacao'
          Title.Caption = 'Situa'#231#227'o'
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 465
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'EQUIVAL'#202'NCIA EM OUTRAS INSTITUI'#199#213'ES/CURSO'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 473
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 561
    Width = 874
    Height = 27
    Align = alBottom
    ButtonWidth = 138
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btnRegistrarEquivalencia: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'Registrar Eq'#252'ival'#234'ncia'
      OnClick = btnRegistrarEquivalenciaClick
    end
    object btnAlterar: TToolButton
      Left = 125
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      ImageIndex = 2
      OnClick = btnAlterarClick
    end
    object btnLancarNota: TToolButton
      Left = 201
      Top = 0
      AutoSize = True
      Caption = 'Lan'#231'ar Hist'#243'rico'
      OnClick = btnLancarNotaClick
    end
    object btnEliminarEquivalencia: TToolButton
      Left = 289
      Top = 0
      AutoSize = True
      Caption = 'Eliminar Equival'#234'ncia'
      OnClick = btnEliminarEquivalenciaClick
    end
    object btnBuscarAluno: TToolButton
      Left = 400
      Top = 0
      AutoSize = True
      Caption = 'F8 &Buscar por Aluno'
      ImageIndex = 0
      OnClick = btnBuscarAlunoClick
    end
    object btnBuscarTurma: TToolButton
      Left = 527
      Top = 0
      AutoSize = True
      Caption = 'F11 &Buscar por Turma'
      ImageIndex = 0
      OnClick = btnBuscarTurmaClick
    end
    object btnObservacoes: TToolButton
      Left = 663
      Top = 0
      AutoSize = True
      Caption = 'Observa'#231#245'es'
      OnClick = btnObservacoesClick
    end
    object btnFechar: TToolButton
      Left = 737
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 1
      OnClick = btnFecharClick
    end
  end
  object pnMove: TPanel
    Left = 401
    Top = 200
    Width = 8
    Height = 358
    Cursor = crHSplit
    Align = alLeft
    BevelKind = bkTile
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 5
    OnMouseDown = pnMoveMouseDown
    OnMouseMove = pnMoveMouseMove
    OnMouseUp = pnMoveMouseUp
    ExplicitLeft = 393
  end
  object pnDivisaoH: TPanel
    Left = 0
    Top = 192
    Width = 874
    Height = 8
    Cursor = crVSplit
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
    OnMouseDown = pnDivisaoHMouseDown
    OnMouseMove = pnDivisaoHMouseMove
    OnMouseUp = pnDivisaoHMouseUp
  end
  object tblMatriculas: TUMZQuery
    Connection = DM.db
    AfterOpen = tblMatriculasAfterOpen
    SQL.Strings = (
      
        'select Matriculas.*, Pessoas.nm_pessoa as Nome, matriculas_curso' +
        '.cd_grade, matriculas_curso.nr_anosem_grade, matriculas_curso.cd' +
        '_curso'
      'FROM '
      
        ' Matriculas INNER JOIN Pessoas ON  (Matriculas.CodigoAluno = Pes' +
        'soas.cd_pessoa)'
      
        ' INNER JOIN matriculas_curso ON (Matriculas.cd_matricula_curso =' +
        ' matriculas_curso.cd_matricula_curso) '
      'WHERE DataEmissao = :DataEmissao'
      'ORDER BY Pessoas.nm_pessoa')
    Params = <
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end>
    Left = 400
    Top = 93
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end>
    object tblMatriculasCodigoAluno: TIntegerField
      DisplayLabel = 'Cod.Aluno'
      FieldName = 'CodigoAluno'
      Origin = 'Matriculas.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblMatriculasTurma: TStringField
      Alignment = taCenter
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Matriculas.Turma'
      Size = 50
    end
    object tblMatriculasAnoSemestre: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'Matriculas.CodigoAluno'
      DisplayFormat = '0000/0'
    end
    object tblMatriculasDataEmissao: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Dt.Emiss'#227'o'
      FieldName = 'DataEmissao'
      Origin = 'Matriculas.DataEmissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMatriculasUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Matriculas.Usuario'
      Size = 30
    end
    object tblMatriculasPlanoPagamento: TIntegerField
      DisplayLabel = 'Pl.Pagto.'
      FieldName = 'PlanoPagamento'
      Origin = 'Matriculas.PlanoPagamento'
    end
    object tblMatriculasSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Matriculas.Situacao'
    end
    object tblMatriculasDataSaida: TDateTimeField
      DisplayLabel = 'Dt.Sa'#237'da'
      FieldName = 'DataSaida'
      Origin = 'Matriculas.DataSaida'
    end
    object tblMatriculasPlanoDesconto: TIntegerField
      FieldName = 'PlanoDesconto'
      Origin = 'Matriculas.PlanoDesconto'
    end
    object tblMatriculasNome: TStringField
      FieldName = 'Nome'
      Origin = 'Alunos.Nome'
      Size = 45
    end
    object tblMatriculasQualSituacao: TStringField
      DisplayLabel = 'Sit.'
      FieldKind = fkCalculated
      FieldName = 'QualSituacao'
      Calculated = True
    end
    object tblMatriculasTurmaDependencia: TStringField
      FieldName = 'TurmaDependencia'
      Origin = 'Matriculas.CodigoAluno'
      Size = 50
    end
    object tblMatriculasTurmaCalc: TStringField
      Alignment = taCenter
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'TurmaCalc'
      Size = 50
      Calculated = True
    end
    object tblMatriculasSituacaoEscolar: TSmallintField
      DisplayLabel = 'Apr/Repr'
      FieldName = 'SituacaoEscolar'
      Origin = 'Matriculas.Turma'
    end
    object tblMatriculasDataEntrada: TDateTimeField
      DisplayLabel = 'Dt.Entrada'
      FieldName = 'DataEntrada'
      Origin = 'Matriculas.CodigoAluno'
    end
    object tblMatriculasSituacaoEsc: TStringField
      DisplayLabel = 'Apr./Repr.'
      FieldKind = fkCalculated
      FieldName = 'SituacaoEsc'
      Size = 5
      Calculated = True
    end
    object tblMatriculasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'Matriculas.AnoSemestre'
      Size = 15
    end
    object tblMatriculascd_grade: TLargeintField
      FieldName = 'cd_grade'
    end
    object tblMatriculasnr_anosem_grade: TLargeintField
      FieldName = 'nr_anosem_grade'
    end
    object tblMatriculascd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 15
    end
  end
  object dtcMatriculas: TDataSource
    DataSet = tblMatriculas
    OnDataChange = dtcMatriculasDataChange
    Left = 400
    Top = 125
  end
  object tblEquiv: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  Equivalencias.*,'
      '  Disciplinas.Descricao'
      'FROM'
      '  Equivalencias, Disciplinas'
      'WHERE'
      '  Equivalencias.Disciplina = Disciplinas.codigo'
      'AND'
      '  Equivalencias.Curso = Disciplinas.Curso'
      'AND'
      '  Equivalencias.CodigoAluno = :CodigoAluno'
      'AND'
      '  Equivalencias.Curso IN (:CURSO, :cd_curso)'
      'ORDER BY'
      '  Equivalencias.id_equivalencia')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end>
    DataSource = dtcMatriculas
    Left = 176
    Top = 309
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end>
    object tblEquivCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'WMESTRE12.Equivalencias.CodigoAluno'
    end
    object tblEquivCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.Equivalencias.Curso'
      Size = 15
    end
    object tblEquivSerie: TSmallintField
      DisplayLabel = 'Sem.'
      FieldName = 'Serie'
      Origin = 'WMESTRE12.Equivalencias.Serie'
    end
    object tblEquivNota: TFloatField
      FieldName = 'Nota'
      Origin = 'WMESTRE12.Equivalencias.Nota'
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object tblEquivDescricao: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'Descricao'
      Origin = 'WMESTRE12.Disciplinas.Descricao'
      Size = 50
    end
    object tblEquivds_conceito: TStringField
      FieldName = 'ds_conceito'
      Size = 50
    end
    object tblEquivFrequencia: TFloatField
      FieldName = 'Frequencia'
    end
    object tblEquivdisciplina: TIntegerField
      FieldName = 'disciplina'
      Required = True
    end
  end
  object tblDiscEquiv: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From EquivalenciasDisciplinas'
      'WHERE CodigoAluno = :CodigoAluno'
      'AND CURSO = :CURSO'
      'ORDER BY codigoequivalencias')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
        Size = 6
      end>
    DataSource = dsEquiv
    Left = 512
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
        Size = 6
      end>
    object tblDiscEquivEq_Instituicao: TStringField
      DisplayLabel = 'Institui'#231#227'o'
      FieldName = 'Eq_Instituicao'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.Eq_Instituicao'
      Size = 100
    end
    object tblDiscEquivEq_Curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'Eq_Curso'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.Eq_Curso'
      Size = 100
    end
    object tblDiscEquivEq_AnoSemestre: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'Eq_AnoSemestre'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.Eq_AnoSemestre'
      DisplayFormat = '####/#'
    end
    object tblDiscEquivEq_Nota: TFloatField
      DisplayLabel = 'Nota'
      FieldName = 'Eq_Nota'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.Eq_Nota'
    end
    object tblDiscEquivEq_Frequencia: TFloatField
      FieldName = 'Eq_Frequencia'
    end
    object tblDiscEquivCodigoEquivalencias: TIntegerField
      FieldName = 'CodigoEquivalencias'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.CodigoEquivalencias'
    end
    object tblDiscEquivCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.CodigoAluno'
    end
    object tblDiscEquivCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.EquivalenciasDisciplinas.Curso'
      Size = 15
    end
    object tblDiscEquiveq_ch: TFloatField
      DisplayLabel = 'C.H.'
      FieldName = 'eq_ch'
      Origin = 'WMESTRE12.equivalenciasdisciplinas.eq_ch'
    end
    object tblDiscEquivcd_professor: TIntegerField
      FieldName = 'cd_professor'
      Origin = 'WMESTRE12.equivalenciasdisciplinas.cd_professor'
    end
    object tblDiscEquivds_conceito: TStringField
      FieldName = 'ds_conceito'
      Origin = 'WMESTRE12.equivalenciasdisciplinas.ds_conceito'
    end
    object tblDiscEquivdisciplina: TIntegerField
      FieldName = 'disciplina'
    end
    object tblDiscEquiveq_equivalencia: TFloatField
      FieldName = 'eq_equivalencia'
    end
    object tblDiscEquivcd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object tblDiscEquivdescSituacao: TStringField
      FieldKind = fkLookup
      FieldName = 'descSituacao'
      LookupDataSet = qrySituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao'
      Lookup = True
    end
    object tblDiscEquiveq_disciplina: TMemoField
      FieldName = 'eq_disciplina'
      OnGetText = tblDiscEquiveq_disciplinaGetText
      BlobType = ftMemo
    end
  end
  object dsEquiv: TDataSource
    DataSet = tblEquiv
    OnDataChange = dsEquivDataChange
    Left = 176
    Top = 341
  end
  object dsDiscEquiv: TDataSource
    AutoEdit = False
    DataSet = tblDiscEquiv
    Left = 512
    Top = 325
  end
  object qAtualizaNota: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 48
    Top = 403
  end
  object ImageList1: TImageList
    Left = 240
    Top = 316
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000808080000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      80000000000080808000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C000FFFF00008080
      80008080800000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000C0C0C000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFF0000C0C0C000C0C0C0008080
      8000C0C0C00000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000FFFF0000FFFF0000C0C0C0008080
      800080808000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      80000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFC000000000CE3FFFC000000
      000883FF200000000001000F000000000003003F000000000003002F00000000
      0003000F000000000003000F0000000000030001000000000007000100000000
      000F0001E0000000000F000FF8000000000F000FF0000000001F002FE0010000
      003F803FC4030000007FE3FFEC07000000000000000000000000000000000000
      000000000000}
  end
  object pmQtdMatriculas: TPopupMenu
    OnPopup = pmQtdMatriculasPopup
    Left = 400
    Top = 64
  end
  object pmQtdEquiv: TPopupMenu
    OnPopup = pmQtdEquivPopup
    Left = 176
    Top = 280
  end
  object pmQtdDiscEquiv: TPopupMenu
    OnPopup = pmQtdDiscEquivPopup
    Left = 512
    Top = 264
  end
  object qrySituacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM situacao where sn_equivalencia = 1')
    Params = <>
    Left = 584
    Top = 304
    object qrySituacoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object qrySituacoesds_situacao: TStringField
      FieldName = 'ds_situacao'
      Size = 100
    end
  end
end
