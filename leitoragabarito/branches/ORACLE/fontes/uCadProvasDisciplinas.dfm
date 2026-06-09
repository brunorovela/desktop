object frmCadProvasDisciplinas: TfrmCadProvasDisciplinas
  Left = 452
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Cadastrar Disciplinas'
  ClientHeight = 422
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 377
    Width = 494
    Height = 5
    Style = bsRaised
  end
  object sbSalvarFechar: TSpeedButton
    Left = 304
    Top = 388
    Width = 107
    Height = 22
    Caption = 'Salvar e Fechar'
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
    OnClick = sbSalvarFecharClick
  end
  object btnFechar: TSpeedButton
    Left = 416
    Top = 388
    Width = 87
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
    OnClick = btnFecharClick
  end
  object Label1: TLabel
    Left = 8
    Top = 14
    Width = 48
    Height = 14
    Caption = 'Disciplina:'
  end
  object sbSalvar: TSpeedButton
    Left = 192
    Top = 388
    Width = 107
    Height = 22
    Caption = 'Salvar'
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
    OnClick = sbSalvarClick
  end
  object Bevel2: TBevel
    Left = 6
    Top = 39
    Width = 499
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 490
    Height = 14
    Caption = 
      'OBS.: Para selecionar mais de uma disciplina, segure a tecla CTR' +
      'L e clique nas disciplinas desejadas.'
  end
  object edDisciplina: TEdit
    Left = 88
    Top = 11
    Width = 415
    Height = 22
    TabOrder = 0
    OnKeyPress = edDisciplinaKeyPress
  end
  object grd: TDBGrid
    Left = 8
    Top = 64
    Width = 497
    Height = 307
    DataSource = srcDisciplinas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_curso'
        Title.Caption = 'C'#243'd. Curso'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_disciplina'
        Title.Caption = 'C'#243'd. Disciplina'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_disciplina'
        Title.Caption = 'Disciplina'
        Width = 310
        Visible = True
      end>
  end
  object qyDisciplinas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'd.codigo AS cd_disciplina,'
      #9'd.descricao AS ds_disciplina,'
      #9'd.curso AS cd_curso'
      'FROM'
      #9'disciplinas d'
      'WHERE'
      #9'd.descricao LIKE :ds_disciplina'
      'ORDER BY'
      #9'd.curso,'
      #9'd.descricao')
    Left = 144
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'ds_disciplina'
        ParamType = ptUnknown
      end>
    object qyDisciplinascd_disciplina: TIntegerField
      FieldName = 'cd_disciplina'
      Origin = 'WMESTRE12.disciplinas.codigo'
    end
    object qyDisciplinasds_disciplina: TStringField
      FieldName = 'ds_disciplina'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 100
    end
    object qyDisciplinascd_curso: TStringField
      FieldName = 'cd_curso'
      Origin = 'WMESTRE12.disciplinas.curso'
      Size = 15
    end
  end
  object srcDisciplinas: TDataSource
    DataSet = qyDisciplinas
    Left = 176
    Top = 160
  end
end