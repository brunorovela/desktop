object frmCadProvasAlunos: TfrmCadProvasAlunos
  Left = 297
  Top = 245
  Caption = 'Alunos cadastrados para a prova'
  ClientHeight = 475
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 49
      Width = 518
      Height = 391
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object grd: TDBGrid
        Left = 0
        Top = 0
        Width = 518
        Height = 391
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtcCursos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        PopupMenu = pmQtd
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_PESSOA'
            Title.Caption = 'C'#243'digo'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PESSOA'
            Title.Caption = 'Nome'
            Width = 228
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SN_RESPONDEU'
            Title.Alignment = taCenter
            Title.Caption = 'Resp.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_NOME_GABARITO'
            Title.Caption = 'Gabarito'
            Width = 136
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 440
      Width = 518
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        518
        35)
      object btnImprimir: TSpeedButton
        Left = 235
        Top = 6
        Width = 89
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Imprimir'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000001F7C10421042000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000D5561F7CCE39000000001042CE3900001F7C
          1F7C1F7C1F7C1F7C1F7C1042CE39396739671F7C744E524A524A10420000CE39
          00001F7C1F7C1F7C1042CE395A6B39671F7C1F7C744E524A524A524A10420000
          00001F7C1F7C1F7C1042DE7B39671F7C1F7CDE7B524A744E524A104210421042
          CE3900001F7C1F7C1042DE7B1F7CDE7BDE7B396739673967524A524A1042CE39
          CE3900001F7C1F7C1042DE7BDE7B5A6B5A6B007C0564396739671F7C10421042
          CE3900001F7C1F7C1042DE7B7B6FE0034032396739675A6BCE3910420000CE39
          CE3900001F7C1F7C1F7C104210427B6F5A6B5A6B1042CE391F7C1F7C0000CE39
          CE391F7C1F7C1F7C1F7C1F7C1F7C1042DE7BCE391F7C1F7C7B6F9B6F7B6F1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10429B6FBC73BD77DE7B7B6F
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042BD77BD77DE7B1042
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104210421F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = btnImprimirClick
        ExplicitTop = 14
      end
      object SpeedButton1: TSpeedButton
        Left = 330
        Top = 6
        Width = 89
        Height = 25
        Hint = 'Sair'
        Anchors = [akRight, akBottom]
        Caption = 'Excluir'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
          FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
          FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
          1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
          FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = SpeedButton1Click
        ExplicitTop = 14
      end
      object btnFechar: TSpeedButton
        Left = 425
        Top = 6
        Width = 89
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'F12 Fechar'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
          1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
          1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
          1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
          1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
          1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
          1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
          1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
          1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
          1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
          1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
          1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = btnFecharClick
        ExplicitTop = 14
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 518
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lbGabaritos: TLabel
        Left = 8
        Top = 17
        Width = 50
        Height = 14
        Caption = 'Gabaritos:'
      end
      object cbGabaritosTodos: TUMComboBox
        Left = 64
        Top = 14
        Width = 145
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 0
        TamanhoMaximo = 0
      end
      object Button1: TButton
        Left = 215
        Top = 13
        Width = 122
        Height = 25
        Caption = 'Aplicar a todos alunos'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object qryCursos: TUMZQuery
    Connection = DM.db
    Filtered = True
    UpdateObject = updProvaAluno
    BeforePost = qryCursosBeforePost
    BeforeDelete = qryCursosBeforeDelete
    SQL.Strings = (
      'SELECT'
      '  A.`CD_PROVA_ALUNO`,'
      '  A.`CD_PESSOA`,'
      '  P.`NM_PESSOA`,'
      '  CASE'
      '    WHEN COUNT(R.`CD_PROVA_ALUNO_RESPOSTA`) > 0 THEN '#39'X'#39
      '    ELSE '#39#39
      '  END `SN_RESPONDEU`,'
      '  A.`CD_PROVA_GABARITO`,'
      '  A.`NR_ACERTOS`,'
      '  A.`CD_TURMA`,'
      '  A.`NR_ANOSEMESTRE`'
      'FROM'
      '  `PESSOAS` P'
      ''
      '    JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '      (P.`CD_PESSOA` = A.`CD_PESSOA`)'
      ''
      '      LEFT JOIN `LEITORA_PROVAS_ALUNOS_RESP` R ON'
      '        (A.`CD_PROVA_ALUNO` = R.`CD_PROVA_ALUNO`)'
      'WHERE'
      '  A.`CD_TURMA` = :CD_TURMA AND'
      '  A.`NR_ANOSEMESTRE` = :NR_ANOSEMESTRE AND'
      '  EXISTS ('
      '    SELECT'
      '      G.`CD_PROVA`'
      '    FROM'
      '      `LEITORA_PROVAS_GABARITOS` G'
      '    WHERE'
      '      A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND'
      '      G.`CD_PROVA` = :CD_PROVA'
      '  )'
      'GROUP BY'
      '  A.`CD_PROVA_ALUNO`'
      'ORDER BY'
      '  P.`NM_PESSOA`')
    Params = <
      item
        DataType = ftString
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    object qryCursosCD_PROVA_ALUNO: TIntegerField
      FieldName = 'CD_PROVA_ALUNO'
      Required = True
    end
    object qryCursosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryCursosNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryCursosSN_RESPONDEU: TStringField
      FieldName = 'SN_RESPONDEU'
      ReadOnly = True
      Size = 1
    end
    object qryCursosCD_PROVA_GABARITO: TIntegerField
      FieldName = 'CD_PROVA_GABARITO'
      Required = True
    end
    object qryCursosNR_ACERTOS: TFloatField
      FieldName = 'NR_ACERTOS'
    end
    object qryCursosCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryCursosNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryCursosDS_NOME_GABARITO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_NOME_GABARITO'
      LookupDataSet = qryGabaritos
      LookupKeyFields = 'CD_PROVA_GABARITO'
      LookupResultField = 'DS_NOME_GABARITO'
      KeyFields = 'CD_PROVA_GABARITO'
      Size = 256
      Lookup = True
    end
  end
  object dtcCursos: TDataSource
    DataSet = qryCursos
    Left = 24
    Top = 288
  end
  object pmQtd: TPopupMenu
    Left = 88
    Top = 288
  end
  object qryGabaritos: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '  `CD_PROVA_GABARITO`,'
      '  `DS_NOME_GABARITO`'
      'FROM'
      '  `LEITORA_PROVAS_GABARITOS`'
      'WHERE'
      '  `CD_PROVA`  = :CD_PROVA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    object qryGabaritosCD_PROVA_GABARITO: TIntegerField
      FieldName = 'CD_PROVA_GABARITO'
      Required = True
    end
    object qryGabaritosDS_NOME_GABARITO: TStringField
      FieldName = 'DS_NOME_GABARITO'
      Size = 15
    end
  end
  object updProvaAluno: TZUpdateSQL
    DeleteSQL.Strings = (
      
        'DELETE FROM LEITORA_PROVAS_ALUNOS_DIS WHERE CD_PROVA_ALUNO = :CD' +
        '_PROVA_ALUNO;'
      
        'DELETE FROM LEITORA_PROVAS_ALUNOS_CARTOES WHERE CD_PROVA_ALUNO =' +
        ' :CD_PROVA_ALUNO;'
      
        'DELETE FROM LEITORA_PROVAS_ALUNOS_RESP WHERE CD_PROVA_ALUNO = :C' +
        'D_PROVA_ALUNO;'
      
        'DELETE FROM LEITORA_PROVAS_ALUNOS WHERE CD_PROVA_ALUNO = :CD_PRO' +
        'VA_ALUNO;')
    ModifySQL.Strings = (
      'UPDATE `LEITORA_PROVAS_ALUNOS`'
      'SET'
      '   `CD_PESSOA` = :CD_PESSOA,'
      '   `CD_PROVA_GABARITO` = :CD_PROVA_GABARITO,'
      '   `NR_ACERTOS` = :NR_ACERTOS,'
      '   `CD_TURMA` = :CD_TURMA,'
      '   `NR_ANOSEMESTRE` = :NR_ANOSEMESTRE'
      'WHERE'
      '   `CD_PROVA_ALUNO` = :CD_PROVA_ALUNO')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVA_GABARITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ACERTOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVA_ALUNO'
        ParamType = ptUnknown
      end>
  end
end
