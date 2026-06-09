object frmConvenioEmpresaLog: TfrmConvenioEmpresaLog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Modifica'#231#245'es de Convenios - Log'
  ClientHeight = 322
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar2: TToolBar
    Left = 0
    Top = 297
    Width = 450
    Height = 25
    Align = alBottom
    ButtonWidth = 81
    Caption = 'tbBotoesAcao'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmCadConvenioPgto.imgBotoes
    List = True
    ShowCaptions = True
    TabOrder = 0
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tpSeparador1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton14: TToolButton
      Left = 93
      Top = 0
      Width = 8
      Caption = 'tpSeparador2'
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object dbConvenioLog: TDBGrid
    Left = 0
    Top = 25
    Width = 450
    Height = 87
    Align = alClient
    DataSource = dsConvenioEmpresaLog
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dt_log'
        Title.Caption = 'Data'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Title.Caption = 'Usu'#225'rio'
        Width = 304
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 112
    Width = 450
    Height = 185
    Align = alBottom
    DataField = 'ds_observacoes'
    DataSource = dsConvenioEmpresaLog
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 25
    Align = alTop
    Caption = 'CONV'#202'NIOS DE PAGAMENTOS - LOG'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object qyConvenioEmpresaLog: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '  lg.dt_log,'
      '  p.nm_pessoa,'
      '  lg.cd_chave,'
      '  lg.ds_observacoes'
      'FROM '
      '  log_geral lg'
      '  INNER JOIN pessoas p ON ( p.cd_pessoa = lg.cd_usuario )'
      'WHERE'
      '  lg.cd_modulo = :cd_modulo'
      '  AND lg.cd_coligada = :cd_coligada'
      '  AND lg.cd_chave = :cd_chave'
      'ORDER BY'
      '  lg.dt_log DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_modulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_chave'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_modulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_chave'
        ParamType = ptUnknown
      end>
  end
  object dsConvenioEmpresaLog: TDataSource
    DataSet = qyConvenioEmpresaLog
    Left = 320
    Top = 184
  end
end
