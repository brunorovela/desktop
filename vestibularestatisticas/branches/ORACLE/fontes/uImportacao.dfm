object frm_Importacao: Tfrm_Importacao
  Left = 174
  Top = 125
  Caption = 'Importa'#231#227'o de dados e classifica'#231#227'o'
  ClientHeight = 528
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel10: TBevel
    Left = 312
    Top = 304
    Width = 310
    Height = 25
  end
  object Label9: TLabel
    Left = 320
    Top = 312
    Width = 32
    Height = 13
    Caption = 'Label8'
  end
  object SpeedButton7: TSpeedButton
    Left = 280
    Top = 304
    Width = 25
    Height = 25
    Flat = True
  end
  object Label10: TLabel
    Left = 160
    Top = 286
    Width = 45
    Height = 16
    Caption = 'Curso:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'IMPORTAR DADOS E CLASSIFICAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 25
    Width = 782
    Height = 503
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel6: TBevel
      Left = 0
      Top = 0
      Width = 782
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 790
    end
    object pcImportacao: TPageControl
      Left = 0
      Top = 5
      Width = 782
      Height = 498
      ActivePage = tsAlunos
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChanging = pcImportacaoChanging
      object tsArquivo: TTabSheet
        Caption = 'Arquivo'
        object Bevel3: TBevel
          Left = 0
          Top = 433
          Width = 774
          Height = 5
          Align = alBottom
          Shape = bsSpacer
          ExplicitTop = 437
          ExplicitWidth = 782
        end
        object Bevel18: TBevel
          Left = 0
          Top = 177
          Width = 774
          Height = 5
          Align = alTop
          Shape = bsSpacer
          ExplicitWidth = 782
        end
        object Panel2: TPanel
          Left = 0
          Top = 438
          Width = 774
          Height = 32
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel8: TPanel
            Left = 496
            Top = 2
            Width = 276
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton15: TSpeedButton
              Left = 10
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Ver lista'
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
              OnClick = SpeedButton15Click
            end
            object SpeedButton14: TSpeedButton
              Left = 98
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Adicionar'
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              OnClick = SpeedButton14Click
            end
            object SpeedButton3: TSpeedButton
              Left = 186
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Avan'#231'ar'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
                4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
                4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
                4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
                E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
                DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
                E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
                0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
                00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
                FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
                2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
                E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
              Layout = blGlyphRight
              OnClick = SpeedButton3Click
            end
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 182
          Width = 774
          Height = 251
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object Bevel2: TBevel
            Left = 97
            Top = 93
            Width = 296
            Height = 25
          end
          object Label1: TLabel
            Left = 15
            Top = 8
            Width = 195
            Height = 16
            Caption = 'Ano/semestre do vestibular:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 15
            Top = 72
            Width = 298
            Height = 16
            Caption = 'Selecione a Institui'#231#227'o de Ensino Superior:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton1: TSpeedButton
            Left = 64
            Top = 93
            Width = 25
            Height = 25
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
            OnClick = SpeedButton1Click
          end
          object lbIES: TLabel
            Left = 102
            Top = 98
            Width = 38
            Height = 16
            Caption = 'lbIES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 18
            Top = 136
            Width = 359
            Height = 16
            Caption = 'Selecione o arquivo contendo a lista de aprovados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton2: TSpeedButton
            Left = 306
            Top = 157
            Width = 87
            Height = 25
            Caption = 'Procurar...'
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000D80E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
              222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
              08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
              80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
              22220FFFFFFF070222220FFFFFFF002222220000000002222222}
            OnClick = SpeedButton2Click
          end
          object edAnoSemestre: TMaskEdit
            Left = 15
            Top = 29
            Width = 56
            Height = 24
            EditMask = '9999/9;0;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxLength = 6
            ParentFont = False
            TabOrder = 0
            Text = '19931'
          end
          object UpDownCursos: TUpDown
            Left = 70
            Top = 29
            Width = 17
            Height = 25
            Min = -100
            TabOrder = 1
            OnClick = UpDownCursosClick
          end
          object edIES: TEdit
            Left = 16
            Top = 93
            Width = 49
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edArquivo: TEdit
            Left = 18
            Top = 157
            Width = 287
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 177
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          object Panel7: TPanel
            Left = 2
            Top = 2
            Width = 770
            Height = 23
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Arquivos atualmente importados'
            Color = clBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBGrid2: TDBGrid
            Left = 2
            Top = 25
            Width = 770
            Height = 150
            Align = alClient
            DataSource = srcInst
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'nr_anosemestre'
                Title.Caption = 'Ano/Sem.'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_instituicao'
                Title.Caption = 'Institui'#231#227'o'
                Width = 238
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_curso'
                Title.Caption = 'Curso'
                Width = 214
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_arquivo'
                Title.Caption = 'Arquivo imp.'
                Width = 232
                Visible = True
              end>
          end
        end
      end
      object tsAlunos: TTabSheet
        Caption = 'Alunos da Institui'#231#227'o'
        ImageIndex = 1
        object Bevel1: TBevel
          Left = 0
          Top = 433
          Width = 774
          Height = 5
          Align = alBottom
          Shape = bsSpacer
          ExplicitTop = 437
          ExplicitWidth = 782
        end
        object Panel9: TPanel
          Left = 0
          Top = 438
          Width = 774
          Height = 32
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel10: TPanel
            Left = 416
            Top = 2
            Width = 356
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton16: TSpeedButton
              Left = 90
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Ver Lista'
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
              OnClick = SpeedButton16Click
            end
            object SpeedButton13: TSpeedButton
              Left = 178
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Adicionar'
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              OnClick = SpeedButton13Click
            end
            object SpeedButton6: TSpeedButton
              Left = 266
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Avan'#231'ar'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
                4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
                4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
                4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
                E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
                DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
                E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
                0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
                00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
                FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
                2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
                E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
              Layout = blGlyphRight
              OnClick = SpeedButton6Click
            end
            object SpeedButton12: TSpeedButton
              Left = 1
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Voltar'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
                4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
                00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
                DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
                00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
                0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
                55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
                FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
                2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
                00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
                FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
                0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
              OnClick = SpeedButton12Click
            end
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 433
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object Bevel12: TBevel
            Left = 192
            Top = 264
            Width = 569
            Height = 25
          end
          object Bevel11: TBevel
            Left = 192
            Top = 206
            Width = 569
            Height = 25
          end
          object Bevel9: TBevel
            Left = 192
            Top = 152
            Width = 569
            Height = 25
          end
          object Bevel4: TBevel
            Left = 192
            Top = 94
            Width = 569
            Height = 25
          end
          object Label4: TLabel
            Left = 16
            Top = 16
            Width = 251
            Height = 16
            Caption = 'Selecionar alunos do ano/semestre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 16
            Top = 73
            Width = 103
            Height = 16
            Caption = 'Departamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton4: TSpeedButton
            Left = 160
            Top = 94
            Width = 25
            Height = 25
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
            OnClick = SpeedButton4Click
          end
          object lbDepartamento: TLabel
            Left = 199
            Top = 99
            Width = 112
            Height = 16
            Caption = 'lbDepartamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 16
            Top = 131
            Width = 45
            Height = 16
            Caption = 'Curso:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton5: TSpeedButton
            Left = 160
            Top = 150
            Width = 25
            Height = 25
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
            OnClick = SpeedButton5Click
          end
          object lbCurso: TLabel
            Left = 199
            Top = 157
            Width = 54
            Height = 16
            Caption = 'lbCurso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 16
            Top = 187
            Width = 49
            Height = 16
            Caption = 'Turma:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton8: TSpeedButton
            Left = 160
            Top = 206
            Width = 25
            Height = 25
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
          object lbTurma: TLabel
            Left = 199
            Top = 211
            Width = 58
            Height = 16
            Caption = 'lbTurma'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 16
            Top = 244
            Width = 44
            Height = 16
            Caption = 'Aluno:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton9: TSpeedButton
            Left = 160
            Top = 264
            Width = 25
            Height = 25
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
            OnClick = SpeedButton9Click
          end
          object lbAluno: TLabel
            Left = 200
            Top = 269
            Width = 53
            Height = 16
            Caption = 'lbAluno'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edAnoSemestre2: TMaskEdit
            Left = 17
            Top = 37
            Width = 56
            Height = 24
            EditMask = '9999/9;0;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            MaxLength = 6
            ParentFont = False
            TabOrder = 0
            Text = '19931'
          end
          object udAnosemestre: TUpDown
            Left = 71
            Top = 37
            Width = 17
            Height = 25
            Min = -100
            TabOrder = 1
            OnClick = udAnoSemestre2Click
          end
          object edDepto: TEdit
            Left = 16
            Top = 94
            Width = 145
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edCurso: TEdit
            Left = 16
            Top = 150
            Width = 145
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object edTurma: TEdit
            Left = 16
            Top = 206
            Width = 145
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object edAluno: TEdit
            Left = 16
            Top = 263
            Width = 145
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object cbTodosAnos: TCheckBox
            Left = 94
            Top = 42
            Width = 129
            Height = 17
            Caption = 'Todos os anos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
        end
      end
      object tsConfirmacao: TTabSheet
        Caption = 'Confirma'#231#227'o'
        ImageIndex = 2
        object Bevel22: TBevel
          Left = 0
          Top = 433
          Width = 774
          Height = 5
          Align = alBottom
          Shape = bsSpacer
          ExplicitTop = 437
          ExplicitWidth = 782
        end
        object pnRodape: TPanel
          Left = 0
          Top = 438
          Width = 774
          Height = 32
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel1: TPanel
            Left = 592
            Top = 2
            Width = 180
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton10: TSpeedButton
              Left = 90
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Avan'#231'ar'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
                4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
                4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
                4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
                E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
                DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
                E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
                0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
                00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
                FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
                2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
                E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
                E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
              Layout = blGlyphRight
              OnClick = SpeedButton10Click
            end
            object SpeedButton17: TSpeedButton
              Left = 3
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Voltar'
              Flat = True
              Glyph.Data = {
                DA010000424DDA010000000000003600000028000000090000000F0000000100
                180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
                E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
                DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
                4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
                00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
                DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
                00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
                0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
                55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
                FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
                2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
                00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
                FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
                0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
              OnClick = SpeedButton17Click
            end
          end
        end
        object pnCorpo: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 433
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object Label7: TLabel
            Left = 2
            Top = 2
            Width = 770
            Height = 16
            Align = alTop
            Caption = 
              '  Lista de alunos e situa'#231#227'o de compara'#231#227'o com os alunos selecio' +
              'nados da Institui'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 605
          end
          object Bevel13: TBevel
            Left = 2
            Top = 18
            Width = 10
            Height = 413
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 417
          end
          object Bevel14: TBevel
            Left = 762
            Top = 18
            Width = 10
            Height = 413
            Align = alRight
            Shape = bsSpacer
            ExplicitLeft = 770
            ExplicitHeight = 417
          end
          object Bevel19: TBevel
            Left = 465
            Top = 18
            Width = 15
            Height = 413
            Align = alLeft
            Shape = bsSpacer
            ExplicitLeft = 377
            ExplicitHeight = 417
          end
          object Bevel20: TBevel
            Left = 248
            Top = 264
            Width = 50
            Height = 50
          end
          object cklAlunos: TCheckListBox
            Left = 12
            Top = 18
            Width = 453
            Height = 413
            OnClickCheck = cklAlunosClickCheck
            Align = alLeft
            ItemHeight = 13
            TabOrder = 0
            OnClick = cklAlunosClick
            OnDblClick = cklAlunosDblClick
            OnKeyPress = cklAlunosKeyPress
          end
          object cklClassificados: TCheckListBox
            Left = 480
            Top = 18
            Width = 282
            Height = 413
            OnClickCheck = cklClassificadosClickCheck
            Align = alClient
            ItemHeight = 13
            TabOrder = 1
            OnClick = cklClassificadosClick
            OnKeyPress = cklClassificadosKeyPress
          end
        end
      end
      object tsConclusao: TTabSheet
        Caption = 'Conclu'#237'do'
        ImageIndex = 3
        object Bevel5: TBevel
          Left = 0
          Top = 433
          Width = 774
          Height = 5
          Align = alBottom
          Shape = bsSpacer
          ExplicitTop = 437
          ExplicitWidth = 782
        end
        object Bevel7: TBevel
          Left = 0
          Top = 33
          Width = 774
          Height = 5
          Align = alTop
          Shape = bsSpacer
          ExplicitWidth = 782
        end
        object Panel12: TPanel
          Left = 0
          Top = 438
          Width = 774
          Height = 32
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel13: TPanel
            Left = 680
            Top = 2
            Width = 92
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton11: TSpeedButton
              Left = 2
              Top = 3
              Width = 87
              Height = 22
              Caption = 'Finalizar'
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
              OnClick = SpeedButton11Click
            end
          end
        end
        object Panel14: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 33
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Processo de Importa'#231#227'o Conclu'#237'do !'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Panel15: TPanel
          Left = 0
          Top = 38
          Width = 774
          Height = 395
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          object DBGrid1: TDBGrid
            Left = 2
            Top = 2
            Width = 770
            Height = 391
            Align = alClient
            DataSource = srcListaAlunos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'nr_classificacao'
                Title.Caption = 'Classifica'#231#227'o'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cd_pessoa'
                Title.Caption = 'C'#243'digo'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_pessoa'
                Title.Caption = 'Nome'
                Width = 182
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'turma'
                Title.Caption = 'Turma'
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'anosemestre'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'curso'
                Title.Caption = 'Curso'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_sigla_situacao'
                Title.Caption = 'Situa'#231#227'o'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_curso'
                Title.Caption = 'Curso vestibular'
                Width = 205
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_contato'
                Title.Caption = 'E-mail'
                Width = 162
                Visible = True
              end>
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 408
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
      E00FF870F21F83FFCFC7F800E40F000F87E3FA10C203003FA3F3FA108603002F
      31F9F8008C01000F38F980019001000F3C798013802100013E39801380010001
      3F198013C06300019F8B801FF18F000F8FC3801FFE01000FC7E7801FFF07002F
      E00F801FFF8F803FF83FFFFFFFFFE3FFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qyInstituicoesVestibular: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   instituicoes_vestibular')
    Params = <>
    Left = 52
    Top = 425
    object qyInstituicoesVestibularcd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
      Origin = 'WMESTRE12.instituicoes_vestibular.cd_inst_vestibular'
    end
    object qyInstituicoesVestibularnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.instituicoes_vestibular.nr_anosemestre'
    end
    object qyInstituicoesVestibularcd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Origin = 'WMESTRE12.instituicoes_vestibular.cd_instituicao'
    end
    object qyInstituicoesVestibulards_curso: TStringField
      FieldName = 'ds_curso'
      Origin = 'WMESTRE12.instituicoes_vestibular.ds_curso'
      Size = 255
    end
    object qyInstituicoesVestibulards_arquivo: TStringField
      FieldName = 'ds_arquivo'
      Origin = 'WMESTRE12.instituicoes_vestibular.ds_arquivo'
      Size = 255
    end
  end
  object qyClassificados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   classificados_vestibular'
      'ORDER BY nm_pessoa;')
    Params = <>
    Left = 92
    Top = 426
    object qyClassificadoscd_candidato: TIntegerField
      FieldName = 'cd_candidato'
      Origin = 'WMESTRE12.classificados_vestibular.cd_candidato'
    end
    object qyClassificadosnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.classificados_vestibular.nm_pessoa'
      Size = 255
    end
    object qyClassificadoscd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
      Origin = 'WMESTRE12.classificados_vestibular.cd_inst_vestibular'
    end
    object qyClassificadosnr_classificacao: TIntegerField
      FieldName = 'nr_classificacao'
    end
  end
  object qyAlunos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'av.*'
      'FROM'
      #9'alunos_vestibular av'
      'INNER JOIN pessoas p ON (p.cd_pessoa = av.cd_pessoa)'
      'ORDER BY'
      #9'p.nm_pessoa, p.cd_pessoa;')
    Params = <>
    Left = 133
    Top = 426
    object qyAlunoscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.alunos_vestibular.cd_pessoa'
    end
    object qyAlunoscd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
      Origin = 'WMESTRE12.alunos_vestibular.cd_inst_vestibular'
    end
    object qyAlunoscd_candidato: TIntegerField
      FieldName = 'cd_candidato'
      Origin = 'WMESTRE12.alunos_vestibular.cd_candidato'
    end
    object qyAlunosds_status: TStringField
      FieldName = 'ds_status'
      Origin = 'WMESTRE12.alunos_vestibular.ds_status'
    end
    object qyAlunossn_alterado: TIntegerField
      FieldName = 'sn_alterado'
    end
  end
  object odArquivoTXT: TOpenDialog
    Filter = 'Arquivo de texto sem formata'#231#227'o (TXT)|*.txt'
    Title = 'Selecione o arquivo contendo a lista de classificados'
    Left = 628
    Top = 310
  end
  object qyListaAlunos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'a.cd_pessoa,'
      #9'a.cd_candidato,'
      #9'a.ds_status,'
      #9'i.cd_inst_vestibular,'
      #9'i.ds_curso,'
      #9'p.nm_pessoa,'
      #9'm.curso,'
      #9'm.anosemestre,'
      #9'm.turma,'
      #9's.ds_sigla_situacao,'
      #9'c.ds_contato,'
      #9'cv.nr_classificacao'
      'FROM'
      #9'pessoas p'
      #9#9'INNER JOIN matriculas m ON (m.codigoaluno = p.cd_pessoa)'
      #9#9#9'INNER JOIN situacao s ON (s.cd_situacao = m.situacao)'
      
        #9#9'LEFT JOIN contatos_pessoas c ON (c.cd_pessoa = p.cd_pessoa AND' +
        ' c.cd_contato = 4)'
      #9#9'INNER JOIN alunos_vestibular a ON (a.cd_pessoa = p.cd_pessoa)'
      
        #9#9'INNER JOIN classificados_vestibular cv ON ( cv.cd_candidato = ' +
        'a.cd_candidato )'
      
        #9#9'INNER JOIN instituicoes_vestibular i ON (i.cd_inst_vestibular ' +
        '= a.cd_inst_vestibular)'
      'WHERE'
      #9'(a.ds_status = '#39'Semelhante'#39' OR a.ds_status = '#39'Id'#234'ntico'#39')'
      'GROUP BY'
      #9'm.codigoaluno'
      'ORDER BY'
      ' '#9'p.nm_pessoa;')
    Params = <>
    Left = 208
    Top = 424
    object qyListaAlunoscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qyListaAlunoscd_candidato: TIntegerField
      FieldName = 'cd_candidato'
    end
    object qyListaAlunosds_status: TStringField
      FieldName = 'ds_status'
    end
    object qyListaAlunosds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 255
    end
    object qyListaAlunosnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyListaAlunoscurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
    object qyListaAlunosturma: TStringField
      FieldName = 'turma'
      Size = 15
    end
    object qyListaAlunoscd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
    end
    object qyListaAlunosds_sigla_situacao: TStringField
      FieldName = 'ds_sigla_situacao'
      Size = 10
    end
    object qyListaAlunosds_contato: TStringField
      FieldName = 'ds_contato'
      Size = 100
    end
    object qyListaAlunosnr_classificacao: TIntegerField
      FieldName = 'nr_classificacao'
    end
    object qyListaAlunosanosemestre: TIntegerField
      DisplayLabel = 'AnoSemestre'
      FieldName = 'anosemestre'
    end
  end
  object srcListaAlunos: TDataSource
    DataSet = qyListaAlunos
    Left = 240
    Top = 424
  end
  object srcInst: TDataSource
    DataSet = qyInst
    Left = 104
    Top = 320
  end
  object qyInst: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   iv.nr_anosemestre,'
      '   iv.ds_curso,'
      '   ie.nm_instituicao,'
      '   iv.ds_arquivo'
      'FROM'
      '   instituicoes_vestibular iv'
      
        '      INNER JOIN instituicoes_ensino ie ON (ie.cd_instituicao = ' +
        'iv.cd_instituicao)')
    Params = <>
    Left = 72
    Top = 320
    object qyInstnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.instituicoes_vestibular.nr_anosemestre'
    end
    object qyInstds_curso: TStringField
      FieldName = 'ds_curso'
      Origin = 'WMESTRE12.instituicoes_vestibular.ds_curso'
      Size = 255
    end
    object qyInstnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.instituicoes_ensino.nm_instituicao'
      Size = 80
    end
    object qyInstds_arquivo: TStringField
      FieldName = 'ds_arquivo'
      Origin = 'WMESTRE12.instituicoes_vestibular.ds_arquivo'
      Size = 255
    end
  end
end
