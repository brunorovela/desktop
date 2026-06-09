object fNFSeTitulos: TfNFSeTitulos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Listagem de t'#237'tulos do lote RPS'
  ClientHeight = 518
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 0
    Width = 744
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 352
    ExplicitTop = 152
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 23
    Width = 744
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 791
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 492
    Width = 744
    Height = 3
    Align = alBottom
    Shape = bsSpacer
    ExplicitLeft = 264
    ExplicitTop = 184
    ExplicitWidth = 50
  end
  object bvlSep4: TBevel
    Left = 0
    Top = 115
    Width = 744
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 121
    ExplicitWidth = 782
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 3
    Width = 744
    Height = 20
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'T'#205'TULOS VINCULADOS AO LOTE RPS'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object tlbOpcoes: TToolBar
    Left = 0
    Top = 495
    Width = 744
    Height = 23
    Align = alBottom
    ButtonWidth = 81
    Images = ilImagens
    List = True
    ShowCaptions = True
    AllowTextButtons = True
    TabOrder = 1
    object btnSep3: TToolButton
      Left = 0
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnColunas: TToolButton
      Left = 8
      Top = 0
      ImageIndex = 1
      OnClick = btnColunasClick
    end
    object btnSep1: TToolButton
      Left = 32
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 40
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 0
      Style = tbsTextButton
      OnClick = btnFecharClick
    end
    object btnSep2: TToolButton
      Left = 125
      Top = 0
      Width = 8
      ImageIndex = 0
      Style = tbsSeparator
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 26
    Width = 744
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblTurma: TLabel
      Left = 431
      Top = 3
      Width = 34
      Height = 13
      Caption = 'Turma:'
    end
    object sbSelecionarAluno: TSpeedButton
      Left = 567
      Top = 62
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
      OnClick = sbSelecionarAlunoClick
    end
    object rgSituacao: TRadioGroup
      Left = 8
      Top = 3
      Width = 417
      Height = 80
      Caption = 'Situa'#231#227'o'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Cancelado'
        'Em protesto'
        'Pendente'
        'Pago'
        'Negociado'
        'Parcial'
        'Vencido')
      TabOrder = 0
      OnClick = rgSituacaoClick
    end
    object cbTurma: TComboBox
      Left = 431
      Top = 18
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 1
      OnSelect = cbTurmaSelect
    end
    object ledAluno: TLabeledEdit
      Left = 431
      Top = 62
      Width = 130
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Aluno:'
      TabOrder = 2
      OnKeyPress = ledAlunoKeyPress
    end
  end
  object dbgTitulos: TDBGrid
    Left = 0
    Top = 118
    Width = 744
    Height = 374
    Align = alClient
    DataSource = dsTitulos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeAluno'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigoaluno'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parcela'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datavencimento'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorbruto'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valordesconto'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorextra'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descontoextra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorjuroscalc'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valortotalcalc'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorpago'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datapagamento'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricaosituacao'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bloquetoimpresso'
        Visible = True
      end>
  end
  object ilImagens: TImageList
    Left = 640
    Top = 40
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFDF
      DF00DFDFDF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00A0A0A000CFCFCF00DFDF
      DF00DFDFDF00DFDFDF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDFDF00DFDFDF00BFBF
      BF0070707000202020000000000000000000000000005050500090909000A0A0
      A000CFCFCF00DFDFDF00EFEFEF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF00CFCFCF00808080004040
      4000000000005050500060606000A0A0A000A0A0A000A0A0A000404040005050
      500090909000B0B0B000DFDFDF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000BFBFBF0050505000202020008080
      8000A0A08000606060008F8F6F006F6F6F00606060007F7F3F00606060006060
      400040404000A0A0A000B0B0B000DFDFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000009F9F9F0060602000909050005050
      30006F6F6F00BFBFBF008F6F30004000000040000000BF9F9F00DFDFDF008F8F
      6F007050500040202000A0A0A000B0B0B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000009F9F9F008080600030303000C0C0
      C000B0B0B000BF9F2000DF7F0000FF3F0000FF0000009F000000CFCFCF00DFDF
      DF00DFDFDF009070500040202000A0A0A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000004040200060202000A08060009030
      30007F7F4000DFBF0000BF00000000000000BF000000FF000000A0606000CFCF
      CF00BFBF9F008060000040200000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000008080200020200000600000008040
      000080402000FF7F0000BF000000000000009F3F3F00DF5F3F0070503000B0B0
      9000804000006060400030303000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000A0A0600060604000202000006000
      0000806000009F200000FF000000FF000000FF000000DFDF3F00804000008020
      000070707000202020009F9F9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000090903000A0A08000B0B090002020
      000000000000400000004000000040000000400000004000000020202000A0A0
      8000202020009F9F9F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000CFCFCF00A0A06000A0A08000A0A0
      A000A0A0A000808060006F6F6F006F6F6F008F8F6F00A0A0A000A0A0A0002020
      20009F9F9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000007F7F3F00BFBF9F00A0A080009090
      700090907000AFAF8F008080600080808000808060008080600060606000DFDF
      DF000000000000000000DFDFDF00C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000003030300020200000707030009090
      7000A0A0A0009090900090907000A0A06000CFCFCF00DFDFDF00000000000000
      0000DFDFDF008080600070503000CFAFAF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      000000000000000000000000000000000000EFEFEF0030303000000000002020
      000040402000A0A06000B0B09000DFDFDF00DFDFDF00DFDFDF00BFBF9F006060
      60002020000030303000EFEFEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000AFAFAF003030
      3000000000000000000000000000000000000000000000000000000000003030
      3000AFAFAF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFE00300000000E3FF800000000000
      83FF000000000000000F000000000000003F000000000000002F000000000000
      000F000000000000000F00000000000000010001000000000001000300000000
      0001000700000000000F000C00000000000F003000000000002F000100000000
      803FC00700000000E3FFF01F0000000000000000000000000000000000000000
      000000000000}
  end
  object qryTitulos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qryTitulosCalcFields
    SQL.Strings = (
      'SELECT'
      '   me.*,'
      '   LEFT(me.ds_obs_desc, 150) as ds_obs,'
      '   pe.nm_pessoa as NomeAluno,'
      
        '   CAST(IFNULL(me.cd_resp, pe.cd_resp_finan) AS CHAR) as cd_resp' +
        '_finan,'
      '   Resp.nm_pessoa as NomeResponsavel,'
      '   tt.ds_tipo_titulo,'
      '   pc.ds_conta,'
      '   cc.ds_centro,'
      '   bt.ds_bolsa,'
      '   mo.ds_sigla,'
      '   mp.ds_sigla as MoedaPgto,'
      '   sf.sn_protesto,'
      '   am.ds_acao,'
      '   GET_ACRESCIMOS(me.cd_mensalidade, CURDATE()) as juros_calc,'
      '   GET_DESCONTOS(me.cd_mensalidade, CURDATE()) as desconto_calc,'
      '   tc.ds_caixa,'
      '   sit.cd_auxiliar sn_cobranca,'
      '   sit.ds_sigla ds_cor_cobranca,'
      '   sit.ds_valor ds_situacao_cobranca'
      'FROM'
      '   mensalidades as me'
      '      JOIN fin_moedas as mo ON'
      '         (me.cd_moeda = mo.cd_moeda)'
      '      JOIN situacoes_financeiras as sf ON'
      '         (me.situacao = sf.cd_situacao) '
      '      JOIN Pessoas as pe ON'
      '         (me.CodigoAluno = pe.cd_pessoa)'
      '      LEFT JOIN pessoas Resp ON'
      
        '         (IFNULL(me.cd_resp, pe.cd_resp_finan) = Resp.cd_pessoa)' +
        ' '
      '      LEFT JOIN fin_tipos_titulo as tt ON'
      '         (me.cd_tipo_titulo = tt.cd_tipo_titulo) AND'
      '         (me.cd_coligada = tt.cd_coligada) '
      '      LEFT JOIN fin_plano_contas as pc ON'
      '         (me.cd_plano_conta = pc.cd_conta) AND'
      '         (me.cd_coligada = pc.cd_coligada) '
      '      LEFT JOIN fin_centro_custos as cc ON'
      '         (me.cd_centro_custo = cc.cd_centro) AND'
      '         (me.cd_coligada = cc.cd_coligada) '
      '      LEFT JOIN fin_bolsas_tipos as bt ON'
      '         (me.cd_bolsa = bt.cd_bolsa) '
      '      LEFT JOIN fin_moedas as mp ON'
      '         (me.cd_moeda_pgto = mp.cd_moeda) '
      '      LEFT JOIN fin_acoes_movimento as am ON'
      '         (me.cd_desc_condicional = am.cd_acao) AND'
      '         (am.cd_tipo_acao = 3 and am.cd_origem = 1)'
      '      LEFT JOIN fin_mov_tesouraria as te ON'
      '         (te.cd_mensalidade = me.cd_mensalidade) AND'
      '         (te.nr_estorno = 0)'
      '      LEFT JOIN fin_cadastro_contas as tc ON'
      '         (tc.cd_caixa = te.cd_caixa) AND'
      '         (tc.cd_coligada = te.cd_coligada)  '
      '      LEFT JOIN fin_cobranca AS c ON'
      '         (me.codigoaluno = c.cd_pessoa) '
      '      LEFT JOIN situacoes AS sit ON'
      '         (c.cd_situacao = sit.cd_situacao) AND'
      '         (sit.cd_modulo = 2053)'
      'WHERE'
      '   nr_nf = :nr_nf'
      'ORDER by'
      '   pe.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_nf'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_nf'
        ParamType = ptUnknown
      end>
    object qryTituloscd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
    end
    object qryTituloscodigoaluno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigoaluno'
    end
    object qryTitulosparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      FieldName = 'parcela'
    end
    object qryTitulosdatavencimento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Vencto.'
      FieldName = 'datavencimento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosdt_competencia: TDateTimeField
      Tag = 1
      DisplayLabel = 'Compet'#234'ncia'
      FieldName = 'dt_competencia'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      FieldName = 'turma'
      Size = 15
    end
    object qryTituloscd_bolsa: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Bolsa'
      FieldName = 'cd_bolsa'
    end
    object qryTitulosdataemissao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'dataemissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosnossonumero: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'm.'
      FieldName = 'nossonumero'
      Size = 30
    end
    object qryTituloscd_desc_condicional: TLargeintField
      FieldName = 'cd_desc_condicional'
    end
    object qryTitulosvalorbruto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      FieldName = 'valorbruto'
    end
    object qryTituloscd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
    end
    object qryTitulosvalordesconto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Desc.'
      FieldName = 'valordesconto'
    end
    object qryTitulosds_obs_desc: TMemoField
      FieldName = 'ds_obs_desc'
      BlobType = ftMemo
    end
    object qryTitulosdescontoextra: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Extra'
      FieldName = 'descontoextra'
    end
    object qryTitulosvalorextra: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Extra'
      FieldName = 'valorextra'
    end
    object qryTitulosvalortotal: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Total'
      FieldName = 'valortotal'
    end
    object qryTitulosvalorjuros: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldName = 'valorjuros'
    end
    object qryTitulosvalorjuros_fixo: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Juros Fixo'
      FieldName = 'valorjuros_fixo'
    end
    object qryTitulosvalorpago: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Pago'
      FieldName = 'valorpago'
    end
    object qryTitulosvl_faturamento: TFloatField
      FieldName = 'vl_faturamento'
    end
    object qryTitulosdatapagamento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Pagto.'
      FieldName = 'datapagamento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosdt_credito: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      FieldName = 'dt_credito'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulossituacao: TSmallintField
      Tag = 1
      DisplayLabel = 'Sit.'
      FieldName = 'situacao'
    end
    object qryTitulosusuario: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      Size = 30
    end
    object qryTituloscd_usuario: TLargeintField
      FieldName = 'cd_usuario'
    end
    object qryTitulosbloqueto: TStringField
      FieldName = 'bloqueto'
      Size = 1
    end
    object qryTitulosanosemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'anosemestre'
      DisplayFormat = '0000/0'
    end
    object qryTitulosdatabasecorrecao: TDateTimeField
      FieldName = 'databasecorrecao'
    end
    object qryTitulosindicecorrecao: TFloatField
      FieldName = 'indicecorrecao'
    end
    object qryTituloscurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      FieldName = 'curso'
      Size = 15
    end
    object qryTitulosdepto: TSmallintField
      FieldName = 'depto'
    end
    object qryTitulostipoparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Tipo Parc.'
      FieldName = 'tipoparcela'
    end
    object qryTitulosocorrencia_remessa: TSmallintField
      FieldName = 'ocorrencia_remessa'
    end
    object qryTitulosocorrencia_retorno: TIntegerField
      FieldName = 'ocorrencia_retorno'
    end
    object qryTitulossn_credito_parcela: TStringField
      Tag = 1
      DisplayLabel = 'CR'
      FieldName = 'sn_credito_parcela'
      Size = 1
    end
    object qryTitulosnr_creditos: TFloatField
      Tag = 1
      DisplayLabel = 'N'#176' CR.'
      FieldName = 'nr_creditos'
    end
    object qryTituloscd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
    end
    object qryTituloscd_coligada: TIntegerField
      Tag = 1
      DisplayLabel = 'U.E.'
      FieldName = 'cd_coligada'
    end
    object qryTituloscd_centro_custo: TLargeintField
      Tag = 1
      DisplayLabel = 'C'#243'd. Centro'
      FieldName = 'cd_centro_custo'
    end
    object qryTituloscd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
    end
    object qryTitulosds_historico: TStringField
      Tag = 1
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'ds_historico'
      Size = 150
    end
    object qryTitulossn_liberar_descontos: TSmallintField
      Tag = 1
      DisplayLabel = 'Conc. Desc.'
      FieldName = 'sn_liberar_descontos'
    end
    object qryTitulossn_liberar_juros: TSmallintField
      Tag = 1
      DisplayLabel = 'Lib. Juros'
      FieldName = 'sn_liberar_juros'
    end
    object qryTituloscd_boleto: TLargeintField
      FieldName = 'cd_boleto'
    end
    object qryTituloscd_caixa: TIntegerField
      Tag = 1
      DisplayLabel = 'Conta Boleto'
      FieldName = 'cd_caixa'
    end
    object qryTituloscd_moeda: TLargeintField
      FieldName = 'cd_moeda'
    end
    object qryTituloscd_moeda_pgto: TLargeintField
      FieldName = 'cd_moeda_pgto'
    end
    object qryTitulosvl_pago_moeda: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.Moeda Pgto'
      FieldName = 'vl_pago_moeda'
      DisplayFormat = '###,###,##0.00'
    end
    object qryTitulosvl_credito: TFloatField
      FieldName = 'vl_credito'
    end
    object qryTituloscd_recibo: TIntegerField
      FieldName = 'cd_recibo'
    end
    object qryTituloscd_cheque_devolvido: TLargeintField
      FieldName = 'cd_cheque_devolvido'
    end
    object qryTitulosds_deposito: TStringField
      FieldName = 'ds_deposito'
      Size = 50
    end
    object qryTitulosds_obs: TStringField
      Tag = 1
      DisplayLabel = 'Obs. Desc'
      FieldName = 'ds_obs'
      Size = 150
    end
    object qryTitulosNomeAluno: TStringField
      Tag = 1
      DisplayLabel = 'Aluno'
      FieldName = 'NomeAluno'
      Size = 60
    end
    object qryTitulosNomeResponsavel: TStringField
      Tag = 1
      DisplayLabel = 'Nome Respons'#225'vel'
      FieldName = 'NomeResponsavel'
      Size = 60
    end
    object qryTitulosds_tipo_titulo: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Tit.'
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object qryTitulosds_conta: TStringField
      Tag = 1
      DisplayLabel = 'Plano de Contas'
      FieldName = 'ds_conta'
      Size = 255
    end
    object qryTitulosds_centro: TStringField
      Tag = 1
      DisplayLabel = 'Centro de Custo'
      FieldName = 'ds_centro'
      Size = 255
    end
    object qryTitulosds_bolsa: TStringField
      Tag = 1
      DisplayLabel = 'Bolsa'
      FieldName = 'ds_bolsa'
      Size = 100
    end
    object qryTitulosds_sigla: TStringField
      Tag = 1
      DisplayLabel = 'Moeda'
      FieldName = 'ds_sigla'
      Size = 30
    end
    object qryTitulosMoedaPgto: TStringField
      Tag = 1
      DisplayLabel = 'Pg.$'
      FieldName = 'MoedaPgto'
      Size = 30
    end
    object qryTitulossn_protesto: TSmallintField
      FieldName = 'sn_protesto'
    end
    object qryTitulosds_acao: TStringField
      FieldName = 'ds_acao'
      Size = 255
    end
    object qryTitulosjuros_calc: TFloatField
      FieldName = 'juros_calc'
    end
    object qryTitulosdesconto_calc: TFloatField
      FieldName = 'desconto_calc'
    end
    object qryTitulosds_caixa: TStringField
      Tag = 1
      DisplayLabel = 'Caixa da Baixa'
      FieldName = 'ds_caixa'
      Size = 255
    end
    object qryTitulossn_cobranca: TLargeintField
      FieldName = 'sn_cobranca'
    end
    object qryTitulosds_cor_cobranca: TStringField
      FieldName = 'ds_cor_cobranca'
      Size = 50
    end
    object qryTitulosds_situacao_cobranca: TStringField
      FieldName = 'ds_situacao_cobranca'
      Size = 255
    end
    object qryTitulosvalorjuroscalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldKind = fkCalculated
      FieldName = 'valorjuroscalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryTitulosvalordescontocalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Desc. Cond.'
      FieldKind = fkCalculated
      FieldName = 'valordescontocalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryTitulospercdescextra: TCurrencyField
      Tag = 1
      DisplayLabel = '% Desc. Fixo'
      FieldKind = fkCalculated
      FieldName = 'percdescextra'
      DisplayFormat = '##0.00 %'
      Calculated = True
    end
    object qryTitulospercdesccond: TCurrencyField
      Tag = 1
      DisplayLabel = '% Desc. Cond.'
      FieldKind = fkCalculated
      FieldName = 'percdesccond'
      DisplayFormat = '##0.00 %'
      Calculated = True
    end
    object qryTitulosbloquetoimpresso: TStringField
      Tag = 1
      DisplayLabel = 'Bloq.'
      FieldKind = fkCalculated
      FieldName = 'bloquetoimpresso'
      Size = 1
      Calculated = True
    end
    object qryTitulosdescricaosituacao: TStringField
      Tag = 1
      DisplayLabel = 'Sit.'
      FieldKind = fkCalculated
      FieldName = 'descricaosituacao'
      Calculated = True
    end
    object qryTitulosvalortotalcalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Vl. Total'
      FieldKind = fkCalculated
      FieldName = 'valortotalcalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qryTituloscodigocarta: TLargeintField
      FieldName = 'codigocarta'
    end
    object qryTituloscd_item_plano: TLargeintField
      FieldName = 'cd_item_plano'
    end
  end
  object dsTitulos: TDataSource
    AutoEdit = False
    DataSet = qryTitulos
    Left = 408
    Top = 304
  end
  object qryTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   DISTINCT turma'
      'FROM'
      '   mensalidades'
      'WHERE'
      '   nr_nf = :nr_nf')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_nf'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_nf'
        ParamType = ptUnknown
      end>
    object qryTurmasturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.mensalidades.turma'
      Size = 15
    end
  end
end
