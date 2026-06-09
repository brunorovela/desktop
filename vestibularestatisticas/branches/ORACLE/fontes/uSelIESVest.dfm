object frm_Sel_IES_Vest: Tfrm_Sel_IES_Vest
  Left = 352
  Top = 185
  Caption = 'Selecionar Institui'#231#227'o de Ensino Superior...'
  ClientHeight = 320
  ClientWidth = 573
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
  object btnFechar: TSpeedButton
    Left = 480
    Top = 296
    Width = 89
    Height = 25
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
    OnClick = btnFecharClick
  end
  object btnSelecionar: TSpeedButton
    Left = 384
    Top = 296
    Width = 87
    Height = 25
    Caption = 'Selecionar'
    Flat = True
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
    OnClick = btnSelecionarClick
  end
  object grd: TDBGrid
    Left = 10
    Top = 8
    Width = 559
    Height = 281
    DataSource = srcIES
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
    OnKeyPress = grdKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_inst_vestibular'
        Title.Caption = 'C'#243'd.'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_instituicao'
        Title.Caption = 'Nome da institui'#231#227'o'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_curso'
        Title.Caption = 'Curso'
        Width = 241
        Visible = True
      end>
  end
  object qyIES: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   iv.cd_inst_vestibular,'
      '   ie.cd_instituicao,'
      '   ie.nm_instituicao,'
      '   iv.ds_curso'
      'FROM'
      '   instituicoes_vestibular iv'
      
        '      INNER JOIN instituicoes_ensino ie ON (ie.cd_instituicao = ' +
        'iv.cd_instituicao)'
      'WHERE'
      '   ie.sn_ensino_superior = '#39'S'#39)
    Params = <>
    Left = 48
    Top = 296
    object qyIEScd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
      Origin = 'WMESTRE12.instituicoes_vestibular.cd_inst_vestibular'
    end
    object qyIEScd_instituicao: TSmallintField
      FieldName = 'cd_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.cd_instituicao'
    end
    object qyIESnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.nm_instituicao'
      Size = 80
    end
    object qyIESds_curso: TStringField
      FieldName = 'ds_curso'
      Origin = 'WMESTRE12.instituicoes_vestibular.ds_curso'
      Size = 255
    end
  end
  object srcIES: TDataSource
    DataSet = qyIES
    Left = 16
    Top = 296
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
end
