object FBuscaAreas: TFBuscaAreas
  Left = 0
  Top = 0
  ClientHeight = 471
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 471
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblNome: TLabel
      Left = 10
      Top = 10
      Width = 67
      Height = 13
      Caption = 'Nome da '#225'rea'
    end
    object edNome: TEdit
      Left = 85
      Top = 7
      Width = 196
      Height = 21
      TabOrder = 0
      OnChange = edNomeChange
    end
    object dbgDragAndDrop: TDBGrid
      Left = 0
      Top = 34
      Width = 288
      Height = 437
      Align = alBottom
      DataSource = dsAreas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColEnter = dbgDragAndDropColEnter
      Columns = <
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ds_area'
          Title.Caption = #193'rea de conhecimento'
          Visible = True
        end>
    end
  end
  object qryAreas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   professores_areas'
      'WHERE'
      '   ds_area like :area'
      'ORDER BY'
      '   ds_area')
    Params = <
      item
        DataType = ftUnknown
        Name = 'area'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'area'
        ParamType = ptUnknown
      end>
    object qryAreascd_area: TIntegerField
      FieldName = 'cd_area'
      Required = True
    end
    object qryAreasds_area: TStringField
      FieldName = 'ds_area'
      Required = True
      Size = 255
    end
  end
  object dsAreas: TDataSource
    DataSet = qryAreas
    Left = 72
    Top = 224
  end
end
