object frmGerenciamentoPresencas: TfrmGerenciamentoPresencas
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Presen'#231'as'
  ClientHeight = 513
  ClientWidth = 1004
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GERENCIAMENTO DE PRESEN'#199'AS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 488
    Width = 1004
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = DM.ImageListCadastro
    List = True
    ShowCaptions = True
    TabOrder = 1
    object ToolButton6: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnIncluir: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TToolButton
      Left = 83
      Top = 0
      AutoSize = True
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 162
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 239
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 247
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 323
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton1: TToolButton
      Left = 411
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 419
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 504
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 289
    Height = 463
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object gbFiltrarCadastrar: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 279
      Height = 84
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = ' Filtrar / Cadastrar '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 22
        Top = 24
        Width = 72
        Height = 13
        Caption = 'Ano/Semestre:'
      end
      object Label6: TLabel
        Left = 157
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Data:'
      end
      object txtAnoSem: TMaskEdit
        Left = 22
        Top = 43
        Width = 68
        Height = 21
        EditMask = '9999/9;0;_'
        MaxLength = 6
        ReadOnly = True
        TabOrder = 1
        Text = '0'
        OnChange = txtAnoSemChange
      end
      object udAnoSem: TUpDown
        Left = 75
        Top = 43
        Width = 15
        Height = 21
        Position = 50
        TabOrder = 0
        OnClick = udAnoSemClick
      end
      object dtpDataAcao: TDateTimePicker
        Left = 157
        Top = 43
        Width = 83
        Height = 21
        Date = 41662.657047418980000000
        Time = 41662.657047418980000000
        TabOrder = 2
        OnCloseUp = dtpDataAcaoCloseUp
        OnKeyUp = dtpDataAcaoKeyUp
      end
      object ckbFiltroData: TCheckBox
        Left = 139
        Top = 45
        Width = 17
        Height = 17
        TabOrder = 3
        OnClick = ckbFiltroDataClick
      end
    end
    object gbCadastro: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 99
      Width = 279
      Height = 359
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Caption = 'Cadastro '
      TabOrder = 1
      object Label2: TLabel
        Left = 27
        Top = 32
        Width = 32
        Height = 13
        Caption = 'Curso:'
      end
      object sbCurso: TSpeedButton
        Left = 230
        Top = 49
        Width = 22
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = sbCursoClick
      end
      object Label3: TLabel
        Left = 27
        Top = 88
        Width = 34
        Height = 13
        Caption = 'Turma:'
      end
      object sbTurma: TSpeedButton
        Left = 230
        Top = 105
        Width = 22
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = sbTurmaClick
      end
      object Label4: TLabel
        Left = 27
        Top = 144
        Width = 47
        Height = 13
        Caption = 'Disciplina:'
      end
      object sbDisciplina: TSpeedButton
        Left = 230
        Top = 161
        Width = 22
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = sbDisciplinaClick
      end
      object Label7: TLabel
        Left = 27
        Top = 200
        Width = 28
        Height = 13
        Caption = 'A'#231#227'o:'
      end
      object edCurso: TEdit
        Left = 27
        Top = 51
        Width = 203
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edTurma: TEdit
        Left = 27
        Top = 107
        Width = 203
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edDisciplina: TEdit
        Left = 27
        Top = 163
        Width = 203
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object cbAcao: TUMComboBox
        Left = 27
        Top = 219
        Width = 225
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        OnChange = cbAcaoChange
        TamanhoMaximo = 0
      end
    end
  end
  object gdAcoes: TDBGrid
    Left = 289
    Top = 25
    Width = 715
    Height = 463
    Align = alClient
    DataSource = dsGerenciarPresencas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = gdAcoesDrawColumnCell
    OnKeyDown = gdAcoesKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ds_curso'
        Title.Caption = 'Curso'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_turma'
        Title.Caption = 'Turma'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_disciplina'
        Title.Caption = 'Disciplina'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_execucao_acao'
        Title.Caption = 'Data de Execu'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_acao'
        Title.Caption = 'A'#231#227'o'
        Width = 174
        Visible = True
      end>
  end
  object qyGerenciarPresencas: TUMZQuery
    Connection = DM.db
    BeforeOpen = qyGerenciarPresencasBeforeOpen
    AfterOpen = qyGerenciarPresencasAfterOpen
    BeforeScroll = qyGerenciarPresencasBeforeScroll
    AfterScroll = qyGerenciarPresencasAfterScroll
    OnCalcFields = qyGerenciarPresencasCalcFields
    UpdateObject = upsqlGerenciarPresencas
    BeforeInsert = qyGerenciarPresencasBeforeInsert
    BeforeEdit = qyGerenciarPresencasBeforeEdit
    BeforePost = qyGerenciarPresencasBeforePost
    SQL.Strings = (
      'SELECT'
      '  tgp.cd_gerenciar_presenca,'
      '  tgp.nr_anosemestre,'
      '  tgp.cd_curso,'
      '  tgp.cd_turma,'
      '  tgp.cd_disciplina,'
      '  tgp.dt_execucao_acao,'
      '  tgp.cd_acao,'
      '  d.descricao AS ds_disciplina,'
      '  cm.ds_curso'
      'FROM'
      '  ta_gerenciar_presencas tgp'
      
        '  INNER JOIN disciplinas d ON ( d.curso = tgp.cd_curso AND d.cod' +
        'igo = tgp.cd_disciplina )'
      '  INNER JOIN cursos_mestre cm ON ( cm.CD_CURSO = tgp.cd_curso )'
      'WHERE'
      '  tgp.nr_anosemestre = :nr_anosemestre AND'
      
        '  (:dt_execucao_acao = 0 OR tgp.dt_execucao_acao = :dt_execucao_' +
        'acao)'
      'ORDER BY'
      '  tgp.dt_execucao_acao, tgp.cd_curso, tgp.cd_turma, d.descricao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_execucao_acao'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_execucao_acao'
        ParamType = ptUnknown
      end>
    object qyGerenciarPresencasnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Required = True
    end
    object qyGerenciarPresencascd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 15
    end
    object qyGerenciarPresencascd_turma: TStringField
      FieldName = 'cd_turma'
      Required = True
      Size = 50
    end
    object qyGerenciarPresencascd_disciplina: TIntegerField
      FieldName = 'cd_disciplina'
      Required = True
    end
    object qyGerenciarPresencasdt_execucao_acao: TDateField
      FieldName = 'dt_execucao_acao'
      Required = True
    end
    object qyGerenciarPresencascd_acao: TStringField
      FieldName = 'cd_acao'
      Required = True
      Size = 1
    end
    object qyGerenciarPresencasds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 255
    end
    object qyGerenciarPresencasds_disciplina: TStringField
      FieldName = 'ds_disciplina'
      Size = 150
    end
    object qyGerenciarPresencasds_acao: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_acao'
      Size = 100
      Calculated = True
    end
    object qyGerenciarPresencascd_gerenciar_presenca: TIntegerField
      FieldName = 'cd_gerenciar_presenca'
      Required = True
    end
  end
  object dsGerenciarPresencas: TDataSource
    DataSet = qyGerenciarPresencas
    OnStateChange = dsGerenciarPresencasStateChange
    OnDataChange = dsGerenciarPresencasDataChange
    Left = 512
    Top = 256
  end
  object upsqlGerenciarPresencas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ta_gerenciar_presencas'
      'WHERE cd_gerenciar_presenca = :cd_gerenciar_presenca')
    ModifySQL.Strings = (
      'UPDATE'
      '        ta_gerenciar_presencas'
      'SET'
      '        cd_acao = :cd_acao'
      'WHERE'
      '        cd_gerenciar_presenca = :cd_gerenciar_presenca')
    UseSequenceFieldForRefreshSQL = False
    Left = 448
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_acao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_gerenciar_presenca'
        ParamType = ptUnknown
      end>
  end
end
