object frm_SelCaixa: Tfrm_SelCaixa
  Left = 314
  Top = 221
  Caption = 'Selecionar Caixa...'
  ClientHeight = 326
  ClientWidth = 422
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
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 40
    Width = 406
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 15
    Top = 14
    Width = 52
    Height = 14
    Caption = 'Descri'#231#227'o:'
  end
  object btnFechar: TSpeedButton
    Left = 328
    Top = 296
    Width = 89
    Height = 25
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
    OnClick = btnFecharClick
  end
  object sbSelecionar: TSpeedButton
    Left = 235
    Top = 295
    Width = 87
    Height = 25
    Caption = 'Selecionar'
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
    OnClick = sbSelecionarClick
  end
  object grd: TDBGrid
    Left = 10
    Top = 56
    Width = 407
    Height = 233
    BorderStyle = bsNone
    DataSource = srcCaixa
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'cd_coligada'
        Title.Caption = 'UE'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_caixa'
        Title.Caption = 'C'#243'd. Caixa'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_caixa'
        Title.Caption = 'Descri'#231#227'o'
        Width = 274
        Visible = True
      end>
  end
  object edDescricao: TEdit
    Left = 75
    Top = 10
    Width = 342
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = edDescricaoKeyPress
  end
  object qyCaixa: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyCaixaCalcFields
    Filtered = True
    SQL.Strings = (
      'SELECT                        '
      '  cd_caixa,'
      '  cd_coligada,'
      '  ds_caixa,                 '
      '  sn_ativa'
      'FROM'
      '  fin_cadastro_contas'
      'ORDER BY'
      #9'ds_caixa')
    Params = <>
    Left = 48
    Top = 296
    object qyCaixaativa: TStringField
      FieldKind = fkCalculated
      FieldName = 'ativa'
      Size = 1
      Calculated = True
    end
    object qyCaixacd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Origin = 'WMESTRE12.cadastro_contas.cd_caixa'
    end
    object qyCaixads_caixa: TStringField
      FieldName = 'ds_caixa'
      Origin = 'WMESTRE12.cadastro_contas.ds_caixa'
      Size = 255
    end
    object qyCaixasn_ativa: TStringField
      FieldName = 'sn_ativa'
      Origin = 'WMESTRE12.cadastro_contas.sn_ativa'
      FixedChar = True
      Size = 1
    end
    object qyCaixacd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_cadastro_contas.cd_coligada'
    end
  end
  object srcCaixa: TDataSource
    DataSet = qyCaixa
    Left = 16
    Top = 296
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end
