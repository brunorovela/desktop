object frmDigitarQuestoes: TfrmDigitarQuestoes
  Left = 293
  Top = 281
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Digitar as respostas...'
  ClientHeight = 362
  ClientWidth = 265
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
  DesignSize = (
    265
    362)
  PixelsPerInch = 96
  TextHeight = 14
  object btnFechar: TSpeedButton
    Left = 168
    Top = 329
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
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
    ExplicitLeft = 161
    ExplicitTop = 336
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 249
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 248
  end
  object lbNome: TLabel
    Left = 13
    Top = 13
    Width = 42
    Height = 14
    Caption = 'lbNome'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 37
    Width = 248
    Height = 286
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = srcRespostas
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'nr_parte'
        Title.Caption = 'Parte'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_questao'
        Title.Caption = 'Quest'#227'o'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_resposta'
        Title.Caption = 'Resposta'
        Width = 86
        Visible = True
      end>
  end
  object qyRespostas: TUMZQuery
    Connection = DM.db
    Filtered = True
    AfterEdit = qyRespostasAfterEdit
    BeforePost = qyRespostasBeforePost
    OnNewRecord = qyRespostasNewRecord
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '   leitora_provas_alunos_resp'
      'WHERE'
      '   cd_prova_aluno = :cd_prova_aluno AND'
      '   ($questoes$)'
      'ORDER BY'
      '   nr_questao')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
        Value = '1'
      end>
    Left = 120
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
        Value = '1'
      end>
  end
  object srcRespostas: TDataSource
    DataSet = qyRespostas
    Left = 88
    Top = 328
  end
end
