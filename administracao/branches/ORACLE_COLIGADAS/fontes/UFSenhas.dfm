object fSenhas: TfSenhas
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Senhas'
  ClientHeight = 610
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 22
    Width = 849
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 512
    ExplicitTop = 128
    ExplicitWidth = 50
  end
  object splSep1: TSplitter
    Left = 280
    Top = 25
    Height = 585
    ExplicitLeft = 392
    ExplicitTop = 192
    ExplicitHeight = 100
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GERENCIAMENTO DE SENHAS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 25
    Width = 280
    Height = 585
    Align = alLeft
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 1
    object bvlSep3: TBevel
      Left = 0
      Top = 273
      Width = 276
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 128
      ExplicitTop = 344
      ExplicitWidth = 50
    end
    object pnlFiltros: TPanel
      Left = 0
      Top = 0
      Width = 276
      Height = 273
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object bvlSep2: TBevel
        Left = 0
        Top = 18
        Width = 276
        Height = 3
        Align = alTop
        Shape = bsSpacer
        ExplicitLeft = 112
        ExplicitTop = 136
        ExplicitWidth = 50
      end
      object lblGrupo: TLabel
        Left = 8
        Top = 69
        Width = 33
        Height = 13
        Caption = 'Grupo:'
      end
      object lblPessoa: TLabel
        Left = 8
        Top = 111
        Width = 38
        Height = 13
        Caption = 'Pessoa:'
      end
      object lblAnoSemestre: TLabel
        Left = 8
        Top = 27
        Width = 71
        Height = 13
        Caption = 'Ano/semestre:'
      end
      object lblCurso: TLabel
        Left = 8
        Top = 153
        Width = 32
        Height = 13
        Caption = 'Curso:'
      end
      object lblTurma: TLabel
        Left = 8
        Top = 195
        Width = 34
        Height = 13
        Caption = 'Turma:'
      end
      object sbSelGrupo: TSpeedButton
        Left = 203
        Top = 84
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
        OnClick = sbSelGrupoClick
      end
      object sbSelPessoa: TSpeedButton
        Left = 203
        Top = 126
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
        OnClick = sbSelPessoaClick
      end
      object sbSelCurso: TSpeedButton
        Left = 203
        Top = 168
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
        OnClick = sbSelCursoClick
      end
      object sbSelTurma: TSpeedButton
        Left = 203
        Top = 210
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
        OnClick = sbSelTurmaClick
      end
      object sbFiltrar: TSpeedButton
        Left = 8
        Top = 237
        Width = 70
        Height = 22
        Caption = 'Filtrar'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFDDD4CA8B6F528B6F52DCD1C6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B6F52C3
          AC8FC2AC8F8B6F52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF8B6F52C7B195C7B0948B6F52FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B6F52CA
          B499C9B3988B6F52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF8B6F52CDB89ECCB89E8B6F52FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B6F52D0
          BDA4CFBCA38B6F52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF8B6F52D3C1A9D3C1A98B6F52FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B6F52D6
          C5AFD6C5AE8B6F52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF8B6F52D9C9B4D9C9B48B6F52FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCFBF9BBA893A58D73957B5E957B5E8B6F52D4
          BEA3D3BEA38B6F52ECE6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8F6AA9072
          F8F6F3FEFEFDF1EDE88B6F52DFCEB6D2BCA1D2BCA0DFCEB78B6F52ECE6DEFFFF
          FFFFFFFFFFFFFFFFFFFFBEAC97E6DCD0FFFFFFFEFEFD8B6F52E5D6C1DDCCB4E1
          D2BCE1D1BCDDCBB4E5D6C28B6F52ECE6DEFFFFFFFFFFFFFFFFFFA89279EAE2D8
          FFFEFE8B6F52E8DAC7E2D3BEE7DBC8E9DFCDE9DFCDE6DAC7E1D2BCE8D9C68B6F
          52ECE6DEFFFFFFFFFFFFCCC0B2B89D7D8B6F52EADDCAE6DAC7EDE3D4F1EADEF4
          EEE5F4EEE5F1EBDEEDE3D4E6D9C6EADECB8B6F52EBE5DEFFFFFFF0EAE48B6F52
          F2E9D8F0E5D6F4ECDEF8F2E8FCF7F0FFFBF7FFFBF7FCF7F0F8F2E8F4ECDFF0E5
          D5F4EADA8B6F52E7DFD68B6F528B6F528B6F528B6F528B6F528B6F528B6F528B
          6F528B6F528B6F528B6F528B6F528B6F528B6F528B6F528B6F52}
        OnClick = sbFiltrarClick
      end
      object sbLimpar: TSpeedButton
        Left = 78
        Top = 237
        Width = 70
        Height = 22
        Caption = 'Limpar'
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
        OnClick = sbLimparClick
      end
      object pnlFiltrosTit: TPanel
        Left = 0
        Top = 0
        Width = 276
        Height = 18
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'FILTROS'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtGrupo: TEdit
        Left = 8
        Top = 84
        Width = 193
        Height = 21
        BorderStyle = bsNone
        Color = clSkyBlue
        ReadOnly = True
        TabOrder = 1
      end
      object edtPessoa: TEdit
        Left = 8
        Top = 126
        Width = 193
        Height = 21
        BorderStyle = bsNone
        Color = clSkyBlue
        ReadOnly = True
        TabOrder = 2
      end
      object meAnoSemestre: TMaskEdit
        Left = 8
        Top = 42
        Width = 89
        Height = 21
        BorderStyle = bsNone
        Color = clSkyBlue
        EditMask = '9999/9;0;_'
        MaxLength = 6
        TabOrder = 3
      end
      object udAnoSemestre: TUpDown
        Left = 97
        Top = 42
        Width = 17
        Height = 21
        Min = -100
        TabOrder = 4
        OnClick = udAnoSemestreClick
      end
      object edtCurso: TEdit
        Left = 8
        Top = 168
        Width = 193
        Height = 21
        BorderStyle = bsNone
        Color = clSkyBlue
        ReadOnly = True
        TabOrder = 5
      end
      object edtTurma: TEdit
        Left = 8
        Top = 210
        Width = 193
        Height = 21
        BorderStyle = bsNone
        Color = clSkyBlue
        ReadOnly = True
        TabOrder = 6
      end
    end
    object pnlOpcoes: TPanel
      Left = 0
      Top = 276
      Width = 276
      Height = 305
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object bvlSep4: TBevel
        Left = 0
        Top = 18
        Width = 276
        Height = 3
        Align = alTop
        Shape = bsSpacer
        ExplicitLeft = 136
        ExplicitTop = 88
        ExplicitWidth = 50
      end
      object lblNovaSenha: TLabel
        Left = 8
        Top = 153
        Width = 61
        Height = 13
        Caption = 'Nova senha:'
      end
      object pnlOpcoesTit: TPanel
        Left = 0
        Top = 0
        Width = 276
        Height = 18
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'OP'#199#213'ES'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object chkProvisoria: TCheckBox
        Left = 8
        Top = 27
        Width = 164
        Height = 17
        Caption = 'Definir como senha provis'#243'ria'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = chkProvisoriaClick
      end
      object chkSobreescrever: TCheckBox
        Left = 8
        Top = 46
        Width = 167
        Height = 17
        Caption = 'Redefinir senhas j'#225' existentes'
        TabOrder = 2
        OnClick = chkSobreescreverClick
      end
      object rgSenha: TRadioGroup
        Left = 8
        Top = 68
        Width = 164
        Height = 79
        Caption = 'Senha'
        ItemIndex = 0
        Items.Strings = (
          'Data de nascimento'
          'Digitar'
          'Manter a senha atual')
        TabOrder = 3
        OnClick = rgSenhaClick
      end
      object edtNovaSenha: TEdit
        Left = 8
        Top = 168
        Width = 218
        Height = 21
        Enabled = False
        PasswordChar = '*'
        TabOrder = 4
        OnChange = edtNovaSenhaChange
      end
      object bbtnConfirmar: TBitBtn
        Left = 8
        Top = 195
        Width = 89
        Height = 25
        Caption = 'Confirmar'
        Enabled = False
        TabOrder = 5
        OnClick = bbtnConfirmarClick
        Kind = bkOK
      end
      object bbtnFechar: TBitBtn
        Left = 97
        Top = 195
        Width = 89
        Height = 25
        Caption = 'Fechar'
        TabOrder = 6
        OnClick = bbtnFecharClick
        Kind = bkCancel
      end
      object pnlAtualizando: TPanel
        Left = 0
        Top = 271
        Width = 276
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 7
        Visible = False
        object lblAtualizando: TLabel
          Left = 0
          Top = 0
          Width = 276
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Atualizando vinculo de grupos e usu'#225'rios...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 239
        end
        object aniRunning: TAnimate
          Left = 0
          Top = 13
          Width = 276
          Height = 21
          Align = alClient
        end
      end
      object pnlLegenda: TPanel
        Left = -2
        Top = 226
        Width = 276
        Height = 27
        Align = alCustom
        BevelOuter = bvNone
        TabOrder = 8
        object Label1: TLabel
          Left = 31
          Top = 7
          Width = 239
          Height = 13
          Caption = 'Usu'#225'rios que ter'#227'o suas senhas alteradas.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object pnlVermelho: TPanel
          Left = 8
          Top = 5
          Width = 17
          Height = 17
          BevelOuter = bvNone
          Color = clSkyBlue
          TabOrder = 0
        end
      end
    end
  end
  object pnlDados: TPanel
    Left = 283
    Top = 25
    Width = 566
    Height = 585
    Align = alClient
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 2
    object bvlSep5: TBevel
      Left = 0
      Top = 18
      Width = 562
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 192
      ExplicitTop = 200
      ExplicitWidth = 50
    end
    object pnlDadosTit: TPanel
      Left = 0
      Top = 0
      Width = 562
      Height = 18
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PESSOAS SELECIONADAS PARA TROCA DE SENHA'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbgPessoas: TDBGrid
      Left = 0
      Top = 21
      Width = 562
      Height = 560
      Align = alClient
      DataSource = dsAlunos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgPessoasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PESSOA'
          Title.Caption = 'C'#243'digo'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PESSOA'
          Title.Caption = 'Nome'
          Width = 264
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SN_SENHA_DESC'
          Title.Caption = 'Senha Atual'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SN_BLOQUEAR'
          Title.Caption = 'Hierarquia'
          Width = 59
          Visible = True
        end>
    end
  end
  object qryPessoas: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryPessoasCalcFields
    SQL.Strings = (
      'SELECT DISTINCT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   P.SN_SENHA_PROVISORIA,'
      '   P.DS_SENHA,'
      '   P.DT_NASCIMENTO,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = P.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '   PESSOAS P'
      'WHERE'
      '   P.CD_PESSOA = :CD_PESSOA'
      'ORDER BY'
      '   P.NM_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 274
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryPessoasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryPessoasSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryPessoasDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryPessoasDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryPessoasSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryPessoasSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object qryAlunos: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryAlunosCalcFields
    SQL.Strings = (
      'SELECT DISTINCT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   P.SN_SENHA_PROVISORIA,'
      '   P.DS_SENHA,'
      '   P.DT_NASCIMENTO,'
      '   M.TURMA CD_TURMA,'
      '   M.CURSO CD_CURSO,'
      '   M.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = P.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '   PESSOAS P'
      '      JOIN NU_GRUPOS_PESSOAS GP ON'
      '         (P.CD_PESSOA = GP.CD_PESSOA)'
      '      JOIN MATRICULAS M ON'
      '         (P.CD_PESSOA = M.CODIGOALUNO)'
      'WHERE'
      '   M.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   GP.CD_GRUPO = :CD_GRUPO'
      'GROUP BY'
      '   P.CD_PESSOA'
      'ORDER BY'
      '   P.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryAlunosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryAlunosNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryAlunosSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryAlunosDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryAlunosDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryAlunosCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryAlunosCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryAlunosNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryAlunosSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryAlunosSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object qryProfessores: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryProfessoresCalcFields
    SQL.Strings = (
      'SELECT DISTINCT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   P.SN_SENHA_PROVISORIA,'
      '   P.DS_SENHA,'
      '   P.DT_NASCIMENTO,'
      '   TP.TURMA CD_TURMA,'
      '   TP.CURSO CD_CURSO,'
      '   TP.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = P.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '   PESSOAS P'
      '      JOIN NU_GRUPOS_PESSOAS GP ON'
      '         (P.CD_PESSOA = GP.CD_PESSOA)'
      '      JOIN TURMASPROFESSORES TP ON'
      '         (TP.PROFESSOR = P.CD_PESSOA)'
      'WHERE'
      '   TP.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   GP.CD_GRUPO = :CD_GRUPO'
      'GROUP BY'
      '   P.CD_PESSOA'
      'ORDER BY'
      '   P.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryProfessoresCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryProfessoresNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryProfessoresSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryProfessoresDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryProfessoresDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryProfessoresCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryProfessoresCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryProfessoresNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryProfessoresSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryProfessoresSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object qryUsuarios: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryUsuariosCalcFields
    SQL.Strings = (
      'SELECT'
      '   P.CD_PESSOA,'
      '   P.NM_PESSOA,'
      '   P.SN_SENHA_PROVISORIA,'
      '   P.DS_SENHA,'
      '   P.DT_NASCIMENTO,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = P.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '   PESSOAS P'
      '      JOIN NU_GRUPOS_PESSOAS GP ON'
      '         (P.CD_PESSOA = GP.CD_PESSOA)'
      'WHERE'
      '   GP.CD_GRUPO = :CD_GRUPO'
      'ORDER BY'
      '   P.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryUsuariosCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryUsuariosNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryUsuariosSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryUsuariosDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryUsuariosDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryUsuariosSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryUsuariosSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object dsPessoas: TDataSource
    AutoEdit = False
    DataSet = qryPessoas
    Left = 368
    Top = 274
  end
  object dsAlunos: TDataSource
    AutoEdit = False
    DataSet = qryAlunos
    Left = 368
    Top = 312
  end
  object dsProfessores: TDataSource
    AutoEdit = False
    DataSet = qryProfessores
    Left = 368
    Top = 352
  end
  object dsUsuarios: TDataSource
    AutoEdit = False
    DataSet = qryUsuarios
    Left = 368
    Top = 392
  end
  object qryRespFinan: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryRespFinanCalcFields
    SQL.Strings = (
      'SELECT'
      '   p1.CD_PESSOA,'
      '   p1.NM_PESSOA,'
      '   p1.SN_SENHA_PROVISORIA,'
      '   p1.DS_SENHA,'
      '   p1.DT_NASCIMENTO,'
      '   M.TURMA CD_TURMA,'
      '   M.CURSO CD_CURSO,'
      '   M.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = p1.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '    pessoas p1'
      '   INNER JOIN  pessoas p2 ON (p2.cd_resp_finan = p1.cd_pessoa)'
      '   INNER JOIN MATRICULAS M ON (p2.CD_PESSOA = M.CODIGOALUNO)'
      
        '   INNER  JOIN NU_GRUPOS_PESSOAS GP ON  (P1.CD_PESSOA = GP.CD_PE' +
        'SSOA)'
      'WHERE'
      '   M.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   GP.CD_GRUPO = :CD_GRUPO'
      'GROUP BY'
      '   P1.CD_PESSOA'
      'ORDER BY'
      '   P1.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryRespFinanCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryRespFinanNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryRespFinanSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryRespFinanDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryRespFinanDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryRespFinanCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryRespFinanCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryRespFinanNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryRespFinanSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryRespFinanSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object dsRespFinan: TDataSource
    DataSet = qryRespFinan
    Left = 368
    Top = 240
  end
  object dsRespAcad: TDataSource
    DataSet = qryRespAcad
    Left = 368
    Top = 207
  end
  object qryRespAcad: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryRespAcadCalcFields
    SQL.Strings = (
      'SELECT'
      '   p1.CD_PESSOA,'
      '   p1.NM_PESSOA,'
      '   p1.SN_SENHA_PROVISORIA,'
      '   p1.DS_SENHA,'
      '   p1.DT_NASCIMENTO,'
      '   M.TURMA CD_TURMA,'
      '   M.CURSO CD_CURSO,'
      '   M.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = p1.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '   pessoas p1'
      'INNER JOIN pessoas filho ON ('
      '  ( filho.cd_resp_acad = p1.cd_pessoa )'
      '  OR'
      '  ('
      
        '    ( (filho.cd_pai = p1.cd_pessoa AND filho.sn_pai_resp = 1) OR' +
        ' (filho.cd_mae = p1.cd_pessoa AND filho.sn_mae_resp = 1) )'
      '    AND filho.cd_resp_acad <> p1.cd_pessoa'
      '  )'
      ')'
      'INNER JOIN MATRICULAS M ON ( filho.CD_PESSOA = M.CODIGOALUNO )'
      
        'LEFT JOIN NU_GRUPOS_PESSOAS GP ON ( P1.CD_PESSOA = GP.CD_PESSOA ' +
        ')'
      'WHERE'
      '   M.ANOSEMESTRE = :NR_ANOSEMESTRE'
      '   AND ('
      
        '      ( GP.CD_GRUPO = :CD_GRUPO AND filho.cd_resp_acad = p1.cd_p' +
        'essoa )'
      '      OR ( filho.sn_mae_resp = 1 or filho.sn_pai_resp = 1 )'
      '   )'
      'GROUP BY'
      '   P1.CD_PESSOA'
      'ORDER BY'
      '   P1.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 206
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryRespAcadSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryRespAcadCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryRespAcadNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryRespAcadSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryRespAcadDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryRespAcadDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryRespAcadCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryRespAcadCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryRespAcadNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryRespAcadSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object dsRespUnificado: TDataSource
    DataSet = qryRespUnificado
    Left = 368
    Top = 175
  end
  object qryRespUnificado: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    OnCalcFields = qryRespUnificadoCalcFields
    SQL.Strings = (
      'SELECT'
      '   p1.CD_PESSOA,'
      '   p1.NM_PESSOA,'
      '   p1.SN_SENHA_PROVISORIA,'
      '   p1.DS_SENHA,'
      '   p1.DT_NASCIMENTO,'
      '   M.TURMA CD_TURMA,'
      '   M.CURSO CD_CURSO,'
      '   M.ANOSEMESTRE NR_ANOSEMESTRE,'
      '   CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = p1.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '    pessoas p1'
      '    INNER JOIN PESSOAS P2 ON'
      '      (P2.CD_RESP_ACAD = P1.CD_PESSOA'
      '        OR (P2.cd_pai = P1.CD_PESSOA AND P2.sn_pai_resp = 1 )'
      '        OR (P2.cd_mae = P1.CD_PESSOA AND P2.sn_mae_resp = 1)'
      '      )'
      '      AND (P2.CD_RESP_FINAN = P1.CD_PESSOA)'
      '   INNER JOIN MATRICULAS M ON (p2.CD_PESSOA = M.CODIGOALUNO)'
      
        '   INNER  JOIN NU_GRUPOS_PESSOAS GP ON  (P1.CD_PESSOA = GP.CD_PE' +
        'SSOA)'
      'WHERE'
      '   M.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   GP.CD_GRUPO = :CD_GRUPO'
      'GROUP BY'
      '   P1.CD_PESSOA'
      'ORDER BY'
      '   P1.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 174
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryRespUnificadoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryRespUnificadoNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryRespUnificadoSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryRespUnificadoDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryRespUnificadoDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryRespUnificadoCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryRespUnificadoCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryRespUnificadoNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryRespUnificadoSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryRespUnificadoSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object qryCoordenador: TUMZQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    SQL.Strings = (
      'SELECT'
      '  p.CD_PESSOA,'
      '  p.NM_PESSOA,'
      '  p.SN_SENHA_PROVISORIA,'
      '  p.DS_SENHA,'
      '  p.DT_NASCIMENTO,'
      '  cc.CD_CURSO,'
      '  CASE'
      '    WHEN'
      '      EXISTS ('
      '        SELECT DISTINCT'
      '          P_TO.CD_GRUPO'
      '        FROM'
      '          NU_GRUPOS_PESSOAS P_TO '
      ''
      '            LEFT JOIN ('
      '              SELECT DISTINCT'
      '                H.CD_GRUPO_LIBERADO'
      '              FROM'
      '                NU_GRUPOS_HIERARQUIA H'
      ''
      '                  JOIN NU_GRUPOS_PESSOAS P ON'
      '                    (H.CD_GRUPO = P.CD_GRUPO)'
      '              WHERE'
      '                P.CD_PESSOA = :CD_USUARIO'
      '            ) T ON'
      '              (P_TO.CD_GRUPO = T.CD_GRUPO_LIBERADO) '
      '        WHERE'
      '          P_TO.CD_PESSOA = p.CD_PESSOA AND'
      '          T.CD_GRUPO_LIBERADO IS NULL'
      '      )'
      '    THEN '#39'1'#39
      '    ELSE '#39'0'#39
      '  END SN_BLOQUEAR'
      'FROM'
      '  pessoas p'
      
        '  INNER JOIN cursos_coordenadores cc ON (cc.cd_pessoa = p.cd_pes' +
        'soa)'
      'GROUP BY'
      '   P.CD_PESSOA'
      'ORDER BY'
      '   P.nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 328
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qryCoordenadorCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryCoordenadorNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryCoordenadorSN_SENHA_PROVISORIA: TStringField
      FieldName = 'SN_SENHA_PROVISORIA'
      Size = 1
    end
    object qryCoordenadorDS_SENHA: TStringField
      FieldName = 'DS_SENHA'
      Size = 32
    end
    object qryCoordenadorDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryCoordenadorcd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 15
    end
    object qryCoordenadorSN_SENHA_DESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SN_SENHA_DESC'
      Size = 255
      Calculated = True
    end
    object qryCoordenadorSN_BLOQUEAR: TStringField
      FieldName = 'SN_BLOQUEAR'
      ReadOnly = True
      Size = 1
    end
  end
  object dsCoordenador: TDataSource
    DataSet = qryCoordenador
    Left = 368
    Top = 144
  end
end
