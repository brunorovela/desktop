object uCamposObrigatorios: TuCamposObrigatorios
  Left = 0
  Top = 0
  Caption = 'Obrigat'#243'riedade de Campos'
  ClientHeight = 542
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'OBRIGATORIEDADE DE CAMPOS'
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
    Top = 25
    Width = 674
    Height = 72
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 29
      Width = 107
      Height = 13
      Caption = 'Selecione um cadastro'
    end
    object RadioListar: TRadioGroup
      Left = 392
      Top = 6
      Width = 282
      Height = 56
      Caption = 'Lista por:'
      Items.Strings = (
        'Exibi'#231#227'o na tela'
        'Ordem alfab'#233'tica')
      TabOrder = 0
      OnClick = RadioListarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 674
    Height = 420
    Align = alClient
    TabOrder = 2
    object CheckCampos: TCheckListBox
      Left = 1
      Top = 1
      Width = 672
      Height = 418
      OnClickCheck = CheckCamposClickCheck
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 517
    Width = 674
    Height = 25
    Align = alBottom
    ButtonHeight = 19
    ButtonWidth = 66
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    List = True
    ShowCaptions = True
    TabOrder = 3
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 5
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 5
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 75
      Top = 0
      Width = 5
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object ComboCadastro: TUMComboBox
    Left = 121
    Top = 51
    Width = 168
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = ComboCadastroChange
    TamanhoMaximo = 0
    SelecionarUnicoAutomatico = False
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastroObrigatorio
    Left = 640
    Top = 32
  end
  object qryCadastroObrigatorio: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'SELECT * from nu_cadastro_obrigatorio WHERE sn_ativo_validacao =' +
        ' 1')
    Params = <>
    Left = 640
    Top = 64
    object qryCadastroObrigatoriocd_cadastro: TIntegerField
      FieldName = 'cd_cadastro'
      Required = True
    end
    object qryCadastroObrigatorionm_cadastro: TStringField
      FieldName = 'nm_cadastro'
      Size = 60
    end
    object qryCadastroObrigatoriods_chave: TStringField
      FieldName = 'ds_chave'
      Size = 60
    end
    object qryCadastroObrigatoriosn_ativo_validacao: TSmallintField
      FieldName = 'sn_ativo_validacao'
    end
  end
  object qryCampoObrigatorio: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * from nu_cadastro_obrigatorio_campo')
    Params = <>
    Left = 608
    Top = 64
    object qryCampoObrigatoriocd_cadastro_campo: TIntegerField
      FieldName = 'cd_cadastro_campo'
      Required = True
    end
    object qryCampoObrigatoriocd_cadastro: TIntegerField
      FieldName = 'cd_cadastro'
    end
    object qryCampoObrigatorionm_campo: TStringField
      FieldName = 'nm_campo'
      Size = 60
    end
    object qryCampoObrigatoriods_chave: TStringField
      FieldName = 'ds_chave'
      Size = 60
    end
    object qryCampoObrigatorionr_ordem: TIntegerField
      FieldName = 'nr_ordem'
    end
    object qryCampoObrigatoriosn_obrigatorio: TSmallintField
      FieldName = 'sn_obrigatorio'
    end
    object qryCampoObrigatoriosn_opcional: TSmallintField
      FieldName = 'sn_opcional'
    end
  end
  object dsCampo: TDataSource
    DataSet = qryCampoObrigatorio
    Left = 608
    Top = 32
  end
end
