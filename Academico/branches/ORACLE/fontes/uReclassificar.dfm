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
    TabOrder = 0
  end
  object btnConfirmar: TBitBtn
    Left = 390
    Top = 282
    Width = 107
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 11
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
    TabOrder = 12
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
    TabOrder = 1
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
    TabOrder = 2
  end
  object edData: TEdit
    Left = 430
    Top = 56
    Width = 76
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 3
  end
  object edValor: TEdit
    Left = 512
    Top = 56
    Width = 76
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 4
  end
  object cbDe: TComboBox
    Left = 22
    Top = 156
    Width = 566
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 16
    TabOrder = 6
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
    TabOrder = 8
    OnChange = cbParaChange
    OnKeyPress = cbParaKeyPress
  end
  object edPara: TEdit
    Left = 22
    Top = 208
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 7
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
    TabOrder = 10
    OnChange = cbCentroChange
    OnKeyPress = cbParaKeyPress
  end
  object edCentro: TEdit
    Left = 22
    Top = 253
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 9
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
    TabOrder = 5
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
      '   M.CD_MENSALIDADE,'
      
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
      
        'mysql-5=SELECT DISTINCT'#13#10'   M.CD_TITULO, '#13#10'   M.CD_MOVIMENTO_TE,' +
        #13#10'   M.DS_MOVIMENTO,'#13#10'   M.DT_MOVIMENTO,'#13#10'   M.VL_MOVIMENTO,'#13#10'  ' +
        ' A.CD_CONTA,'#13#10'   A.CD_CENTRO,'#13#10'   C.DS_CONTA CONTA,'#13#10'   M.CD_MEN' +
        'SALIDADE,'#13#10'   CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39',' +
        ' COALESCE(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) DS_CONTA'#13#10'FROM'#13#10' ' +
        '  FIN_MOV_TESOURARIA M'#13#10'      LEFT JOIN FIN_APROPRIA_TE A ON'#13#10'  ' +
        '       (M.CD_MOVIMENTO_TE = A.CD_MOVIMENTO_TE)'#13#10'         LEFT JO' +
        'IN FIN_PLANO_CONTAS C ON'#13#10'            (A.CD_CONTA = C.CD_CONTA) ' +
        'AND'#13#10'            (A.CD_COLIGADA = C.CD_COLIGADA)'#13#10'         LEFT ' +
        'JOIN FIN_CENTRO_CUSTOS CC ON'#13#10'            (A.CD_CENTRO = CC.CD_C' +
        'ENTRO) AND'#13#10'            (A.CD_COLIGADA = CC.CD_COLIGADA)'#13#10'WHERE'#13 +
        #10'   M.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE'#13#10'ORDER BY'#13#10'   C.DS_CONT' +
        'A'
      
        'oracle=SELECT DISTINCT'#13#10'   M.CD_TITULO, '#13#10'   M.CD_MOVIMENTO_TE,'#13 +
        #10'   M.DS_MOVIMENTO,'#13#10'   M.DT_MOVIMENTO,'#13#10'   M.VL_MOVIMENTO,'#13#10'   ' +
        'A.CD_CONTA,'#13#10'   A.CD_CENTRO,'#13#10'   C.DS_CONTA CONTA,'#13#10'   M.CD_MENS' +
        'ALIDADE,'#13#10'   LEFT(COALESCE(C.DS_CONTA, '#39'<SEM CONTA>'#39') || '#39' / '#39' |' +
        '| COALESCE(CC.DS_CENTRO, '#39'<SEM CENTRO CUSTO>'#39'), 200) DS_CONTA'#13#10'F' +
        'ROM'#13#10'   FIN_MOV_TESOURARIA M'#13#10'      LEFT JOIN FIN_APROPRIA_TE A ' +
        'ON'#13#10'         (M.CD_MOVIMENTO_TE = A.CD_MOVIMENTO_TE)'#13#10'         L' +
        'EFT JOIN FIN_PLANO_CONTAS C ON'#13#10'            (A.CD_CONTA = C.CD_C' +
        'ONTA) AND'#13#10'            (A.CD_COLIGADA = C.CD_COLIGADA)'#13#10'        ' +
        ' LEFT JOIN FIN_CENTRO_CUSTOS CC ON'#13#10'            (A.CD_CENTRO = C' +
        'C.CD_CENTRO) AND'#13#10'            (A.CD_COLIGADA = CC.CD_COLIGADA)'#13#10 +
        'WHERE'#13#10'   M.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE'#13#10'ORDER BY'#13#10'   C.D' +
        'S_CONTA')
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
  object srcUpdate: TZSQLProcessor
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
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
    Script.Strings = (
      'REPLACE INTO FIN_APROPRIA_TE ('
      #9'CD_MOVIMENTO_TE,'
      #9'CD_CONTA,'
      #9'CD_COLIGADA,'
      #9'CD_CENTRO,'
      #9'VL_MOVIMENTO,'
      #9'NR_SEQUENCIA'
      ')'
      'SELECT'
      #9'A.CD_MOVIMENTO_TE,'
      #9':CD_CONTA_PARA,'
      #9'A.CD_COLIGADA,'
      #9':CD_CENTRO_PARA,'
      #9'SUM(A.VL_MOVIMENTO),'
      #9'MIN(A.NR_SEQUENCIA)'
      'FROM '
      #9'FIN_APROPRIA_TE A'
      ''
      #9#9'LEFT JOIN FIN_PLANO_CONTAS C ON'
      #9#9#9'(A.CD_CONTA = C.CD_CONTA) AND'
      #9#9#9'(A.CD_COLIGADA = C.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      #9#9#9'(A.CD_CENTRO = CC.CD_CENTRO) AND'
      #9#9#9'(A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     (CONCAT(COALESCE(C.DS_CONTA, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESC' +
        'E(CC.DS_CENTRO, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA) OR '
      
        '     ((A.CD_CONTA = :CD_CONTA_PARA) AND (A.CD_CENTRO = :CD_CENTR' +
        'O_PARA))'
      '   )'
      'GROUP BY'
      #9'A.CD_MOVIMENTO_TE;'
      ''
      'DELETE A'
      'FROM'
      #9'FIN_APROPRIA_TE A'
      ''
      #9#9'LEFT JOIN FIN_PLANO_CONTAS C ON'
      #9#9#9'(A.CD_CONTA = C.CD_CONTA) AND'
      #9#9#9'(A.CD_COLIGADA = C.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      #9#9#9'(A.CD_CENTRO = CC.CD_CENTRO) AND'
      #9#9#9'(A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      #9'A.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      
        #9'CONCAT(COALESCE(C.DS_CONTA, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(CC.' +
        'DS_CENTRO, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA;'
      ''
      'REPLACE INTO FIN_APROPRIA_CP ('
      #9'CD_TITULO,'
      #9'CD_COLIGADA,'
      #9'CD_CONTA,'
      #9'CD_CENTRO,'
      #9'VL_MOVIMENTO'
      ')'
      'SELECT'
      #9'T.CD_TITULO,'
      #9'T.CD_COLIGADA,'
      #9':CD_CONTA_PARA,'
      #9':CD_CENTRO_PARA,'
      #9'SUM(A.VL_MOVIMENTO)'
      'FROM'
      #9'FIN_MOV_TESOURARIA T'
      ''
      #9#9'JOIN FIN_APROPRIA_CP A ON'
      #9#9#9'(A.CD_TITULO = T.CD_TITULO) AND'
      #9#9#9'(A.CD_COLIGADA = T.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_PLANO_CONTAS C ON'
      #9#9#9'(A.CD_CONTA = C.CD_CONTA) AND'
      #9#9#9'(A.CD_COLIGADA = C.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      #9#9#9'(A.CD_CENTRO = CC.CD_CENTRO) AND'
      #9#9#9'(A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      #9'T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      #9'('
      
        #9#9'((CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESCE(' +
        'CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39'))) = :DS_CONTA) OR'
      
        #9#9'((A.CD_CONTA = :CD_CONTA_PARA) AND (A.CD_CENTRO = :CD_CENTRO_P' +
        'ARA))'
      #9')'
      'GROUP BY'
      #9'T.CD_MOVIMENTO_TE;'
      ''
      'DELETE FROM A.* USING'
      #9'FIN_MOV_TESOURARIA T'
      #9#9'JOIN FIN_APROPRIA_CP A ON'
      #9#9#9'(A.CD_TITULO = T.CD_TITULO AND A.cd_coligada = T.cd_coligada)'
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
      '   );'
      ''
      'REPLACE INTO FIN_APROPRIA_CP ('
      #9'CD_TITULO,'
      #9'CD_COLIGADA,'
      #9'CD_CONTA,'
      #9'CD_CENTRO,'
      #9'VL_MOVIMENTO'
      ')'
      'SELECT'
      #9'CP.CD_TITULO,'
      #9'CP.CD_COLIGADA,'
      #9':CD_CONTA_PARA,'
      #9':CD_CENTRO_PARA,'
      #9'SUM(A.VL_MOVIMENTO)'
      'FROM'
      #9'FIN_MOV_TESOURARIA T'
      ''
      #9#9'JOIN FIN_CONTAS_PAGAR CP ON'
      #9#9#9'(CP.CD_TITULO_ORIGEM = T.CD_TITULO) AND'
      #9#9#9'(CP.CD_COLIGADA = T.CD_COLIGADA)'
      ''
      #9#9'JOIN FIN_APROPRIA_CP A ON'
      #9#9#9'(A.CD_TITULO = CP.CD_TITULO) AND'
      #9#9#9'(A.CD_COLIGADA = CP.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_PLANO_CONTAS C ON'
      #9#9#9'(A.CD_CONTA = C.CD_CONTA) AND'
      #9#9#9'(A.CD_COLIGADA = C.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      #9#9#9'(A.CD_CENTRO = CC.CD_CENTRO) AND'
      #9#9#9'(A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     ((CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALES' +
        'CE(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39'))) = :DS_CONTA) OR '
      
        '     ((A.CD_CONTA = :CD_CONTA_PARA) AND (A.CD_CENTRO = :CD_CENTR' +
        'O_PARA))'
      '   )'
      'GROUP BY'
      #9'T.CD_MOVIMENTO_TE,'
      #9'CP.CD_TITULO;'
      ''
      'DELETE FROM A.* USING '
      #9'FIN_MOV_TESOURARIA T'
      ''
      #9#9'JOIN FIN_CONTAS_PAGAR CP ON'
      #9#9#9'(CP.CD_TITULO_ORIGEM = T.CD_TITULO) AND'
      #9#9#9'(CP.CD_COLIGADA = T.CD_COLIGADA)'
      ''
      #9#9'JOIN FIN_APROPRIA_CP A ON'
      #9#9#9'(A.CD_TITULO = CP.CD_TITULO) AND'
      #9#9#9'(A.CD_COLIGADA = CP.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_PLANO_CONTAS C ON'
      #9#9#9'(A.CD_CONTA = C.CD_CONTA) AND'
      #9#9#9'(A.CD_COLIGADA = C.CD_COLIGADA)'
      ''
      #9#9'LEFT JOIN FIN_CENTRO_CUSTOS CC ON'
      #9#9#9'(A.CD_CENTRO = CC.CD_CENTRO) AND'
      #9#9#9'(A.CD_COLIGADA = CC.CD_COLIGADA)'
      'WHERE'
      '   T.CD_MOVIMENTO_TE = :CD_MOVIMENTO_TE AND'
      '   ('
      
        '     (CONCAT(COALESCE(C.ds_conta, '#39'<SEM CONTA>'#39'), '#39' / '#39', COALESC' +
        'E(CC.ds_centro, '#39'<SEM CENTRO CUSTO>'#39')) = :DS_CONTA)'
      '   );'
      ''
      'UPDATE MENSALIDADES'
      'SET'
      '        CD_CENTRO_CUSTO = :CD_CENTRO_PARA,'
      '        CD_PLANO_CONTA = :CD_CONTA_PARA'
      'WHERE'
      '        CD_MENSALIDADE = :CD_MENSALIDADE;')
    Connection = DM.db
    Delimiter = ';'
    Left = 384
    Top = 232
  end
end
