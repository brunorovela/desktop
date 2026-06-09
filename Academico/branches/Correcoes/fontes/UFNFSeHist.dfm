object fNFSeHist: TfNFSeHist
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Hist'#243'rico de Consulta no Web Service'
  ClientHeight = 472
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
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 115
    Width = 694
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 336
    ExplicitTop = 224
    ExplicitWidth = 50
  end
  object splSep1: TSplitter
    Left = 225
    Top = 118
    Height = 354
    ExplicitLeft = 456
    ExplicitTop = 256
    ExplicitHeight = 100
  end
  object pnlServicos: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 115
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object rgServicos: TRadioGroup
      Left = 4
      Top = 10
      Width = 681
      Height = 97
      Caption = 'Servi'#231'o Consultado'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Recep'#231#227'o de Lote de RPS'
        'Consulta de Situa'#231#227'o de Lote de RPS'
        'Consulta de NFS-e por RPS'
        'Consulta de NFS-e'
        'Consulta de Lote de RPS'
        'Cancelamento NFS-e')
      TabOrder = 0
      OnClick = rgServicosClick
    end
  end
  object pnlRetornos: TPanel
    Left = 0
    Top = 118
    Width = 225
    Height = 354
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object dbgMensagem: TDBGrid
      Left = 0
      Top = 0
      Width = 225
      Height = 354
      Align = alClient
      DataSource = dsMensagem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DT_CONSULTA'
          Title.Caption = 'Data'
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 61
          Visible = True
        end>
    end
  end
  object pnlMensagens: TPanel
    Left = 228
    Top = 118
    Width = 466
    Height = 354
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lblMensagem: TLabel
      Left = 6
      Top = 6
      Width = 55
      Height = 13
      Caption = 'Mensagem:'
    end
    object lblCorrecao: TLabel
      Left = 6
      Top = 175
      Width = 48
      Height = 13
      Caption = 'Corre'#231#227'o:'
    end
    object dbmMensagem: TDBMemo
      Left = 6
      Top = 21
      Width = 451
      Height = 148
      DataField = 'DS_MENSAGEM'
      DataSource = dsMensagem
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object dbmCorrecao: TDBMemo
      Left = 6
      Top = 194
      Width = 451
      Height = 148
      DataField = 'DS_CORRECAO'
      DataSource = dsMensagem
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object dsMensagem: TDataSource
    AutoEdit = False
    DataSet = qryMensagem
    Left = 32
    Top = 392
  end
  object qryMensagem: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DT_CONSULTA'
    SortType = stDescending
    Filter = 'CD_SERVICO = 1'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   CD_RETORNO,'
      '   CD_LOTE,'
      '   CD_SERVICO,'
      '   DT_CONSULTA,'
      '   DS_CODIGO,'
      '   DS_MENSAGEM,'
      '   DS_CORRECAO'
      'FROM'
      '   FIN_NFSE_WS_RETORNO')
    Params = <>
    IndexFieldNames = 'DT_CONSULTA Desc'
    Left = 64
    Top = 392
    object qryMensagemCD_RETORNO: TLargeintField
      FieldName = 'CD_RETORNO'
      Required = True
    end
    object qryMensagemCD_LOTE: TLargeintField
      FieldName = 'CD_LOTE'
      Required = True
    end
    object qryMensagemCD_SERVICO: TSmallintField
      FieldName = 'CD_SERVICO'
      Required = True
    end
    object qryMensagemDT_CONSULTA: TDateTimeField
      FieldName = 'DT_CONSULTA'
      Required = True
    end
    object qryMensagemDS_CODIGO: TStringField
      FieldName = 'DS_CODIGO'
      Required = True
      Size = 4
    end
    object qryMensagemDS_MENSAGEM: TMemoField
      FieldName = 'DS_MENSAGEM'
      Required = True
      BlobType = ftMemo
    end
    object qryMensagemDS_CORRECAO: TMemoField
      FieldName = 'DS_CORRECAO'
      Required = True
      BlobType = ftMemo
    end
  end
end
