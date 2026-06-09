object frm_Coligadas: Tfrm_Coligadas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'UNI-MESTRE'
  ClientHeight = 323
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 577
    Height = 11
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 491
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SELECIONAR A UNIDADE DE ENSINO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 282
    Width = 577
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 464
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 37
    Width = 561
    Height = 245
    DataSource = dsColigadas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_coligada'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_coligada'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_cnpj'
        Visible = True
      end>
  end
  object qryColigadas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM coligadas'
      'where'
      ' 1=1')
    Params = <>
    Left = 384
    Top = 56
    object qryColigadascd_coligada: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.coligadas.cd_coligada'
    end
    object qryColigadasnm_coligada: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nm_coligada'
      Origin = 'WMESTRE12.coligadas.nm_coligada'
      Size = 50
    end
    object qryColigadasnm_razao_social: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'nm_razao_social'
      Origin = 'WMESTRE12.coligadas.nm_razao_social'
      Size = 100
    end
    object qryColigadasds_cnpj: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'ds_cnpj'
      Origin = 'WMESTRE12.coligadas.ds_cnpj'
    end
  end
  object dsColigadas: TDataSource
    AutoEdit = False
    DataSet = qryColigadas
    Left = 416
    Top = 56
  end
end
