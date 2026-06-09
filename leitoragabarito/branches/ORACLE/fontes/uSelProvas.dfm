object frmSelProvas: TfrmSelProvas
  Left = 293
  Top = 281
  BorderStyle = bsSingle
  Caption = 'Selecionar as Provas...'
  ClientHeight = 600
  ClientWidth = 800
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
    800
    600)
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 612
    Top = 569
    Width = 87
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Atribuir'
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
    OnClick = SpeedButton1Click
    ExplicitLeft = 406
    ExplicitTop = 288
  end
  object btnFechar: TSpeedButton
    Left = 703
    Top = 569
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
    ExplicitLeft = 497
    ExplicitTop = 288
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 749
    Height = 28
    Anchors = [akLeft, akTop, akRight]
    Caption = 
      'Arraste do quadro da direita, as provas correspondentes que deve' +
      'm ser utilizadas para atribuir as notas. OBS.: Cuide para arrast' +
      'ar apenas uma prova para cada turma e disciplina da turma.'
    WordWrap = True
    ExplicitWidth = 640
  end
  object lblBimestre: TLabel
    Left = 15
    Top = 50
    Width = 45
    Height = 14
    Alignment = taRightJustify
    Caption = 'Bimestre:'
  end
  object txtBimestre: TMaskEdit
    Left = 71
    Top = 45
    Width = 60
    Height = 22
    TabStop = False
    EditMask = '99'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '01'
    OnChange = txtBimestreChange
  end
  object UpDown2: TUpDown
    Left = 130
    Top = 44
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 1
    OnClick = UpDown2Click
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 9
    Top = 73
    Width = 240
    Height = 490
    Margins.Left = 9
    Margins.Top = 73
    Margins.Bottom = 37
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitHeight = 294
    object tvOrigem: TTreeView
      Left = 0
      Top = 0
      Width = 240
      Height = 490
      Align = alClient
      DragMode = dmAutomatic
      Indent = 19
      TabOrder = 0
      OnDragDrop = tvOrigemDragDrop
      ExplicitHeight = 294
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 255
    Top = 73
    Width = 537
    Height = 490
    Margins.Top = 73
    Margins.Right = 8
    Margins.Bottom = 37
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 428
    ExplicitHeight = 294
    object sgSelecionadas: TStringGrid
      Left = 0
      Top = 0
      Width = 537
      Height = 490
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      OnDragDrop = sgSelecionadasDragDrop
      OnDragOver = sgSelecionadasDragOver
      ExplicitWidth = 428
      ExplicitHeight = 294
    end
  end
  object pmQtd: TPopupMenu
    Left = 504
    Top = 256
  end
end
