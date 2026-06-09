object frm_fluxo_caixa: Tfrm_fluxo_caixa
  Left = 0
  Top = 0
  Caption = 'Fluxo de Caixa'
  ClientHeight = 403
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 729
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'FLUXO DE CAIXA'
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
    Top = 30
    Width = 729
    Height = 114
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel3: TBevel
      Left = 712
      Top = 0
      Width = 17
      Height = 114
      Align = alRight
      Shape = bsSpacer
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 322
      Height = 114
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lbDataFinal: TLabel
        Left = 16
        Top = 44
        Width = 52
        Height = 13
        Caption = 'Data Final:'
      end
      object lbDataInicial: TLabel
        Left = 16
        Top = 3
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
      end
      object SpeedButton1: TSpeedButton
        Left = 136
        Top = 8
        Width = 121
        Height = 24
        Caption = 'Montar Fluxo'
        OnClick = SpeedButton1Click
      end
      object dtpDataFinal: TDateTimePicker
        Left = 16
        Top = 60
        Width = 95
        Height = 23
        Date = 38226.658378553240000000
        Format = 'dd/MM/yyyy'
        Time = 38226.658378553240000000
        TabOrder = 0
      end
      object dtpDataInicial: TDateTimePicker
        Left = 16
        Top = 19
        Width = 97
        Height = 23
        Date = 38226.657847233790000000
        Format = 'dd/MM/yyyy'
        Time = 38226.657847233790000000
        TabOrder = 1
      end
    end
    object DBGrid2: TDBGrid
      Left = 322
      Top = 0
      Width = 390
      Height = 114
      Align = alClient
      DataSource = srcContas
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_caixa'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_banco'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_conta'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValSaldo'
          Width = 70
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 144
    Width = 729
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel1: TBevel
      Left = 0
      Top = 16
      Width = 17
      Height = 201
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel2: TBevel
      Left = 712
      Top = 16
      Width = 17
      Height = 201
      Align = alRight
      Shape = bsSpacer
    end
    object DBGrid1: TDBGrid
      Left = 17
      Top = 16
      Width = 695
      Height = 201
      Align = alClient
      DataSource = srcFluxo
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'dt_data'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_cr_previsto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_cr_realizado'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_cp_previsto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_cp_realizado'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_saldo'
          Width = 90
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 729
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 361
    Width = 729
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
  end
  object qyFluxo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   * '
      'FROM'
      '   temp_fluxo_caixa'
      'ORDER BY '
      '   dt_data')
    Params = <>
    Left = 600
    Top = 48
    object qyFluxodt_data: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'dt_data'
      Origin = 'WMESTRE12.temp_fluxo_caixa.dt_data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyFluxovl_cp_previsto: TFloatField
      DisplayLabel = 'C.P. Previsto'
      FieldName = 'vl_cp_previsto'
      Origin = 'WMESTRE12.temp_fluxo_caixa.vl_cp_previsto'
      DisplayFormat = '#,###,##0.00'
    end
    object qyFluxovl_cp_realizado: TFloatField
      DisplayLabel = 'C.P. Realizado'
      FieldName = 'vl_cp_realizado'
      Origin = 'WMESTRE12.temp_fluxo_caixa.vl_cp_realizado'
      DisplayFormat = '#,###,##0.00'
    end
    object qyFluxovl_cr_previsto: TFloatField
      DisplayLabel = 'C.R. Previsto'
      FieldName = 'vl_cr_previsto'
      Origin = 'WMESTRE12.temp_fluxo_caixa.vl_cr_previsto'
      DisplayFormat = '#,###,##0.00'
    end
    object qyFluxovl_cr_realizado: TFloatField
      DisplayLabel = 'C.R. Realizado'
      FieldName = 'vl_cr_realizado'
      Origin = 'WMESTRE12.temp_fluxo_caixa.vl_cr_realizado'
      DisplayFormat = '#,###,##0.00'
    end
    object qyFluxovl_saldo: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'vl_saldo'
      Origin = 'WMESTRE12.temp_fluxo_caixa.vl_saldo'
      DisplayFormat = '#,###,##0.00'
    end
  end
  object srcFluxo: TDataSource
    AutoEdit = False
    DataSet = qyFluxo
    Left = 632
    Top = 48
  end
  object qyContas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyContasCalcFields
    SQL.Strings = (
      'SELECT'
      '   * '
      'FROM'
      '   fin_cadastro_contas'
      'WHERE'
      '   sn_ativa = '#39'S'#39
      'ORDER BY '
      '   ds_caixa')
    Params = <>
    Left = 600
    Top = 80
    object qyContascd_caixa: TIntegerField
      DisplayLabel = 'C'#243'd. Conta'
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.fin_cadastro_contas.cd_caixa'
    end
    object qyContasds_caixa: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ds_caixa'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_caixa'
      Size = 255
    end
    object qyContasnm_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'nm_banco'
      Origin = 'WMESTRE12.fin_cadastro_contas.nm_banco'
      Size = 100
    end
    object qyContasnr_conta: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'nr_conta'
      Origin = 'WMESTRE12.fin_cadastro_contas.nr_conta'
      Size = 30
    end
    object qyContasnr_float_bancario: TSmallintField
      DisplayLabel = 'Float'
      FieldName = 'nr_float_bancario'
      Origin = 'WMESTRE12.fin_cadastro_contas.nr_float_bancario'
    end
    object qyContasValSaldo: TCurrencyField
      DisplayLabel = 'Saldo Atual'
      FieldKind = fkCalculated
      FieldName = 'ValSaldo'
      DisplayFormat = '#,###,##0.00'
      Calculated = True
    end
  end
  object srcContas: TDataSource
    AutoEdit = False
    DataSet = qyContas
    Left = 632
    Top = 80
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 632
    Top = 112
  end
  object qyValor: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 600
    Top = 112
  end
end
