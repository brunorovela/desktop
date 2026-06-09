object frmSelecionarAcao: TfrmSelecionarAcao
  Left = 0
  Top = 0
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca de permiss'#245'es'
  ClientHeight = 390
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 390
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lbCodigo: TLabel
      Left = 184
      Top = 51
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 164
      Top = 78
      Width = 57
      Height = 13
      Caption = 'Nome a'#231#227'o:'
    end
    object Label2: TLabel
      Left = 183
      Top = 105
      Width = 38
      Height = 13
      Caption = 'M'#243'dulo:'
    end
    object pnTopo: TPanel
      Left = 0
      Top = 0
      Width = 653
      Height = 26
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'BUSCA DE PERMISS'#213'ES'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 189
      Width = 653
      Height = 201
      Align = alBottom
      DataSource = dsAcoes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_acao'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_nome_acao'
          Title.Caption = 'Nome'
          Width = 350
          Visible = True
        end>
    end
    object edCodigo: TEdit
      Left = 227
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edNomeAcao: TEdit
      Left = 227
      Top = 75
      Width = 297
      Height = 21
      TabOrder = 3
    end
    object cbModulos: TUMComboBox
      Left = 227
      Top = 102
      Width = 297
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      TamanhoMaximo = 0
    end
    object Button1: TButton
      Left = 227
      Top = 129
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 308
      Top = 129
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object qryAcoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_acao,'
      #9'ds_nome_acao,'
      '                cd_modulo'
      'FROM'
      #9'nu_modulos_acoes')
    Params = <>
    Left = 8
    Top = 344
  end
  object dsAcoes: TDataSource
    DataSet = qryAcoes
    Left = 40
    Top = 344
  end
end
