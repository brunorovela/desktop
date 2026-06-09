object fCopiaPlanoAfrica: TfCopiaPlanoAfrica
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Copia plano para...'
  ClientHeight = 151
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblAnoSemestre: TLabel
    Left = 38
    Top = 11
    Width = 97
    Height = 18
    Caption = 'Ano/semestre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object meAnoSemestre: TMaskEdit
    Left = 141
    Top = 8
    Width = 89
    Height = 26
    EditMask = '9999/9;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 0
  end
  object udAnoSemestre: TUpDown
    Left = 232
    Top = 8
    Width = 25
    Height = 26
    Min = -100
    TabOrder = 1
    OnClick = udAnoSemestreClick
  end
  object chkCopiarTurmas: TCheckBox
    Left = 141
    Top = 48
    Width = 116
    Height = 17
    Caption = 'Copiar turmas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object bbtnConfirmar: TBitBtn
    Left = 107
    Top = 116
    Width = 75
    Height = 24
    TabOrder = 3
    Kind = bkOK
  end
  object bbtnCancelar: TBitBtn
    Left = 182
    Top = 115
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
  object qryPlanos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PLANO,'
      '   DS_PLANO,'
      '   NR_ANOSEM'
      'FROM'
      '   FIN_PLANO_PGTO'
      'WHERE'
      '   CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanosCD_PLANO: TLargeintField
      FieldName = 'CD_PLANO'
      Required = True
    end
    object qryPlanosDS_PLANO: TStringField
      FieldName = 'DS_PLANO'
      Size = 150
    end
    object qryPlanosNR_ANOSEM: TIntegerField
      FieldName = 'NR_ANOSEM'
    end
  end
  object qryPlanoTurmas: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   PT.ID_PLANO_TURMA,'
      '   PT.CD_PLANO,'
      '   PT.CD_TURMA,'
      '   PT.NR_ANOSEM'
      'FROM'
      '   FIN_PLANO_TURMAS PT'
      '      JOIN TURMAS T ON'
      '         (PT.CD_TURMA = T.CODIGO)'
      'WHERE'
      '   PT.CD_PLANO = :CD_PLANO AND'
      '   T.ANOSEMESTRE = :NR_ANOSEM')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEM'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEM'
        ParamType = ptUnknown
      end>
    object qryPlanoTurmasID_PLANO_TURMA: TLargeintField
      FieldName = 'ID_PLANO_TURMA'
      Required = True
    end
    object qryPlanoTurmasCD_PLANO: TLargeintField
      FieldName = 'CD_PLANO'
    end
    object qryPlanoTurmasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryPlanoTurmasNR_ANOSEM: TIntegerField
      FieldName = 'NR_ANOSEM'
    end
  end
  object qryPlanoItens: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PLANO_ITEM,'
      '   CD_PLANO,'
      '   NR_DISC_MIN,'
      '   NR_DISC_MAX,'
      '   SN_PODE_REPETIR,'
      '   CD_TIPO_TITULO,'
      '   NR_PARCELAS,'
      '   VL_PARCELA,'
      '   VL_DESCONTO,'
      '   DT_INICIAL,'
      '   DT_PRIMEIRA_PARC,'
      '   SN_DIA_UTIL'
      'FROM'
      '   FIN_PLANOS_PGTO_ITENS'
      'WHERE'
      '   CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanoItensCD_PLANO_ITEM: TLargeintField
      FieldName = 'CD_PLANO_ITEM'
      Required = True
    end
    object qryPlanoItensCD_PLANO: TLargeintField
      FieldName = 'CD_PLANO'
    end
    object qryPlanoItensNR_DISC_MIN: TSmallintField
      FieldName = 'NR_DISC_MIN'
    end
    object qryPlanoItensNR_DISC_MAX: TSmallintField
      FieldName = 'NR_DISC_MAX'
    end
    object qryPlanoItensSN_PODE_REPETIR: TSmallintField
      FieldName = 'SN_PODE_REPETIR'
    end
    object qryPlanoItensCD_TIPO_TITULO: TLargeintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryPlanoItensNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object qryPlanoItensVL_PARCELA: TFloatField
      FieldName = 'VL_PARCELA'
    end
    object qryPlanoItensVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryPlanoItensDT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
    end
    object qryPlanoItensDT_PRIMEIRA_PARC: TDateTimeField
      FieldName = 'DT_PRIMEIRA_PARC'
    end
    object qryPlanoItensSN_DIA_UTIL: TSmallintField
      FieldName = 'SN_DIA_UTIL'
    end
  end
  object qryPlanoTurmasCopia: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   ID_PLANO_TURMA,'
      '   CD_PLANO,'
      '   CD_TURMA,'
      '   NR_ANOSEM'
      'FROM'
      '   FIN_PLANO_TURMAS'
      'WHERE'
      '   CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanoTurmasCopiaID_PLANO_TURMA: TLargeintField
      FieldName = 'ID_PLANO_TURMA'
      Required = True
    end
    object qryPlanoTurmasCopiaCD_PLANO: TLargeintField
      FieldName = 'CD_PLANO'
    end
    object qryPlanoTurmasCopiaCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryPlanoTurmasCopiaNR_ANOSEM: TIntegerField
      FieldName = 'NR_ANOSEM'
    end
  end
  object qryPlanoItensCopia: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_PLANO_ITEM,'
      '   CD_PLANO,'
      '   NR_DISC_MIN,'
      '   NR_DISC_MAX,'
      '   SN_PODE_REPETIR,'
      '   CD_TIPO_TITULO,'
      '   NR_PARCELAS,'
      '   VL_PARCELA,'
      '   VL_DESCONTO,'
      '   DT_INICIAL,'
      '   DT_PRIMEIRA_PARC,'
      '   SN_DIA_UTIL'
      'FROM'
      '   FIN_PLANOS_PGTO_ITENS'
      'WHERE'
      '   CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanoItensCopiaCD_PLANO_ITEM: TLargeintField
      FieldName = 'CD_PLANO_ITEM'
      Required = True
    end
    object qryPlanoItensCopiaCD_PLANO: TLargeintField
      FieldName = 'CD_PLANO'
    end
    object qryPlanoItensCopiaNR_DISC_MIN: TSmallintField
      FieldName = 'NR_DISC_MIN'
    end
    object qryPlanoItensCopiaNR_DISC_MAX: TSmallintField
      FieldName = 'NR_DISC_MAX'
    end
    object qryPlanoItensCopiaSN_PODE_REPETIR: TSmallintField
      FieldName = 'SN_PODE_REPETIR'
    end
    object qryPlanoItensCopiaCD_TIPO_TITULO: TLargeintField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryPlanoItensCopiaNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object qryPlanoItensCopiaVL_PARCELA: TFloatField
      FieldName = 'VL_PARCELA'
    end
    object qryPlanoItensCopiaVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryPlanoItensCopiaDT_INICIAL: TDateTimeField
      FieldName = 'DT_INICIAL'
    end
    object qryPlanoItensCopiaDT_PRIMEIRA_PARC: TDateTimeField
      FieldName = 'DT_PRIMEIRA_PARC'
    end
    object qryPlanoItensCopiaSN_DIA_UTIL: TSmallintField
      FieldName = 'SN_DIA_UTIL'
    end
  end
end
