object frm_SelCentro: Tfrm_SelCentro
  Left = 352
  Top = 185
  Caption = 'Selecionar Centro de Custos...'
  ClientHeight = 360
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 72
    Width = 318
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 7
    Top = 14
    Width = 68
    Height = 14
    Caption = 'Classifica'#231#227'o:'
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 52
    Height = 14
    Caption = 'Descri'#231#227'o:'
  end
  object btnFechar: TSpeedButton
    Left = 240
    Top = 328
    Width = 89
    Height = 22
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
    OnClick = SpeedButton1Click
  end
  object grd: TDBGrid
    Left = 10
    Top = 88
    Width = 319
    Height = 233
    DataSource = srcCentros
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pmQtd
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    OnKeyPress = grdKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_CLASSIFICACAO'
        Title.Caption = 'Classifica'#231#227'o'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CENTRO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 221
        Visible = True
      end>
  end
  object edClassificacao: TEdit
    Left = 80
    Top = 10
    Width = 249
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = edClassificacaoKeyPress
  end
  object edDescricao: TEdit
    Left = 80
    Top = 40
    Width = 249
    Height = 22
    TabOrder = 2
    OnKeyPress = edDescricaoKeyPress
  end
  object qyCentros: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      '')
    Params = <>
    Left = 48
    Top = 328
    object qyCentrosCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object qyCentrosDS_CENTRO: TStringField
      FieldName = 'DS_CENTRO'
      Size = 255
    end
    object qyCentrosCD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
    end
    object qyCentrosTP_CENTRO: TIntegerField
      FieldName = 'TP_CENTRO'
    end
    object qyCentrosCD_GRUPO: TLargeintField
      FieldName = 'CD_GRUPO'
    end
    object qyCentrosSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object qyCentrosDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
  end
  object srcCentros: TDataSource
    DataSet = qyCentros
    Left = 16
    Top = 328
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
