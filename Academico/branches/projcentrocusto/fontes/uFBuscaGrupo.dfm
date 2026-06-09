object FBuscaGrupos: TFBuscaGrupos
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  ClientHeight = 500
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 500
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Tree: TTreeView
      Left = 0
      Top = 0
      Width = 300
      Height = 500
      Align = alClient
      DragMode = dmAutomatic
      Indent = 19
      TabOrder = 0
      OnDragDrop = TreeDragDrop
    end
  end
  object qryGrupos: TUMZQuery
    Connection = DM.db
    SortedFields = 'DS_NOME_GRUPO'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   G.CD_GRUPO,'
      '   G.DS_NOME_GRUPO'
      'FROM'
      '   NU_GRUPOS G'
      '      JOIN NU_GRUPOS_HIERARQUIA H ON'
      '         (G.CD_GRUPO = H.CD_GRUPO_LIBERADO)'
      'WHERE'
      
        '   H.CD_GRUPO IN (SELECT CD_GRUPO FROM NU_GRUPOS_PESSOAS WHERE C' +
        'D_PESSOA = :CD_PESSOA) AND'
      '   (H.CD_GRUPO = 1 OR G.SN_BLOQUEADO = 0)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_NOME_GRUPO Asc'
    Left = 16
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryGruposCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object qryGruposDS_NOME_GRUPO: TStringField
      FieldName = 'DS_NOME_GRUPO'
      Required = True
      Size = 50
    end
  end
end
