object frmReclassificar: TfrmReclassificar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Reclassificar contas'
  ClientHeight = 315
  ClientWidth = 610
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    610
    315)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 37
    Width = 222
    Height = 13
    Caption = 'Informe o c'#243'digo do movimento na tesouraria:'
  end
  object Label2: TLabel
    Left = 22
    Top = 137
    Width = 203
    Height = 13
    Caption = 'DE: (Selecione a conta que deseja alterar)'
  end
  object Label3: TLabel
    Left = 430
    Top = 37
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label4: TLabel
    Left = 512
    Top = 37
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 22
    Top = 189
    Width = 235
    Height = 13
    Caption = 'PARA CONTA: (Selecione a nova conta do plano)'
  end
  object sbConta: TSpeedButton
    Left = 565
    Top = 206
    Width = 22
    Height = 20
    Enabled = False
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
    OnClick = sbContaClick
  end
  object Label6: TLabel
    Left = 22
    Top = 234
    Width = 256
    Height = 13
    Caption = 'PARA O CENTRO: (Selecione o novo centro de custo)'
  end
  object sbCentro: TSpeedButton
    Left = 565
    Top = 251
    Width = 22
    Height = 20
    Enabled = False
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
    OnClick = sbCentroClick
  end
  object Label7: TLabel
    Left = 22
    Top = 91
    Width = 336
    Height = 13
    Caption = 
      'UNIDADE DE ENSINO: (Obrigat'#243'rio selecionar uma Unidade de Ensino' +
      ')'
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'RECLASSIFICAR CONTAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object btnConfirmar: TBitBtn
    Left = 390
    Top = 282
    Width = 107
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 9
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
    Left = 503
    Top = 282
    Width = 84
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'F6 Cancelar'
    TabOrder = 10
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
  object edMovimento: TEdit
    Left = 22
    Top = 56
    Width = 83
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnExit = edMovimentoExit
    OnKeyPress = edMovimentoKeyPress
  end
  object edHistorico: TEdit
    Left = 111
    Top = 56
    Width = 313
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 1
  end
  object edData: TEdit
    Left = 430
    Top = 56
    Width = 76
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 2
  end
  object edValor: TEdit
    Left = 512
    Top = 56
    Width = 76
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 3
  end
  object cbDe: TComboBox
    Left = 22
    Top = 156
    Width = 566
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 16
    TabOrder = 4
    OnChange = cbDeChange
    OnKeyPress = cbDeKeyPress
  end
  object cbPara: TComboBox
    Left = 103
    Top = 208
    Width = 463
    Height = 20
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 14
    TabOrder = 6
    OnChange = cbParaChange
    OnKeyPress = cbParaKeyPress
  end
  object edPara: TEdit
    Left = 22
    Top = 208
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 5
    OnExit = edParaExit
    OnKeyPress = edParaKeyPress
  end
  object cbCentro: TComboBox
    Left = 103
    Top = 253
    Width = 463
    Height = 20
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 14
    TabOrder = 8
    OnChange = cbCentroChange
    OnKeyPress = cbParaKeyPress
  end
  object edCentro: TEdit
    Left = 22
    Top = 253
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 7
    OnExit = edCentroExit
    OnKeyPress = edParaKeyPress
  end
  object cbUnidadeEnsino: TUMComboBox
    Left = 21
    Top = 110
    Width = 566
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    OnChange = cbUnidadeEnsinoChange
    OnSelect = cbUnidadeEnsinoSelect
    TamanhoMaximo = 0
  end
  object qrySelectMovimento: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   M.CD_TITULO,'
      '   M.CD_MOVIMENTO_TE,'
      '   M.DS_MOVIMENTO,'
      '   M.DT_MOVIMENTO,'
      '   M.VL_MOVIMENTO,'
      '   A.CD_CONTA,'
      '   A.CD_CENTRO,'
      '   C.DS_CONTA CONTA,'
      
        '   CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(C' +
        'C.ds_centro, '#39'<SEM CENTRO CUSTO>'#39'))AS DS_CONTA'
      'FROM'
      '   FIN_MOV_TESOURARIA M'
      '      LEFT JOIN FIN_APROPRIA_TE A ON'
      '         (M.CD_MOVIMENTO_TE = A.CD_MOVIMENTO_TE)'
      '         LEFT JOIN FIN_PLANO_CONTAS C ON'
      '            (A.CD_CONTA = C.CD_CONTA) AND'
      '            (A.CD_COLIGADA = C.CD_COLIGADA)'
      '         LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '            (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '            (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   M.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE'
      'ORDER BY'
      '   C.DS_CONTA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT DISTINCT'#13#10'   M.CD_TITULO, '#13#10'   M.CD_MOVIMENTO_TE,'#13 +
        #10'   M.DS_MOVIMENTO,'#13#10'   M.DT_MOVIMENTO,'#13#10'   M.VL_MOVIMENTO,'#13#10'   ' +
        'A.CD_CONTA,'#13#10'   A.CD_CENTRO,'#13#10'   C.DS_CONTA CONTA,'#13#10'   LEFT(COAL' +
        'ESCE(C.DS_CONTA, '#39'<SEM CONTA>'#39') || '#39' / '#39' || COALESCE(CC.DS_CENTR' +
        'O, '#39'<SEM CENTRO CUSTO>'#39'), 200) DS_CONTA'#13#10'FROM'#13#10'   FIN_MOV_TESOUR' +
        'ARIA M'#13#10'      LEFT JOIN FIN_APROPRIA_TE A ON'#13#10'         (M.CD_MOV' +
        'IMENTO_TE = A.CD_MOVIMENTO_TE)'#13#10'         LEFT JOIN FIN_PLANO_CON' +
        'TAS C ON'#13#10'            (A.CD_CONTA = C.CD_CONTA) AND'#13#10'           ' +
        ' (A.CD_COLIGADA = C.CD_COLIGADA)'#13#10'         LEFT JOIN FIN_CENTRO_' +
        'CUSTOS CC ON'#13#10'            (A.CD_CENTRO = CC.CD_CENTRO) AND'#13#10'    ' +
        '        (A.CD_COLIGADA = CC.CD_COLIGADA)'#13#10'WHERE'#13#10'   M.CD_MOVIMEN' +
        'TO_TE = :CD_MOVIMENTO_TE'#13#10'ORDER BY'#13#10'   C.DS_CONTA'
      
        'mysql-5=SELECT DISTINCT'#13#10'   M.CD_TITULO, '#13#10'   M.CD_MOVIMENTO_TE,' +
        #13#10'   M.DS_MOVIMENTO,'#13#10'   M.DT_MOVIMENTO,'#13#10'   M.VL_MOVIMENTO,'#13#10'  ' +
        ' A.CD_CONTA,'#13#10'   A.CD_CENTRO,'#13#10'   C.DS_CONTA CONTA,'#13#10'   CONCAT(C' +
        'OALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(CC.ds_centro' +
        ', '#39'<SEM CENTRO CUSTO>'#39')) DS_CONTA'#13#10'FROM'#13#10'   FIN_MOV_TESOURARIA M' +
        #13#10'      LEFT JOIN FIN_APROPRIA_TE A ON'#13#10'         (M.CD_MOVIMENTO' +
        '_TE = A.CD_MOVIMENTO_TE)'#13#10'         LEFT JOIN FIN_PLANO_CONTAS C ' +
        'ON'#13#10'            (A.CD_CONTA = C.CD_CONTA) AND'#13#10'            (A.CD' +
        '_COLIGADA = C.CD_COLIGADA)'#13#10'         LEFT JOIN FIN_CENTRO_CUSTOS' +
        ' CC ON'#13#10'            (A.CD_CENTRO = CC.CD_CENTRO) AND'#13#10'          ' +
        '  (A.CD_COLIGADA = CC.CD_COLIGADA)'#13#10'WHERE'#13#10'   M.CD_MOVIMENTO_TE ' +
        '= :CD_MOVIMENTO_TE'#13#10'ORDER BY'#13#10'   C.DS_CONTA')
    Left = 296
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end>
  end
  object qryMovimento: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   A.CD_CONTA,'
      '   C.DS_CONTA CONTA,'
      
        '   CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(C' +
        'C.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) AS DS_CONTA'
      'FROM'
      '   FIN_APROPRIA_TE A'
      '      LEFT JOIN FIN_PLANO_CONTAS C ON'
      '         (A.CD_CONTA = C.CD_CONTA) AND'
      '         (A.CD_COLIGADA = C.CD_COLIGADA)'
      '      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '         (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '         (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      
        '   CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(C' +
        'C.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DE'
      'ORDER BY'
      '   C.DS_CONTA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT DISTINCT'#13#10'   A.CD_CONTA,'#13#10'   C.DS_CONTA CONTA,'#13#10'  ' +
        ' LEFT(COALESCE(C.DS_CONTA, '#39'<SEM CONTA>'#39') || '#39' / '#39' || COALESCE(C' +
        'C.DS_CENTRO, '#39'<SEM CENTRO CUSTO>'#39'), 200) DS_CONTA'#13#10'FROM'#13#10'   FIN_' +
        'APROPRIA_TE A'#13#10'      LEFT JOIN FIN_PLANO_CONTAS C ON'#13#10'         (' +
        'A.CD_CONTA = C.CD_CONTA) AND'#13#10'         (A.CD_COLIGADA = C.CD_COL' +
        'IGADA)'#13#10'      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'#13#10'         (A.CD_' +
        'CENTRO = CC.CD_CENTRO) AND'#13#10'         (A.CD_COLIGADA = CC.CD_COLI' +
        'GADA)'#13#10'WHERE'#13#10'   A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'#13#10'   LE' +
        'FT(COALESCE(c.ds_conta, '#39'<SEM CONTA>'#39') || '#39' / '#39' || COALESCE(CC.D' +
        'S_CENTRO, '#39'<SEM CENTRO CUSTO>'#39'), 200) = :DE'#13#10'ORDER BY'#13#10'   C.DS_C' +
        'ONTA'
      
        'mysql-5=SELECT DISTINCT'#13#10'   A.CD_CONTA,'#13#10'   C.DS_CONTA CONTA,'#13#10' ' +
        '  CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(CC' +
        '.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) AS DS_CONTA'#13#10'FROM'#13#10'   FIN_APR' +
        'OPRIA_TE A'#13#10'      LEFT JOIN FIN_PLANO_CONTAS C ON'#13#10'         (A.C' +
        'D_CONTA = C.CD_CONTA) AND'#13#10'         (A.CD_COLIGADA = C.CD_COLIGA' +
        'DA)'#13#10'      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'#13#10'         (A.CD_CEN' +
        'TRO = CC.CD_CENTRO) AND'#13#10'         (A.CD_COLIGADA = CC.CD_COLIGAD' +
        'A)'#13#10'WHERE'#13#10'   A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'#13#10'   CONCA' +
        'T(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(CC.ds_cen' +
        'tro, '#39'<SEM CENTRO CUSTO>'#39')) = :DE'#13#10'ORDER BY'#13#10'   C.DS_CONTA')
    Left = 264
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DE'
        ParamType = ptUnknown
      end>
    object qryMovimentoCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object qryMovimentoCONTA: TStringField
      FieldName = 'CONTA'
      Size = 255
    end
    object qryMovimentoDS_CONTA: TMemoField
      FieldName = 'DS_CONTA'
      BlobType = ftMemo
      Size = 255
    end
  end
  object qryUpdApropria: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'MERGE INTO FIN_APROPRIA_TE A USING'
      '('
      '   SELECT'
      '      A.CD_CONTA,'
      '      A.CD_CENTRO'
      '   FROM'
      '      FIN_APROPRIA_TE A'
      '         LEFT JOIN FIN_PLANO_CONTAS C ON'
      '            (A.CD_CONTA = C.CD_CONTA) AND'
      '            (A.CD_COLIGADA = C.CD_COLIGADA)'
      '         LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '            (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '            (A.CD_COLIGADA = CC.CD_COLIGADA)'
      '   WHERE'
      '      A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      
        '      CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESC' +
        'E(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA'
      ') UP ON'
      '   (A.CD_MOVIMENTO_TE = UP.CD_MOVIMENTO_TE AND'
      '    A.CD_CONTA = UP.CD_CONTA AND'
      '    A.CD_COLIGADA = UP.CD_COLIGADA AND'
      '    A.CD_CENTRO = UP.CD_CENTRO)'
      'WHEN MATCHED THEN'
      '   UPDATE SET'
      '      A.CD_CONTA = :CD_CONTA AND'
      '      A.CD_CENTRO = :CD_CENTRO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=MERGE INTO FIN_APROPRIA_TE A USING'#13#10'('#13#10'   SELECT'#13#10'      A' +
        '.CD_CONTA,'#13#10'      A.CD_CENTRO'#13#10'   FROM'#13#10'      FIN_APROPRIA_TE A'#13 +
        #10'         LEFT JOIN FIN_PLANO_CONTAS C ON'#13#10'            (A.CD_CON' +
        'TA = C.CD_CONTA) AND'#13#10'            (A.CD_COLIGADA = C.CD_COLIGADA' +
        ')'#13#10'         LEFT JOIN FIN_CENTRO_CUSTOS CC ON'#13#10'            (A.CD' +
        '_CENTRO = CC.CD_CENTRO) AND'#13#10'            (A.CD_COLIGADA = CC.CD_' +
        'COLIGADA)'#13#10'   WHERE'#13#10'      A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE ' +
        'AND'#13#10'      LEFT(COALESCE(C.DS_CONTA, '#39'<SEM CONTA>'#39') || '#39' / '#39' || ' +
        'COALESCE(CC.DS_CENTRO, '#39'<SEM CENTRO CUSTO>'#39'), 200) = :DS_CONTA'#13#10 +
        ') UP ON'#13#10'   (A.CD_MOVIMENTO_TE = UP.CD_MOVIMENTO_TE AND'#13#10'    A.C' +
        'D_CONTA = UP.CD_CONTA AND'#13#10'    A.CD_COLIGADA = UP.CD_COLIGADA AN' +
        'D'#13#10'    A.CD_CENTRO = UP.CD_CENTRO)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE' +
        ' SET'#13#10'      A.CD_CONTA = :CD_CONTA AND'#13#10'      A.CD_CENTRO = :CD_' +
        'CENTRO'
      
        'mysql-5=REPLACE INTO FIN_APROPRIA_TE (CD_MOVIMENTO_TE, CD_CONTA,' +
        ' CD_COLIGADA, CD_CENTRO, VL_MOVIMENTO, NR_SEQUENCIA)'#13#10'SELECT A.C' +
        'D_MOVIMENTO_TE, :CD_CONTA_PARA, A.CD_COLIGADA, :CD_CENTRO_PARA, ' +
        'SUM(A.VL_MOVIMENTO), MIN(A.NR_SEQUENCIA)'#13#10'  FROM '#13#10'   FIN_APROPR' +
        'IA_TE A'#13#10'      LEFT JOIN FIN_PLANO_CONTAS C ON'#13#10'         (A.CD_C' +
        'ONTA = C.CD_CONTA) AND'#13#10'         (A.CD_COLIGADA = C.CD_COLIGADA)' +
        #13#10'      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'#13#10'         (A.CD_CENTRO' +
        ' = CC.CD_CENTRO) AND'#13#10'         (A.CD_COLIGADA = CC.CD_COLIGADA)'#13 +
        #10'WHERE'#13#10'   A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'#13#10'   ('#13#10'     ' +
        '( CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(CC' +
        '.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA )'#13#10'   '#13#10'   OR '#13#10' ' +
        '    ( (A.CD_CONTA = :CD_CONTA_PARA) and (A.CD_CENTRO = :CD_CENTR' +
        'O_PARA) )   '#13#10'   )'#13#10'GROUP BY A.CD_MOVIMENTO_TE      ')
    Left = 16
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end>
  end
  object qryInsApropria: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_APROPRIA_TE'
      
        '   (CD_MOVIMENTO_TE, CD_CONTA, CD_COLIGADA, CD_CENTRO, VL_MOVIME' +
        'NTO)'
      'VALUES'
      
        '   (:CD_MOVIMENTO_TE, :CD_CONTA, :CD_COLIGADA, :CD_CENTRO, :VL_M' +
        'OVIMENTO)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MOVIMENTO'
        ParamType = ptUnknown
      end>
    Left = 224
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryApagarOrigem: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE A'
      'FROM'
      '   FIN_APROPRIA_TE A'
      ''
      '      LEFT JOIN FIN_PLANO_CONTAS C ON'
      '         (A.CD_CONTA = C.CD_CONTA) AND'
      '         (A.CD_COLIGADA = C.CD_COLIGADA)'
      ''
      '      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '         (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '         (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      
        '   CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(C' +
        'C.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateCompromisso: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'REPLACE INTO FIN_APROPRIA_CP (CD_TITULO, CD_COLIGADA, CD_CONTA, ' +
        'CD_CENTRO, VL_MOVIMENTO)'
      
        'SELECT T.cd_titulo, T.CD_COLIGADA, :CD_CONTA_PARA, :CD_CENTRO_PA' +
        'RA, SUM(A.VL_MOVIMENTO)'
      '  FROM '
      '   FIN_MOV_TESOURARIA T'
      
        '   INNER JOIN FIN_APROPRIA_CP AS A ON (A.cd_titulo = T.cd_titulo' +
        ' AND A.cd_coligada = T.cd_coligada)'
      '      LEFT JOIN FIN_PLANO_CONTAS C ON'
      '         (A.CD_CONTA = C.CD_CONTA) AND'
      '         (A.CD_COLIGADA = C.CD_COLIGADA)'
      '      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '         (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '         (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     (( CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALE' +
        'SCE(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39'))) = :DS_CONTA)'
      '   OR '
      
        '     ( (A.CD_CONTA = :CD_CONTA_PARA) and (A.CD_CENTRO = :CD_CENT' +
        'RO_PARA) )   '
      '   )'
      'GROUP BY T.CD_MOVIMENTO_TE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CONTA_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CONTA_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
  end
  object qryApagarCompromisso: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE FROM A.* USING '
      '   FIN_MOV_TESOURARIA T'
      
        '   INNER JOIN FIN_APROPRIA_CP AS A ON (A.cd_titulo = T.cd_titulo' +
        ' AND A.cd_coligada = T.cd_coligada)'
      '      LEFT JOIN FIN_PLANO_CONTAS C ON'
      '         (A.CD_CONTA = C.CD_CONTA) AND'
      '         (A.CD_COLIGADA = C.CD_COLIGADA)'
      '      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '         (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '         (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     ( CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALES' +
        'CE(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA )'
      '   )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateAgrupamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'REPLACE INTO FIN_APROPRIA_CP (CD_TITULO, CD_COLIGADA, CD_CONTA, ' +
        'CD_CENTRO, VL_MOVIMENTO)'
      
        'SELECT CP.cd_titulo, CP.CD_COLIGADA, :CD_CONTA_PARA, :CD_CENTRO_' +
        'PARA, SUM(A.VL_MOVIMENTO)'
      '  FROM '
      '   FIN_MOV_TESOURARIA T'
      
        '   INNER JOIN FIN_CONTAS_PAGAR AS CP ON (CP.CD_TITULO_ORIGEM = T' +
        '.CD_TITULO AND CP.CD_COLIGADA = T.CD_COLIGADA)'
      
        '   INNER JOIN FIN_APROPRIA_CP AS A ON (A.cd_titulo = CP.cd_titul' +
        'o AND A.cd_coligada = CP.cd_coligada)   '
      '      LEFT JOIN FIN_PLANO_CONTAS C ON'
      '         (A.CD_CONTA = C.CD_CONTA) AND'
      '         (A.CD_COLIGADA = C.CD_COLIGADA)'
      '      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '         (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '         (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     (( CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALE' +
        'SCE(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39'))) = :DS_CONTA )'
      '   OR '
      
        '     ( (A.CD_CONTA = :CD_CONTA_PARA) and (A.CD_CENTRO = :CD_CENT' +
        'RO_PARA) )   '
      '   )'
      'GROUP BY T.CD_MOVIMENTO_TE, CP.cd_titulo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CONTA_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
    Left = 152
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CONTA_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CENTRO_PARA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
  end
  object qryApagarAgrupamentos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE FROM A.* USING '
      '   FIN_MOV_TESOURARIA T'
      
        '   INNER JOIN FIN_CONTAS_PAGAR AS CP ON (CP.CD_TITULO_ORIGEM = T' +
        '.CD_TITULO AND CP.CD_COLIGADA = T.CD_COLIGADA)'
      
        '   INNER JOIN FIN_APROPRIA_CP AS A ON (A.cd_titulo = CP.cd_titul' +
        'o AND A.cd_coligada = CP.cd_coligada)   '
      '      LEFT JOIN FIN_PLANO_CONTAS C ON'
      '         (A.CD_CONTA = C.CD_CONTA) AND'
      '         (A.CD_COLIGADA = C.CD_COLIGADA)'
      '      LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      '         (A.CD_CENTRO = CC.CD_CENTRO) AND'
      '         (A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     ( CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALES' +
        'CE(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA )'
      '   )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MOVIMENTO_TE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTA'
        ParamType = ptUnknown
      end>
  end
end
