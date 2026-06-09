object frmComprasBuscaKits: TfrmComprasBuscaKits
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Compras - Busca de Kits'
  ClientHeight = 482
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 482
    Align = alClient
    TabOrder = 0
    object Bevel6: TBevel
      Left = 1
      Top = 27
      Width = 515
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = -87
      ExplicitTop = 25
      ExplicitWidth = 568
    end
    object Label1: TLabel
      Left = 16
      Top = 39
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label8: TLabel
      Left = 16
      Top = 82
      Width = 86
      Height = 13
      Caption = 'C'#243'digo de Barras:'
    end
    object Label2: TLabel
      Left = 16
      Top = 125
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 515
      Height = 26
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'BUSCA DE KITS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object grdKits: TDBGrid
      Left = 0
      Top = 168
      Width = 517
      Height = 312
      Align = alCustom
      DataSource = dsKits
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grdKitsDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_kit'
          Title.Caption = 'Codigo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_kit'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
    object edCod: TEdit
      Left = 16
      Top = 58
      Width = 121
      Height = 21
      TabOrder = 2
      OnEnter = edCodEnter
      OnKeyUp = edCodBarraKeyUp
    end
    object edCodBarra: TEdit
      Left = 16
      Top = 101
      Width = 121
      Height = 21
      TabOrder = 3
      OnEnter = edCodBarraEnter
      OnKeyUp = edCodBarraKeyUp
    end
    object edNome: TEdit
      Left = 16
      Top = 141
      Width = 209
      Height = 21
      TabOrder = 4
      OnKeyUp = edCodBarraKeyUp
    end
  end
  object qyKits: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT k.*, b.cd_codigo_barras as cd_codigo_barras, NR_PARCELAS'
      'FROM '
      '  comp_kits k'
      
        'LEFT JOIN comp_codigo_barras b on (b.cd_kit = k.cd_kit AND b.sn_' +
        'cantina = 0)'
      'ORDER BY '
      '  nm_Kit')
    Params = <>
    Left = 80
    Top = 264
    object qyKitscd_kit: TIntegerField
      FieldName = 'cd_kit'
      Required = True
    end
    object qyKitsnm_kit: TStringField
      FieldName = 'nm_kit'
      Size = 50
    end
    object qyKitsme_observacao: TMemoField
      FieldName = 'me_observacao'
      BlobType = ftMemo
    end
    object qyKitscd_coidigo_barras: TStringField
      FieldName = 'cd_codigo_barras'
      Size = 30
    end
    object qyKitsNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
  end
  object dsKits: TDataSource
    DataSet = qyKits
    Left = 112
    Top = 264
  end
end
