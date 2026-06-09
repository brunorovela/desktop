inherited frmReportWizardStepFile: TfrmReportWizardStepFile
  Width = 606
  Height = 483
  object bvlSep1: TBevel
    Left = 0
    Top = 109
    Width = 606
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 128
    ExplicitTop = 248
    ExplicitWidth = 50
  end
  object pnlNew: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 109
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 451
    object lblFilePath: TLabel
      Left = 21
      Top = 26
      Width = 194
      Height = 13
      Caption = 'Selecione um arquivo do Crystal Reports'
      Enabled = False
      FocusControl = edtFilePath
    end
    object sbFileSelect: TSpeedButton
      Left = 408
      Top = 42
      Width = 23
      Height = 21
      Enabled = False
      Flat = True
      Glyph.Data = {
        E6050000424DE605000000000000360400002800000018000000120000000100
        080000000000B0010000C30E0000C30E00000001000000000000000000007B00
        0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
        BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090900000000000000000000000909090909090909090909090900
        0003030303030303030300090909090909090909090909000500030303030303
        0303030009090909090909090909090005050003030303030303030300090909
        0909090909090900050505000303030303030303030009090909090909090900
        0505050500000000000000000000090909090909090909000505050505050505
        0500090909090909090909090909090005050505050505050500090909090909
        0909090909090900050505000000000000000909090909090909090909090909
        0000000909090909090909020202090909090909090909090909090909090909
        0909090902020909090909090909090909090909090909020909090209020909
        0909090909090909090909090909090902020209090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        09090909090909090909}
      OnClick = sbFileSelectClick
    end
    object sbFileClear: TSpeedButton
      Left = 431
      Top = 42
      Width = 23
      Height = 21
      Enabled = False
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
      OnClick = sbFileClearClick
    end
    object lblFileKey: TLabel
      Left = 21
      Top = 69
      Width = 85
      Height = 13
      Caption = 'Chave do arquivo'
      Enabled = False
      FocusControl = edtFileKey
    end
    object lblDuplicateKey: TLabel
      Left = 408
      Top = 88
      Width = 79
      Height = 13
      Caption = 'Chave duplicada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblDuplicateFile: TLabel
      Left = 457
      Top = 45
      Width = 85
      Height = 13
      Caption = 'Arquivo duplicado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edtFilePath: TEdit
      Left = 21
      Top = 42
      Width = 384
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      OnChange = edtFilePathChange
    end
    object rbNew: TRadioButton
      Left = 3
      Top = 3
      Width = 160
      Height = 17
      Caption = 'Adicionar novo arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = rbNewClick
    end
    object edtFileKey: TEdit
      Left = 21
      Top = 85
      Width = 384
      Height = 21
      Enabled = False
      MaxLength = 64
      TabOrder = 2
      OnChange = edtFileKeyChange
    end
  end
  object pnlFiles: TPanel
    Left = 0
    Top = 112
    Width = 606
    Height = 371
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 451
    ExplicitHeight = 192
    object pnlSearchOptions: TPanel
      Left = 0
      Top = 0
      Width = 606
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 451
      object lblFileSearch: TLabel
        Left = 21
        Top = 26
        Width = 46
        Height = 13
        Caption = 'Pesquisar'
        Enabled = False
      end
      object sbDownloadFile: TSpeedButton
        Left = 520
        Top = 16
        Width = 23
        Height = 18
        Enabled = False
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888880000000000000880330000008803088033000000880308803300000088
          0308803300000000030880333333333333088033000000003308803088888888
          0308803088888888030880308888888803088030888888880308803088888888
          0008803088888888080880000000000000088888888888888888}
        Spacing = 0
        Transparent = False
        Visible = False
        OnClick = sbDownloadFileClick
      end
      object rbChooseFile: TRadioButton
        Left = 3
        Top = 3
        Width = 160
        Height = 17
        Caption = 'Usar arquivo existente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rbChooseFileClick
      end
      object edtFileSearch: TEdit
        Left = 21
        Top = 42
        Width = 384
        Height = 21
        Enabled = False
        TabOrder = 1
        OnChange = edtFileSearchChange
      end
    end
    object pnlRecords: TPanel
      Left = 0
      Top = 66
      Width = 606
      Height = 305
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 21
      TabOrder = 1
      ExplicitWidth = 451
      ExplicitHeight = 126
      object dbgFiles: TSortedDBGrid
        Left = 21
        Top = 0
        Width = 585
        Height = 305
        Align = alClient
        DataSource = dsFiles
        Enabled = False
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgFilesCellClick
        OnDrawColumnCell = dbgFilesDrawColumnCell
        SortedFields.Strings = (
          'NM_ARQUIVO')
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_ARQUIVO'
            Title.Caption = 'Arquivo'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_CHAVE'
            Title.Caption = 'Chave'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_MD5'
            Title.Caption = 'MD5'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Selected'
            Title.Alignment = taCenter
            Title.Caption = 'S'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            Width = 23
            Visible = True
          end>
      end
    end
  end
  object odlgReportFile: TOpenDialog
    Filter = 'Relat'#243'rio do Crystal Reports|*.rpt'
    Title = 'Selecione um relat'#243'rio do Crystal Reports'
    Left = 472
    Top = 280
  end
  object qryFiles: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'NM_ARQUIVO'
    SQL.Strings = (
      'SELECT'
      '  CD_ARQUIVO,'
      '  NM_ARQUIVO,'
      '  DS_CHAVE,'
      '  DS_MD5,'
      '  ME_ARQUIVO'
      'FROM'
      '  UNI_RELATORIO_ARQUIVO')
    Params = <>
    IndexFieldNames = 'NM_ARQUIVO Asc'
    Left = 472
    Top = 152
    object qryFilesCD_ARQUIVO: TLargeintField
      FieldName = 'CD_ARQUIVO'
      Required = True
    end
    object qryFilesNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      Size = 255
    end
    object qryFilesDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 64
    end
    object qryFilesDS_MD5: TStringField
      FieldName = 'DS_MD5'
      Required = True
      Size = 32
    end
    object qryFilesME_ARQUIVO: TBlobField
      FieldName = 'ME_ARQUIVO'
      Required = True
    end
  end
  object dsFiles: TDataSource
    AutoEdit = False
    DataSet = cdsFiles
    OnDataChange = dsFilesDataChange
    Left = 472
    Top = 248
  end
  object cdsFiles: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspFiles'
    Left = 472
    Top = 216
    object cdsFilesCD_ARQUIVO: TLargeintField
      FieldName = 'CD_ARQUIVO'
      Required = True
    end
    object cdsFilesNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      Required = True
      Size = 255
    end
    object cdsFilesDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 64
    end
    object cdsFilesDS_MD5: TStringField
      FieldName = 'DS_MD5'
      Required = True
      Size = 32
    end
    object cdsFilesME_ARQUIVO: TBlobField
      FieldName = 'ME_ARQUIVO'
      Required = True
    end
    object cdsFilesSelected: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'Selected'
    end
  end
  object dspFiles: TDataSetProvider
    DataSet = qryFiles
    Left = 472
    Top = 184
  end
  object sdlgReportFile: TSaveDialog
    Filter = 'Relat'#243'rio do Crystal Reports|*.rpt'
    Left = 472
    Top = 312
  end
end
