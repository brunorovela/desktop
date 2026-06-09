object fHistoricoCheque: TfHistoricoCheque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Detalhes do Cheque'
  ClientHeight = 435
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'INFORMA'#199#213'ES DO CHEQUE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pcCheques: TPageControl
    Left = 0
    Top = 25
    Width = 713
    Height = 369
    ActivePage = tsDetalhes
    Align = alClient
    TabOrder = 1
    object tsDetalhes: TTabSheet
      Caption = 'Detalhes do Cheque'
      ImageIndex = 1
      object dbgChequesMensalidades: TDBGrid
        Left = 0
        Top = 0
        Width = 705
        Height = 341
        Align = alClient
        DataSource = dsChequesDetalhes
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
            FieldName = 'NM_PESSOA'
            Title.Caption = ' Aluno'
            Width = 231
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARCELA'
            Title.Caption = ' Parc.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENCIMENTO'
            Title.Caption = ' Vencimento'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TURMA'
            Title.Caption = ' Turma'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTO'
            Title.Caption = ' Data de Pagamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = ' Valor Pago'
            Visible = True
          end>
      end
    end
    object tsHistorico: TTabSheet
      Caption = 'Hist'#243'rico de Movimenta'#231#245'es'
      object dbgHistorico: TDBGrid
        Left = 0
        Top = 0
        Width = 705
        Height = 341
        Align = alClient
        DataSource = dsChequesMensalidades
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
            FieldName = 'vencimento'
            Title.Caption = 'Data Movimenta'#231#227'o'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'contaAntiga'
            Title.Caption = 'De Conta'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'situacaoAntiga'
            Title.Caption = 'De Situa'#231#227'o'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'conta'
            Title.Caption = 'Para Conta'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'situacao'
            Title.Caption = 'Para Situa'#231#227'o'
            Width = 105
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 394
    Width = 713
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOk: TBitBtn
      Left = 575
      Top = 6
      Width = 114
      Height = 25
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
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
  end
  object qyChequesDetalhes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   COALESCE(P.NM_PESSOA,'#39#39') NM_PESSOA,'
      '   CAST(NVL(M.PARCELA, '#39#39') AS VARCHAR2(10)) PARCELA,'
      '   COALESCE(M.TURMA,'#39#39') TURMA,'
      '   M.DATAVENCIMENTO VENCIMENTO,'
      '   M.DATAPAGAMENTO PAGAMENTO,'
      '   M.VALORPAGO VALOR'
      'FROM'
      '   FIN_CHEQUES FC'
      '      JOIN FIN_CHEQUES_MENSALIDADES FCM ON'
      '         (FC.CD_CHEQUE = FCM.CD_CHEQUE)'
      '         JOIN MENSALIDADES M ON'
      '            (FCM.CD_MENSALIDADE = M.CD_MENSALIDADE)'
      '            JOIN PESSOAS P ON'
      '               (P.CD_PESSOA = M.CODIGOALUNO)'
      'WHERE'
      '   FC.CD_CHEQUE = :CD_CHEQUE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_cheque'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   COALESCE(P.NM_PESSOA,'#39#39') NM_PESSOA,'#13#10'   IFNUL' +
        'L(M.PARCELA,'#39#39') PARCELA,'#13#10'   COALESCE(M.TURMA,'#39#39') TURMA,'#13#10'   M.D' +
        'ATAVENCIMENTO VENCIMENTO,'#13#10'   M.DATAPAGAMENTO PAGAMENTO,'#13#10'   M.V' +
        'ALORPAGO VALOR'#13#10'FROM'#13#10'   FIN_CHEQUES FC'#13#10'      JOIN FIN_CHEQUES_' +
        'MENSALIDADES FCM ON'#13#10'         (FC.CD_CHEQUE = FCM.CD_CHEQUE)'#13#10'  ' +
        '       JOIN MENSALIDADES M ON'#13#10'            (FCM.CD_MENSALIDADE =' +
        ' M.CD_MENSALIDADE)'#13#10'            JOIN PESSOAS P ON'#13#10'             ' +
        '  (P.CD_PESSOA = M.CODIGOALUNO)'#13#10'WHERE'#13#10'   FC.CD_CHEQUE = :CD_CH' +
        'EQUE'
      
        'oracle=SELECT'#13#10'   COALESCE(P.NM_PESSOA,'#39#39') NM_PESSOA,'#13#10'   CAST(N' +
        'VL(M.PARCELA, '#39#39') AS VARCHAR2(10)) PARCELA,'#13#10'   COALESCE(M.TURMA' +
        ','#39#39') TURMA,'#13#10'   M.DATAVENCIMENTO VENCIMENTO,'#13#10'   M.DATAPAGAMENTO' +
        ' PAGAMENTO,'#13#10'   M.VALORPAGO VALOR'#13#10'FROM'#13#10'   FIN_CHEQUES FC'#13#10'    ' +
        '  JOIN FIN_CHEQUES_MENSALIDADES FCM ON'#13#10'         (FC.CD_CHEQUE =' +
        ' FCM.CD_CHEQUE)'#13#10'         JOIN MENSALIDADES M ON'#13#10'            (F' +
        'CM.CD_MENSALIDADE = M.CD_MENSALIDADE)'#13#10'            JOIN PESSOAS ' +
        'P ON'#13#10'               (P.CD_PESSOA = M.CODIGOALUNO)'#13#10'WHERE'#13#10'   FC' +
        '.CD_CHEQUE = :CD_CHEQUE')
    Left = 616
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_cheque'
        ParamType = ptUnknown
      end>
    object qyChequesDetalhesNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ReadOnly = True
      Size = 60
    end
    object qyChequesDetalhesPARCELA: TStringField
      FieldName = 'PARCELA'
      ReadOnly = True
      Size = 10
    end
    object qyChequesDetalhesTURMA: TStringField
      FieldName = 'TURMA'
      ReadOnly = True
      Size = 50
    end
    object qyChequesDetalhesVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyChequesDetalhesPAGAMENTO: TDateTimeField
      FieldName = 'PAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyChequesDetalhesVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsChequesDetalhes: TDataSource
    DataSet = qyChequesDetalhes
    Left = 664
    Top = 16
  end
  object qyChequesMensalidades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   fch.dt_movimentacao AS vencimento,'
      '   cc.ds_caixa as conta,'
      '   s.ds_valor as situacao,'
      '   cc2.ds_caixa as contaAntiga,'
      '   s2.ds_valor as situacaoAntiga '
      'FROM'
      '   fin_cheques_historicos fch'
      
        '   INNER JOIN fin_cadastro_contas cc ON (fch.cd_caixa = cc.cd_ca' +
        'ixa)'
      
        '   INNER JOIN situacoes s ON (s.cd_modulo = 2050 AND s.cd_situac' +
        'ao = fch.cd_situacao)'
      
        '   INNER JOIN fin_cadastro_contas cc2 ON (fch.cd_caixa_antigo = ' +
        'cc2.cd_caixa)'
      
        '   INNER JOIN situacoes s2 ON (s2.cd_modulo = 2050 AND s2.cd_sit' +
        'uacao = fch.cd_situacao_antigo)'
      'WHERE'
      '   cd_cheque=:cd_cheque')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_cheque'
        ParamType = ptUnknown
      end>
    Left = 512
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_cheque'
        ParamType = ptUnknown
      end>
    object qyChequesMensalidadesvencimento: TDateTimeField
      FieldName = 'vencimento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyChequesMensalidadesconta: TStringField
      FieldName = 'conta'
    end
    object qyChequesMensalidadessituacao: TStringField
      FieldName = 'situacao'
      Size = 255
    end
    object qyChequesMensalidadescontaAntiga: TStringField
      FieldName = 'contaAntiga'
      Size = 255
    end
    object qyChequesMensalidadessituacaoAntiga: TStringField
      FieldName = 'situacaoAntiga'
      Size = 255
    end
  end
  object dsChequesMensalidades: TDataSource
    DataSet = qyChequesMensalidades
    Left = 552
    Top = 8
  end
end
