object frmImportarDiario: TfrmImportarDiario
  Left = 88
  Top = 144
  BorderStyle = bsDialog
  Caption = 'Importar dados do Di'#225'rio Eletr'#244'nico'
  ClientHeight = 440
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 71
    Height = 13
    Caption = 'Ano/Semestre:'
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DI'#193'RIO DE CLASSE ELETR'#212'NICO - IMPORTA'#199#195'O DE DADOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 21
    Top = 64
    Width = 371
    Height = 57
    Caption = ' Di'#225'rio Selecionado: '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 26
      Width = 93
      Height = 13
      Caption = 'Nome do Professor:'
    end
    object eProfessor: TEdit
      Left = 107
      Top = 24
      Width = 256
      Height = 21
      Color = 16441295
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 399
    Width = 793
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      793
      41)
    object btnAbrirDisquete: TSpeedButton
      Left = 9
      Top = 8
      Width = 108
      Height = 26
      Caption = 'Abrir Disquete'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
    end
    object btnProcurarProfessor: TSpeedButton
      Left = 117
      Top = 8
      Width = 136
      Height = 26
      Caption = 'Pesquisar Professor'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = btnProcurarProfessorClick
    end
    object btnImportar: TSpeedButton
      Left = 253
      Top = 8
      Width = 104
      Height = 26
      Caption = 'Importar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object lbMsg: TLabel
      Left = 756
      Top = 16
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'lbMsg'
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 449
      Top = 8
      Width = 82
      Height = 26
      Caption = 'Fechar'
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
      OnClick = SpeedButton1Click
    end
    object btnExcluirDiario: TSpeedButton
      Left = 357
      Top = 8
      Width = 84
      Height = 26
      Caption = 'Excluir '
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
      OnClick = btnExcluirDiarioClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 413
    Top = 40
    Width = 353
    Height = 345
    Caption = ' Turmas a ser importadas: '
    TabOrder = 3
    object grTurmasDiario: TDBGrid
      Left = 12
      Top = 24
      Width = 329
      Height = 312
      BorderStyle = bsNone
      DataSource = dsIBTurmas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CURSO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TURMA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANOSEMESTRE'
          Title.Caption = 'ANO/SEM'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BIMESTRE'
          Title.Caption = 'BIM.'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_DISCIPLINA'
          Title.Caption = 'DISCIPLINA'
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 21
    Top = 128
    Width = 372
    Height = 257
    Caption = ' Turmas entregues pelo professor:'
    TabOrder = 4
    object DBGrid2: TDBGrid
      Left = 12
      Top = 24
      Width = 349
      Height = 225
      BorderStyle = bsNone
      DataSource = dsTurmas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Curso'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TURMA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'DISCIPLINA'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BIMESTRE'
          Title.Caption = 'BIM'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAENTREGA'
          Title.Caption = 'ENTREGA'
          Width = 60
          Visible = True
        end>
    end
  end
  object eAnoSemestre: TMaskEdit
    Left = 106
    Top = 36
    Width = 76
    Height = 21
    EditMask = '9999/9;0;_'
    MaxLength = 6
    TabOrder = 5
  end
  object UpDown1: TUpDown
    Left = 182
    Top = 36
    Width = 16
    Height = 21
    Min = -100
    TabOrder = 6
    OnClick = UpDown1Click
  end
  object dsIBTurmas: TDataSource
    Left = 525
    Top = 184
  end
  object tblTurmas: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'Select * from Diario_Turmas, Disciplinas'
      'WHERE  Diario_Turmas.Disciplina = Disciplinas.Codigo AND'
      '                Diario_Turmas.Curso = Disciplinas.Curso AND'
      ''
      'AnoSemestre = :AnoSemestre AND Professor = :Professor')
    Left = 493
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PROFESSOR'
        ParamType = ptUnknown
      end>
    object tblTurmasTURMA: TStringField
      FieldName = 'TURMA'
      Origin = 'WMESTRE12.Diario_Turmas.TURMA'
      Size = 15
    end
    object tblTurmasANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Origin = 'WMESTRE12.Diario_Turmas.ANOSEMESTRE'
    end
    object tblTurmasDISCIPLINA: TIntegerField
      FieldName = 'DISCIPLINA'
      Origin = 'WMESTRE12.Diario_Turmas.DISCIPLINA'
    end
    object tblTurmasBIMESTRE: TSmallintField
      FieldName = 'BIMESTRE'
      Origin = 'WMESTRE12.Diario_Turmas.BIMESTRE'
    end
    object tblTurmasPROFESSOR: TIntegerField
      FieldName = 'PROFESSOR'
      Origin = 'WMESTRE12.Diario_Turmas.PROFESSOR'
    end
    object tblTurmasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.Diario_Turmas.CURSO'
      Size = 15
    end
    object tblTurmasDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
      Origin = 'WMESTRE12.Diario_Turmas.DATAENTREGA'
    end
    object tblTurmasCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.Diario_Turmas.DATAENTREGA'
    end
    object tblTurmasOrdem: TSmallintField
      FieldName = 'Ordem'
      Origin = 'WMESTRE12.Diario_Turmas.DATAENTREGA'
    end
    object tblTurmasCurso_1: TStringField
      FieldName = 'Curso_1'
      Origin = 'WMESTRE12.Diario_Turmas.DATAENTREGA'
      Size = 15
    end
    object tblTurmasSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'WMESTRE12.Diario_Turmas.DATAENTREGA'
      Size = 5
    end
    object tblTurmasDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'WMESTRE12.Diario_Turmas.DATAENTREGA'
      Size = 50
    end
  end
  object tblSISTEMA: TUMZQuery
    CachedUpdates = True
    Connection = db
    
    
    Left = 573
    Top = 264
  end
  object tblProfessor: TUMZQuery
    Connection = db
    
    Left = 461
    Top = 256
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.UNI'
    Filter = 'Banco de Dados Compactado|*.UNI|Banco de Dados do Di'#225'rio|*.GDB'
    InitialDir = 'A:\'
    Title = 'Abrir Banco de Dados'
    Left = 429
    Top = 328
  end
  object qProfessores: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'Select Diario_Extrair_Turmas.* From Diario_Extrair_Turmas')
    Left = 724
    Top = 4
  end
  object dsTurmas: TDataSource
    DataSet = tblTurmas
    Left = 493
    Top = 288
  end
  object tblFicha: TUMZQuery
    CachedUpdates = True
    Connection = db
    
    
    SQL.Strings = (
      'Select * From FichaIndividual'
      'Where CodigoAluno = :CodigoAluno AND'
      '            AnoSemestre = :AnoSemestre AND'
      '            Turma = :Turma AND'
      '            Disciplina = :Disciplina')
    Left = 605
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end>
  end
end

