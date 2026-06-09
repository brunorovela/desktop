object FrmMultaEmprestimo: TFrmMultaEmprestimo
  Left = 224
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Multa de Empr'#233'stimo'
  ClientHeight = 308
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 29
    Align = alTop
    Caption = 'Multa de Empr'#233'stimo da Biblioteca'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 540
    Height = 92
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object sbBaixar: TSpeedButton
      Left = 4
      Top = 59
      Width = 110
      Height = 24
      Caption = 'Baixar'
      Flat = True
      OnClick = sbBaixarClick
    end
    object sbIsentar: TSpeedButton
      Left = 114
      Top = 59
      Width = 110
      Height = 24
      Caption = 'Isentar'
      Flat = True
      OnClick = sbIsentarClick
    end
    object SpeedButton3: TSpeedButton
      Left = 312
      Top = 59
      Width = 89
      Height = 24
      Caption = 'Fechar'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object Label4: TLabel
      Left = 5
      Top = 40
      Width = 379
      Height = 13
      Caption = 
        'Selecione as multas desejadas utilizando a tecla Ctrl e clique n' +
        'a op'#231#227'o desejada'
    end
    object sbMotivo: TSpeedButton
      Left = 224
      Top = 59
      Width = 88
      Height = 24
      Caption = 'Motivo'
      Flat = True
      OnClick = sbMotivoClick
    end
    object Panel3: TPanel
      Left = 400
      Top = 40
      Width = 132
      Height = 44
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 13
        Top = 7
        Width = 76
        Height = 13
        Caption = 'Total Pendente:'
      end
      object lbMultaPendente: TLabel
        Left = 15
        Top = 20
        Width = 117
        Height = 16
        Caption = 'lbMultaPendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rgFiltro: TRadioGroup
      Left = 6
      Top = 3
      Width = 526
      Height = 33
      Caption = ' Filtro: '
      Columns = 5
      ItemIndex = 1
      Items.Strings = (
        'Todas'
        'Pendentes'
        'Parciais'
        'Pagas'
        'Isentadas')
      TabOrder = 1
      OnClick = rgFiltroClick
    end
  end
  object dgMultas: TDBGrid
    Left = 0
    Top = 62
    Width = 540
    Height = 154
    Align = alClient
    DataSource = dsMultas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dgMultasDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'dt_multa'
        Title.Caption = 'Data Multa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_multa'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_pago'
        Title.Caption = 'Valor Pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_pagamento'
        Title.Caption = 'Data Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_situacao'
        Title.Caption = 'Situa'#231#227'o'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 29
    Width = 540
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 63
      Height = 13
      Caption = 'C'#243'd. Pessoa:'
    end
    object lbCodPessoa: TLabel
      Left = 80
      Top = 8
      Width = 74
      Height = 13
      Caption = 'lbCodPessoa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 176
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lbNome: TLabel
      Left = 216
      Top = 8
      Width = 43
      Height = 13
      Caption = 'lbNome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dsMultas: TDataSource
    DataSet = tblMultas
    Left = 88
    Top = 112
  end
  object tblMultas: TUMZQuery
    Connection = DM.db
    AfterOpen = tblMultasAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM bibliotecamultas'
      'WHERE cd_pessoa = :CODIGOPESSOA'
      'AND cd_situacao = 2;')
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGOPESSOA'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGOPESSOA'
        ParamType = ptUnknown
      end>
    object tblMultascd_multa: TIntegerField
      FieldName = 'cd_multa'
      Origin = 'DBACADEMICO.bibliotecamultas.cd_multa'
    end
    object tblMultascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'DBACADEMICO.bibliotecamultas.cd_pessoa'
    end
    object tblMultasdt_multa: TDateTimeField
      FieldName = 'dt_multa'
      Origin = 'DBACADEMICO.bibliotecamultas.dt_multa'
    end
    object tblMultasvl_multa: TFloatField
      FieldName = 'vl_multa'
      Origin = 'DBACADEMICO.bibliotecamultas.vl_multa'
    end
    object tblMultasvl_pago: TFloatField
      FieldName = 'vl_pago'
      Origin = 'DBACADEMICO.bibliotecamultas.vl_pago'
    end
    object tblMultasdt_pagamento: TDateTimeField
      FieldName = 'dt_pagamento'
      Origin = 'DBACADEMICO.bibliotecamultas.dt_pagamento'
    end
    object tblMultascd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'DBACADEMICO.bibliotecamultas.cd_situacao'
    end
    object tblMultasds_situacao: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_situacao'
      LookupDataSet = DM.tblSituacoesFinanceiras
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_sigla_situacao'
      KeyFields = 'cd_situacao'
      Size = 10
      Lookup = True
    end
    object tblMultasnr_nossonumero: TStringField
      FieldName = 'nr_nossonumero'
      Origin = 'DBACADEMICO.bibliotecamultas.nr_nossonumero'
      Size = 30
    end
  end
  object qyMultas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   bibliotecamultas'
      'WHERE'
      '   (cd_pessoa = :cd_pessoa) AND ('
      '   (dt_multa = :dt_multa AND cd_situacao = 2) OR'
      '   (cd_situacao = 2))'
      'ORDER BY'
      '   dt_multa DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_multa'
        ParamType = ptUnknown
      end>
    Left = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_multa'
        ParamType = ptUnknown
      end>
    object qyMultascd_multa: TIntegerField
      FieldName = 'cd_multa'
      Origin = 'DBACADEMICO.bibliotecamultas.cd_multa'
    end
    object qyMultascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'DBACADEMICO.bibliotecamultas.cd_pessoa'
    end
    object qyMultasdt_multa: TDateTimeField
      FieldName = 'dt_multa'
      Origin = 'DBACADEMICO.bibliotecamultas.dt_multa'
    end
    object qyMultasvl_multa: TFloatField
      FieldName = 'vl_multa'
      Origin = 'DBACADEMICO.bibliotecamultas.vl_multa'
    end
    object qyMultasvl_pago: TFloatField
      FieldName = 'vl_pago'
      Origin = 'DBACADEMICO.bibliotecamultas.vl_pago'
    end
    object qyMultasdt_pagamento: TDateTimeField
      FieldName = 'dt_pagamento'
      Origin = 'DBACADEMICO.bibliotecamultas.dt_pagamento'
    end
    object qyMultascd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'DBACADEMICO.bibliotecamultas.cd_situacao'
    end
  end
end
