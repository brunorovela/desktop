object fmObsDiploma: TfmObsDiploma
  Left = 224
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Observação do Diploma'
  ClientHeight = 475
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 38
    Width = 547
    Height = 9
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 547
    Height = 9
    Align = alTop
    Shape = bsSpacer
  end
  object mmobs: TDBMemo
    Left = 0
    Top = 103
    Width = 547
    Height = 331
    Align = alClient
    DataField = 'OBS'
    DataSource = dsHist
    MaxLength = 30000
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 434
    Width = 547
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 170
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      Visible = False
    end
    object Button3: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 47
    Width = 547
    Height = 56
    Align = alTop
    TabOrder = 2
    object DBText2: TDBText
      Left = 6
      Top = 32
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'descricao'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCurso: TSpeedButton
      Left = 154
      Top = 3
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
      OnClick = btnCursoClick
    end
    object lblCurso: TLabel
      Left = 6
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Curso:'
    end
    object txtCurso: TEdit
      Left = 40
      Top = 4
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = txtCursoExit
      OnKeyPress = txtCursoKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 9
    Width = 547
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Caption = 'OBSERVAÇÃO PARA DIPLOMA - POR CURSO (GERAL)'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object dsHist: TDataSource
    DataSet = quHist
    Left = 224
    Top = 144
  end
  object quHist: TUMZQuery
    BeforePost = quHistBeforePost
    Connection = db
    
    
    SQL.Strings = (
      'SELECT *'
      'FROM OBSDIPLOMA'
      'WHERE ( Curso       = :Curso)')
    UpdateMode = umUpdateChanged
    UpdateObject = usHist
    Left = 272
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object quHistCURSO: TStringField
      FieldName = 'CURSO'
      Origin = 'OBSDIPLOMA.CURSO'
      Size = 10
    end
    object quHistOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBSDIPLOMA.OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object usHist: TZUpdateSQL
    ModifySQL.Strings = (
      'update OBSDIPLOMA'
      'set'
      '  CURSO = :CURSO,'
      '  OBS = :OBS'
      'where'
      '  CURSO = :OLD_CURSO')
    InsertSQL.Strings = (
      'insert into OBSDIPLOMA'
      '  (CURSO, OBS)'
      'values'
      '  (:CURSO, :OBS)')
    DeleteSQL.Strings = (
      'delete from OBSDIPLOMA'
      'where'
      '  CURSO = :OLD_CURSO')
    Left = 312
    Top = 144
  end
  object qucurso: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'SELECT distinct descricao FROM cursos WHERE (codigo = :codigo)')
    UpdateMode = umUpdateChanged
    Left = 432
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qucursodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = qucurso
    Left = 400
    Top = 136
  end
  object LookupCursos: TwwLookupDialog
    GridTitleAlignment = taLeftJustify
    GridColor = clWhite
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    LookupTable = DM.tblCursos
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    CharCase = ecNormal
    Left = 504
    Top = 64
  end
end

