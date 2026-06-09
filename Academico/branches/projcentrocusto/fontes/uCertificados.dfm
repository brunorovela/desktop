object frmCertificados: TfrmCertificados
  Left = 0
  Top = 0
  Caption = 'Registro de Diplomas'
  ClientHeight = 541
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = fechaFormulario
  OnCreate = criaFomulario
  OnKeyDown = FormKeyDown
  OnShow = mostraFormulario
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 25
    Width = 792
    Height = 4
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitLeft = -41
    ExplicitWidth = 779
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'REGISTRO DE DIPLOMAS / FORMANDOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 792
    Height = 38
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    BorderWidth = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object sbBuscaCurso: TSpeedButton
      Left = 287
      Top = 6
      Width = 22
      Height = 22
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
      OnClick = buscaCurso
    end
    object lblCurso: TLabel
      Left = 149
      Top = 9
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = 'Curso:'
    end
    object lblDisciplina: TLabel
      Left = 462
      Top = 9
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno:'
    end
    object lblTurma: TLabel
      Left = 317
      Top = 9
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma:'
    end
    object sbBuscaTurma: TSpeedButton
      Left = 433
      Top = 6
      Width = 23
      Height = 22
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
      OnClick = buscaTurma
    end
    object sbBuscaAluno: TSpeedButton
      Left = 563
      Top = 6
      Width = 23
      Height = 22
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
      OnClick = buscaPessoa
    end
    object bnFechar: TSpeedButton
      Left = 699
      Top = 6
      Width = 83
      Height = 22
      Align = alRight
      Caption = 'F12 Fechar'
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
      OnClick = bnFecharClick
      ExplicitLeft = 700
    end
    object txtCurso: TEdit
      Left = 187
      Top = 6
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object txtAluno: TEdit
      Left = 499
      Top = 6
      Width = 63
      Height = 21
      TabOrder = 1
    end
    object txtTurma: TEdit
      Left = 352
      Top = 6
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object ckAnoSemestre: TCheckBox
      Left = 2
      Top = 8
      Width = 68
      Height = 17
      Caption = 'Ano/Sem:'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object txtAnoSemestreCursos: TMaskEdit
      Left = 76
      Top = 6
      Width = 44
      Height = 22
      EditMask = '9999/9;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 4
      Text = '20072'
    end
    object UpDownCursos: TUpDown
      Left = 117
      Top = 6
      Width = 17
      Height = 22
      Min = -100
      TabOrder = 5
      OnClick = incDecAnoSem
    end
    object btnFiltrar: TBitBtn
      Left = 599
      Top = 6
      Width = 95
      Height = 22
      Caption = 'Filtrar'
      TabOrder = 6
      OnClick = filtra
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 67
    Width = 792
    Height = 441
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsCertificados
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_pessoa'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_curso'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_anosem_conclusao'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_conclusao'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_colacao'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_exp_diploma'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_livro'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_cert_folha'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_cert_registro'
        Width = 50
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 508
    Width = 792
    Height = 33
    Align = alBottom
    BorderWidth = 5
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 344
      Top = 6
      Width = 152
      Height = 21
      Caption = 'Registrar certificados'
      OnClick = registraCertificados
    end
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 27
      Height = 13
      Caption = 'Livro:'
    end
    object Label2: TLabel
      Left = 221
      Top = 9
      Width = 36
      Height = 13
      Caption = 'P'#225'gina:'
    end
    object bnAddLivro: TSpeedButton
      Left = 192
      Top = 6
      Width = 23
      Height = 19
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF
        FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF
        FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = AdicionaLivro
    end
    object ComboBox1: TComboBox
      Left = 41
      Top = 6
      Width = 145
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Selecione o livro'
      OnSelect = selecionaLivro
      Items.Strings = (
        'Selecione o livro')
    end
    object Edit1: TEdit
      Left = 263
      Top = 6
      Width = 75
      Height = 21
      TabOrder = 1
      OnKeyPress = informaPaginaAtual
    end
    object ProgressBar1: TProgressBar
      Left = 502
      Top = 6
      Width = 284
      Height = 21
      Align = alRight
      TabOrder = 2
    end
  end
  object qCertificados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '/*SELECT'
      '         mc.cd_matricula_curso,'
      '         p.cd_pessoa,'
      '         p.nm_pessoa,'
      '         mc.cd_curso,'
      '         mc.nr_anosem_conclusao,'
      '         mc.dt_conclusao,'
      '         mc.dt_colacao,'
      '         mc.dt_exp_diploma,'
      '         cl.nm_livro,'
      '         mc.nr_cert_folha,'
      '         mc.nr_cert_registro'
      '      FROM'
      '         matriculas_curso as mc'
      '            JOIN pessoas as p ON(p.cd_pessoa = mc.cd_pessoa)'
      
        '            JOIN matriculas as m ON(mc.cd_matricula_curso = m.cd' +
        '_matricula_curso)'
      
        '            LEFT JOIN certificado_livros as cl ON (cl.cd_cert_li' +
        'vro = mc.cd_cert_livro)'
      '      WHERE'
      '         mc.cd_situacao = 0 AND'
      '         m.codigoaluno = 0 AND'
      '         m.turma = "" AND'
      '         m.curso = ""'
      '      GROUP BY'
      '         mc.cd_matricula_curso'
      '      ORDER BY'
      '         mc.cd_curso, nm_pessoa'
      '*/'
      'SELECT mc.cd_matricula_curso'
      '     , p.cd_pessoa'
      '     , p.nm_pessoa'
      '     , mc.cd_curso'
      '     , mc.nr_anosem_conclusao'
      '     , mc.dt_conclusao'
      '     , mc.dt_colacao'
      '     , mc.dt_exp_diploma'
      '     , cl.nm_livro'
      '     , mc.nr_cert_folha'
      '     , mc.nr_cert_registro'
      '  FROM matriculas_curso as mc '
      ' INNER JOIN pessoas as p ON (p.cd_pessoa = mc.cd_pessoa)'
      
        ' INNER JOIN matriculas as m ON (mc.cd_matricula_curso = m.cd_mat' +
        'ricula_curso)'
      
        ' LEFT JOIN certificado_livros as cl ON (cl.cd_livro = mc.cd_cert' +
        '_livro)'
      ' WHERE cd_situacao = 5 '
      '  GROUP BY mc.cd_matricula_curso'
      ''
      '  ORDER BY mc.cd_curso, nm_pessoa')
    Params = <>
    Left = 16
    Top = 120
    object qCertificadoscd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Aluno'
      FieldName = 'cd_pessoa'
    end
    object qCertificadosnm_pessoa: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qCertificadoscd_curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'cd_curso'
      Size = 15
    end
    object qCertificadosdt_conclusao: TDateTimeField
      DisplayLabel = 'Dt. Conclus'#227'o'
      FieldName = 'dt_conclusao'
    end
    object qCertificadosdt_colacao: TDateTimeField
      DisplayLabel = 'Dt. Cola'#231#227'o'
      FieldName = 'dt_colacao'
    end
    object qCertificadosdt_exp_diploma: TDateTimeField
      DisplayLabel = 'Dt. Diploma'
      FieldName = 'dt_exp_diploma'
    end
    object qCertificadosnm_livro: TStringField
      DisplayLabel = 'Livro'
      FieldName = 'nm_livro'
      Size = 50
    end
    object qCertificadoscd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
      Required = True
    end
    object qCertificadosnr_anosem_conclusao: TLargeintField
      DisplayLabel = 'Conc.'
      FieldName = 'nr_anosem_conclusao'
    end
    object qCertificadosnr_cert_folha: TLargeintField
      DisplayLabel = 'Folha'
      FieldName = 'nr_cert_folha'
    end
    object qCertificadosnr_cert_registro: TLargeintField
      DisplayLabel = 'Registro'
      FieldName = 'nr_cert_registro'
    end
  end
  object dsCertificados: TDataSource
    AutoEdit = False
    DataSet = qCertificados
    Left = 16
    Top = 160
  end
end
