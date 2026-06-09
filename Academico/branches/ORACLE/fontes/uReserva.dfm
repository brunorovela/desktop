object frmReserva: TfrmReserva
  Left = 280
  Top = 125
  BiDiMode = bdLeftToRight
  BorderStyle = bsDialog
  Caption = 'Reserva de Vaga'
  ClientHeight = 580
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  ParentBiDiMode = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 417
    Top = 31
    Width = 8
    Height = 466
    Shape = bsLeftLine
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 870
    Height = 8
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 25
  end
  object Bevel9: TBevel
    Left = 416
    Top = 33
    Width = 6
    Height = 523
    Align = alLeft
    Shape = bsLeftLine
    ExplicitHeight = 484
  end
  object paCabecalho: TPanel
    Left = 0
    Top = 8
    Width = 870
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'RESERVA DE VAGAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 556
    Width = 870
    Height = 24
    Align = alBottom
    ButtonWidth = 118
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Width = 10
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnGerar: TToolButton
      Left = 10
      Top = 0
      AutoSize = True
      Caption = 'F2 Gerar Reservas'
      ImageIndex = 0
      OnClick = btnGerarClick
    end
    object tbSeparador1: TToolButton
      Left = 114
      Top = 0
      Width = 11
      Caption = 'tbSeparador1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnExcluir: TToolButton
      Left = 125
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir Reservas'
      ImageIndex = 1
      OnClick = btnExcluirClick
    end
    object tbSeparador2: TToolButton
      Left = 233
      Top = 0
      Width = 11
      Caption = 'tbSeparador2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnRequerimentos: TToolButton
      Left = 244
      Top = 0
      AutoSize = True
      Caption = 'Imprimir Requerimentos'
      ImageIndex = 2
      OnClick = btnRequerimentosClick
    end
    object tbSeparador3: TToolButton
      Left = 366
      Top = 0
      Width = 11
      Caption = 'tbSeparador3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnContratos: TToolButton
      Left = 377
      Top = 0
      AutoSize = True
      Caption = 'Imprimir Contratos'
      ImageIndex = 3
      OnClick = btnContratosClick
    end
    object tbSeparador4: TToolButton
      Left = 474
      Top = 0
      Width = 11
      Caption = 'tbSeparador4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 485
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 4
      OnClick = btnFecharClick
    end
    object ToolButton1: TToolButton
      Left = 551
      Top = 0
      Width = 10
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 416
    Height = 523
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel3: TBevel
      Left = 0
      Top = 150
      Width = 24
      Height = 359
      Align = alLeft
      Shape = bsSpacer
      ExplicitTop = 0
      ExplicitHeight = 484
    end
    object Bevel4: TBevel
      Left = 392
      Top = 150
      Width = 24
      Height = 359
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 484
    end
    object Bevel5: TBevel
      Left = 0
      Top = 509
      Width = 416
      Height = 14
      Align = alBottom
      Shape = bsSpacer
      ExplicitTop = 470
    end
    object lstAlunos: TCheckListBox
      Left = 24
      Top = 150
      Width = 368
      Height = 359
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 416
      Height = 150
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 315
        Top = 34
        Width = 72
        Height = 14
        Alignment = taRightJustify
        Caption = 'Ano/Semestre:'
      end
      object btnTurmas: TSpeedButton
        Left = 256
        Top = 53
        Width = 31
        Height = 23
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
        OnClick = btnTurmasClick
      end
      object lbTurma: TLabel
        Left = 24
        Top = 34
        Width = 139
        Height = 14
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Selecione a turma de origem:'
        ParentBiDiMode = False
      end
      object lbTituloOrigem: TLabel
        Left = 0
        Top = 6
        Width = 411
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'ORIGEM:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 24
        Top = 82
        Width = 123
        Height = 14
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Confira os alunos abaixo.'
        ParentBiDiMode = False
      end
      object sbMarcar: TSpeedButton
        Left = 342
        Top = 127
        Width = 25
        Height = 22
        Hint = 'Selecionar Parcelas'
        Flat = True
        Glyph.Data = {
          82020000424D8202000000000000420000002800000011000000100000000100
          10000300000040020000C30E0000C30E00000000000000000000007C0000E003
          00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
          734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
          FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
          FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
          734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
          0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
          734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
          FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
          FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
          734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
          734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
          0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
          FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
          734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7F0000}
        OnClick = sbMarcarClick
      end
      object sbDesmarcar: TSpeedButton
        Left = 368
        Top = 127
        Width = 25
        Height = 22
        Hint = 'Desmarcar parcelas selecionadas'
        Flat = True
        Glyph.Data = {
          76030000424D7603000000000000360000002800000011000000100000000100
          18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
          999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
          9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
          FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
          99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
          9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
          999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
          FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
          999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
          9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        OnClick = sbDesmarcarClick
      end
      object lbAlunos: TLabel
        Left = 24
        Top = 130
        Width = 267
        Height = 14
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Apenas os alunos marcados ser'#227'o pr'#233'-rematriculados.'
        ParentBiDiMode = False
      end
      object UpDown1: TUpDown
        Left = 376
        Top = 53
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 0
        OnClick = UpDown1Click
      end
      object txtAnoSemestreDe: TMaskEdit
        Left = 315
        Top = 54
        Width = 63
        Height = 22
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 1
        Text = '19931'
        OnKeyPress = txtAnoSemestreDeKeyPress
      end
      object txtTurmaDe: TEdit
        Left = 24
        Top = 54
        Width = 233
        Height = 22
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 2
        OnKeyDown = txtTurmaDeKeyDown
        OnKeyPress = txtTurmaParaKeyPress
      end
      object cbForcarMatriculaPreRequisito: TCheckBox
        Left = 24
        Top = 105
        Width = 312
        Height = 17
        Caption = 'Liberar pr'#233'-requisitos para disciplinas na situa'#231#227'o cursando'
        TabOrder = 3
      end
    end
  end
  object pnDestino: TPanel
    Left = 422
    Top = 33
    Width = 416
    Height = 523
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel6: TBevel
      Left = 0
      Top = 150
      Width = 24
      Height = 359
      Align = alLeft
      Shape = bsSpacer
      ExplicitTop = 0
      ExplicitHeight = 484
    end
    object Bevel7: TBevel
      Left = 392
      Top = 150
      Width = 24
      Height = 359
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 484
    end
    object Bevel8: TBevel
      Left = 0
      Top = 509
      Width = 416
      Height = 14
      Align = alBottom
      Shape = bsSpacer
      ExplicitTop = 470
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 416
      Height = 150
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label9: TLabel
        Left = 26
        Top = 130
        Width = 292
        Height = 14
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Confira os valores que ser'#227'o gerados para todos os alunos:'
        ParentBiDiMode = False
      end
      object Label8: TLabel
        Left = 26
        Top = 82
        Width = 159
        Height = 14
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Selecione o plano de pagamento:'
        ParentBiDiMode = False
      end
      object Label3: TLabel
        Left = 26
        Top = 34
        Width = 142
        Height = 14
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        Caption = 'Selecione a turma de destino:'
        ParentBiDiMode = False
      end
      object SpeedButton1: TSpeedButton
        Left = 256
        Top = 53
        Width = 31
        Height = 23
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
        OnClick = SpeedButton1Click
      end
      object Label4: TLabel
        Left = 315
        Top = 34
        Width = 72
        Height = 14
        Alignment = taRightJustify
        Caption = 'Ano/Semestre:'
      end
      object Label1: TLabel
        Left = 1
        Top = 6
        Width = 416
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'DESTINO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object cbPlanos: TComboBox
        Left = 26
        Top = 102
        Width = 366
        Height = 20
        Style = csOwnerDrawFixed
        ItemHeight = 14
        TabOrder = 0
        OnChange = cbPlanosChange
      end
      object txtTurmaPara: TEdit
        Left = 26
        Top = 54
        Width = 231
        Height = 22
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
        OnExit = txtTurmaParaExit
        OnKeyDown = txtTurmaDeKeyDown
        OnKeyPress = txtTurmaParaKeyPress
      end
      object txtAnoSemestrePara: TMaskEdit
        Left = 315
        Top = 54
        Width = 63
        Height = 22
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 2
        Text = '19931'
      end
      object UpDown2: TUpDown
        Left = 376
        Top = 53
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 3
        OnClick = UpDown2Click
      end
    end
    object lst: TListBox
      Left = 24
      Top = 150
      Width = 368
      Height = 359
      Align = alClient
      ItemHeight = 14
      TabOrder = 1
    end
  end
  object qryReservar: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'insert into Matriculas'
      '( AnoSemestre, Turma, CodigoAluno, Curso, DataEmissao, '
      'Usuario, PlanoPagamento, Situacao, SituacaoEscolar, Impresso, '
      'DataSaida, DataEntrada, PlanoDesconto, Diploma, '
      
        'TurmaDependencia, cd_ingresso, cd_matricula_curso, cd_pessoa_mat' +
        'riculou, sn_matricula_internet )'
      
        'VALUES (:AnoSemestre, :Turma, :CodigoAluno, :Curso, :DataEmissao' +
        ', '
      
        ':Usuario, :PlanoPagamento, 10 , 0, '#39#39', NULL, NULL, 0, '#39'N'#39', '#39#39', :' +
        'cd_ingresso, :cd_matricula_curso, :cd_pessoa_matriculou, :sn_mat' +
        'ricula_internet )')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_ingresso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa_matriculou'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_matricula_internet'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 469
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_ingresso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa_matriculou'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_matricula_internet'
        ParamType = ptUnknown
      end>
  end
  object tblPlanos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  pl.CD_PLANO,'
      '  pl.DS_PLANO,'
      '  pl.DT_APARTIR,'
      '  pl.NR_PARCELAS,'
      '  pl.NR_CREDITOS_BASE,'
      '  pl.NR_DIAS_PARCELA_ZERO,'
      '  pl.cd_acao_movimento_desc_cond,'
      '  pl.cd_acao_movimento_desc_fixo,'
      '  pl.cd_coligada,'
      '  pl.NR_TIPO_VENCTO,'
      '  pl.NR_FORMULA_VENCTO,'
      '  pl.NR_FORMULA_OPERADOR,'
      '  pl.NR_FORMULA_DIAS,'
      '  pl.SN_DIAS_UTEIS,'
      '  pl.SN_PULAR_SABADOS,'
      '  pl.SN_PULAR_DOMINGOS,'
      '  pl.SN_PULAR_FERIADOS'
      'FROM'
      '  fin_planos as pl'
      ''
      '    JOIN fin_planos_turmas as pt ON'
      '      (pt.CD_PLANO = pl.CD_PLANO)'
      ''
      'WHERE'
      '  pt.CD_TURMA = :turma AND'
      '  pl.NR_ANOSEMESTRE = :anosemestre AND'
      '  ('
      '    ('
      '      pl.SN_VIGENCIA = 1 AND'
      
        '      CURRENT_DATE BETWEEN DATE(pl.DT_VIGENCIA_INICIO) AND DATE(' +
        'pl.DT_VIGENCIA_FIM)'
      '    )'
      '    OR'
      '    (pl.SN_VIGENCIA = 0)'
      '  )'
      'ORDER BY'
      '  pl.DS_PLANO')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
        Value = '1AMS2'
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 19992
      end>
    Left = 176
    Top = 469
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
        Value = '1AMS2'
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 19992
      end>
  end
  object dtcPlanos: TDataSource
    DataSet = tblPlanos
    OnDataChange = dtcPlanosDataChange
    Left = 176
    Top = 429
  end
  object tblItensPagamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  i.cd_plano,'
      '  i.CD_PLANO_ITEM,'
      '  i.NR_PARCELA,'
      '  i.VL_BRUTO,'
      '  i.VL_DESCONTO,'
      '  i.VL_EXTRA,'
      '  i.VL_DESCONTO_EXTRA,'
      '  i.VL_TOTAL,'
      '  i.NR_DIA,'
      '  i.NR_MES,'
      '  i.NR_ANO,'
      '  i.NR_CREDITOS_MINIMOS,'
      
        '  IF(i.SN_CREDITO_PARCELA=1, '#39'S'#39', IF(i.SN_CREDITO_PARCELA=2, '#39'F'#39 +
        ', '#39'N'#39')) as SN_CREDITO_PARCELA,'
      '  i.CD_TIPO_PARCELA,'
      '  i.SN_DIVISIVEL,'
      '  t.cd_conta,'
      '  t.cd_tipo_titulo,'
      '  t.ds_tipo_titulo,'
      '  i.NR_FORMULA_VENCTO,'
      '  i.NR_FORMULA_OPERADOR,'
      '  i.NR_FORMULA_DIAS'
      'FROM'
      '  fin_planos_itens as i'
      ' INNER JOIN fin_planos as p ON (p.CD_PLANO = i.CD_PLANO)'
      
        ' INNER JOIN fin_config_tipos_titulo as t ON (t.cd_tipo_titulo = ' +
        'i.CD_TIPO_PARCELA AND t.cd_coligada_matriz = p.CD_COLIGADA) WHER' +
        'E i.cd_plano = :CD_PLANO'
      ' ORDER BY i.NR_PARCELA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    DataSource = dtcPlanos
    Left = 272
    Top = 469
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object xMatriculas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'SELECT ma.cd_matricula_curso, ma.codigoaluno, pe.nm_pessoa, si.d' +
        's_situacao, ma.curso from matriculas as ma'
      'INNER JOIN pessoas as pe ON (pe.cd_pessoa = ma.codigoaluno)'
      'INNER JOIN situacao as si ON (si.cd_situacao= ma.situacao)'
      'WHERE situacao not in (3,4,5,6,7,8,10)'
      '  AND ma.turma = :turma'
      '  AND ma.anosemestre = :anosemestre'
      'ORDER BY pe.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 469
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
  end
  object qryInsert: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'insert into Mensalidades '
      
        '(CodigoAluno, Parcela, DataVencimento, Turma, DataEmissao, Nosso' +
        'Numero, '
      
        'ValorBruto, ValorDesconto, DescontoExtra, ValorExtra, ValorTotal' +
        ', ValorJuros, '
      'ValorPago, DataPagamento, Situacao, Usuario, Bloqueto, '
      
        ' AnoSemestre, DataBaseCorrecao, IndiceCorrecao, Curso, Depto, Ti' +
        'poParcela, sn_credito_parcela, cd_item_plano, vl_credito, nr_cre' +
        'ditos)'
      'VALUES'
      '(:CodigoAluno, :Parcela, :DataVencimento, :Turma, :DataEmissao, '
      
        ':NossoNumero, :ValorBruto, :ValorDesconto, :DescontoExtra, :Valo' +
        'rExtra, '
      ':ValorTotal, :ValorJuros, :ValorPago, :DataPagamento, :Situacao,'
      ':Usuario, :Bloqueto, :AnoSemestre, '
      
        ':DataBaseCorrecao, :IndiceCorrecao, :Curso, :Depto, :Tipo, :sn_c' +
        'redito_parcela, :cd_item_plano, :vl_credito, :nr_creditos)')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_item_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_credito'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 469
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_item_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_credito'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos'
        ParamType = ptUnknown
      end>
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 216
    Top = 429
  end
  object qryBloqDataVencto: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  nr_dia_vencimento'
      'FROM'
      '  pessoas'
      'WHERE'
      '  cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryBloqDataVenctonr_dia_vencimento: TLargeintField
      FieldName = 'nr_dia_vencimento'
    end
  end
  object qryMatriculaCurso: TUMZQuery
    Connection = DM.db
    UpdateObject = updMatriculaCurso
    SQL.Strings = (
      'SELECT'
      '   CD_MATRICULA_CURSO,'
      '   CD_PESSOA,'
      '   NR_MATRICULA,'
      '   CD_CURSO,'
      '   CD_GRADE,'
      '   NR_ANOSEM_GRADE,'
      '   NR_ANOSEM_INGRESSO,'
      '   CD_TURNO,'
      '   DT_INGRESSO,'
      '   CD_INGRESSO,'
      '   CD_SITUACAO'
      'FROM'
      '   MATRICULAS_CURSO'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryMatriculaCursoCD_MATRICULA_CURSO: TLargeintField
      FieldName = 'CD_MATRICULA_CURSO'
      Required = True
    end
    object qryMatriculaCursoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryMatriculaCursoNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
    end
    object qryMatriculaCursoCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryMatriculaCursoCD_GRADE: TLargeintField
      FieldName = 'CD_GRADE'
    end
    object qryMatriculaCursoNR_ANOSEM_GRADE: TLargeintField
      FieldName = 'NR_ANOSEM_GRADE'
    end
    object qryMatriculaCursoNR_ANOSEM_INGRESSO: TLargeintField
      FieldName = 'NR_ANOSEM_INGRESSO'
    end
    object qryMatriculaCursoCD_TURNO: TStringField
      FieldName = 'CD_TURNO'
      Size = 1
    end
    object qryMatriculaCursoDT_INGRESSO: TDateTimeField
      FieldName = 'DT_INGRESSO'
    end
    object qryMatriculaCursoCD_INGRESSO: TLargeintField
      FieldName = 'CD_INGRESSO'
    end
    object qryMatriculaCursoCD_SITUACAO: TLargeintField
      FieldName = 'CD_SITUACAO'
    end
  end
  object updMatriculaCurso: TZUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO MATRICULAS_CURSO ('
      '   CD_PESSOA, NR_MATRICULA, CD_CURSO, CD_GRADE, NR_ANOSEM_GRADE,'
      
        '   NR_ANOSEM_INGRESSO, CD_TURNO, DT_INGRESSO, CD_INGRESSO, CD_SI' +
        'TUACAO)'
      'VALUES ('
      
        '   :CD_PESSOA, :NR_MATRICULA, :CD_CURSO, :CD_GRADE, :NR_ANOSEM_G' +
        'RADE,'
      
        '   :NR_ANOSEM_INGRESSO, :CD_TURNO, NOW(), (SELECT CD_INGRESSO FR' +
        'OM MATRICULAS_INGRESSO WHERE CD_PADRAO = 2), :CD_SITUACAO)')
    RefreshSQL.Strings = (
      'SELECT'
      '   CD_MATRICULA_CURSO,'
      '   CD_PESSOA,'
      '   NR_MATRICULA,'
      '   CD_CURSO,'
      '   CD_GRADE,'
      '   NR_ANOSEM_GRADE,'
      '   NR_ANOSEM_INGRESSO,'
      '   CD_TURNO,'
      '   DT_INGRESSO,'
      '   CD_INGRESSO,'
      '   CD_SITUACAO'
      'FROM'
      '   MATRICULAS_CURSO'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    UseSequenceFieldForRefreshSQL = False
    Left = 304
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEM_GRADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEM_INGRESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_SITUACAO'
        ParamType = ptUnknown
      end>
  end
  object qryTiposTituloDesc: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_DESCONTO_PESSOA,'
      '   CD_TIPO_TITULO,'
      '   CD_COLIGADA'
      'FROM'
      '   FIN_TP_TITULOS_PESSOAS_DESC'
      'WHERE'
      '   CD_DESCONTO_PESSOA = :CD_DESCONTO_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    object qryTiposTituloDescCD_DESCONTO_PESSOA: TIntegerField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryTiposTituloDescCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTiposTituloDescCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
  object qryProximaTurma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      #9't.cd_proxima_turma'
      'FROM '
      #9'turmas t'
      'WHERE'
      '  t.codigo = :turma AND'
      '  t.anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
        Value = '1AMS2'
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 19992
      end>
    Left = 352
    Top = 293
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
        Value = '1AMS2'
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 19992
      end>
    object qryProximaTurmacd_proxima_turma: TStringField
      FieldName = 'cd_proxima_turma'
      Size = 50
    end
  end
  object qryDadosProxTurma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  t.codigo,'
      '  t.anosemestre,'
      #9't.curso,'
      '  t.turno'
      'FROM '
      #9'turmas t'
      'WHERE'
      '  t.codigo = :turma AND'
      '  t.anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
        Value = '1AMS2'
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 19992
      end>
    Left = 352
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
        Value = '1AMS2'
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 19992
      end>
    object qryDadosProxTurmacodigo: TStringField
      FieldName = 'codigo'
      Size = 50
    end
    object qryDadosProxTurmaanosemestre: TIntegerField
      FieldName = 'anosemestre'
    end
    object qryDadosProxTurmaturno: TStringField
      FieldName = 'turno'
      Size = 1
    end
    object qryDadosProxTurmacurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
  end
  object qryDivisaoProgramada: TUMZReadOnlyQuery
    Connection = DM.db
    Params = <>
    Left = 491
    Top = 437
  end
  object qryUpdatePagamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE mensalidades'
      'SET datapagamento = CONCAT(DATE(NOW()),'#39' 00:00:00'#39')'
      'WHERE'
      '  cd_mensalidade = :mensalidade')
    Params = <
      item
        DataType = ftUnknown
        Name = 'mensalidade'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mensalidade'
        ParamType = ptUnknown
      end>
  end
  object qryDescontoProgFixo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  pd.*,'
      '  pld.percentualdesconto,'
      '  pld.valordesconto,'
      '  pld.cd_acao_movimento,'
      
        '  CASE WHEN pld.cd_tipo_desconto IS NOT NULL THEN pld.cd_tipo_de' +
        'sconto ELSE 2 END cd_tipo_desconto'
      'FROM'
      '  pessoas_descontos pd'
      
        '  INNER JOIN fin_tp_titulos_pessoas_desc tptp ON (tptp.cd_descon' +
        'to_pessoa = pd.cd_desconto_pessoa)'
      '  LEFT JOIN planosdesconto pld ON (pld.codigo = pd.cd_desconto)'
      'WHERE'
      '  pld.sn_condicional = 0 AND'
      '  pd.tp_desconto = 1 AND'
      '  COALESCE(pd.cd_curso, :cd_curso) LIKE :cd_curso AND'
      '  pd.cd_pessoa = :cd_pessoa AND'
      '  pd.cd_depto = :cd_depto AND'
      '  pd.nr_parc_inicio <= :nr_parcela AND'
      '  pd.nr_parc_fim >=  :nr_parcela AND'
      '  tptp.cd_tipo_titulo = :cd_tipo_parcela AND'
      '  CURDATE() BETWEEN pd.dt_inicio AND pd.dt_fim AND'
      
        '  CASE WHEN :cd_coligada IS NOT NULL THEN tptp.cd_coligada = :cd' +
        '_coligada ELSE 1=1 END'
      'ORDER BY'
      '   pd.cd_desconto_pessoa ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'NR_CREDITOS'
        DataType = ftFloat
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESC_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SN_DIVISIVEL'
        DataType = ftBoolean
      end
      item
        Name = 'SN_RECIBO_IMP'
        DataType = ftBoolean
      end
      item
        Name = 'SN_GERAR'
        DataType = ftBoolean
      end
      item
        Name = 'SN_PERDOAR'
        DataType = ftBoolean
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'PtrItemPlano'
        DataType = ftInteger
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftLargeint
      end
      item
        Name = 'CD_DESC_CONDICIONAL'
        DataType = ftLargeint
      end
      item
        Name = 'SN_DIVIDIDO'
        DataType = ftBoolean
      end
      item
        Name = 'VL_CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 328
    Data = {
      5D0200009619E0BD0100000018000000160000000000030000005D020E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020014000A4E525F50415243454C
      4104000100000000000B4E525F4352454449544F530800040000000000094454
      5F56454E43544F040006000000000008564C5F425255544F0800040000000100
      07535542545950450200490006004D6F6E6579000B564C5F444553434F4E544F
      080004000000010007535542545950450200490006004D6F6E6579000D564C5F
      444553435F455854524108000400000001000753554254595045020049000600
      4D6F6E65790008564C5F45585452410800040000000100075355425459504502
      00490006004D6F6E6579000E43445F524553504F4E534156454C040001000000
      00000E4E4D5F524553504F4E534156454C010049000000010005574944544802
      00020040000C534E5F44495649534956454C02000300000000000D534E5F5245
      4349424F5F494D50020003000000000008534E5F474552415202000300000000
      000A534E5F504552444F415202000300000000000843445F434F4E5441040001
      00000000000C5074724974656D506C616E6F04000100000000001143445F4143
      414F5F4D4F56494D454E544F08000100000000001343445F444553435F434F4E
      444943494F4E414C08000100000000000B534E5F444956494449444F02000300
      000000000A564C5F4352454449544F0800040000000100075355425459504502
      00490006004D6F6E6579000B4944585F50415243454C41040001000000000000
      00}
    object cdsParcelasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
    end
    object cdsParcelasNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasNR_CREDITOS: TFloatField
      FieldName = 'NR_CREDITOS'
    end
    object cdsParcelasDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_DESC_EXTRA: TCurrencyField
      FieldName = 'VL_DESC_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsParcelasNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 64
    end
    object cdsParcelasSN_DIVISIVEL: TBooleanField
      FieldName = 'SN_DIVISIVEL'
    end
    object cdsParcelasSN_RECIBO_IMP: TBooleanField
      FieldName = 'SN_RECIBO_IMP'
    end
    object cdsParcelasSN_GERAR: TBooleanField
      FieldName = 'SN_GERAR'
    end
    object cdsParcelasSN_PERDOAR: TBooleanField
      FieldName = 'SN_PERDOAR'
    end
    object cdsParcelasCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasPtrItemPlano: TIntegerField
      FieldName = 'PtrItemPlano'
    end
    object cdsParcelasCD_ACAO_MOVIMENTO: TLargeintField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsParcelasCD_DESC_CONDICIONAL: TLargeintField
      FieldName = 'CD_DESC_CONDICIONAL'
    end
    object cdsParcelasVENC_ATUAL: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'VENC_ATUAL'
      Calculated = True
    end
    object cdsParcelasSN_DIVIDIDO: TBooleanField
      FieldName = 'SN_DIVIDIDO'
    end
    object cdsParcelasVL_CREDITO: TCurrencyField
      FieldName = 'VL_CREDITO'
    end
    object cdsParcelasIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
  end
  object cdsDescontos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_DESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_COMPORTAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DS_OBSERVACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'SN_DESCONTO_PLANO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 522
    Top = 328
    Data = {
      E30000009619E0BD010000001800000007000000000003000000E3000B564C5F
      444553434F4E544F080004000000010007535542545950450200490006004D6F
      6E6579001143445F4143414F5F4D4F56494D454E544F04000100000000001043
      445F5449504F5F444553434F4E544F04000100000000001543445F5449504F5F
      434F4D504F5254414D454E544F04000100000000000D44535F4F425345525641
      43414F020049000000010005574944544802000200FF000B4944585F50415243
      454C41040001000000000011534E5F444553434F4E544F5F504C414E4F040001
      00000000000000}
    object cdsDescontosVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDescontosCD_ACAO_MOVIMENTO: TIntegerField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsDescontosCD_TIPO_DESCONTO: TIntegerField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object cdsDescontosCD_TIPO_COMPORTAMENTO: TIntegerField
      FieldName = 'CD_TIPO_COMPORTAMENTO'
    end
    object cdsDescontosDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object cdsDescontosIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
    object cdsDescontosSN_DESCONTO_PLANO: TIntegerField
      FieldName = 'SN_DESCONTO_PLANO'
    end
  end
  object qryDescontoProgCondicional: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  pd.*,'
      '  pld.percentualdesconto,'
      '  pld.valordesconto,'
      '  pld.cd_acao_movimento,'
      
        '  CASE WHEN pld.cd_tipo_desconto IS NOT NULL THEN pld.cd_tipo_de' +
        'sconto ELSE 2 END cd_tipo_desconto'
      'FROM'
      '  pessoas_descontos pd'
      
        '  INNER JOIN fin_tp_titulos_pessoas_desc tptp ON (tptp.cd_descon' +
        'to_pessoa = pd.cd_desconto_pessoa)'
      '  LEFT JOIN planosdesconto pld ON (pld.codigo = pd.cd_desconto)'
      'WHERE'
      '  (pld.sn_condicional = 1 OR pld.codigo IS NULL) AND'
      '  pd.tp_desconto = 1 AND'
      '  COALESCE(pd.cd_curso, :cd_curso) LIKE :cd_curso AND'
      '  pd.cd_pessoa = :cd_pessoa AND'
      '  pd.cd_depto = :cd_depto AND'
      '  pd.nr_parc_inicio <= :nr_parcela AND'
      '  pd.nr_parc_fim >=  :nr_parcela AND'
      '  tptp.cd_tipo_titulo = :cd_tipo_parcela AND'
      '  CURDATE() BETWEEN pd.dt_inicio AND pd.dt_fim AND'
      
        '  CASE WHEN :cd_coligada IS NOT NULL THEN tptp.cd_coligada = :cd' +
        '_coligada ELSE 1=1 END'
      'ORDER BY'
      '   pd.cd_desconto_pessoa ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 520
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qryAcoesMovimentoFixo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cr.cd_acao,'
      '  cr.vl_saida,'
      '  cr.cd_coligada,'
      '  cr.ds_observacao,'
      '  cr.sn_desc_plano_pagamento'
      'FROM'
      '  fin_mov_cr cr'
      
        '  INNER JOIN fin_acoes_movimento as am ON (cr.cd_acao = am.cd_ac' +
        'ao)'
      'WHERE'
      '  am.cd_tipo_acao = 3'
      '  AND am.cd_origem = 1'
      '  AND cr.sn_desc_condicional = 0'
      
        '  AND COALESCE(cr.cd_mensalidade_origem, cr.cd_mensalidade) = :c' +
        'd_mensalidade_origem'
      'ORDER BY'
      '  cr.nr_sequencia ASC  ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
  end
  object qryAcoesMovimentoCondicional: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cr.cd_acao,'
      '  cr.vl_desconto,'
      '  cr.cd_coligada,'
      '  cr.ds_observacao,'
      '  cr.sn_desc_plano_pagamento'
      'FROM'
      '  fin_mov_cr cr'
      
        '  INNER JOIN fin_acoes_movimento as am ON (cr.cd_acao = am.cd_ac' +
        'ao)  '
      'WHERE'
      '  am.cd_tipo_acao = 3'
      '  AND am.cd_origem = 1'
      '  AND cr.sn_desc_condicional = 1'
      
        '  AND COALESCE(cr.cd_mensalidade_origem, cr.cd_mensalidade) = :c' +
        'd_mensalidade_origem'
      'ORDER BY'
      '  cr.nr_sequencia ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
  end
end
