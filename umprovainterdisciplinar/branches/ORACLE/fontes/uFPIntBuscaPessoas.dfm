object fPIntBuscaPessoas: TfPIntBuscaPessoas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fPIntBuscaPessoas'
  ClientHeight = 548
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 0
    Width = 599
    Height = 3
    Align = alTop
    Shape = bsSpacer
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 23
    Width = 599
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 192
    ExplicitTop = 168
    ExplicitWidth = 50
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 195
    Width = 599
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 168
    ExplicitTop = 248
    ExplicitWidth = 50
  end
  object bvlSep4: TBevel
    Left = 0
    Top = 522
    Width = 599
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitLeft = 304
    ExplicitTop = 280
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 3
    Width = 599
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CLIQUE, ARRASTE E SOLTE O REGISTRO DESEJADO...'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 26
    Width = 599
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblAnoSem: TLabel
      Left = 8
      Top = 9
      Width = 72
      Height = 13
      Caption = 'Ano/Semestre:'
    end
    object lblCurso: TLabel
      Left = 48
      Top = 37
      Width = 32
      Height = 13
      Caption = 'Curso:'
    end
    object lblTurma: TLabel
      Left = 46
      Top = 65
      Width = 34
      Height = 13
      Caption = 'Turma:'
    end
    object lblCodigo: TLabel
      Left = 43
      Top = 93
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lblNome: TLabel
      Left = 49
      Top = 120
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object meAnoSem: TMaskEdit
      Tag = 1
      Left = 86
      Top = 6
      Width = 49
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
      TabOrder = 0
      Text = '19931'
      OnKeyPress = meAnoSemKeyPress
    end
    object udAnoSem: TUpDown
      Left = 133
      Top = 6
      Width = 17
      Height = 22
      Min = -100
      TabOrder = 1
      OnClick = udAnoSemClick
    end
    object edtCodigo: TEdit
      Left = 86
      Top = 90
      Width = 83
      Height = 21
      TabOrder = 4
      OnKeyPress = edtCodigoKeyPress
    end
    object edtNome: TEdit
      Left = 86
      Top = 117
      Width = 379
      Height = 21
      TabOrder = 5
      OnKeyPress = edtNomeKeyPress
    end
    object btnFiltrar: TBitBtn
      Left = 86
      Top = 144
      Width = 95
      Height = 22
      Caption = 'Filtrar'
      TabOrder = 6
      OnClick = btnFiltrarClick
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
    object cbCursos: TComboBox
      Left = 86
      Top = 34
      Width = 243
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      OnKeyPress = cbCursosKeyPress
      OnSelect = cbCursosSelect
    end
    object cbTurmas: TComboBox
      Left = 86
      Top = 62
      Width = 190
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnKeyPress = cbTurmasKeyPress
      OnSelect = cbTurmasSelect
    end
  end
  object tlbAcoes: TToolBar
    Left = 0
    Top = 525
    Width = 599
    Height = 23
    Align = alBottom
    ButtonWidth = 76
    Images = ilImagens
    List = True
    ShowCaptions = True
    TabOrder = 2
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnSelecionar: TToolButton
      Left = 8
      Top = 0
      Caption = 'Selecionar'
      Enabled = False
      ImageIndex = 1
      Visible = False
    end
    object btnSep2: TToolButton
      Left = 84
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
      Visible = False
    end
    object btnSair: TToolButton
      Left = 92
      Top = 0
      Caption = 'F12 Sair'
      ImageIndex = 0
      OnClick = btnSairClick
    end
    object btnSep3: TToolButton
      Left = 168
      Top = 0
      Width = 8
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
  object dbgPessoas: TDBGrid
    Left = 0
    Top = 198
    Width = 599
    Height = 324
    Align = alClient
    DataSource = dsPessoas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = dbgPessoasColEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_pessoa'
        Title.Caption = 'C'#243'digo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Title.Caption = 'Nome'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_turma'
        Title.Caption = 'Turma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_curso'
        Title.Caption = 'Curso'
        Visible = True
      end>
  end
  object ilImagens: TImageList
    Left = 480
    Top = 80
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      000000000000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFF00000000E3FFFFFF00000000
      83FFF9FF00000000000FF0FF00000000003FF0FF00000000002FE07F00000000
      000FC07F00000000000F843F0000000000011E3F000000000001FE1F00000000
      0001FF1F00000000000FFF8F00000000000FFFC700000000002FFFE300000000
      803FFFF800000000E3FFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object dsPessoas: TDataSource
    AutoEdit = False
    DataSet = qryPessoas
    Left = 168
    Top = 256
  end
  object qryCursos: TUMZQuery
    Connection = DM.db
    Params = <>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'   c.anosemestre,'#13#10'   c.codigo,'#13#10'   FIRST_OCCURRE' +
        'NCE(c.apelido) apelido,'#13#10'   FIRST_OCCURRENCE(c.descricao) descri' +
        'cao'#13#10'FROM'#13#10'   cursos c'#13#10'   INNER JOIN pint_provas_turmas pt ON (' +
        #13#10#9#9#9#9'c.anosemestre = pt.nr_anosemestre AND'#13#10'        c.codigo = ' +
        'pt.cd_curso'#13#10#9' )'#13#10'   INNER JOIN pint_regras_ensalamento re ON (p' +
        't.cd_prova = re.cd_prova)'#13#10'WHERE'#13#10'   re.cd_regra_ensalamento = :' +
        'cd_regra_ensalamento AND'#13#10'   pt.nr_anosemestre = :nr_anosemestre' +
        #13#10'GROUP BY'#13#10'   c.anosemestre,'#13#10'   c.codigo'
      
        'mysql-5=SELECT'#13#10'   c.anosemestre,'#13#10'   c.codigo,'#13#10'   c.apelido,'#13#10 +
        '   c.descricao'#13#10'FROM'#13#10'   cursos c'#13#10'      JOIN pint_provas_turmas' +
        ' pt ON'#13#10'         (c.anosemestre = pt.nr_anosemestre) AND'#13#10'      ' +
        '   (c.codigo = pt.cd_curso)'#13#10'         JOIN pint_regras_ensalamen' +
        'to re ON'#13#10'            (pt.cd_prova = re.cd_prova)'#13#10'WHERE'#13#10'   re.' +
        'cd_regra_ensalamento = :cd_regra_ensalamento AND'#13#10'   pt.nr_anose' +
        'mestre = :nr_anosemestre'#13#10'GROUP BY'#13#10'   c.anosemestre,'#13#10'   c.codi' +
        'go'#13#10)
    Left = 344
    Top = 48
    object qryCursosanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Required = True
    end
    object qryCursoscodigo: TStringField
      FieldName = 'codigo'
      Required = True
      Size = 15
    end
    object qryCursosapelido: TStringField
      FieldName = 'apelido'
      Size = 255
    end
    object qryCursosdescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
  end
  object qryTurmas: TUMZQuery
    Connection = DM.db
    Params = <>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   pt.cd_turma,'#13#10'   pt.cd_curso,'#13#10'   pt.cd_disci' +
        'plina,'#13#10'   pt.nr_anosemestre,'#13#10'   d.codigo'#13#10'FROM'#13#10'   pint_provas' +
        '_turmas pt'#13#10'      JOIN pint_regras_ensalamento re ON'#13#10'         (' +
        'pt.cd_prova = re.cd_prova)'#13#10'      JOIN cursos c ON'#13#10'         (pt' +
        '.cd_curso = c.codigo) AND'#13#10'         (pt.nr_anosemestre = c.anose' +
        'mestre)'#13#10'         JOIN departamentos d ON'#13#10'            (c.depto ' +
        '= d.codigo)'#13#10'WHERE'#13#10'   re.cd_regra_ensalamento = :cd_regra_ensal' +
        'amento AND'#13#10'   pt.nr_anosemestre = :nr_anosemestre AND'#13#10'   pt.cd' +
        '_curso = :cd_curso'#13#10'GROUP BY'#13#10'   pt.cd_turma'#13#10
      
        'oracle=SELECT'#13#10'   pt.cd_turma,'#13#10'   FIRST_OCCURRENCE(pt.cd_curso)' +
        ' cd_curso,'#13#10'   CAST(FIRST_OCCURRENCE(pt.cd_disciplina) AS NUMBER' +
        '(19))  cd_disciplina,'#13#10'   CAST(FIRST_OCCURRENCE(pt.nr_anosemestr' +
        'e) AS NUMBER(9)) nr_anosemestre,'#13#10'   CAST(FIRST_OCCURRENCE(d.cod' +
        'igo) AS NUMBER(5)) codigo'#13#10'FROM'#13#10'   pint_provas_turmas pt'#13#10'   IN' +
        'NER JOIN pint_regras_ensalamento re ON (pt.cd_prova = re.cd_prov' +
        'a)'#13#10'   INNER JOIN cursos c ON ( pt.cd_curso = c.codigo AND pt.nr' +
        '_anosemestre = c.anosemestre )'#13#10'   INNER JOIN departamentos d ON' +
        ' (c.depto = d.codigo)'#13#10'WHERE'#13#10'   re.cd_regra_ensalamento = :cd_r' +
        'egra_ensalamento AND'#13#10'   pt.nr_anosemestre = :nr_anosemestre AND' +
        #13#10'   pt.cd_curso = :cd_curso'#13#10'GROUP BY'#13#10'   pt.cd_turma')
    Left = 344
    Top = 80
    object qryTurmascd_turma: TStringField
      FieldName = 'cd_turma'
      Required = True
      Size = 65
    end
    object qryTurmascd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 65
    end
    object qryTurmascd_disciplina: TLargeintField
      FieldName = 'cd_disciplina'
      Required = True
    end
    object qryTurmasnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Required = True
    end
    object qryTurmascodigo: TSmallintField
      FieldName = 'codigo'
    end
  end
  object qryPessoas: TUMZQuery
    Connection = DM.db
    AfterOpen = qryPessoasAfterOpen
    SQL.Strings = (
      'SELECT'
      '   p.cd_pessoa,'
      '   p.nm_pessoa,'
      '   pt.cd_turma,'
      '   pt.cd_curso,'
      '   d.descricao'
      'FROM'
      '   pint_provas_turmas pt'
      '      JOIN fichaindividual fi ON'
      '         (pt.cd_turma = fi.turma) AND'
      '         (pt.cd_curso = fi.curso) AND'
      '         (pt.cd_disciplina = fi.disciplina) AND'
      '         (pt.nr_anosemestre = fi.anosemestre)'
      '         JOIN disciplinas d ON'
      '            (fi.disciplina = d.codigo) AND'
      '            (fi.curso = d.curso)'
      '         JOIN pessoas p ON'
      '            (fi.codigoaluno = p.cd_pessoa)'
      '         JOIN situacao s ON'
      '            (fi.situacao = s.cd_situacao)'
      '            JOIN nu_modulos_matriculas_sit mms ON'
      '               (s.cd_situacao_pai = mms.cd_situacao)'
      '         JOIN pint_regras_ensalamento re ON'
      '            (pt.cd_prova = re.cd_prova)'
      '            JOIN pint_ensalamento e ON'
      
        '               (re.cd_regra_ensalamento = e.cd_regra_ensalamento' +
        ') AND'
      '               (fi.codigoaluno = e.cd_pessoa)'
      'WHERE'
      '   mms.sn_aceita = 1 AND'
      '   e.cd_regra_ensalamento = :cd_regra_ensalamento'
      'GROUP BY'
      '   p.cd_pessoa'
      'ORDER BY'
      '   p.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_regra_ensalamento'
        ParamType = ptUnknown
      end>
    Left = 200
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_regra_ensalamento'
        ParamType = ptUnknown
      end>
    object qryPessoascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object qryPessoasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qryPessoascd_turma: TStringField
      FieldName = 'cd_turma'
      Required = True
      Size = 15
    end
    object qryPessoascd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 15
    end
    object qryPessoasdescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
  end
end
