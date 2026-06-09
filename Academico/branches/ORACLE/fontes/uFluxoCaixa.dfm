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
        Top = 46
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
      object umdtInicial: TUMDateTimePicker
        Left = 16
        Top = 22
        Width = 90
        Height = 21
        BevelOuter = bvNone
        TabOrder = 0
        ImgBotaoCalendario.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
          D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
          C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
          A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
          3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
          D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
          97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
          BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
          F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
          E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
          81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
          ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
          D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
          BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
          FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
          ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
          D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
          F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
          DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
          49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
          ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
          83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
          287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
          E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
          9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
        Date = 42256.000000000000000000
      end
      object umdtFinal: TUMDateTimePicker
        Left = 16
        Top = 65
        Width = 90
        Height = 21
        BevelOuter = bvNone
        TabOrder = 1
        ImgBotaoCalendario.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
          D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
          C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
          A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
          3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
          D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
          97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
          BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
          F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
          E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
          81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
          ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
          D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
          BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
          FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
          ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
          D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
          F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
          DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
          49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
          ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
          83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
          287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
          E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
          9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
        Date = 42256.000000000000000000
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
