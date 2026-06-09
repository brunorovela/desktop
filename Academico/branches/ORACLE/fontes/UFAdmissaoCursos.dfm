object frmAdmissaoCursos: TfrmAdmissaoCursos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sele'#231#227'o de Cursos'
  ClientHeight = 634
  ClientWidth = 928
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 8
  Padding.Top = 3
  Padding.Right = 8
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnConfirmar: TBitBtn
    Left = 832
    Top = 606
    Width = 88
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    Kind = bkOK
  end
  object pnlGeral: TPanel
    Left = 8
    Top = 3
    Width = 912
    Height = 600
    Align = alTop
    Padding.Left = 8
    Padding.Top = 3
    Padding.Right = 8
    Padding.Bottom = 3
    TabOrder = 1
    object splSep1: TSplitter
      Left = 401
      Top = 4
      Height = 592
      ExplicitLeft = 440
      ExplicitTop = 360
      ExplicitHeight = 100
    end
    object pnlSelecionado: TPanel
      Left = 404
      Top = 4
      Width = 499
      Height = 592
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 8
      Padding.Top = 3
      Padding.Right = 8
      Padding.Bottom = 3
      TabOrder = 0
      object lblSelecionado: TLabel
        Left = 8
        Top = 3
        Width = 483
        Height = 13
        Align = alTop
        Caption = 'Cursos selecionados'
        ExplicitWidth = 97
      end
      object bvlSep5: TBevel
        Left = 8
        Top = 16
        Width = 483
        Height = 3
        Align = alTop
        Shape = bsTopLine
        ExplicitLeft = 248
        ExplicitTop = 48
        ExplicitWidth = 50
      end
      object dbgCursoCampo: TZSortedGrid
        Left = 8
        Top = 19
        Width = 483
        Height = 570
        Align = alClient
        DataSource = dsCursoCampo
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEditButtonClick = dbgCursoCampoEditButtonClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_CURSO'
            Title.Caption = 'Curso'
            Width = 192
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_HORAS'
            Title.Caption = 'Horas'
            Width = 48
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'DS_CENTRO'
            Title.Caption = 'Centro de Custo'
            Width = 192
            Visible = True
          end>
      end
    end
    object pnlEsquerda: TPanel
      Left = 9
      Top = 4
      Width = 392
      Height = 592
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object bvlSep1: TBevel
        Left = 389
        Top = 0
        Width = 3
        Height = 592
        Align = alRight
        Shape = bsRightLine
        ExplicitLeft = 368
      end
      object bvlSep2: TBevel
        Left = 355
        Top = 0
        Width = 3
        Height = 592
        Align = alRight
        Shape = bsLeftLine
        ExplicitLeft = 182
      end
      object pnlCursos: TPanel
        Left = 0
        Top = 0
        Width = 355
        Height = 592
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 8
        Padding.Top = 3
        Padding.Right = 8
        Padding.Bottom = 3
        TabOrder = 0
        object lblDisponivel: TLabel
          Left = 8
          Top = 3
          Width = 339
          Height = 13
          Align = alTop
          Caption = 'Cursos dispon'#237'veis'
          ExplicitWidth = 88
        end
        object bvlSep3: TBevel
          Left = 8
          Top = 16
          Width = 339
          Height = 3
          Align = alTop
          Shape = bsTopLine
          ExplicitLeft = 120
          ExplicitTop = 144
          ExplicitWidth = 50
        end
        object bvlSep4: TBevel
          Left = 8
          Top = 563
          Width = 339
          Height = 3
          Align = alBottom
          Shape = bsBottomLine
          ExplicitLeft = 168
          ExplicitTop = 144
          ExplicitWidth = 50
        end
        object pnlFiltros: TPanel
          Left = 8
          Top = 566
          Width = 339
          Height = 23
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object rbCursosProfessor: TRadioButton
            Left = 6
            Top = 3
            Width = 185
            Height = 17
            Caption = 'Exibir apenas cursos do professor'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rbCursosProfessorClick
          end
          object rbCursosTodos: TRadioButton
            Left = 197
            Top = 3
            Width = 129
            Height = 17
            Caption = 'Exibir todos os cursos'
            TabOrder = 1
            OnClick = rbCursosTodosClick
          end
        end
        object dbgCursos: TZSortedGrid
          Left = 8
          Top = 19
          Width = 339
          Height = 544
          Align = alClient
          DataSource = dsCursos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NM_CURSO'
              Title.Caption = 'Curso'
              Width = 256
              Visible = True
            end>
        end
      end
      object pnlOpcoes: TPanel
        Left = 358
        Top = 0
        Width = 31
        Height = 592
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnSelecionar: TButton
          Left = 3
          Top = 246
          Width = 25
          Height = 25
          Caption = '>'
          TabOrder = 0
          OnClick = btnSelecionarClick
        end
        object btnSelecionarTodos: TButton
          Left = 3
          Top = 271
          Width = 25
          Height = 25
          Caption = '>>'
          TabOrder = 1
          OnClick = btnSelecionarTodosClick
        end
        object btnRemover: TButton
          Left = 3
          Top = 296
          Width = 25
          Height = 25
          Caption = '<'
          TabOrder = 2
          OnClick = btnRemoverClick
        end
        object btnRemoverTodos: TButton
          Left = 3
          Top = 321
          Width = 25
          Height = 25
          Caption = '<<'
          TabOrder = 3
          OnClick = btnRemoverTodosClick
        end
      end
    end
  end
  object qryCursos: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NM_CURSO'
    Filter = 'SN_LECIONA'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  M.`CD_CURSO` `CD_CURSO_MESTRE`,'
      '  COALESCE(M.`DS_APELIDO`, M.`DS_CURSO`) `NM_CURSO`,'
      '  P.`CURSO` IS NOT NULL `SN_LECIONA`'
      'FROM'
      '  `CURSOS_MESTRE` M'
      ''
      '    LEFT JOIN `PROFESSORESDISCIPLINAS` P ON'
      '      (M.`CD_CURSO` = P.`CURSO`) AND'
      '      (P.`PROFESSOR` = :CD_PESSOA)'
      ''
      'WHERE'
      '  M.`SN_ATIVO` = '#39'S'#39' AND'
      '  NOT EXISTS ('
      '    SELECT'
      '      C.`CD_ADMISSAO_HISTORICO`'
      '    FROM'
      '      `ADMISSAO_HISTORICO_CAMPO_CURSO` C'
      '    WHERE'
      '      M.`CD_CURSO` = C.`CD_CURSO` AND'
      '      C.`CD_ADMISSAO_HISTORICO` = :CD_ADMISSAO_HISTORICO AND'
      '      C.`CD_ADMISSAO_CAMPO` = :CD_ADMISSAO_CAMPO'
      '  )'
      'GROUP BY'
      '  M.`CD_CURSO`')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_CURSO Asc'
    Left = 56
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end>
    object qryCursosCD_CURSO_MESTRE: TStringField
      FieldName = 'CD_CURSO_MESTRE'
      ReadOnly = True
      Size = 15
    end
    object qryCursosNM_CURSO: TStringField
      FieldName = 'NM_CURSO'
      ReadOnly = True
      Size = 255
    end
    object qryCursosSN_LECIONA: TLargeintField
      FieldName = 'SN_LECIONA'
      ReadOnly = True
    end
  end
  object dsCursos: TDataSource
    DataSet = qryCursos
    Left = 88
    Top = 96
  end
  object qryCursoCampo: TUMZQuery
    Connection = DM.db
    SortedFields = 'NM_CURSO'
    UpdateObject = updCursoCampo
    SQL.Strings = (
      'SELECT'
      '  C.`CD_ADMISSAO_HISTORICO`,'
      '  C.`CD_ADMISSAO_CAMPO`,'
      '  C.`CD_CURSO`,'
      '  C.`VL_HORAS`,'
      '  C.`CD_CENTRO`,'
      '  C.`CD_COLIGADA_MATRIZ`,'
      '  A.`SN_HORAS`,'
      '  A.`SN_CURSOS`,'
      '  A.`SN_CENTRO_CUSTO`,'
      '  COALESCE(M.`DS_APELIDO`, M.`DS_CURSO`) `NM_CURSO`,'
      '  F.`DS_CENTRO`'
      'FROM'
      '  `ADMISSAO_HISTORICO_CAMPO_CURSO` C'
      ''
      '    JOIN `CURSOS_MESTRE` M ON'
      '      (C.`CD_CURSO` = M.`CD_CURSO`)'
      ''
      '    JOIN `ADMISSAO_CAMPO` A ON'
      '      (C.`CD_ADMISSAO_CAMPO` = A.`CD_ADMISSAO_CAMPO`)'
      ''
      '    LEFT JOIN `FIN_CONFIG_CENTRO_CUSTOS` F ON'
      '      (C.`CD_CENTRO` = F.`CD_CENTRO`) AND'
      '      (C.`CD_COLIGADA_MATRIZ` = F.`CD_COLIGADA_MATRIZ`)'
      '      '
      'WHERE'
      '  C.`CD_ADMISSAO_HISTORICO` = :CD_ADMISSAO_HISTORICO AND'
      '  C.`CD_ADMISSAO_CAMPO` = :CD_ADMISSAO_CAMPO AND'
      '  EXISTS ('
      '    SELECT'
      '      H.`CD_ADMISSAO_HISTORICO`'
      '    FROM'
      '      `ADMISSAO_HISTORICO` H'
      ''
      '        JOIN `ADMISSAO` A ON'
      '          (H.`CD_ADMISSAO` = A.`CD_ADMISSAO`)'
      '    WHERE'
      '      C.`CD_ADMISSAO_HISTORICO` = H.`CD_ADMISSAO_HISTORICO` AND'
      '      A.`CD_PESSOA` = :CD_PESSOA'
      '  )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_CURSO Asc'
    Left = 496
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryCursoCampoCD_ADMISSAO_HISTORICO: TLargeintField
      FieldName = 'CD_ADMISSAO_HISTORICO'
      Required = True
    end
    object qryCursoCampoCD_ADMISSAO_CAMPO: TSmallintField
      FieldName = 'CD_ADMISSAO_CAMPO'
      Required = True
    end
    object qryCursoCampoCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryCursoCampoVL_HORAS: TFloatField
      FieldName = 'VL_HORAS'
    end
    object qryCursoCampoCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object qryCursoCampoCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
    end
    object qryCursoCampoSN_HORAS: TSmallintField
      FieldName = 'SN_HORAS'
      Required = True
    end
    object qryCursoCampoSN_CURSOS: TSmallintField
      FieldName = 'SN_CURSOS'
      Required = True
    end
    object qryCursoCampoSN_CENTRO_CUSTO: TSmallintField
      FieldName = 'SN_CENTRO_CUSTO'
      Required = True
    end
    object qryCursoCampoNM_CURSO: TStringField
      FieldName = 'NM_CURSO'
      ReadOnly = True
      Size = 255
    end
    object qryCursoCampoDS_CENTRO: TStringField
      FieldName = 'DS_CENTRO'
      Size = 255
    end
  end
  object dsCursoCampo: TDataSource
    DataSet = qryCursoCampo
    Left = 528
    Top = 96
  end
  object updCursoCampo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM `ADMISSAO_HISTORICO_CAMPO_CURSO`'
      'WHERE'
      '        `CD_ADMISSAO_HISTORICO` = :CD_ADMISSAO_HISTORICO AND'
      '        `CD_ADMISSAO_CAMPO` = :CD_ADMISSAO_CAMPO AND'
      '        `CD_CURSO` = :CD_CURSO')
    InsertSQL.Strings = (
      'INSERT INTO `ADMISSAO_HISTORICO_CAMPO_CURSO` ('
      '        `CD_ADMISSAO_HISTORICO`,'
      '        `CD_ADMISSAO_CAMPO`,'
      '        `CD_CURSO`'
      ') VALUES ('
      '        :CD_ADMISSAO_HISTORICO,'
      '        :CD_ADMISSAO_CAMPO,'
      '        :CD_CURSO'
      ')')
    ModifySQL.Strings = (
      'UPDATE `ADMISSAO_HISTORICO_CAMPO_CURSO`'
      'SET'
      '        `CD_CENTRO` = :CD_CENTRO,'
      '        `CD_COLIGADA_MATRIZ` = :CD_COLIGADA_MATRIZ,'
      '        `VL_HORAS` = :VL_HORAS'
      'WHERE'
      '        `CD_ADMISSAO_HISTORICO` = :CD_ADMISSAO_HISTORICO AND'
      '        `CD_ADMISSAO_CAMPO` = :CD_ADMISSAO_CAMPO AND'
      '        `CD_CURSO` = :CD_CURSO')
    UseSequenceFieldForRefreshSQL = False
    Left = 496
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_HORAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end>
  end
  object qryCampo: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `SN_HORAS`,'
      '  `SN_CENTRO_CUSTO`'
      'FROM'
      '  `ADMISSAO_CAMPO`'
      'WHERE'
      '  `CD_ADMISSAO_CAMPO` = :CD_ADMISSAO_CAMPO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ADMISSAO_CAMPO'
        ParamType = ptUnknown
      end>
    object qryCampoSN_HORAS: TSmallintField
      FieldName = 'SN_HORAS'
      Required = True
    end
    object qryCampoSN_CENTRO_CUSTO: TSmallintField
      FieldName = 'SN_CENTRO_CUSTO'
      Required = True
    end
  end
end
