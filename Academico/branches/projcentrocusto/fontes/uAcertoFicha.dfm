object frmAcertoFicha: TfrmAcertoFicha
  Left = 197
  Top = 107
  BorderStyle = bsSingle
  Caption = 'Acerto de M'#233'dias/Faltas'
  ClientHeight = 824
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = btnCancelarClick
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel10: TBevel
    Left = 0
    Top = 46
    Width = 8
    Height = 770
    Align = alLeft
    Shape = bsSpacer
    ExplicitHeight = 523
  end
  object Bevel11: TBevel
    Left = 737
    Top = 46
    Width = 8
    Height = 770
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 642
    ExplicitHeight = 523
  end
  object Bevel7: TBevel
    Left = 0
    Top = 0
    Width = 745
    Height = 8
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 650
  end
  object Bevel8: TBevel
    Left = 0
    Top = 816
    Width = 745
    Height = 8
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 569
    ExplicitWidth = 650
  end
  object Bevel9: TBevel
    Left = 0
    Top = 36
    Width = 745
    Height = 10
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 650
  end
  object Panel1: TPanel
    Left = 8
    Top = 46
    Width = 729
    Height = 770
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 225
      Height = 766
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 38
        Top = 10
        Width = 38
        Height = 14
        Caption = 'Turma:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 81
        Top = 10
        Width = 120
        Height = 13
        DataField = 'Turma'
        DataSource = DM.dtcFichaIndividual
        Transparent = True
      end
      object Bevel6: TBevel
        Left = 8
        Top = 5
        Width = 209
        Height = 25
      end
      object Label3: TLabel
        Left = 21
        Top = 42
        Width = 56
        Height = 14
        Caption = 'Ano/Sem.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 81
        Top = 42
        Width = 120
        Height = 13
        DataField = 'AnoSemestre'
        DataSource = DM.dtcFichaIndividual
        Transparent = True
      end
      object Label4: TLabel
        Left = 40
        Top = 74
        Width = 37
        Height = 14
        Caption = 'Curso:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 81
        Top = 74
        Width = 124
        Height = 13
        DataField = 'Curso'
        DataSource = DM.dtcFichaIndividual
        Transparent = True
      end
      object Label5: TLabel
        Left = 22
        Top = 105
        Width = 55
        Height = 14
        Caption = 'Disciplina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSigla: TLabel
        Left = 81
        Top = 105
        Width = 36
        Height = 14
        Caption = 'lblSigla:'
      end
      object Bevel3: TBevel
        Left = 8
        Top = 101
        Width = 209
        Height = 25
      end
      object Bevel5: TBevel
        Left = 8
        Top = 37
        Width = 209
        Height = 25
      end
      object Bevel4: TBevel
        Left = 8
        Top = 69
        Width = 209
        Height = 25
      end
    end
    object pnNotas: TPanel
      Left = 227
      Top = 2
      Width = 500
      Height = 766
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object pnTitulo: TPanel
        Left = 2
        Top = 2
        Width = 496
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 16
        object Label6: TLabel
          Left = 106
          Top = 3
          Width = 33
          Height = 14
          Caption = 'M'#233'dia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 445
          Top = 2
          Width = 25
          Height = 14
          Caption = 'Falta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbExameBi: TLabel
          Left = 176
          Top = 2
          Width = 13
          Height = 14
          Caption = 'RE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label14: TLabel
          Left = 240
          Top = 3
          Width = 80
          Height = 14
          Caption = 'M'#233'd. Definitiva'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnAvaliacao1: TPanel
        Tag = 1
        Left = 2
        Top = 22
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label18: TLabel
          Left = 15
          Top = 7
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '1'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa1: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa1: TSpeedButton
          Tag = 1
          Left = 67
          Top = 2
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas1: TSpeedButton
          Tag = 1
          Left = 425
          Top = 2
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_1: TDBEdit
          Tag = 1
          Left = 96
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota1'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta1: TDBEdit
          Left = 454
          Top = 2
          Width = 30
          Height = 22
          DataField = 'Falta1'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyDown = dbFalta1KeyDown
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame1: TDBEdit
          Left = 168
          Top = 2
          Width = 64
          Height = 22
          DataField = 'Exame1'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva1: TDBEdit
          Left = 239
          Top = 1
          Width = 80
          Height = 22
          DataField = 'nota_d1'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo1: TCheckBox
          Left = 330
          Top = 4
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao2: TPanel
        Tag = 1
        Left = 2
        Top = 49
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbAvaliacao1: TLabel
          Left = 15
          Top = 7
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '2'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa2: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa2: TSpeedButton
          Tag = 2
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas2: TSpeedButton
          Tag = 2
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_2: TDBEdit
          Tag = 2
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota2'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta2: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta2'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame2: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame2'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva2: TDBEdit
          Left = 239
          Top = 3
          Width = 80
          Height = 22
          DataField = 'nota_d2'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo2: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao3: TPanel
        Tag = 1
        Left = 2
        Top = 76
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label8: TLabel
          Left = 15
          Top = 7
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '3'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa3: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa3: TSpeedButton
          Tag = 3
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas3: TSpeedButton
          Tag = 3
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_3: TDBEdit
          Tag = 3
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota3'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta3: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta3'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame3: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame3'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva3: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d3'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo3: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao4: TPanel
        Tag = 1
        Left = 2
        Top = 103
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label9: TLabel
          Left = 15
          Top = 7
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '4'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa4: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa4: TSpeedButton
          Tag = 4
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas4: TSpeedButton
          Tag = 4
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_4: TDBEdit
          Tag = 4
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota4'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta4: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta4'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame4: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame4'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva4: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d4'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo4: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao5: TPanel
        Tag = 1
        Left = 2
        Top = 130
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object Label10: TLabel
          Left = 15
          Top = 9
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '5'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa5: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa5: TSpeedButton
          Tag = 5
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas5: TSpeedButton
          Tag = 5
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_5: TDBEdit
          Tag = 5
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota5'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta5: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta5'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame5: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame5'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva5: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d5'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo5: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao6: TPanel
        Tag = 1
        Left = 2
        Top = 157
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        object Label11: TLabel
          Left = 15
          Top = 9
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '6'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa6: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa6: TSpeedButton
          Tag = 6
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas6: TSpeedButton
          Tag = 6
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_6: TDBEdit
          Tag = 6
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota6'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta6: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Exame6'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame6: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame6'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva6: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d6'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo6: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao7: TPanel
        Tag = 1
        Left = 2
        Top = 184
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
        object Label12: TLabel
          Left = 15
          Top = 9
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '7'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa7: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa7: TSpeedButton
          Tag = 7
          Left = 67
          Top = 2
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas7: TSpeedButton
          Tag = 7
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_7: TDBEdit
          Tag = 7
          Left = 97
          Top = 2
          Width = 64
          Height = 22
          DataField = 'Nota7'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta7: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta7'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame7: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame7'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva7: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d7'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo7: TCheckBox
          Left = 330
          Top = 4
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao8: TPanel
        Tag = 1
        Left = 2
        Top = 211
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
        object Label17: TLabel
          Left = 15
          Top = 9
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '8'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa8: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa8: TSpeedButton
          Tag = 8
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas8: TSpeedButton
          Tag = 8
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_8: TDBEdit
          Tag = 8
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota8'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta8: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta8'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame8: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame8'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva8: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d8'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo8: TCheckBox
          Left = 330
          Top = 6
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao9: TPanel
        Tag = 1
        Left = 2
        Top = 238
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 8
        object Label19: TLabel
          Left = 15
          Top = 9
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = '9'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa9: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa9: TSpeedButton
          Tag = 9
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas9: TSpeedButton
          Tag = 9
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_9: TDBEdit
          Tag = 9
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota9'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta9: TDBEdit
          Left = 453
          Top = 2
          Width = 30
          Height = 22
          DataField = 'Falta9'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame9: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame9'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva9: TDBEdit
          Left = 239
          Top = 2
          Width = 80
          Height = 22
          DataField = 'nota_d9'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo9: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnAvaliacao10: TPanel
        Tag = 1
        Left = 2
        Top = 265
        Width = 496
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 9
        object Label20: TLabel
          Left = 9
          Top = 9
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = '10'#170' Etapa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object blEtapa10: TBevel
          Left = 418
          Top = 0
          Width = 2
          Height = 27
        end
        object sbBloqEtapa10: TSpeedButton
          Tag = 10
          Left = 67
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios012
          OnClick = sbBloqEtapaClick
        end
        object sbBloqFaltas10: TSpeedButton
          Tag = 10
          Left = 425
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbAvaliacao_10: TDBEdit
          Tag = 10
          Left = 97
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Nota10'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnExit = dbAvaliacao_1Exit
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFalta10: TDBEdit
          Left = 453
          Top = 3
          Width = 30
          Height = 22
          DataField = 'Falta10'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          OnKeyPress = dbFalta1KeyPress
        end
        object dbExame10: TDBEdit
          Left = 168
          Top = 3
          Width = 64
          Height = 22
          DataField = 'Exame10'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbDefinitiva10: TDBEdit
          Left = 239
          Top = 3
          Width = 80
          Height = 22
          DataField = 'nota_d10'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          OnEnter = dbAvaliacao_1Enter
          OnKeyDown = dbAvaliacao_1KeyDown
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object cbDispensadoDefinitivo10: TCheckBox
          Left = 330
          Top = 5
          Width = 79
          Height = 17
          Caption = 'Dispensado'
          TabOrder = 4
          OnClick = cbDispensado1Click
        end
      end
      object pnExame: TPanel
        Left = 2
        Top = 292
        Width = 496
        Height = 75
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 10
        object Bevel1: TBevel
          Left = 48
          Top = 6
          Width = 242
          Height = 64
        end
        object lbExame: TLabel
          Left = 79
          Top = 9
          Width = 64
          Height = 14
          Caption = 'Exame Final'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbSegunda: TLabel
          Left = 183
          Top = 9
          Width = 48
          Height = 14
          Caption = '2'#170' '#201'poca:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbBloqExame: TSpeedButton
          Left = 65
          Top = 25
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object sbBloqSegundaEpoca: TSpeedButton
          Left = 169
          Top = 22
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios01
          OnClick = sbBloqFaltas1Click
        end
        object dbExame: TDBEdit
          Left = 94
          Top = 25
          Width = 67
          Height = 22
          DataField = 'NotaExame'
          DataSource = DM.dtcFichaIndividual
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbSegunda: TDBEdit
          Left = 198
          Top = 25
          Width = 67
          Height = 22
          DataField = 'Segunda_Epoca'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnEnter = dbAvaliacao_1Enter
          OnKeyPress = dbAvaliacao_1KeyPress
        end
        object dbFaltouExame: TDBCheckBox
          Left = 94
          Top = 50
          Width = 88
          Height = 17
          Caption = 'Faltou'
          DataField = 'sn_faltou_exame'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbFaltouExameClick
        end
        object dbFaltou2Epoca: TDBCheckBox
          Left = 198
          Top = 50
          Width = 80
          Height = 17
          Caption = 'Faltou'
          DataField = 'sn_faltou_2epoca'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbFaltou2EpocaClick
        end
      end
      object pnMedia: TPanel
        Left = 2
        Top = 427
        Width = 496
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 11
        ExplicitTop = 367
        object Bevel12: TBevel
          Left = 48
          Top = 3
          Width = 242
          Height = 54
        end
        object Label21: TLabel
          Left = 193
          Top = 12
          Width = 48
          Height = 14
          Caption = 'Freq.(%):'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMediaFinalConceito: TLabel
          Left = 66
          Top = 12
          Width = 61
          Height = 14
          Caption = 'M'#233'dia Final'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtMF: TDBEdit
          Left = 66
          Top = 32
          Width = 90
          Height = 22
          DataField = 'MediaFinal'
          DataSource = DM.dtcFichaIndividual
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = txtMFEnter
          OnKeyPress = txtMFKeyPress
        end
        object DBEdit4: TDBEdit
          Left = 192
          Top = 28
          Width = 81
          Height = 22
          DataField = 'Frequencia'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          OnKeyPress = dbFalta1KeyPress
        end
      end
      object pnAproveita: TPanel
        Left = 2
        Top = 607
        Width = 496
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 14
        object DBCheckBox1: TDBCheckBox
          Left = 47
          Top = 8
          Width = 249
          Height = 17
          Caption = 'Congelar M'#233'dia e situa'#231#227'o atual.'
          DataField = 'Aproveitamento'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 48
          Top = 31
          Width = 249
          Height = 17
          Caption = 'Congelar Freq'#252#234'ncia'
          DataField = 'sn_bloq_freq_global'
          DataSource = DM.dtcFichaIndividual
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pnBotoes: TPanel
        Left = 2
        Top = 686
        Width = 496
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 15
        object btnConfirmar: TButton
          Left = 52
          Top = 8
          Width = 75
          Height = 25
          Caption = 'F7 Confirmar'
          TabOrder = 0
          OnClick = btnConfirmarClick
        end
        object btnCancelar: TButton
          Left = 133
          Top = 8
          Width = 75
          Height = 25
          Caption = 'F6 Cancelar'
          TabOrder = 1
          OnClick = btnCancelarClick
        end
        object btnFechar: TButton
          Left = 213
          Top = 8
          Width = 75
          Height = 25
          Caption = 'F12 Fechar'
          TabOrder = 2
          OnClick = btnFecharClick
        end
      end
      object pnSituacao: TPanel
        Left = 2
        Top = 657
        Width = 496
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 13
        object Label13: TLabel
          Left = 48
          Top = 8
          Width = 46
          Height = 14
          Caption = 'Situa'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 107
          Top = 5
          Width = 183
          Height = 22
          DataField = 'Situacao'
          DataSource = DM.dtcFichaIndividual
          KeyField = 'cd_situacao'
          ListField = 'ds_situacao'
          ListSource = DM.dsSituacao
          TabOrder = 0
        end
      end
      object pnMediaCurso: TPanel
        Left = 2
        Top = 487
        Width = 496
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 12
        ExplicitTop = 427
        object Bevel22: TBevel
          Left = 48
          Top = 3
          Width = 242
          Height = 54
        end
        object Label16: TLabel
          Left = 66
          Top = 12
          Width = 115
          Height = 14
          Caption = 'M'#233'dia Final do Curso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbBloqMediaCurso: TSpeedButton
          Left = 67
          Top = 28
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
            7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
            F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
            FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
            DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
            1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
            FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
            B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
            FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
            ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
            D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          PopupMenu = pmBloqueios02
          OnClick = sbBloqEtapaClick
        end
        object txtMFC: TDBEdit
          Left = 94
          Top = 28
          Width = 90
          Height = 22
          DataField = 'nr_media_curso'
          DataSource = dsMediaFinalCurso
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 547
        Width = 496
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 17
        object Bevel2: TBevel
          Left = 48
          Top = 3
          Width = 242
          Height = 54
        end
        object Label15: TLabel
          Left = 66
          Top = 12
          Width = 74
          Height = 14
          Caption = 'Carga Hor'#225'ria'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 66
          Top = 28
          Width = 206
          Height = 22
          DataField = 'carga_horaria'
          DataSource = DM.dtcFichaIndividual
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnMediaAnual: TPanel
        Left = 2
        Top = 367
        Width = 496
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 18
        ExplicitLeft = 0
        ExplicitTop = 353
        object Bevel13: TBevel
          Left = 48
          Top = 3
          Width = 242
          Height = 54
        end
        object Label22: TLabel
          Left = 66
          Top = 12
          Width = 67
          Height = 14
          Caption = 'M'#233'dia Anual'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtMA: TDBEdit
          Left = 67
          Top = 28
          Width = 90
          Height = 22
          DataField = 'MediaAnual'
          DataSource = DM.dtcFichaIndividual
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = dbAvaliacao_1Enter
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 8
    Width = 745
    Height = 28
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlue
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 7
      Width = 35
      Height = 14
      Caption = 'Aluno:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 49
      Top = 7
      Width = 64
      Height = 14
      DataField = 'CodigoAluno'
      DataSource = DM.dtcFichaIndividual
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblAluno: TLabel
      Left = 120
      Top = 7
      Width = 361
      Height = 14
      AutoSize = False
      Caption = 'lblAluno:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pmBloqueios012: TPopupMenu
    Left = 192
    Top = 272
    object miDesbloqueada: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000130B0000130B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0017A5D4FF159D
        D1FF1292CCFF118CC9FF0E82C4FF0D7FC3FF0D7FC3FF0D7FC3FF0D7FC3FF0D7F
        C3FF0D7FC3FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001AADD8FF91E1
        FAFF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DA
        F9FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFD2F5
        FCFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFD2F5
        FCFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFDBF7
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFE2F9
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF91E1FAFF0E82C4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFE2F9
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF91E1FAFF118CC9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFFFFF
        FFFFEDFBFDFFE2F9FDFFDBF7FDFFD2F5FCFFD2F5FCFFC7F3FBFFB9F0FAFFA8EC
        F9FF91E1FAFF159DD1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFF21B4
        D8FF21B4D8FF21B4D8FF21B4D8FF1CB6DCFF1CB6DCFFADADADFFEBEBEBFFADAD
        ADFF21B4D8FF1AADD8FFFFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFEFEFEFFFADAD
        ADFFFFFFFF00FFFFFF00FFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFEFEFEFFFADAD
        ADFFFFFFFF00FFFFFF00FFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFFFFFFFFFEFEF
        EFFFADADADFFADADADFFADADADFFADADADFFC7C7C7FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFFFFF
        FFFFD5D5D5FFD5D5D5FFC7C7C7FFC5C5C5FFADADADFFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAD
        ADFFADADADFFADADADFFADADADFFADADADFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Desbloqueada'
      OnClick = miClick
    end
    object miBloqueada: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
        7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
        1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
        F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
        DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
        1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
        F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
        DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
        1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
        FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
        DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
        1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
        FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
        B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
        ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
        FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
        ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
        D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Bloqueada'
      OnClick = miClick
    end
    object miDigitadaManualmente: TMenuItem
      Tag = 2
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000130B0000130B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000310000
        0033000000330000003300000033000000330000003300000033000000330000
        00330000003300000033000000330000003300000033000000239E9688F39E96
        88FF9D9587FF9D9587FF9D9487FF9D9486FF9D9486FF9D9486FF9D9486FF9D94
        86FF9D9486FF9D9487FF9D9587FF9D9587FF9E9688FF938B7FC19E9688FFCAC5
        C2FFC7C2BEFFC7C2BEFFC6C1BDFFC5C0BCFFC5C0BBFFC5C0BBFFC5C0BBFFC5C0
        BBFFC5C0BCFFC6C1BDFFC7C2BEFFC7C2BEFFCAC5C2FF9E9688FF9D9487FFC9C6
        C1FFF6F8FAFFAFA89DFFF5F6F9FFF3F4F6FFF3F4F6FFF3F4F6FFF3F4F6FFF3F4
        F6FFF3F4F6FFF5F6F8FFAFA89DFFF6F8FAFFC9C6C1FF9D9487FF9D9487FFCDCA
        C4FFAAA497FFACA598FFACA599FFAAA497FFABA498FFAAA497FFABA498FFAAA4
        97FFABA498FFAAA497FFAAA397FFAAA396FFCDC9C4FF9D9487FF9C9486FFCFCD
        C6FFF5F6F9FFF7F8FAFFA9A296FFF8FAFDFFA9A396FFF8FAFDFFA9A396FFF8FA
        FDFFA9A296FFF6F7FAFFF3F4F6FFF2F3F5FFCECBC4FF9C9486FF9C9486FFD3D2
        CBFFA49C8EFFA69E91FFA7A092FFA7A092FFA7A092FFA7A092FFA7A092FFA7A0
        92FFA7A092FFA59E90FFA2998BFFF1F2F4FFD1D0C8FF9C9386FF9C9386FFD6D5
        CDFFF6F7FAFFA1998CFFF8FAFDFFA29A8DFFF8FAFDFFA29A8DFFF8FAFDFFA29A
        8DFFF8FAFDFFA1998CFFF5F6F9FFDDD9D7FFD5D4CBFF9C9386FF9C9386FFDADA
        D1FFB6B0A4FFB8B1A6FFB8B1A5FFB8B2A6FFB8B1A5FFB8B2A6FFB8B1A5FFB8B2
        A6FFB8B1A5FFB8B1A6FFB6B0A4FFB6AFA3FFDADAD1FF9C9386FF9D9487FFDFE1
        D7FFDDDED4FFDDDED4FFDDDED5FFDDDED5FFDDDED5FFDDDED5FFDDDED5FFDDDE
        D5FFDDDED5FFDDDED5FFDDDED4FFDDDED4FFDFE1D7FF9D9487FF9F978AB19D95
        87FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C93
        86FF9C9386FF9C9386FF9C9386FF9C9386FF9D9587FF9F978AB1FFFFFF00FFFF
        FF00FFFFFF00A0988BFF0000003300000025FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A1998CB5A1998CFF948D81C5FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00A1998CFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Digitada Manualmente'
      OnClick = miClick
    end
  end
  object qyBloquearEtapa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE fichaindividual SET sn_bloqueado1 = :sn_bloqueado WHERE '
      'codigoaluno = :codigoaluno'
      'AND anosemestre = :anosemestre'
      'AND turma = :turma'
      'AND disciplina = :disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'sn_bloqueado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sn_bloqueado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
  end
  object qyMediaFinalCurso: TUMZQuery
    Connection = DM.db
    UpdateObject = updMediaFinalCurso
    SQL.Strings = (
      'SELECT'
      '  mc.nr_media_curso,'
      '  mc.cd_matricula_curso,'
      '  mc.sn_bloqueio_nr_media_curso'
      'FROM'
      '  fichaindividual f'
      
        '  INNER JOIN matriculas m ON (m.anosemestre = f.anosemestre AND ' +
        'm.turma = f.turmamatricula AND m.codigoaluno = f.codigoaluno)'
      
        #9'INNER JOIN matriculas_curso mc ON (m.cd_matricula_curso = mc.cd' +
        '_matricula_curso)'
      'WHERE'
      '  f.codigoaluno = :codigoaluno'
      '  AND f.anosemestre = :anosemestre'
      '  AND f.turma = :turma'
      '  AND f.disciplina = :disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    object qyMediaFinalCursonr_media_curso: TFloatField
      FieldName = 'nr_media_curso'
      OnGetText = qyMediaFinalCursonr_media_cursoGetText
      DisplayFormat = '#0.0'
    end
    object qyMediaFinalCursocd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
    end
    object qyMediaFinalCursosn_bloqueio_nr_media_curso: TSmallintField
      FieldName = 'sn_bloqueio_nr_media_curso'
    end
  end
  object updMediaFinalCurso: TZUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE matriculas_curso SET nr_media_curso = :nr_media_curso WHE' +
        'RE cd_matricula_curso = :cd_matricula_curso')
    UseSequenceFieldForRefreshSQL = False
    Left = 192
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_media_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_matricula_curso'
        ParamType = ptUnknown
      end>
  end
  object dsMediaFinalCurso: TDataSource
    DataSet = qyMediaFinalCurso
    Left = 160
    Top = 488
  end
  object pmBloqueios02: TPopupMenu
    Left = 192
    Top = 336
    object MenuItem1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000130B0000130B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0017A5D4FF159D
        D1FF1292CCFF118CC9FF0E82C4FF0D7FC3FF0D7FC3FF0D7FC3FF0D7FC3FF0D7F
        C3FF0D7FC3FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001AADD8FF91E1
        FAFF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DA
        F9FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFD2F5
        FCFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFD2F5
        FCFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFDBF7
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFE2F9
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF91E1FAFF0E82C4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFE2F9
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF91E1FAFF118CC9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFFFFF
        FFFFEDFBFDFFE2F9FDFFDBF7FDFFD2F5FCFFD2F5FCFFC7F3FBFFB9F0FAFFA8EC
        F9FF91E1FAFF159DD1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFF21B4
        D8FF21B4D8FF21B4D8FF21B4D8FF1CB6DCFF1CB6DCFFADADADFFEBEBEBFFADAD
        ADFF21B4D8FF1AADD8FFFFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFEFEFEFFFADAD
        ADFFFFFFFF00FFFFFF00FFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFEFEFEFFFADAD
        ADFFFFFFFF00FFFFFF00FFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFFFFFFFFFEFEF
        EFFFADADADFFADADADFFADADADFFADADADFFC7C7C7FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFFFFF
        FFFFD5D5D5FFD5D5D5FFC7C7C7FFC5C5C5FFADADADFFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAD
        ADFFADADADFFADADADFFADADADFFADADADFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Desbloqueada'
      OnClick = miClick
    end
    object MenuItem3: TMenuItem
      Tag = 2
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000130B0000130B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000310000
        0033000000330000003300000033000000330000003300000033000000330000
        00330000003300000033000000330000003300000033000000239E9688F39E96
        88FF9D9587FF9D9587FF9D9487FF9D9486FF9D9486FF9D9486FF9D9486FF9D94
        86FF9D9486FF9D9487FF9D9587FF9D9587FF9E9688FF938B7FC19E9688FFCAC5
        C2FFC7C2BEFFC7C2BEFFC6C1BDFFC5C0BCFFC5C0BBFFC5C0BBFFC5C0BBFFC5C0
        BBFFC5C0BCFFC6C1BDFFC7C2BEFFC7C2BEFFCAC5C2FF9E9688FF9D9487FFC9C6
        C1FFF6F8FAFFAFA89DFFF5F6F9FFF3F4F6FFF3F4F6FFF3F4F6FFF3F4F6FFF3F4
        F6FFF3F4F6FFF5F6F8FFAFA89DFFF6F8FAFFC9C6C1FF9D9487FF9D9487FFCDCA
        C4FFAAA497FFACA598FFACA599FFAAA497FFABA498FFAAA497FFABA498FFAAA4
        97FFABA498FFAAA497FFAAA397FFAAA396FFCDC9C4FF9D9487FF9C9486FFCFCD
        C6FFF5F6F9FFF7F8FAFFA9A296FFF8FAFDFFA9A396FFF8FAFDFFA9A396FFF8FA
        FDFFA9A296FFF6F7FAFFF3F4F6FFF2F3F5FFCECBC4FF9C9486FF9C9486FFD3D2
        CBFFA49C8EFFA69E91FFA7A092FFA7A092FFA7A092FFA7A092FFA7A092FFA7A0
        92FFA7A092FFA59E90FFA2998BFFF1F2F4FFD1D0C8FF9C9386FF9C9386FFD6D5
        CDFFF6F7FAFFA1998CFFF8FAFDFFA29A8DFFF8FAFDFFA29A8DFFF8FAFDFFA29A
        8DFFF8FAFDFFA1998CFFF5F6F9FFDDD9D7FFD5D4CBFF9C9386FF9C9386FFDADA
        D1FFB6B0A4FFB8B1A6FFB8B1A5FFB8B2A6FFB8B1A5FFB8B2A6FFB8B1A5FFB8B2
        A6FFB8B1A5FFB8B1A6FFB6B0A4FFB6AFA3FFDADAD1FF9C9386FF9D9487FFDFE1
        D7FFDDDED4FFDDDED4FFDDDED5FFDDDED5FFDDDED5FFDDDED5FFDDDED5FFDDDE
        D5FFDDDED5FFDDDED5FFDDDED4FFDDDED4FFDFE1D7FF9D9487FF9F978AB19D95
        87FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C93
        86FF9C9386FF9C9386FF9C9386FF9C9386FF9D9587FF9F978AB1FFFFFF00FFFF
        FF00FFFFFF00A0988BFF0000003300000025FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A1998CB5A1998CFF948D81C5FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00A1998CFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Digitada Manualmente'
      OnClick = miClick
    end
  end
  object qyAtualizarDtSaida: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  fichaindividual'
      'SET'
      
        '  dt_saida = CASE WHEN situacao IN (3, 4, 5, 6) THEN now() ELSE ' +
        'null END'
      'WHERE'
      '  codigoaluno = :codigoaluno AND'
      '  turma LIKE :turma AND'
      '  anosemestre = :anosemestre AND'
      '  disciplina = :disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
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
      end>
    Left = 160
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoaluno'
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
      end>
  end
  object pmBloqueios01: TPopupMenu
    Left = 192
    Top = 304
    object MenuItem2: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000130B0000130B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0017A5D4FF159D
        D1FF1292CCFF118CC9FF0E82C4FF0D7FC3FF0D7FC3FF0D7FC3FF0D7FC3FF0D7F
        C3FF0D7FC3FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001AADD8FF91E1
        FAFF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DAF9FF76DA
        F9FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFD2F5
        FCFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFD2F5
        FCFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFDBF7
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF76DAF9FF0D7FC3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFE2F9
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF91E1FAFF0E82C4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFE2F9
        FDFFA8ECF9FF92E7F7FF92E7F7FF80DDF3FF6ED3EFFF5DC9EBFF4ABEE7FF38B4
        E3FF91E1FAFF118CC9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFFFFFF
        FFFFEDFBFDFFE2F9FDFFDBF7FDFFD2F5FCFFD2F5FCFFC7F3FBFFB9F0FAFFA8EC
        F9FF91E1FAFF159DD1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF001CB6DCFF21B4
        D8FF21B4D8FF21B4D8FF21B4D8FF1CB6DCFF1CB6DCFFADADADFFEBEBEBFFADAD
        ADFF21B4D8FF1AADD8FFFFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFEFEFEFFFADAD
        ADFFFFFFFF00FFFFFF00FFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFEFEFEFFFADAD
        ADFFFFFFFF00FFFFFF00FFFFFF00ADADADFFC5C5C5FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFFFFFFFFFEFEF
        EFFFADADADFFADADADFFADADADFFADADADFFC7C7C7FFADADADFFFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADADFFFFFF
        FFFFD5D5D5FFD5D5D5FFC7C7C7FFC5C5C5FFADADADFFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAD
        ADFFADADADFFADADADFFADADADFFADADADFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Desbloqueada'
      OnClick = miClick
    end
    object MenuItem4: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
        7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
        1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
        F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
        DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
        1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
        F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
        DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
        1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
        FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
        DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
        1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
        FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
        B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
        ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
        FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
        ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
        D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Bloqueada'
      OnClick = miClick
    end
  end
end
