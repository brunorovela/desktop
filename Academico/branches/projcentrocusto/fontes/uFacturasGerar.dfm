object frmFacturasGerar: TfrmFacturasGerar
  Left = 0
  Top = 0
  Caption = 'Gerar Facturas manualmente'
  ClientHeight = 622
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 597
    Align = alClient
    TabOrder = 0
    object paCabecalho: TPanel
      Left = 1
      Top = 1
      Width = 850
      Height = 29
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'GERAR FACTURAS MANUALMENTE'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 30
      Width = 850
      Height = 67
      Align = alTop
      TabOrder = 1
      object lbFiltroAluno: TLabel
        Left = 7
        Top = 11
        Width = 109
        Height = 14
        Caption = 'Selecione um Auno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbFiltroData: TLabel
        Left = 7
        Top = 46
        Width = 90
        Height = 14
        Caption = 'Compet'#234'ncia de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbAte: TLabel
        Left = 298
        Top = 46
        Width = 18
        Height = 14
        Caption = 'At'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object sbBuscarPessoa: TSpeedButton
        Left = 407
        Top = 9
        Width = 23
        Height = 21
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
        OnClick = sbBuscarPessoaClick
      end
      object edAluno: TEdit
        Left = 123
        Top = 9
        Width = 278
        Height = 21
        Align = alCustom
        ReadOnly = True
        TabOrder = 0
      end
      object btFiltrar: TButton
        Left = 516
        Top = 39
        Width = 67
        Height = 21
        Caption = 'Filtrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btFiltrarClick
      end
      object dtInicio: TDateTimePicker
        Left = 106
        Top = 40
        Width = 186
        Height = 21
        Date = 41074.442668576390000000
        Time = 41074.442668576390000000
        TabOrder = 2
      end
      object dtFinal: TDateTimePicker
        Left = 324
        Top = 40
        Width = 186
        Height = 21
        Date = 41074.442668576390000000
        Time = 41074.442668576390000000
        TabOrder = 3
      end
    end
    object dbListaMensalidades: TDBGrid
      Left = 1
      Top = 97
      Width = 850
      Height = 499
      Align = alClient
      Ctl3D = True
      DataSource = dsTitulos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColExit = dbListaMensalidadesColExit
      OnDrawColumnCell = dbListaMensalidadesDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'checado'
          Title.Alignment = taCenter
          Title.Caption = 'S'
          Width = 15
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'cd_factura'
          Title.Alignment = taCenter
          Title.Caption = 'Factura'
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'parcela'
          Title.Alignment = taCenter
          Title.Caption = 'Parcela'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'datavencimento'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Vencimento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_titulo'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 180
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'valorbruto'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_situacao'
          Title.Alignment = taCenter
          Title.Caption = 'Situa'#231#227'o'
          Width = 180
          Visible = True
        end>
    end
  end
  object dbCheckFactura: TDBCheckBox
    Left = 15
    Top = 117
    Width = 15
    Height = 17
    Color = clBtnFace
    DataField = 'checado'
    DataSource = dsTitulos
    ParentColor = False
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
  object toolMatricula: TToolBar
    Left = 0
    Top = 597
    Width = 852
    Height = 25
    Align = alBottom
    ButtonWidth = 99
    Caption = 'toolFinanceiro'
    EdgeBorders = [ebTop, ebBottom]
    Images = imgListaBotoes
    List = True
    ShowCaptions = True
    TabOrder = 2
    Wrapable = False
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btGerarFactura: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'Gerar Facturas'
      ImageIndex = 0
      OnClick = btGerarFacturaClick
    end
    object ToolButton4: TToolButton
      Left = 111
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btCancelar: TToolButton
      Left = 119
      Top = 0
      AutoSize = True
      Caption = 'Cancelar'
      ImageIndex = 1
      OnClick = btCancelarClick
    end
    object ToolButton12: TToolButton
      Left = 192
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
  end
  object qyTitulos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'm.datavencimento,'
      #9'm.parcela,'
      #9'ftt.ds_tipo_titulo,'
      
        #9'SUM(IFNULL(m.valorbruto, 0)- IFNULL(m.descontoextra,0) + GET_AC' +
        'RESCIMOS(m.cd_mensalidade, null)) as valorbruto,'
      #9'sf.ds_situacao,'
      #9'm.nr_nf as cd_factura,'
      '  m.cd_mensalidade'
      'FROM'
      #9'mensalidades m'
      
        '  INNER JOIN fin_tipos_titulo ftt ON( ftt.cd_tipo_titulo = m.cd_' +
        'tipo_titulo )'
      
        '  INNER JOIN situacoes_financeiras sf ON(sf.cd_situacao = m.situ' +
        'acao)'
      
        '  LEFT JOIN fin_facturas_itens ffi ON( ffi.cd_mensalidade = m.cd' +
        '_mensalidade )'
      '  LEFT JOIN fin_facturas ff ON( ffi.cd_factura = ff.cd_factura )'
      'WHERE'
      #9'M.CODIGOALUNO = :cd_aluno'
      #9'AND M.DT_COMPETENCIA BETWEEN :inicio AND :fim'
      'GROUP BY'
      #9'm.cd_mensalidade, m.cd_coligada'
      'ORDER BY'
      #9'cd_factura ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fim'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fim'
        ParamType = ptUnknown
      end>
    object qyTitulosdatavencimento: TDateTimeField
      FieldName = 'datavencimento'
      ReadOnly = True
    end
    object qyTitulosparcela: TSmallintField
      FieldName = 'parcela'
      ReadOnly = True
    end
    object qyTitulosds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      ReadOnly = True
      Size = 255
    end
    object qyTitulosds_situacao: TStringField
      FieldName = 'ds_situacao'
      ReadOnly = True
      Size = 15
    end
    object qyTituloscd_factura: TLargeintField
      FieldName = 'cd_factura'
      ReadOnly = True
      Required = True
    end
    object qyTituloscd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Required = True
    end
    object qyTitulosvalorbruto: TFloatField
      FieldName = 'valorbruto'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsTitulos: TDataSource
    DataSet = cdsTitulos
    Left = 40
    Top = 224
  end
  object cdsTitulos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'datavencimento'
        DataType = ftDateTime
      end
      item
        Name = 'parcela'
        DataType = ftInteger
      end
      item
        Name = 'ds_tipo_titulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ds_situacao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cd_factura'
        DataType = ftInteger
      end
      item
        Name = 'selecionado'
        DataType = ftInteger
      end
      item
        Name = 'checado'
        DataType = ftBoolean
      end
      item
        Name = 'cd_mensalidade'
        DataType = ftInteger
      end
      item
        Name = 'valorbruto'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 224
    Data = {
      E50000009619E0BD010000001800000009000000000003000000E5000E646174
      6176656E63696D656E746F08000800000000000770617263656C610400010000
      0000000E64735F7469706F5F746974756C6F0100490000000100055749445448
      0200020014000B64735F736974756163616F0100490000000100055749445448
      0200020014000A63645F6661637475726104000100000000000B73656C656369
      6F6E61646F0400010000000000076368656361646F02000300000000000E6364
      5F6D656E73616C696461646504000100000000000A76616C6F72627275746F08
      000400000000000000}
    object cdsTitulosdatavencimento: TDateTimeField
      FieldName = 'datavencimento'
    end
    object cdsTitulosparcela: TIntegerField
      FieldName = 'parcela'
    end
    object cdsTitulosds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
    end
    object cdsTitulosds_situacao: TStringField
      FieldName = 'ds_situacao'
    end
    object cdsTituloscd_factura: TIntegerField
      FieldName = 'cd_factura'
    end
    object cdsTitulosselecionado: TIntegerField
      FieldName = 'selecionado'
    end
    object cdsTituloschecado: TBooleanField
      FieldName = 'checado'
    end
    object cdsTituloscd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
    end
    object cdsTitulosvalorbruto: TFloatField
      FieldName = 'valorbruto'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object imgListaBotoes: TImageList
    Left = 512
    Top = 242
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B4B4B004B4B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000BF2A004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000BF2A004B4B4B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000DF000000BF2A004B4B4B00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000FF090000DF000000DF000000BF2A004B4B4B000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000FF2A0000DF000000FF090000DF000000DF000000BF2A004B4B
      4B0000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FF000000FF2A0000DF000000FF090000DF000000DF000000BF
      2A004B4B4B000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF2A0000DF000000FF090000DF000000DF
      0000007F00000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF090000FF2A0000DF000055FFAA00007F
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF090000FF090000FF2A00007F00000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF0900AAFF2A00007F0000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA0000FF0900AAFF2A00007F000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00AAFFAA00007F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00007F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F9FFFFFF00000000F0FFF83F00000000
      F07FE00F00000000F03FCFC700000000F01F87E300000000F00FA3F300000000
      F00731F900000000F00738F900000000F00F3C7900000000F01F3E3900000000
      F03F3F1900000000F07F9F8B00000000F0FF8FC300000000F1FFC7E700000000
      FBFFE00F00000000FFFFF83F0000000000000000000000000000000000000000
      000000000000}
  end
end
