object frmSelTipoTituloNegocia: TfrmSelTipoTituloNegocia
  Left = 0
  Top = 0
  ClientHeight = 262
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 184
    Height = 262
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 184
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Tipos de titulos para negociar'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object chcklTipoTitulos: TCheckListBox
      Left = 0
      Top = 33
      Width = 184
      Height = 229
      OnClickCheck = chcklTipoTitulosClickCheck
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object qryTipoTitulo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_tipo_titulo,ds_tipo_titulo'
      'FROM'
      '  fin_tipos_titulo'
      'WHERE'
      '   ct_tipo_titulo = 1'
      'GROUP BY'
      '  cd_tipo_titulo,ds_tipo_titulo'
      'ORDER BY '
      '  ds_tipo_titulo')
    Params = <>
    Left = 64
    Top = 96
    object qryTipoTitulocd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
      Required = True
    end
    object qryTipoTitulods_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
  end
  object qryInsere: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE '
      '   nu_parametros'
      'SET'
      '   ds_valor = :valor'
      'WHERE'
      '   ds_parametro = '#39'tipos_titulos_negociaveis'#39)
    Params = <
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end>
    Left = 64
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end>
  end
  object qryGetParamValor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   ds_valor'
      'FROM'
      '  nu_parametros'
      'where'
      '  ds_parametro = '#39'tipos_titulos_negociaveis'#39)
    Params = <>
    Left = 96
    Top = 64
    object qryGetParamValords_valor: TMemoField
      FieldName = 'ds_valor'
      BlobType = ftMemo
    end
  end
end
