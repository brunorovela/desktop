object frmCadConvenioCriterio: TfrmCadConvenioCriterio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Crit'#233'rios'
  ClientHeight = 252
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbValor: TLabel
    Left = 8
    Top = 169
    Width = 75
    Height = 13
    Caption = 'No valor de R$:'
    FocusControl = dbValor
    Visible = False
  end
  object lbCargo: TLabel
    Left = 8
    Top = 31
    Width = 313
    Height = 13
    Caption = 'Quando o colaborador for: (informe o cargo ou n'#237'vel na empresa)'
  end
  object lbTipo: TLabel
    Left = 8
    Top = 123
    Width = 142
    Height = 13
    Caption = 'Aplicar aux'#237'lio de estudo com:'
  end
  object lbDepartamento: TLabel
    Left = 8
    Top = 77
    Width = 160
    Height = 13
    Caption = 'E se matricular no departamento:'
  end
  object lbValorLimite: TLabel
    Left = 168
    Top = 169
    Width = 116
    Height = 13
    Caption = 'Limitado ao valor de R$:'
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 25
    Align = alTop
    Caption = 'CADASTRO DE CRIT'#201'RIO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object dbValor: TDBEdit
    Left = 8
    Top = 188
    Width = 134
    Height = 21
    DataField = 'vl_valor'
    DataSource = frmCadConvenioPgto.dsCriterios
    TabOrder = 3
    Visible = False
    OnKeyPress = dbValorKeyPress
  end
  object dbCargo: TDBEdit
    Left = 8
    Top = 50
    Width = 321
    Height = 21
    Hint = 'Exemplo: Ocupante de cargo administrativo'
    DataField = 'ds_cargo'
    DataSource = frmCadConvenioPgto.dsCriterios
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object dbValorLimite: TDBEdit
    Left = 168
    Top = 188
    Width = 121
    Height = 21
    DataField = 'vl_valor_limite'
    DataSource = frmCadConvenioPgto.dsCriterios
    TabOrder = 4
    Visible = False
    OnKeyPress = dbValorLimiteKeyPress
  end
  object dbDepartamento: TDBLookupComboBox
    Left = 8
    Top = 96
    Width = 214
    Height = 21
    DataField = 'cd_depto'
    DataSource = frmCadConvenioPgto.dsCriterios
    KeyField = 'codigo'
    ListField = 'descricao'
    ListSource = dsDepartamentos
    TabOrder = 1
  end
  object dbTipo: TDBLookupComboBox
    Left = 8
    Top = 142
    Width = 134
    Height = 21
    DataField = 'cd_nfe_criterio_tipo'
    DataSource = frmCadConvenioPgto.dsCriterios
    KeyField = 'cd_nfe_criterio_tipo'
    ListField = 'ds_tipo'
    ListSource = dsCriteriosTipos
    TabOrder = 2
    OnClick = dbTipoClick
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 227
    Width = 339
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'tbBotoesAcao'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmCadConvenioPgto.imgBotoes
    List = True
    ShowCaptions = True
    TabOrder = 6
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tpSeparador1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 84
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton14: TToolButton
      Left = 172
      Top = 0
      Width = 8
      Caption = 'tpSeparador2'
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object qyDepartamentos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '  codigo, descricao '
      'FROM '
      '  departamentos'
      'WHERE'
      '  cd_coligada = :cd_coligada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object dsDepartamentos: TDataSource
    DataSet = qyDepartamentos
    Left = 232
    Top = 128
  end
  object qyCriteriosTipos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_nfe_criterios_tipos')
    Params = <>
    Left = 272
    Top = 96
  end
  object dsCriteriosTipos: TDataSource
    DataSet = qyCriteriosTipos
    Left = 272
    Top = 128
  end
end
