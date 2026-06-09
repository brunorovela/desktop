object frm_ListaAlunos: Tfrm_ListaAlunos
  Left = 248
  Top = 193
  Caption = 'Lista de alunos no vestibular selecionado'
  ClientHeight = 407
  ClientWidth = 605
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
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object btnFechar: TSpeedButton
    Left = 512
    Top = 384
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
    OnClick = btnFecharClick
  end
  object SpeedButton1: TSpeedButton
    Left = 376
    Top = 384
    Width = 127
    Height = 22
    Caption = 'Apagar selecionado'
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
    OnClick = SpeedButton1Click
  end
  object grd: TDBGrid
    Left = 7
    Top = 8
    Width = 596
    Height = 369
    DataSource = srcLista
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
        FieldName = 'cd_pessoa'
        Title.Caption = 'C'#243'd.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Title.Caption = 'Nome'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'turma'
        Title.Caption = 'Turma'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anosemestre'
        Title.Caption = 'Ano/Sem.'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_status'
        Title.Caption = 'Status'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_curso'
        Title.Caption = 'Curso Vestibular'
        Width = 116
        Visible = True
      end>
  end
  object qyLista: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'a.cd_pessoa,'
      #9'p.nm_pessoa,'
      #9'm.turma,'
      #9'max(m.anosemestre) AS anosemestre,'
      #9'a.ds_status,'
      #9'i.cd_inst_vestibular,'
      #9'i.ds_curso'
      'FROM'
      #9'pessoas p'
      'INNER JOIN matriculas m ON ('
      #9'm.codigoaluno = p.cd_pessoa'
      #9'AND (m.situacao = 0 OR m.situacao = 1)'
      ')'
      'LEFT JOIN contatos_pessoas c ON ('
      #9'c.cd_pessoa = p.cd_pessoa'
      #9'AND c.cd_contato = 4'
      ')'
      'INNER JOIN alunos_vestibular a ON (a.cd_pessoa = p.cd_pessoa)'
      'LEFT JOIN instituicoes_vestibular i ON ('
      #9'i.cd_inst_vestibular = a.cd_inst_vestibular'
      ')'
      'GROUP BY'
      #9'a.cd_pessoa'
      'order by p.nm_pessoa;')
    Params = <>
    Left = 48
    Top = 296
    object qyListacd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qyListanm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyListaturma: TStringField
      FieldName = 'turma'
      Size = 15
    end
    object qyListaanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object qyListads_status: TStringField
      FieldName = 'ds_status'
    end
    object qyListads_curso: TStringField
      FieldName = 'ds_curso'
      Size = 255
    end
    object qyListacd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
    end
  end
  object srcLista: TDataSource
    DataSet = qyLista
    Left = 16
    Top = 296
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
end
