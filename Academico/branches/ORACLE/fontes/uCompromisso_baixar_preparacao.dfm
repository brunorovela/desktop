object frm_Compromisso_Baixar_Preparacao: Tfrm_Compromisso_Baixar_Preparacao
  Left = 239
  Top = 236
  Caption = 'Baixar Compromissos'
  ClientHeight = 259
  ClientWidth = 575
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
    Width = 575
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BAIXAR COMPROMISSOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnCompromisso: TPanel
    Left = 0
    Top = 25
    Width = 575
    Height = 124
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel1: TBevel
      Left = 0
      Top = 119
      Width = 575
      Height = 5
      Align = alBottom
      Shape = bsTopLine
      ExplicitWidth = 583
    end
    object Label1: TLabel
      Left = 40
      Top = 16
      Width = 112
      Height = 13
      Caption = 'Conta para Pagamento:'
    end
    object Label2: TLabel
      Left = 58
      Top = 80
      Width = 94
      Height = 13
      Caption = 'Valor Total '#224' Pagar:'
    end
    object Label3: TLabel
      Left = 19
      Top = 48
      Width = 133
      Height = 13
      Caption = 'Descri'#231#227'o dos Pagamentos:'
    end
    object lblConta: TLabel
      Left = 168
      Top = 16
      Width = 47
      Height = 13
      Caption = 'lblConta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 168
      Top = 48
      Width = 71
      Height = 13
      Caption = 'lblDescricao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 168
      Top = 80
      Width = 71
      Height = 13
      Caption = 'lblDescricao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnConfirmarBaixa: TBitBtn
    Left = 375
    Top = 216
    Width = 107
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btnConfirmarBaixaClick
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
    Left = 487
    Top = 216
    Width = 83
    Height = 25
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
  object pnAcaoMovimento: TPanel
    Left = 0
    Top = 149
    Width = 575
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel4: TBevel
      Left = 0
      Top = 33
      Width = 575
      Height = 5
      Align = alBottom
      Shape = bsTopLine
      ExplicitWidth = 583
    end
    object Label15: TLabel
      Left = 27
      Top = 5
      Width = 98
      Height = 13
      Caption = 'A'#231#227'o do Movimento:'
    end
    object cbAcaoMovimento: TComboBox
      Left = 136
      Top = 3
      Width = 353
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cbAcaoMovimentoKeyPress
    end
  end
  object qyAcao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM fin_tipos_movimento '
      'where cd_tipo_movimento = 1'
      'ORDER by ds_movimento')
    Params = <>
    Left = 544
    Top = 33
  end
  object qryUpdItens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'MERGE INTO FIN_CONTAS_PAGAR CP USING'
      '('
      '   SELECT'
      '      CD_TITULO'
      '   FROM'
      '      FIN_CP_PREPARACAO_ITENS'
      '   WHERE'
      '      CD_PREPARACAO = :CD_PREPARACAO'
      ') UP ON'
      '   (CP.CD_TITULO = UP.CD_TITULO)'
      'WHEN MATCHED THEN'
      '   UPDATE SET'
      '      CP.NR_CHEQUE = :NR_CHEQUE,'
      '      CP.CD_CAIXA = :CD_CAIXA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PREPARACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CHEQUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=UPDATE'#13#10'   FIN_CP_PREPARACAO_ITENS PI'#13#10'      JOIN FIN_CO' +
        'NTAS_PAGAR CP ON'#13#10'         (PI.CD_TITULO = CP.CD_TITULO)'#13#10'SET'#13#10' ' +
        '  CP.NR_CHEQUE = :NR_CHEQUE,'#13#10'   CP.CD_CAIXA = :CD_CAIXA'#13#10'WHERE'#13 +
        #10'   PI.CD_PREPARACAO = :CD_PREPARACAO'
      
        'oracle=MERGE INTO FIN_CONTAS_PAGAR CP USING'#13#10'('#13#10'   SELECT'#13#10'     ' +
        ' CD_TITULO'#13#10'   FROM'#13#10'      FIN_CP_PREPARACAO_ITENS'#13#10'   WHERE'#13#10'  ' +
        '    CD_PREPARACAO = :CD_PREPARACAO'#13#10') UP ON'#13#10'   (CP.CD_TITULO = ' +
        'UP.CD_TITULO)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET'#13#10'      CP.NR_CHE' +
        'QUE = :NR_CHEQUE,'#13#10'      CP.CD_CAIXA = :CD_CAIXA')
    Left = 544
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PREPARACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_CHEQUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end>
  end
  object qryApropriaValores: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_APROPRIA_TE'
      
        '   (CD_MOVIMENTO_TE, CD_COLIGADA, CD_CONTA, CD_CENTRO, VL_MOVIME' +
        'NTO)'
      'SELECT'
      '   :CD_MOV_TE,'
      '   PI.CD_COLIGADA,'
      '   AP.CD_CONTA,'
      '   AP.CD_CENTRO,'
      '   SUM(AP.VL_MOVIMENTO)'
      'FROM'
      '   FIN_CP_PREPARACAO P '
      '      JOIN FIN_CP_PREPARACAO_ITENS PI ON'
      '         (P.CD_PREPARACAO = PI.CD_PREPARACAO) AND'
      '         (P.CD_COLIGADA = PI.CD_COLIGADA)'
      '         JOIN FIN_APROPRIA_CP AP ON'
      '            (PI.CD_TITULO = AP.CD_TITULO) AND'
      '            (PI.CD_COLIGADA = AP.CD_COLIGADA)'
      'WHERE'
      '   PI.CD_COLIGADA = :CD_COLIGADA AND'
      '   PI.CD_PREPARACAO = :CD_TITULO'
      'GROUP BY'
      '   AP.CD_CONTA,'
      '   AP.CD_CENTRO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOV_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=INSERT INTO FIN_APROPRIA_TE'#13#10'   (CD_MOVIMENTO_TE, CD_COLI' +
        'GADA, CD_CONTA, CD_CENTRO, VL_MOVIMENTO)'#13#10'SELECT'#13#10'   :CD_MOV_TE,' +
        #13#10'   FIRST_OCCURRENCE(PI.CD_COLIGADA),'#13#10'   FIRST_OCCURRENCE(AP.C' +
        'D_CONTA),'#13#10'   FIRST_OCCURRENCE(AP.CD_CENTRO),'#13#10'   ROUND(SUM(AP.V' +
        'L_MOVIMENTO / CP.VL_TOTAL_DESPESA * (PI.VL_BAIXA + PI.VL_MULTA +' +
        ' PI.VL_JUROS - PI.VL_DESCONTO)),2)'#13#10'FROM'#13#10'   FIN_CP_PREPARACAO P' +
        ' '#13#10'      JOIN FIN_CP_PREPARACAO_ITENS PI ON'#13#10'         (P.CD_PREP' +
        'ARACAO = PI.CD_PREPARACAO) AND'#13#10'         (P.CD_COLIGADA = PI.CD_' +
        'COLIGADA)'#13#10'      JOIN FIN_CONTAS_PAGAR AS CP ON'#13#10'         (PI.CD' +
        '_COLIGADA = CP.CD_COLIGADA) AND'#13#10'         (PI.CD_TITULO = CP.CD_' +
        'TITULO)'#13#10'      JOIN FIN_APROPRIA_CP AP ON'#13#10'         (CP.CD_TITUL' +
        'O_PRINCIPAL = AP.CD_TITULO) AND'#13#10'         (CP.CD_COLIGADA = AP.C' +
        'D_COLIGADA)'#13#10'WHERE'#13#10'   PI.CD_COLIGADA = :CD_COLIGADA AND'#13#10'   PI.' +
        'CD_PREPARACAO = :CD_TITULO'#13#10'GROUP BY'#13#10'   AP.CD_CONTA,'#13#10'   AP.CD_' +
        'CENTRO'
      
        'mysql-5=INSERT INTO FIN_APROPRIA_TE'#13#10'   (CD_MOVIMENTO_TE, CD_COL' +
        'IGADA, CD_CONTA, CD_CENTRO, VL_MOVIMENTO)'#13#10'SELECT'#13#10'   :CD_MOV_TE' +
        ','#13#10'   PI.CD_COLIGADA,'#13#10'   AP.CD_CONTA,'#13#10'   AP.CD_CENTRO,'#13#10'   ROU' +
        'ND(SUM(AP.VL_MOVIMENTO / CP.VL_TOTAL_DESPESA * (PI.VL_BAIXA + PI' +
        '.VL_MULTA + PI.VL_JUROS - PI.VL_DESCONTO)),2)'#13#10'FROM'#13#10'   FIN_CP_P' +
        'REPARACAO P '#13#10'      JOIN FIN_CP_PREPARACAO_ITENS PI ON'#13#10'        ' +
        ' (P.CD_PREPARACAO = PI.CD_PREPARACAO) AND'#13#10'         (P.CD_COLIGA' +
        'DA = PI.CD_COLIGADA)'#13#10'      JOIN FIN_CONTAS_PAGAR AS CP ON'#13#10'    ' +
        '     (PI.CD_COLIGADA = CP.CD_COLIGADA) AND'#13#10'         (PI.CD_TITU' +
        'LO = CP.CD_TITULO)'#13#10'      JOIN FIN_APROPRIA_CP AP ON'#13#10'         (' +
        'CP.CD_TITULO_PRINCIPAL = AP.CD_TITULO) AND'#13#10'         (CP.CD_COLI' +
        'GADA = AP.CD_COLIGADA)'#13#10'WHERE'#13#10'   PI.CD_COLIGADA = :CD_COLIGADA ' +
        'AND'#13#10'   PI.CD_PREPARACAO = :CD_TITULO'#13#10'GROUP BY'#13#10'   AP.CD_CONTA,' +
        #13#10'   AP.CD_CENTRO')
    Left = 544
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOV_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TITULO'
        ParamType = ptUnknown
      end>
  end
end
