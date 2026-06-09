object frmAprovacaoPrestacaoContas: TfrmAprovacaoPrestacaoContas
  Left = 0
  Top = 0
  Caption = 'Aprova'#231#227'o de Presta'#231#227'o de Contas'
  ClientHeight = 561
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 25
    Width = 728
    Height = 177
    Align = alTop
    TabOrder = 0
    object lbPeriodo: TLabel
      Left = 53
      Top = 34
      Width = 90
      Height = 13
      Caption = 'Informe o Per'#237'odo:'
    end
    object lbDiaBloqueioProvisorio: TLabel
      Left = 16
      Top = 60
      Width = 127
      Height = 13
      Caption = 'Dia de Bloqueio Provis'#243'rio:'
    end
    object lbSituacao: TLabel
      Left = 70
      Top = 87
      Width = 73
      Height = 13
      Caption = 'Situa'#231#227'o Atual:'
    end
    object lbInfoSituacao: TLabel
      Left = 149
      Top = 87
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbColigada: TLabel
      Left = 51
      Top = 8
      Width = 92
      Height = 13
      Caption = 'Unidade de Ensino:'
    end
    object txtPeriodo: TMaskEdit
      Left = 149
      Top = 33
      Width = 65
      Height = 21
      EditMask = '!99/9999;1; '
      MaxLength = 7
      TabOrder = 1
      Text = '  /    '
      OnExit = txtPeriodoExit
      OnKeyPress = txtPeriodoKeyPress
    end
    object pnBotoes: TPanel
      Left = 1
      Top = 112
      Width = 726
      Height = 64
      Align = alBottom
      TabOrder = 2
      object btnAprovar: TSpeedButton
        Left = 13
        Top = 10
        Width = 200
        Height = 43
        Cursor = crHandPoint
        Caption = 'F2 Aprovar Contas do Per'#237'odo'
        Enabled = False
        Flat = True
        OnClick = btnAprovarClick
      end
      object btnReabrir: TSpeedButton
        Left = 231
        Top = 10
        Width = 200
        Height = 43
        Cursor = crHandPoint
        Caption = 'F3 Reabrir Per'#237'odo'
        Enabled = False
        Flat = True
        OnClick = btnReabrirClick
      end
      object btnFechar: TSpeedButton
        Left = 447
        Top = 10
        Width = 200
        Height = 43
        Cursor = crHandPoint
        Caption = 'F12 Fechar'
        Flat = True
        OnClick = btnFecharClick
      end
    end
    object cbUnidadesMatriz: TComboBox
      Left = 149
      Top = 6
      Width = 350
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbUnidadesMatrizChange
    end
    object txtDia: TEdit
      Left = 149
      Top = 60
      Width = 36
      Height = 21
      MaxLength = 2
      TabOrder = 3
      OnExit = txtDiaExit
      OnKeyPress = txtDiaKeyPress
    end
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 25
    Align = alTop
    Caption = 'APROVA'#199#195'O DE PRESTA'#199#195'O DE CONTAS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnHistorico: TPanel
    Left = 0
    Top = 202
    Width = 728
    Height = 25
    Align = alTop
    Caption = 'HIST'#211'RICO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object dbListaPrestacaoContas: TDBGrid
    Left = 0
    Top = 227
    Width = 728
    Height = 334
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsPrestacaoContasHistorico
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dt_registro'
        Title.Caption = 'Data'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Title.Caption = 'Nome'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_acao'
        Title.Caption = 'A'#231#227'o'
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_nome_grupo'
        Title.Caption = 'Grupo'
        Width = 193
        Visible = True
      end>
  end
  object dsPrestacaoContasHistorico: TDataSource
    DataSet = zPrestacaoContasHistorico
    Left = 536
    Top = 336
  end
  object dsGrupos: TDataSource
    DataSet = zGrupos
    Left = 504
    Top = 336
  end
  object dsPrestacaoContas: TDataSource
    DataSet = zPrestacaoContas
    OnDataChange = dsPrestacaoContasDataChange
    Left = 344
    Top = 96
  end
  object zPrestacaoContas: TUMZQuery
    Connection = DM.db
    BeforeEdit = zPrestacaoContasBeforeEdit
    AfterPost = zPrestacaoContasAfterPost
    SQL.Strings = (
      'SELECT * FROM fin_prestacao_contas'
      'WHERE cd_prestacao_contas = :cd_prestacao_contas')
    Params = <
      item
        DataType = ftString
        Name = 'cd_prestacao_contas'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 312
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_prestacao_contas'
        ParamType = ptUnknown
        Value = '0'
      end>
    object zPrestacaoContascd_prestacao_contas: TIntegerField
      FieldName = 'cd_prestacao_contas'
      Required = True
    end
    object zPrestacaoContascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object zPrestacaoContasdt_periodo: TDateField
      FieldName = 'dt_periodo'
    end
    object zPrestacaoContascd_grupo_prestacao_conta: TIntegerField
      FieldName = 'cd_grupo_prestacao_conta'
    end
    object zPrestacaoContassn_aberto: TSmallintField
      FieldName = 'sn_aberto'
    end
    object zPrestacaoContasdt_bloqueio_provisorio: TDateTimeField
      FieldName = 'dt_bloqueio_provisorio'
    end
    object zPrestacaoContasds_acao: TStringField
      FieldName = 'ds_acao'
      Size = 255
    end
    object zPrestacaoContasdt_registro: TDateTimeField
      FieldName = 'dt_registro'
    end
    object zPrestacaoContascd_coligada: TIntegerField
      FieldName = 'cd_coligada'
    end
  end
  object zGrupos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM nu_grupos '
      'ORDER BY ds_nome_grupo')
    Params = <>
    Left = 504
    Top = 304
  end
  object zPrestacaoContasHistorico: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   fpc.cd_prestacao_contas, '
      '   fpc.dt_registro,'
      '   p.nm_pessoa,'
      '   fpc.ds_acao,'
      '   ng.ds_nome_grupo,'
      '   fpc.sn_aberto,'
      '   fpc.dt_bloqueio_provisorio'
      'FROM '
      '   fin_prestacao_contas fpc'
      
        '   LEFT JOIN nu_grupos ng ON(ng.cd_grupo = fpc.cd_grupo_prestaca' +
        'o_conta)'
      '   LEFT JOIN pessoas p ON(p.cd_pessoa = fpc.cd_pessoa)'
      'WHERE '
      '   DATE_FORMAT(fpc.dt_periodo, '#39'%m/%Y'#39') = :mes_ano'
      '   AND cd_coligada = :cd_coligada'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'mes_ano'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cd_coligada'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 536
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'mes_ano'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'cd_coligada'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
end
