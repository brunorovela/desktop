object frmCancelarOperacao: TfrmCancelarOperacao
  Left = 0
  Top = 0
  Caption = 'Cancelamento de opera'#231#227'o por cart'#227'o'
  ClientHeight = 429
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 429
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnRemessaTit: TPanel
      Left = 0
      Top = 0
      Width = 694
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'CANCELAMENTO DE OP'#199#195'O POR CART'#195'O'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 388
      Width = 694
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object btnLiquidar: TSpeedButton
        Tag = 1
        Left = 0
        Top = 0
        Width = 348
        Height = 41
        Hint = 'Confirmar'
        Align = alLeft
        Caption = 'Confirmar'
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
        OnClick = btnLiquidarClick
      end
      object btnCancelar: TSpeedButton
        Left = 347
        Top = 0
        Width = 347
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
        ExplicitLeft = 346
      end
    end
    object mObservacao: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 259
      Width = 688
      Height = 126
      Align = alTop
      Lines.Strings = (
        'mObservacao')
      MaxLength = 254
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object pnMensagemTopo: TPanel
      Left = 0
      Top = 25
      Width = 694
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label3: TLabel
        Left = 10
        Top = 4
        Width = 525
        Height = 13
        Caption = 
          'Ao confirmar o cancelamento desta opera'#231#227'o, todas as parcelas ge' +
          'radas para o cart'#227'o ser'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 23
        Width = 414
        Height = 13
        Caption = 
          'canceladas e tamb'#233'm ser'#227'o estornadas as mensalidades listadas ab' +
          'aixo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object dbgMensalidades: TDBGrid
      Left = 0
      Top = 66
      Width = 694
      Height = 137
      Margins.Left = 20
      Margins.Right = 20
      Align = alTop
      DataSource = dsMensalidades
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nm_pessoa'
          Title.Caption = 'Aluno'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'turma'
          Title.Caption = 'Turma'
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'anosemestre'
          Title.Caption = 'Ano/Semestre'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'parcela'
          Title.Caption = 'Parcela'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorpago'
          Title.Caption = 'Valor baixado'
          Width = 112
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 203
      Width = 694
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 69
        Height = 14
        Caption = 'Valor total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTotal: TLabel
        Left = 85
        Top = 8
        Width = 42
        Height = 14
        Caption = 'lbTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 242
        Top = 8
        Width = 84
        Height = 14
        Caption = 'Qtd. Parcelas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbQtdParcelas: TLabel
        Left = 332
        Top = 8
        Width = 8
        Height = 14
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 443
        Top = 8
        Width = 161
        Height = 14
        Caption = 'Data original da opera'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDataOperacao: TLabel
        Left = 610
        Top = 8
        Width = 78
        Height = 14
        Caption = '10/10/2015'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 231
      Width = 694
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'MOTIVO DO ESTORNO'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object dsMensalidades: TDataSource
    DataSet = qyMensalidades
    Left = 520
    Top = 152
  end
  object qyMensalidades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'p.nm_pessoa,'
      #9'm.turma,'
      #9'm.anosemestre,'
      #9'm.parcela,'
      #9'm.valorpago,'
      '                fco.vl_total,'
      #9'fco.nr_qtd_parcelas,'
      #9'fco.dt_operacao,'
      '                m.cd_mensalidade,'
      '                m.cd_mensalidade_origem,'
      '                m.cd_coligada'
      'FROM'
      #9'fin_cartao_operacao fco'
      'INNER JOIN fin_cartao_mensalidades fcm ON ('
      #9'fcm.cd_operacao = fco.cd_operacao'
      ')'
      'INNER JOIN mensalidades m ON ('
      #9'm.cd_mensalidade = fcm.cd_mensalidade'
      ')'
      'INNER JOIN pessoas p ON ('
      #9'p.cd_pessoa = m.codigoaluno'
      ')'
      'WHERE'
      #9'fco.cd_operacao = :cd_operacao'
      'GROUP BY'
      #9'fcm.cd_mensalidade')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_operacao'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_operacao'
        ParamType = ptUnknown
      end>
    object qyMensalidadesnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyMensalidadesturma: TStringField
      FieldName = 'turma'
      Required = True
      Size = 50
    end
    object qyMensalidadesanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object qyMensalidadesparcela: TSmallintField
      FieldName = 'parcela'
      Required = True
    end
    object qyMensalidadesvalorpago: TFloatField
      FieldName = 'valorpago'
    end
    object qyMensalidadesvl_total: TFloatField
      FieldName = 'vl_total'
    end
    object qyMensalidadesnr_qtd_parcelas: TIntegerField
      FieldName = 'nr_qtd_parcelas'
    end
    object qyMensalidadesdt_operacao: TDateTimeField
      FieldName = 'dt_operacao'
    end
    object qyMensalidadescd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Required = True
    end
    object qyMensalidadescd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
    end
    object qyMensalidadescd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
  end
end
