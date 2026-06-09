object frmRelEscolares: TfrmRelEscolares
  Left = 191
  Top = 230
  Width = 586
  Height = 380
  Caption = 'Relat'#243'rios Escolares'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object lblTurma: TLabel
    Left = 301
    Top = 122
    Width = 33
    Height = 14
    Caption = 'Turma:'
  end
  object lblProfessor: TLabel
    Left = 283
    Top = 228
    Width = 51
    Height = 14
    Caption = 'Professor:'
  end
  object lblAnoSemestre: TLabel
    Left = 287
    Top = 16
    Width = 47
    Height = 14
    Caption = 'Ano/Sem.'
  end
  object btn: TSpeedButton
    Left = 514
    Top = 224
    Width = 33
    Height = 23
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
    OnClick = btnClick
  end
  object lblDisciplina: TLabel
    Left = 286
    Top = 157
    Width = 48
    Height = 14
    Caption = 'Disciplina:'
  end
  object SpeedButton1: TSpeedButton
    Left = 410
    Top = 153
    Width = 33
    Height = 23
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
    OnClick = SpeedButton1Click
  end
  object lblCurso: TLabel
    Left = 302
    Top = 87
    Width = 32
    Height = 14
    Caption = 'Curso:'
  end
  object btnCurso: TSpeedButton
    Left = 410
    Top = 81
    Width = 33
    Height = 23
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
    OnClick = btnCursoClick
  end
  object btnTurmas: TSpeedButton
    Left = 410
    Top = 117
    Width = 33
    Height = 23
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
    OnClick = btnTurmasClick
  end
  object lblBimestre: TLabel
    Left = 289
    Top = 51
    Width = 45
    Height = 14
    Caption = 'Bimestre:'
  end
  object lblCodigoAluno: TLabel
    Left = 278
    Top = 193
    Width = 56
    Height = 14
    Caption = 'C'#243'd. Aluno:'
  end
  object SpeedButton2: TSpeedButton
    Left = 410
    Top = 189
    Width = 33
    Height = 23
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
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 271
    Top = 260
    Width = 63
    Height = 14
    Caption = 'Observa'#231#227'o:'
  end
  object btnImprimir: TButton
    Left = 392
    Top = 312
    Width = 75
    Height = 25
    Caption = 'F7 Imprimir'
    TabOrder = 8
    TabStop = False
    OnClick = btnImprimirClick
  end
  object btnFechar: TButton
    Left = 473
    Top = 312
    Width = 75
    Height = 25
    Caption = 'F12 Fechar'
    TabOrder = 9
    TabStop = False
    OnClick = btnFecharClick
  end
  object txtTurma: TEdit
    Left = 336
    Top = 118
    Width = 73
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object txtProfessor: TEdit
    Left = 336
    Top = 225
    Width = 177
    Height = 22
    Enabled = False
    TabOrder = 6
  end
  object txtAnoSemestre: TMaskEdit
    Left = 336
    Top = 11
    Width = 55
    Height = 22
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 0
    Text = '19931'
  end
  object UpDown1: TUpDown
    Left = 387
    Top = 11
    Width = 16
    Height = 24
    Min = -100
    Position = 0
    TabOrder = 10
    Wrap = False
    OnClick = UpDown1Click
  end
  object txtDisciplina: TEdit
    Left = 336
    Top = 154
    Width = 73
    Height = 22
    Enabled = False
    TabOrder = 4
  end
  object txtCurso: TEdit
    Left = 336
    Top = 82
    Width = 73
    Height = 22
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object txtBimestre: TMaskEdit
    Left = 336
    Top = 47
    Width = 33
    Height = 22
    TabStop = False
    EditMask = '9'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 1
    ParentFont = False
    TabOrder = 1
    Text = '1'
  end
  object UpDown2: TUpDown
    Left = 369
    Top = 46
    Width = 16
    Height = 24
    Min = 0
    Max = 3
    Position = 0
    TabOrder = 11
    Wrap = False
    OnClick = UpDown2Click
  end
  object txtCodigoAluno: TEdit
    Left = 336
    Top = 189
    Width = 73
    Height = 22
    TabOrder = 5
    OnExit = txtCodigoAlunoExit
  end
  object Tree: TTreeView
    Left = 0
    Top = 0
    Width = 249
    Height = 353
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 7
    OnClick = TreeClick
  end
  object meObs: TMemo
    Left = 336
    Top = 260
    Width = 209
    Height = 41
    TabOrder = 12
  end
  object tblRel: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select * from TiposRelatorios order by Tipo, Relatorio')
    Left = 496
    Top = 136
    object tblRelRelatorio: TStringField
      FieldName = 'Relatorio'
      Origin = 'Relatorios.Relatorio'
      Size = 50
    end
    object tblRelTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Relatorios.Tipo'
      Size = 50
    end
    object tblRelSub: TStringField
      FieldName = 'Sub'
      Origin = 'Relatorios.Sub'
      Size = 50
    end
    object tblRelArquivo: TStringField
      FieldName = 'Arquivo'
      Origin = 'Relatorios.Arquivo'
      Size = 50
    end
    object tblRelParametros: TStringField
      FieldName = 'Parametros'
      Origin = 'Relatorios.Parametros'
      Size = 255
    end
    object tblRelFormula: TStringField
      FieldName = 'Formula'
      Origin = 'Relatorios.Formula'
      Size = 50
    end
    object tblRelConteudoFormula: TStringField
      FieldName = 'ConteudoFormula'
      Origin = 'Relatorios.ConteudoFormula'
      Size = 50
    end
    object tblRelEspecial: TStringField
      FieldName = 'Especial'
      Origin = 'Relatorios.Especial'
      Size = 255
    end
  end
  object popTurmas: TPopupMenu
    AutoHotkeys = maManual
    Left = 496
    Top = 168
  end
end

