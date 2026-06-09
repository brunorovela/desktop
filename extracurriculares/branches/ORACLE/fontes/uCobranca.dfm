object frm_Cobranca: Tfrm_Cobranca
  Left = 352
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cobran'#231'a'
  ClientHeight = 319
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 64
    Width = 433
    Height = 5
    Style = bsRaised
  end
  object sbFechar: TSpeedButton
    Left = 352
    Top = 291
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
  object Label1: TLabel
    Left = 7
    Top = 11
    Width = 72
    Height = 14
    Alignment = taRightJustify
    Caption = 'Ano/Semestre:'
  end
  object Label2: TLabel
    Left = 40
    Top = 39
    Width = 39
    Height = 14
    Caption = 'Pessoa:'
  end
  object sbProcuraPessoa: TSpeedButton
    Left = 259
    Top = 36
    Width = 23
    Height = 22
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
    OnClick = sbProcuraPessoaClick
  end
  object grd: TDBGrid
    Left = 8
    Top = 110
    Width = 433
    Height = 179
    DataSource = srcMatriculas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pmQtd
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DS_MES'
        Title.Caption = 'M'#234's'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_TOTAL'
        Title.Caption = 'Total'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PENDENTE'
        Title.Caption = 'Pendente'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PAGO'
        Title.Caption = 'Pago'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DESCONTOS'
        Title.Caption = 'Descontos'
        Width = 78
        Visible = True
      end>
  end
  object txtAnoSemestre: TMaskEdit
    Left = 85
    Top = 8
    Width = 60
    Height = 22
    TabStop = False
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 145
    Top = 8
    Width = 16
    Height = 22
    Min = -100
    TabOrder = 2
    OnClick = UpDown2Click
  end
  object edCodPessoa: TEdit
    Left = 85
    Top = 36
    Width = 172
    Height = 22
    TabOrder = 3
    OnKeyPress = edCodPessoaKeyPress
  end
  object pnlNome: TPanel
    Left = 8
    Top = 75
    Width = 433
    Height = 29
    BevelOuter = bvLowered
    TabOrder = 4
    object DBText1: TDBText
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 425
      Height = 21
      Align = alClient
      DataField = 'NM_PESSOA'
      DataSource = srcMatriculas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitWidth = 60
      ExplicitHeight = 16
    end
  end
  object srcMatriculas: TDataSource
    DataSet = qyMatriculas
    Left = 96
    Top = 208
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
  object qyMatriculas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyMatriculasCalcFields
    UpdateObject = updMatriculas
    SQL.Strings = (
      'SELECT'
      '   NR_ANOSEMESTRE,'
      '   CD_PESSOA,'
      '   NR_MES,'
      '   VL_TOTAL,'
      '   VL_DESCONTOS,'
      '   VL_PAGO,'
      '   DT_PAGAMENTO'
      'FROM'
      '   EXTRA_MATRICULAS'
      'WHERE'
      '   NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   CD_PESSOA = :CD_PESSOA AND'
      '   COALESCE(VL_PAGO, 0) < VL_TOTAL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyMatriculasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qyMatriculasNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qyMatriculasVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qyMatriculasVL_DESCONTOS: TFloatField
      FieldName = 'VL_DESCONTOS'
    end
    object qyMatriculasVL_PAGO: TFloatField
      FieldName = 'VL_PAGO'
      OnGetText = qyMatriculasVL_PAGOGetText
    end
    object qyMatriculasDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
    object qyMatriculasnm_pessoa: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_PESSOA'
      LookupDataSet = DM.qyPessoas
      LookupKeyFields = 'cd_pessoa'
      LookupResultField = 'nm_pessoa'
      KeyFields = 'cd_pessoa'
      Lookup = True
    end
    object qyMatriculasDS_MES: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_MES'
      Size = 15
      Calculated = True
    end
    object qyMatriculasNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qyMatriculasVL_PENDENTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PENDENTE'
      Calculated = True
    end
  end
  object updMatriculas: TZUpdateSQL
    ModifySQL.Strings = (
      'UPDATE EXTRA_MATRICULAS'
      'SET'
      '   VL_PAGO = :VL_PAGO,'
      '   DT_PAGAMENTO = :DT_PAGAMENTO'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA AND'
      '   NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   NR_MES = :NR_MES')
    UseSequenceFieldForRefreshSQL = False
    Left = 152
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VL_PAGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_PAGAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
  end
end
