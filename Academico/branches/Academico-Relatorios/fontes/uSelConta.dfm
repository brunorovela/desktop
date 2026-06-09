object frm_SelConta: Tfrm_SelConta
  Left = 352
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Selecionar Plano de Contas...'
  ClientHeight = 377
  ClientWidth = 659
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 70
    Width = 641
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 7
    Top = 14
    Width = 68
    Height = 14
    Caption = 'Classifica'#231#227'o:'
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 52
    Height = 14
    Caption = 'Descri'#231#227'o:'
  end
  object btnFechar: TSpeedButton
    Left = 560
    Top = 343
    Width = 89
    Height = 26
    Caption = 'F12 Fechar'
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
    OnClick = SpeedButton1Click
  end
  object lblCdContabilidade: TLabel
    Left = 366
    Top = 13
    Width = 92
    Height = 14
    Caption = 'C'#243'd. Contabilidade:'
  end
  object grd: TDBGrid
    Left = 10
    Top = 88
    Width = 639
    Height = 241
    DataSource = srcPlanosContas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = pmQtd
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    OnKeyPress = grdKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_CONTA'
        Title.Caption = 'Conta'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_CLASSIFICACAO'
        Title.Caption = 'Classifica'#231#227'o'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_CONTA'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end>
  end
  object edClassificacao: TEdit
    Left = 96
    Top = 10
    Width = 264
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = edClassificacaoKeyPress
  end
  object edDescricao: TEdit
    Left = 96
    Top = 38
    Width = 553
    Height = 22
    TabOrder = 2
    OnKeyPress = edDescricaoKeyPress
  end
  object btnConfirmar: TBitBtn
    Left = 447
    Top = 343
    Width = 107
    Height = 26
    Caption = 'Selecionar'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnConfirmarClick
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object txtCd_contabilidade: TEdit
    Left = 464
    Top = 8
    Width = 185
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnKeyPress = edClassificacaoKeyPress
  end
  object qyPlanosContas: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   CD_CONTA,'
      '   CD_COLIGADA_MATRIZ,'
      '   DS_CONTA,'
      '   CD_CLASSIFICACAO,'
      '   CD_APROPRIACAO,'
      '   TP_CONTA,'
      '   TP_ENTRADA_SAIDA,'
      '   SN_ATIVO,'
      '   CD_CONTA_CONTABIL,'
      '   CD_CLASS1,'
      '   CD_CLASS2,'
      '   CD_CLASS3,'
      '   CD_CLASS4,'
      '   CD_CLASS5,'
      '   CD_CLASS6,'
      '   CD_CLASS7,'
      '   CD_CLASS8,'
      '   CD_CLASS9,'
      '   CD_GRUPO_PRINCIPAL,'
      '   CD_CRITERIO,'
      '   SN_CUSTEIO,'
      '   DS_FORMULA_CALCULO,'
      '   CD_GRUPO_CUSTEIO,'
      '   DS_OBSERVACAO'
      'FROM'
      '   FIN_CONFIG_PLANO_CONTAS'
      'WHERE'
      '   CD_COLIGADA_MATRIZ = :CD_COLIGADA'
      'ORDER BY'
      '   DS_CONTA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyPlanosContasCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object qyPlanosContasDS_CONTA: TStringField
      FieldName = 'DS_CONTA'
      Size = 255
    end
    object qyPlanosContasCD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
    end
    object qyPlanosContasCD_APROPRIACAO: TIntegerField
      FieldName = 'CD_APROPRIACAO'
    end
    object qyPlanosContasTP_CONTA: TIntegerField
      FieldName = 'TP_CONTA'
    end
    object qyPlanosContasTP_ENTRADA_SAIDA: TIntegerField
      FieldName = 'TP_ENTRADA_SAIDA'
    end
    object qyPlanosContasSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object qyPlanosContasCD_CONTA_CONTABIL: TStringField
      FieldName = 'CD_CONTA_CONTABIL'
    end
    object qyPlanosContasCD_CLASS1: TIntegerField
      FieldName = 'CD_CLASS1'
    end
    object qyPlanosContasCD_CLASS2: TIntegerField
      FieldName = 'CD_CLASS2'
    end
    object qyPlanosContasCD_CLASS3: TIntegerField
      FieldName = 'CD_CLASS3'
    end
    object qyPlanosContasCD_CLASS4: TIntegerField
      FieldName = 'CD_CLASS4'
    end
    object qyPlanosContasCD_CLASS5: TIntegerField
      FieldName = 'CD_CLASS5'
    end
    object qyPlanosContasCD_CLASS6: TIntegerField
      FieldName = 'CD_CLASS6'
    end
    object qyPlanosContasCD_CLASS7: TIntegerField
      FieldName = 'CD_CLASS7'
    end
    object qyPlanosContasCD_CLASS8: TIntegerField
      FieldName = 'CD_CLASS8'
    end
    object qyPlanosContasCD_CLASS9: TIntegerField
      FieldName = 'CD_CLASS9'
    end
    object qyPlanosContasCD_GRUPO_PRINCIPAL: TIntegerField
      FieldName = 'CD_GRUPO_PRINCIPAL'
    end
    object qyPlanosContasCD_CRITERIO: TLargeintField
      FieldName = 'CD_CRITERIO'
    end
    object qyPlanosContasSN_CUSTEIO: TSmallintField
      FieldName = 'SN_CUSTEIO'
    end
    object qyPlanosContasDS_FORMULA_CALCULO: TStringField
      FieldName = 'DS_FORMULA_CALCULO'
      Size = 200
    end
    object qyPlanosContasCD_GRUPO_CUSTEIO: TLargeintField
      FieldName = 'CD_GRUPO_CUSTEIO'
    end
    object qyPlanosContasDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object qyPlanosContasCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
      Required = True
    end
  end
  object srcPlanosContas: TDataSource
    DataSet = qyPlanosContas
    Left = 16
    Top = 336
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
