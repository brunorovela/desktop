object fHistoricoEliminEqui: TfHistoricoEliminEqui
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Hist'#243'rico de elimina'#231#227'o de aproveitamento de disciplinas'
  ClientHeight = 616
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 20
    Width = 587
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 296
    ExplicitTop = 328
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 175
    Width = 587
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 360
    ExplicitTop = 512
    ExplicitWidth = 50
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 591
    Width = 587
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitLeft = 248
    ExplicitTop = 560
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = 'HIST'#211'RICO DE ELIMINA'#199#195'O DE APROVEITAMENTO DE DISCIPLINAS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 622
  end
  object pnlListagem: TPanel
    Left = 0
    Top = 23
    Width = 587
    Height = 152
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 25
    ExplicitWidth = 622
    object dbgLogEquivalencias: TDBGrid
      Left = 0
      Top = 0
      Width = 587
      Height = 152
      Align = alClient
      DataSource = dsLogEquivalencias
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DT_LOG'
          Title.Caption = 'Data'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_CARGA_HORARIA_EQ'
          Title.Caption = 'C.H.'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_NOTA_EQ'
          Title.Caption = 'Nota'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CONCEITO_EQ'
          Title.Caption = 'Conceito'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_FREQUENCIA_EQ'
          Title.Caption = 'Frequ'#234'ncia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_CONTEUDO_EQ'
          Title.Caption = 'Conte'#250'do eq.'
          Visible = True
        end>
    end
  end
  object tlbOpcoes: TToolBar
    Left = 0
    Top = 594
    Width = 587
    Height = 22
    Align = alBottom
    ButtonWidth = 81
    Caption = 'tlbOpcoes'
    DrawingStyle = dsGradient
    Images = ilOpcoes
    List = True
    ShowCaptions = True
    TabOrder = 2
    ExplicitTop = 609
    ExplicitWidth = 627
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'btnSep1'
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 8
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 0
      OnClick = btnFecharClick
    end
    object btnSep2: TToolButton
      Left = 89
      Top = 0
      Width = 8
      Caption = 'btnSep2'
      ImageIndex = 0
      Style = tbsSeparator
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 178
    Width = 587
    Height = 413
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 40
    ExplicitTop = 217
    ExplicitWidth = 622
    ExplicitHeight = 487
    object lblCurso: TLabel
      Left = 8
      Top = 6
      Width = 28
      Height = 13
      Caption = 'Curso'
      FocusControl = dbeCurso
    end
    object lblDisciplina: TLabel
      Left = 121
      Top = 6
      Width = 43
      Height = 13
      Caption = 'Disciplina'
      FocusControl = dbeDisciplina
    end
    object lblSituacao: TLabel
      Left = 8
      Top = 207
      Width = 41
      Height = 13
      Caption = 'Situa'#231#227'o'
      FocusControl = dbeSituacao
    end
    object lblMotivo: TLabel
      Left = 8
      Top = 250
      Width = 99
      Height = 13
      Caption = 'Motivo da elimina'#231#227'o'
      FocusControl = dbmMotivo
    end
    object dbeCurso: TDBEdit
      Left = 8
      Top = 22
      Width = 107
      Height = 21
      DataField = 'CD_CURSO'
      DataSource = dsLogEquivalencias
      TabOrder = 0
    end
    object dbeDisciplina: TDBEdit
      Left = 121
      Top = 22
      Width = 441
      Height = 21
      DataField = 'DS_DISCIPLINA'
      DataSource = dsLogEquivalencias
      TabOrder = 1
    end
    object gbEquivalencia: TGroupBox
      Left = 8
      Top = 49
      Width = 569
      Height = 152
      Caption = 'Disciplina equivalente'
      TabOrder = 2
      object lblInstituicaoEq: TLabel
        Left = 8
        Top = 20
        Width = 99
        Height = 13
        Caption = 'Institui'#231#227'o de ensino'
        FocusControl = dbeInstituicaoEq
      end
      object lblAnoSemestreEq: TLabel
        Left = 480
        Top = 20
        Width = 67
        Height = 13
        Caption = 'Ano/semestre'
        FocusControl = dbeAnoSemestreEq
      end
      object lblCursoEq: TLabel
        Left = 8
        Top = 63
        Width = 28
        Height = 13
        Caption = 'Curso'
        FocusControl = dbeCursoEq
      end
      object lblDisciplinaEq: TLabel
        Left = 284
        Top = 63
        Width = 43
        Height = 13
        Caption = 'Disciplina'
        FocusControl = dbeDisciplinaEq
      end
      object lblProfessorEq: TLabel
        Left = 8
        Top = 106
        Width = 46
        Height = 13
        Caption = 'Professor'
        FocusControl = dbeProfessorEq
      end
      object dbeInstituicaoEq: TDBEdit
        Left = 8
        Top = 36
        Width = 466
        Height = 21
        DataField = 'NM_INSTITUICAO_EQ'
        DataSource = dsLogEquivalencias
        TabOrder = 0
      end
      object dbeAnoSemestreEq: TDBEdit
        Left = 480
        Top = 36
        Width = 74
        Height = 21
        DataField = 'NR_ANOSEMESTRE_EQ'
        DataSource = dsLogEquivalencias
        TabOrder = 1
      end
      object dbeCursoEq: TDBEdit
        Left = 8
        Top = 79
        Width = 270
        Height = 21
        DataField = 'CD_CURSO'
        DataSource = dsLogEquivalencias
        TabOrder = 2
      end
      object dbeDisciplinaEq: TDBEdit
        Left = 284
        Top = 79
        Width = 270
        Height = 21
        DataField = 'NM_DISCIPLINA_EQ'
        DataSource = dsLogEquivalencias
        TabOrder = 3
      end
      object dbeProfessorEq: TDBEdit
        Left = 8
        Top = 122
        Width = 546
        Height = 21
        DataField = 'NM_PROFESSOR'
        DataSource = dsLogEquivalencias
        TabOrder = 4
      end
    end
    object dbeSituacao: TDBEdit
      Left = 8
      Top = 223
      Width = 554
      Height = 21
      DataField = 'DS_SITUACAO'
      DataSource = dsLogEquivalencias
      TabOrder = 3
    end
    object dbmMotivo: TDBMemo
      Left = 8
      Top = 269
      Width = 554
      Height = 132
      DataField = 'TX_MOTIVO'
      DataSource = dsLogEquivalencias
      ScrollBars = ssBoth
      TabOrder = 4
    end
  end
  object qryLogEquivalencias: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DT_LOG'
    SortType = stDescending
    SQL.Strings = (
      'SELECT'
      '   L.CD_EQUIVALENCIA_LOG,'
      '   L.CD_USUARIO,'
      '   L.DT_LOG,'
      '   L.CD_SITUACAO,'
      '   L.CD_ALUNO,'
      '   L.CD_DISCIPLINA,'
      '   L.CD_CURSO,'
      '   L.CD_PROFESSOR_EQ,'
      '   L.NM_INSTITUICAO_EQ,'
      '   L.NM_CURSO_EQ,'
      '   L.NM_DISCIPLINA_EQ,'
      '   L.NR_ANOSEMESTRE_EQ,'
      '   L.VL_CARGA_HORARIA_EQ,'
      '   L.VL_NOTA_EQ,'
      '   L.VL_FREQUENCIA_EQ,'
      '   L.VL_CONTEUDO_EQ,'
      '   L.DS_CONCEITO_EQ,'
      '   L.TP_ACAO,'
      '   L.TX_MOTIVO,'
      '   U.NM_PESSOA NM_USUARIO,'
      '   P.NM_PESSOA NM_PROFESSOR,'
      '   S.DS_VALOR DS_SITUACAO,'
      '   D.DESCRICAO DS_DISCIPLINA'
      'FROM'
      '   UNI_EQUIVALENCIAS_LOGS L'
      ''
      '      JOIN PESSOAS U ON'
      '         (L.CD_USUARIO = U.CD_PESSOA)'
      ''
      '      LEFT JOIN PESSOAS P ON'
      '         (L.CD_PROFESSOR_EQ = P.CD_PESSOA)'
      ''
      '      JOIN SITUACOES S ON'
      '         (L.CD_SITUACAO = S.CD_SITUACAO)'
      ''
      '      JOIN DISCIPLINAS D ON'
      '         (L.CD_DISCIPLINA = D.CODIGO) AND'
      '         (L.CD_CURSO = D.CURSO)'
      'WHERE'
      '   L.CD_ALUNO = :CD_ALUNO AND'
      '   S.CD_MODULO = 1010')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DT_LOG Desc'
    Left = 352
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ALUNO'
        ParamType = ptUnknown
      end>
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
      Required = True
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
    object qryLogEquivalenciasNM_DISCIPLINA_EQ: TStringField
      FieldName = 'NM_DISCIPLINA_EQ'
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
      DisplayFormat = '###,###,##0.00 %'
    end
    object qryLogEquivalenciasVL_CONTEUDO_EQ: TFloatField
      FieldName = 'VL_CONTEUDO_EQ'
      DisplayFormat = '###,###,##0.00 %'
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
      Required = True
      BlobType = ftMemo
    end
    object qryLogEquivalenciasNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 60
    end
    object qryLogEquivalenciasNM_PROFESSOR: TStringField
      FieldName = 'NM_PROFESSOR'
      Size = 60
    end
    object qryLogEquivalenciasDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      Size = 255
    end
    object qryLogEquivalenciasDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      Size = 150
    end
  end
  object dsLogEquivalencias: TDataSource
    AutoEdit = False
    DataSet = qryLogEquivalencias
    Left = 304
    Top = 128
  end
  object ilOpcoes: TImageList
    Left = 248
    Top = 336
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000E3FF000000000000
      83FF000000000000000F000000000000003F000000000000002F000000000000
      000F000000000000000F00000000000000010000000000000001000000000000
      0001000000000000000F000000000000000F000000000000002F000000000000
      803F000000000000E3FF000000000000}
  end
end
