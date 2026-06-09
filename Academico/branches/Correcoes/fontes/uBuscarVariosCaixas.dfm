object frmBuscarVariosCaixas: TfrmBuscarVariosCaixas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Filtrar em v'#225'rios caixas'
  ClientHeight = 590
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FLbTDataMov: TLabel
    Left = 8
    Top = 50
    Width = 115
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data de movimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbDataMovAte: TLabel
    Left = 259
    Top = 50
    Width = 16
    Height = 13
    Caption = 'at'#233
  end
  object FLbTDataReg: TLabel
    Left = 8
    Top = 84
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data de registro:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbDataRegAte: TLabel
    Left = 259
    Top = 84
    Width = 16
    Height = 13
    Caption = 'at'#233
  end
  object FLbTUsuario: TLabel
    Left = 8
    Top = 114
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTEntSaida: TLabel
    Left = 8
    Top = 146
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = 'Entrada/Sa'#237'da:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTOrigem: TLabel
    Left = 8
    Top = 213
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Origem:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTVlLancamento: TLabel
    Left = 8
    Top = 478
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor do lan'#231'amento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTHist: TLabel
    Left = 8
    Top = 246
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Hist'#243'rico:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTCompensado: TLabel
    Left = 8
    Top = 180
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'Compensado?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTPlanoContas: TLabel
    Left = 8
    Top = 316
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = 'Plano de contas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FLbTCentroCusto: TLabel
    Left = 8
    Top = 343
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = 'Centro de Custo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPlanoContas: TSpeedButton
    Left = 370
    Top = 316
    Width = 33
    Height = 23
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    OnClick = btnPlanoContasClick
  end
  object Label1: TLabel
    Left = 5
    Top = 18
    Width = 126
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo de movimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 368
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'Caixas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbMarcar: TSpeedButton
    Left = 368
    Top = 368
    Width = 25
    Height = 22
    Hint = 'Ativar todos'
    Flat = True
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
    OnClick = sbMarcarClick
  end
  object sbDesmarcar: TSpeedButton
    Left = 368
    Top = 391
    Width = 25
    Height = 22
    Hint = 'Desativar todos'
    Flat = True
    Glyph.Data = {
      76030000424D7603000000000000360000002800000011000000100000000100
      18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
      999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
      9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
      FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
      99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
      9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
      999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
      FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
      999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
      9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
    OnClick = sbDesmarcarClick
  end
  object FCbDataMov: TCheckBox
    Left = 129
    Top = 49
    Width = 39
    Height = 17
    Caption = 'De:'
    TabOrder = 0
    OnClick = FCbDataMovClick
  end
  object FDtDataMovIni: TDateTimePicker
    Left = 167
    Top = 48
    Width = 86
    Height = 21
    Date = 39897.000000000000000000
    Time = 39897.000000000000000000
    Enabled = False
    TabOrder = 1
  end
  object FDtDataMovFim: TDateTimePicker
    Left = 276
    Top = 48
    Width = 86
    Height = 21
    Date = 39897.999988425920000000
    Time = 39897.999988425920000000
    Enabled = False
    TabOrder = 2
  end
  object FCbDataReg: TCheckBox
    Left = 129
    Top = 83
    Width = 39
    Height = 17
    Caption = 'De:'
    TabOrder = 3
    OnClick = FCbDataRegClick
  end
  object FDtDataRegIni: TDateTimePicker
    Left = 167
    Top = 81
    Width = 86
    Height = 21
    Date = 39897.000000000000000000
    Time = 39897.000000000000000000
    Enabled = False
    TabOrder = 4
  end
  object FDtDataRegFim: TDateTimePicker
    Left = 276
    Top = 81
    Width = 86
    Height = 21
    Date = 39897.999988425920000000
    Time = 39897.999988425920000000
    Enabled = False
    TabOrder = 5
  end
  object FCbUsuarios: TComboBox
    Left = 124
    Top = 114
    Width = 238
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 6
  end
  object FCbTpEntSaida: TComboBox
    Left = 124
    Top = 146
    Width = 184
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 3
    ParentFont = False
    TabOrder = 7
    Text = 'TODOS'
    Items.Strings = (
      'Abertura de caixa'
      'Entrada de valores'
      'Sa'#237'da de valores'
      'TODOS')
  end
  object FCbOrigem: TComboBox
    Left = 124
    Top = 213
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 0
    ParentFont = False
    TabOrder = 8
    Text = 'QUALQUER'
    Items.Strings = (
      'QUALQUER'
      'Contas a receber'
      'Contas a pagar'
      'Tesouraria')
  end
  object FCbVlMaiorIgual: TCheckBox
    Left = 26
    Top = 498
    Width = 114
    Height = 17
    Caption = 'Igual ou maior que:'
    TabOrder = 9
    OnClick = FCbVlMaiorIgualClick
  end
  object FCbVlMenorIgual: TCheckBox
    Left = 26
    Top = 529
    Width = 114
    Height = 17
    Caption = 'Menor ou igual que:'
    TabOrder = 10
    OnClick = FCbVlMenorIgualClick
  end
  object FEdVlMaiorIgual: TEdit
    Left = 146
    Top = 498
    Width = 118
    Height = 21
    Enabled = False
    TabOrder = 11
    OnKeyPress = ValidaCampo
  end
  object FEdVlMenorIgual: TEdit
    Left = 146
    Top = 529
    Width = 118
    Height = 21
    Enabled = False
    TabOrder = 12
    OnKeyPress = ValidaCampo
  end
  object FMmHist: TMemo
    Left = 124
    Top = 246
    Width = 238
    Height = 58
    TabOrder = 13
  end
  object FCbCentroCusto: TComboBox
    Left = 124
    Top = 343
    Width = 238
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 14
  end
  object FCbCompensado: TComboBox
    Left = 124
    Top = 180
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 2
    ParentFont = False
    TabOrder = 15
    Text = 'AMBOS'
    Items.Strings = (
      'N'#227'o'
      'Sim'
      'AMBOS')
  end
  object FBnOK: TBitBtn
    Left = 7
    Top = 555
    Width = 130
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 16
    OnClick = FBnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object FBnCancelar: TBitBtn
    Left = 143
    Top = 555
    Width = 130
    Height = 25
    TabOrder = 17
    Kind = bkCancel
  end
  object txtPlanoConta: TEdit
    Left = 124
    Top = 316
    Width = 238
    Height = 21
    TabOrder = 18
  end
  object edCodMov: TEdit
    Left = 137
    Top = 15
    Width = 225
    Height = 21
    TabOrder = 19
    OnKeyPress = ValidaCampo
  end
  object clbCaixas: TCheckListBox
    Left = 124
    Top = 368
    Width = 238
    Height = 105
    ItemHeight = 13
    TabOrder = 20
  end
  object qyCaixas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'c.*, t.ds_tipo'
      'FROM'
      #9'fin_cadastro_contas c,'
      #9'fin_cadastro_contas_tipos t'
      'WHERE'
      #9't.cd_tipo = c.tp_conta'
      'ORDER BY'
      #9'c.sn_ativa = "S",'
      #9'c.cd_caixa;'
      '')
    Params = <>
    Left = 328
    Top = 184
    object qyCaixascd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Required = True
    end
    object qyCaixascd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qyCaixassn_todas_coligadas: TSmallintField
      FieldName = 'sn_todas_coligadas'
      Required = True
    end
    object qyCaixasds_caixa: TStringField
      FieldName = 'ds_caixa'
      Size = 255
    end
    object qyCaixasds_observacao: TMemoField
      FieldName = 'ds_observacao'
      BlobType = ftMemo
    end
    object qyCaixastp_conta: TSmallintField
      FieldName = 'tp_conta'
    end
    object qyCaixasnm_banco: TStringField
      FieldName = 'nm_banco'
      Size = 100
    end
    object qyCaixasnr_banco: TStringField
      FieldName = 'nr_banco'
      Size = 30
    end
    object qyCaixasnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Size = 30
    end
    object qyCaixasnm_agencia: TStringField
      FieldName = 'nm_agencia'
      Size = 100
    end
    object qyCaixasnr_conta: TStringField
      FieldName = 'nr_conta'
      Size = 30
    end
    object qyCaixasnr_float_bancario: TSmallintField
      FieldName = 'nr_float_bancario'
    end
    object qyCaixasdt_criacao: TDateTimeField
      FieldName = 'dt_criacao'
    end
    object qyCaixasvl_saldo_inicio: TFloatField
      FieldName = 'vl_saldo_inicio'
    end
    object qyCaixassn_ativa: TStringField
      FieldName = 'sn_ativa'
      Size = 1
    end
    object qyCaixassn_conta_resultado: TSmallintField
      FieldName = 'sn_conta_resultado'
      Required = True
    end
    object qyCaixasnr_uso_banco: TStringField
      FieldName = 'nr_uso_banco'
    end
    object qyCaixasds_mensagem_bloqueto: TMemoField
      FieldName = 'ds_mensagem_bloqueto'
      BlobType = ftMemo
    end
    object qyCaixassn_multa: TStringField
      FieldName = 'sn_multa'
      Size = 1
    end
    object qyCaixassn_juros: TStringField
      FieldName = 'sn_juros'
      Size = 1
    end
    object qyCaixassn_correcao: TStringField
      FieldName = 'sn_correcao'
      Size = 1
    end
    object qyCaixassn_juros_mensal: TStringField
      FieldName = 'sn_juros_mensal'
      Size = 1
    end
    object qyCaixasvl_multa_percent: TFloatField
      FieldName = 'vl_multa_percent'
    end
    object qyCaixasvl_juros_percent: TFloatField
      FieldName = 'vl_juros_percent'
    end
    object qyCaixasvl_juros_mensal: TFloatField
      FieldName = 'vl_juros_mensal'
    end
    object qyCaixasnr_dias_acrescimo: TIntegerField
      FieldName = 'nr_dias_acrescimo'
    end
    object qyCaixasnr_dias_desconto: TIntegerField
      FieldName = 'nr_dias_desconto'
    end
    object qyCaixasvl_dias_desc_perc: TFloatField
      FieldName = 'vl_dias_desc_perc'
    end
    object qyCaixasnr_carteira: TStringField
      FieldName = 'nr_carteira'
    end
    object qyCaixasnr_convenio: TStringField
      FieldName = 'nr_convenio'
      Size = 15
    end
    object qyCaixasnm_cedente: TStringField
      FieldName = 'nm_cedente'
      Size = 100
    end
    object qyCaixasds_cnpj_cedente: TStringField
      FieldName = 'ds_cnpj_cedente'
      Size = 50
    end
    object qyCaixasnr_transacao: TStringField
      FieldName = 'nr_transacao'
      Size = 5
    end
    object qyCaixasds_identificacao_retorno: TStringField
      FieldName = 'ds_identificacao_retorno'
      Size = 30
    end
    object qyCaixasnm_arquivo_bloqueto: TStringField
      FieldName = 'nm_arquivo_bloqueto'
      Size = 50
    end
    object qyCaixasds_nn_prefixo: TStringField
      FieldName = 'ds_nn_prefixo'
    end
    object qyCaixasnr_ultimo_cheque: TIntegerField
      FieldName = 'nr_ultimo_cheque'
    end
    object qyCaixasdt_saldo_base: TDateTimeField
      FieldName = 'dt_saldo_base'
    end
    object qyCaixasnr_nn_ultimo: TIntegerField
      FieldName = 'nr_nn_ultimo'
    end
    object qyCaixasnr_nn_tamanho: TLargeintField
      FieldName = 'nr_nn_tamanho'
    end
    object qyCaixascd_boleto_online: TLargeintField
      FieldName = 'cd_boleto_online'
    end
    object qyCaixascd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
    end
    object qyCaixascd_conta_desconto: TLargeintField
      FieldName = 'cd_conta_desconto'
    end
    object qyCaixascd_conta_acrescimo: TLargeintField
      FieldName = 'cd_conta_acrescimo'
    end
    object qyCaixassn_saldo_disponivel: TSmallintField
      FieldName = 'sn_saldo_disponivel'
    end
    object qyCaixasds_categoria: TStringField
      FieldName = 'ds_categoria'
      Size = 100
    end
    object qyCaixascd_conta_tarifa: TLargeintField
      FieldName = 'cd_conta_tarifa'
    end
    object qyCaixascd_centro_tarifa: TLargeintField
      FieldName = 'cd_centro_tarifa'
    end
    object qyCaixasds_grupo_categoria: TStringField
      FieldName = 'ds_grupo_categoria'
      Size = 100
    end
    object qyCaixassn_transf_aberta: TSmallintField
      FieldName = 'sn_transf_aberta'
    end
    object qyCaixassn_ignorar_dda: TSmallintField
      FieldName = 'sn_ignorar_dda'
    end
    object qyCaixascd_historico_baixa: TLargeintField
      FieldName = 'cd_historico_baixa'
    end
    object qyCaixasds_historico_baixa: TStringField
      FieldName = 'ds_historico_baixa'
      Size = 250
    end
    object qyCaixascd_historico_desc: TLargeintField
      FieldName = 'cd_historico_desc'
    end
    object qyCaixasds_historico_desc: TStringField
      FieldName = 'ds_historico_desc'
      Size = 250
    end
    object qyCaixascd_historico_juros: TLargeintField
      FieldName = 'cd_historico_juros'
    end
    object qyCaixasds_historico_juros: TStringField
      FieldName = 'ds_historico_juros'
      Size = 250
    end
    object qyCaixascd_conta_desc_cp: TLargeintField
      FieldName = 'cd_conta_desc_cp'
    end
    object qyCaixascd_conta_multa_cp: TLargeintField
      FieldName = 'cd_conta_multa_cp'
    end
    object qyCaixascd_conta_juros_cp: TLargeintField
      FieldName = 'cd_conta_juros_cp'
    end
    object qyCaixasds_tipo: TStringField
      FieldName = 'ds_tipo'
      Size = 255
    end
  end
end
