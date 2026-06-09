object frmListaChamada: TfrmListaChamada
  Left = 136
  Top = 107
  Width = 589
  Height = 452
  Caption = 'Listas da Secretaria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 315
    Top = 128
    Width = 33
    Height = 13
    Caption = 'Turma:'
  end
  object Label4: TLabel
    Left = 301
    Top = 166
    Width = 47
    Height = 13
    Caption = 'Professor:'
  end
  object Label2: TLabel
    Left = 300
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Ano/Sem.'
  end
  object btn: TSpeedButton
    Left = 530
    Top = 160
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
  object Label3: TLabel
    Left = 300
    Top = 203
    Width = 48
    Height = 13
    Caption = 'Disciplina:'
  end
  object SpeedButton1: TSpeedButton
    Left = 530
    Top = 198
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
  object Label5: TLabel
    Left = 318
    Top = 91
    Width = 30
    Height = 13
    Caption = 'Curso:'
  end
  object btnCurso: TSpeedButton
    Left = 426
    Top = 85
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
    Left = 426
    Top = 123
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
  object Label6: TLabel
    Left = 304
    Top = 53
    Width = 43
    Height = 13
    Caption = 'Bimestre:'
  end
  object grp: TRadioGroup
    Left = 8
    Top = 2
    Width = 281
    Height = 407
    ItemIndex = 0
    Items.Strings = (
      'Lista Chamada Provis'#243'ria'
      'Di'#225'rio de Frequ'#234'ncia'
      'Notas e Faltas para Professor'
      'Notas e Faltas para Secretaria'
      'Conte'#250'do Program'#225'tico'
      'Etiquetas Professor'
      'Livro de Matr'#237'culas'
      'Ata de Conselho de Classe Exame Final'
      'Ata de Conselho de Classe 2'#170' '#201'poca'
      'Ata de Exame Final'
      'Ata de 2'#170' '#201'poca'
      'Ficha Individual'
      'Resumo Final de Notas'
      'Di'#225'rio de Frequ'#234'ncia/Aulas'
      'Listagem de Alunos/Turma c/Telefone'
      'Carteirinhas de Alunos'
      'Acompanhamento Pedag'#243'gico'
      'Di'#225'rio de Frequ'#234'ncia IBES'
      'Controle de Notas IBES'
      'Conte'#250'do Program'#225'tico IBES'
      'Di'#225'rio de Frequencia MBA'
      'Di'#225'rio de Atividades MBA')
    TabOrder = 0
  end
  object btnImprimir: TButton
    Left = 408
    Top = 296
    Width = 75
    Height = 25
    Caption = 'F7 Imprimir'
    TabOrder = 1
    TabStop = False
    OnClick = btnImprimirClick
  end
  object btnFechar: TButton
    Left = 489
    Top = 296
    Width = 75
    Height = 25
    Caption = 'F12 Fechar'
    TabOrder = 2
    TabStop = False
    OnClick = btnFecharClick
  end
  object txtTurma: TEdit
    Left = 352
    Top = 124
    Width = 73
    Height = 21
    TabOrder = 3
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object txtProfessor: TEdit
    Left = 352
    Top = 161
    Width = 177
    Height = 21
    Enabled = False
    TabOrder = 4
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object txtAnoSemestre: TMaskEdit
    Left = 352
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
    TabOrder = 5
    Text = '19931'
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object UpDown1: TUpDown
    Left = 403
    Top = 11
    Width = 16
    Height = 24
    Min = -100
    Position = 0
    TabOrder = 6
    Wrap = False
    OnClick = UpDown1Click
  end
  object txtDisciplina: TEdit
    Left = 352
    Top = 199
    Width = 177
    Height = 21
    Enabled = False
    TabOrder = 7
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object txtCurso: TEdit
    Left = 352
    Top = 86
    Width = 73
    Height = 21
    TabOrder = 8
    OnKeyPress = txtAnoSemestreKeyPress
  end
  object txtBimestre: TMaskEdit
    Left = 352
    Top = 49
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
    TabOrder = 9
    Text = '1'
  end
  object UpDown2: TUpDown
    Left = 385
    Top = 48
    Width = 16
    Height = 24
    Min = 0
    Max = 3
    Position = 0
    TabOrder = 10
    Wrap = False
    OnClick = UpDown2Click
  end
  object chkDesist: TCheckBox
    Left = 135
    Top = 104
    Width = 147
    Height = 17
    Caption = 'Desistentes e Transferidos'
    TabOrder = 11
  end
end

