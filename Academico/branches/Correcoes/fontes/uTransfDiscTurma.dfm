object frmTransfDisc: TfrmTransfDisc
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Transfer'#234'ncia de Disciplina'
  ClientHeight = 400
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnTitulo: TPanel
      Left = 0
      Top = 0
      Width = 686
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'TRANSFER'#202'NCIA DE DISCIPLINA'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnFooter: TPanel
      Left = 0
      Top = 362
      Width = 686
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnCancel: TBitBtn
        Left = 579
        Top = 6
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object btnOk: TBitBtn
        Left = 498
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Ok'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        OnClick = btnOkClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 95
      Width = 686
      Height = 267
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object grd: TDBGrid
        Left = 0
        Top = 0
        Width = 686
        Height = 267
        Align = alClient
        DataSource = dtcListaTurmaDisc
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 251
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_turma'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_curso'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'etapa'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtd_vagas'
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 25
      Width = 686
      Height = 70
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object Label1: TLabel
        Left = 25
        Top = 10
        Width = 37
        Height = 16
        Caption = 'Aluno:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 15
        Top = 6
        Width = 639
        Height = 23
      end
      object lblNomeAluno: TLabel
        Left = 64
        Top = 10
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 25
        Top = 35
        Width = 47
        Height = 13
        Caption = 'Ano/Sem:'
      end
      object txtAnoSemestre: TMaskEdit
        Left = 78
        Top = 32
        Width = 55
        Height = 22
        Enabled = False
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '19931'
      end
    end
  end
  object qryListaTurmaDisc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9't2.codigo cd_turma,'
      #9't2.curso cd_curso,'#9
      #9't2.serie etapa,'
      ' '#9'd.descricao,'
      '  FCD_GET_RESTRICAO_DISCIPLINA('
      '      :CD_PESSOA,'
      '      gd2.CD_CURSO,'
      '      t2.codigo,'
      '      gd2.CD_DISCIPLINA,'
      '      gd2.NR_SERIE,'
      '      gd2.CD_GRADE,'
      '      t2.ANOSEMESTRE,'
      '      :SN_MOSTRA_HORARIOS'
      '  ) nr_restricao,'
      '  COALESCE( t2.vagas -'
      '  ('
      '    SELECT'
      '     COUNT(ff1.codigoaluno) nr_vagas_preenchidas'
      '    FROM'
      '     fichaindividual ff1'
      '    WHERE'
      '     ff1.curso = t2.curso'
      '    AND'
      '     ff1.turmamatricula = t2.codigo'
      '    AND'
      '     ff1.anosemestre = t2.anosemestre'
      '    AND'
      '    ff1.serie = gd2.NR_SERIE'
      '    AND'
      '     ff1.disciplina = gd2.CD_DISCIPLINA'
      '    AND'
      '     ff1.situacao not IN (3,4,5,6,7,8,14,15,-8)'
      '  ), 0 ) qtd_vagas,'
      '  t2.vagas qtd_vagas_total'
      'FROM'
      #9'turmas t '
      #9'INNER JOIN grades_disciplinas gd ON ('
      #9#9'gd.CD_GRADE = t.cd_grade AND'
      #9#9't.curso = gd.cd_curso and'
      #9#9't.serie = gd.NR_SERIE'
      #9')'
      #9'INNER JOIN disciplinas d ON ('
      #9#9'd.codigo = gd.cd_disciplina'
      #9#9'AND d.curso = gd.cd_curso'
      #9')  '
      #9'LEFT JOIN grades_disciplinas gd2 on ('
      #9#9't.serie = gd2.NR_SERIE and'
      #9#9'gd.CD_DISCIPLINA = gd2.CD_DISCIPLINA AND'#9
      #9#9'gd.CD_CURSO = gd2.CD_CURSO'
      #9')'
      #9'LEFT JOIN turmas t2 on ('
      #9#9't2.cd_grade = gd2.CD_GRADE AND'
      #9#9't2.curso = gd2.CD_CURSO AND'#9
      #9#9't2.serie = gd2.nr_serie AND'#9
      #9#9't2.anosemestre = t.anosemestre AND'#9
      #9#9't2.codigo != t.codigo'
      #9')'
      'WHERE '
      #9't.codigo = :turma and'
      #9't.anosemestre = :anosemestre and'
      #9'gd.CD_DISCIPLINA = :disciplina AND'
      #9't2.codigo IS NOT NULL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_MOSTRA_HORARIOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_MOSTRA_HORARIOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    object qryListaTurmaDiscdescricao: TStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'descricao'
      Size = 255
    end
    object qryListaTurmaDisccd_turma: TStringField
      DisplayLabel = 'Turma'
      FieldName = 'cd_turma'
      Size = 55
    end
    object qryListaTurmaDisccd_curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'cd_curso'
    end
    object qryListaTurmaDiscetapa: TIntegerField
      DisplayLabel = 'Etapa'
      FieldName = 'etapa'
    end
    object qryListaTurmaDiscnr_restricao: TIntegerField
      FieldName = 'nr_restricao'
    end
    object qryListaTurmaDiscqtd_vagas: TLargeintField
      DisplayLabel = 'Qtd. Vagas'
      FieldName = 'qtd_vagas'
    end
    object qryListaTurmaDiscqtd_vagas_total: TIntegerField
      FieldName = 'qtd_vagas_total'
    end
  end
  object dtcListaTurmaDisc: TDataSource
    DataSet = qryListaTurmaDisc
    Left = 48
    Top = 240
  end
  object UMZQuery1: TUMZQuery
    Params = <>
    Left = 16
    Top = 272
  end
  object qryQtdVagasPreechidas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   COUNT(f.codigoaluno) nr_vagas_preenchidas '
      'FROM '
      '   fichaindividual f'
      '   INNER JOIN turmas t ON ( '
      '      t.codigo = f.turma AND'
      '      t.anosemestre = f.anosemestre AND'#9#9
      #9#9'  t.curso = f.curso AND'
      #9#9'  t.serie = f.serie'
      '   )'
      'WHERE'
      '   t.curso  = :cd_curso AND'
      '   t.codigo = :cd_turma  AND'
      '   t.anosemestre = :anosemestre AND'
      '   f.serie = :etapa  AND'
      '   f.disciplina = :disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
  end
end
