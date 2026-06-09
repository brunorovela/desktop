object frmPlanosDesconto: TfrmPlanosDesconto
  Left = 232
  Top = 234
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Planos de Desconto...'
  ClientHeight = 330
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 330
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 0
    object Bevel1: TBevel
      Left = 4
      Top = 29
      Width = 664
      Height = 10
      Align = alTop
      Shape = bsSpacer
    end
    object Bevel2: TBevel
      Left = 4
      Top = 275
      Width = 664
      Height = 10
      Align = alBottom
      Shape = bsSpacer
    end
    object Bevel3: TBevel
      Left = 4
      Top = 39
      Width = 7
      Height = 236
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = -5
      ExplicitTop = 43
    end
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 664
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'APLICAR PLANOS DE DESCONTO'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object lst: TCheckListBox
      Left = 362
      Top = 38
      Width = 299
      Height = 218
      OnClickCheck = lstClickCheck
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 4
      Top = 285
      Width = 664
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object btnAplicar: TSpeedButton
        Left = 224
        Top = 8
        Width = 183
        Height = 25
        Caption = 'F7 Aplicar como desconto fixo'
        OnClick = btnAplicarClick
      end
      object btnSelecionar: TSpeedButton
        Left = 416
        Top = 8
        Width = 145
        Height = 25
        Caption = 'F8 Selecionar Todas'
        Glyph.Data = {
          82020000424D8202000000000000420000002800000011000000100000000100
          10000300000040020000C30E0000C30E00000000000000000000007C0000E003
          00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
          734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
          FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
          FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
          734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
          0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
          734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
          FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
          FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
          734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
          734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
          0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
          FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
          734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7F0000}
        OnClick = btnSelecionarClick
      end
      object btnAplicarEmDia: TSpeedButton
        Left = 8
        Top = 8
        Width = 207
        Height = 25
        Caption = 'F6 Aplicar desconto para pgto em dia'
        OnClick = btnAplicarEmDiaClick
      end
      object btnSair: TSpeedButton
        Left = 568
        Top = 8
        Width = 89
        Height = 25
        Caption = 'F12 Fechar'
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
          1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
          1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
          1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
          1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
          1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
          1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
          1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
          1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
          1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
          1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
          1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = btnSairClick
      end
    end
    object ckManterDesconto: TCheckBox
      Left = 367
      Top = 258
      Width = 152
      Height = 17
      Caption = 'Manter desconto do plano'
      TabOrder = 3
      OnClick = ckManterDescontoClick
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 33
      Width = 360
      Height = 243
      ActivePage = TabSheet1
      Style = tsFlatButtons
      TabOrder = 4
      OnChanging = PageControl1Changing
      object TabSheet1: TTabSheet
        Caption = 'Planos de Desconto'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grd: TDBGrid
          Left = 0
          Top = 0
          Width = 352
          Height = 211
          Align = alClient
          DataSource = dtcPlanosDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          PopupMenu = pmQtd
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnKeyPress = grdKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'DescricaoPlano'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PercentualDesconto'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorDesconto'
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Desconto Programado'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 13
          Top = 16
          Width = 83
          Height = 14
          Caption = 'Plano / Conv'#234'nio:'
        end
        object Label2: TLabel
          Left = 13
          Top = 36
          Width = 52
          Height = 14
          Caption = 'Descri'#231#227'o:'
        end
        object Label3: TLabel
          Left = 13
          Top = 56
          Width = 69
          Height = 14
          Caption = 'Data Validade:'
        end
        object Label4: TLabel
          Left = 13
          Top = 76
          Width = 68
          Height = 14
          Caption = 'Parcela Inicial:'
        end
        object Label5: TLabel
          Left = 13
          Top = 96
          Width = 64
          Height = 14
          Caption = 'Parcela Final:'
        end
        object Label6: TLabel
          Left = 13
          Top = 116
          Width = 54
          Height = 14
          Caption = 'Percentual:'
        end
        object lbPlano: TLabel
          Left = 109
          Top = 16
          Width = 93
          Height = 14
          Caption = 'Plano / Conv'#234'nio:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbDescricao: TLabel
          Left = 109
          Top = 36
          Width = 57
          Height = 14
          Caption = 'Descri'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbValidade: TLabel
          Left = 109
          Top = 56
          Width = 75
          Height = 14
          Caption = 'Data Validade:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbParcInicio: TLabel
          Left = 109
          Top = 76
          Width = 77
          Height = 14
          Caption = 'Parcela Inicial:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbParcFim: TLabel
          Left = 109
          Top = 96
          Width = 71
          Height = 14
          Caption = 'Parcela Final:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbPercentual: TLabel
          Left = 109
          Top = 116
          Width = 62
          Height = 14
          Caption = 'Percentual:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object dtcPlanosDesconto: TDataSource
    DataSet = tblPlanos
    OnDataChange = dtcPlanosDescontoDataChange
    Left = 96
    Top = 264
  end
  object tblPlanos: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblPlanosNewRecord
    SQL.Strings = (
      
        'select * from PlanosDesconto WHERE cd_acao_movimento is not null' +
        ' and cd_acao_movimento <> 0'
      'ORDER BY descricaoplano, percentualdesconto')
    Params = <>
    Left = 56
    Top = 264
    object tblPlanosCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'PlanosDesconto.Codigo'
    end
    object tblPlanosDescricaoPlano: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DescricaoPlano'
      Origin = 'PlanosDesconto.DescricaoPlano'
      Size = 40
    end
    object tblPlanosPercentualDesconto: TFloatField
      DisplayLabel = '(%)'
      FieldName = 'PercentualDesconto'
      Origin = 'PlanosDesconto.PercentualDesconto'
    end
    object tblPlanosValorDesconto: TFloatField
      DisplayLabel = 'Vlr. Desconto'
      FieldName = 'ValorDesconto'
      Origin = 'PlanosDesconto.ValorDesconto'
    end
    object tblPlanoscd_acao_movimento: TLargeintField
      FieldName = 'cd_acao_movimento'
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 16
    Top = 264
  end
end
