object frmCertificados: TfrmCertificados
  Left = 0
  Top = 0
  Caption = 'Registro de Diplomas'
  ClientHeight = 413
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = fechaFormulario
  OnCreate = criaFomulario
  OnKeyDown = FormKeyDown
  OnShow = mostraFormulario
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 25
    Width = 808
    Height = 4
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitLeft = -41
    ExplicitWidth = 779
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'REGISTRO DE DIPLOMAS / FORMANDOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 808
    Height = 38
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    BorderWidth = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object sbBuscaCurso: TSpeedButton
      Left = 287
      Top = 6
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
      OnClick = buscaCurso
    end
    object lblCurso: TLabel
      Left = 149
      Top = 9
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = 'Curso:'
    end
    object lblDisciplina: TLabel
      Left = 462
      Top = 9
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno:'
    end
    object lblTurma: TLabel
      Left = 317
      Top = 9
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma:'
    end
    object sbBuscaTurma: TSpeedButton
      Left = 433
      Top = 6
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
      OnClick = buscaTurma
    end
    object sbBuscaAluno: TSpeedButton
      Left = 563
      Top = 6
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
      OnClick = buscaPessoa
    end
    object bnFechar: TSpeedButton
      Left = 715
      Top = 6
      Width = 83
      Height = 22
      Align = alRight
      Caption = 'F12 Fechar'
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
      OnClick = bnFecharClick
      ExplicitLeft = 700
    end
    object txtCurso: TEdit
      Left = 187
      Top = 6
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object txtAluno: TEdit
      Left = 499
      Top = 6
      Width = 63
      Height = 21
      TabOrder = 1
    end
    object txtTurma: TEdit
      Left = 352
      Top = 6
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object ckAnoSemestre: TCheckBox
      Left = 2
      Top = 8
      Width = 68
      Height = 17
      Caption = 'Ano/Sem:'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object txtAnoSemestreCursos: TMaskEdit
      Left = 76
      Top = 6
      Width = 44
      Height = 22
      EditMask = '9999/9;0;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 4
      Text = '20072'
    end
    object UpDownCursos: TUpDown
      Left = 117
      Top = 6
      Width = 17
      Height = 22
      Min = -100
      TabOrder = 5
      OnClick = incDecAnoSem
    end
    object btnFiltrar: TBitBtn
      Left = 599
      Top = 6
      Width = 66
      Height = 22
      Caption = 'Filtrar'
      TabOrder = 6
      OnClick = filtra
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
    object btLimpar: TBitBtn
      Left = 671
      Top = 6
      Width = 37
      Height = 21
      TabOrder = 7
      OnClick = btLimparClick
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 67
    Width = 808
    Height = 313
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsCertificados
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_pessoa'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_curso'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_anosem_conclusao'
        Title.Alignment = taCenter
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_conclusao'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_colacao'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_exp_diploma'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_livro'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_cert_folha'
        Title.Caption = 'Folha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_cert_registro'
        Title.Caption = 'Registro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'turma'
        Title.Caption = 'Turma'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 380
    Width = 808
    Height = 33
    Align = alBottom
    BorderWidth = 5
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 527
      Top = 6
      Width = 120
      Height = 21
      Caption = 'Registrar certificados'
      Enabled = False
      OnClick = registraCertificados
    end
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 27
      Height = 13
      Caption = 'Livro:'
    end
    object Label2: TLabel
      Left = 221
      Top = 10
      Width = 36
      Height = 13
      Caption = 'P'#225'gina:'
    end
    object bnAddLivro: TSpeedButton
      Left = 192
      Top = 6
      Width = 23
      Height = 19
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF
        FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF
        FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = AdicionaLivro
    end
    object Label3: TLabel
      Left = 343
      Top = 10
      Width = 82
      Height = 13
      Caption = 'Data do registro:'
    end
    object ComboBox1: TComboBox
      Left = 41
      Top = 6
      Width = 145
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Selecione o livro'
      OnSelect = selecionaLivro
      Items.Strings = (
        'Selecione o livro')
    end
    object Edit1: TEdit
      Left = 263
      Top = 6
      Width = 75
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyPress = informaPaginaAtual
    end
    object ProgressBar1: TProgressBar
      Left = 653
      Top = 6
      Width = 149
      Height = 21
      Align = alRight
      TabOrder = 2
    end
    object dtpRegistro: TUMDateTimePicker
      Left = 431
      Top = 6
      Width = 90
      Height = 21
      BevelOuter = bvNone
      Caption = 'dtpRegistro'
      TabOrder = 3
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
      Date = 43101.000000000000000000
      InverterPosicaoCalendario = True
      MostraCalenadarioDesdeCampoTexto = False
    end
  end
  object qCertificados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '/*SELECT'
      '         mc.cd_matricula_curso,'
      '         p.cd_pessoa,'
      '         p.nm_pessoa,'
      '         mc.cd_curso,'
      '         mc.nr_anosem_conclusao,'
      '         mc.dt_conclusao,'
      '         mc.dt_colacao,'
      '         mc.dt_exp_diploma,'
      '         cl.nm_livro,'
      '         mc.nr_cert_folha,'
      '         mc.nr_cert_registro'
      '      FROM'
      '         matriculas_curso as mc'
      '            JOIN pessoas as p ON(p.cd_pessoa = mc.cd_pessoa)'
      
        '            JOIN matriculas as m ON(mc.cd_matricula_curso = m.cd' +
        '_matricula_curso)'
      
        '            LEFT JOIN certificado_livros as cl ON (cl.cd_cert_li' +
        'vro = mc.cd_cert_livro)'
      '      WHERE'
      '         mc.cd_situacao = 0 AND'
      '         m.codigoaluno = 0 AND'
      '         m.turma = "" AND'
      '         m.curso = ""'
      '      GROUP BY'
      '         mc.cd_matricula_curso'
      '      ORDER BY'
      '         mc.cd_curso, nm_pessoa'
      '*/'
      'SELECT mc.cd_matricula_curso'
      '     , p.cd_pessoa'
      '     , p.nm_pessoa'
      '     , mc.cd_curso'
      '     , mc.nr_anosem_conclusao'
      '     , mc.dt_conclusao'
      '     , mc.dt_colacao'
      '     , mc.dt_exp_diploma'
      '     , cl.nm_livro'
      '     , mc.nr_cert_folha'
      '     , mc.nr_cert_registro'
      '     , m.turma'
      '  FROM matriculas_curso as mc '
      ' INNER JOIN pessoas as p ON (p.cd_pessoa = mc.cd_pessoa)'
      
        ' INNER JOIN matriculas as m ON (mc.cd_matricula_curso = m.cd_mat' +
        'ricula_curso)'
      
        ' LEFT JOIN certificado_livros as cl ON (cl.cd_livro = mc.cd_cert' +
        '_livro)'
      ' WHERE cd_situacao = 5 '
      '  GROUP BY mc.cd_matricula_curso'
      ''
      '  ORDER BY mc.cd_curso, nm_pessoa, anosemestre DESC')
    Params = <>
    Left = 16
    Top = 120
    object qCertificadoscd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Aluno'
      FieldName = 'cd_pessoa'
    end
    object qCertificadosnm_pessoa: TStringField
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qCertificadoscd_curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'cd_curso'
      Size = 15
    end
    object qCertificadosdt_conclusao: TDateTimeField
      DisplayLabel = 'Dt. Conclus'#227'o'
      FieldName = 'dt_conclusao'
    end
    object qCertificadosdt_colacao: TDateTimeField
      DisplayLabel = 'Dt. Cola'#231#227'o'
      FieldName = 'dt_colacao'
    end
    object qCertificadosdt_exp_diploma: TDateTimeField
      DisplayLabel = 'Dt. Diploma'
      FieldName = 'dt_exp_diploma'
    end
    object qCertificadosnm_livro: TStringField
      DisplayLabel = 'Livro'
      FieldName = 'nm_livro'
      Size = 50
    end
    object qCertificadoscd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
      Required = True
    end
    object qCertificadosnr_anosem_conclusao: TLargeintField
      DisplayLabel = 'Conc.'
      FieldName = 'nr_anosem_conclusao'
    end
    object qCertificadosturma: TStringField
      FieldName = 'turma'
      Size = 50
    end
    object qCertificadosnr_cert_folha: TIntegerField
      FieldName = 'nr_cert_folha'
    end
    object qCertificadosnr_cert_registro: TIntegerField
      FieldName = 'nr_cert_registro'
    end
  end
  object dsCertificados: TDataSource
    AutoEdit = False
    DataSet = qCertificados
    Left = 16
    Top = 160
  end
end
