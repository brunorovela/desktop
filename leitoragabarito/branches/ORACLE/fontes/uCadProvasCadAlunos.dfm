object frmCadProvasCadAlunos: TfrmCadProvasCadAlunos
  Left = 289
  Top = 131
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Selecionar Alunos...'
  ClientHeight = 486
  ClientWidth = 563
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 12
    Top = 28
    Width = 72
    Height = 14
    Alignment = taRightJustify
    Caption = 'Ano/Semestre:'
  end
  object Label4: TLabel
    Left = 50
    Top = 54
    Width = 36
    Height = 14
    Caption = 'C'#243'digo:'
  end
  object Label5: TLabel
    Left = 56
    Top = 80
    Width = 30
    Height = 14
    Caption = 'Nome:'
  end
  object Label6: TLabel
    Left = 53
    Top = 106
    Width = 33
    Height = 14
    Caption = 'Turma:'
    OnClick = btnFecharClick
  end
  object Bevel2: TBevel
    Left = 5
    Top = 144
    Width = 548
    Height = 5
    Style = bsRaised
  end
  object Panel1: TPanel
    Left = 0
    Top = 448
    Width = 563
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnFechar: TSpeedButton
      Left = 448
      Top = 7
      Width = 107
      Height = 22
      Hint = 'Sair'
      Caption = 'F12 Sai&r'
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
    object sbSalvar: TSpeedButton
      Left = 224
      Top = 7
      Width = 107
      Height = 22
      Caption = 'Salvar'
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
      OnClick = sbSalvarClick
    end
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 7
      Width = 107
      Height = 22
      Caption = 'Salvar e Fechar'
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
      OnClick = SpeedButton1Click
    end
  end
  object cbAnoSemestre: TCheckBox
    Left = 91
    Top = 26
    Width = 13
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = cbAnoSemestreClick
  end
  object txtAnoSemestre: TMaskEdit
    Tag = 1
    Left = 112
    Top = 24
    Width = 161
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
    TabOrder = 2
    Text = '19931'
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object txtAca_Codigo: TEdit
    Left = 91
    Top = 50
    Width = 182
    Height = 22
    Hint = 'Digite o c'#243'digo sem h'#237'fen'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = txtAca_CodigoEnter
    OnKeyPress = txtAca_CodigoKeyPress
  end
  object txtAca_Nome: TEdit
    Left = 91
    Top = 76
    Width = 347
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 4
    OnEnter = txtAca_NomeEnter
    OnKeyPress = txtAca_NomeKeyPress
  end
  object txtAca_Turma: TEdit
    Left = 91
    Top = 102
    Width = 182
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 5
    OnEnter = txtAca_TurmaEnter
    OnKeyPress = txtAca_TurmaKeyPress
  end
  object grd: TDBGrid
    Left = 6
    Top = 154
    Width = 547
    Height = 287
    BorderStyle = bsNone
    DataSource = dtcAlunos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pmQtd
    TabOrder = 6
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdPessoaDblClick
    OnKeyPress = grdPessoaKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cd_pessoa'
        Title.Caption = 'Cod. Pessoa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Title.Caption = 'Nome'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turma'
        Title.Caption = 'Turma de Matr'#237'cula'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AnoSemestre'
        Title.Caption = 'Ano/Sem.'
        Width = 60
        Visible = True
      end>
  end
  object cbAlunosCursando: TCheckBox
    Left = 7
    Top = 125
    Width = 546
    Height = 17
    Caption = 
      'Selecionar apenas alunos que estejam cursando as disciplinas da ' +
      'prova'
    Checked = True
    State = cbChecked
    TabOrder = 7
    WordWrap = True
  end
  object dtcAlunos: TDataSource
    DataSet = qryPessoa
    Left = 400
    Top = 264
  end
  object qryPessoa: TUMZQuery
    Connection = DM.db
    CachedUpdates = True
    Params = <>
    Left = 368
    Top = 264
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
