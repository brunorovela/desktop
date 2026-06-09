object frmAulasProvasAcoes: TfrmAulasProvasAcoes
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o/Inclus'#227'o de Aulas e Provas'
  ClientHeight = 648
  ClientWidth = 842
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 842
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 527
  end
  object Bevel6: TBevel
    Left = 0
    Top = 6
    Width = 9
    Height = 642
    Align = alLeft
    Shape = bsSpacer
    ExplicitHeight = 319
  end
  object Bevel2: TBevel
    Left = 833
    Top = 6
    Width = 9
    Height = 642
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 518
    ExplicitHeight = 319
  end
  object Label22: TLabel
    Left = 229
    Top = 32
    Width = 81
    Height = 16
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pcAulas: TPageControl
    Left = 9
    Top = 6
    Width = 824
    Height = 642
    ActivePage = tsAulas
    Align = alClient
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    Style = tsFlatButtons
    TabOrder = 0
    object tsAulas: TTabSheet
      Caption = 'Gerenciar Aulas'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 816
        Height = 611
        VertScrollBar.Smooth = True
        Align = alClient
        BevelInner = bvNone
        BorderStyle = bsNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label6: TLabel
          Left = 46
          Top = 187
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conte'#250'do:'
        end
        object Label71: TLabel
          Left = 378
          Top = 181
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object Label2: TLabel
          Left = 14
          Top = 2
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero da Aula:'
        end
        object Label1: TLabel
          Left = 14
          Top = 27
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Curso:'
        end
        object sbBuscaCurso: TSpeedButton
          Left = 159
          Top = 27
          Width = 27
          Height = 21
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
          OnClick = sbBuscaCursoClick
        end
        object Label45: TLabel
          Left = 196
          Top = 30
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object Label7: TLabel
          Left = 102
          Top = 1
          Width = 79
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbBuscaTurma: TSpeedButton
          Left = 323
          Top = 27
          Width = 17
          Height = 21
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
          OnClick = sbBuscaTurmaClick
        end
        object lblDisciplina: TLabel
          Left = 348
          Top = 30
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object sbBuscaDisciplina: TSpeedButton
          Left = 483
          Top = 27
          Width = 17
          Height = 21
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
          OnClick = sbBuscaDisciplinaClick
        end
        object lblAProf: TLabel
          Left = 506
          Top = 30
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
        end
        object sbAProf: TSpeedButton
          Left = 655
          Top = 27
          Width = 17
          Height = 21
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
          OnClick = sbAProfClick
        end
        object sbBuscaGrupoAulas: TSpeedButton
          Left = 655
          Top = 62
          Width = 17
          Height = 21
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
          OnClick = sbBuscaGrupoAulasClick
        end
        object lbGrupoAulas: TLabel
          Left = 506
          Top = 65
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Grupo:'
        end
        object Label5: TLabel
          Left = 353
          Top = 65
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Aulas:'
        end
        object Label3: TLabel
          Left = 279
          Top = 65
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Per.:'
        end
        object Label8: TLabel
          Left = 149
          Top = 65
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = 'at'#233':'
          Enabled = False
        end
        object Label4: TLabel
          Left = 14
          Top = 65
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data:'
        end
        object Label26: TLabel
          Left = 14
          Top = 95
          Width = 62
          Height = 13
          Caption = 'Tipo de aula:'
        end
        object lblSituacaoAula: TLabel
          Left = 14
          Top = 166
          Width = 84
          Height = 13
          Caption = 'Situa'#231#227'o da Aula:'
        end
        object meConteudo: TMemo
          Left = 47
          Top = 200
          Width = 321
          Height = 60
          TabOrder = 0
        end
        object meObservacao: TMemo
          Left = 377
          Top = 200
          Width = 318
          Height = 60
          TabOrder = 1
        end
        object pnControleLogistica: TPanel
          Left = 33
          Top = 266
          Width = 686
          Height = 291
          BevelOuter = bvNone
          TabOrder = 2
          object lbl: TLabel
            Left = 14
            Top = 5
            Width = 100
            Height = 13
            Caption = 'Material para a Aula:'
          end
          object Label66: TLabel
            Left = 344
            Top = 5
            Width = 57
            Height = 13
            Caption = 'Transporte:'
          end
          object Label67: TLabel
            Left = 14
            Top = 105
            Width = 66
            Height = 13
            Caption = 'Local da aula:'
          end
          object Label69: TLabel
            Left = 344
            Top = 105
            Width = 66
            Height = 13
            Caption = 'Hospedagem:'
          end
          object Label68: TLabel
            Left = 14
            Top = 205
            Width = 125
            Height = 13
            Caption = 'Gerenciamento Professor:'
          end
          object Label70: TLabel
            Left = 344
            Top = 205
            Width = 111
            Height = 13
            Caption = 'Gerenciamento Gestor:'
          end
          object Label75: TLabel
            Left = 445
            Top = 79
            Width = 7
            Height = 13
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label76: TLabel
            Left = 554
            Top = 78
            Width = 10
            Height = 14
            Caption = '='
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 116
            Top = 79
            Width = 7
            Height = 13
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label88: TLabel
            Left = 115
            Top = 179
            Width = 7
            Height = 13
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label89: TLabel
            Left = 445
            Top = 179
            Width = 7
            Height = 13
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 544
            Top = 256
            Width = 37
            Height = 13
            Caption = 'Label36'
          end
          object meMaterial: TMemo
            Left = 15
            Top = 27
            Width = 320
            Height = 25
            TabOrder = 1
          end
          object meTransporte: TMemo
            Left = 344
            Top = 27
            Width = 320
            Height = 25
            TabOrder = 13
          end
          object meLocal: TMemo
            Left = 15
            Top = 127
            Width = 320
            Height = 25
            TabOrder = 6
          end
          object meHospagem: TMemo
            Left = 344
            Top = 127
            Width = 320
            Height = 25
            TabOrder = 18
          end
          object meGerenciamentoProf: TMemo
            Left = 15
            Top = 230
            Width = 319
            Height = 50
            TabOrder = 11
          end
          object meGerenciamentoGestor: TMemo
            Left = 344
            Top = 230
            Width = 319
            Height = 50
            TabOrder = 23
          end
          object cbSituacaoMaterialAula: TUMComboBox
            Left = 120
            Top = 2
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSituacaoTransporte: TUMComboBox
            Left = 407
            Top = 2
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 12
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSituacaoLocalAula: TUMComboBox
            Left = 86
            Top = 102
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 5
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSituacaoHospedagem: TUMComboBox
            Left = 416
            Top = 102
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 17
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSituacaoGerenProfessor: TUMComboBox
            Left = 145
            Top = 202
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 10
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object cbSituacaoGerenGestor: TUMComboBox
            Left = 461
            Top = 203
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 22
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
          object Panel7: TPanel
            Left = 455
            Top = 54
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 15
            object Label73: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Valor Km'
              ExplicitWidth = 41
            end
            object edmValorKm: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmKmExit
              OnKeyUp = edmKmKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel6: TPanel
            Left = 344
            Top = 54
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 14
            object Label72: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Km'
              ExplicitWidth = 14
            end
            object edmKm: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmKmExit
              OnKeyUp = edmKmKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel8: TPanel
            Left = 566
            Top = 54
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 16
            object Label74: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Total'
              ExplicitWidth = 24
            end
            object edmTotalKm: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 0
              Text = '0,00'
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel9: TPanel
            Left = 14
            Top = 154
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 7
            object Label78: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Qtd. Di'#225'rias'
              ExplicitWidth = 57
            end
            object edmQtdDiariasLocal: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmQtdDiariasLocalExit
              OnKeyUp = edmQtdDiariasLocalKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel10: TPanel
            Left = 125
            Top = 154
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 8
            object Label79: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Valor Di'#225'ria'
              ExplicitWidth = 54
            end
            object edmVlDiariaLocal: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmQtdDiariasLocalExit
              OnKeyUp = edmQtdDiariasLocalKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel11: TPanel
            Left = 236
            Top = 154
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 9
            object Label80: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Total'
              ExplicitWidth = 24
            end
            object edmTotalLocal: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 0
              Text = '0,00'
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel12: TPanel
            Left = 344
            Top = 154
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 19
            object Label81: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Qtd. Di'#225'rias'
              ExplicitWidth = 57
            end
            object edmQtdDiariasHospedagem: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmQtdDiariasHospedagemExit
              OnKeyUp = edmQtdDiariasHospedagemKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel13: TPanel
            Left = 455
            Top = 154
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 20
            object Label82: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Valor Di'#225'ria'
              ExplicitWidth = 54
            end
            object edmVlDiariaHospedagem: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmQtdDiariasHospedagemExit
              OnKeyUp = edmQtdDiariasHospedagemKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel14: TPanel
            Left = 566
            Top = 154
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 21
            object Label83: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Total'
              ExplicitWidth = 24
            end
            object edmTotalHospedagem: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 0
              Text = '0,00'
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel15: TPanel
            Left = 15
            Top = 54
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 2
            object Label84: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Qtd. Di'#225'rias'
              ExplicitWidth = 57
            end
            object edmQtdDiariasMaterial: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmQtdDiariasMaterialExit
              OnKeyUp = edmQtdDiariasMaterialKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel16: TPanel
            Left = 126
            Top = 54
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 3
            object Label85: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Valor Di'#225'ria'
              ExplicitWidth = 54
            end
            object edmVlDiariaMaterial: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = edmQtdDiariasMaterialExit
              OnKeyUp = edmQtdDiariasMaterialKeyUp
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
          object Panel17: TPanel
            Left = 237
            Top = 54
            Width = 98
            Height = 43
            BevelOuter = bvLowered
            TabOrder = 4
            object Label86: TLabel
              Left = 1
              Top = 8
              Width = 96
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 'Total'
              ExplicitWidth = 24
            end
            object edmTotalMaterial: TUMEditMonetario
              Left = 1
              Top = 21
              Width = 96
              Height = 21
              Align = alBottom
              BevelInner = bvNone
              BevelKind = bkFlat
              BevelWidth = 3
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 0
              Text = '0,00'
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
          end
        end
        object ToolBar7: TToolBar
          Left = 0
          Top = 586
          Width = 816
          Height = 25
          Align = alBottom
          ButtonWidth = 84
          Caption = 'toolPessoa'
          EdgeBorders = [ebTop, ebBottom]
          Images = ImageList2
          List = True
          ShowCaptions = True
          TabOrder = 3
          object btSalvar: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'F5 Salvar'
            ImageIndex = 3
            OnClick = btSalvarClick
          end
          object ToolButton17: TToolButton
            Left = 76
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btCancelar: TToolButton
            Left = 84
            Top = 0
            AutoSize = True
            Caption = 'F6 Cancelar'
            ImageIndex = 4
            OnClick = btCancelarClick
          end
        end
        object txtCurso: TEdit
          Left = 52
          Top = 27
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 4
        end
        object txtTurma: TEdit
          Left = 244
          Top = 27
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 5
          OnKeyDown = txtTurmaKeyDown
        end
        object txtDisciplina: TEdit
          Left = 404
          Top = 27
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 6
          OnKeyDown = txtTurmaKeyDown
        end
        object txtAProf: TEdit
          Left = 562
          Top = 27
          Width = 87
          Height = 21
          ReadOnly = True
          TabOrder = 7
          OnKeyDown = txtTurmaKeyDown
        end
        object edGrupoAulas: TEdit
          Left = 562
          Top = 62
          Width = 87
          Height = 21
          ReadOnly = True
          TabOrder = 8
          OnKeyDown = txtTurmaKeyDown
        end
        object ckbBloqueado: TCheckBox
          Left = 429
          Top = 62
          Width = 68
          Height = 21
          Caption = 'Bloqueado'
          TabOrder = 9
        end
        object txtAulas: TEdit
          Left = 389
          Top = 62
          Width = 18
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 10
        end
        object udAulas: TUpDown
          Left = 413
          Top = 61
          Width = 10
          Height = 21
          Enabled = False
          Max = 1000
          Position = 500
          TabOrder = 11
          OnClick = udAulasClick
        end
        object udBim: TUpDown
          Left = 333
          Top = 61
          Width = 10
          Height = 21
          TabOrder = 12
          OnClick = udBimClick
        end
        object txtBim: TEdit
          Left = 309
          Top = 62
          Width = 18
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 13
        end
        object umdtDataFim: TUMDateTimePicker
          Left = 178
          Top = 61
          Width = 95
          Height = 21
          BevelOuter = bvNone
          TabOrder = 14
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtDataInic: TUMDateTimePicker
          Left = 52
          Top = 61
          Width = 91
          Height = 21
          BevelOuter = bvNone
          TabOrder = 15
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object cbTipoAula: TUMComboBox
          Left = 82
          Top = 92
          Width = 165
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 16
          TamanhoMaximo = 0
        end
        object ckbAtividadeComplementares: TCheckBox
          Left = 258
          Top = 92
          Width = 223
          Height = 21
          Caption = 'Inserir como atividade complementar.'
          TabOrder = 17
          Visible = False
        end
        object ckbConfGrade: TCheckBox
          Left = 82
          Top = 119
          Width = 223
          Height = 21
          Caption = 'Inserir aulas conforme grade de hor'#225'rios.'
          TabOrder = 18
          OnClick = ckbConfGradeClick
        end
        object ckbCompartilha: TCheckBox
          Left = 82
          Top = 139
          Width = 322
          Height = 21
          Caption = 'Compartilhar aula com demais professores da Turma/Disciplina.'
          TabOrder = 20
          OnClick = ckbConfGradeClick
        end
        object cbSituacaoAula: TComboBox
          Left = 101
          Top = 163
          Width = 242
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 19
        end
      end
    end
    object tsProvas: TTabSheet
      Caption = 'Gerenciar Provas'
      ImageIndex = 2
      object pcProvas: TPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 611
        Align = alClient
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 196
          Top = 38
          Width = 22
          Height = 21
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
          OnClick = sbBuscaCursoClick
        end
        object Label9: TLabel
          Left = 374
          Top = 42
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object Label10: TLabel
          Left = 226
          Top = 42
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object SpeedButton2: TSpeedButton
          Left = 343
          Top = 38
          Width = 23
          Height = 21
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
          OnClick = sbBuscaTurmaClick
        end
        object SpeedButton3: TSpeedButton
          Left = 501
          Top = 38
          Width = 23
          Height = 21
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
          OnClick = sbBuscaDisciplinaClick
        end
        object Label11: TLabel
          Left = 53
          Top = 42
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Curso:'
        end
        object Label12: TLabel
          Left = 236
          Top = 70
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Per.:'
        end
        object Label13: TLabel
          Left = 58
          Top = 70
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data:'
        end
        object Label15: TLabel
          Left = 42
          Top = 153
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Assunto:'
        end
        object Label16: TLabel
          Left = 6
          Top = 9
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#250'mero da Prova:'
        end
        object lblProva: TLabel
          Left = 97
          Top = 8
          Width = 81
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 6
          Top = 212
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turmas/Disciplinas:'
        end
        object lblPProf: TLabel
          Left = 516
          Top = 69
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
          Visible = False
        end
        object Label25: TLabel
          Left = 38
          Top = 126
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dias Bloq:'
        end
        object Label33: TLabel
          Left = 531
          Top = 97
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Chave:'
        end
        object Label35: TLabel
          Left = 389
          Top = 70
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Etapa:'
        end
        object Label37: TLabel
          Left = 58
          Top = 97
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso:'
        end
        object lbResponsavel: TLabel
          Left = 20
          Top = 181
          Width = 65
          Height = 13
          Caption = 'Respons'#225'vel:'
        end
        object spLimpaResp: TSpeedButton
          Left = 372
          Top = 178
          Width = 23
          Height = 22
          Hint = 'Limpar campo Prof. Respons'#225'vel'
          Enabled = False
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
            FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
            FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
            FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
            FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
            FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          OnClick = spLimpaRespClick
        end
        object Label47: TLabel
          Left = 198
          Top = 97
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nota m'#237'nima:'
        end
        object Label48: TLabel
          Left = 355
          Top = 97
          Width = 66
          Height = 13
          Caption = 'Nota m'#225'xima:'
        end
        object Label65: TLabel
          Left = 190
          Top = 125
          Width = 70
          Height = 13
          Caption = 'Tipo de Prova:'
        end
        object Bevel4: TBevel
          Left = 6
          Top = 206
          Width = 726
          Height = 2
        end
        object lbTipoProva: TLabel
          Left = 475
          Top = 125
          Width = 28
          Height = 13
          Caption = '(CNS)'
        end
        object lbGrupoProvas: TLabel
          Left = 533
          Top = 42
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Grupo:'
        end
        object sbBuscaGrupoProvas: TSpeedButton
          Left = 646
          Top = 39
          Width = 23
          Height = 21
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
          OnClick = sbBuscaGrupoProvasClick
        end
        object txtPDisciplina: TEdit
          Left = 424
          Top = 38
          Width = 79
          Height = 21
          ReadOnly = True
          TabOrder = 2
          OnKeyDown = txtEditFiltroProvaKeyDown
        end
        object txtPTurma: TEdit
          Left = 263
          Top = 38
          Width = 79
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 1
          OnKeyDown = txtEditFiltroProvaKeyDown
        end
        object txtPCurso: TEdit
          Left = 91
          Top = 38
          Width = 106
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 0
        end
        object txtPBim: TEdit
          Left = 263
          Top = 66
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 4
        end
        object udPBim: TUpDown
          Left = 287
          Top = 66
          Width = 12
          Height = 21
          TabOrder = 5
          OnClick = udBimClick
        end
        object ToolBar1: TToolBar
          Left = 1
          Top = 585
          Width = 814
          Height = 25
          Align = alBottom
          ButtonWidth = 84
          Caption = 'toolPessoa'
          EdgeBorders = [ebTop, ebBottom]
          Images = ImageList2
          List = True
          ShowCaptions = True
          TabOrder = 22
          object ToolButton2: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'F5 Salvar'
            ImageIndex = 3
            OnClick = btSalvarClick
          end
          object ToolButton3: TToolButton
            Left = 76
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object ToolButton4: TToolButton
            Left = 84
            Top = 0
            AutoSize = True
            Caption = 'F6 Cancelar'
            ImageIndex = 4
            OnClick = btCancelarClick
          end
        end
        object clbPTD: TCheckListBox
          Left = 60
          Top = 231
          Width = 651
          Height = 199
          OnClickCheck = clbPTDClickCheck
          ItemHeight = 13
          TabOrder = 21
        end
        object txtPAssunto: TEdit
          Left = 89
          Top = 150
          Width = 580
          Height = 21
          TabOrder = 16
        end
        object btnNenhuma: TBitBtn
          Left = 38
          Top = 406
          Width = 16
          Height = 16
          Hint = 'Desceleciona todos...'
          Caption = '-'
          TabOrder = 20
          OnClick = btnNenhumaClick
        end
        object btnTodas: TBitBtn
          Left = 38
          Top = 230
          Width = 16
          Height = 15
          Hint = 'Seleciona todos...'
          Caption = '+'
          TabOrder = 19
          OnClick = btnSelTodas
        end
        object txtPProf: TEdit
          Left = 569
          Top = 66
          Width = 100
          Height = 21
          ReadOnly = True
          TabOrder = 9
          Visible = False
          OnKeyDown = txtTurmaKeyDown
        end
        object txtPDiasBloq: TEdit
          Left = 90
          Top = 122
          Width = 88
          Height = 21
          TabOrder = 14
        end
        object txtChave: TEdit
          Left = 569
          Top = 94
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 13
          OnExit = txtChaveExit
          OnKeyPress = txtChaveKeyPress
        end
        object txtPSerie: TEdit
          Left = 424
          Top = 66
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 7
        end
        object udPSerie: TUpDown
          Left = 448
          Top = 66
          Width = 12
          Height = 21
          Max = 1000
          Position = 500
          TabOrder = 8
          OnClick = udPSerieClick
        end
        object txtPPeso: TEdit
          Left = 90
          Top = 94
          Width = 88
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 10
          OnKeyPress = txtChaveKeyPress
        end
        object ckbPSerie: TCheckBox
          Left = 369
          Top = 69
          Width = 14
          Height = 17
          TabOrder = 6
          OnClick = ckbPSerieClick
        end
        object cbResponsavel: TComboBox
          Left = 89
          Top = 178
          Width = 279
          Height = 22
          Style = csOwnerDrawFixed
          Enabled = False
          ItemHeight = 16
          TabOrder = 17
        end
        object txtPNotaMinima: TEdit
          Left = 263
          Top = 94
          Width = 71
          Height = 21
          TabOrder = 11
          OnKeyPress = txtPNotaMinimaKeyPress
        end
        object txtPNotaMaxima: TEdit
          Left = 424
          Top = 94
          Width = 79
          Height = 21
          TabOrder = 12
          OnKeyPress = txtPNotaMaximaKeyPress
        end
        object ckbBloqueiaProva: TCheckBox
          Left = 567
          Top = 175
          Width = 102
          Height = 17
          AllowGrayed = True
          Caption = 'Bloquear a prova'
          TabOrder = 18
        end
        object cbTiposProvas: TUMComboBox
          Left = 263
          Top = 122
          Width = 206
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 15
          OnChange = cbTiposProvasChange
          TamanhoMaximo = 0
          SelecionarUnicoAutomatico = False
        end
        object edGrupoProvas: TEdit
          Left = 569
          Top = 39
          Width = 79
          Height = 21
          ReadOnly = True
          TabOrder = 3
          OnKeyDown = txtEditFiltroProvaKeyDown
        end
        object umdtPData: TUMDateTimePicker
          Left = 91
          Top = 67
          Width = 90
          Height = 21
          BevelOuter = bvNone
          TabOrder = 23
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
      end
    end
    object tsAprovacao: TTabSheet
      Caption = 'Gerenciar Aprova'#231#227'o'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 611
        Align = alClient
        TabOrder = 0
        object Label17: TLabel
          Left = 324
          Top = 33
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object Label18: TLabel
          Left = 174
          Top = 33
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object Label19: TLabel
          Left = 9
          Top = 33
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Curso:'
        end
        object lblAssunto: TLabel
          Left = 46
          Top = 8
          Width = 443
          Height = 16
          AutoSize = False
          Caption = 'ASSUNTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 9
          Top = 9
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prova:'
        end
        object lblACurso: TLabel
          Left = 45
          Top = 32
          Width = 124
          Height = 16
          AutoSize = False
          Caption = 'CURSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAturma: TLabel
          Left = 209
          Top = 32
          Width = 104
          Height = 16
          AutoSize = False
          Caption = 'TURMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblADisciplina: TLabel
          Left = 377
          Top = 32
          Width = 104
          Height = 16
          AutoSize = False
          Caption = 'DISCIPLINA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 8
          Top = 57
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Aluno:'
        end
        object lblAAluno: TLabel
          Left = 45
          Top = 56
          Width = 444
          Height = 16
          AutoSize = False
          Caption = 'ALUNO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 6
          Top = 80
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Justificativa:'
          Visible = False
        end
        object Label20: TLabel
          Left = 6
          Top = 180
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Resposta'
          Visible = False
        end
        object ToolBar2: TToolBar
          Left = 1
          Top = 585
          Width = 814
          Height = 25
          Align = alBottom
          ButtonWidth = 84
          Caption = 'toolPessoa'
          EdgeBorders = [ebTop, ebBottom]
          Images = ImageList2
          List = True
          ShowCaptions = True
          TabOrder = 0
          object btDeferir: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'DEFERIR'
            ImageIndex = 7
            OnClick = btDeferirClick
          end
          object ToolButton6: TToolButton
            Left = 74
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btIndeferir: TToolButton
            Left = 82
            Top = 0
            AutoSize = True
            Caption = 'INDEFERIR'
            ImageIndex = 2
            OnClick = btIndeferirClick
          end
          object ToolButton9: TToolButton
            Left = 167
            Top = 0
            Width = 34
            Caption = 'ToolButton9'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object btACancelar: TToolButton
            Left = 201
            Top = 0
            Caption = 'F6 Cancelar'
            ImageIndex = 4
            OnClick = btACancelarClick
          end
        end
        object meAJust: TMemo
          Left = 16
          Top = 96
          Width = 689
          Height = 78
          ReadOnly = True
          TabOrder = 1
        end
        object meResposta: TMemo
          Left = 15
          Top = 196
          Width = 690
          Height = 77
          TabOrder = 2
        end
      end
    end
    object tsCalculo: TTabSheet
      Caption = 'C'#225'lculo Nota'
      ImageIndex = 3
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 611
        Align = alClient
        TabOrder = 0
        object Label31: TLabel
          Left = 13
          Top = 27
          Width = 227
          Height = 13
          Caption = 'Formula de C'#225'lculo da M'#233'dia Bimestral (Padr'#227'o)'
        end
        object lblFiltro: TLabel
          Left = 45
          Top = 9
          Width = 459
          Height = 13
          AutoSize = False
          Caption = 'TODOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 13
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Filtro:'
        end
        object ToolBar3: TToolBar
          Left = 1
          Top = 585
          Width = 814
          Height = 25
          Align = alBottom
          ButtonWidth = 125
          Caption = 'toolPessoa'
          EdgeBorders = [ebTop, ebBottom]
          Images = ImageList2
          List = True
          ShowCaptions = True
          TabOrder = 0
          object tblNCalcular: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = 'F5 Calcular as Notas'
            ImageIndex = 3
            OnClick = btSalvarClick
          end
          object ToolButton7: TToolButton
            Left = 129
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tblNCancelar: TToolButton
            Left = 137
            Top = 0
            AutoSize = True
            Caption = 'F6 Cancelar'
            ImageIndex = 4
            OnClick = btCancelarClick
          end
        end
        object edNFormula: TEdit
          Left = 23
          Top = 45
          Width = 674
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object ckbNForcar: TCheckBox
          Left = 223
          Top = 72
          Width = 193
          Height = 17
          Caption = 'For'#231'ar uso da f'#243'rmula padr'#227'o'
          TabOrder = 3
        end
        object meDados: TMemo
          Left = 32
          Top = 110
          Width = 665
          Height = 259
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Lines.Strings = (
            'ATEN'#199#195'O!!!'
            ''
            
              'Se a op'#231#227'o "For'#231'ar uso da f'#243'rmula padr'#227'o" for marcada, todas as ' +
              'disciplinas listadas ter'#227'o m'#233'dia calculadas por esta f'#243'rmula. '
            
              'Do contr'#225'rio, s'#243' ser'#225' utilizada para as disciplinas que ainda n'#227 +
              'o possuem formula de m'#233'dia definida.'
            ''
            
              'Fechar os di'#225'rios ap'#243's o c'#225'lculo de m'#233'dia - ir'#225' fechar todos os ' +
              'di'#225'rios que o filtro est'#225' apresentando, n'#227'o ir'#225' verificar se fal' +
              'ta notas ou '
            'frequ'#234'ncia.'
            ''
            'Nomenclatura:'
            ''
            'NOTAN - Nota da prova N (Ex. NOTA1,  NOTA2, NOTA3)'
            ''
            'NOTA_ESPECIAL - Nota da prova Especial'
            ''
            
              'ZERAR - Apaga as notas dos alunos ('#233' necess'#225'rio habilitar a op'#231#227 +
              'o "For'#231'ar uso da formula padr'#227'o")'
            ''
            
              'SUFICIENCIA - Esta f'#243'rmula ir'#225' analisar todos os alunos que fize' +
              'ram a prova de sufici'#234'ncia e obtiveram resultado para aprova'#231#227'o,' +
              ' '
            
              'setando sua m'#233'dia final e alterando a situa'#231#227'o do aluno para Apr' +
              'ovado.'
            '')
          TabOrder = 4
        end
        object ckbMedia: TCheckBox
          Left = 24
          Top = 72
          Width = 185
          Height = 17
          Caption = 'M'#233'dia Aritm'#233'tica'
          TabOrder = 2
        end
        object cbFecharDiario: TCheckBox
          Left = 415
          Top = 72
          Width = 282
          Height = 17
          Caption = 'Fechar os di'#225'rios ap'#243's o c'#225'lculo de m'#233'dia'
          TabOrder = 5
        end
      end
    end
    object tsFrequencia: TTabSheet
      Caption = 'Frequ'#234'ncia'
      ImageIndex = 4
      object ToolBar4: TToolBar
        Left = 0
        Top = 586
        Width = 816
        Height = 25
        Align = alBottom
        ButtonWidth = 118
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 0
        object ToolButton5: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'Executar Rec'#225'lculo'
          ImageIndex = 3
          OnClick = btSalvarClick
        end
        object ToolButton8: TToolButton
          Left = 122
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton10: TToolButton
          Left = 130
          Top = 0
          AutoSize = True
          Caption = 'Cancelar'
          ImageIndex = 4
          OnClick = btCancelarClick
        end
      end
      object Memo1: TMemo
        Left = 165
        Top = 40
        Width = 465
        Height = 137
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'ATEN'#199#195'O!!!'
          ''
          'Esta op'#231#227'o ir'#225' recalcular o percentual de frequ'#234'ncia e '
          'total de faltas para todos os alunos das turmas/disciplinas '
          'filtradas que n'#227'o estiverem com a sua fichaindividual bloqueada.'
          ''
          'Para prosseguir basta clicar em executar rec'#225'lculo')
        TabOrder = 1
      end
    end
    object tsComplemento: TTabSheet
      Caption = 'Complemento de M'#233'dia'
      ImageIndex = 5
      object Label28: TLabel
        Left = 192
        Top = 74
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Turma:'
      end
      object SpeedButton4: TSpeedButton
        Left = 309
        Top = 71
        Width = 23
        Height = 21
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
        OnClick = sbBuscaTurmaClick
      end
      object Label29: TLabel
        Left = 202
        Top = 102
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per.:'
      end
      object Label30: TLabel
        Left = 153
        Top = 128
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo do Ajuste:'
      end
      object Label32: TLabel
        Left = 189
        Top = 25
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
      end
      object Label34: TLabel
        Left = 154
        Top = 44
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano/Semestre:'
      end
      object DBText1: TDBText
        Left = 232
        Top = 46
        Width = 65
        Height = 17
        DataField = 'nr_anosem'
        DataSource = dsComplemento
      end
      object DBText2: TDBText
        Left = 232
        Top = 25
        Width = 65
        Height = 17
        DataField = 'cd_ajuste_turma'
        DataSource = dsComplemento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object UpDown1: TUpDown
        Left = 255
        Top = 99
        Width = 12
        Height = 21
        TabOrder = 0
        OnClick = UpDown1Click
      end
      object DBEdit1: TDBEdit
        Left = 230
        Top = 71
        Width = 77
        Height = 21
        DataField = 'cd_turma'
        DataSource = dsComplemento
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 230
        Top = 99
        Width = 24
        Height = 21
        DataField = 'nr_etapa'
        DataSource = dsComplemento
        TabOrder = 2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 230
        Top = 126
        Width = 244
        Height = 21
        DataField = 'CD_AJUSTE'
        DataSource = dsComplemento
        KeyField = 'cd_ajuste'
        ListField = 'ds_ajuste'
        ListSource = dsAjuste
        TabOrder = 3
      end
      object ToolBar5: TToolBar
        Left = 0
        Top = 586
        Width = 816
        Height = 25
        Align = alBottom
        ButtonWidth = 84
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 4
        object ToolButton11: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          ImageIndex = 3
          OnClick = btSalvarClick
        end
        object ToolButton12: TToolButton
          Left = 76
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton13: TToolButton
          Left = 84
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          ImageIndex = 4
          OnClick = btCancelarClick
        end
      end
    end
    object tsCronogramasGerenciar: TTabSheet
      Caption = 'Gerenciar Cronogramas'
      ImageIndex = 6
      object Label43: TLabel
        Left = 636
        Top = 276
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data:'
        Visible = False
      end
      object Label49: TLabel
        Left = 611
        Top = 329
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Conte'#250'do:'
        Visible = False
      end
      object Label44: TLabel
        Left = 638
        Top = 302
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sala:'
        Visible = False
      end
      object txtCronogramasConteudo: TMemo
        Left = 668
        Top = 326
        Width = 386
        Height = 35
        TabOrder = 5
        Visible = False
      end
      object ToolBar6: TToolBar
        Left = 0
        Top = 586
        Width = 816
        Height = 25
        Align = alBottom
        ButtonWidth = 84
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 4
        object ToolButton14: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'F5 Salvar'
          ImageIndex = 3
          OnClick = btSalvarClick
        end
        object ToolButton15: TToolButton
          Left = 76
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton16: TToolButton
          Left = 84
          Top = 0
          AutoSize = True
          Caption = 'F6 Cancelar'
          ImageIndex = 4
          OnClick = btCancelarClick
        end
      end
      object txtCronogramasSala: TEdit
        Left = 668
        Top = 299
        Width = 79
        Height = 21
        TabOrder = 6
        Visible = False
        OnKeyDown = txtTurmaKeyDown
      end
      object txtAnoSemestre: TEdit
        Left = 572
        Top = 355
        Width = 16
        Height = 21
        TabOrder = 7
        Visible = False
        OnKeyDown = txtTurmaKeyDown
      end
      object pnPrimeiraAula: TPanel
        Left = 0
        Top = 177
        Width = 816
        Height = 101
        Align = alTop
        TabOrder = 1
        object lbAula1: TLabel
          Left = 25
          Top = 26
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = '1'#170' aula:'
        end
        object lbAula2: TLabel
          Left = 25
          Top = 61
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = '2'#170' aula:'
        end
        object Label54: TLabel
          Left = 69
          Top = 6
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label55: TLabel
          Left = 166
          Top = 6
          Width = 35
          Height = 13
          Caption = 'Hor'#225'rio'
        end
        object Label56: TLabel
          Left = 17
          Top = 83
          Width = 41
          Height = 13
          Caption = 'Nro Aula'
        end
        object Label57: TLabel
          Left = 80
          Top = 83
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label58: TLabel
          Left = 167
          Top = 83
          Width = 35
          Height = 13
          Caption = 'Hor'#225'rio'
        end
        object Label59: TLabel
          Left = 251
          Top = 83
          Width = 41
          Height = 13
          Caption = 'Nro Aula'
        end
        object Label60: TLabel
          Left = 313
          Top = 83
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label61: TLabel
          Left = 403
          Top = 83
          Width = 35
          Height = 13
          Caption = 'Hor'#225'rio'
        end
        object Label62: TLabel
          Left = 488
          Top = 83
          Width = 41
          Height = 13
          Caption = 'Nro Aula'
        end
        object Label63: TLabel
          Left = 552
          Top = 83
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label64: TLabel
          Left = 638
          Top = 83
          Width = 35
          Height = 13
          Caption = 'Hor'#225'rio'
        end
        object umAjudaAula1: TUMAjuda
          Left = 348
          Top = 22
          Width = 22
          Height = 21
          Picture.Data = {
            07544269746D6170361B0000424D361B00000000000036000000280000003000
            0000300000000100180000000000001B0000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F6F4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EF
            EFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4
            EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF0E9E9CBB3B3AD8887A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7
            807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807F
            A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA780
            7FA7807FA7807FA7807FA7807FA7807FA7807FAD8887CBB3B3F0E9E9FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9E9B08D8C7D44466F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E
            2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F
            2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C7D4446B08D8CF0E9E9FFFFFFFFFFFFFFFFFFFFFFFFB2E8F751B7
            D22D88A3297A94297A94297A94297A94297A94297A94297A94297A94297A9429
            7A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94
            297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A
            94297A94297A94297A94297A944B565E6723216723216723217D4446CBB3B3F9
            F6F6FFFFFFFFFFFF6DDBF600ACD500A7D000A7D000A4CB00A4CB00A4CB00A4CB
            00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4
            CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00
            A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A7D000A7D000ABD500B2DB
            3776866723216723216F2E2CAD8887F3EEEEFFFFFFB9F7FE00B2DB00ACD500AC
            D500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500
            ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD5
            00ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500AC
            D500ACD500ACD500ACD500B2DB00B5DF00B5DF4B565E6723216B2826A27977F0
            E9E9FFFFFF6DDBF600B5DF00B2DB00B5DF00B8E200B8E200B8E200B8E200B8E2
            00B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8
            E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200
            B8E200B8E200B8E200B8E200B8E200B8E200B8E200BBE500BBE500B8E200B8E2
            00BBE52D88A367232170312FB89897F6F1F1FFFFFF3CD3F200B8E200B8E200BB
            E500BFE901C8F501CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801
            CBF801CBF801CBF801CBF801CBF8169ABB352B3E66374B896977347E8F01CBF8
            01CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CB
            F801CBF801C8F500C5EE00C1EC00BFE900BEE7169ABB6723217B403ED3BFBFFC
            FAFAFFFFFF89ECFB00B8E200BBE500BFE900C6F004D1FE02D2FF02D2FF02D2FF
            02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF14819B3404
            170B010534041766374BFFF3FF49738802D2FF02D2FF02D2FF02D2FF02D2FF02
            D2FF02D2FF02D2FF02D2FF02D2FF02D2FF06D5FF0AD8FF06D0FA00C5EE00C1EC
            00C1EC3776866B2826946462EDE4E4FFFFFFFFFFFFCEFCFE00BEE700BEE700C1
            EC00C6F006D5FF08DAFF00D4FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00
            D3FF00D3FF02D2FF02D2FF0D12190B0105340417340417E0ABC06B4252926B7C
            00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF03D5
            FF0DE1FF12E5FF01CBF800C6F000C5EE00C5EE54494A733433C1A5A4F9F6F6FF
            FFFFFFFFFFFFFFFF3CD3F200BEE700C2E800C6F006D0FA0DE1FF08DAFF00D5FF
            00D3FF00D4FF00D3FF00D3FF00D3FF00D4FF00D4FF00D3FF00D3FF0D12190B01
            05340417340417340417450D1B66374B02D2FF00D3FF00D4FF00D4FF00D3FF00
            D3FF00D3FF00D4FF00D3FF00D5FF06DDFF1AECFF0DE1FF01CDF500C9F000C5EE
            13ACCE6B25238C5856E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFA2EEFC00C2E800C2
            E800C5EE01CDF50BDEFF0BDEFF03D8FF00D5FF00D5FF00D4FF00D5FF00D5FF00
            D5FF00D5FF00D5FF00D3FF29394B0B01050B0105340417340417340417352B3E
            00D5FF00D5FF00D5FF00D5FF00D5FF00D5FF00D4FF00D5FF00D5FF03D8FF12E5
            FF1AF1FF06D5FF01CDF500C9F000C9F0416371733433B89897F6F1F1FFFFFFFF
            FFFFFFFFFFFFFFFFF8FEFF1CCCEE00C2E800C5E900C9F00AD8FF12E5FF06DDFF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF14819B0B01
            050B01050B01050B01053D172A14819B00D5FF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF06DDFF1AF1FF1AECFF02D1F800C9F000C9F00ABADA
            66292786514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89ECFB00C2
            E800C5E900CBEF02D1F812E5FF0DE1FF04DBFF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF03D6FA10758F3404170B01050B010516576900D7FF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF04DBFF12EBFF24F9
            FF0BDEFF01CDF500CBEF00C9F037768670312FB39190F5F0F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C5E900C9EB00CEF20BDEFF12EBFF
            0BDEFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00DAFF00DA
            FF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00
            DAFF00DAFF00DAFF07E4FF21F6FF21F6FF03D6FA00CEF200CBEF06C7E8623030
            86514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79EB
            FA00C9EB00C9EB00CBEF03D6FA12EBFF0CEAFF06DDFF00DAFF00DAFF00DAFF00
            DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF
            00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF06DDFF1AF1FF26FFFF0DE1
            FF00D3F500CEF200CEF2347E8F733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C9EB00CBEF00D2F20BDEFF
            12EBFF07E4FF02DCFF00DAFF00DDFF00DDFF00DAFF00DDFF00DDFF00DDFF00DA
            FF00DDFF20728B09C1E000DAFF00DDFF00DDFF00DDFF00DAFF00DDFF00DDFF00
            DAFF02DCFF0CEAFF22FAFF1AF1FF02D9F900D3F500CEF206C7E86230308C5856
            E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF89ECFB00CDE900C9EB00CEEE00D3F50CEAFF0CEAFF06E1FF00DDFF00DDFF00
            DDFF00DDFF00DDFF00DDFF00DDFF00DDFF02DCFF450D1B0DA7C100DDFF00DDFF
            00DDFF00DDFF00DDFF00DDFF00DDFF00DDFF06E1FF15F4FF21FFFF06E1FF00D3
            F500D2F200D2F2377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF1CD5F000CDE900CDE900D2F2
            06DDFF12EBFF03E6FF02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF00DE
            FF0ABADA450D1B14819B02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF02
            DFFF0CEAFF21FFFF1AF1FF02D9F900D2F200D2F209C1E0652D2C8C5856E0D1D1
            FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF89ECFB00CDE900CDE900D1EE01D6F50CEAFF0CEAFF07E4FF00E1FF00
            E1FF00DEFF00E1FF00E1FF00E1FF02DFFF108D9D450D1B235F7400DEFF00E1FF
            00E1FF00E1FF00DEFF00E1FF00E1FF07E4FF15F4FF21FFFF06E1FF01D6F500D2
            F200D5F0377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF17D6EF00CDE900D0E9
            00D5F004E2FB12EBFF06EAFF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1
            FF235F74611D1B352B3E00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF0C
            EAFF1DFFFF1AF1FF01DAF501D6F500D5F009C7E062303086514FE0D1D1FDFDFD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF89ECFB00D0E900CDE900D1EE01DAF50CEAFF0CEAFF03E6FF00
            E1FF00E4FF00E1FF00E1FF00E4FF00E4FF352B3E6A231C3D172A00E4FF00E4FF
            00E1FF00E1FF00E4FF00E1FF03E6FF0EF1FF1DFFFF06E1FF01DAF500D5F000D7
            EF377686733433B39190F5F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB00CDE9
            00D0E900D7EF07E4FF0EF1FF06EAFF00E4FF00E4FF00E4FF00E4FF00E4FF00E4
            FF340417672321542C3D0DA7C100E4FF00E4FF00E4FF00E4FF00E4FF06EAFF17
            FBFF15F4FF01DEF500D7EF00D5F006CFE762303086514FE0D1D1FDFDFDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF89ECFB00D0E900D0E900D5F001DEF50EF1FF07EDFE03
            E6FF00E4FF00E4FF00E4FF00E4FF0DA7C1340417BA86986B425220728B00E4FF
            00E4FF00E4FF00E4FF03E6FF0EF1FF1DFFFF0CEAFF01DAF500D7EF00D7EF347E
            8F70312FAD8887F4EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB
            00D0E900D5EA00DAF10CEAFF0EF1FF06EAFF00E6FF00E6FF00E6FF00E6FF1657
            69340417935B676B42522A51630DE1FF00E6FF00E6FF00E6FF06EAFF17FBFF1D
            FFFF04E2FB00DAF100D7EF06CFE762303086514FE0D1D1FDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D0E900D5EA00DAF106E4FB0FF5FF08
            F1FF00E9FF00E6FF00E6FF03E6FF112A333404176B42527D444629394B00E9FF
            00E6FF00E6FF00E9FF0EF1FF1DFFFF15F4FF01DEF500DAF100D7EF2F8C966F2E
            2CB08D8CF3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF
            0ED5EB00D5EA01DAEE01DEF50EF1FF0FF5FF07EDFE00E9FF00E9FF00E9FF0B01
            05340417542C3D66374B29394B0BBCD206EAFF00E9FF07EDFE16FFFF21FFFF06
            EAFF01DEF500DAF106D2E6623030814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D5EA00D9EA00DEF106EAFF10
            FAFF08F1FF01ECFF00E9FF06B7CA0B0105340417481529542C3D352B3E14819B
            00E9FF01ECFF0FF5FF21FFFF17FBFF01E3F800DEF100DEF12F8C9670312FAD88
            87F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E3FDFF05DAEA00D5EA01DAEE01E2F50FF5FF0EF8FF04F0FF01ECFF10636D0B01
            05340417450D1B4815293D172A235F7400E9FF04F0FF16FFFF21FFFF06EAFF01
            E2F500DEF101DAEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D9EA00D9EA00DEF107
            EDFE10FAFF07F4FF01EEF829394B0B0105340417340417450D1B340417352B3E
            01ECFF0EF8FF21FFFF16FFFF01E5F800E2F100DEF12F8C966F2E2CA7807FF0E9
            E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE3FDFF05DAEA00D9EA01DEEE01E6F50EF8FF10FAFF04F0FF0D12190B01
            050B010534041734041734041734041707F4FF16FFFF21FFFF07EDFE01E6F500
            DEF101DEEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF61EFF800D9EA00DEEA00
            E2F107EDFE11FFFF07F6FE0D12190B0105340417340417340417340417340417
            0BFBFF21FFFF16FFFF01EAF800E5F101DEEE25A4AA6F2E2CA7807FF0E9E9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE3FDFF05DEEA00DEEA01E1ED01E6F510FAFF0EFFFF0D12190B01
            050B010534041734041734041734041716FFFF21FFFF08F1FF01E6F500E2F101
            DEEE5D3A3A814846D3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700DEEA00
            DEEA00E5F108F1FF11FFFF10636D0B01050B01050B01050B01050B01052A5163
            21FFFF16FFFF01EAF800E5F101E1ED25A4AA6F2E2CA7807FF0E9E9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCEFCFE05E1EA00DEEA00E4EE01EAF50EFFFF0EFFFF112A
            330B01050B01050B01050D121918E9EB21FFFF07F4FF01EAF500E5F101E1ED54
            494A7B403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700
            E2EA00E2EA00E8F107F4FF11FFFF04FCFE04DAE3108D9D07C0CA0EFFFF21FFFF
            16FFFF01EEF800E8F100E5F125A4AA6F2E2CA27977F0E9E9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E2EA00E2EA00E4EE01EDF50EFFFF0EFF
            FF05F9FF01F8FF05F9FF16FFFF21FFFF07F6FE01EDF500E8F100E8F154494A7B
            403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53
            F2F600E2EA00E5EA00E8F107F6FE11FFFF09FFFF01F8FF09FFFF21FFFF16FFFF
            01F0F800ECF100ECF125A4AA6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E2EA00E8F101F1F311FF
            FF0EFFFF04FCFE16FFFF26FFFF05F9FF01EDF500E8F100ECF154494A7B403ED0
            BABAFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF46F3F500E5EA00E5EA00ECF10BFBFF16FFFF0EFFFF26FFFF1DFFFF01F5F7
            00ECF100ECF11CBBBD6F2E2C9D716FEDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E5EA00EBED01F5
            F721FFFF26FFFF3DFFFF09FFFF01F1F300ECF100ECF154494A7B403ECBB3B3F9
            F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF46F3F500E5EA00EBED01F1F321FFFF57FFFF3DFFFF03F9FC01F1F3
            01F1F31CBBBD6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9F7FE00EBED00EBED01F1
            F30EFFFF57FFFF1DFFFF01F5F701F1F301F1F34B565E814846D0BABAFBF9F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF46F3F500EBED01F1F304FCFE1DFFFF09FFFF01F5F701F5F7
            1CBBBD7D4446B89897F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE01F1F301F5
            F701F9FA09FFFF03FEFF01F9FA01F5F76C7A79BEA1A0F0E9E9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF90FEFE01F9FA01F9FA03FEFF03FEFF04FCFE76D7D7
            E4D9D9F9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FF
            FF16FFFF09FFFF16FFFFA4FFFFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          Proportional = True
          Transparent = True
          Visible = False
          Titulo = 'ALERTA - Conflito de Hor'#225'rio'
          Position = poBottomCenter
        end
        object umAjudaAula2: TUMAjuda
          Left = 348
          Top = 57
          Width = 22
          Height = 21
          Picture.Data = {
            07544269746D6170361B0000424D361B00000000000036000000280000003000
            0000300000000100180000000000001B0000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F6F4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EF
            EFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4
            EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF0E9E9CBB3B3AD8887A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7
            807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807F
            A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA780
            7FA7807FA7807FA7807FA7807FA7807FA7807FAD8887CBB3B3F0E9E9FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9E9B08D8C7D44466F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E
            2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F
            2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C7D4446B08D8CF0E9E9FFFFFFFFFFFFFFFFFFFFFFFFB2E8F751B7
            D22D88A3297A94297A94297A94297A94297A94297A94297A94297A94297A9429
            7A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94
            297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A
            94297A94297A94297A94297A944B565E6723216723216723217D4446CBB3B3F9
            F6F6FFFFFFFFFFFF6DDBF600ACD500A7D000A7D000A4CB00A4CB00A4CB00A4CB
            00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4
            CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00
            A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A7D000A7D000ABD500B2DB
            3776866723216723216F2E2CAD8887F3EEEEFFFFFFB9F7FE00B2DB00ACD500AC
            D500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500
            ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD5
            00ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500AC
            D500ACD500ACD500ACD500B2DB00B5DF00B5DF4B565E6723216B2826A27977F0
            E9E9FFFFFF6DDBF600B5DF00B2DB00B5DF00B8E200B8E200B8E200B8E200B8E2
            00B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8
            E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200
            B8E200B8E200B8E200B8E200B8E200B8E200B8E200BBE500BBE500B8E200B8E2
            00BBE52D88A367232170312FB89897F6F1F1FFFFFF3CD3F200B8E200B8E200BB
            E500BFE901C8F501CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801
            CBF801CBF801CBF801CBF801CBF8169ABB352B3E66374B896977347E8F01CBF8
            01CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CB
            F801CBF801C8F500C5EE00C1EC00BFE900BEE7169ABB6723217B403ED3BFBFFC
            FAFAFFFFFF89ECFB00B8E200BBE500BFE900C6F004D1FE02D2FF02D2FF02D2FF
            02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF14819B3404
            170B010534041766374BFFF3FF49738802D2FF02D2FF02D2FF02D2FF02D2FF02
            D2FF02D2FF02D2FF02D2FF02D2FF02D2FF06D5FF0AD8FF06D0FA00C5EE00C1EC
            00C1EC3776866B2826946462EDE4E4FFFFFFFFFFFFCEFCFE00BEE700BEE700C1
            EC00C6F006D5FF08DAFF00D4FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00
            D3FF00D3FF02D2FF02D2FF0D12190B0105340417340417E0ABC06B4252926B7C
            00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF03D5
            FF0DE1FF12E5FF01CBF800C6F000C5EE00C5EE54494A733433C1A5A4F9F6F6FF
            FFFFFFFFFFFFFFFF3CD3F200BEE700C2E800C6F006D0FA0DE1FF08DAFF00D5FF
            00D3FF00D4FF00D3FF00D3FF00D3FF00D4FF00D4FF00D3FF00D3FF0D12190B01
            05340417340417340417450D1B66374B02D2FF00D3FF00D4FF00D4FF00D3FF00
            D3FF00D3FF00D4FF00D3FF00D5FF06DDFF1AECFF0DE1FF01CDF500C9F000C5EE
            13ACCE6B25238C5856E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFA2EEFC00C2E800C2
            E800C5EE01CDF50BDEFF0BDEFF03D8FF00D5FF00D5FF00D4FF00D5FF00D5FF00
            D5FF00D5FF00D5FF00D3FF29394B0B01050B0105340417340417340417352B3E
            00D5FF00D5FF00D5FF00D5FF00D5FF00D5FF00D4FF00D5FF00D5FF03D8FF12E5
            FF1AF1FF06D5FF01CDF500C9F000C9F0416371733433B89897F6F1F1FFFFFFFF
            FFFFFFFFFFFFFFFFF8FEFF1CCCEE00C2E800C5E900C9F00AD8FF12E5FF06DDFF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF14819B0B01
            050B01050B01050B01053D172A14819B00D5FF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF06DDFF1AF1FF1AECFF02D1F800C9F000C9F00ABADA
            66292786514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89ECFB00C2
            E800C5E900CBEF02D1F812E5FF0DE1FF04DBFF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF03D6FA10758F3404170B01050B010516576900D7FF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF04DBFF12EBFF24F9
            FF0BDEFF01CDF500CBEF00C9F037768670312FB39190F5F0F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C5E900C9EB00CEF20BDEFF12EBFF
            0BDEFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00DAFF00DA
            FF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00
            DAFF00DAFF00DAFF07E4FF21F6FF21F6FF03D6FA00CEF200CBEF06C7E8623030
            86514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79EB
            FA00C9EB00C9EB00CBEF03D6FA12EBFF0CEAFF06DDFF00DAFF00DAFF00DAFF00
            DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF
            00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF06DDFF1AF1FF26FFFF0DE1
            FF00D3F500CEF200CEF2347E8F733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C9EB00CBEF00D2F20BDEFF
            12EBFF07E4FF02DCFF00DAFF00DDFF00DDFF00DAFF00DDFF00DDFF00DDFF00DA
            FF00DDFF20728B09C1E000DAFF00DDFF00DDFF00DDFF00DAFF00DDFF00DDFF00
            DAFF02DCFF0CEAFF22FAFF1AF1FF02D9F900D3F500CEF206C7E86230308C5856
            E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF89ECFB00CDE900C9EB00CEEE00D3F50CEAFF0CEAFF06E1FF00DDFF00DDFF00
            DDFF00DDFF00DDFF00DDFF00DDFF00DDFF02DCFF450D1B0DA7C100DDFF00DDFF
            00DDFF00DDFF00DDFF00DDFF00DDFF00DDFF06E1FF15F4FF21FFFF06E1FF00D3
            F500D2F200D2F2377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF1CD5F000CDE900CDE900D2F2
            06DDFF12EBFF03E6FF02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF00DE
            FF0ABADA450D1B14819B02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF02
            DFFF0CEAFF21FFFF1AF1FF02D9F900D2F200D2F209C1E0652D2C8C5856E0D1D1
            FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF89ECFB00CDE900CDE900D1EE01D6F50CEAFF0CEAFF07E4FF00E1FF00
            E1FF00DEFF00E1FF00E1FF00E1FF02DFFF108D9D450D1B235F7400DEFF00E1FF
            00E1FF00E1FF00DEFF00E1FF00E1FF07E4FF15F4FF21FFFF06E1FF01D6F500D2
            F200D5F0377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF17D6EF00CDE900D0E9
            00D5F004E2FB12EBFF06EAFF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1
            FF235F74611D1B352B3E00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF0C
            EAFF1DFFFF1AF1FF01DAF501D6F500D5F009C7E062303086514FE0D1D1FDFDFD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF89ECFB00D0E900CDE900D1EE01DAF50CEAFF0CEAFF03E6FF00
            E1FF00E4FF00E1FF00E1FF00E4FF00E4FF352B3E6A231C3D172A00E4FF00E4FF
            00E1FF00E1FF00E4FF00E1FF03E6FF0EF1FF1DFFFF06E1FF01DAF500D5F000D7
            EF377686733433B39190F5F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB00CDE9
            00D0E900D7EF07E4FF0EF1FF06EAFF00E4FF00E4FF00E4FF00E4FF00E4FF00E4
            FF340417672321542C3D0DA7C100E4FF00E4FF00E4FF00E4FF00E4FF06EAFF17
            FBFF15F4FF01DEF500D7EF00D5F006CFE762303086514FE0D1D1FDFDFDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF89ECFB00D0E900D0E900D5F001DEF50EF1FF07EDFE03
            E6FF00E4FF00E4FF00E4FF00E4FF0DA7C1340417BA86986B425220728B00E4FF
            00E4FF00E4FF00E4FF03E6FF0EF1FF1DFFFF0CEAFF01DAF500D7EF00D7EF347E
            8F70312FAD8887F4EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB
            00D0E900D5EA00DAF10CEAFF0EF1FF06EAFF00E6FF00E6FF00E6FF00E6FF1657
            69340417935B676B42522A51630DE1FF00E6FF00E6FF00E6FF06EAFF17FBFF1D
            FFFF04E2FB00DAF100D7EF06CFE762303086514FE0D1D1FDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D0E900D5EA00DAF106E4FB0FF5FF08
            F1FF00E9FF00E6FF00E6FF03E6FF112A333404176B42527D444629394B00E9FF
            00E6FF00E6FF00E9FF0EF1FF1DFFFF15F4FF01DEF500DAF100D7EF2F8C966F2E
            2CB08D8CF3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF
            0ED5EB00D5EA01DAEE01DEF50EF1FF0FF5FF07EDFE00E9FF00E9FF00E9FF0B01
            05340417542C3D66374B29394B0BBCD206EAFF00E9FF07EDFE16FFFF21FFFF06
            EAFF01DEF500DAF106D2E6623030814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D5EA00D9EA00DEF106EAFF10
            FAFF08F1FF01ECFF00E9FF06B7CA0B0105340417481529542C3D352B3E14819B
            00E9FF01ECFF0FF5FF21FFFF17FBFF01E3F800DEF100DEF12F8C9670312FAD88
            87F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E3FDFF05DAEA00D5EA01DAEE01E2F50FF5FF0EF8FF04F0FF01ECFF10636D0B01
            05340417450D1B4815293D172A235F7400E9FF04F0FF16FFFF21FFFF06EAFF01
            E2F500DEF101DAEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D9EA00D9EA00DEF107
            EDFE10FAFF07F4FF01EEF829394B0B0105340417340417450D1B340417352B3E
            01ECFF0EF8FF21FFFF16FFFF01E5F800E2F100DEF12F8C966F2E2CA7807FF0E9
            E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE3FDFF05DAEA00D9EA01DEEE01E6F50EF8FF10FAFF04F0FF0D12190B01
            050B010534041734041734041734041707F4FF16FFFF21FFFF07EDFE01E6F500
            DEF101DEEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF61EFF800D9EA00DEEA00
            E2F107EDFE11FFFF07F6FE0D12190B0105340417340417340417340417340417
            0BFBFF21FFFF16FFFF01EAF800E5F101DEEE25A4AA6F2E2CA7807FF0E9E9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE3FDFF05DEEA00DEEA01E1ED01E6F510FAFF0EFFFF0D12190B01
            050B010534041734041734041734041716FFFF21FFFF08F1FF01E6F500E2F101
            DEEE5D3A3A814846D3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700DEEA00
            DEEA00E5F108F1FF11FFFF10636D0B01050B01050B01050B01050B01052A5163
            21FFFF16FFFF01EAF800E5F101E1ED25A4AA6F2E2CA7807FF0E9E9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCEFCFE05E1EA00DEEA00E4EE01EAF50EFFFF0EFFFF112A
            330B01050B01050B01050D121918E9EB21FFFF07F4FF01EAF500E5F101E1ED54
            494A7B403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700
            E2EA00E2EA00E8F107F4FF11FFFF04FCFE04DAE3108D9D07C0CA0EFFFF21FFFF
            16FFFF01EEF800E8F100E5F125A4AA6F2E2CA27977F0E9E9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E2EA00E2EA00E4EE01EDF50EFFFF0EFF
            FF05F9FF01F8FF05F9FF16FFFF21FFFF07F6FE01EDF500E8F100E8F154494A7B
            403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53
            F2F600E2EA00E5EA00E8F107F6FE11FFFF09FFFF01F8FF09FFFF21FFFF16FFFF
            01F0F800ECF100ECF125A4AA6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E2EA00E8F101F1F311FF
            FF0EFFFF04FCFE16FFFF26FFFF05F9FF01EDF500E8F100ECF154494A7B403ED0
            BABAFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF46F3F500E5EA00E5EA00ECF10BFBFF16FFFF0EFFFF26FFFF1DFFFF01F5F7
            00ECF100ECF11CBBBD6F2E2C9D716FEDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E5EA00EBED01F5
            F721FFFF26FFFF3DFFFF09FFFF01F1F300ECF100ECF154494A7B403ECBB3B3F9
            F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF46F3F500E5EA00EBED01F1F321FFFF57FFFF3DFFFF03F9FC01F1F3
            01F1F31CBBBD6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9F7FE00EBED00EBED01F1
            F30EFFFF57FFFF1DFFFF01F5F701F1F301F1F34B565E814846D0BABAFBF9F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF46F3F500EBED01F1F304FCFE1DFFFF09FFFF01F5F701F5F7
            1CBBBD7D4446B89897F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE01F1F301F5
            F701F9FA09FFFF03FEFF01F9FA01F5F76C7A79BEA1A0F0E9E9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF90FEFE01F9FA01F9FA03FEFF03FEFF04FCFE76D7D7
            E4D9D9F9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FF
            FF16FFFF09FFFF16FFFFA4FFFFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          Proportional = True
          Transparent = True
          Visible = False
          Titulo = 'ALERTA - Conflito de Hor'#225'rio'
          Position = poBottomCenter
        end
        object umAjudaAvaliacao: TUMAjuda
          Left = 744
          Top = 53
          Picture.Data = {
            07544269746D6170F6060000424DF60600000000000036000000280000001800
            0000180000000100180000000000C0060000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6F4F4F4FAFAFA
            FCFCFCFEFEFEFEFEFEFCFCFCFAFAFAF4F4F4F6F6F6FCFCFCFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9EAEADD
            DDDDC7C5C4A8A294968F798D83698D8369968F79A8A294C7C5C4DDDDDDE9EAEA
            F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FEFBFBFBCDCCC996875F967523C0911AD6A422E5B22DE5B22DD6A422C0911A96
            752396875FCDCCC9FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC4BBADB1923DD0A321EBC03EE3BB3EDEB73FDCB442DCB4
            42DEB73FE3BB3EEBC03ED0A321B1923DC4BBADFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDACEABA87F06DFBB3DE0BD46D0A639C99732
            C59031C48E31C48E31C59031C99732D0A639E0BD46DFBB3DA87F06DACEABFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DAC19C7600DEC045D8B342C9
            9733C68F31C69031C38C28C0871FC0871FC38C28C69031C68F31C99733D8B342
            DEC0459C7600E1DAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB09341D6B8
            43D8B447CB9836C99234CB9537C38C27B78523BE9441BE9441B78523C38C27CB
            9537C99234CB9836D8B447D6B843B09341FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF
            D6C9A6B4921ADEBF53D1A13CCC9738CC9737D09D41BB800FD5BC86FFFFFFFFFF
            FFD5BC86BB8010D09D41CC9737CC9738D1A13CDEBF53B4921AD6C9A6FFFFFFFF
            FFFFFFFFFFFEFEFEAB903AD7B84DD9B24AD19F3ECE9B3BCE9B3AD1A043C08819
            D0B26EFBF9F4FCFAF5D0B16DC08717D1A043CE9B3ACE9B3BD19F3ED9B24AD7B8
            4DAB903AFEFEFEFFFFFFFFFFFFEFEADDA88516E0C05DDAB04BD3A23FD29E3DD2
            9E3ED3A041CB9630BF912CC7A14AC69F47C19435CD9938D3A040D29E3DD29E3D
            D3A23FDAB04BE0C05DA88516EFEADDFFFFFFFFFFFFE6DFCAB9982FE9CC77DEB8
            5FD9AD52D6A548D4A13FD7A647C78F1FD6B97DFFFFFFFFFFFFF0E8DCBF8C26D1
            9D37D5A343D6A548D9AD52DEB85FE9CC77B9982FE6DFCAFFFFFFFFFFFFE0D7BD
            C5A841EED27DE1BD66DFB762DDB25CDBAD56DCAE56DAAB4EC79636E8D9BEFFFF
            FFFFFFFFE1CDA5C28F27DBAD54DDB25CDFB762E1BD66EED27DC5A841E0D7BDFF
            FFFFFFFFFFDFD6BDCAAF51F2DB87E5C36BE2BC66E1B763DFB35FD3A23FD09C36
            CD982EC69738EEE3CFFFFFFFFFFFFFD9BB84D3A342E3BA69E2BC65E5C36BF2DB
            87CAAF51DFD6BDFFFFFFFFFFFFE5DDC8C9B25EF6E291E9CC74E7C46CE7C270D2
            A440D2B268DFC894CFAB5BCB9627CEA552FEFFFFFFFFFFEADCBCCD9E35E8C473
            E7C46CE9CC74F6E291C9B25EE5DDC8FFFFFFFFFFFFEEE9DBBEA658FAEAA3EED4
            7BEBCD76EDCD7BD3A73CEFE5CBFFFFFFF5EFE4CDA44BD8B974FFFFFFFFFFFFED
            E2C5D2A63CEDCD7BEBCD76EED47BFAEAA3BEA658EEE9DBFFFFFFFFFFFFFEFEFE
            B49D58F9EFBCF4DF8AEFD780F0D480E0BC58E1CB94FEFEFFFEFEFDFDFCFAFDFD
            FCFEFEFDFFFFFFE8D7AFDCB750F0D582EFD77FF4DF8AF9EFBCB49D58FEFEFEFF
            FFFFFFFFFFFFFFFFD6CAA6D1BE83FFF4BCF1DD84F2DB87F0D57BDCBD61F5EFE1
            FFFFFFFFFFFFFFFFFFFFFFFFF9F5EFDABD68EED277F2DB88F1DD83FFF4BCD1BE
            83D6CAA6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB69E5BFAF3D2F9ECADF4E18AF6
            E18EEED579E0C772ECE0BBF8F6ECF9F6EDEEE4C3E0C978E7CD6DF7E28FF3E08A
            F9ECADFAF3D2B69E5BFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D8BFAD93
            3FFFFFE8FBF0B9F6E694F7E591F4DF85E7D072DFC96CDFC96CE6CF72F3DD83F7
            E692F6E694FBF0B9FFFFE9AD933FE1D8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFD6CAA6AB903DFAF5DDFFFEDBFBF0B5F9ECA6F9EA9DF9E895F9E8
            95F9EA9DF9ECA6FBF0B6FFFEDBFAF5DDAB903DD6CAA6FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DBC3B7A160D4C699FDF9E4FFFFE5
            FFFFDEFFFFDBFFFFDBFFFFDEFFFFE5FDF9E4D6C79AB7A060E4DBC2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD5
            C9A4B19A57BEAA6DCFBF8BD6C798D6C798CFBF8BBEAB6EB19A56D5C8A3FEFEFD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFEFEBDDE7E0CBE0D6BBE0D6BBE7E0CBEFEBDDFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          Transparent = True
          Caption = 
            'Na sele'#231#227'o de avalia'#231#245'es s'#227'o apresentadas todas as avalia'#231#245'es in' +
            'stitucionais, configuradas por disciplina,'#13#10'que est'#227'o dispon'#237'vei' +
            's para serem respondidas pelos estudantes.'
          Titulo = 'Avalia'#231#227'o Institucional'
          PanelWidth = 550
          PanelHeight = 300
        end
        object cbHorarioAula1: TUMComboBox
          Left = 166
          Top = 22
          Width = 176
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbHorarioAula1Change
          TamanhoMaximo = 0
          SelecionarUnicoAutomatico = False
        end
        object rgPeriodicidade: TRadioGroup
          Left = 386
          Top = 14
          Width = 247
          Height = 33
          Caption = ' Periodicidade '
          Columns = 3
          Items.Strings = (
            'Manual'
            'Semanal'
            'Quinzenal')
          TabOrder = 4
          OnClick = rgPeriodicidadeClick
        end
        object cbHorarioAula2: TUMComboBox
          Left = 166
          Top = 57
          Width = 176
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnChange = cbHorarioAula1Change
          TamanhoMaximo = 0
          SelecionarUnicoAutomatico = False
        end
        object chkAI: TCheckBox
          Left = 386
          Top = 60
          Width = 61
          Height = 17
          Caption = 'Gerar AI'
          TabOrder = 5
          OnClick = chkAIClick
        end
        object dtpDataAula1: TUMDateTimePicker
          Left = 69
          Top = 22
          Width = 85
          Height = 21
          BevelOuter = bvNone
          TabOrder = 0
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          OnChangeDate = dtpDataAula1ChangeDate
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object dtpDataAula2: TUMDateTimePicker
          Left = 69
          Top = 57
          Width = 85
          Height = 21
          BevelOuter = bvNone
          TabOrder = 2
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          OnChangeDate = dtpDataAula2ChangeDate
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtAvaliacao: TMaskEdit
          Left = 453
          Top = 57
          Width = 97
          Height = 21
          EditMask = '!99/99/9999 00:00;1;_'
          MaxLength = 16
          TabOrder = 6
          Text = '  /  /       :  '
        end
        object cbAvaliacao: TUMComboBox
          Left = 556
          Top = 57
          Width = 182
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
          TamanhoMaximo = 0
          SelecionarUnicoAutomatico = False
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 177
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label39: TLabel
          Left = 8
          Top = 69
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Qtd. Aulas:'
        end
        object Label46: TLabel
          Left = 225
          Top = 43
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
        end
        object Label40: TLabel
          Left = 31
          Top = 17
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Curso:'
        end
        object SpeedButton5: TSpeedButton
          Left = 174
          Top = 13
          Width = 22
          Height = 21
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
          OnClick = sbBuscaCursoClick
        end
        object SpeedButton8: TSpeedButton
          Left = 399
          Top = 40
          Width = 23
          Height = 21
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
          OnClick = SpeedButton8Click
        end
        object Label41: TLabel
          Left = 241
          Top = 16
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object Label42: TLabel
          Left = 465
          Top = 16
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object Label38: TLabel
          Left = 701
          Top = 16
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor:'
        end
        object sbSubstituto: TSpeedButton
          Left = 667
          Top = 37
          Width = 23
          Height = 21
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
          OnClick = sbSubstitutoClick
        end
        object Label77: TLabel
          Left = 459
          Top = 40
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Substituto:'
        end
        object Label50: TLabel
          Left = 30
          Top = 43
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Grupo:'
        end
        object Label90: TLabel
          Left = 39
          Top = 95
          Width = 24
          Height = 13
          Caption = 'Sala:'
        end
        object sbFiltroSala: TSpeedButton
          Left = 174
          Top = 93
          Width = 22
          Height = 21
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
          OnClick = sbFiltroSalaClick
        end
        object sbLimparSala: TSpeedButton
          Left = 202
          Top = 92
          Width = 22
          Height = 21
          AllowAllUp = True
          Flat = True
          Glyph.Data = {
            46030000424D46030000000000003600000028000000120000000E0000000100
            18000000000010030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFDFDFCCCCCD36C6D9D95959FE5E6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFEFEFED0D0CA5A5A7F3130
            D43736ED2C2BD32B2B91868691CFD0CAF9FAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000FDFDFC9090A42423A93836F34544FF3A39E33A39E344
            43FF302EDE24239A3434419E9E9DF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            000081819F2D2CDF4544FF4342FF4241FF4543FF1F1E803635D24746FF4746FF
            19188454544A6F7072BBBBBBFBFCFBFFFFFFFFFFFFFFFFFF00007070A63E3DFF
            4241FF4342FF4342FF3635D82D2CB71D1D7A2B2AAA4342FB3D3CFF36366CEBEC
            E2A1A1A3616066C8C9C9FEFEFEFFFFFF0000C9CACB3C3BD54342FF3A39E02D2C
            B73737DA4544FF4342FE2A29A81A1A6E2E2DB22B2BC3B5B5C4FFFFFFEBEAEC8A
            8A8E88888AF4F5F50000FFFFFE8080BB2928D22F2EC94241FD4442FF4241FF42
            41FF4544FF4241FC302FBA11116B35354BFFFFFEFFFFFFFFFFFFD5D5D7A4A4A7
            0000FFFFFFF2F2F29191B45352D43C3BF83F3EFF4241FF4241FF4443FF4342FF
            3433F124249B83838DE8E8E6B1B1B4E5E5E6FFFFFF9595980000FFFFFFFFFFFF
            FFFFFFF6F6F5C1C1CF6A69BE4140E73C3BF92929C02A2A7B81809ADCDCD2FFFF
            FFFDFDFDD1D1D39898998B8B8D86868A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFDFDFDD9D9DC9797AB989897E4E4DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
            FAFA87888CCBCACC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF2F2F2D1D1D3C8C8C9DDDDDEF5F5F5D9D9DAAAAAADC2C1C4F9F9FAFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F2F2F2D6D6D7AFAFB2C3C3C5EAEAEAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
          OnClick = sbLimparSalaClick
        end
        object sbTurmaBuscaCronograma: TSpeedButton
          Left = 399
          Top = 13
          Width = 22
          Height = 21
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
          OnClick = sbTurmaBuscaCronogramaClick
        end
        object umAjudaTrocaProfessor: TUMAjuda
          Left = 429
          Top = 40
          Width = 22
          Height = 21
          Picture.Data = {
            07544269746D6170361B0000424D361B00000000000036000000280000003000
            0000300000000100180000000000001B0000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F6F4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EF
            EFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4
            EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF0E9E9CBB3B3AD8887A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7
            807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807F
            A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA780
            7FA7807FA7807FA7807FA7807FA7807FA7807FAD8887CBB3B3F0E9E9FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9E9B08D8C7D44466F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E
            2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F
            2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C7D4446B08D8CF0E9E9FFFFFFFFFFFFFFFFFFFFFFFFB2E8F751B7
            D22D88A3297A94297A94297A94297A94297A94297A94297A94297A94297A9429
            7A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94
            297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A
            94297A94297A94297A94297A944B565E6723216723216723217D4446CBB3B3F9
            F6F6FFFFFFFFFFFF6DDBF600ACD500A7D000A7D000A4CB00A4CB00A4CB00A4CB
            00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4
            CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00
            A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A7D000A7D000ABD500B2DB
            3776866723216723216F2E2CAD8887F3EEEEFFFFFFB9F7FE00B2DB00ACD500AC
            D500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500
            ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD5
            00ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500AC
            D500ACD500ACD500ACD500B2DB00B5DF00B5DF4B565E6723216B2826A27977F0
            E9E9FFFFFF6DDBF600B5DF00B2DB00B5DF00B8E200B8E200B8E200B8E200B8E2
            00B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8
            E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200
            B8E200B8E200B8E200B8E200B8E200B8E200B8E200BBE500BBE500B8E200B8E2
            00BBE52D88A367232170312FB89897F6F1F1FFFFFF3CD3F200B8E200B8E200BB
            E500BFE901C8F501CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801
            CBF801CBF801CBF801CBF801CBF8169ABB352B3E66374B896977347E8F01CBF8
            01CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CB
            F801CBF801C8F500C5EE00C1EC00BFE900BEE7169ABB6723217B403ED3BFBFFC
            FAFAFFFFFF89ECFB00B8E200BBE500BFE900C6F004D1FE02D2FF02D2FF02D2FF
            02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF14819B3404
            170B010534041766374BFFF3FF49738802D2FF02D2FF02D2FF02D2FF02D2FF02
            D2FF02D2FF02D2FF02D2FF02D2FF02D2FF06D5FF0AD8FF06D0FA00C5EE00C1EC
            00C1EC3776866B2826946462EDE4E4FFFFFFFFFFFFCEFCFE00BEE700BEE700C1
            EC00C6F006D5FF08DAFF00D4FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00
            D3FF00D3FF02D2FF02D2FF0D12190B0105340417340417E0ABC06B4252926B7C
            00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF03D5
            FF0DE1FF12E5FF01CBF800C6F000C5EE00C5EE54494A733433C1A5A4F9F6F6FF
            FFFFFFFFFFFFFFFF3CD3F200BEE700C2E800C6F006D0FA0DE1FF08DAFF00D5FF
            00D3FF00D4FF00D3FF00D3FF00D3FF00D4FF00D4FF00D3FF00D3FF0D12190B01
            05340417340417340417450D1B66374B02D2FF00D3FF00D4FF00D4FF00D3FF00
            D3FF00D3FF00D4FF00D3FF00D5FF06DDFF1AECFF0DE1FF01CDF500C9F000C5EE
            13ACCE6B25238C5856E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFA2EEFC00C2E800C2
            E800C5EE01CDF50BDEFF0BDEFF03D8FF00D5FF00D5FF00D4FF00D5FF00D5FF00
            D5FF00D5FF00D5FF00D3FF29394B0B01050B0105340417340417340417352B3E
            00D5FF00D5FF00D5FF00D5FF00D5FF00D5FF00D4FF00D5FF00D5FF03D8FF12E5
            FF1AF1FF06D5FF01CDF500C9F000C9F0416371733433B89897F6F1F1FFFFFFFF
            FFFFFFFFFFFFFFFFF8FEFF1CCCEE00C2E800C5E900C9F00AD8FF12E5FF06DDFF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF14819B0B01
            050B01050B01050B01053D172A14819B00D5FF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF06DDFF1AF1FF1AECFF02D1F800C9F000C9F00ABADA
            66292786514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89ECFB00C2
            E800C5E900CBEF02D1F812E5FF0DE1FF04DBFF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF03D6FA10758F3404170B01050B010516576900D7FF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF04DBFF12EBFF24F9
            FF0BDEFF01CDF500CBEF00C9F037768670312FB39190F5F0F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C5E900C9EB00CEF20BDEFF12EBFF
            0BDEFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00DAFF00DA
            FF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00
            DAFF00DAFF00DAFF07E4FF21F6FF21F6FF03D6FA00CEF200CBEF06C7E8623030
            86514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79EB
            FA00C9EB00C9EB00CBEF03D6FA12EBFF0CEAFF06DDFF00DAFF00DAFF00DAFF00
            DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF
            00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF06DDFF1AF1FF26FFFF0DE1
            FF00D3F500CEF200CEF2347E8F733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C9EB00CBEF00D2F20BDEFF
            12EBFF07E4FF02DCFF00DAFF00DDFF00DDFF00DAFF00DDFF00DDFF00DDFF00DA
            FF00DDFF20728B09C1E000DAFF00DDFF00DDFF00DDFF00DAFF00DDFF00DDFF00
            DAFF02DCFF0CEAFF22FAFF1AF1FF02D9F900D3F500CEF206C7E86230308C5856
            E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF89ECFB00CDE900C9EB00CEEE00D3F50CEAFF0CEAFF06E1FF00DDFF00DDFF00
            DDFF00DDFF00DDFF00DDFF00DDFF00DDFF02DCFF450D1B0DA7C100DDFF00DDFF
            00DDFF00DDFF00DDFF00DDFF00DDFF00DDFF06E1FF15F4FF21FFFF06E1FF00D3
            F500D2F200D2F2377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF1CD5F000CDE900CDE900D2F2
            06DDFF12EBFF03E6FF02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF00DE
            FF0ABADA450D1B14819B02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF02
            DFFF0CEAFF21FFFF1AF1FF02D9F900D2F200D2F209C1E0652D2C8C5856E0D1D1
            FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF89ECFB00CDE900CDE900D1EE01D6F50CEAFF0CEAFF07E4FF00E1FF00
            E1FF00DEFF00E1FF00E1FF00E1FF02DFFF108D9D450D1B235F7400DEFF00E1FF
            00E1FF00E1FF00DEFF00E1FF00E1FF07E4FF15F4FF21FFFF06E1FF01D6F500D2
            F200D5F0377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF17D6EF00CDE900D0E9
            00D5F004E2FB12EBFF06EAFF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1
            FF235F74611D1B352B3E00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF0C
            EAFF1DFFFF1AF1FF01DAF501D6F500D5F009C7E062303086514FE0D1D1FDFDFD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF89ECFB00D0E900CDE900D1EE01DAF50CEAFF0CEAFF03E6FF00
            E1FF00E4FF00E1FF00E1FF00E4FF00E4FF352B3E6A231C3D172A00E4FF00E4FF
            00E1FF00E1FF00E4FF00E1FF03E6FF0EF1FF1DFFFF06E1FF01DAF500D5F000D7
            EF377686733433B39190F5F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB00CDE9
            00D0E900D7EF07E4FF0EF1FF06EAFF00E4FF00E4FF00E4FF00E4FF00E4FF00E4
            FF340417672321542C3D0DA7C100E4FF00E4FF00E4FF00E4FF00E4FF06EAFF17
            FBFF15F4FF01DEF500D7EF00D5F006CFE762303086514FE0D1D1FDFDFDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF89ECFB00D0E900D0E900D5F001DEF50EF1FF07EDFE03
            E6FF00E4FF00E4FF00E4FF00E4FF0DA7C1340417BA86986B425220728B00E4FF
            00E4FF00E4FF00E4FF03E6FF0EF1FF1DFFFF0CEAFF01DAF500D7EF00D7EF347E
            8F70312FAD8887F4EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB
            00D0E900D5EA00DAF10CEAFF0EF1FF06EAFF00E6FF00E6FF00E6FF00E6FF1657
            69340417935B676B42522A51630DE1FF00E6FF00E6FF00E6FF06EAFF17FBFF1D
            FFFF04E2FB00DAF100D7EF06CFE762303086514FE0D1D1FDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D0E900D5EA00DAF106E4FB0FF5FF08
            F1FF00E9FF00E6FF00E6FF03E6FF112A333404176B42527D444629394B00E9FF
            00E6FF00E6FF00E9FF0EF1FF1DFFFF15F4FF01DEF500DAF100D7EF2F8C966F2E
            2CB08D8CF3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF
            0ED5EB00D5EA01DAEE01DEF50EF1FF0FF5FF07EDFE00E9FF00E9FF00E9FF0B01
            05340417542C3D66374B29394B0BBCD206EAFF00E9FF07EDFE16FFFF21FFFF06
            EAFF01DEF500DAF106D2E6623030814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D5EA00D9EA00DEF106EAFF10
            FAFF08F1FF01ECFF00E9FF06B7CA0B0105340417481529542C3D352B3E14819B
            00E9FF01ECFF0FF5FF21FFFF17FBFF01E3F800DEF100DEF12F8C9670312FAD88
            87F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E3FDFF05DAEA00D5EA01DAEE01E2F50FF5FF0EF8FF04F0FF01ECFF10636D0B01
            05340417450D1B4815293D172A235F7400E9FF04F0FF16FFFF21FFFF06EAFF01
            E2F500DEF101DAEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D9EA00D9EA00DEF107
            EDFE10FAFF07F4FF01EEF829394B0B0105340417340417450D1B340417352B3E
            01ECFF0EF8FF21FFFF16FFFF01E5F800E2F100DEF12F8C966F2E2CA7807FF0E9
            E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE3FDFF05DAEA00D9EA01DEEE01E6F50EF8FF10FAFF04F0FF0D12190B01
            050B010534041734041734041734041707F4FF16FFFF21FFFF07EDFE01E6F500
            DEF101DEEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF61EFF800D9EA00DEEA00
            E2F107EDFE11FFFF07F6FE0D12190B0105340417340417340417340417340417
            0BFBFF21FFFF16FFFF01EAF800E5F101DEEE25A4AA6F2E2CA7807FF0E9E9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE3FDFF05DEEA00DEEA01E1ED01E6F510FAFF0EFFFF0D12190B01
            050B010534041734041734041734041716FFFF21FFFF08F1FF01E6F500E2F101
            DEEE5D3A3A814846D3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700DEEA00
            DEEA00E5F108F1FF11FFFF10636D0B01050B01050B01050B01050B01052A5163
            21FFFF16FFFF01EAF800E5F101E1ED25A4AA6F2E2CA7807FF0E9E9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCEFCFE05E1EA00DEEA00E4EE01EAF50EFFFF0EFFFF112A
            330B01050B01050B01050D121918E9EB21FFFF07F4FF01EAF500E5F101E1ED54
            494A7B403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700
            E2EA00E2EA00E8F107F4FF11FFFF04FCFE04DAE3108D9D07C0CA0EFFFF21FFFF
            16FFFF01EEF800E8F100E5F125A4AA6F2E2CA27977F0E9E9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E2EA00E2EA00E4EE01EDF50EFFFF0EFF
            FF05F9FF01F8FF05F9FF16FFFF21FFFF07F6FE01EDF500E8F100E8F154494A7B
            403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53
            F2F600E2EA00E5EA00E8F107F6FE11FFFF09FFFF01F8FF09FFFF21FFFF16FFFF
            01F0F800ECF100ECF125A4AA6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E2EA00E8F101F1F311FF
            FF0EFFFF04FCFE16FFFF26FFFF05F9FF01EDF500E8F100ECF154494A7B403ED0
            BABAFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF46F3F500E5EA00E5EA00ECF10BFBFF16FFFF0EFFFF26FFFF1DFFFF01F5F7
            00ECF100ECF11CBBBD6F2E2C9D716FEDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E5EA00EBED01F5
            F721FFFF26FFFF3DFFFF09FFFF01F1F300ECF100ECF154494A7B403ECBB3B3F9
            F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF46F3F500E5EA00EBED01F1F321FFFF57FFFF3DFFFF03F9FC01F1F3
            01F1F31CBBBD6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9F7FE00EBED00EBED01F1
            F30EFFFF57FFFF1DFFFF01F5F701F1F301F1F34B565E814846D0BABAFBF9F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF46F3F500EBED01F1F304FCFE1DFFFF09FFFF01F5F701F5F7
            1CBBBD7D4446B89897F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE01F1F301F5
            F701F9FA09FFFF03FEFF01F9FA01F5F76C7A79BEA1A0F0E9E9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF90FEFE01F9FA01F9FA03FEFF03FEFF04FCFE76D7D7
            E4D9D9F9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FF
            FF16FFFF09FFFF16FFFFA4FFFFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          Proportional = True
          Transparent = True
          Visible = False
          Titulo = 'ALERTA - Troca de professor da turma'
          Position = poBottomCenter
        end
        object lbTipoDigitacao: TLabel
          Left = 518
          Top = 85
          Width = 85
          Height = 13
          Caption = 'Tipo de digita'#231#227'o:'
          Enabled = False
        end
        object edQtdAulas: TEdit
          Left = 69
          Top = 66
          Width = 55
          Height = 21
          TabOrder = 5
          Text = '12'
          OnChange = edQtdAulasChange
          OnKeyPress = edQtdAulasKeyPress
        end
        object UpDown2: TUpDown
          Left = 124
          Top = 66
          Width = 16
          Height = 21
          Associate = edQtdAulas
          ArrowKeys = False
          Min = 1
          Position = 12
          TabOrder = 6
        end
        object txtCronogramasProfessor: TEdit
          Left = 281
          Top = 40
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object txtCronogramasCurso: TEdit
          Left = 69
          Top = 13
          Width = 106
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 0
        end
        object ckbChecarConflitos: TCheckBox
          Left = 281
          Top = 68
          Width = 179
          Height = 17
          Caption = 'Checar conflitos de Professores'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object ckConfirmado: TCheckBox
          Left = 281
          Top = 111
          Width = 80
          Height = 17
          Caption = 'Confirmado'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 9
        end
        object cbDisciplinas: TUMComboBox
          Left = 518
          Top = 13
          Width = 172
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbDisciplinasChange
          TamanhoMaximo = 0
          SelecionarUnicoAutomatico = False
        end
        object edmValor: TUMEditMonetario
          Left = 735
          Top = 13
          Width = 68
          Height = 21
          TabOrder = 10
          Text = '0'
          Mascara = '###,###,##0.00'
          CasasDecimais = 2
          EnterProximoCampo = True
        end
        object ckbCriaProvaUltimaAula: TCheckBox
          Left = 517
          Top = 64
          Width = 144
          Height = 17
          Caption = 'Prova na '#250'ltima aula'
          TabOrder = 8
          OnClick = ckbCriaProvaUltimaAulaClick
        end
        object txtSubstituto: TEdit
          Left = 518
          Top = 37
          Width = 150
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object cbGrupos: TUMComboBox
          Left = 69
          Top = 40
          Width = 127
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = cbGruposChange
          TamanhoMaximo = 0
          SelecionarUnicoAutomatico = False
        end
        object edNomeSala: TEdit
          Left = 69
          Top = 92
          Width = 106
          Height = 21
          ReadOnly = True
          TabOrder = 11
        end
        object ckbChecarConflitosSalas: TCheckBox
          Left = 281
          Top = 91
          Width = 195
          Height = 17
          Caption = 'Checar conflitos de Salas e Hor'#225'rios'
          Checked = True
          State = cbChecked
          TabOrder = 12
        end
        object txtCronogramaTurma: TEdit
          Left = 281
          Top = 13
          Width = 112
          Height = 21
          TabOrder = 13
          OnChange = txtCronogramaTurmaChange
        end
        object pnEtapaCoord: TPanel
          Left = 3
          Top = 130
          Width = 319
          Height = 34
          BevelOuter = bvNone
          TabOrder = 14
          DesignSize = (
            319
            34)
          object umAjuda: TUMAjuda
            Left = 281
            Top = 5
            Picture.Data = {
              07544269746D6170F6060000424DF60600000000000036000000280000001800
              0000180000000100180000000000C0060000C40E0000C40E0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6F4F4F4FAFAFA
              FCFCFCFEFEFEFEFEFEFCFCFCFAFAFAF4F4F4F6F6F6FCFCFCFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9EAEADD
              DDDDC7C5C4A8A294968F798D83698D8369968F79A8A294C7C5C4DDDDDDE9EAEA
              F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
              FEFBFBFBCDCCC996875F967523C0911AD6A422E5B22DE5B22DD6A422C0911A96
              752396875FCDCCC9FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFC4BBADB1923DD0A321EBC03EE3BB3EDEB73FDCB442DCB4
              42DEB73FE3BB3EEBC03ED0A321B1923DC4BBADFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFDACEABA87F06DFBB3DE0BD46D0A639C99732
              C59031C48E31C48E31C59031C99732D0A639E0BD46DFBB3DA87F06DACEABFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DAC19C7600DEC045D8B342C9
              9733C68F31C69031C38C28C0871FC0871FC38C28C69031C68F31C99733D8B342
              DEC0459C7600E1DAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB09341D6B8
              43D8B447CB9836C99234CB9537C38C27B78523BE9441BE9441B78523C38C27CB
              9537C99234CB9836D8B447D6B843B09341FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF
              D6C9A6B4921ADEBF53D1A13CCC9738CC9737D09D41BB800FD5BC86FFFFFFFFFF
              FFD5BC86BB8010D09D41CC9737CC9738D1A13CDEBF53B4921AD6C9A6FFFFFFFF
              FFFFFFFFFFFEFEFEAB903AD7B84DD9B24AD19F3ECE9B3BCE9B3AD1A043C08819
              D0B26EFBF9F4FCFAF5D0B16DC08717D1A043CE9B3ACE9B3BD19F3ED9B24AD7B8
              4DAB903AFEFEFEFFFFFFFFFFFFEFEADDA88516E0C05DDAB04BD3A23FD29E3DD2
              9E3ED3A041CB9630BF912CC7A14AC69F47C19435CD9938D3A040D29E3DD29E3D
              D3A23FDAB04BE0C05DA88516EFEADDFFFFFFFFFFFFE6DFCAB9982FE9CC77DEB8
              5FD9AD52D6A548D4A13FD7A647C78F1FD6B97DFFFFFFFFFFFFF0E8DCBF8C26D1
              9D37D5A343D6A548D9AD52DEB85FE9CC77B9982FE6DFCAFFFFFFFFFFFFE0D7BD
              C5A841EED27DE1BD66DFB762DDB25CDBAD56DCAE56DAAB4EC79636E8D9BEFFFF
              FFFFFFFFE1CDA5C28F27DBAD54DDB25CDFB762E1BD66EED27DC5A841E0D7BDFF
              FFFFFFFFFFDFD6BDCAAF51F2DB87E5C36BE2BC66E1B763DFB35FD3A23FD09C36
              CD982EC69738EEE3CFFFFFFFFFFFFFD9BB84D3A342E3BA69E2BC65E5C36BF2DB
              87CAAF51DFD6BDFFFFFFFFFFFFE5DDC8C9B25EF6E291E9CC74E7C46CE7C270D2
              A440D2B268DFC894CFAB5BCB9627CEA552FEFFFFFFFFFFEADCBCCD9E35E8C473
              E7C46CE9CC74F6E291C9B25EE5DDC8FFFFFFFFFFFFEEE9DBBEA658FAEAA3EED4
              7BEBCD76EDCD7BD3A73CEFE5CBFFFFFFF5EFE4CDA44BD8B974FFFFFFFFFFFFED
              E2C5D2A63CEDCD7BEBCD76EED47BFAEAA3BEA658EEE9DBFFFFFFFFFFFFFEFEFE
              B49D58F9EFBCF4DF8AEFD780F0D480E0BC58E1CB94FEFEFFFEFEFDFDFCFAFDFD
              FCFEFEFDFFFFFFE8D7AFDCB750F0D582EFD77FF4DF8AF9EFBCB49D58FEFEFEFF
              FFFFFFFFFFFFFFFFD6CAA6D1BE83FFF4BCF1DD84F2DB87F0D57BDCBD61F5EFE1
              FFFFFFFFFFFFFFFFFFFFFFFFF9F5EFDABD68EED277F2DB88F1DD83FFF4BCD1BE
              83D6CAA6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB69E5BFAF3D2F9ECADF4E18AF6
              E18EEED579E0C772ECE0BBF8F6ECF9F6EDEEE4C3E0C978E7CD6DF7E28FF3E08A
              F9ECADFAF3D2B69E5BFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D8BFAD93
              3FFFFFE8FBF0B9F6E694F7E591F4DF85E7D072DFC96CDFC96CE6CF72F3DD83F7
              E692F6E694FBF0B9FFFFE9AD933FE1D8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFD6CAA6AB903DFAF5DDFFFEDBFBF0B5F9ECA6F9EA9DF9E895F9E8
              95F9EA9DF9ECA6FBF0B6FFFEDBFAF5DDAB903DD6CAA6FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DBC3B7A160D4C699FDF9E4FFFFE5
              FFFFDEFFFFDBFFFFDBFFFFDEFFFFE5FDF9E4D6C79AB7A060E4DBC2FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD5
              C9A4B19A57BEAA6DCFBF8BD6C798D6C798CFBF8BBEAB6EB19A56D5C8A3FEFEFD
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFEFEBDDE7E0CBE0D6BBE0D6BBE7E0CBEFEBDDFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
            Caption = 
              'Atrav'#233's deste campo '#233' poss'#237'vel criar cronogramas para etapas esp' +
              'ecificas.'#13#10'Por padr'#227'o o cronograma ser'#225' criado sempre para a eta' +
              'pa 1.'
            Titulo = 'Etapa'
            PanelWidth = 550
            PanelHeight = 300
          end
          object Label91: TLabel
            Left = 5
            Top = 13
            Width = 220
            Height = 13
            Alignment = taCenter
            Caption = 'Per'#237'odo de Avalia'#231#227'o (Bimestre, Trimestre...):'
          end
          object upDownEtapa: TUpDown
            Left = 257
            Top = 8
            Width = 15
            Height = 21
            Anchors = [akLeft, akBottom]
            Min = 1
            Max = 50
            Position = 1
            TabOrder = 0
            OnChangingEx = upDownEtapaChangingEx
          end
          object edBimestre: TEdit
            Left = 228
            Top = 8
            Width = 26
            Height = 21
            Anchors = [akLeft, akBottom]
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 1
            Text = '1'
          end
        end
        object cbTipoDigitacao: TUMComboBox
          Left = 518
          Top = 104
          Width = 145
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 15
          TamanhoMaximo = 0
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 522
        Width = 816
        Height = 64
        Align = alBottom
        TabOrder = 3
        object Label51: TLabel
          Left = 2
          Top = 10
          Width = 100
          Height = 13
          Caption = 'Data inicial do Di'#225'rio:'
        end
        object Label52: TLabel
          Left = 226
          Top = 10
          Width = 95
          Height = 13
          Caption = 'Data final do Di'#225'rio:'
        end
        object lbAvisoPrazoCronograma: TLabel
          AlignWithMargins = True
          Left = 2
          Top = 33
          Width = 791
          Height = 26
          Caption = 
            'Identificamos que o prazo do cronograma que est'#225' sendo alterado ' +
            'possui outras disciplinas vinculados a ele, essa altera'#231#227'o ir'#225' m' +
            'odificar os prazos das outras disciplinas vinculadas, favor veri' +
            'ficar em "Secretaria > Di'#225'rio de Classe > Prazos do Di'#225'rio de Cl' +
            'asse".'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = 13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object umdtInicioDiario: TUMDateTimePicker
          Left = 114
          Top = 6
          Width = 85
          Height = 21
          BevelOuter = bvNone
          TabOrder = 0
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          OnChangeDate = umdtInicioDiarioChangeDate
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = True
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtFimDiario: TUMDateTimePicker
          Left = 327
          Top = 6
          Width = 85
          Height = 21
          BevelOuter = bvNone
          TabOrder = 1
          ImgBotaoCalendario.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
            D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
            C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
            A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
            3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
            D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
            97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
            BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
            F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
            E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
            81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
            ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
            D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
            BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
            FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
            ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
            D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
            F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
            DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
            49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
            ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
            83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
            287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
            E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
            9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
          OnChangeDate = umdtFimDiarioChangeDate
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = True
          MostraCalenadarioDesdeCampoTexto = False
        end
      end
      object sbAulas: TScrollBox
        Left = 0
        Top = 278
        Width = 816
        Height = 227
        Align = alCustom
        TabOrder = 2
        object umAjudaModeloHorarios: TUMAjuda
          Left = 776
          Top = 7
          Width = 22
          Height = 21
          Picture.Data = {
            07544269746D6170361B0000424D361B00000000000036000000280000003000
            0000300000000100180000000000001B0000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F6F4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EF
            EFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4
            EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEFF4EFEF
            F4EFEFF4EFEFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF0E9E9CBB3B3AD8887A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7
            807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807F
            A7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA7807FA780
            7FA7807FA7807FA7807FA7807FA7807FA7807FAD8887CBB3B3F0E9E9FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9E9B08D8C7D44466F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E
            2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F
            2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C6F2E2C
            6F2E2C6F2E2C7D4446B08D8CF0E9E9FFFFFFFFFFFFFFFFFFFFFFFFB2E8F751B7
            D22D88A3297A94297A94297A94297A94297A94297A94297A94297A94297A9429
            7A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94
            297A94297A94297A94297A94297A94297A94297A94297A94297A94297A94297A
            94297A94297A94297A94297A944B565E6723216723216723217D4446CBB3B3F9
            F6F6FFFFFFFFFFFF6DDBF600ACD500A7D000A7D000A4CB00A4CB00A4CB00A4CB
            00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4
            CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00
            A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A4CB00A7D000A7D000ABD500B2DB
            3776866723216723216F2E2CAD8887F3EEEEFFFFFFB9F7FE00B2DB00ACD500AC
            D500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500
            ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD5
            00ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500ACD500AC
            D500ACD500ACD500ACD500B2DB00B5DF00B5DF4B565E6723216B2826A27977F0
            E9E9FFFFFF6DDBF600B5DF00B2DB00B5DF00B8E200B8E200B8E200B8E200B8E2
            00B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8
            E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200B8E200
            B8E200B8E200B8E200B8E200B8E200B8E200B8E200BBE500BBE500B8E200B8E2
            00BBE52D88A367232170312FB89897F6F1F1FFFFFF3CD3F200B8E200B8E200BB
            E500BFE901C8F501CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801
            CBF801CBF801CBF801CBF801CBF8169ABB352B3E66374B896977347E8F01CBF8
            01CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CBF801CB
            F801CBF801C8F500C5EE00C1EC00BFE900BEE7169ABB6723217B403ED3BFBFFC
            FAFAFFFFFF89ECFB00B8E200BBE500BFE900C6F004D1FE02D2FF02D2FF02D2FF
            02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF02D2FF14819B3404
            170B010534041766374BFFF3FF49738802D2FF02D2FF02D2FF02D2FF02D2FF02
            D2FF02D2FF02D2FF02D2FF02D2FF02D2FF06D5FF0AD8FF06D0FA00C5EE00C1EC
            00C1EC3776866B2826946462EDE4E4FFFFFFFFFFFFCEFCFE00BEE700BEE700C1
            EC00C6F006D5FF08DAFF00D4FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00
            D3FF00D3FF02D2FF02D2FF0D12190B0105340417340417E0ABC06B4252926B7C
            00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF00D3FF03D5
            FF0DE1FF12E5FF01CBF800C6F000C5EE00C5EE54494A733433C1A5A4F9F6F6FF
            FFFFFFFFFFFFFFFF3CD3F200BEE700C2E800C6F006D0FA0DE1FF08DAFF00D5FF
            00D3FF00D4FF00D3FF00D3FF00D3FF00D4FF00D4FF00D3FF00D3FF0D12190B01
            05340417340417340417450D1B66374B02D2FF00D3FF00D4FF00D4FF00D3FF00
            D3FF00D3FF00D4FF00D3FF00D5FF06DDFF1AECFF0DE1FF01CDF500C9F000C5EE
            13ACCE6B25238C5856E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFA2EEFC00C2E800C2
            E800C5EE01CDF50BDEFF0BDEFF03D8FF00D5FF00D5FF00D4FF00D5FF00D5FF00
            D5FF00D5FF00D5FF00D3FF29394B0B01050B0105340417340417340417352B3E
            00D5FF00D5FF00D5FF00D5FF00D5FF00D5FF00D4FF00D5FF00D5FF03D8FF12E5
            FF1AF1FF06D5FF01CDF500C9F000C9F0416371733433B89897F6F1F1FFFFFFFF
            FFFFFFFFFFFFFFFFF8FEFF1CCCEE00C2E800C5E900C9F00AD8FF12E5FF06DDFF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF14819B0B01
            050B01050B01050B01053D172A14819B00D5FF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF06DDFF1AF1FF1AECFF02D1F800C9F000C9F00ABADA
            66292786514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89ECFB00C2
            E800C5E900CBEF02D1F812E5FF0DE1FF04DBFF00D7FF00D7FF00D7FF00D7FF00
            D7FF00D7FF00D7FF00D7FF03D6FA10758F3404170B01050B010516576900D7FF
            00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF04DBFF12EBFF24F9
            FF0BDEFF01CDF500CBEF00C9F037768670312FB39190F5F0F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C5E900C9EB00CEF20BDEFF12EBFF
            0BDEFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00DAFF00DA
            FF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00D7FF00DAFF00DAFF00
            DAFF00DAFF00DAFF07E4FF21F6FF21F6FF03D6FA00CEF200CBEF06C7E8623030
            86514FE0D1D1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79EB
            FA00C9EB00C9EB00CBEF03D6FA12EBFF0CEAFF06DDFF00DAFF00DAFF00DAFF00
            DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF
            00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF00DAFF06DDFF1AF1FF26FFFF0DE1
            FF00D3F500CEF200CEF2347E8F733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ECDED00C9EB00CBEF00D2F20BDEFF
            12EBFF07E4FF02DCFF00DAFF00DDFF00DDFF00DAFF00DDFF00DDFF00DDFF00DA
            FF00DDFF20728B09C1E000DAFF00DDFF00DDFF00DDFF00DAFF00DDFF00DDFF00
            DAFF02DCFF0CEAFF22FAFF1AF1FF02D9F900D3F500CEF206C7E86230308C5856
            E4D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF89ECFB00CDE900C9EB00CEEE00D3F50CEAFF0CEAFF06E1FF00DDFF00DDFF00
            DDFF00DDFF00DDFF00DDFF00DDFF00DDFF02DCFF450D1B0DA7C100DDFF00DDFF
            00DDFF00DDFF00DDFF00DDFF00DDFF00DDFF06E1FF15F4FF21FFFF06E1FF00D3
            F500D2F200D2F2377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF1CD5F000CDE900CDE900D2F2
            06DDFF12EBFF03E6FF02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF00DE
            FF0ABADA450D1B14819B02DFFF00DEFF00DEFF00DEFF00DEFF00DEFF00DEFF02
            DFFF0CEAFF21FFFF1AF1FF02D9F900D2F200D2F209C1E0652D2C8C5856E0D1D1
            FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF89ECFB00CDE900CDE900D1EE01D6F50CEAFF0CEAFF07E4FF00E1FF00
            E1FF00DEFF00E1FF00E1FF00E1FF02DFFF108D9D450D1B235F7400DEFF00E1FF
            00E1FF00E1FF00DEFF00E1FF00E1FF07E4FF15F4FF21FFFF06E1FF01D6F500D2
            F200D5F0377686733433B89897F6F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF17D6EF00CDE900D0E9
            00D5F004E2FB12EBFF06EAFF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1
            FF235F74611D1B352B3E00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF00E1FF0C
            EAFF1DFFFF1AF1FF01DAF501D6F500D5F009C7E062303086514FE0D1D1FDFDFD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF89ECFB00D0E900CDE900D1EE01DAF50CEAFF0CEAFF03E6FF00
            E1FF00E4FF00E1FF00E1FF00E4FF00E4FF352B3E6A231C3D172A00E4FF00E4FF
            00E1FF00E1FF00E4FF00E1FF03E6FF0EF1FF1DFFFF06E1FF01DAF500D5F000D7
            EF377686733433B39190F5F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB00CDE9
            00D0E900D7EF07E4FF0EF1FF06EAFF00E4FF00E4FF00E4FF00E4FF00E4FF00E4
            FF340417672321542C3D0DA7C100E4FF00E4FF00E4FF00E4FF00E4FF06EAFF17
            FBFF15F4FF01DEF500D7EF00D5F006CFE762303086514FE0D1D1FDFDFDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF89ECFB00D0E900D0E900D5F001DEF50EF1FF07EDFE03
            E6FF00E4FF00E4FF00E4FF00E4FF0DA7C1340417BA86986B425220728B00E4FF
            00E4FF00E4FF00E4FF03E6FF0EF1FF1DFFFF0CEAFF01DAF500D7EF00D7EF347E
            8F70312FAD8887F4EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF0ED5EB
            00D0E900D5EA00DAF10CEAFF0EF1FF06EAFF00E6FF00E6FF00E6FF00E6FF1657
            69340417935B676B42522A51630DE1FF00E6FF00E6FF00E6FF06EAFF17FBFF1D
            FFFF04E2FB00DAF100D7EF06CFE762303086514FE0D1D1FDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D0E900D5EA00DAF106E4FB0FF5FF08
            F1FF00E9FF00E6FF00E6FF03E6FF112A333404176B42527D444629394B00E9FF
            00E6FF00E6FF00E9FF0EF1FF1DFFFF15F4FF01DEF500DAF100D7EF2F8C966F2E
            2CB08D8CF3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FDFF
            0ED5EB00D5EA01DAEE01DEF50EF1FF0FF5FF07EDFE00E9FF00E9FF00E9FF0B01
            05340417542C3D66374B29394B0BBCD206EAFF00E9FF07EDFE16FFFF21FFFF06
            EAFF01DEF500DAF106D2E6623030814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D5EA00D9EA00DEF106EAFF10
            FAFF08F1FF01ECFF00E9FF06B7CA0B0105340417481529542C3D352B3E14819B
            00E9FF01ECFF0FF5FF21FFFF17FBFF01E3F800DEF100DEF12F8C9670312FAD88
            87F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E3FDFF05DAEA00D5EA01DAEE01E2F50FF5FF0EF8FF04F0FF01ECFF10636D0B01
            05340417450D1B4815293D172A235F7400E9FF04F0FF16FFFF21FFFF06EAFF01
            E2F500DEF101DAEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74EFFA00D9EA00D9EA00DEF107
            EDFE10FAFF07F4FF01EEF829394B0B0105340417340417450D1B340417352B3E
            01ECFF0EF8FF21FFFF16FFFF01E5F800E2F100DEF12F8C966F2E2CA7807FF0E9
            E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE3FDFF05DAEA00D9EA01DEEE01E6F50EF8FF10FAFF04F0FF0D12190B01
            050B010534041734041734041734041707F4FF16FFFF21FFFF07EDFE01E6F500
            DEF101DEEE5D3A3A814846D9C8C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF61EFF800D9EA00DEEA00
            E2F107EDFE11FFFF07F6FE0D12190B0105340417340417340417340417340417
            0BFBFF21FFFF16FFFF01EAF800E5F101DEEE25A4AA6F2E2CA7807FF0E9E9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE3FDFF05DEEA00DEEA01E1ED01E6F510FAFF0EFFFF0D12190B01
            050B010534041734041734041734041716FFFF21FFFF08F1FF01E6F500E2F101
            DEEE5D3A3A814846D3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700DEEA00
            DEEA00E5F108F1FF11FFFF10636D0B01050B01050B01050B01050B01052A5163
            21FFFF16FFFF01EAF800E5F101E1ED25A4AA6F2E2CA7807FF0E9E9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCEFCFE05E1EA00DEEA00E4EE01EAF50EFFFF0EFFFF112A
            330B01050B01050B01050D121918E9EB21FFFF07F4FF01EAF500E5F101E1ED54
            494A7B403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DEFF700
            E2EA00E2EA00E8F107F4FF11FFFF04FCFE04DAE3108D9D07C0CA0EFFFF21FFFF
            16FFFF01EEF800E8F100E5F125A4AA6F2E2CA27977F0E9E9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E2EA00E2EA00E4EE01EDF50EFFFF0EFF
            FF05F9FF01F8FF05F9FF16FFFF21FFFF07F6FE01EDF500E8F100E8F154494A7B
            403ED3BFBFFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53
            F2F600E2EA00E5EA00E8F107F6FE11FFFF09FFFF01F8FF09FFFF21FFFF16FFFF
            01F0F800ECF100ECF125A4AA6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E2EA00E8F101F1F311FF
            FF0EFFFF04FCFE16FFFF26FFFF05F9FF01EDF500E8F100ECF154494A7B403ED0
            BABAFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF46F3F500E5EA00E5EA00ECF10BFBFF16FFFF0EFFFF26FFFF1DFFFF01F5F7
            00ECF100ECF11CBBBD6F2E2C9D716FEDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE00E5EA00E5EA00EBED01F5
            F721FFFF26FFFF3DFFFF09FFFF01F1F300ECF100ECF154494A7B403ECBB3B3F9
            F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF46F3F500E5EA00EBED01F1F321FFFF57FFFF3DFFFF03F9FC01F1F3
            01F1F31CBBBD6F2E2C9E7271EDE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9F7FE00EBED00EBED01F1
            F30EFFFF57FFFF1DFFFF01F5F701F1F301F1F34B565E814846D0BABAFBF9F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF46F3F500EBED01F1F304FCFE1DFFFF09FFFF01F5F701F5F7
            1CBBBD7D4446B89897F3EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFCFE01F1F301F5
            F701F9FA09FFFF03FEFF01F9FA01F5F76C7A79BEA1A0F0E9E9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF90FEFE01F9FA01F9FA03FEFF03FEFF04FCFE76D7D7
            E4D9D9F9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FF
            FF16FFFF09FFFF16FFFFA4FFFFF9F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          Proportional = True
          Transparent = True
          Visible = False
          Titulo = 'ALERTA - Conflito de Hor'#225'rio'
          Position = poBottomCenter
        end
        object pnOrientacaoTopo: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 1
          Align = alTop
          TabOrder = 0
        end
      end
    end
  end
  object ImageList2: TImageList
    Left = 382
    Top = 182
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      0000737373000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      8400000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      84008484840073737300000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      840073737300737373000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      8400848484007373730000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      0000737373007373730000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      0000737373007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F700848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000E3FF000000000000
      83FF000000000000000F000000000000003F000000000000002F000000000000
      000F000000000000000F00000000000000010000000000000001000000000000
      0001000000000000000F000000000000000F000000000000002F000000000000
      803F000000000000E3FF000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FFFFF
      E00FF870F21FF9FFCFC7F800E40FF0FF87E3FA10C203F0FFA3F3FA108603E07F
      31F9F8008C01C07F38F980019001843F3C79801380211E3F3E3980138001FE1F
      3F198013C063FF1F9F8B801FF18FFF8F8FC3801FFE01FFC7C7E7801FFF07FFE3
      E00F801FFF8FFFF8F83FFFFFFFFFFFFFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 454
    Top = 182
  end
  object qyAux2: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 350
    Top = 254
  end
  object qyAux3: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 430
    Top = 182
  end
  object qyCompl: TUMZQuery
    Connection = DM.db
    AfterOpen = qyComplAfterOpen
    SQL.Strings = (
      
        'SELECT * FROM diario_ajustes_turmas WHERE cd_ajuste_turma  = :cd' +
        '_ajuste_turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_ajuste_turma'
        ParamType = ptUnknown
        Value = '1'
      end>
    Left = 478
    Top = 182
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_ajuste_turma'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qyComplCD_AJUSTE_TURMA: TLargeintField
      FieldName = 'CD_AJUSTE_TURMA'
    end
    object qyComplCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Size = 50
    end
    object qyComplNR_ANOSEM: TLargeintField
      FieldName = 'NR_ANOSEM'
    end
    object qyComplNR_ETAPA: TLargeintField
      FieldName = 'NR_ETAPA'
    end
    object qyComplCD_AJUSTE: TLargeintField
      FieldName = 'CD_AJUSTE'
    end
  end
  object dsComplemento: TDataSource
    DataSet = qyCompl
    Left = 606
    Top = 182
  end
  object qyAjuste: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * FROM diario_ajustes')
    Params = <>
    Left = 502
    Top = 182
    object qyAjusteds_ajuste: TStringField
      FieldName = 'ds_ajuste'
      Origin = 'WMESTRE12.diario_ajustes.ds_ajuste'
      Size = 100
    end
    object qyAjusteCD_AJUSTE: TLargeintField
      FieldName = 'CD_AJUSTE'
    end
  end
  object dsAjuste: TDataSource
    DataSet = qyAjuste
    Left = 582
    Top = 182
  end
  object qCronograma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from diario_cronogramas')
    Params = <>
    Left = 320
    Top = 254
    object qCronogramaCD_CRONOGRAMA: TLargeintField
      FieldName = 'CD_CRONOGRAMA'
    end
    object qCronogramaTURMA: TStringField
      FieldName = 'TURMA'
      Size = 50
    end
    object qCronogramaANOSEMESTRE: TIntegerField
      FieldName = 'ANOSEMESTRE'
    end
    object qCronogramaDISCIPLINA: TLargeintField
      FieldName = 'DISCIPLINA'
    end
    object qCronogramaDT_CRONOGRAMA: TDateField
      FieldName = 'DT_CRONOGRAMA'
    end
    object qCronogramaDS_SALA: TStringField
      FieldName = 'DS_SALA'
      Size = 255
    end
    object qCronogramaCD_PROFESSOR: TLargeintField
      FieldName = 'CD_PROFESSOR'
    end
    object qCronogramaDS_CONTEUDO: TMemoField
      FieldName = 'DS_CONTEUDO'
      BlobType = ftMemo
    end
    object qCronogramaSN_CONFIRMADO: TSmallintField
      FieldName = 'SN_CONFIRMADO'
    end
    object qCronogramaNR_VALOR: TFloatField
      FieldName = 'NR_VALOR'
    end
    object qCronogramaCD_HORARIO: TLargeintField
      FieldName = 'CD_HORARIO'
    end
    object qCronogramacd_prof_substituto: TIntegerField
      FieldName = 'cd_prof_substituto'
    end
    object qCronogramacd_grupo: TIntegerField
      FieldName = 'cd_grupo'
    end
    object qCronogramacd_sala: TLargeintField
      FieldName = 'cd_sala'
    end
    object qCronogramabimestre: TSmallintField
      FieldName = 'bimestre'
    end
  end
  object dsCronograma: TDataSource
    DataSet = qCronograma
    Left = 552
    Top = 182
  end
  object qCronogramaCompleto: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 528
    Top = 182
  end
  object qyNovaAula: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'SELECT :concat, :turma, :anosemestre, :disciplina, :bimestre FRO' +
        'M DUAL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'concat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=SELECT (MAX(nro_aula)+1) as novaaula FROM diario_aulas WH' +
        'ERE UPPER(turma) || anosemestre || disciplina || bimestre = :con' +
        'cat %s GROUP BY UPPER(turma) || anosemestre || disciplina || bim' +
        'estre'
      
        'mysql-5=SELECT (MAX(nro_aula)+1) as novaaula FROM diario_aulas W' +
        'HERE turma LIKE :turma AND anosemestre = :anosemestre AND discip' +
        'lina = :disciplina AND bimestre = :bimestre %s')
    Left = 12
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'concat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bimestre'
        ParamType = ptUnknown
      end>
  end
  object qyInsereAulaDados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO diario_aulas ('
      
        #9'turma, anosemestre, disciplina, bimestre, nro_aula, data, qtd_a' +
        'ulas, sn_bloqueado, cd_professor, conteudo,'
      
        #9'me_material_aula,me_transporte, me_local_aula,me_hospedagem, me' +
        '_gerenc_prof,me_gerenc_gest, dt_envio,me_observacao,'
      
        #9'cd_situacao_material_aula, cd_situacao_transporte, cd_situacao_' +
        'local_aula, cd_situacao_hospedagem,'
      #9'cd_situacao_gerenc_prof, cd_situacao_gerenc_gest,'
      #9'vl_total_transporte, nr_quilometragem, vl_km,'
      #9'nr_qtd_diarias_material, vl_diaria_material, vl_total_material,'
      
        #9'nr_qtd_diarias_hospedagem, vl_diaria_hospedagem, vl_total_hospe' +
        'dagem,'
      
        #9'nr_qtd_diarias_local, vl_diaria_local, vl_total_local, cd_grupo' +
        ', sn_aula_compartilhada, cd_aula_tipo,cd_situacao'
      ') VALUES ('
      
        #9':turma, :anosemestre, :disciplina, :b, :nro_aula, :data, :qtd_a' +
        'ulas, :bloq, :professor, :conteudo, :me_material_aula, :me_trans' +
        'porte,'
      
        #9':me_local_aula, :me_hospedagem, :me_gerenc_prof, :me_gerenc_ges' +
        't , :dt_envio , :me_observacao,'
      
        #9':cd_situacao_material_aula, :cd_situacao_transporte, :cd_situac' +
        'ao_local_aula, :cd_situacao_hospedagem,'
      #9':cd_situacao_gerenc_prof, :cd_situacao_gerenc_gest,'
      #9':vl_total_transporte, :nr_quilometragem, :vl_km,'
      
        #9':nr_qtd_diarias_material, :vl_diaria_material, :vl_total_materi' +
        'al,'
      
        #9':nr_qtd_diarias_hospedagem, :vl_diaria_hospedagem, :vl_total_ho' +
        'spedagem,'
      
        #9':nr_qtd_diarias_local, :vl_diaria_local, :vl_total_local, :cd_g' +
        'rupo, :compartilhada, :cd_aula_tipo, :cd_situacao'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'b'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qtd_aulas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bloq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'conteudo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_material_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_local_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_gerenc_prof'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_gerenc_gest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_material_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_local_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_gerenc_prof'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_gerenc_gest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_quilometragem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_km'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_qtd_diarias_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_diaria_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_qtd_diarias_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_diaria_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_qtd_diarias_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_diaria_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'compartilhada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_aula_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao'
        ParamType = ptUnknown
      end>
    Left = 44
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'b'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nro_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'qtd_aulas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bloq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'conteudo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_material_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_local_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_gerenc_prof'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_gerenc_gest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'me_observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_material_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_local_aula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_gerenc_prof'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao_gerenc_gest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_quilometragem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_km'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_qtd_diarias_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_diaria_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_qtd_diarias_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_diaria_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_hospedagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_qtd_diarias_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_diaria_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_total_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'compartilhada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_aula_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao'
        ParamType = ptUnknown
      end>
  end
  object qyProfessorAntigo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   p.cd_pessoa, p.nm_pessoa'
      'FROM'
      '   turmasprofessores tp'
      '   INNER JOIN pessoas p ON (p.cd_pessoa = tp.professor)'
      'WHERE'
      '   tp.anosemestre = :nr_anosemestre AND'
      '   tp.curso LIKE :cd_curso AND'
      '   tp.turma LIKE :cd_turma AND'
      '   tp.disciplina = :cd_disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end>
    Left = 254
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end>
  end
  object qrySituacoes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_VALOR'
    SQL.Strings = (
      'SELECT'
      '  `CD_SITUACAO`,'
      '  `DS_VALOR`,'
      '  `DS_SIGLA`'
      'FROM'
      '  `SITUACOES`'
      'WHERE'
      '  `CD_MODULO` = 1029')
    Params = <>
    IndexFieldNames = 'DS_VALOR Asc'
    Left = 368
    Top = 296
    object qrySituacoesCD_SITUACAO: TIntegerField
      FieldName = 'CD_SITUACAO'
    end
    object qrySituacoesDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
    object qrySituacoesDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 50
    end
  end
  object qyAvaliacaoCronograma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_avaliacao,'
      '  ds_avaliacao'
      'FROM'
      '  avl_avaliacoes'
      'WHERE'
      '  cd_tipo_avaliacao = 2 AND '
      '  ds_ano_semestre = :nr_anosemestre AND'
      '  (sn_disponivel = 1 OR cd_avaliacao = :cd_avaliacao)'
      'ORDER BY'
      '  cd_avaliacao DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
    Left = 784
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_avaliacao'
        ParamType = ptUnknown
      end>
  end
end
