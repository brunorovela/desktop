object fmObsDipCurso: TfmObsDipCurso
  Left = 271
  Top = 228
  BorderStyle = bsDialog
  Caption = 'Observa'#231#227'o do Curso no Diploma'
  ClientHeight = 378
  ClientWidth = 512
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
    Width = 512
    Height = 9
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 512
    Height = 9
    Align = alTop
    Shape = bsSpacer
  end
  object mmobs: TDBMemo
    Left = 0
    Top = 100
    Width = 512
    Height = 237
    Align = alClient
    DataField = 'OBS'
    DataSource = dsHist
    MaxLength = 30000
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 337
    Width = 512
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 194
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 47
    Width = 512
    Height = 53
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object Label9: TLabel
      Left = 221
      Top = 9
      Width = 48
      Height = 13
      Caption = 'Ano/Sem.'
    end
    object DBText2: TDBText
      Left = 7
      Top = 33
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
      Left = 163
      Top = 4
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
      Top = 9
      Width = 30
      Height = 13
      Caption = 'Curso:'
    end
    object txtAnoSemestre: TMaskEdit
      Left = 277
      Top = 4
      Width = 56
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
      Text = '20002'
    end
    object UpDown2: TUpDown
      Left = 333
      Top = 3
      Width = 16
      Height = 24
      Min = -100
      TabOrder = 1
      OnClick = UpDown2Click
    end
    object txtCurso: TEdit
      Left = 40
      Top = 5
      Width = 123
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 9
    Width = 512
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Caption = 'OBSERVA'#199#195'O PARA DIPLOMA - POR CURSO'
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
    Left = 152
    Top = 152
  end
  object quHist: TUMZQuery
    Connection = DM.db
    UpdateObject = usHist
    BeforePost = quHistBeforePost
    SQL.Strings = (
      'SELECT *'
      'FROM OBSDIPCURSO'
      'WHERE ( ANOSEMESTRE = :ANOSEMESTRE) and'
      '      ( CURSO       = :CURSO)')
    Params = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 224
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object quHistcurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
    object quHistanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object quHistobs: TMemoField
      FieldName = 'obs'
      BlobType = ftMemo
    end
  end
  object usHist: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from OBSDIPCURSO'
      'where'
      '  CURSO = :OLD_CURSO and'
      '  ANOSEMESTRE = :OLD_ANOSEMESTRE'
      '')
    InsertSQL.Strings = (
      'insert into OBSDIPCURSO'
      '  (CURSO, ANOSEMESTRE, OBS)'
      'values'
      '  (:CURSO, :ANOSEMESTRE, :OBS)')
    ModifySQL.Strings = (
      'update OBSDIPCURSO'
      'set'
      '  CURSO = :CURSO,'
      '  ANOSEMESTRE = :ANOSEMESTRE,'
      '  OBS = :OBS'
      'where'
      '  CURSO = :OLD_CURSO and'
      '  ANOSEMESTRE = :OLD_ANOSEMESTRE'
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 272
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
  end
  object qucurso: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT distinct descricao FROM cursos WHERE (codigo = :codigo)')
    Params = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qucursodescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
  end
  object DataSource2: TDataSource
    DataSet = qucurso
    Left = 400
    Top = 104
  end
end
