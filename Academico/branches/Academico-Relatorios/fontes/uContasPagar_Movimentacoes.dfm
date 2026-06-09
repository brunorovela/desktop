object frm_ContasPagar_Movimentacoes: Tfrm_ContasPagar_Movimentacoes
  Left = 278
  Top = 246
  BorderStyle = bsDialog
  Caption = 'Movimenta'#231#245'es do Compromisso a Pagar'
  ClientHeight = 282
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 778
    Height = 9
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 687
  end
  object Bevel2: TBevel
    Left = 0
    Top = 248
    Width = 778
    Height = 34
    Align = alBottom
    Shape = bsSpacer
    ExplicitWidth = 687
  end
  object Bevel3: TBevel
    Left = 0
    Top = 9
    Width = 10
    Height = 239
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel4: TBevel
    Left = 768
    Top = 9
    Width = 10
    Height = 239
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 677
  end
  object sbObservacao: TSpeedButton
    Left = 480
    Top = 254
    Width = 119
    Height = 22
    Caption = 'F11 Observa'#231#245'es'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
    OnClick = sbObservacaoClick
  end
  object sbFechar: TSpeedButton
    Left = 600
    Top = 254
    Width = 89
    Height = 22
    Caption = 'F12 Fechar'
    Flat = True
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
      1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
      1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
      1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
      1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
      1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
      1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
      1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
      1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
      1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
      1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
      1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
    OnClick = sbFecharClick
  end
  object btnCancelar: TSpeedButton
    Left = 8
    Top = 252
    Width = 161
    Height = 25
    Caption = 'Cancelar Movimenta'#231#227'o'
    Flat = True
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
      FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
      FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
      1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
      FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
      000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
    OnClick = btnCancelarClick
  end
  object pgOpcoes: TPageControl
    Left = 10
    Top = 9
    Width = 758
    Height = 239
    ActivePage = tsApropriacao
    Align = alClient
    TabOrder = 0
    OnChange = pgOpcoesChange
    object tsMovimentacao: TTabSheet
      Caption = 'Movimenta'#231#245'es'
      object grd: TDBGrid
        Left = 0
        Top = 0
        Width = 750
        Height = 210
        Align = alClient
        DataSource = srcMovimentacoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pmLog
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_acao'
            Title.Caption = 'Descri'#231#227'o do movimento'
            Width = 175
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pagamento'
            Title.Caption = 'Pgto.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_movimento'
            Title.Caption = 'Data Mvto'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_entrada'
            Title.Caption = 'Entrada'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_desconto'
            Title.Caption = 'Desconto'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_multa'
            Title.Caption = 'Multa'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_juros'
            Title.Caption = 'Juros'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_liquido'
            Title.Caption = 'L'#237'quido'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_saida'
            Title.Caption = 'Liquidado'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usu'#225'rio'
            Width = 178
            Visible = True
          end>
      end
    end
    object tsApropriacao: TTabSheet
      Caption = 'Apropria'#231#245'es'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 750
        Height = 210
        Align = alClient
        DataSource = srcApropriacoes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_conta'
            Title.Caption = 'Plano de Contas'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_centro'
            Title.Caption = 'Centro de Custos'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_movimento'
            Title.Caption = 'Vl. Apropria'#231#227'o Total'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_apropriacao_parcela'
            Title.Caption = 'Vl. Apropria'#231#227'o Parcela'
            Width = 137
            Visible = True
          end>
      end
    end
    object tsEstorno: TTabSheet
      Caption = 'Estornos'
      ImageIndex = 2
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 69
        Height = 14
        Caption = 'Data de baixa:'
      end
      object Label2: TLabel
        Left = 3
        Top = 23
        Width = 80
        Height = 14
        Caption = 'Data de estorno:'
      end
      object Label3: TLabel
        Left = 3
        Top = 42
        Width = 74
        Height = 14
        Caption = 'Nome do caixa:'
      end
      object Label4: TLabel
        Left = 3
        Top = 80
        Width = 52
        Height = 14
        Caption = 'Descri'#231#227'o:'
      end
      object lblUsuario: TLabel
        Left = 3
        Top = 61
        Width = 40
        Height = 14
        Caption = 'Usu'#225'rio:'
      end
      object dtBaixa: TDBText
        Left = 89
        Top = 3
        Width = 585
        Height = 17
        DataField = 'dt_baixa'
        DataSource = dsEstorno
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtEstorno: TDBText
        Left = 89
        Top = 23
        Width = 585
        Height = 17
        DataField = 'dt_estorno'
        DataSource = dsEstorno
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cdUsuario: TDBText
        Left = 89
        Top = 61
        Width = 586
        Height = 17
        DataField = 'nm_pessoa'
        DataSource = dsEstorno
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCaixa: TLabel
        Left = 89
        Top = 42
        Width = 3
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDesc: TLabel
        Left = 92
        Top = 80
        Width = 3
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object srcMovimentacoes: TDataSource
    DataSet = qyMovimentacoes
    Left = 16
    Top = 248
  end
  object qyMovimentacoes: TUMZQuery
    Connection = DM.db
    Filtered = True
    UpdateObject = updMovimentacoes
    CachedUpdates = True
    SQL.Strings = (
      'SELECT'
      '   m.*,'
      '   tp.ds_acao, '
      '   tp.cd_tipo_acao,'
      '   tp.cd_origem,'
      '   coalesce(p.nm_pessoa,u.nome) USUARIO'
      'FROM'
      '   fin_mov_cp m INNER JOIN fin_acoes_movimento tp'
      '      ON (tp.cd_acao = m.cd_acao)'
      '   LEFT JOIN usuarios u ON (m.cd_usuario = u.codigo) '
      '   LEFT JOIN pessoas p ON (m.cd_usuario = p.cd_pessoa )'
      'WHERE   '
      '   cd_titulo = :cd_titulo AND'
      '   cd_coligada = :cd_coligada')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyMovimentacoescd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.movimentacao_cp.cd_titulo'
    end
    object qyMovimentacoesnr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.movimentacao_cp.nr_sequencia'
    end
    object qyMovimentacoesdt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.movimentacao_cp.dt_movimento'
    end
    object qyMovimentacoesvl_entrada: TFloatField
      FieldName = 'vl_entrada'
      Origin = 'WMESTRE12.movimentacao_cp.vl_entrada'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacoesvl_saida: TFloatField
      FieldName = 'vl_saida'
      Origin = 'WMESTRE12.movimentacao_cp.vl_saida'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacoesvl_multa: TFloatField
      FieldName = 'vl_multa'
      Origin = 'WMESTRE12.movimentacao_cp.vl_multa'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacoesvl_juros: TFloatField
      FieldName = 'vl_juros'
      Origin = 'WMESTRE12.movimentacao_cp.vl_juros'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacoesvl_desconto: TFloatField
      FieldName = 'vl_desconto'
      Origin = 'WMESTRE12.movimentacao_cp.vl_desconto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacoesvl_liquido: TFloatField
      FieldName = 'vl_liquido'
      Origin = 'WMESTRE12.movimentacao_cp.vl_liquido'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacoescd_movimento_te: TLargeintField
      FieldName = 'cd_movimento_te'
    end
    object qyMovimentacoesds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.movimentacao_cp.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyMovimentacoescd_acao: TLargeintField
      FieldName = 'cd_acao'
    end
    object qyMovimentacoesds_acao: TStringField
      FieldName = 'ds_acao'
      Origin = 'WMESTRE12.fin_acoes_movimento.ds_acao'
      Size = 255
    end
    object qyMovimentacoescd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_mov_cp.cd_coligada'
    end
    object qyMovimentacoescd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
    object qyMovimentacoesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object qyMovimentacoesdt_pagamento: TDateTimeField
      FieldName = 'dt_pagamento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyMovimentacoescd_tipo_acao: TSmallintField
      FieldName = 'cd_tipo_acao'
    end
    object qyMovimentacoescd_origem: TSmallintField
      FieldName = 'cd_origem'
    end
  end
  object updMovimentacoes: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from fin_mov_cp'
      'where'
      '  cd_titulo = :OLD_cd_titulo and'
      '  cd_coligada = :OLD_cd_coligada and'
      '  nr_sequencia = :OLD_nr_sequencia')
    InsertSQL.Strings = (
      'insert into fin_mov_cp'
      '  (cd_titulo, cd_coligada, nr_sequencia, ds_observacao)'
      'values'
      '  (:cd_titulo, :cd_coligada, :nr_sequencia, :ds_observacao)')
    ModifySQL.Strings = (
      'update fin_mov_cp'
      'set'
      '  cd_titulo = :cd_titulo,'
      '  cd_coligada = :cd_coligada,'
      '  nr_sequencia = :nr_sequencia,'
      '  ds_observacao = :ds_observacao'
      'where'
      '  cd_titulo = :OLD_cd_titulo and'
      '  cd_coligada = :OLD_cd_coligada and'
      '  nr_sequencia = :OLD_nr_sequencia')
    UseSequenceFieldForRefreshSQL = False
    Left = 80
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_sequencia'
        ParamType = ptUnknown
      end>
  end
  object pmLog: TPopupMenu
    Left = 640
    Top = 497
  end
  object srcApropriacoes: TDataSource
    DataSet = qyApropriacoes
    Left = 152
    Top = 248
  end
  object qyApropriacoes: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'fpc.ds_conta,'
      #9'fcc.ds_centro,'
      #9'fac.vl_movimento,'
      
        '  ROUND((fac.vl_movimento / fcp.vl_total_despesa) * (fcp.vl_desp' +
        'esa - COALESCE(( SELECT cp.vl_abatimento from fin_contas_pagar c' +
        'p WHERE cp.cd_titulo = :cd_titulo_abat AND  cp.cd_coligada = :cd' +
        '_coligada_abat ), 0)) , 2) as vl_apropriacao_parcela'
      'FROM'
      #9'fin_apropria_cp fac'
      'INNER JOIN fin_centro_custos fcc ON ('
      #9'fcc.cd_centro = fac.cd_centro'
      #9'AND fcc.cd_coligada = fac.cd_coligada'
      ')'
      'INNER JOIN fin_plano_contas fpc ON ('
      #9'fpc.cd_conta = fac.cd_conta'
      #9'AND fpc.cd_coligada = fac.cd_coligada'
      ')'
      'INNER JOIN fin_contas_pagar fcp ON ('
      #9'fcp.cd_titulo = fac.cd_titulo'
      ')'
      'WHERE'
      #9'fac.cd_titulo = :cd_titulo'
      #9'AND fac.cd_coligada = :cd_coligada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo_abat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada_abat'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo_abat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada_abat'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyApropriacoesds_conta: TStringField
      FieldName = 'ds_conta'
      Origin = 'WMESTRE12.plano_contas.ds_conta'
      Size = 255
    end
    object qyApropriacoesds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.plano_centro_custos.ds_centro'
      Size = 255
    end
    object qyApropriacoesvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.apropriacao_cp.vl_movimento'
      DisplayFormat = '###,###,##0.00'
    end
    object qyApropriacoesvl_apropriacao_parcela: TFloatField
      FieldName = 'vl_apropriacao_parcela'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qryEstorno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '    p.nm_pessoa, fe.dt_baixa, fe.dt_estorno,CASE WHEN fe.ds_esto' +
        'rno <> '#39#39' THEN fe.ds_estorno ELSE '#39'Motivo de estorno n'#227'o registr' +
        'ado'#39'END ds_estorno, fcc.ds_caixa'
      'FROM'
      '    fin_estornos fe'
      '    LEFT JOIN pessoas p ON ( p.cd_pessoa = fe.cd_usuario )'
      
        '    LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = fe.cd_c' +
        'aixa )'
      'WHERE'
      '   fe.cd_titulo = :cd_titulo'
      'ORDER BY'
      '   fe.dt_estorno desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end>
    object qryEstornonm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qryEstornodt_baixa: TDateTimeField
      FieldName = 'dt_baixa'
    end
    object qryEstornodt_estorno: TDateTimeField
      FieldName = 'dt_estorno'
    end
    object qryEstornods_estorno: TMemoField
      FieldName = 'ds_estorno'
      BlobType = ftMemo
    end
    object qryEstornods_caixa: TStringField
      FieldName = 'ds_caixa'
      Size = 255
    end
  end
  object dsEstorno: TDataSource
    DataSet = qryEstorno
    Left = 48
    Top = 208
  end
end
