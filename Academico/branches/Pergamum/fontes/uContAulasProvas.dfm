object frmContAulasProvas: TfrmContAulasProvas
  Left = 0
  Top = 0
  Caption = 'Administra'#231#227'o de Aulas e Provas'
  ClientHeight = 725
  ClientWidth = 1171
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 1171
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 784
  end
  object Bevel6: TBevel
    Left = 0
    Top = 31
    Width = 5
    Height = 694
    Align = alLeft
    Shape = bsSpacer
    ExplicitTop = 36
    ExplicitHeight = 397
  end
  object Bevel7: TBevel
    Left = 1166
    Top = 31
    Width = 5
    Height = 694
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 778
    ExplicitTop = 36
    ExplicitHeight = 397
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1171
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CONTROLE DE AULAS E PROVAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pgcAulasNotas: TPageControl
    Left = 5
    Top = 31
    Width = 1161
    Height = 694
    ActivePage = tsAulas
    Align = alClient
    TabOrder = 1
    OnChange = pgcAulasNotasChange
    object tsAulas: TTabSheet
      Caption = '    Aulas    '
      object Bevel1: TBevel
        Left = 0
        Top = 201
        Width = 1153
        Height = 7
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 41
        ExplicitWidth = 767
      end
      object ultimoseparador: TBevel
        Left = 0
        Top = 632
        Width = 1153
        Height = 6
        Align = alBottom
        Shape = bsSpacer
        ExplicitLeft = 3
        ExplicitTop = 380
        ExplicitWidth = 935
      end
      object Panel1: TPanel
        Left = 0
        Top = 53
        Width = 1153
        Height = 148
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object sbBuscaCurso: TSpeedButton
          Left = 309
          Top = 30
          Width = 21
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
          OnClick = sbCursoBusca
        end
        object lblCurso: TLabel
          Left = 23
          Top = 32
          Width = 32
          Height = 13
          Alignment = taCenter
          Caption = 'Curso:'
        end
        object lblDisciplina: TLabel
          Left = 352
          Top = 32
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object lblTurma: TLabel
          Left = 21
          Top = 57
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object sbBuscaTurma: TSpeedButton
          Left = 309
          Top = 54
          Width = 21
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
        object sbBuscaDisciplina: TSpeedButton
          Left = 648
          Top = 30
          Width = 21
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
        object Label18: TLabel
          Left = 349
          Top = 9
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
        end
        object spProf: TSpeedButton
          Left = 648
          Top = 6
          Width = 21
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
          OnClick = spProfClick
        end
        object Label19: TLabel
          Left = 176
          Top = 80
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Fim:'
        end
        object Label20: TLabel
          Left = 8
          Top = 82
          Width = 47
          Height = 13
          Caption = 'Dt. In'#237'cio:'
        end
        object lbGrupoAulas: TLabel
          Left = 366
          Top = 57
          Width = 33
          Height = 13
          Alignment = taCenter
          Caption = 'Grupo:'
        end
        object sbBuscaGrupoAulas: TSpeedButton
          Left = 648
          Top = 54
          Width = 21
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
        object Label17: TLabel
          Left = 12
          Top = 9
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object SpeedButton30: TSpeedButton
          Left = 306
          Top = 5
          Width = 23
          Height = 22
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
          OnClick = sbSelecionaUnidadeEnsinoClick
        end
        object txtCurso: TEdit
          Left = 61
          Top = 30
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 0
        end
        object txtDisciplina: TEdit
          Left = 405
          Top = 27
          Width = 56
          Height = 21
          TabOrder = 5
          OnKeyDown = ChecaLimpa
        end
        object txtTurma: TEdit
          Left = 61
          Top = 54
          Width = 245
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 2
          OnKeyDown = ChecaLimpa
        end
        object cbData: TCheckBox
          Left = 61
          Top = 77
          Width = 17
          Height = 21
          TabOrder = 11
          OnClick = cbDataClick
        end
        object txtBim: TEdit
          Left = 269
          Top = 112
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 9
          Text = '1'
        end
        object cbBim: TCheckBox
          Left = 23
          Top = 112
          Width = 240
          Height = 21
          Caption = 'Per'#237'odo de Avalia'#231#227'o (Bimestre, Trimestre...):'
          Checked = True
          State = cbChecked
          TabOrder = 12
          OnClick = cbBimClick
        end
        object udBim: TUpDown
          Left = 294
          Top = 112
          Width = 13
          Height = 21
          Min = 1
          Max = 1000
          Position = 500
          TabOrder = 13
          OnClick = udBimClick
        end
        object btnFiltrar: TBitBtn
          Left = 694
          Top = 9
          Width = 105
          Height = 35
          Caption = 'Filtrar'
          TabOrder = 14
          OnClick = btnFiltrarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object ckbSerie: TCheckBox
          Left = 330
          Top = 112
          Width = 205
          Height = 21
          Caption = 'Etapa da Turma (S'#233'rie, Ano, Fase...):'
          TabOrder = 15
          OnClick = ckbSerieClick
        end
        object txtSerie: TEdit
          Left = 541
          Top = 112
          Width = 26
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 10
          Text = '1'
        end
        object udSerie: TUpDown
          Left = 569
          Top = 112
          Width = 15
          Height = 21
          Max = 1000
          Position = 500
          TabOrder = 16
          OnClick = udSerieClick
        end
        object edCurso: TEdit
          Left = 124
          Top = 30
          Width = 181
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 1
        end
        object txtProfessorAula: TEdit
          Left = 405
          Top = 6
          Width = 56
          Height = 21
          TabOrder = 3
          OnExit = edCodigoProfessorExit
          OnKeyPress = edCodigoProfessorKeyPress
        end
        object edProfessorAula: TEdit
          Left = 467
          Top = 6
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 4
        end
        object edDisc: TEdit
          Left = 467
          Top = 29
          Width = 181
          Height = 21
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 6
        end
        object cbData2: TCheckBox
          Left = 220
          Top = 79
          Width = 15
          Height = 17
          TabOrder = 17
          OnClick = cbData2Click
        end
        object BitBtn3: TBitBtn
          Left = 694
          Top = 50
          Width = 105
          Height = 32
          Caption = 'Limpar Filtros'
          TabOrder = 18
          OnClick = btnLimparClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object edCodGrupoAulas: TEdit
          Left = 405
          Top = 54
          Width = 56
          Height = 21
          TabOrder = 7
          OnKeyDown = ChecaLimpa
        end
        object edNomeGrupoAulas: TEdit
          Left = 467
          Top = 54
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 8
        end
        object umdtAulasInicio: TUMDateTimePicker
          Left = 84
          Top = 78
          Width = 85
          Height = 21
          BevelOuter = bvNone
          TabOrder = 19
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
          OnChangeDate = umdtPDataInicioChangeDate
          Date = 42479.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtAulasFim: TUMDateTimePicker
          Left = 241
          Top = 78
          Width = 88
          Height = 21
          BevelOuter = bvNone
          TabOrder = 20
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
          OnChangeDate = umdtPDataInicioChangeDate
          Date = 42479.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object Edit1: TEdit
          Left = 61
          Top = 6
          Width = 244
          Height = 21
          ReadOnly = True
          TabOrder = 21
        end
      end
      object dbgAulas: TDBGrid
        Left = 0
        Top = 208
        Width = 1153
        Height = 424
        Align = alClient
        DataSource = dtcAulas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgAulasDrawColumnCell
        OnKeyDown = SelecionaTudo
        OnTitleClick = dbgAulasTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nro_aula'
            Title.Caption = 'No. Aula'
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'anosemestre'
            Title.Alignment = taCenter
            Title.Caption = 'AnoSem'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_professor'
            Title.Caption = 'Professor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'turma'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'turma_sigla'
            Title.Caption = 'Disciplina'
            Width = 245
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'bimestre'
            Title.Alignment = taCenter
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data'
            Title.Alignment = taCenter
            Title.Caption = 'Data da Aula'
            Width = 73
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'qtd_aulas'
            Title.Caption = 'Qtd. Aulas'
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'bloqueado'
            Title.Alignment = taCenter
            Title.Caption = 'Bloqueado'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_coligada'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_grupo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ds_aula_tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_DESPESA'
            Visible = True
          end>
      end
      object toolAula: TToolBar
        Left = 0
        Top = 638
        Width = 1153
        Height = 28
        Align = alBottom
        ButtonWidth = 135
        Caption = 'toolAula'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object sbSelecionarColuna: TSpeedButton
          Left = 0
          Top = 0
          Width = 25
          Height = 22
          Hint = 'Selecionar Colunas'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
            DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
            0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
            808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
            90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
            6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
            9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
            50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
            3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
            A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
            9F806000402000808080808020202000600000804000804020FF7F00BF000000
            00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
            2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
            702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
            0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
            A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
            9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
            8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
            707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
            DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
            DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
            AFAFAF303030000000000000000000000000000000000000000000303030AFAF
            AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbSelecionarColunaClick
        end
        object ToolButton4: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btIncluirAula: TToolButton
          Left = 33
          Top = 0
          AutoSize = True
          Caption = 'F2 Incluir'
          ImageIndex = 0
          OnClick = btIncluirAulaClick
        end
        object btAlterarAula: TToolButton
          Left = 108
          Top = 0
          AutoSize = True
          Caption = 'F3 Alterar'
          ImageIndex = 1
          OnClick = btAlterarAulaClick
        end
        object btExcluirAula: TToolButton
          Left = 187
          Top = 0
          AutoSize = True
          Caption = 'F9 Excluir'
          ImageIndex = 2
          OnClick = btExcluirAulaClick
        end
        object ToolButton7: TToolButton
          Left = 264
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 272
          Top = 0
          Caption = 'Copiar Informa'#231#245'es'
          ImageIndex = 10
          OnClick = ToolButton5Click
        end
        object ToolButton2: TToolButton
          Left = 407
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object tblRecalculo: TToolButton
          Left = 415
          Top = 0
          Caption = 'Ajuste de Frequ'#234'ncia  '
          ImageIndex = 9
          OnClick = tblRecalculoClick
        end
        object ToolButton14: TToolButton
          Left = 550
          Top = 0
          Width = 8
          Caption = 'ToolButton14'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btnDespesas: TToolButton
          Left = 558
          Top = 0
          AutoSize = True
          Caption = 'Despesas'
          DropdownMenu = pmDespesas
          ImageIndex = 11
        end
        object ToolButton1: TToolButton
          Left = 635
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btFecharAula: TToolButton
          Left = 643
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btFecharAulaClick
        end
      end
      object pnFiltroEstadoCidadeAulas: TPanel
        Left = 0
        Top = 0
        Width = 1153
        Height = 53
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          1153
          53)
        object Label30: TLabel
          Left = 12
          Top = 6
          Width = 202
          Height = 13
          Caption = 'Filtro de Estados e Cidades para trabalho:'
        end
        object Label31: TLabel
          Left = 13
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Estados:'
        end
        object Label32: TLabel
          Left = 357
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Cidades:'
        end
        object sbBuscaEstados: TSpeedButton
          Left = 307
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaEstadosClick
        end
        object sbBuscaCidades: TSpeedButton
          Left = 646
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaCidadesClick
        end
        object edEstadosAulas: TEdit
          Left = 61
          Top = 25
          Width = 244
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 0
          Text = 'edEstadosAulas'
        end
        object edCidadesAulas: TEdit
          Left = 405
          Top = 25
          Width = 243
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 1
          Text = 'Edit1'
        end
        object btnLimparFiltroEstadoCidade: TBitBtn
          Left = 694
          Top = 12
          Width = 105
          Height = 32
          Anchors = [akLeft, akBottom]
          Caption = 'Limpar Filtros'
          TabOrder = 2
          OnClick = btnLimparFiltroEstadoCidadeClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
    end
    object tsProvas: TTabSheet
      Caption = '     Provas     '
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 0
        Top = 225
        Width = 1153
        Height = 7
        Align = alTop
        Shape = bsSpacer
        ExplicitLeft = 2
        ExplicitTop = 109
        ExplicitWidth = 931
      end
      object dbgProvas: TDBGrid
        Left = 0
        Top = 232
        Width = 1153
        Height = 406
        Align = alClient
        DataSource = dtcProvas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = SelecionaTudo
        OnTitleClick = dbgAulasTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nro_nota'
            Title.Alignment = taCenter
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'anosemestre'
            Title.Alignment = taCenter
            Title.Caption = 'AnoSem'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'turma'
            Title.Alignment = taCenter
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_professor'
            Title.Caption = 'Professor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_tipo'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bimestre'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sigla'
            Title.Alignment = taCenter
            Title.Caption = 'Disciplina'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assunto'
            Width = 160
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data'
            Title.Alignment = taCenter
            Width = 81
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'bloqueado'
            Title.Alignment = taCenter
            Title.Caption = 'Bloqueado'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_avaliacao'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nr_nota_maxima'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_nota_minima'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_peso'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_grupo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'sn_diario_fechado'
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 53
        Width = 1153
        Height = 172
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1149
          168)
        object SpeedButton1: TSpeedButton
          Left = 308
          Top = 33
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
          OnClick = sbCursoBusca
        end
        object Label1: TLabel
          Left = 23
          Top = 36
          Width = 32
          Height = 13
          Alignment = taCenter
          Caption = 'Curso:'
        end
        object Label2: TLabel
          Left = 352
          Top = 36
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object Label3: TLabel
          Left = 21
          Top = 62
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object SpeedButton2: TSpeedButton
          Left = 308
          Top = 58
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
          OnClick = sbBuscaTurmaClick
        end
        object SpeedButton3: TSpeedButton
          Left = 652
          Top = 33
          Width = 21
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
        object Label22: TLabel
          Left = 349
          Top = 9
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
        end
        object Label23: TLabel
          Left = 352
          Top = 89
          Width = 47
          Height = 13
          Caption = 'Dt. In'#237'cio:'
        end
        object Label24: TLabel
          Left = 519
          Top = 90
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Fim:'
        end
        object SpeedButton12: TSpeedButton
          Left = 652
          Top = 6
          Width = 21
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
          OnClick = spProfClick
        end
        object lbGrupoProvas: TLabel
          Left = 366
          Top = 62
          Width = 33
          Height = 13
          Alignment = taCenter
          Caption = 'Grupo:'
        end
        object sbBuscaGrupoProvas: TSpeedButton
          Left = 652
          Top = 59
          Width = 21
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
        object Label21: TLabel
          Left = 12
          Top = 9
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object SpeedButton31: TSpeedButton
          Left = 306
          Top = 5
          Width = 23
          Height = 22
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
          OnClick = sbSelecionaUnidadeEnsinoClick
        end
        object txtPCurso: TEdit
          Left = 61
          Top = 33
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 0
        end
        object txtPDisciplina: TEdit
          Left = 405
          Top = 33
          Width = 59
          Height = 21
          ReadOnly = True
          TabOrder = 5
          OnKeyDown = ChecaLimpa
        end
        object txtPTurma: TEdit
          Left = 61
          Top = 59
          Width = 245
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 2
          OnKeyDown = ChecaLimpa
        end
        object ckbPData: TCheckBox
          Left = 405
          Top = 87
          Width = 16
          Height = 21
          TabOrder = 9
          OnClick = ckbPDataClick
        end
        object txtPBim: TEdit
          Left = 272
          Top = 138
          Width = 24
          Height = 21
          Anchors = [akLeft, akBottom]
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 11
          Text = '1'
        end
        object ckbPBim: TCheckBox
          Left = 23
          Top = 138
          Width = 240
          Height = 21
          Anchors = [akLeft, akBottom]
          Caption = 'Per'#237'odo de Avalia'#231#227'o (Bimestre, Trimestre...):'
          Checked = True
          State = cbChecked
          TabOrder = 12
          OnClick = cbBimClick
        end
        object udPBim: TUpDown
          Left = 297
          Top = 138
          Width = 13
          Height = 21
          Anchors = [akLeft, akBottom]
          Max = 1000
          Position = 500
          TabOrder = 13
          OnClick = udBimClick
        end
        object btnFiltrar2: TBitBtn
          Left = 694
          Top = 8
          Width = 105
          Height = 35
          Caption = 'Filtrar'
          TabOrder = 14
          OnClick = btnFiltrarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object udPSerie: TUpDown
          Left = 572
          Top = 137
          Width = 13
          Height = 21
          Anchors = [akLeft, akBottom]
          Max = 1000
          Position = 500
          TabOrder = 15
          OnClick = udPSerieClick
        end
        object txtPSerie: TEdit
          Left = 544
          Top = 138
          Width = 24
          Height = 21
          Anchors = [akLeft, akBottom]
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 16
          Text = '1'
        end
        object ckbPSerie: TCheckBox
          Left = 333
          Top = 138
          Width = 205
          Height = 21
          Anchors = [akLeft, akBottom]
          Caption = 'Etapa da Turma (S'#233'rie, Ano, Fase...):'
          TabOrder = 17
          OnClick = ckbPSerieClick
        end
        object edCursoProvas: TEdit
          Left = 124
          Top = 33
          Width = 181
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 1
        end
        object txtProfessorProva: TEdit
          Left = 405
          Top = 6
          Width = 59
          Height = 21
          TabOrder = 3
          OnExit = edCodigoProfessorExit
          OnKeyPress = edCodigoProfessorKeyPress
        end
        object edProfessorProva: TEdit
          Left = 467
          Top = 6
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 4
        end
        object edDiscDesc: TEdit
          Left = 467
          Top = 33
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          TabOrder = 6
        end
        object ckbDataProva: TCheckBox
          Left = 563
          Top = 88
          Width = 15
          Height = 17
          TabOrder = 10
          OnClick = ckbDataProvaClick
        end
        object BitBtn4: TBitBtn
          Left = 694
          Top = 49
          Width = 105
          Height = 32
          Caption = 'Limpar Filtros'
          TabOrder = 18
          OnClick = btnLimparClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object edCodGrupoProvas: TEdit
          Left = 405
          Top = 59
          Width = 59
          Height = 21
          TabOrder = 7
          OnKeyDown = ChecaLimpa
        end
        object edNomeGrupoProvas: TEdit
          Left = 467
          Top = 59
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 8
        end
        object umdtPDataInicio: TUMDateTimePicker
          Left = 427
          Top = 87
          Width = 87
          Height = 21
          BevelOuter = bvNone
          TabOrder = 19
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
          OnChangeDate = umdtPDataInicioChangeDate
          Date = 42475.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtPDataFim: TUMDateTimePicker
          Left = 586
          Top = 87
          Width = 87
          Height = 21
          BevelOuter = bvNone
          TabOrder = 20
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
          OnChangeDate = umdtPDataInicioChangeDate
          Date = 42255.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object rgDiarioFechadoAbertoProvas: TRadioGroup
          Left = 61
          Top = 86
          Width = 244
          Height = 44
          HelpContext = 1
          BiDiMode = bdLeftToRight
          Caption = 'Listar somente aulas/provas de Di'#225'rios:'
          Columns = 3
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Abertos'
            'Fechado '
            'Ambos')
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 21
        end
        object Edit2: TEdit
          Left = 61
          Top = 6
          Width = 244
          Height = 21
          ReadOnly = True
          TabOrder = 22
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 638
        Width = 1153
        Height = 28
        Align = alBottom
        ButtonWidth = 121
        Caption = 'toolAula'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object SpeedButton11: TSpeedButton
          Left = 0
          Top = 0
          Width = 25
          Height = 22
          Hint = 'Selecionar Colunas'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
            DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
            0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
            808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
            90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
            6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
            9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
            50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
            3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
            A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
            9F806000402000808080808020202000600000804000804020FF7F00BF000000
            00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
            2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
            702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
            0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
            A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
            9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
            8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
            707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
            DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
            DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
            AFAFAF303030000000000000000000000000000000000000000000303030AFAF
            AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbSelecionarColunaClick
        end
        object ToolButton8: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btIncluirProva: TToolButton
          Left = 33
          Top = 0
          AutoSize = True
          Caption = 'F2 Incluir'
          ImageIndex = 0
          OnClick = btIncluirAulaClick
        end
        object btAlterarProva: TToolButton
          Left = 108
          Top = 0
          AutoSize = True
          Caption = 'F3 Alterar'
          ImageIndex = 1
          OnClick = btAlterarAulaClick
        end
        object btExcluirProva: TToolButton
          Left = 187
          Top = 0
          AutoSize = True
          Caption = 'F9 Excluir'
          ImageIndex = 2
          OnClick = btExcluirAulaClick
        end
        object ToolButton19: TToolButton
          Left = 264
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btCalcularNotas: TToolButton
          Left = 272
          Top = 0
          AutoSize = True
          Caption = 'Calcular Notas  '
          ImageIndex = 8
          OnClick = tblCalcularClick
        end
        object ToolButton6: TToolButton
          Left = 378
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btDuplicarAvaliacao: TToolButton
          Left = 386
          Top = 0
          AutoSize = True
          Caption = 'Duplicar Avalia'#231#245'es'
          ImageIndex = 10
          OnClick = btDuplicarAvaliacaoClick
        end
        object ToolButton11: TToolButton
          Left = 509
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btnCopiar: TToolButton
          Left = 517
          Top = 0
          Caption = 'Copiar Informa'#231#245'es'
          ImageIndex = 10
          OnClick = btnCopiarClick
        end
        object ToolButton17: TToolButton
          Left = 638
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btFecharProva: TToolButton
          Left = 646
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btFecharAulaClick
        end
      end
      object pnFiltroEstadoCidadeProvas: TPanel
        Left = 0
        Top = 0
        Width = 1153
        Height = 53
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          1153
          53)
        object Label33: TLabel
          Left = 12
          Top = 6
          Width = 202
          Height = 13
          Caption = 'Filtro de Estados e Cidades para trabalho:'
        end
        object Label34: TLabel
          Left = 13
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Estados:'
        end
        object Label35: TLabel
          Left = 357
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Cidades:'
        end
        object SpeedButton7: TSpeedButton
          Left = 307
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaEstadosClick
        end
        object SpeedButton8: TSpeedButton
          Left = 646
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaCidadesClick
        end
        object edEstadosProvas: TEdit
          Left = 61
          Top = 25
          Width = 244
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 0
          Text = 'Edit1'
        end
        object edCidadesProvas: TEdit
          Left = 405
          Top = 25
          Width = 243
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 1
          Text = 'Edit1'
        end
        object BitBtn8: TBitBtn
          Left = 694
          Top = 12
          Width = 105
          Height = 32
          Anchors = [akLeft, akBottom]
          Caption = 'Limpar Filtros'
          TabOrder = 2
          OnClick = btnLimparFiltroEstadoCidadeClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
    end
    object tsAprovacao: TTabSheet
      Caption = '    Aprova'#231#227'o    '
      ImageIndex = 2
      object Bevel3: TBevel
        Left = 0
        Top = 165
        Width = 1153
        Height = 7
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 41
        ExplicitWidth = 767
      end
      object Panel4: TPanel
        Left = 0
        Top = 53
        Width = 1153
        Height = 112
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object SpeedButton4: TSpeedButton
          Left = 308
          Top = 32
          Width = 22
          Height = 22
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
          OnClick = sbCursoBusca
        end
        object Label4: TLabel
          Left = 23
          Top = 36
          Width = 32
          Height = 13
          Alignment = taCenter
          Caption = 'Curso:'
        end
        object Label5: TLabel
          Left = 355
          Top = 36
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object Label6: TLabel
          Left = 21
          Top = 62
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object SpeedButton5: TSpeedButton
          Left = 307
          Top = 59
          Width = 23
          Height = 22
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
        object SpeedButton6: TSpeedButton
          Left = 651
          Top = 33
          Width = 21
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
        object Label7: TLabel
          Left = 357
          Top = 62
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Situa'#231#227'o:'
        end
        object Label26: TLabel
          Left = 352
          Top = 9
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
        end
        object SpeedButton13: TSpeedButton
          Left = 651
          Top = 6
          Width = 21
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
          OnClick = spProfClick
        end
        object Label27: TLabel
          Left = 355
          Top = 86
          Width = 47
          Height = 13
          Caption = 'Dt. In'#237'cio:'
        end
        object Label28: TLabel
          Left = 521
          Top = 87
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Fim:'
        end
        object Label25: TLabel
          Left = 12
          Top = 9
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object SpeedButton32: TSpeedButton
          Left = 306
          Top = 5
          Width = 23
          Height = 22
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
          OnClick = sbSelecionaUnidadeEnsinoClick
        end
        object txtACurso: TEdit
          Left = 61
          Top = 33
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 0
        end
        object txtADisciplina: TEdit
          Left = 408
          Top = 33
          Width = 59
          Height = 21
          ReadOnly = True
          TabOrder = 5
          OnKeyDown = ChecaLimpa
        end
        object txtATurma: TEdit
          Left = 61
          Top = 59
          Width = 245
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 2
          OnKeyDown = ChecaLimpa
        end
        object txtABim: TEdit
          Left = 269
          Top = 84
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 8
          Text = '1'
        end
        object ckbABim: TCheckBox
          Left = 15
          Top = 84
          Width = 240
          Height = 21
          Caption = 'Per'#237'odo de Avalia'#231#227'o (Bimestre, Trimestre...):'
          Checked = True
          State = cbChecked
          TabOrder = 9
          OnClick = cbBimClick
        end
        object udABim: TUpDown
          Left = 294
          Top = 84
          Width = 13
          Height = 21
          TabOrder = 10
          OnClick = udBimClick
        end
        object BitBtn2: TBitBtn
          Left = 695
          Top = 8
          Width = 105
          Height = 35
          Caption = 'Filtrar'
          TabOrder = 11
          OnClick = btnFiltrarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object cbASituacao: TComboBox
          Left = 408
          Top = 59
          Width = 113
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 7
          Text = 'ABERTO'
          OnChange = cbASituacaoChange
          Items.Strings = (
            'TODOS'
            'ABERTO'
            'DEFERIDO'
            'INDEFERIDO')
        end
        object edAcurso: TEdit
          Left = 124
          Top = 33
          Width = 181
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 1
        end
        object edADisciplina: TEdit
          Left = 470
          Top = 33
          Width = 181
          Height = 21
          Color = clMenuBar
          TabOrder = 6
        end
        object txtAProfessor: TEdit
          Left = 408
          Top = 6
          Width = 59
          Height = 21
          TabOrder = 3
          OnExit = edCodigoProfessorExit
          OnKeyPress = edCodigoProfessorKeyPress
        end
        object edAProfessor: TEdit
          Left = 470
          Top = 6
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 4
        end
        object ckbADtIncio: TCheckBox
          Left = 408
          Top = 83
          Width = 16
          Height = 21
          TabOrder = 12
          OnClick = ckbADtIncioClick
        end
        object ckbADtFim: TCheckBox
          Left = 566
          Top = 86
          Width = 15
          Height = 17
          TabOrder = 13
          OnClick = ckbADtFimClick
        end
        object BitBtn5: TBitBtn
          Left = 695
          Top = 49
          Width = 105
          Height = 32
          Caption = 'Limpar Filtros'
          TabOrder = 14
          OnClick = btnLimparClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object umdtAdInicio: TUMDateTimePicker
          Left = 425
          Top = 83
          Width = 90
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
          OnChangeDate = umdtPDataInicioChangeDate
          Date = 42475.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtAdFim: TUMDateTimePicker
          Left = 587
          Top = 83
          Width = 90
          Height = 21
          BevelOuter = bvNone
          TabOrder = 16
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
          OnChangeDate = umdtPDataInicioChangeDate
          Date = 42475.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object Edit3: TEdit
          Left = 61
          Top = 6
          Width = 244
          Height = 21
          ReadOnly = True
          TabOrder = 17
        end
      end
      object dbgAprovacao: TDBGrid
        Left = 0
        Top = 172
        Width = 1153
        Height = 466
        Align = alClient
        DataSource = dtcAprovacao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = dbgAulasTitleClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'turma'
            Title.Alignment = taCenter
            Width = 46
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'bimestre'
            Title.Alignment = taCenter
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sigla'
            Title.Alignment = taCenter
            Title.Caption = 'Disciplina'
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cd_professor'
            Title.Alignment = taCenter
            Title.Caption = 'Professor'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Width = 197
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assunto'
            Title.Caption = 'Assunto da Prova'
            Width = 168
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'nr_nota_antiga_calc'
            Title.Alignment = taCenter
            Title.Caption = 'N. Antiga'
            Width = 53
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'nr_nota_nova_calc'
            Title.Alignment = taCenter
            Title.Caption = 'N. Nova'
            Width = 49
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'situacao'
            Title.Alignment = taCenter
            Title.Caption = 'SITUA'#199#195'O'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_alteracao'
            Title.Caption = 'Data Altera'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_deferimento'
            Title.Caption = 'Data Deferimento'
            Visible = True
          end>
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 638
        Width = 1153
        Height = 28
        Align = alBottom
        ButtonWidth = 81
        Caption = 'toolAula'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object SpeedButton14: TSpeedButton
          Left = 0
          Top = 0
          Width = 25
          Height = 22
          Hint = 'Selecionar Colunas'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
            DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
            0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
            808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
            90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
            6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
            9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
            50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
            3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
            A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
            9F806000402000808080808020202000600000804000804020FF7F00BF000000
            00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
            2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
            702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
            0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
            A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
            9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
            8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
            707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
            DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
            DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
            AFAFAF303030000000000000000000000000000000000000000000303030AFAF
            AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbSelecionarColunaClick
        end
        object ToolButton22: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton23: TToolButton
          Left = 33
          Top = 0
          AutoSize = True
          Caption = 'DEFERIR'
          ImageIndex = 8
          OnClick = btDeferirClick
        end
        object ToolButton24: TToolButton
          Left = 107
          Top = 0
          AutoSize = True
          Caption = 'INDEFERIR'
          ImageIndex = 2
          OnClick = btDeferirClick
        end
        object ToolButton31: TToolButton
          Left = 192
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton32: TToolButton
          Left = 200
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btFecharAulaClick
        end
      end
      object pnFiltroEstadoCidadeAprovacao: TPanel
        Left = 0
        Top = 0
        Width = 1153
        Height = 53
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          1153
          53)
        object Label42: TLabel
          Left = 12
          Top = 6
          Width = 202
          Height = 13
          Caption = 'Filtro de Estados e Cidades para trabalho:'
        end
        object Label43: TLabel
          Left = 13
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Estados:'
        end
        object Label44: TLabel
          Left = 357
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Cidades:'
        end
        object SpeedButton20: TSpeedButton
          Left = 307
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaEstadosClick
        end
        object SpeedButton21: TSpeedButton
          Left = 646
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaCidadesClick
        end
        object edEstadosAprovacao: TEdit
          Left = 61
          Top = 25
          Width = 244
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 0
          Text = 'Edit1'
        end
        object edCidadesAprovacao: TEdit
          Left = 405
          Top = 25
          Width = 243
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 1
          Text = 'Edit1'
        end
        object BitBtn9: TBitBtn
          Left = 694
          Top = 12
          Width = 105
          Height = 32
          Anchors = [akLeft, akBottom]
          Caption = 'Limpar Filtros'
          TabOrder = 2
          OnClick = btnLimparFiltroEstadoCidadeClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
    end
    object tsComplemento: TTabSheet
      Caption = 'Complementos de M'#233'dia'
      ImageIndex = 3
      object Bevel5: TBevel
        Left = 0
        Top = 165
        Width = 1153
        Height = 7
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 41
        ExplicitWidth = 767
      end
      object Panel5: TPanel
        Left = 0
        Top = 53
        Width = 1153
        Height = 112
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object btnCurso: TSpeedButton
          Left = 309
          Top = 33
          Width = 22
          Height = 22
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
          OnClick = sbCursoBusca
        end
        object Label8: TLabel
          Left = 23
          Top = 36
          Width = 32
          Height = 13
          Alignment = taCenter
          Caption = 'Curso:'
        end
        object Label10: TLabel
          Left = 21
          Top = 63
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object btnturma: TSpeedButton
          Left = 309
          Top = 58
          Width = 22
          Height = 22
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
          Left = 12
          Top = 9
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object SpeedButton33: TSpeedButton
          Left = 306
          Top = 5
          Width = 25
          Height = 22
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
          OnClick = sbSelecionaUnidadeEnsinoClick
        end
        object txtCCurso: TEdit
          Left = 61
          Top = 33
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 0
        end
        object txtCTurma: TEdit
          Left = 61
          Top = 58
          Width = 245
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 2
          OnKeyDown = ChecaLimpa
        end
        object txtCBim: TEdit
          Left = 269
          Top = 84
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 3
          Text = '1'
        end
        object cbCBim: TCheckBox
          Left = 22
          Top = 84
          Width = 240
          Height = 21
          Caption = 'Per'#237'odo de Avalia'#231#227'o (Bimestre, Trimestre...):'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = cbBimClick
        end
        object UpDown1: TUpDown
          Left = 294
          Top = 83
          Width = 13
          Height = 21
          TabOrder = 5
          OnClick = udBimClick
        end
        object BitBtn1: TBitBtn
          Left = 375
          Top = 11
          Width = 105
          Height = 35
          Caption = 'Filtrar'
          TabOrder = 6
          OnClick = btnFiltrarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object edCCurso: TEdit
          Left = 124
          Top = 33
          Width = 181
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 1
        end
        object BitBtn6: TBitBtn
          Left = 375
          Top = 50
          Width = 105
          Height = 32
          Caption = 'Limpar Filtros'
          TabOrder = 7
          OnClick = btnLimparClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object Edit4: TEdit
          Left = 61
          Top = 6
          Width = 244
          Height = 21
          ReadOnly = True
          TabOrder = 8
        end
      end
      object dbgComplemento: TDBGrid
        Left = 0
        Top = 172
        Width = 1153
        Height = 466
        Align = alClient
        DataSource = dtcAjuste
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = dbgAulasTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_turma'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_anosem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_etapa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_ajuste'
            Width = 220
            Visible = True
          end>
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 638
        Width = 1153
        Height = 28
        Align = alBottom
        ButtonWidth = 81
        Caption = 'toolAula'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object SpeedButton17: TSpeedButton
          Left = 0
          Top = 0
          Width = 25
          Height = 22
          Hint = 'Selecionar Colunas'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
            DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
            0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
            808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
            90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
            6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
            9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
            50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
            3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
            A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
            9F806000402000808080808020202000600000804000804020FF7F00BF000000
            00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
            2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
            702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
            0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
            A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
            9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
            8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
            707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
            DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
            DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
            AFAFAF303030000000000000000000000000000000000000000000303030AFAF
            AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbSelecionarColunaClick
        end
        object ToolButton36: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btIncluirComp: TToolButton
          Left = 33
          Top = 0
          AutoSize = True
          Caption = 'F2 Incluir'
          ImageIndex = 0
          OnClick = btIncluirAulaClick
        end
        object btAlterarComp: TToolButton
          Left = 108
          Top = 0
          AutoSize = True
          Caption = 'F3 Alterar'
          ImageIndex = 1
          OnClick = btAlterarAulaClick
        end
        object btExcluirComp: TToolButton
          Left = 187
          Top = 0
          AutoSize = True
          Caption = 'F9 Excluir'
          ImageIndex = 2
          OnClick = btExcluirAulaClick
        end
        object ToolButton45: TToolButton
          Left = 264
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btFecharComp: TToolButton
          Left = 272
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btFecharAulaClick
        end
      end
      object pnFiltroEstadoCidadeComplementosMedia: TPanel
        Left = 0
        Top = 0
        Width = 1153
        Height = 53
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          1153
          53)
        object Label39: TLabel
          Left = 12
          Top = 6
          Width = 202
          Height = 13
          Caption = 'Filtro de Estados e Cidades para trabalho:'
        end
        object Label40: TLabel
          Left = 13
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Estados:'
        end
        object Label41: TLabel
          Left = 357
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Cidades:'
        end
        object SpeedButton18: TSpeedButton
          Left = 307
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaEstadosClick
        end
        object SpeedButton19: TSpeedButton
          Left = 646
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaCidadesClick
        end
        object edEstadosComplementosMedia: TEdit
          Left = 61
          Top = 25
          Width = 244
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 0
          Text = 'Edit1'
        end
        object edCidadesComplementosMedia: TEdit
          Left = 405
          Top = 25
          Width = 243
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 1
          Text = 'Edit1'
        end
        object BitBtn10: TBitBtn
          Left = 694
          Top = 12
          Width = 105
          Height = 32
          Anchors = [akLeft, akBottom]
          Caption = 'Limpar Filtros'
          TabOrder = 2
          OnClick = btnLimparFiltroEstadoCidadeClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
    end
    object tsCronogramas: TTabSheet
      Caption = 'Cronogramas'
      ImageIndex = 4
      object Bevel8: TBevel
        Left = 0
        Top = 185
        Width = 1153
        Height = 7
        Align = alTop
        Shape = bsSpacer
        ExplicitLeft = -2
        ExplicitTop = 81
        ExplicitWidth = 935
      end
      object Panel6: TPanel
        Left = 0
        Top = 53
        Width = 1153
        Height = 132
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object SpeedButton9: TSpeedButton
          Left = 306
          Top = 33
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
          OnClick = sbCursoBusca
        end
        object Label9: TLabel
          Left = 23
          Top = 36
          Width = 32
          Height = 13
          Alignment = taCenter
          Caption = 'Curso:'
        end
        object Label12: TLabel
          Left = 21
          Top = 62
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma:'
        end
        object Label13: TLabel
          Left = 384
          Top = 36
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Disciplina:'
        end
        object lbUnidadeEnsino: TLabel
          Left = 12
          Top = 9
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object Label14: TLabel
          Left = 381
          Top = 9
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Professor:'
        end
        object Label15: TLabel
          Left = 8
          Top = 88
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. In'#237'cio:'
        end
        object Label16: TLabel
          Left = 186
          Top = 88
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Fim:'
        end
        object SpeedButton10: TSpeedButton
          Left = 678
          Top = 6
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
          OnClick = SpeedButton10Click
        end
        object sbTurmaBuscaCronograma: TSpeedButton
          Left = 306
          Top = 59
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
        object sbBuscaCronogramaDisciplina: TSpeedButton
          Left = 678
          Top = 33
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
          OnClick = sbBuscaCronogramaDisciplinaClick
        end
        object sbSelecionaUnidadeEnsino: TSpeedButton
          Left = 306
          Top = 5
          Width = 23
          Height = 22
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
          OnClick = sbSelecionaUnidadeEnsinoClick
        end
        object lbGrupoCronogramas: TLabel
          Left = 398
          Top = 62
          Width = 33
          Height = 13
          Alignment = taCenter
          Caption = 'Grupo:'
        end
        object sbBuscaGrupoCronogramas: TSpeedButton
          Left = 679
          Top = 59
          Width = 21
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
          OnClick = sbBuscaGrupoCronogramasClick
        end
        object sbLimpa: TSpeedButton
          Left = 335
          Top = 33
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = sbLimpaClick
        end
        object SpeedButton23: TSpeedButton
          Left = 335
          Top = 6
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton23Click
        end
        object SpeedButton24: TSpeedButton
          Left = 335
          Top = 59
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton24Click
        end
        object SpeedButton25: TSpeedButton
          Left = 706
          Top = 6
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton25Click
        end
        object SpeedButton26: TSpeedButton
          Left = 706
          Top = 33
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton26Click
        end
        object SpeedButton27: TSpeedButton
          Left = 706
          Top = 60
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton27Click
        end
        object txtCronogramasCurso: TEdit
          Left = 61
          Top = 33
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 0
        end
        object btnCronogramasFiltrar: TBitBtn
          Left = 739
          Top = 6
          Width = 105
          Height = 35
          Caption = 'Filtrar'
          TabOrder = 11
          OnClick = btnFiltrarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object btnLimpar: TBitBtn
          Left = 739
          Top = 47
          Width = 105
          Height = 32
          Caption = 'Limpar Filtros'
          TabOrder = 12
          OnClick = btnLimparClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object txtCronogramasCursoDescricao: TEdit
          Left = 126
          Top = 33
          Width = 179
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clMenuBar
          Enabled = False
          ReadOnly = True
          TabOrder = 9
        end
        object edCodigoProfessor: TEdit
          Left = 437
          Top = 6
          Width = 56
          Height = 21
          TabOrder = 2
          OnExit = edCodigoProfessorExit
          OnKeyPress = edCodigoProfessorKeyPress
        end
        object edNomeProfessor: TEdit
          Left = 496
          Top = 6
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 8
        end
        object ckbUsaDtInicio: TCheckBox
          Left = 61
          Top = 87
          Width = 15
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object ckbUsaDtFim: TCheckBox
          Left = 231
          Top = 87
          Width = 15
          Height = 17
          TabOrder = 7
        end
        object txtDiscCronograma: TEdit
          Left = 496
          Top = 33
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 10
        end
        object txtTurmaCronograma: TEdit
          Left = 61
          Top = 59
          Width = 244
          Height = 21
          TabOrder = 1
        end
        object edCodDiscCrono: TEdit
          Left = 437
          Top = 33
          Width = 56
          Height = 21
          TabOrder = 3
          OnExit = edCodDiscCronoExit
          OnKeyPress = edCodDiscCronoKeyPress
        end
        object edUnidadeEnsino: TEdit
          Left = 61
          Top = 6
          Width = 244
          Height = 21
          ReadOnly = True
          TabOrder = 13
        end
        object edCodGrupoCronogramas: TEdit
          Left = 437
          Top = 60
          Width = 56
          Height = 21
          TabOrder = 4
          OnKeyDown = ChecaLimpa
        end
        object edNomeGrupoCronogramas: TEdit
          Left = 496
          Top = 59
          Width = 181
          Height = 21
          TabStop = False
          Color = clMenuBar
          ReadOnly = True
          TabOrder = 5
        end
        object pnEtapa: TPanel
          Left = 336
          Top = 81
          Width = 369
          Height = 41
          BevelOuter = bvNone
          TabOrder = 14
          DesignSize = (
            369
            41)
          object Label11: TLabel
            Left = 13
            Top = 7
            Width = 220
            Height = 13
            Alignment = taCenter
            Caption = 'Per'#237'odo de Avalia'#231#227'o (Bimestre, Trimestre...):'
          end
          object edBimestreCronograma: TEdit
            Left = 240
            Top = 1
            Width = 26
            Height = 21
            Anchors = [akLeft, akBottom]
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 0
            Text = '1'
          end
          object UpDown2: TUpDown
            Left = 271
            Top = 1
            Width = 15
            Height = 21
            Anchors = [akLeft, akBottom]
            Min = 1
            Max = 50
            Position = 1
            TabOrder = 1
            OnChangingEx = UpDown2ChangingEx
          end
        end
        object umdtInicio: TUMDateTimePicker
          Left = 82
          Top = 86
          Width = 90
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
          Date = 42475.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
        object umdtFim: TUMDateTimePicker
          Left = 252
          Top = 86
          Width = 90
          Height = 21
          BevelOuter = bvNone
          TabOrder = 16
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
          Date = 42475.000000000000000000
          InverterPosicaoCalendario = False
          MostraCalenadarioDesdeCampoTexto = False
        end
      end
      object dbgCronogramas: TDBGrid
        Left = 0
        Top = 192
        Width = 1153
        Height = 446
        Align = alClient
        DataSource = dsCronogramas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = dbgAulasTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nm_professor'
            Width = 174
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cronograma'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dia_semana'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_horario'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ordem'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_turma'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_disciplina'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_coligada'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'curso'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_grupo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ds_sala'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'cd_diario_aula'
            Title.Caption = 'C'#243'd. Aula'
            Visible = True
          end>
      end
      object ToolBar4: TToolBar
        Left = 0
        Top = 638
        Width = 1153
        Height = 28
        Align = alBottom
        ButtonWidth = 121
        Caption = 'toolAula'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object SpeedButton22: TSpeedButton
          Left = 0
          Top = 0
          Width = 25
          Height = 22
          Hint = 'Selecionar Colunas'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
            DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
            0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
            808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
            90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
            6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
            9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
            50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
            3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
            A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
            9F806000402000808080808020202000600000804000804020FF7F00BF000000
            00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
            2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
            702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
            0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
            A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
            9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
            8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
            707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
            DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
            DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
            AFAFAF303030000000000000000000000000000000000000000000303030AFAF
            AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbSelecionarColunaClick
        end
        object ToolButton10: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object Panel13: TPanel
          Left = 33
          Top = 0
          Width = 123
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object sbPgAnterior: TSpeedButton
            Left = 0
            Top = 0
            Width = 24
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333FF3333333333333003333333333333F77F33333333333009033
              333333333F7737F333333333009990333333333F773337FFFFFF330099999000
              00003F773333377777770099999999999990773FF33333FFFFF7330099999000
              000033773FF33777777733330099903333333333773FF7F33333333333009033
              33333333337737F3333333333333003333333333333377333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = sbPgAnteriorClick
          end
          object sbPgProximo: TSpeedButton
            Left = 89
            Top = 0
            Width = 24
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333FF3333333333333003333
              3333333333773FF3333333333309003333333333337F773FF333333333099900
              33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
              99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
              33333333337F3F77333333333309003333333333337F77333333333333003333
              3333333333773333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = sbPgProximoClick
          end
          object txtPg: TPanel
            Tag = 1
            Left = 24
            Top = 0
            Width = 65
            Height = 22
            BevelOuter = bvLowered
            Caption = 'P'#225'g. 1'
            TabOrder = 0
          end
        end
        object ToolButton61: TToolButton
          Left = 156
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btIncluirCro: TToolButton
          Left = 164
          Top = 0
          AutoSize = True
          Caption = 'F2 Incluir'
          ImageIndex = 0
          OnClick = btIncluirAulaClick
        end
        object btAlterarCro: TToolButton
          Left = 239
          Top = 0
          AutoSize = True
          Caption = 'F3 Alterar'
          ImageIndex = 1
          OnClick = btAlterarAulaClick
        end
        object btExcluirCro: TToolButton
          Left = 318
          Top = 0
          AutoSize = True
          Caption = 'F9 Excluir'
          ImageIndex = 2
          OnClick = btExcluirAulaClick
        end
        object ToolButton59: TToolButton
          Left = 395
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btCopiarCro: TToolButton
          Left = 403
          Top = 0
          AutoSize = True
          Caption = 'Copiar Informa'#231#245'es'
          ImageIndex = 10
          OnClick = btnCopiarInformacoesClick
        end
        object ToolButton12: TToolButton
          Left = 528
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object ToolButton9: TToolButton
          Left = 536
          Top = 0
          AutoSize = True
          Caption = 'Alterar professor'
          ImageIndex = 1
          OnClick = ToolButton9Click
        end
        object ToolButton3: TToolButton
          Left = 649
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object btFecharCro: TToolButton
          Left = 657
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 7
          OnClick = btFecharAulaClick
        end
      end
      object pnFiltroEstadoCidadeCronogramas: TPanel
        Left = 0
        Top = 0
        Width = 1153
        Height = 53
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          1153
          53)
        object Label36: TLabel
          Left = 12
          Top = 6
          Width = 202
          Height = 13
          Caption = 'Filtro de Estados e Cidades para trabalho:'
        end
        object Label37: TLabel
          Left = 13
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Estados:'
        end
        object Label38: TLabel
          Left = 391
          Top = 28
          Width = 42
          Height = 13
          Caption = 'Cidades:'
        end
        object SpeedButton15: TSpeedButton
          Left = 307
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaEstadosClick
        end
        object SpeedButton16: TSpeedButton
          Left = 680
          Top = 25
          Width = 23
          Height = 22
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
          OnClick = sbBuscaCidadesClick
        end
        object SpeedButton28: TSpeedButton
          Left = 336
          Top = 25
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton28Click
        end
        object SpeedButton29: TSpeedButton
          Left = 708
          Top = 25
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = SpeedButton29Click
        end
        object edEstadosCronogramas: TEdit
          Left = 61
          Top = 25
          Width = 244
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 0
          Text = 'Edit1'
        end
        object edCidadesCronogramas: TEdit
          Left = 439
          Top = 25
          Width = 243
          Height = 21
          Color = clMenuBar
          Enabled = False
          TabOrder = 1
          Text = 'Edit1'
        end
        object BitBtn11: TBitBtn
          Left = 739
          Top = 15
          Width = 105
          Height = 32
          Anchors = [akLeft, akBottom]
          Caption = 'Limpar Filtros'
          TabOrder = 2
          OnClick = btnLimparFiltroEstadoCidadeClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
    end
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 586
  end
  object qyAulas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyAulasCalcFields
    SQL.Strings = (
      'SELECT'
      '  DA.CD_DIARIO_AULA,'
      '  DA.TURMA,'
      '  DA.ANOSEMESTRE,'
      '  D.DESCRICAO,'
      '  D.SIGLA,'
      '  DA.DISCIPLINA,'
      '  T.CURSO,'
      '  DA.BIMESTRE,'
      '  DA.`DATA`,'
      '  DA.SN_BLOQUEADO,'
      '  DA.NRO_AULA,'
      '  DA.QTD_AULAS,'
      '  DA.CD_PROFESSOR,'
      '  P.NM_PESSOA,'
      '  DA.CONTEUDO,'
      '  C.CD_COLIGADA,'
      '  C.NM_COLIGADA,'
      '  ATI.DS_AULA_TIPO,'
      '  DA.CD_AULA_TIPO,'
      '  S.`DS_VALOR` `DS_SITUACAO`,'
      '  ('
      '    SELECT'
      
        '        GROUP_CONCAT(CONCAT(P.`NR_ICONE`, '#39':'#39', S.`DS_COR`) SEPAR' +
        'ATOR '#39';'#39')'
      '    FROM'
      '      `LGTC_DESPESA_AULA` E'
      ''
      '        JOIN `LGTC_TIPO_DESPESA` P ON'
      '          (E.`CD_TIPO_DESPESA` = P.`CD_TIPO_DESPESA`)'
      ''
      '        JOIN `LGTC_DESPESA_SITUACAO` S ON'
      '          (E.`CD_SITUACAO` = S.`CD_SITUACAO`)'
      '    WHERE'
      '      E.`CD_DIARIO_AULA` = DA.`CD_DIARIO_AULA`'
      '    ORDER BY'
      '      P.`CD_TIPO_DESPESA`,'
      '      S.`CD_SITUACAO`'
      '  ) DS_DESPESAS'
      'FROM'
      '  DIARIO_AULAS DA'
      ''
      '    JOIN TURMAS T ON'
      '      (DA.ANOSEMESTRE = T.ANOSEMESTRE) AND'
      '      (DA.TURMA = T.CODIGO)'
      ''
      '    JOIN DISCIPLINAS D ON'
      '      (DA.DISCIPLINA = D.CODIGO) AND'
      '      (T.CURSO = D.CURSO)'
      ''
      '    JOIN COLIGADAS C ON'
      '      (C.CD_COLIGADA = T.CD_COLIGADA)'
      ''
      '    LEFT JOIN PESSOAS P ON'
      '      (DA.CD_PROFESSOR = P.CD_PESSOA)'
      ''
      '    LEFT JOIN AULAS_TIPOS ATI ON'
      '      (ATI.CD_AULA_TIPO = DA.CD_AULA_TIPO)'
      ''
      '    LEFT JOIN `SITUACOES` S ON'
      '      (DA.`CD_SITUACAO` = S.`CD_SITUACAO`) AND'
      '      (S.`CD_MODULO` = 1029)'
      '      '
      'LIMIT 10')
    Params = <>
    Left = 504
    object qyAulasturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'turma'
      Size = 50
    end
    object qyAulasanosemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem'
      DisplayWidth = 8
      FieldName = 'anosemestre'
    end
    object qyAulascd_diario_aula: TLargeintField
      Tag = 1
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd. Aula'
      FieldName = 'cd_diario_aula'
    end
    object qyAulasbimestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Etapa'
      DisplayWidth = 5
      FieldName = 'bimestre'
    end
    object qyAulassn_bloqueado: TIntegerField
      Tag = 1
      DisplayLabel = 'Bloq.'
      DisplayWidth = 5
      FieldName = 'sn_bloqueado'
    end
    object qyAulasnro_aula: TSmallintField
      Tag = 1
      DisplayLabel = 'Num.'
      DisplayWidth = 5
      FieldName = 'nro_aula'
    end
    object qyAulasqtd_aulas: TSmallintField
      Tag = 1
      DisplayLabel = 'Aulas'
      DisplayWidth = 5
      FieldName = 'qtd_aulas'
    end
    object qyAulascd_professor: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Prof.'
      FieldName = 'cd_professor'
    end
    object qyAulasdata: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyAulasdescricao: TStringField
      Tag = 1
      DisplayLabel = 'Disciplina'
      DisplayWidth = 40
      FieldName = 'descricao'
      Size = 150
    end
    object qyAulassigla: TStringField
      Tag = 1
      DisplayLabel = 'Sigla'
      DisplayWidth = 8
      FieldName = 'sigla'
      Size = 5
    end
    object qyAulasdisciplina: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Disc.'
      FieldName = 'disciplina'
    end
    object qyAulasnm_pessoa: TStringField
      Tag = 1
      DisplayLabel = 'Professor'
      DisplayWidth = 30
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyAulasdesc_conteudo: TStringField
      Tag = 1
      DisplayLabel = 'Conte'#250'do'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'desc_conteudo'
      Size = 150
      Calculated = True
    end
    object qyAulasconteudo: TMemoField
      FieldName = 'conteudo'
      BlobType = ftMemo
      Size = 1
    end
    object qyAulasbloqueado: TStringField
      FieldKind = fkCalculated
      FieldName = 'bloqueado'
      Size = 10
      Calculated = True
    end
    object qyAulascurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      FieldName = 'curso'
      Size = 15
    end
    object qyAulasnm_unidade: TStringField
      Tag = 1
      DisplayLabel = 'Unidade'
      DisplayWidth = 50
      FieldName = 'nm_coligada'
      Size = 200
    end
    object qyAulasaula: TStringField
      Tag = 1
      DisplayLabel = 'Num. Aulas'
      FieldKind = fkCalculated
      FieldName = 'aula'
      Size = 25
      Calculated = True
    end
    object qyAulasnm_grupo: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Grupo'
      DisplayWidth = 40
      FieldName = 'nm_grupo'
      Size = 255
    end
    object qyAulascd_grupo: TIntegerField
      FieldName = 'cd_grupo'
    end
    object qyAulascd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qyAulascompartilha: TStringField
      Tag = 1
      DisplayLabel = 'Compartilhada'
      FieldName = 'compartilha'
    end
    object qyAulassn_aula_compartilhada: TSmallintField
      FieldName = 'sn_aula_compartilhada'
    end
    object qyAulasds_aula_tipo: TStringField
      Tag = 1
      DisplayLabel = 'Tipo de aula'
      FieldName = 'ds_aula_tipo'
      Size = 255
    end
    object qyAulascd_aula_tipo: TIntegerField
      FieldName = 'cd_aula_tipo'
    end
    object qyAulasDS_ICONES: TStringField
      Tag = 1
      DisplayLabel = 'Despesas'
      FieldKind = fkCalculated
      FieldName = 'DS_ICONES'
      Calculated = True
    end
    object qyAulasDS_DESPESAS: TMemoField
      FieldName = 'DS_DESPESAS'
      ReadOnly = True
      BlobType = ftMemo
    end
    object qyAulasDS_SITUACAO: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'DS_SITUACAO'
      ReadOnly = True
      Size = 255
    end
  end
  object dtcAulas: TDataSource
    AutoEdit = False
    DataSet = qyAulas
    OnStateChange = dtcAulasStateChange
    Left = 540
  end
  object ImageList2: TImageList
    Left = 808
    Top = 392
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000008D5D59008D5D59008D5D59008D5D59008D5D59008D5D59008D5D
      59008D5D59008D5D59008D5D590000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D5D5900F6E1CC00FEDAB600FED7AF00FECD9D00FECA9700FDC3
      8B00FBC08700FBC08700FBC087000000000061866BFF61866BFF61866BFF6186
      6BFF61866BFF61866BFFA7ADA9FFABACACFFABACACFFA7ADA9FF61866BFF6186
      6BFF61866BFF61866BFF61866BFF61866BFF0000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000093605900FCE9D600FEDFBF00FEDCBA00FED3A800FECFA100FEC6
      8F00FDC38B00FBC08700FBC08700000000004B6C56FF4B6C56FF4B6C56FF4B6C
      56FF4B6C56FF4B6C56FFA0A4A2FFA4A5A5FFA4A5A5FFA0A4A2FF4B6C56FF4B6C
      56FF4B6C56FF4B6C56FF4B6C56FF4B6C56FF0000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0675E00FDF5ED00FEEEDE00FCE9D600FEDFBF00FEDAB600FED1
      A500FECC9B00FEC68F00FDC38B0000000000537A5FFF537A5FFF537A5FFF537A
      5FFF537A5FFF537A5FFFA1A5A3FFA4A5A5FFA4A5A5FFA1A5A3FF537A5FFF537A
      5FFF537A5FFF537A5FFF537A5FFF537A5FFF0000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D5D59008D5D59008D5D
      59008D5D5900A2696100FDFAF700FDF3E900FEEEDE00FAE6D100FEDFBF00FED7
      AF00FED3A800FECA9700FEC893000000000053745EFF53745EFF53745EFF5374
      5EFF53745EFF53745EFFA1A4A2FFA4A5A5FFA4A5A5FFA1A4A2FF53745EFF5374
      5EFF53745EFF53745EFF53745EFF53745EFF0000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001FFF00000000000000
      00000000000000000000000000000000000000000000F6E1CC00FEDFBF00FED7
      AF00FED1A500B2796300FEFDFE00FDFBF900FDF8F300FDF0E300FEEEDE00FAE6
      D100FEDFBF00FED5AB00FED1A50000000000678B74FF678B74FF678B74FF678B
      74FF678B74FF678B74FFA4ADA7FFAAAFACFFAAAFACFFA4ADA7FF678B74FF678B
      74FF678B74FF678B74FF678B74FF678B74FF00000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001FFF00001FFF00001FFF000000
      00000000000000000000000000000000000000000000FCE9D600FAE6D100FEDC
      BA00FED7AF00BA7F6100FEFDFE00FEFDFE00FDFCFA00FDF5ED00FDF3E900FCE9
      D600FAE6D100FEDCBA00FED7AF0000000000618C6EFF84A994FF628D6FFF618C
      6EFF618C6EFF618C6EFFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF618C6EFF618C
      6EFF618C6EFF628D6FFF84A994FF618C6EFF000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000001FFF00001FFF00001FFF00001FFF00001F
      FF000000000000000000000000000000000000000000FDF5ED00FDF0E300FCE9
      D600FAE6D100D3946C00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDFBF900FDF5
      ED00FDF0E300FCE9D600F6E1CC0000000000648E71FFA5C3B8FF6D967CFFCEE4
      E3FFD3E8E9FF84A994FFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF84A994FFD3E8
      E9FFCEE4E3FF6D967CFFA5C3B8FF648E71FF7F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001FFF00000000000000
      00000000000000000000000000000000000000000000FDFAF700FDF7F100FEEE
      DE00FCE9D600D4976F00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FDF3
      E900F3DEC800C0A69000BEA38D0000000000618C6EFF779E86FFB3CEC6FFD3E8
      E9FFA2C0B4FF618C6EFFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF618C6EFFA2C0
      B4FFD3E8E9FFB3CEC6FF779E86FF618C6EFF0000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDF8
      F300FDF5ED00D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DF924000DE903C0000000000618C6EFFA1C0B3FFD3E8E9FFD3E8
      E9FF799F88FF618C6EFFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF618C6EFF799F
      88FFD3E8E9FFD3E8E9FFA1C0B3FF618C6EFF0000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001FFF0000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FDFC
      FA00FDFAF700D89F7600FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFDFE00FEFD
      FE00A0675E00DE944400DE903C0000000000618C6EFFA1C0B3FFD3E8E9FFD3E8
      E9FF729A80FF618C6EFFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF618C6EFF729A
      80FFD3E8E9FFD3E8E9FFA1C0B3FF618C6EFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000001FFF0000000000001FFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00D89F7600D3946C00D3946C00D3946C00D3946C00D3946C00D394
      6C00A0675E00000000000000000000000000618C6EFF8AAD9AFFCAE1DFFFD3E8
      E9FF91B3A2FF618C6EFFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF618C6EFF91B3
      A2FFD3E8E9FFCAE1DFFF8AAD9AFF618C6EFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FDFCFA00F3DEC800C6AD9500BEA38D00724241000000
      000000000000000000000000000000000000618C6EFF84A994FF70997EFFD2E7
      E8FFCDE4E3FF6C9479FFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF6C9479FFCDE4
      E3FFD2E7E8FF70997EFF84A994FF618C6EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DC9B5C00DE903C00A56C64000000
      000000000000000000000000000000000000648E71FFA5C3B8FF699276FF7DA2
      8CFF81A691FF7EA38DFFB3C0B5FFD2D4D1FFD2D4D1FFB3C0B5FF7EA38DFF81A6
      91FF7DA28CFF699276FFA5C3B8FF648E71FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFDFE00FEFDFE00FEFD
      FE00FEFDFE00FEFDFE00FEFDFE00A0675E00DB9D6300DE903C00000000000000
      0000000000000000000000000000000000008CAC95FF8CAC95FF8CAC95FF8CAC
      95FF8CAC95FF8CAC95FFADBDB1FFBCC7BDFFBCC7BDFFADBDB1FF8CAC95FF8CAC
      95FF8CAC95FF8CAC95FF8CAC95FF8CAC95FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3946C00D3946C00D394
      6C00D3946C00D3946C00D3946C00A0675E00DB9D630000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
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
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF801FFFFFFFFFFFFF8010000
      F9FFFFFFF8010000F0FFFFFFF8010000F0FFFFFF80010000E07FFFBF80010000
      C07FFF1F80010000843FFE0F800100001E3FFFBF80010000FE1FFFFF80010000
      FF1FFF7F80010000FF8FF5FF80070000FFC7FFFF801F0000FFE3FFFF801F0000
      FFF8FFFF803F0000FFFFFFFF807FFFFFFFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyProvas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyProvasCalcFields
    SQL.Strings = (
      'SELECT'
      
        '   dp.turma, dp.anosemestre, dp.disciplina, dp.bimestre, t.curso' +
        ',              '
      
        '   data, dp.assunto, dp.sn_bloqueado, dp.cd_professor,          ' +
        '    '
      '   dp.nro_nota, d.descricao, d.sigla, p.nm_pessoa,'
      
        '   dp.sn_compoe, dp.sn_especial, dp.sn_proficiencia, dp.vl_peso,' +
        ' '
      '   dp.cd_avaliacao_tipo, avt.ds_avaliacao,'
      '   dp.nr_nota_maxima, dp.nr_nota_minima, avt.cd_tipo '
      
        'FROM                                                            ' +
        '      '
      
        '   diario_provas AS dp                                          ' +
        '         '
      
        '   INNER JOIN turmas AS t ON (dp.turma = t.codigo) AND (dp.anose' +
        'mestre = t.anosemestre) '
      
        '   INNER JOIN disciplinas AS d ON (dp.disciplina = d.codigo AND ' +
        'd.curso = t.curso )  '
      
        '   LEFT JOIN avaliacoes_tipos avt ON (avt.cd_avaliacao_tipo = dp' +
        '.cd_avaliacao_tipo)'
      '   LEFT JOIN pessoas AS p ON (dp.cd_professor = p.cd_pessoa)'
      'LIMIT 10')
    Params = <>
    Left = 632
    object qyProvasturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'turma'
      Size = 50
    end
    object qyProvasanosemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem'
      DisplayWidth = 8
      FieldName = 'anosemestre'
    end
    object qyProvasdisciplina: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Disc.'
      DisplayWidth = 7
      FieldName = 'disciplina'
    end
    object qyProvasbimestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Etapa'
      DisplayWidth = 5
      FieldName = 'bimestre'
    end
    object qyProvasassunto: TStringField
      Tag = 1
      DisplayLabel = 'Assunto'
      DisplayWidth = 30
      FieldName = 'assunto'
      Size = 200
    end
    object qyProvassn_bloqueado: TSmallintField
      Tag = 1
      DisplayLabel = 'Bloq.'
      DisplayWidth = 5
      FieldName = 'sn_bloqueado'
    end
    object qyProvascd_professor: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Prof.'
      FieldName = 'cd_professor'
    end
    object qyProvasnro_nota: TSmallintField
      Tag = 1
      DisplayLabel = 'Num.'
      DisplayWidth = 5
      FieldName = 'nro_nota'
    end
    object qyProvasdata: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyProvasdescricao: TStringField
      Tag = 1
      DisplayLabel = 'Disciplina'
      DisplayWidth = 40
      FieldName = 'descricao'
      Size = 150
    end
    object qyProvassigla: TStringField
      Tag = 1
      DisplayLabel = 'Sigla'
      DisplayWidth = 8
      FieldName = 'sigla'
      Size = 5
    end
    object qyProvasnm_pessoa: TStringField
      Tag = 1
      DisplayLabel = 'Professor'
      DisplayWidth = 30
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyProvassn_compoe: TIntegerField
      FieldName = 'sn_compoe'
    end
    object qyProvassn_especial: TIntegerField
      FieldName = 'sn_especial'
    end
    object qyProvassn_proficiencia: TIntegerField
      FieldName = 'sn_proficiencia'
    end
    object qyProvasds_tipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'ds_tipo'
      Calculated = True
    end
    object qyProvasbloqueado: TStringField
      DisplayLabel = 'Bloq.'
      FieldKind = fkCalculated
      FieldName = 'bloqueado'
      Calculated = True
    end
    object qyProvasvl_peso: TFloatField
      Tag = 1
      DisplayLabel = 'Peso'
      FieldName = 'vl_peso'
    end
    object qyProvascd_avaliacao_tipo: TIntegerField
      FieldName = 'cd_avaliacao_tipo'
    end
    object qyProvasds_avaliacao: TStringField
      Tag = 1
      DisplayLabel = 'Tipo de Avalia'#231#227'o'
      DisplayWidth = 20
      FieldName = 'ds_avaliacao'
      Required = True
      Size = 100
    end
    object qyProvascurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      FieldName = 'curso'
      Size = 15
    end
    object qyProvasnr_nota_maxima: TFloatField
      Tag = 1
      DisplayLabel = 'Nota m'#225'xima'
      FieldName = 'nr_nota_maxima'
    end
    object qyProvasnr_nota_minima: TFloatField
      Tag = 1
      DisplayLabel = 'Nota m'#237'nima'
      FieldName = 'nr_nota_minima'
    end
    object qyProvasnm_grupo: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Grupo'
      DisplayWidth = 40
      FieldName = 'nm_grupo'
      Size = 255
    end
    object qyProvascd_grupo: TIntegerField
      FieldName = 'cd_grupo'
    end
    object qyProvascd_prova: TIntegerField
      FieldName = 'cd_prova'
    end
    object qyProvascd_tipo: TIntegerField
      FieldName = 'cd_tipo'
    end
    object qyProvassn_diario_fechado: TIntegerField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o do di'#225'rio'
      FieldName = 'sn_diario_fechado'
      OnGetText = qyProvassn_diario_fechadoGetText
    end
    object qyProvascompartilha: TStringField
      Tag = 1
      DisplayLabel = 'Compartilhada'
      FieldName = 'compartilha'
    end
  end
  object dtcProvas: TDataSource
    AutoEdit = False
    DataSet = qyProvas
    Left = 661
  end
  object qyAprovacao: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyAprovacaoCalcFields
    SQL.Strings = (
      'SELECT'
      
        '   dpa.cd_alteracao, dpa.nro_nota,  dpa.turma, dpa.anosemestre, ' +
        'dpa.disciplina,       '
      
        '   dpa.bimestre, dpa.codaluno, dpa.nr_nota_antiga, dpa.nr_nota_n' +
        'ova,                  '
      
        '   dpa.cd_situacao, dpa.ds_requerimento, dpa.ds_resposta, d.sigl' +
        'a, d.descricao, '
      
        '   p_aluno.nm_pessoa, dp.assunto, dp.cd_professor, p.nm_pessoa A' +
        'S nm_professor,'
      
        '   solicitante.nm_pessoa nm_solicitante, dpa.dt_deferimento, dpa' +
        '.dt_alteracao                                    '
      
        ' FROM                                                           ' +
        '                       '
      
        '   diario_provas_alteracoes dpa                                 ' +
        '                      '
      
        '   INNER JOIN diario_provas dp ON (dpa.nro_nota = dp.nro_nota) A' +
        'ND (dpa.turma = dp.turma) AND (dpa.anosemestre = dp.anosemestre)' +
        ' AND (dpa.disciplina = dp.disciplina) AND (dpa.bimestre = dp.bim' +
        'estre)'
      
        '   INNER JOIN turmas t ON (dpa.turma = t.codigo) AND (dpa.anosem' +
        'estre = t.anosemestre) '
      
        '   INNER JOIN disciplinas d ON (dpa.disciplina = d.codigo AND d.' +
        'curso = t.curso )    '
      
        '   INNER JOIN pessoas p_aluno ON (dpa.codaluno = p_aluno.cd_pess' +
        'oa)                  '
      
        '   INNER JOIN pessoas solicitante ON (dpa.cd_professor = solicit' +
        'ante.cd_pessoa)'
      '   LEFT JOIN pessoas AS p ON (dp.cd_professor = p.cd_pessoa)'
      ' LIMIT 10'
      ' ')
    Params = <>
    Left = 704
    object qyAprovacaocd_alteracao: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Alt.'
      DisplayWidth = 5
      FieldName = 'cd_alteracao'
    end
    object qyAprovacaonro_nota: TSmallintField
      Tag = 1
      DisplayLabel = 'N'#186' Nota'
      DisplayWidth = 5
      FieldName = 'nro_nota'
    end
    object qyAprovacaoturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'turma'
      Size = 50
    end
    object qyAprovacaoanosemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem'
      DisplayWidth = 8
      FieldName = 'anosemestre'
    end
    object qyAprovacaodisciplina: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Disc.'
      DisplayWidth = 5
      FieldName = 'disciplina'
    end
    object qyAprovacaobimestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Etapa'
      DisplayWidth = 5
      FieldName = 'bimestre'
    end
    object qyAprovacaocodaluno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Aluno'
      FieldName = 'codaluno'
    end
    object qyAprovacaonr_nota_antiga: TFloatField
      DisplayLabel = 'Nt Antiga'
      FieldName = 'nr_nota_antiga'
      DisplayFormat = '##.00'
    end
    object qyAprovacaonr_nota_nova: TFloatField
      DisplayLabel = 'Nt Nova'
      DisplayWidth = 10
      FieldName = 'nr_nota_nova'
      DisplayFormat = '##.00'
    end
    object qyAprovacaocd_situacao: TSmallintField
      FieldName = 'cd_situacao'
    end
    object qyAprovacaods_requerimento: TMemoField
      FieldName = 'ds_requerimento'
      BlobType = ftMemo
      Size = 1
    end
    object qyAprovacaods_resposta: TMemoField
      FieldName = 'ds_resposta'
      BlobType = ftMemo
      Size = 1
    end
    object qyAprovacaosigla: TStringField
      Tag = 1
      DisplayLabel = 'Sigla'
      DisplayWidth = 8
      FieldName = 'sigla'
      Size = 5
    end
    object qyAprovacaonm_pessoa: TStringField
      Tag = 1
      DisplayLabel = 'Aluno'
      DisplayWidth = 30
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyAprovacaoassunto: TStringField
      Tag = 1
      DisplayLabel = 'Assunto'
      DisplayWidth = 30
      FieldName = 'assunto'
      Size = 200
    end
    object qyAprovacaocd_professor: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Prof.'
      DisplayWidth = 5
      FieldName = 'cd_professor'
    end
    object qyAprovacaosituacao: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'situacao'
      Calculated = True
    end
    object qyAprovacaodescricao: TStringField
      Tag = 1
      DisplayLabel = 'Disciplina'
      DisplayWidth = 40
      FieldName = 'descricao'
      Size = 150
    end
    object qyAprovacaonm_professor: TStringField
      Tag = 1
      DisplayLabel = 'Professor'
      DisplayWidth = 30
      FieldName = 'nm_professor'
      Size = 60
    end
    object qyAprovacaodesc_motivo: TStringField
      Tag = 1
      DisplayLabel = 'Motivo'
      FieldKind = fkCalculated
      FieldName = 'desc_motivo'
      Size = 100
      Calculated = True
    end
    object qyAprovacaodesc_resposta: TStringField
      Tag = 1
      DisplayLabel = 'Resposta'
      FieldKind = fkCalculated
      FieldName = 'desc_resposta'
      Size = 100
      Calculated = True
    end
    object qyAprovacaodt_alteracao: TDateTimeField
      DisplayLabel = 'Data altera'#231#227'o'
      FieldName = 'dt_alteracao'
    end
    object qyAprovacaodt_deferimento: TDateTimeField
      DisplayLabel = 'Data deferimento'
      FieldName = 'dt_deferimento'
    end
    object qyAprovacaosn_faltou_antigo: TSmallintField
      FieldName = 'sn_faltou_antigo'
    end
    object qyAprovacaosn_faltou_novo: TSmallintField
      FieldName = 'sn_faltou_novo'
    end
    object qyAprovacaonr_nota_antiga_calc: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Nt Antiga'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'nr_nota_antiga_calc'
      Calculated = True
    end
    object qyAprovacaonr_nota_nova_calc: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Nt Nova'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'nr_nota_nova_calc'
      Calculated = True
    end
  end
  object dtcAprovacao: TDataSource
    DataSet = qyAprovacao
    Left = 733
  end
  object qyAjustes: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyAulasCalcFields
    SQL.Strings = (
      'SELECT'
      'dat.*,'
      'da.ds_ajuste'
      'FROM diario_ajustes_turmas dat'
      
        'INNER JOIN turmas tu ON (dat.cd_turma = tu.codigo AND dat.nr_ano' +
        'sem = tu.anosemestre)'
      'INNER JOIN diario_ajustes da ON (da.cd_ajuste = dat.cd_ajuste)'
      'ORDER BY'
      'da.ds_ajuste'
      'LIMIT 0')
    Params = <>
    Left = 504
    Top = 32
    object qyAjustescd_turma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'cd_turma'
      Size = 50
    end
    object qyAjustesds_ajuste: TStringField
      Tag = 1
      DisplayLabel = 'Ajuste'
      FieldName = 'ds_ajuste'
      Size = 100
    end
    object qyAjustesnr_anosem: TLargeintField
      Tag = 1
      DisplayLabel = 'Ano/Sem'
      FieldName = 'nr_anosem'
    end
    object qyAjustesnr_etapa: TLargeintField
      Tag = 1
      DisplayLabel = 'Etapa'
      FieldName = 'nr_etapa'
    end
    object qyAjustescd_ajuste_turma: TLargeintField
      FieldName = 'cd_ajuste_turma'
      Required = True
    end
    object qyAjustescd_ajuste: TLargeintField
      Tag = 1
      DisplayLabel = 'C'#243'd.Ajuste'
      FieldName = 'cd_ajuste'
    end
  end
  object dtcAjuste: TDataSource
    AutoEdit = False
    DataSet = qyAjustes
    OnStateChange = dtcAulasStateChange
    Left = 540
    Top = 32
  end
  object qCronogramas: TUMZQuery
    Connection = DM.db
    BeforeOpen = qCronogramasBeforeOpen
    OnCalcFields = qCronogramasCalcFields
    Params = <>
    Left = 472
    object qCronogramasnm_professor: TStringField
      Tag = 1
      DisplayLabel = 'Professor'
      DisplayWidth = 25
      FieldName = 'nm_professor'
      Size = 200
    end
    object qCronogramasdt_cronograma: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data'
      DisplayWidth = 14
      FieldName = 'dt_cronograma'
    end
    object qCronogramasds_horario: TStringField
      Tag = 1
      DisplayLabel = 'Hor'#225'rio'
      DisplayWidth = 17
      FieldName = 'ds_horario'
      Size = 100
    end
    object qCronogramasds_turma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 22
      FieldName = 'ds_turma'
      Size = 100
    end
    object qCronogramascd_coligada: TIntegerField
      FieldName = 'cd_coligada'
    end
    object qCronogramasnm_coligada: TStringField
      Tag = 1
      DisplayLabel = 'Unidade'
      DisplayWidth = 13
      FieldName = 'nm_coligada'
      Size = 100
    end
    object qCronogramasdia_semana: TStringField
      Tag = 1
      DisplayLabel = 'Dia'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'dia_semana'
      Calculated = True
    end
    object qCronogramasds_disciplina: TStringField
      Tag = 1
      DisplayLabel = 'Disciplina'
      DisplayWidth = 14
      FieldName = 'ds_disciplina'
      Size = 100
    end
    object qCronogramascd_cronograma: TLargeintField
      FieldName = 'cd_cronograma'
    end
    object qCronogramasturma: TStringField
      DisplayWidth = 22
      FieldName = 'turma'
      Size = 50
    end
    object qCronogramasdisciplina: TLargeintField
      DisplayWidth = 14
      FieldName = 'disciplina'
    end
    object qCronogramasanosemestre: TIntegerField
      FieldName = 'anosemestre'
    end
    object qCronogramascurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      DisplayWidth = 18
      FieldName = 'curso'
      Size = 15
    end
    object qCronogramasordem: TStringField
      Tag = 1
      DisplayLabel = 'Aula'
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'ordem'
      Size = 10
      Calculated = True
    end
    object qCronogramascd_horario: TLargeintField
      FieldName = 'cd_horario'
    end
    object qCronogramasnm_grupo: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Grupo'
      DisplayWidth = 40
      FieldName = 'nm_grupo'
      Size = 255
    end
    object qCronogramascd_grupo: TIntegerField
      FieldName = 'cd_grupo'
    end
    object qCronogramasds_sala: TStringField
      Tag = 1
      DisplayLabel = 'Sala'
      FieldName = 'ds_sala'
    end
    object qCronogramascd_professor: TLargeintField
      FieldName = 'cd_professor'
    end
    object qCronogramasbimestre: TSmallintField
      FieldName = 'bimestre'
    end
  end
  object dsCronogramas: TDataSource
    DataSet = qCronogramas
    Left = 472
    Top = 32
  end
  object qyGrupoAtividade: TUMZQuery
    Connection = DM.db
    BeforeOpen = qCronogramasBeforeOpen
    OnCalcFields = qCronogramasCalcFields
    SQL.Strings = (
      'SELECT COUNT(cd_grupo) qtd FROM diario_grupos')
    Params = <>
    Left = 896
    Top = 72
    object qyGrupoAtividadeqtd: TLargeintField
      FieldName = 'qtd'
    end
  end
  object pmDespesas: TPopupMenu
    OnPopup = pmDespesasPopup
    Left = 600
    Top = 624
    object miDespesasListar: TMenuItem
      Caption = 'Listar Despesas'
      OnClick = miDespesasListarClick
    end
    object miDespesasNova: TMenuItem
      Caption = 'Nova Despesa'
      OnClick = miDespesasNovaClick
    end
    object miComunicar: TMenuItem
      Caption = 'Comunicar'
      OnClick = miComunicarClick
    end
  end
  object qryDespesas: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  `CD_DESPESA`'
      'FROM'
      '  `LGTC_DESPESA_AULA`'
      'WHERE'
      '  `CD_DIARIO_AULA` = :CD_DIARIO_AULA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    Left = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DIARIO_AULA'
        ParamType = ptUnknown
      end>
    object qryDespesasCD_DESPESA: TLargeintField
      FieldName = 'CD_DESPESA'
      Required = True
    end
  end
end
