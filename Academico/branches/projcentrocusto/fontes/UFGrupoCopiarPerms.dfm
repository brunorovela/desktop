object fGrupoCopiarPerms: TfGrupoCopiarPerms
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'UNIMESTRE'
  ClientHeight = 122
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTexto: TLabel
    Left = 24
    Top = 24
    Width = 381
    Height = 13
    Caption = 
      'Selecione de qual grupo voc'#234' deseja duplicar as permiss'#245'es para ' +
      'o grupo [%s]:'
  end
  object dblcGrupos: TDBLookupComboBox
    Left = 24
    Top = 43
    Width = 297
    Height = 21
    KeyField = 'DS_NOME_GRUPO'
    ListField = 'DS_NOME_GRUPO'
    ListSource = dsGrupos
    TabOrder = 0
  end
  object btnConfirmar: TButton
    Left = 392
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    Left = 467
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object dsGrupos: TDataSource
    AutoEdit = False
    DataSet = qryGrupos
    OnDataChange = dsGruposDataChange
    Left = 224
    Top = 72
  end
  object qryGrupos: TUMZReadOnlyQuery
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
      '   H.CD_GRUPO_LIBERADO <> :CD_GRUPO AND'
      '   (H.CD_GRUPO = 1 OR G.SN_BLOQUEADO = 0)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_NOME_GRUPO Asc'
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
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
