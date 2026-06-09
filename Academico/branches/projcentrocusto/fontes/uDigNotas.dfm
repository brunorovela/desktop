object frmDigNotas: TfrmDigNotas
  Left = 270
  Top = 126
  Width = 585
  Height = 446
  Caption = 'Digitação de Notas...'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object btnFechar: TSpeedButton
    Left = 479
    Top = 376
    Width = 83
    Height = 25
    Hint = 'Sair'
    Caption = 'F12 &Fechar'
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777744447777777777444444447777777444777744
      4777777447777774477777447777777744777744777777774477774477777777
      4477774477777777447777744777747447777774477774444777777777777444
      7777777777777444477777777777777777777777777777777777}
    OnClick = btnFecharClick
  end
  object Label1: TLabel
    Left = 8
    Top = 344
    Width = 22
    Height = 14
    Caption = 'Cód.'
  end
  object Label2: TLabel
    Left = 96
    Top = 344
    Width = 31
    Height = 14
    Caption = 'Aluno:'
  end
  object DBText1: TDBText
    Left = 128
    Top = 344
    Width = 281
    Height = 14
    DataField = 'Nome'
    DataSource = dtcNotas
    Transparent = True
  end
  object lblN1: TLabel
    Left = 478
    Top = 344
    Width = 16
    Height = 14
    Alignment = taRightJustify
    Caption = 'N1:'
    FocusControl = dbeN1
  end
  object Bevel1: TBevel
    Left = 6
    Top = 332
    Width = 560
    Height = 4
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 5
    Top = 367
    Width = 560
    Height = 4
    Style = bsRaised
  end
  object Label5: TLabel
    Left = 230
    Top = 37
    Width = 45
    Height = 14
    Caption = 'Bimestre:'
  end
  object Label7: TLabel
    Left = 390
    Top = 37
    Width = 48
    Height = 14
    Caption = 'Disciplina:'
  end
  object SpeedButton1: TSpeedButton
    Left = 488
    Top = 33
    Width = 33
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
  object Label8: TLabel
    Left = 8
    Top = 378
    Width = 63
    Height = 14
    Caption = 'Professores:'
  end
  object lblProfessores: TLabel
    Left = 75
    Top = 378
    Width = 139
    Height = 14
    Caption = 'Professores - Set at Runtime'
  end
  object Label9: TLabel
    Left = 36
    Top = 37
    Width = 47
    Height = 14
    Caption = 'Ano/Sem.'
  end
  object Label3: TLabel
    Left = 296
    Top = 378
    Width = 48
    Height = 14
    Caption = 'Disciplina:'
  end
  object DBText2: TDBText
    Left = 347
    Top = 378
    Width = 65
    Height = 14
    DataField = 'Sigla'
    DataSource = dtcNotas
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DIGITAÇÃO DE NOTAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object grd: TDBGrid
    Left = 9
    Top = 72
    Width = 552
    Height = 251
    DataSource = dtcNotas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = grdCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 292
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turma'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bimestre'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoAluno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N1'
        Width = 45
        Visible = True
      end>
  end
  object dbeN1: TDBEdit
    Left = 496
    Top = 340
    Width = 41
    Height = 22
    DataField = 'Nota1'
    TabOrder = 1
    OnKeyPress = dbeN1KeyPress
  end
  object dbeCodigo: TDBEdit
    Left = 32
    Top = 340
    Width = 57
    Height = 22
    DataField = 'CodigoAluno'
    TabOrder = 0
    OnKeyPress = dbeCodigoKeyPress
  end
  object txtBimestre: TMaskEdit
    Left = 278
    Top = 33
    Width = 33
    Height = 22
    TabStop = False
    EditMask = '9'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 1
    ParentFont = False
    TabOrder = 3
    Text = '1'
  end
  object UpDown1: TUpDown
    Left = 311
    Top = 32
    Width = 16
    Height = 24
    Min = 0
    Max = 3
    Position = 0
    TabOrder = 4
    Wrap = False
    OnClick = UpDown1Click
  end
  object txtDisciplina: TEdit
    Left = 440
    Top = 33
    Width = 49
    Height = 22
    TabStop = False
    Enabled = False
    TabOrder = 5
  end
  object txtAnoSemestre: TMaskEdit
    Left = 86
    Top = 32
    Width = 55
    Height = 22
    TabStop = False
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 6
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 137
    Top = 32
    Width = 16
    Height = 24
    Min = -100
    Position = 0
    TabOrder = 7
    Wrap = False
    OnClick = UpDown2Click
  end
  object tblNotas: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'SELECT DISTINCTROW Provas.AnoSemestre, Provas.CodigoAluno, '
      
        'Provas.Turma, Provas.Disciplina, Alunos.Nome, Disciplinas.Sigla,' +
        ' Provas.Bimestre, '
      
        'Provas.N1, Provas.N2, Provas.N3, Provas.N4, Provas.N5, Provas.N6' +
        ', '
      'Provas.N7, Provas.N8, Provas.N9, Provas.N10, Provas.NAdicional'
      'FROM (Provas INNER JOIN Disciplinas ON '
      'Provas.Disciplina = Disciplinas.Codigo) INNER JOIN Alunos ON '
      'Provas.CodigoAluno = Alunos.Codigo'
      'order by Alunos.Nome')
    Left = 32
    Top = 208
    object tblNotasAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
    end
    object tblNotasCodigoAluno: TIntegerField
      DisplayLabel = 'Cód.'
      FieldName = 'CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblNotasTurma: TStringField
      Alignment = taCenter
      FieldName = 'Turma'
      Size = 15
    end
    object tblNotasDisciplina: TSmallintField
      FieldName = 'Disciplina'
    end
    object tblNotasNome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
    object tblNotasSigla: TStringField
      Alignment = taCenter
      FieldName = 'Sigla'
      Size = 5
    end
    object tblNotasBimestre: TSmallintField
      DisplayLabel = 'Bim.'
      FieldName = 'Bimestre'
    end
    object tblNotasN1: TFloatField
      FieldName = 'N1'
      DisplayFormat = '#0.0'
    end
    object tblNotasN2: TFloatField
      FieldName = 'N2'
    end
    object tblNotasN3: TFloatField
      FieldName = 'N3'
    end
    object tblNotasN4: TFloatField
      FieldName = 'N4'
    end
    object tblNotasN5: TFloatField
      FieldName = 'N5'
    end
    object tblNotasN6: TFloatField
      FieldName = 'N6'
    end
    object tblNotasN7: TFloatField
      FieldName = 'N7'
    end
    object tblNotasN8: TFloatField
      FieldName = 'N8'
    end
    object tblNotasN9: TFloatField
      FieldName = 'N9'
    end
    object tblNotasN10: TFloatField
      FieldName = 'N10'
    end
    object tblNotasNAdicional: TFloatField
      FieldName = 'NAdicional'
    end
  end
  object dtcNotas: TDataSource
    DataSet = tblNotas
    OnDataChange = dtcNotasDataChange
    Left = 32
    Top = 240
  end
  object LookupDisciplinas: TwwLookupDialog
    Selected.Strings = (
      'Codigo'#9'6'#9'Cód'
      'Descricao'#9'20'#9'Descricao'
      'Sigla'#9'5'#9'Sigla')
    GridTitleAlignment = taLeftJustify
    GridColor = clWhite
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    Caption = 'Selecione a disciplina...'
    MaxWidth = 0
    MaxHeight = 209
    CharCase = ecNormal
    Left = 528
    Top = 32
  end
end

