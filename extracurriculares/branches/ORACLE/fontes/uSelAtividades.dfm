object frm_SelAtividades: Tfrm_SelAtividades
  Left = 352
  Top = 185
  Caption = 'Selecionar Atividade'
  ClientHeight = 324
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 70
    Width = 318
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 11
    Top = 46
    Width = 48
    Height = 14
    Caption = 'Atividade:'
  end
  object btnFechar: TSpeedButton
    Left = 240
    Top = 296
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
  object Label1: TLabel
    Left = 11
    Top = 14
    Width = 72
    Height = 14
    Caption = 'Ano/Semestre:'
  end
  object grd: TDBGrid
    Left = 10
    Top = 80
    Width = 319
    Height = 209
    DataSource = dtcTurmas
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
        FieldName = 'ds_atividade'
        Title.Caption = 'Atividade'
        Width = 284
        Visible = True
      end>
  end
  object txtAtividade: TEdit
    Left = 88
    Top = 42
    Width = 240
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = txtAtividadeKeyPress
  end
  object txtAnoSemestre: TMaskEdit
    Left = 89
    Top = 9
    Width = 222
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
  end
  object UpDown2: TUpDown
    Left = 311
    Top = 9
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 3
    OnClick = UpDown2Click
  end
  object dtcTurmas: TDataSource
    DataSet = qyAtividades
    Left = 16
    Top = 296
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
  object qyAtividades: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'select * from extra_atividades')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 48
    Top = 296
    object qyAtividadescd_atividade: TIntegerField
      FieldName = 'cd_atividade'
      Required = True
    end
    object qyAtividadesnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Required = True
    end
    object qyAtividadescd_professor: TIntegerField
      FieldName = 'cd_professor'
      Required = True
    end
    object qyAtividadescd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
      Required = True
    end
    object qyAtividadescd_centro: TLargeintField
      FieldName = 'cd_centro'
    end
    object qyAtividadescd_coligada: TIntegerField
      FieldName = 'cd_coligada'
    end
    object qyAtividadesds_atividade: TStringField
      FieldName = 'ds_atividade'
      Size = 50
    end
    object qyAtividadesds_observacao: TMemoField
      FieldName = 'ds_observacao'
      BlobType = ftMemo
    end
    object qyAtividadesds_sigla: TStringField
      FieldName = 'ds_sigla'
    end
    object qyAtividadesnm_professor: TStringField
      FieldKind = fkLookup
      FieldName = 'nm_professor'
      LookupDataSet = DM.qyPessoas
      LookupKeyFields = 'cd_pessoa'
      LookupResultField = 'nm_pessoa'
      KeyFields = 'cd_professor'
      Lookup = True
    end
  end
end
