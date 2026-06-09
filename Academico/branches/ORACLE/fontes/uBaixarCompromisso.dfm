object FrmBaixarCompromisso: TFrmBaixarCompromisso
  Left = 216
  Top = 190
  Caption = 'Baixar Compromisso'
  ClientHeight = 505
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BAIXAR COMPROMISSO(S) SELECIONADO(S)'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object pnConta: TPanel
    Left = 0
    Top = 272
    Width = 592
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label14: TLabel
      Left = 17
      Top = 1
      Width = 178
      Height = 13
      Caption = 'Efetuar Pagamento atrav'#233's da Conta:'
    end
    object Label16: TLabel
      Left = 17
      Top = 41
      Width = 104
      Height = 13
      Caption = 'Forma de Pagamento:'
    end
    object Label17: TLabel
      Left = 416
      Top = 41
      Width = 95
      Height = 13
      Caption = 'N'#250'mero do Cheque:'
    end
    object cbFormaPgto: TComboBox
      Left = 17
      Top = 56
      Width = 385
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = cbFormaPgtoChange
    end
    object edNrCheque: TEdit
      Left = 416
      Top = 56
      Width = 153
      Height = 21
      TabOrder = 1
      OnKeyPress = edNrChequeKeyPress
    end
    object cbContas: TComboBox
      Left = 17
      Top = 16
      Width = 385
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
  end
  object pnCompromisso: TPanel
    Left = 0
    Top = 25
    Width = 592
    Height = 157
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 344
      Top = 131
      Width = 117
      Height = 13
      Caption = 'Valor Total a Baixar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grd: TDBGrid
      Left = 14
      Top = 8
      Width = 553
      Height = 114
      BorderStyle = bsNone
      DataSource = scrCompromisso
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_titulo'
          Title.Caption = 'Ref.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_pessoa'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_despesa'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_documento'
          Title.Caption = 'N'#186' Doc.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_vencimento'
          Title.Caption = 'Vencimento'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valPendente'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Width = 65
          Visible = True
        end>
    end
    object Edit1: TEdit
      Left = 471
      Top = 128
      Width = 96
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnBaixa: TPanel
    Left = 0
    Top = 352
    Width = 592
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel3: TBevel
      Left = 0
      Top = 52
      Width = 592
      Height = 5
      Align = alBottom
      Shape = bsTopLine
      ExplicitWidth = 583
    end
    object Label7: TLabel
      Left = 17
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Valor Total:'
    end
    object Label8: TLabel
      Left = 159
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Valor de Multa:'
    end
    object Label12: TLabel
      Left = 304
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Valor de Juros:'
    end
    object Label13: TLabel
      Left = 449
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Valor Liquidado:'
    end
    object txtValorTotalPago: TEdit
      Left = 17
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = txtValorTotalPagoExit
      OnKeyPress = txtValorTotalPagoKeyPress
    end
    object txtValorMulta: TEdit
      Left = 160
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 1
      OnExit = txtValorMultaExit
      OnKeyPress = txtValorTotalPagoKeyPress
    end
    object txtValorJuros: TEdit
      Left = 304
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      OnExit = txtValorJurosExit
      OnKeyPress = txtValorTotalPagoKeyPress
    end
    object txtValorLiquidado: TEdit
      Left = 448
      Top = 24
      Width = 121
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 3
      OnKeyPress = txtValorTotalPagoKeyPress
    end
  end
  object BitBtn1: TBitBtn
    Left = 383
    Top = 458
    Width = 107
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 5
    OnClick = BitBtn1Click
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 496
    Top = 461
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object pnAcaoMovimento: TPanel
    Left = 0
    Top = 223
    Width = 592
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label15: TLabel
      Left = 17
      Top = 2
      Width = 98
      Height = 13
      Caption = 'A'#231#227'o do Movimento:'
    end
    object cbAcaoMovimento: TComboBox
      Left = 17
      Top = 19
      Width = 385
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cbAcaoMovimentoKeyPress
    end
  end
  object pnUnidadeEnsino: TPanel
    Left = 0
    Top = 182
    Width = 592
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 7
    object Label2: TLabel
      Left = 17
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
  end
  object qyCompromisso: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyCompromissoCalcFields
    SQL.Strings = (
      'SELECT'
      #9'cp.*, p.nm_pessoa,'
      #9'SUM(m.vl_entrada) AS vl_entradas,'
      #9'SUM(m.vl_saida) AS vl_saidas'
      'FROM'
      #9'fin_contas_pagar cp'
      #9'LEFT JOIN fin_mov_cp m ON (m.cd_titulo = cp.cd_titulo),'
      #9'pessoas p'
      'WHERE'
      #9'p.cd_pessoa = cp.cd_pessoa AND'
      '               cp.cd_titulo = :cd_titulo'
      'GROUP BY'
      #9'cp.cd_titulo'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end>
    Left = 552
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end>
    object qyCompromissocd_titulo: TIntegerField
      DisplayLabel = 'Cod. T'#237'tulo'
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_titulo'
    end
    object qyCompromissocd_pessoa: TIntegerField
      DisplayLabel = 'C'#243'd. Fornecedor'
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_pessoa'
    end
    object qyCompromissonm_pessoa: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
    object qyCompromissods_despesa: TStringField
      DisplayLabel = 'Hist'#243'rico do compromisso'
      FieldName = 'ds_despesa'
      Origin = 'WMESTRE12.fin_contas_pagar.ds_despesa'
      Size = 255
    end
    object qyCompromissodescTipoTitulo: TStringField
      DisplayLabel = 'Tipo do T'#237'tulo'
      FieldKind = fkLookup
      FieldName = 'descTipoTitulo'
      LookupDataSet = DM.qyTiposTitulo
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'cd_tipo_titulo'
      Size = 40
      Lookup = True
    end
    object qyCompromissocd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_tipo_titulo'
    end
    object qyCompromissonr_documento: TStringField
      DisplayLabel = 'N'#186' Doc. (Nota/Recibo)'
      FieldName = 'nr_documento'
      Origin = 'WMESTRE12.fin_contas_pagar.nr_documento'
      Size = 50
    end
    object qyCompromissonr_parcela: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'nr_parcela'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_emissao_nota'
    end
    object qyCompromissodt_emissao_nota: TDateTimeField
      DisplayLabel = 'Data de Emiss'#227'o da Nota'
      FieldName = 'dt_emissao_nota'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_emissao_nota'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_lancamento: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'dt_lancamento'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_lancamento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_competencia: TDateTimeField
      DisplayLabel = 'Data da Compet'#234'ncia'
      FieldName = 'dt_competencia'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_competencia'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_vencimento: TDateTimeField
      DisplayLabel = 'Data de Vencimento'
      FieldName = 'dt_vencimento'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_vencimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissodt_provavel_pgto: TDateTimeField
      DisplayLabel = 'Data para Prov'#225'vel Pgto'
      FieldName = 'dt_provavel_pgto'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_provavel_pgto'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyCompromissovl_despesa: TFloatField
      DisplayLabel = 'Valor do Compromisso'
      FieldName = 'vl_despesa'
      Origin = 'WMESTRE12.fin_contas_pagar.vl_despesa'
    end
    object qyCompromissocd_situacao: TSmallintField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_situacao'
    end
    object qyCompromissosn_previsao: TStringField
      DisplayLabel = 'Somente Previs'#227'o'
      FieldName = 'sn_previsao'
      Origin = 'WMESTRE12.fin_contas_pagar.sn_previsao'
      FixedChar = True
      Size = 1
    end
    object qyCompromissotp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.fin_contas_pagar.tp_entrada_saida'
    end
    object qyCompromissodes_completa_titulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'des_completa_titulo'
      Calculated = True
    end
    object qyCompromissovl_entradas: TFloatField
      FieldName = 'vl_entradas'
      Origin = 'WMESTRE12.fin_mov_cp.vl_entrada'
    end
    object qyCompromissovl_saidas: TFloatField
      FieldName = 'vl_saidas'
      Origin = 'WMESTRE12.fin_mov_cp.vl_saida'
    end
    object qyCompromissovalPendente: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'valPendente'
      Calculated = True
    end
    object qyCompromissocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_coligada'
    end
    object qyCompromissocd_forma_pgto: TIntegerField
      FieldName = 'cd_forma_pgto'
      Origin = 'WMESTRE12.fin_contas_pagar.cd_forma_pgto'
    end
    object qyCompromissonr_cheque: TIntegerField
      FieldName = 'nr_cheque'
      Origin = 'WMESTRE12.fin_contas_pagar.nr_cheque'
    end
  end
  object scrCompromisso: TDataSource
    DataSet = qyCompromisso
    Left = 552
    Top = 8
  end
  object qyAcao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_tipos_movimento '
      'where cd_tipo_movimento = 1'
      'ORDER by ds_movimento')
    Params = <>
    Left = 552
    Top = 73
  end
  object srcAcao: TDataSource
    DataSet = qyAcao
    Left = 552
    Top = 105
  end
end
