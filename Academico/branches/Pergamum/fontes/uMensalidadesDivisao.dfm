object frmMensalidadesDivisao: TfrmMensalidadesDivisao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Divis'#227'o de T'#237'tulos'
  ClientHeight = 404
  ClientWidth = 611
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
  object Bevel1: TBevel
    Left = 0
    Top = 58
    Width = 611
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel4: TBevel
    Left = 0
    Top = 89
    Width = 3
    Height = 183
    Align = alLeft
    Shape = bsSpacer
    Style = bsRaised
    ExplicitHeight = 184
  end
  object Bevel5: TBevel
    Left = 606
    Top = 89
    Width = 5
    Height = 183
    Align = alRight
    Shape = bsSpacer
    Style = bsRaised
    ExplicitHeight = 184
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DIVIS'#195'O DE T'#205'TULOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnCompromisso: TPanel
    Left = 0
    Top = 25
    Width = 611
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pessoa:'
    end
    object lbCodigo: TLabel
      Left = 62
      Top = 10
      Width = 531
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo - Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grd: TDBGrid
    Left = 3
    Top = 89
    Width = 603
    Height = 183
    Align = alClient
    Color = clWhite
    DataSource = dtcMensalidades
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Parcela'
        Title.Alignment = taRightJustify
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataVencimento'
        Title.Alignment = taCenter
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorBrutoCalc'
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorDesconto'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescontoExtra'
        Title.Alignment = taRightJustify
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorLiquidoCalc'
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_tipo_titulo'
        Width = 247
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 272
    Width = 611
    Height = 132
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 3
      Top = 6
      Width = 209
      Height = 13
      Caption = 'Informe o percentual que o resp. ir'#225' pagar:'
    end
    object Label4: TLabel
      Left = 7
      Top = 33
      Width = 205
      Height = 13
      Caption = 'Selecione o nome do respons'#225'vel do t'#237'tulo:'
    end
    object btnCodigoAluno: TSpeedButton
      Left = 561
      Top = 28
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
      OnClick = btnCodigoAlunoClick
    end
    object edPercentual: TEdit
      Left = 218
      Top = 3
      Width = 104
      Height = 21
      TabOrder = 0
      OnKeyPress = edPercentualKeyPress
    end
    object edResponsavel: TEdit
      Left = 218
      Top = 30
      Width = 280
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edResponsavelKeyPress
    end
    object btnConfirmar: TBitBtn
      Left = 408
      Top = 96
      Width = 107
      Height = 28
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = btnConfirmarClick
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
      Left = 521
      Top = 96
      Width = 83
      Height = 28
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 4
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
    object edCodigoResp: TEdit
      Left = 499
      Top = 30
      Width = 62
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = edResponsavelKeyPress
    end
    object cbManter: TCheckBox
      Left = 10
      Top = 58
      Width = 392
      Height = 17
      Caption = 
        ' Manter os descontos apenas na parcela de responsabilidade do al' +
        'uno:'
      TabOrder = 5
      OnClick = cbManterClick
    end
    object rbAplicaBruto: TRadioButton
      Left = 10
      Top = 80
      Width = 395
      Height = 17
      Caption = 
        'Efetuar a divis'#227'o do percentual informado com base no valor brut' +
        'o do t'#237'tulo'
      Checked = True
      Enabled = False
      TabOrder = 6
      TabStop = True
    end
    object rbAplicaLiquido: TRadioButton
      Left = 10
      Top = 103
      Width = 392
      Height = 17
      Caption = 
        'Efetuar a divis'#227'o do percentual informado com base no valor l'#237'qu' +
        'ido do t'#237'tulo'
      Enabled = False
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 63
    Width = 611
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label2: TLabel
      Left = 4
      Top = 4
      Width = 371
      Height = 13
      Caption = 
        'Selecione abaixo, com a tecla CTRL pressionada, os t'#237'tulos que d' +
        'eseja dividir.'
    end
    object sbMarcarNovas: TSpeedButton
      Left = 556
      Top = 2
      Width = 25
      Height = 22
      Hint = 'Selecionar todos os t'#237'tulos'
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
      OnClick = sbMarcarNovasClick
    end
    object sbDesmarcarNovas: TSpeedButton
      Left = 581
      Top = 2
      Width = 25
      Height = 22
      Hint = 'Desmarcar t'#237'tulos selecionados'
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
      OnClick = sbDesmarcarNovasClick
    end
  end
  object tblMensalidades: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblMensalidadesCalcFields
    SQL.Strings = (
      
        'select Mensalidades.*, Pessoas.nm_pessoa as NomeAluno, CAST(IFNU' +
        'LL(Mensalidades.cd_resp, Pessoas.cd_resp_finan) AS CHAR) cd_resp' +
        '_finan, Resp.nm_pessoa as NomeResponsavel, fin_tipos_titulo.ds_t' +
        'ipo_titulo,'
      
        '     fin_plano_contas.ds_conta, fin_centro_custos.ds_centro, fin' +
        '_bolsas_tipos.ds_bolsa, fin_moedas.ds_sigla, moedas_pgto.ds_sigl' +
        'a MoedaPgto,'
      
        '     situacoes_financeiras.sn_protesto, fin_acoes_movimento.ds_a' +
        'cao'
      '     FROM Mensalidades'
      
        '     INNER JOIN fin_moedas ON (Mensalidades.cd_moeda = fin_moeda' +
        's.cd_moeda)'
      
        '     INNER JOIN situacoes_financeiras ON ( Mensalidades.situacao' +
        ' =  situacoes_financeiras.cd_situacao )'
      
        '     INNER JOIN Pessoas ON (Mensalidades.CodigoAluno = Pessoas.c' +
        'd_pessoa ) LEFT JOIN pessoas Resp ON (IFNULL(Mensalidades.cd_res' +
        'p, Pessoas.cd_resp_finan) = Resp.cd_pessoa)'
      
        '     LEFT JOIN fin_tipos_titulo ON (Mensalidades.cd_tipo_titulo ' +
        '= fin_tipos_titulo.cd_tipo_titulo AND Mensalidades.cd_coligada =' +
        ' fin_tipos_titulo.cd_coligada)'
      
        '     LEFT JOIN fin_plano_contas ON (Mensalidades.cd_plano_conta ' +
        '= fin_plano_contas.cd_conta AND Mensalidades.cd_coligada = fin_p' +
        'lano_contas.cd_coligada)'
      
        '     LEFT JOIN fin_centro_custos ON (Mensalidades.cd_centro_cust' +
        'o = fin_centro_custos.cd_centro AND Mensalidades.cd_coligada = f' +
        'in_centro_custos.cd_coligada)'
      
        '     LEFT JOIN fin_bolsas_tipos ON (Mensalidades.cd_bolsa = fin_' +
        'bolsas_tipos.cd_bolsa)'
      
        '     LEFT JOIN fin_moedas moedas_pgto ON (Mensalidades.cd_moeda_' +
        'pgto = moedas_pgto.cd_moeda)'
      
        '     LEFT JOIN fin_acoes_movimento ON (Mensalidades.cd_desc_cond' +
        'icional = fin_acoes_movimento.cd_acao and fin_acoes_movimento.cd' +
        '_tipo_acao = 3 and fin_acoes_movimento.cd_origem = 1)'
      ''
      
        'WHERE mensalidades.codigoaluno = :codigoaluno AND mensalidades.c' +
        'd_coligada IN ( %s )'
      
        '    AND (mensalidades.situacao = 2 OR mensalidades.situacao = 10' +
        ')'
      '    AND (mensalidades.tipoparcela = 0)'
      'ORDER BY mensalidades.datavencimento, mensalidades.parcela')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=select Mensalidades.*, Pessoas.nm_pessoa as NomeAluno, C' +
        'AST(IFNULL(Mensalidades.cd_resp, Pessoas.cd_resp_finan) AS CHAR)' +
        ' cd_resp_finan, Resp.nm_pessoa as NomeResponsavel, fin_tipos_tit' +
        'ulo.ds_tipo_titulo,'#13#10'     fin_plano_contas.ds_conta, fin_centro_' +
        'custos.ds_centro, fin_bolsas_tipos.ds_bolsa, fin_moedas.ds_sigla' +
        ', moedas_pgto.ds_sigla MoedaPgto,'#13#10'     situacoes_financeiras.sn' +
        '_protesto, fin_acoes_movimento.ds_acao'#13#10'     FROM Mensalidades'#13#10 +
        '     INNER JOIN fin_moedas ON (Mensalidades.cd_moeda = fin_moeda' +
        's.cd_moeda)'#13#10'     INNER JOIN situacoes_financeiras ON ( Mensalid' +
        'ades.situacao =  situacoes_financeiras.cd_situacao )'#13#10'     INNER' +
        ' JOIN Pessoas ON (Mensalidades.CodigoAluno = Pessoas.cd_pessoa )' +
        ' LEFT JOIN pessoas Resp ON (IFNULL(Mensalidades.cd_resp, Pessoas' +
        '.cd_resp_finan) = Resp.cd_pessoa)'#13#10'     LEFT JOIN fin_tipos_titu' +
        'lo ON (Mensalidades.cd_tipo_titulo = fin_tipos_titulo.cd_tipo_ti' +
        'tulo AND Mensalidades.cd_coligada = fin_tipos_titulo.cd_coligada' +
        ')'#13#10'     LEFT JOIN fin_plano_contas ON (Mensalidades.cd_plano_con' +
        'ta = fin_plano_contas.cd_conta AND Mensalidades.cd_coligada = fi' +
        'n_plano_contas.cd_coligada)'#13#10'     LEFT JOIN fin_centro_custos ON' +
        ' (Mensalidades.cd_centro_custo = fin_centro_custos.cd_centro AND' +
        ' Mensalidades.cd_coligada = fin_centro_custos.cd_coligada)'#13#10'    ' +
        ' LEFT JOIN fin_bolsas_tipos ON (Mensalidades.cd_bolsa = fin_bols' +
        'as_tipos.cd_bolsa)'#13#10'     LEFT JOIN fin_moedas moedas_pgto ON (Me' +
        'nsalidades.cd_moeda_pgto = moedas_pgto.cd_moeda)'#13#10'     LEFT JOIN' +
        ' fin_acoes_movimento ON (Mensalidades.cd_desc_condicional = fin_' +
        'acoes_movimento.cd_acao and fin_acoes_movimento.cd_tipo_acao = 3' +
        ' and fin_acoes_movimento.cd_origem = 1)'#13#10#13#10'WHERE codigoaluno = :' +
        'codigoaluno '#13#10'    AND (mensalidades.situacao = 2 OR mensalidades' +
        '.situacao = 10)'#13#10'    AND (mensalidades.tipoparcela = 0)'#13#10'ORDER B' +
        'Y mensalidades.datavencimento, mensalidades.parcela'
      
        'oracle=select Mensalidades.*, Pessoas.nm_pessoa as NomeAluno, TO' +
        '_CHAR(COALESCE(Mensalidades.cd_resp, Pessoas.cd_resp_finan)) cd_' +
        'resp_finan, Resp.nm_pessoa as NomeResponsavel, fin_tipos_titulo.' +
        'ds_tipo_titulo,'#13#10'     fin_plano_contas.ds_conta, fin_centro_cust' +
        'os.ds_centro, fin_bolsas_tipos.ds_bolsa, fin_moedas.ds_sigla, mo' +
        'edas_pgto.ds_sigla MoedaPgto,'#13#10'     situacoes_financeiras.sn_pro' +
        'testo, fin_acoes_movimento.ds_acao'#13#10'     FROM Mensalidades'#13#10'    ' +
        ' INNER JOIN fin_moedas ON (Mensalidades.cd_moeda = fin_moedas.cd' +
        '_moeda)'#13#10'     INNER JOIN situacoes_financeiras ON ( Mensalidades' +
        '.situacao =  situacoes_financeiras.cd_situacao )'#13#10'     INNER JOI' +
        'N Pessoas ON (Mensalidades.CodigoAluno = Pessoas.cd_pessoa ) LEF' +
        'T JOIN pessoas Resp ON (COALESCE(Mensalidades.cd_resp, Pessoas.c' +
        'd_resp_finan) = Resp.cd_pessoa)'#13#10'     LEFT JOIN fin_tipos_titulo' +
        ' ON (Mensalidades.cd_tipo_titulo = fin_tipos_titulo.cd_tipo_titu' +
        'lo AND Mensalidades.cd_coligada = fin_tipos_titulo.cd_coligada)'#13 +
        #10'     LEFT JOIN fin_plano_contas ON (Mensalidades.cd_plano_conta' +
        ' = fin_plano_contas.cd_conta AND Mensalidades.cd_coligada = fin_' +
        'plano_contas.cd_coligada)'#13#10'     LEFT JOIN fin_centro_custos ON (' +
        'Mensalidades.cd_centro_custo = fin_centro_custos.cd_centro AND M' +
        'ensalidades.cd_coligada = fin_centro_custos.cd_coligada)'#13#10'     L' +
        'EFT JOIN fin_bolsas_tipos ON (Mensalidades.cd_bolsa = fin_bolsas' +
        '_tipos.cd_bolsa)'#13#10'     LEFT JOIN fin_moedas moedas_pgto ON (Mens' +
        'alidades.cd_moeda_pgto = moedas_pgto.cd_moeda)'#13#10'     LEFT JOIN f' +
        'in_acoes_movimento ON (Mensalidades.cd_desc_condicional = fin_ac' +
        'oes_movimento.cd_acao and fin_acoes_movimento.cd_tipo_acao = 3 a' +
        'nd fin_acoes_movimento.cd_origem = 1)'#13#10#13#10'WHERE codigoaluno = :co' +
        'digoaluno '#13#10'    AND (mensalidades.situacao = 2 OR mensalidades.s' +
        'ituacao = 10)'#13#10'    AND (mensalidades.tipoparcela = 0)'#13#10'ORDER BY ' +
        'mensalidades.datavencimento, mensalidades.parcela'#13#10)
    Left = 504
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end>
    object tblMensalidadesCodigoAluno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CodigoAluno'
      Origin = 'Mensalidades.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblMensalidadesParcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      DisplayWidth = 5
      FieldName = 'Parcela'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DataVencimento'
      Origin = 'Mensalidades.DataVencimento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesTurma: TStringField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'Turma'
      Origin = 'Mensalidades.Turma'
      Size = 50
    end
    object tblMensalidadesDataEmissao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Emiss'#227'o'
      DisplayWidth = 10
      FieldName = 'DataEmissao'
      Origin = 'Mensalidades.DataEmissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesNossoNumero: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'm.'
      DisplayWidth = 12
      FieldName = 'nossonumero'
      Origin = 'Mensalidades.NossoNumero'
      Size = 30
    end
    object tblMensalidadesValorBruto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      DisplayWidth = 10
      FieldName = 'ValorBruto'
      Origin = 'Mensalidades.ValorBruto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesDescontoExtra: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Extra'
      DisplayWidth = 10
      FieldName = 'DescontoExtra'
      Origin = 'Mensalidades.DescontoExtra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorExtra: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Extra'
      DisplayWidth = 10
      FieldName = 'ValorExtra'
      Origin = 'Mensalidades.ValorExtra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorTotal: TFloatField
      DisplayLabel = 'Vl. Total'
      FieldName = 'ValorTotal'
      Origin = 'Mensalidades.ValorTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorJuros: TFloatField
      FieldName = 'ValorJuros'
      Origin = 'Mensalidades.ValorJuros'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesValorPago: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Pago'
      DisplayWidth = 10
      FieldName = 'ValorPago'
      Origin = 'Mensalidades.ValorPago'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesDataPagamento: TDateTimeField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Pagto.'
      DisplayWidth = 10
      FieldName = 'DataPagamento'
      Origin = 'Mensalidades.DataPagamento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Mensalidades.Situacao'
    end
    object tblMensalidadesUsuario: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 10
      FieldName = 'Usuario'
      Origin = 'Mensalidades.Usuario'
      Size = 30
    end
    object tblMensalidadesValorDesconto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Desc.'
      DisplayWidth = 10
      FieldName = 'ValorDesconto'
      Origin = 'Mensalidades.ValorDesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem.'
      DisplayWidth = 8
      FieldName = 'AnoSemestre'
      Origin = 'Mensalidades.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblMensalidadesDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
      Origin = 'Mensalidades.DataBaseCorrecao'
    end
    object tblMensalidadesIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
      Origin = 'Mensalidades.IndiceCorrecao'
    end
    object tblMensalidadesDescricaoSituacao: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Sit.'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'DescricaoSituacao'
      Size = 30
      Calculated = True
    end
    object tblMensalidadesValorTotalCalc: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Total'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesBloquetoImpresso: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Bloq.'
      FieldKind = fkCalculated
      FieldName = 'BloquetoImpresso'
      Size = 1
      Calculated = True
    end
    object tblMensalidadesNomeAluno: TStringField
      Tag = 1
      DisplayLabel = 'Aluno'
      DisplayWidth = 30
      FieldName = 'NomeAluno'
      Origin = 'Mensalidades.CodigoAluno'
      Size = 45
    end
    object tblMensalidadesDepto: TSmallintField
      Tag = 1
      DisplayLabel = 'Depto.'
      DisplayWidth = 1
      FieldName = 'Depto'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesValorJurosCalc: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesBloqueto: TStringField
      FieldName = 'Bloqueto'
      Origin = 'WMESTRE12.mensalidades.Bloqueto'
      Size = 1
    end
    object tblMensalidadesocorrencia_remessa: TSmallintField
      FieldName = 'ocorrencia_remessa'
      Origin = 'WMESTRE12.mensalidades.ocorrencia_remessa'
    end
    object tblMensalidadesocorrencia_retorno: TSmallintField
      FieldName = 'ocorrencia_retorno'
      Origin = 'WMESTRE12.mensalidades.ocorrencia_retorno'
    end
    object tblMensalidadessn_credito_parcela: TStringField
      Tag = 1
      DisplayLabel = 'CR'
      FieldName = 'sn_credito_parcela'
      Origin = 'WMESTRE12.mensalidades.sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
    object tblMensalidadesnr_creditos: TFloatField
      Tag = 1
      DisplayLabel = 'N'#186' CR.'
      DisplayWidth = 4
      FieldName = 'nr_creditos'
      Origin = 'WMESTRE12.mensalidades.nr_creditos'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      DisplayWidth = 7
      FieldName = 'cd_mensalidade'
      Origin = 'WMESTRE12.mensalidades.cd_mensalidade'
    end
    object tblMensalidadestipoparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Tipo Parc.'
      DisplayWidth = 5
      FieldName = 'tipoparcela'
      Origin = 'WMESTRE12.mensalidades.tipoparcela'
    end
    object tblMensalidadescd_mensalidade_origem: TIntegerField
      DisplayLabel = 'T'#237't. Origem'
      DisplayWidth = 7
      FieldName = 'cd_mensalidade_origem'
      Origin = 'WMESTRE12.mensalidades.cd_mensalidade_origem'
    end
    object tblMensalidadescurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      DisplayWidth = 10
      FieldName = 'curso'
      Origin = 'WMESTRE12.mensalidades.curso'
      Size = 15
    end
    object tblMensalidadescd_coligada: TSmallintField
      Tag = 1
      DisplayLabel = 'U.E.'
      DisplayWidth = 3
      FieldName = 'cd_coligada'
    end
    object tblMensalidadesNomeResponsavel: TStringField
      Tag = 1
      DisplayLabel = 'Nome Respons'#225'vel'
      DisplayWidth = 30
      FieldName = 'NomeResponsavel'
      Size = 60
    end
    object tblMensalidadesds_tipo_titulo: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Tit.'
      DisplayWidth = 15
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object tblMensalidadesdt_competencia: TDateTimeField
      Tag = 1
      DisplayLabel = 'Compet'#234'ncia'
      DisplayWidth = 10
      FieldName = 'dt_competencia'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadesds_historico: TStringField
      Tag = 1
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 30
      FieldName = 'ds_historico'
      Size = 150
    end
    object tblMensalidadesds_conta: TStringField
      Tag = 1
      DisplayLabel = 'Plano de Contas'
      DisplayWidth = 15
      FieldName = 'ds_conta'
      Size = 255
    end
    object tblMensalidadesds_centro: TStringField
      Tag = 1
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 15
      FieldName = 'ds_centro'
      Size = 255
    end
    object tblMensalidadescd_caixa: TIntegerField
      Tag = 1
      DisplayLabel = 'Conta Boleto'
      FieldName = 'cd_caixa'
    end
    object tblMensalidadescd_bolsa: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Bolsa'
      FieldName = 'cd_bolsa'
    end
    object tblMensalidadesds_bolsa: TStringField
      Tag = 1
      DisplayLabel = 'Bolsa'
      DisplayWidth = 30
      FieldName = 'ds_bolsa'
      Size = 100
    end
    object tblMensalidadesds_sigla: TStringField
      Tag = 1
      DisplayLabel = 'Moeda'
      DisplayWidth = 3
      FieldName = 'ds_sigla'
      Size = 30
    end
    object tblMensalidadesMoedaPgto: TStringField
      Tag = 1
      DisplayLabel = 'Pg.$'
      DisplayWidth = 3
      FieldName = 'MoedaPgto'
      Size = 3
    end
    object tblMensalidadesvl_pago_moeda: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.Moeda Pgto'
      FieldName = 'vl_pago_moeda'
      DisplayFormat = '###,###,##0.00'
    end
    object tblMensalidadescd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
    end
    object tblMensalidadesPercDescExtra: TCurrencyField
      Tag = 1
      DisplayLabel = '% Desc. Fixo'
      FieldKind = fkCalculated
      FieldName = 'PercDescExtra'
      DisplayFormat = '##0.00 %'
      Calculated = True
    end
    object tblMensalidadesPercDescCond: TCurrencyField
      Tag = 1
      DisplayLabel = '% Desc. Cond.'
      FieldKind = fkCalculated
      FieldName = 'PercDescCond'
      DisplayFormat = '##0.00 %'
      Calculated = True
    end
    object tblMensalidadescd_resp_finan: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Resp.'
      FieldName = 'cd_resp_finan'
      Size = 11
    end
    object tblMensalidadesdt_credito: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      DisplayWidth = 10
      FieldName = 'dt_credito'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblMensalidadescd_recibo: TIntegerField
      FieldName = 'cd_recibo'
    end
    object tblMensalidadessn_protesto: TSmallintField
      FieldName = 'sn_protesto'
    end
    object tblMensalidadesds_acao: TStringField
      FieldName = 'ds_acao'
      Size = 255
    end
    object tblMensalidadesds_obs_desc: TMemoField
      FieldName = 'ds_obs_desc'
      BlobType = ftMemo
    end
    object tblMensalidadesds_obs: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_obs'
      Calculated = True
    end
    object tblMensalidadessn_liberar_juros: TIntegerField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Lib. Juros'
      DisplayWidth = 1
      FieldName = 'sn_liberar_juros'
      Origin = 'mensalidades.sn_liberar_juros'
    end
    object tblMensalidadessn_liberar_descontos: TIntegerField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Conc. Desc.'
      DisplayWidth = 1
      FieldName = 'sn_liberar_descontos'
      Origin = 'mensalidades.sn_liberar_descontos'
    end
    object tblMensalidadesvl_credito: TFloatField
      FieldName = 'vl_credito'
    end
    object tblMensalidadescd_centro_custo: TLargeintField
      DisplayLabel = 'C'#243'd. Centro'
      FieldName = 'cd_centro_custo'
      Required = True
    end
    object tblMensalidadescd_plano_conta: TLargeintField
      DisplayLabel = 'C'#243'd. Conta'
      FieldName = 'cd_plano_conta'
      Required = True
    end
    object tblMensalidadescd_resp: TIntegerField
      DisplayLabel = 'C'#243'd. Resp'
      FieldName = 'cd_resp'
    end
    object tblMensalidadescd_desc_condicional: TLargeintField
      FieldName = 'cd_desc_condicional'
    end
    object tblMensalidadescd_moeda: TLargeintField
      FieldName = 'cd_moeda'
    end
    object tblMensalidadescd_moeda_pgto: TLargeintField
      FieldName = 'cd_moeda_pgto'
    end
    object tblMensalidadescd_item_plano: TLargeintField
      FieldName = 'cd_item_plano'
    end
    object tblMensalidadesnr_nf: TLargeintField
      FieldName = 'nr_nf'
    end
    object tblMensalidadesValorBrutoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      FieldKind = fkCalculated
      FieldName = 'ValorBrutoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesValorLiquidoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Vl. L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'ValorLiquidoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
  end
  object dtcMensalidades: TDataSource
    DataSet = tblMensalidades
    Left = 536
    Top = 32
  end
  object qryAcoesMovimentoFixo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cr.cd_acao,'
      '  cr.vl_saida,'
      '  cr.cd_coligada,'
      '  cr.ds_observacao,'
      '  cr.sn_desc_plano_pagamento'
      'FROM'
      '  fin_mov_cr cr'
      
        '  INNER JOIN fin_acoes_movimento as am ON (cr.cd_acao = am.cd_ac' +
        'ao)'
      'WHERE'
      '  am.cd_tipo_acao = 3'
      '  AND am.cd_origem = 1'
      '  AND cr.sn_desc_condicional = 0'
      
        '  AND COALESCE(cr.cd_mensalidade_origem, cr.cd_mensalidade) = :c' +
        'd_mensalidade_origem'
      'ORDER BY'
      '  cr.nr_sequencia ASC  ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
    Left = 504
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
  end
  object qryAcoesMovimentoCondicional: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cr.cd_acao,'
      '  cr.vl_desconto,'
      '  cr.cd_coligada,'
      '  cr.ds_observacao,'
      '  cr.sn_desc_plano_pagamento'
      'FROM'
      '  fin_mov_cr cr'
      
        '  INNER JOIN fin_acoes_movimento as am ON (cr.cd_acao = am.cd_ac' +
        'ao)  '
      'WHERE'
      '  am.cd_tipo_acao = 3'
      '  AND am.cd_origem = 1'
      '  AND cr.sn_desc_condicional = 1'
      
        '  AND COALESCE(cr.cd_mensalidade_origem, cr.cd_mensalidade) = :c' +
        'd_mensalidade_origem'
      'ORDER BY'
      '  cr.nr_sequencia ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
    Left = 504
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
  end
  object qryDescontosPlano: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        #9'SUM(CASE WHEN cr.sn_desc_condicional = 0 THEN cr.vl_saida ELSE ' +
        '0 END) vl_desc_fixo_plano,'
      
        #9'SUM(CASE WHEN cr.sn_desc_condicional = 1 THEN cr.vl_desconto EL' +
        'SE  0 END) vl_desc_cond_plano'
      'FROM'
      #9'fin_mov_cr cr'
      'WHERE'
      
        '  COALESCE(cr.cd_mensalidade_origem, cr.cd_mensalidade) = :cd_me' +
        'nsalidade_origem'
      #9'AND cr.sn_desc_plano_pagamento = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
    Left = 504
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end>
  end
end
