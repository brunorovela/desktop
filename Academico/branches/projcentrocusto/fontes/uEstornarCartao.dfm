object frmEstornarOperacao: TfrmEstornarOperacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Estornar opera'#231#227'o'
  ClientHeight = 674
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 674
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 293
      Width = 181
      Height = 16
      Caption = 'Valores totais da opera'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 20
      Top = 378
      Width = 142
      Height = 13
      Caption = 'Parcelas a serem estornadas:'
    end
    object Label3: TLabel
      Left = 20
      Top = 41
      Width = 236
      Height = 16
      Caption = 'Conta da opera'#231#227'o a ser estornada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbContaEstornada: TLabel
      Left = 20
      Top = 63
      Width = 92
      Height = 13
      Caption = '<aqui vai a conta>'
    end
    object Label5: TLabel
      Left = 20
      Top = 90
      Width = 105
      Height = 16
      Caption = 'Administradora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAdministradora: TLabel
      Left = 20
      Top = 112
      Width = 136
      Height = 13
      Caption = '<aqui vai a administradora>'
    end
    object Label7: TLabel
      Left = 20
      Top = 140
      Width = 116
      Height = 16
      Caption = 'Tipo de opera'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTipoOperacao: TLabel
      Left = 20
      Top = 162
      Width = 110
      Height = 13
      Caption = '<aqui vai a opera'#231#227'o>'
    end
    object Label4: TLabel
      Left = 20
      Top = 188
      Width = 124
      Height = 16
      Caption = 'Motivo do estorno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 633
      Width = 836
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnEstornar: TSpeedButton
        Tag = 1
        Left = 0
        Top = 0
        Width = 418
        Height = 41
        Hint = 'Estornar'
        Align = alLeft
        Caption = 'Estornar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEstornarClick
        ExplicitLeft = 1
        ExplicitTop = 5
      end
      object btnCancelar: TSpeedButton
        Left = 418
        Top = 0
        Width = 418
        Height = 41
        Align = alRight
        Caption = 'Cancelar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
          FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = btnCancelarClick
        ExplicitLeft = 553
      end
    end
    object pnRemessaTit: TPanel
      Left = 0
      Top = 0
      Width = 836
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'ESTORNAR OPERA'#199#195'O'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnParcelas: TPanel
      Left = 0
      Top = 396
      Width = 836
      Height = 237
      Align = alBottom
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 834
        Height = 235
        Align = alClient
        DataSource = dsParcelas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_parcela'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_vencimento'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_valor_parcela'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_taxa'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_liquido'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_caixa'
            Width = 270
            Visible = True
          end>
      end
    end
    object sgTotais: TStringGrid
      AlignWithMargins = True
      Left = 20
      Top = 315
      Width = 348
      Height = 51
      Margins.Left = 20
      Margins.Top = 290
      Margins.Right = 0
      Margins.Bottom = 30
      TabStop = False
      Align = alLeft
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ScrollBars = ssNone
      TabOrder = 3
      ColWidths = (
        64
        64
        64)
    end
    object mMotivoEstorno: TMemo
      Left = 20
      Top = 210
      Width = 348
      Height = 73
      Lines.Strings = (
        'mMotivoEstorno')
      MaxLength = 254
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
  object qyParcelas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'fcp.cd_parcela,'
      #9'fcp.dt_vencimento,'
      #9'fcp.vl_valor_parcela,'
      #9'fco.nr_taxa,'
      
        #9'ROUND(fcp.vl_valor_parcela - (fcp.vl_valor_parcela * (fco.nr_ta' +
        'xa / 100)), 2) AS vl_liquido,'
      #9'fcc.ds_caixa'
      'FROM'
      #9'fin_cartao_parcelas fcp'
      'INNER JOIN fin_cartao_operacao fco ON ('
      #9'fco.cd_operacao = fcp.cd_operacao'
      ')'
      
        'INNER JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = fco.cd_cai' +
        'xa)'
      'WHERE'
      #9'fcp.cd_parcela IN (%s)')
    Params = <>
    Left = 8
    Top = 488
    object qyParcelascd_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'cd_parcela'
      Required = True
    end
    object qyParcelasdt_vencimento: TDateField
      DisplayLabel = 'Data Prev. Pag.'
      FieldName = 'dt_vencimento'
      Required = True
    end
    object qyParcelasvl_valor_parcela: TFloatField
      DisplayLabel = 'Valor pago'
      FieldName = 'vl_valor_parcela'
      Required = True
    end
    object qyParcelasnr_taxa: TFloatField
      DisplayLabel = 'Taxa'
      FieldName = 'nr_taxa'
    end
    object qyParcelasvl_liquido: TFloatField
      DisplayLabel = 'Valor l'#237'quido'
      FieldName = 'vl_liquido'
      ReadOnly = True
    end
    object qyParcelasds_caixa: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'ds_caixa'
      Size = 255
    end
  end
  object dsParcelas: TDataSource
    DataSet = qyParcelas
    Left = 40
    Top = 488
  end
end
