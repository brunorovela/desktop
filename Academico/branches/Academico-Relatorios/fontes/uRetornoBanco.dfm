object frmRetornoBanco: TfrmRetornoBanco
  Left = 0
  Top = 0
  Caption = 'Arquivo de retorno'
  ClientHeight = 493
  ClientWidth = 1016
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 11
      Top = 34
      Width = 92
      Height = 13
      Caption = 'Unidade de Ensino:'
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 1016
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'BAIXA DO ARQUIVO RETORNO DO BANCO'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cbColigadas: TUMComboBox
      Left = 109
      Top = 31
      Width = 267
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 0
      OnChange = cbColigadasChange
      OnCloseUp = cbColigadasCloseUp
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 62
    Width = 1016
    Height = 431
    ActivePage = tsArquivo
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object tsArquivo: TTabSheet
      Caption = 'Arquivos de Retorno'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 337
        Height = 403
        Align = alLeft
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object blmoldura: TBevel
          Left = 11
          Top = 92
          Width = 305
          Height = 101
          Style = bsRaised
        end
        object Label1: TLabel
          Left = 13
          Top = 40
          Width = 140
          Height = 13
          Caption = 'Selecione o Arquivo Retorno:'
        end
        object btnCodigoDepartamento: TSpeedButton
          Left = 283
          Top = 63
          Width = 33
          Height = 23
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
          OnClick = btnCodigoDepartamentoClick
        end
        object Label4: TLabel
          Left = 6
          Top = 5
          Width = 157
          Height = 13
          Caption = 'Processar um novo arquivo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 6
          Top = 24
          Width = 235
          Height = 5
          Shape = bsTopLine
        end
        object lbBanco: TLabel
          Left = 19
          Top = 101
          Width = 37
          Height = 13
          Caption = 'Layout:'
        end
        object lblReg: TLabel
          Left = 19
          Top = 128
          Width = 49
          Height = 13
          Caption = 'Registros:'
        end
        object btnBaixar: TSpeedButton
          Left = 11
          Top = 199
          Width = 305
          Height = 66
          Caption = 'Processar Arquivo'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFF9B9C9B9B9C9B63656363656363656363656363656363
            65636365636365636365636365636365639B9C9B000000FFFFFF636563CECFCE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECF
            CE6365639B9C9B000000636563CECFCE63656363656363656363656363656363
            6563636563636563636563636563CECFCE636563636563000000636563CECFCE
            CECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECF
            CE636563636563000000636563CECFCECECFCECECFCECECFCECECFCECECFCECE
            CFCECECFCECECFCECECFCE009A0000FF006365636365630000009B9C9BFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF636563636563000000FFFFFF9B9C9BF3F3F3CECFCECECFCECECFCECECFCECE
            CFCECECFCECECFCECECFCECECFCECECFCECECFCE9B9C9B000000FFFFFFFFFFFF
            9B9C9B9B9C9B9B9C9B9B9C9B9B9C9B9B9C9B0000009B9C9B9B9C9B9B9C9B9B9C
            9B9B9C9B9B9C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
            B3FF00CFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF3EB3FF46DDFF00CFFF46DDFF000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF3EB3FF3E
            B3FF00CFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF00CFFF000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
            B3FF00CFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF00CFFF000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
            B3FF009AFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          OnClick = btnBaixarClick
        end
        object txtArquivo: TEdit
          Left = 11
          Top = 64
          Width = 273
          Height = 21
          ReadOnly = True
          TabOrder = 0
          OnChange = txtArquivoChange
        end
        object Bar: TProgressBar
          Left = 19
          Top = 152
          Width = 289
          Height = 33
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 337
        Top = 0
        Width = 671
        Height = 403
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object grd: TDBGrid
          Left = 0
          Top = 64
          Width = 671
          Height = 311
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtcRetorno
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = grdDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Caption = 'C'#243'd.'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DataRetorno'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeArquivo'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Baixados'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rejeitados'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'outras_ocorrencias'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DataRetorno'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_coligada'
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 671
          Height = 64
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 6
            Top = 5
            Width = 197
            Height = 13
            Caption = 'Hist'#243'rico de Arquivos processados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 6
            Top = 24
            Width = 235
            Height = 5
            Shape = bsTopLine
          end
          object Label5: TLabel
            Left = 8
            Top = 40
            Width = 126
            Height = 13
            Caption = 'Filtrar data de retorno de:'
          end
          object Label6: TLabel
            Left = 256
            Top = 40
            Width = 21
            Height = 13
            Caption = 'At'#233':'
          end
          object sbAtualizar: TSpeedButton
            Tag = 1
            Left = 390
            Top = 34
            Width = 30
            Height = 26
            Hint = 'Atualizar Filtro'
            Flat = True
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C01000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334224333333333333338338F333333333
              0000333422224333333333333833338F33333333000033422222243333333333
              83333338F3333333000034222A22224333333338F33F33338F33333300003222
              A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
              38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
              2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
              0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
              333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
              33333A2224A2233333333338F338F83300003333333333A2224A333333333333
              8F338F33000033333333333A222433333333333338F338F30000333333333333
              A224333333333333338F38F300003333333333333A223333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbAtualizarClick
          end
          object sbAluno: TSpeedButton
            Left = 440
            Top = 32
            Width = 88
            Height = 28
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'F8 Aluno'
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
            Transparent = False
            OnClick = sbAlunoClick
          end
          object sbNossoNumero: TSpeedButton
            Left = 534
            Top = 32
            Width = 110
            Height = 28
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Nosso N'#250'mero'
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
            Transparent = False
            OnClick = sbNossoNumeroClick
          end
          object dtpFim: TUMDateTimePicker
            Left = 285
            Top = 37
            Width = 102
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
            OnChangeDate = dtpFimChangeDate
            Date = 42255.000000000000000000
            InverterPosicaoCalendario = False
            MostraCalenadarioDesdeCampoTexto = False
          end
          object dtpInicio: TUMDateTimePicker
            Left = 145
            Top = 37
            Width = 102
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
            OnChangeDate = dtpInicioChangeDate
            Date = 42255.000000000000000000
            InverterPosicaoCalendario = False
            MostraCalenadarioDesdeCampoTexto = False
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 375
          Width = 671
          Height = 28
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object ToolBar: TToolBar
            Left = 0
            Top = 6
            Width = 671
            Height = 22
            Align = alBottom
            ButtonWidth = 107
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton2: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object btnImprimirTudo: TToolButton
              Left = 8
              Top = 0
              Hint = 'Imprimir todo o conte'#250'do do retorno'
              AutoSize = True
              Caption = 'Imprimir Retorno'
              ImageIndex = 1
              OnClick = btnImprimirTudoClick
            end
            object btnImprimirBaixas: TToolButton
              Left = 119
              Top = 0
              Hint = 'Imprimir somente as baixas do retorno'
              AutoSize = True
              Caption = 'Imprimir Baixas'
              ImageIndex = 1
              OnClick = btnImprimirBaixasClick
            end
            object ToolButton7: TToolButton
              Left = 222
              Top = 0
              Width = 8
              Caption = 'ToolButton7'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton1: TToolButton
              Left = 230
              Top = 0
              Hint = 'Imprimir recibos do retorno'
              AutoSize = True
              Caption = 'Imprimir Recibos'
              ImageIndex = 1
              OnClick = ToolButton1Click
            end
            object ToolButton5: TToolButton
              Left = 339
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btFechar: TToolButton
              Left = 347
              Top = 0
              AutoSize = True
              Caption = 'F12 Fechar'
              ImageIndex = 2
              OnClick = btFecharClick
            end
            object ToolButton9: TToolButton
              Left = 432
              Top = 0
              Width = 8
              Caption = 'ToolButton9'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object SpeedButton1: TSpeedButton
              Left = 440
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
              OnClick = SpeedButton1Click
            end
          end
        end
      end
    end
    object tsHistorico: TTabSheet
      Caption = 'Conte'#250'do do retorno'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel7: TPanel
        Left = 0
        Top = 378
        Width = 1008
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object ToolBar1: TToolBar
          Left = 0
          Top = 3
          Width = 1008
          Height = 22
          Align = alBottom
          ButtonWidth = 143
          Images = ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 0
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
            Transparent = False
            OnClick = sbSelecionarColunaClick
          end
          object ToolButton12: TToolButton
            Left = 25
            Top = 0
            Width = 8
            Caption = 'ToolButton12'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnTitulos: TToolButton
            Left = 33
            Top = 0
            AutoSize = True
            Caption = 'Mostrar t'#237'tulos'
            Grouped = True
            ImageIndex = 7
            OnClick = btnTitulosClick
          end
          object btBaixar: TToolButton
            Left = 133
            Top = 0
            Caption = 'Baixar t'#237'tulo selecionado'
            ImageIndex = 4
            OnClick = btBaixarClick
          end
          object ToolButton8: TToolButton
            Left = 276
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 1
            Style = tbsSeparator
          end
          object ToolButton10: TToolButton
            Left = 284
            Top = 0
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object btnEstornar: TToolButton
            Left = 292
            Top = 0
            AutoSize = True
            Caption = 'Estornar Baixa'
            ImageIndex = 8
            OnClick = btnEstornarClick
          end
          object ToolButton4: TToolButton
            Left = 393
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnLogs: TToolButton
            Left = 401
            Top = 0
            Hint = 
              'Relat'#243'rio de logs de todas as impress'#245'es que houveram com este n' +
              'osso n'#250'mero selecionado.'
            AutoSize = True
            Caption = 'Logs do Nosso N'#250'mero'
            ImageIndex = 1
            OnClick = btnLogsClick
          end
          object ToolButton14: TToolButton
            Left = 541
            Top = 0
            Width = 8
            Caption = 'ToolButton14'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnRegras: TToolButton
            Left = 549
            Top = 0
            AutoSize = True
            Caption = 'Regras de ajustes'
            ImageIndex = 10
            OnClick = btnRegrasClick
          end
          object ToolButton11: TToolButton
            Left = 667
            Top = 0
            Width = 8
            Caption = 'ToolButton11'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnFechar: TToolButton
            Left = 675
            Top = 0
            AutoSize = True
            Caption = 'F12 Fechar'
            ImageIndex = 2
            OnClick = btFecharClick
          end
        end
      end
      object grdItens: TDBGrid
        Left = 0
        Top = 93
        Width = 1008
        Height = 285
        Align = alClient
        BorderStyle = bsNone
        DataSource = dtcItens
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grdItensDrawColumnCell
        OnTitleClick = grdItensTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nr_sequencia'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_nossonumero'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_ocorrencia'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pagamento'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_credito'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_titulo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_tarifa'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_pago'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_soma_baixas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_situacao'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_observacao'
            Visible = True
          end>
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label7: TLabel
          Left = 6
          Top = 5
          Width = 183
          Height = 13
          Caption = 'Detalhes do arquivo selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel3: TBevel
          Left = 6
          Top = 24
          Width = 235
          Height = 5
          Shape = bsTopLine
        end
        object Label8: TLabel
          Left = 6
          Top = 35
          Width = 89
          Height = 13
          Caption = 'Qtd. de Registros:'
        end
        object Label9: TLabel
          Left = 148
          Top = 35
          Width = 77
          Height = 13
          Caption = 'Vl. Total T'#237'tulos:'
        end
        object Label10: TLabel
          Left = 325
          Top = 35
          Width = 86
          Height = 13
          Caption = 'Vl. Total Cr'#233'ditos:'
        end
        object Label11: TLabel
          Left = 691
          Top = 35
          Width = 45
          Height = 13
          Caption = 'Situa'#231#227'o:'
        end
        object Label12: TLabel
          Left = 511
          Top = 35
          Width = 79
          Height = 13
          Caption = 'Vl. Total Tarifas:'
        end
        object sbBaixar: TSpeedButton
          Left = 903
          Top = 4
          Width = 90
          Height = 45
          Caption = 'Processar Baixas'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFF9B9C9B9B9C9B63656363656363656363656363656363
            65636365636365636365636365636365639B9C9B000000FFFFFF636563CECFCE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECF
            CE6365639B9C9B000000636563CECFCE63656363656363656363656363656363
            6563636563636563636563636563CECFCE636563636563000000636563CECFCE
            CECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECFCECECF
            CE636563636563000000636563CECFCECECFCECECFCECECFCECECFCECECFCECE
            CFCECECFCECECFCECECFCE009A0000FF006365636365630000009B9C9BFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF636563636563000000FFFFFF9B9C9BF3F3F3CECFCECECFCECECFCECECFCECE
            CFCECECFCECECFCECECFCECECFCECECFCECECFCE9B9C9B000000FFFFFFFFFFFF
            9B9C9B9B9C9B9B9C9B9B9C9B9B9C9B9B9C9B0000009B9C9B9B9C9B9B9C9B9B9C
            9B9B9C9B9B9C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
            B3FF00CFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF3EB3FF46DDFF00CFFF46DDFF000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF3EB3FF3E
            B3FF00CFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF00CFFF000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
            B3FF00CFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB3FF00CFFF000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E
            B3FF009AFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          OnClick = sbBaixarClick
        end
        object txtQtd_linhas: TEdit
          Left = 99
          Top = 32
          Width = 42
          Height = 21
          Color = clMenu
          TabOrder = 0
        end
        object txtSoma_titulos: TEdit
          Left = 229
          Top = 32
          Width = 86
          Height = 21
          Color = clMenu
          TabOrder = 1
        end
        object txtSoma_creditos: TEdit
          Left = 415
          Top = 32
          Width = 86
          Height = 21
          Color = clMenu
          TabOrder = 2
        end
        object txtSituacao: TEdit
          Left = 742
          Top = 32
          Width = 155
          Height = 21
          Color = clLime
          TabOrder = 3
          Text = 'Ok'
        end
        object txtSoma_Tarifas: TEdit
          Left = 595
          Top = 32
          Width = 86
          Height = 21
          Color = clMenu
          TabOrder = 4
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 55
        Width = 1008
        Height = 13
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Bar2: TProgressBar
          Left = 0
          Top = 0
          Width = 1008
          Height = 13
          Align = alClient
          TabOrder = 0
          Visible = False
        end
      end
      object pnSPC: TPanel
        Left = 0
        Top = 68
        Width = 1008
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 
          'Aten'#231#227'o: Este retorno tem pagamento de aluno inclu'#237'do no SPC. Re' +
          'tire o aluno do SPC e volte a processar as baixas, ou fa'#231'a a bai' +
          'xa manual do t'#237'tulo.'
        Color = clYellow
        TabOrder = 4
        Visible = False
      end
    end
  end
  object qryRetorno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      '   c.*,retorno.*, fcc.ds_caixa '
      
        ', CAST( (IFNULL(retorno.baixados,0) + IFNULL(retorno.rejeitados,' +
        '0) + IFNULL(retorno.outras_ocorrencias,0)) AS CHAR) as qtd_bolet' +
        'os'
      ''
      'from '
      '   Retorno '
      
        '   LEFT JOIN coligadas c ON (c.cd_coligada = retorno.cd_coligada' +
        ')'
      
        '   LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = Retorno.' +
        'cd_caixa)'
      'WHERE'
      '   dataretorno >= :data'
      'order by'
      '   dataretorno DESC ')
    Params = <
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptUnknown
      end>
    Left = 896
    Top = 40
    ParamData = <
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptUnknown
      end>
    object qryRetornoDataRetorno: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data'
      FieldName = 'DataRetorno'
      Origin = 'Retorno.DataRetorno'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryRetornoBaixados: TSmallintField
      Tag = 1
      FieldName = 'Baixados'
      Origin = 'Retorno.Baixados'
    end
    object qryRetornoRejeitados: TSmallintField
      Tag = 1
      DisplayLabel = 'Pendentes'
      FieldName = 'rejeitados'
      Origin = 'Retorno.Rejeitados'
    end
    object qryRetornoNomeArquivo: TStringField
      Tag = 1
      DisplayLabel = 'Arquivo'
      DisplayWidth = 50
      FieldName = 'NomeArquivo'
      Origin = 'Retorno.NomeArquivo'
      Size = 255
    end
    object qryRetornooutras_ocorrencias: TSmallintField
      Tag = 1
      DisplayLabel = 'Informativos'
      FieldName = 'outras_ocorrencias'
      Origin = 'WMESTRE12.retorno.outras_ocorrencias'
    end
    object qryRetornocd_banco: TStringField
      FieldName = 'cd_banco'
      Origin = 'WMESTRE12.retorno.cd_banco'
      FixedChar = True
      Size = 3
    end
    object qryRetornocodigo: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object qryRetornousuario: TIntegerField
      FieldName = 'usuario'
    end
    object qryRetornonm_coligada: TStringField
      Tag = 1
      DisplayLabel = 'Unidade de ensino'
      FieldName = 'nm_coligada'
      Size = 50
    end
    object qryRetornocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object qryRetornods_caixa: TStringField
      Tag = 1
      DisplayLabel = 'Caixa'
      FieldName = 'ds_caixa'
      Required = True
      Size = 70
    end
    object qryRetornoqtd_boletos: TStringField
      Tag = 1
      Alignment = taRightJustify
      DisplayLabel = 'Tot.Boletos'
      DisplayWidth = 10
      FieldName = 'qtd_boletos'
      ReadOnly = True
      Size = 8
    end
  end
  object dtcRetorno: TDataSource
    DataSet = qryRetorno
    Left = 848
    Top = 40
  end
  object ImageList1: TImageList
    Left = 209
    Top = 606
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000066660000333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000006666000033330000000000000000000066660000000000000000000000
      0000006666000099990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00FFFFFF00FFFFFF0000000000000000006666660066666600666666000066
      6600006666000033330000666600006666000066660000000000000033000066
      6600006666000099990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000007F7F7F007F7F
      7F000000000000000000000000007F7F7F00FFFFFF00000000007F7F7F007F7F
      7F007F7F7F00FFFFFF00FFFFFF000000000099999900FFFFFF00FFFFFF000066
      6600FFFFFF00009999000066660000003300FFFFFF0066CCCC00000033000066
      660000999900FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000007F7F7F007F7F7F000000
      000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      00007F7F7F007F7F7F00FFFFFF000000000099999900FFFFFF00CCFFFF000066
      660000666600FFFFFF000099990099FFFF00FFFFFF0099FFFF0066CCCC000099
      9900FFFFFF000000000000666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000007F7F7F00FFFFFF00FFFFFF0099999900FFFFFF00CCFFFF000066
      6600003333000066660099FFFF0066CCCC00006666000066660066CCCC0099FF
      FF00009999000066660000666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000007F7F7F007F7F7F00FFFFFF0099999900FFFFFF00CCFFFF000033
      330099FFFF0099FFFF0099FFFF000066660066CCCC00009999000066660099FF
      FF0099FFFF00FFFFFF0000666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F00FFFFFF00FFFFFF00000000000000
      000000000000000000007F7F7F000000000099999900FFFFFF00CCFFFF00CCFF
      FF000066660000999900006666000066660099FFFF0000999900006666000066
      6600009999000066660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      00000000000000000000000000000000000099999900FFFFFF00CCFFFF00CCFF
      FF0000666600FFFFFF00009999000066660099FFFF0000999900006666000099
      9900FFFFFF000066660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000008000000000000000800000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099999900FFFFFF00CCCCCC009999
      99000033330000333300999999000066660099FFFF0000999900006666000000
      0000009999000099990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF0000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF0099999900FFFFFF00CCCCCC000000
      000099999900999999009999990000666600FFFFFF00FFFFFF00006666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF0000000000000000007F7F7F0000000000FFFF
      FF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00FFFFFF00000000007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF0099999900FFFFFF00CCCCCC000000
      0000FFFFFF00FFFFFF0099999900CCFFFF000066660000666600333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
      FF007F7F7F007F7F7F007F7F7F00FFFFFF0099999900FFFFFF00CCCCCC000000
      0000FFFFFF00FFFFFF0099999900CCFFFF00CCFFFF00CCFFFF00333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000000000007F7F7F007F7F
      7F0000000000FFFFFF00000000007F7F7F0000000000FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF0099999900FFFFFF00CCCCCC000000
      0000000000000000000099999900CCFFFF00FFFFFF00CCFFFF00333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000007F7F7F000000000099999900FFFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000009999990099999900999999009999
      9900999999009999990099999900999999009999990099999900999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F7007F7F7F0085858500ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF007F7F7F009B9C9B009B9C9B00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300636563009B9C9B0000000000000000000000000000000000F9F9F9008585
      8500FBFBFB00F8F8F8008E8E8E0089898900ECECEC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF007F7F7F000000
      00007F7F7F007F7F7F00000000007F7F7F0063656300CECFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00636563009B9C9B000000000000000000F9F9F90086868600F2F2
      F2009696960096969600EDEDED00F9F9F9008E8E8E0089898900ECECEC000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000FFFFFF007F7F7F00FFFFFF00000000000000
      00000000000000000000FFFFFF007F7F7F0063656300CECFCE00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300CECFCE00636563006365630000000000DBDBDB0087878700F1F1F1009B9B
      9B00E7E7E700DFDFDF009292920097979700EDEDED00F9F9F9008E8E8E008989
      8900ECECEC00000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000FFFFFF000000
      0000FFFFFF007F7F7F00000000007F7F7F0063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE0063656300636563000000000079797900D2D2D2009E9E9E00EAEA
      EA00F4F4F400FBFBFB0000000000DBDBDB009292920097979700EDEDED00F9F9
      F9008E8E8E0089898900EAEAEA0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF00000000007F7F7F0063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00009A
      000000FF0000636563006365630000000000ABABAB0063636300F6F6F600EDED
      ED009090900092929200DBDBDB000000000000000000DBDBDB00929292009797
      9700EEEEEE00FDFDFD005959590000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F0000000000000000007F7F7F009B9C9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063656300636563000000000075757500E3E3E300EEEEEE009595
      9500E8E8E800DFDFDF009394940093949400DBDBDB000000000000000000DBDB
      DB00969696008B8B8B00A4A4A40000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7F000000000000000000000000007F7F7F00000000009B9C9B00F3F3F300CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE009B9C9B0000000000E3E3E3008585850089898900ECEC
      EC000000000000000000FDFAFA00DCDCDC009497970092919100DBDBDB000000
      000000000000EAEAEA005A5A5A0000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000FFFFFF00FFFFFF007F7F7F0000000000000000009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B009B9C9B00000000009B9C9B009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B0000000000E3E3E3008B8B8B00F1F1F1000000
      000000000000FCF9F900A2444400A749490000000000DDDFDF00929292009292
      9200E4E4E400B9B9B900B7B7B7000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F00000000007F7F7F00000000000000
      00007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      00000000000000000000000000000000000075757500E2E2E200000000000000
      0000FBF6F600A24848007700000077000000A3484800FEF9F90000000000DDDD
      DD008E8E8E0050505000FDFDFD00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F0000000000000000000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      000000000000000000003EB3FF0046DDFF0000CFFF0046DDFF00000000000000
      000000000000000000000000000000000000DADADA0089898900898A8A00EEEF
      EF00BE6C6C008200000080010100800101007E000000AD5B5B00000000000000
      000000000000E1E1E10092929200000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000003EB3FF003EB3FF003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000ECECEC008887
      87007F767600E0D2D200870D0D00850B0B00F0E2E200F5EBEB00FDFCFC000000
      0000F9F9F90083838300F7F7F700000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00FFFFFF00000000007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF00000000007F7F7F000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECECEC00A2A0A0008B121200880D0D00F7F0F0000000000000000000F9F9
      F90081818100F9F9F90000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF007F7F7F00000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F0F0008A0F0F00860F0F00A8A4A400EAECEC00FAFAFA008282
      8200F9F9F9000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F0F0008D1A1A0094202000E6E1E100848787007D7D7D00F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF00009AFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFDF
      DF00DFDFDF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00A0A0A000CFCFCF00DFDF
      DF00DFDFDF00DFDFDF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDFDF00DFDFDF00BFBF
      BF0070707000202020000000000000000000000000005050500090909000A0A0
      A000CFCFCF00DFDFDF00EFEFEF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF00CFCFCF00808080004040
      4000000000005050500060606000A0A0A000A0A0A000A0A0A000404040005050
      500090909000B0B0B000DFDFDF00EFEFEF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000BFBFBF0050505000202020008080
      8000A0A08000606060008F8F6F006F6F6F00606060007F7F3F00606060006060
      400040404000A0A0A000B0B0B000DFDFDF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000009F9F9F0060602000909050005050
      30006F6F6F00BFBFBF008F6F30004000000040000000BF9F9F00DFDFDF008F8F
      6F007050500040202000A0A0A000B0B0B0000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000009F9F9F008080600030303000C0C0
      C000B0B0B000BF9F2000DF7F0000FF3F0000FF0000009F000000CFCFCF00DFDF
      DF00DFDFDF009070500040202000A0A0A0000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000004040200060202000A08060009030
      30007F7F4000DFBF0000BF00000000000000BF000000FF000000A0606000CFCF
      CF00BFBF9F008060000040200000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000008080200020200000600000008040
      000080402000FF7F0000BF000000000000009F3F3F00DF5F3F0070503000B0B0
      9000804000006060400030303000BFBFBF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000A0A0600060604000202000006000
      0000806000009F200000FF000000FF000000FF000000DFDF3F00804000008020
      000070707000202020009F9F9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000090903000A0A08000B0B090002020
      000000000000400000004000000040000000400000004000000020202000A0A0
      8000202020009F9F9F0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000CFCFCF00A0A06000A0A08000A0A0
      A000A0A0A000808060006F6F6F006F6F6F008F8F6F00A0A0A000A0A0A0002020
      20009F9F9F000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000007F7F3F00BFBF9F00A0A080009090
      700090907000AFAF8F008080600080808000808060008080600060606000DFDF
      DF000000000000000000DFDFDF00C0C0C0000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000003030300020200000707030009090
      7000A0A0A0009090900090907000A0A06000CFCFCF00DFDFDF00000000000000
      0000DFDFDF008080600070503000CFAFAF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      000000000000000000000000000000000000EFEFEF0030303000000000002020
      000040402000A0A06000B0B09000DFDFDF00DFDFDF00DFDFDF00BFBF9F006060
      60002020000030303000EFEFEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000AFAFAF003030
      3000000000000000000000000000000000000000000000000000000000003030
      3000AFAFAF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00EFEFEF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFC1FFF3F0000F83FF007F3330000
      E00FE38300030000C447CE41000100008C639C31000100009C739EF800010000
      3FF91F78000100003EF91E3D000300003C7F1C3F000300003C7F1C2000130000
      3C410C00001F00009C61A420001F00008C719020001F0000C441CA80001F0000
      E00DE38D001F0000F83FF83F001F0000FC00FC008003E1FFFC0090680001C07F
      200000923FF0801F00001E3C0000000700001C520000020100001E0200000181
      00001C167FF800610000180E80000C1900000018C0011881000010B2FE3F3021
      E000E178FC1F0039F800FAC0F80FC011F000F492FE3FF063E001E0F1FE3FF807
      C403C403FE3FF80FEC07EC07FE3FFFFFFFFFFFFFFFFFE003FFF9FC7FE3FF8000
      FFF9F21F83FF0000E3F3E40F000F0000E3F3C203003F0000E1C78603002F0000
      F08F8C01000F0000F81F9001000F0000FC3F802100010001F81F800100010003
      F09FC06300010007E1C7F18F000F000C83E3FE01000F00308FF1FF07002F0001
      FFFFFF8F803FC007FFFFFFFFE3FFF01F00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'Arquivos de Retorno|*.ret;*.txt|Arquivos CSV|*.csv|Todos os Arqu' +
      'ivos *.*|*.*'
    FilterIndex = 3
    Left = 816
    Top = 40
  end
  object tblBanco: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from banco_parametro_retorno'
      'where cd_banco = :banco')
    Params = <
      item
        DataType = ftString
        Name = 'banco'
        ParamType = ptUnknown
      end>
    Left = 928
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'banco'
        ParamType = ptUnknown
      end>
    object tblBancocd_banco: TStringField
      FieldName = 'cd_banco'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
      FixedChar = True
      Size = 3
    end
    object tblBanconm_banco: TStringField
      FieldName = 'nm_banco'
      Origin = 'WMESTRE12.banco_parametro_retorno.nn_inicio'
      Size = 50
    end
    object tblBanconn_inicio: TSmallintField
      FieldName = 'nn_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.nn_inicio'
    end
    object tblBanconn_tam: TSmallintField
      FieldName = 'nn_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.nn_tam'
    end
    object tblBancobanco_inicio: TSmallintField
      FieldName = 'banco_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.banco_inicio'
    end
    object tblBancobanco_tam: TSmallintField
      FieldName = 'banco_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.banco_tam'
    end
    object tblBancoretorno_inicio: TIntegerField
      FieldName = 'retorno_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancoocorre_inicio: TSmallintField
      FieldName = 'ocorre_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancoocorre_tam: TSmallintField
      FieldName = 'ocorre_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancovl_titulo_inicio: TSmallintField
      FieldName = 'vl_titulo_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancovl_titulo_tam: TSmallintField
      FieldName = 'vl_titulo_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancovl_pago_inicio: TSmallintField
      FieldName = 'vl_pago_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancovl_pago_tam: TSmallintField
      FieldName = 'vl_pago_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancovl_acresc_inicio: TSmallintField
      FieldName = 'vl_acresc_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancovl_acresc_tam: TSmallintField
      FieldName = 'vl_acresc_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancosequencia_inicio: TSmallintField
      FieldName = 'sequencia_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancosequencia_tam: TSmallintField
      FieldName = 'sequencia_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancodt_pgto_inicio: TSmallintField
      FieldName = 'dt_pgto_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancodt_pgto_tam: TSmallintField
      FieldName = 'dt_pgto_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancods_layout: TStringField
      FieldName = 'ds_layout'
      Origin = 'WMESTRE12.banco_parametro_retorno.ds_layout'
    end
    object tblBancolayout_inicio: TSmallintField
      FieldName = 'layout_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.layout_inicio'
    end
    object tblBancolayout_tam: TSmallintField
      FieldName = 'layout_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.layout_tam'
    end
    object tblBanconr_linha_header: TSmallintField
      FieldName = 'nr_linha_header'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBanconr_linha_trailer: TSmallintField
      FieldName = 'nr_linha_trailer'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBanconr_linha_registro: TSmallintField
      FieldName = 'nr_linha_registro'
      Origin = 'WMESTRE12.banco_parametro_retorno.cd_banco'
    end
    object tblBancoconta_inicio: TSmallintField
      FieldName = 'conta_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.conta_inicio'
    end
    object tblBancoconta_tam: TSmallintField
      FieldName = 'conta_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.conta_tam'
    end
    object tblBancomotivo_inicio: TSmallintField
      FieldName = 'motivo_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.motivo_inicio'
    end
    object tblBancomotivo_tam: TSmallintField
      FieldName = 'motivo_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.motivo_tam'
    end
    object tblBancotarifa_inicio: TSmallintField
      FieldName = 'tarifa_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.tarifa_inicio'
    end
    object tblBancotarifa_tam: TSmallintField
      FieldName = 'tarifa_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.tarifa_tam'
    end
    object tblBancosn_acrescimo_separado: TSmallintField
      FieldName = 'sn_acrescimo_separado'
      Origin = 'WMESTRE12.banco_parametro_retorno.sn_acrescimo_separado'
    end
    object tblBancodt_pgto_formado: TStringField
      FieldName = 'dt_pgto_formado'
      Origin = 'WMESTRE12.banco_parametro_retorno.dt_pgto_formado'
      FixedChar = True
      Size = 3
    end
    object tblBancodt_credito_inicio: TSmallintField
      FieldName = 'dt_credito_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.dt_credito_inicio'
    end
    object tblBancodt_credito_tam: TSmallintField
      FieldName = 'dt_credito_tam'
      Origin = 'WMESTRE12.banco_parametro_retorno.dt_credito_tam'
    end
    object tblBancodt_credito_formato: TStringField
      FieldName = 'dt_credito_formato'
      Origin = 'WMESTRE12.banco_parametro_retorno.dt_credito_formato'
      FixedChar = True
      Size = 3
    end
    object tblBancolinha_ignorar_inicio: TSmallintField
      FieldName = 'linha_ignorar_inicio'
      Origin = 'WMESTRE12.banco_parametro_retorno.linha_ignorar_inicio'
    end
    object tblBancolinha_ignorar_tamanho: TSmallintField
      FieldName = 'linha_ignorar_tamanho'
      Origin = 'WMESTRE12.banco_parametro_retorno.linha_ignorar_tamanho'
    end
    object tblBancolinha_ignorar_texto: TStringField
      FieldName = 'linha_ignorar_texto'
      Origin = 'WMESTRE12.banco_parametro_retorno.linha_ignorar_texto'
      Size = 100
    end
    object tblBancocarteira_inicio: TSmallintField
      FieldName = 'carteira_inicio'
    end
    object tblBancocateira_tam: TSmallintField
      FieldName = 'cateira_tam'
    end
    object tblBanconn_inicio2: TSmallintField
      FieldName = 'nn_inicio2'
    end
    object tblBanconn_tam2: TSmallintField
      FieldName = 'nn_tam2'
    end
    object tblBancocarteira_nn1: TStringField
      FieldName = 'carteira_nn1'
      Size = 10
    end
    object tblBancocarteira_nn2: TStringField
      FieldName = 'carteira_nn2'
      Size = 10
    end
    object tblBancofl_dt_pgto_inicio: TIntegerField
      FieldName = 'fl_dt_pgto_inicio'
    end
    object tblBancofl_dt_pgto: TStringField
      FieldName = 'fl_dt_pgto'
      Size = 10
    end
    object tblBancods_separador_colunas: TStringField
      FieldName = 'ds_separador_colunas'
      Size = 5
    end
    object tblBanconr_cpf_inicio: TSmallintField
      FieldName = 'nr_cpf_inicio'
    end
    object tblBanconr_cpf_tam: TSmallintField
      FieldName = 'nr_cpf_tam'
    end
    object tblBancodt_venc_inicio: TSmallintField
      FieldName = 'dt_venc_inicio'
    end
    object tblBancodt_venc_tam: TSmallintField
      FieldName = 'dt_venc_tam'
    end
    object tblBancodt_venc_formato: TStringField
      FieldName = 'dt_venc_formato'
      Size = 3
    end
    object tblBancosn_liberar_juros: TSmallintField
      FieldName = 'sn_liberar_juros'
    end
    object tblBancotarifa_inicio2: TIntegerField
      FieldName = 'tarifa_inicio2'
    end
    object tblBancotarifa_tam2: TIntegerField
      FieldName = 'tarifa_tam2'
    end
  end
  object qryItens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select ri.cd_retorno, ri.nr_sequencia, ri.nr_nossonumero, ri.cd_' +
        'ocorrencia, ri.cd_motivo'
      
        ', ri.dt_pagamento, ri.dt_credito, ri.vl_titulo, ri.vl_acrescimo,' +
        ' ri.vl_pago, ri.vl_tarifa'
      
        ', IFNULL(bcr.ds_ocorrencia, '#39'Ocorr'#234'ncia n'#227'o configurada'#39') as ds_' +
        'ocorrencia'
      
        ', CAST(IF(ISNULL(bcr.ds_ocorrencia), 0, 1) AS CHAR) as sn_ocorre' +
        'ncia'
      ', IFNULL(brm.ds_motivo, '#39#39') as ds_motivo'
      ', bcr.sn_baixar'
      ', bcr.ds_situacao ds_situacao_remessa'
      ', ri.cd_caixa'
      ', ri.cd_situacao'
      ', si.ds_valor as "ds_situacao"'
      ', si.ds_sigla as "ds_cor"'
      ', ri.cd_pessoa'
      ', ri.cd_resp'
      ', ri.dt_vencimento'
      ', IFNULL(p.nm_pessoa, '#39#39') as nm_pessoa'
      ', IFNULL(re.nm_pessoa, '#39#39') as nm_resp'
      
        ', ROUND(SUM(IF(IFNULL(bcr.sn_baixar, '#39#39')='#39'S'#39', me.valorpago, 0)),' +
        '2) as vl_soma_baixas'
      ', ri.ds_observacao'
      ', r.baixados, r.rejeitados, r.outras_ocorrencias'
      'FROM retorno_itens as ri'
      'INNER JOIN retorno as r ON (r.codigo = ri.cd_retorno)'
      
        'INNER JOIN situacoes as si ON (si.cd_situacao = ri.cd_situacao a' +
        'nd si.cd_modulo = 2004)'
      'LEFT JOIN pessoas as p ON (p.cd_pessoa = ri.cd_pessoa)'
      'LEFT JOIN pessoas as re ON (re.cd_pessoa = ri.cd_resp)'
      
        'LEFT JOIN banco_codigo_retorno as bcr ON (bcr.cd_banco = r.cd_ba' +
        'nco and bcr.cd_retorno = ri.cd_ocorrencia AND bcr.cd_origem = 1)'
      
        'LEFT JOIN banco_retorno_motivos as brm ON (brm.cd_banco = r.cd_b' +
        'anco and brm.cd_motivo = ri.cd_motivo AND brm.cd_grupo_motivos =' +
        ' bcr.cd_grupo_motivos and brm.cd_origem = 1 )'
      
        'LEFT JOIN retorno_itens_titulos as rit ON (rit.cd_retorno = ri.c' +
        'd_retorno and rit.nr_sequencia = ri.nr_sequencia)'
      
        'LEFT JOIN mensalidades as me ON (me.cd_mensalidade = rit.cd_mens' +
        'alidade)'
      'where ri.cd_retorno = :cd_retorno'
      'GROUP BY ri.cd_retorno, ri.nr_sequencia'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end>
    object qryItenscd_retorno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Ret.'
      DisplayWidth = 5
      FieldName = 'cd_retorno'
      Required = True
    end
    object qryItensnr_sequencia: TIntegerField
      Tag = 1
      DisplayLabel = 'Linha'
      DisplayWidth = 8
      FieldName = 'nr_sequencia'
      Required = True
    end
    object qryItensnr_nossonumero: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'nr_nossonumero'
      Required = True
      Size = 30
    end
    object qryItenscd_ocorrencia: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. OC'
      DisplayWidth = 8
      FieldName = 'cd_ocorrencia'
      Required = True
      Size = 10
    end
    object qryItensds_ocorrencia: TStringField
      Tag = 1
      DisplayLabel = 'Ocorr'#234'ncia'
      DisplayWidth = 25
      FieldName = 'ds_ocorrencia'
      ReadOnly = True
      Size = 50
    end
    object qryItenscd_motivo: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Motivo'
      FieldName = 'cd_motivo'
      Required = True
      Size = 10
    end
    object qryItensds_motivo: TStringField
      Tag = 1
      DisplayLabel = 'Motivo'
      DisplayWidth = 30
      FieldName = 'ds_motivo'
      ReadOnly = True
      Size = 100
    end
    object qryItensdt_pagamento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Pagamento'
      DisplayWidth = 15
      FieldName = 'dt_pagamento'
      Required = True
    end
    object qryItensdt_credito: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      DisplayWidth = 15
      FieldName = 'dt_credito'
      Required = True
    end
    object qryItensvl_titulo: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. T'#237'tulo'
      DisplayWidth = 13
      FieldName = 'vl_titulo'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensvl_pago: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Pago'
      DisplayWidth = 13
      FieldName = 'vl_pago'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensvl_tarifa: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Tarifa'
      DisplayWidth = 7
      FieldName = 'vl_tarifa'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryItenssn_baixar: TStringField
      FieldName = 'sn_baixar'
      Size = 1
    end
    object qryItenscd_caixa: TIntegerField
      Tag = 1
      DisplayLabel = 'Conta'
      FieldName = 'cd_caixa'
    end
    object qryItenscd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object qryItensds_situacao: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 20
      FieldName = 'ds_situacao'
      ReadOnly = True
      Size = 255
    end
    object qryItensvl_acrescimo: TFloatField
      Tag = 1
      DisplayLabel = 'Acr'#233'scimos'
      DisplayWidth = 8
      FieldName = 'vl_acrescimo'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensnm_pessoa: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Estudante'
      DisplayWidth = 40
      FieldName = 'nm_pessoa'
      ReadOnly = True
      Size = 60
    end
    object qryItensnm_resp: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Respons'#225'vel'
      DisplayWidth = 30
      FieldName = 'nm_resp'
      ReadOnly = True
      Size = 60
    end
    object qryItenscd_pessoa: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Aluno'
      FieldName = 'cd_pessoa'
    end
    object qryItenscd_resp: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Resp.'
      FieldName = 'cd_resp'
    end
    object qryItensvl_soma_baixas: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Baixado'
      DisplayWidth = 13
      FieldName = 'vl_soma_baixas'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensds_cor: TStringField
      FieldName = 'ds_cor'
      ReadOnly = True
      Size = 50
    end
    object qryItensds_observacao: TStringField
      Tag = 1
      DisplayLabel = 'Observa'#231#227'o'
      DisplayWidth = 60
      FieldName = 'ds_observacao'
      Size = 50
    end
    object qryItenssn_ocorrencia: TStringField
      FieldName = 'sn_ocorrencia'
      ReadOnly = True
    end
    object qryItensdt_vencimento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Vencimento'
      DisplayWidth = 15
      FieldName = 'dt_vencimento'
    end
    object qryItensbaixados: TIntegerField
      FieldName = 'baixados'
    end
    object qryItensrejeitados: TIntegerField
      FieldName = 'rejeitados'
    end
    object qryItensoutras_ocorrencias: TIntegerField
      FieldName = 'outras_ocorrencias'
    end
    object qryItensds_situacao_remessa: TStringField
      FieldName = 'ds_situacao_remessa'
      Size = 3
    end
  end
  object dtcItens: TDataSource
    AutoEdit = False
    DataSet = qryItens
    OnDataChange = dtcItensDataChange
    Left = 336
    Top = 248
  end
  object qryItensTotal: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT COUNT(ri.nr_sequencia) as qtd_linhas'
      ', SUM(IF(si.cd_auxiliar in (10), 1, 0)) as qtd_baixados'
      ', SUM(IF(si.cd_auxiliar in (9), 1, 0)) as qtd_informativos'
      ', SUM(IF(si.cd_auxiliar in (11), 1, 0)) as qtd_spc'
      
        '     , SUM(IF(si.cd_auxiliar not in (9, 10), 1, 0)) as qtd_pende' +
        'ntes'
      ''
      
        ', SUM(ri.vl_titulo) as soma_titulos, SUM(ri.vl_pago) as soma_pag' +
        'os, SUM(ri.vl_tarifa) as soma_tarifas'
      
        ', IF(SUM(IF(si.cd_auxiliar not in (9,10), 1, 0)) > 0, '#39'Existem b' +
        'aixas pendentes'#39', '#39'OK'#39') as ds_situacao'
      ', MAX(r.sn_tarifa_lancada) as sn_tarifa_lancada'
      'FROM retorno_itens as ri'
      'INNER JOIN retorno as r ON (r.codigo = ri.cd_retorno)'
      
        'INNER JOIN situacoes as si ON (si.cd_situacao = ri.cd_situacao a' +
        'nd si.cd_modulo = 2004)'
      
        'LEFT JOIN banco_codigo_retorno as bcr ON (bcr.cd_banco = r.cd_ba' +
        'nco and bcr.cd_retorno = ri.cd_ocorrencia AND bcr.cd_origem = 1)'
      
        'LEFT JOIN banco_retorno_motivos as brm ON (brm.cd_banco = r.cd_b' +
        'anco and brm.cd_motivo = ri.cd_motivo AND brm.cd_grupo_motivos =' +
        ' bcr.cd_grupo_motivos and brm.cd_origem = 1 )'
      'where ri.cd_retorno = :cd_retorno')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end>
    object qryItensTotalqtd_linhas: TLargeintField
      FieldName = 'qtd_linhas'
      ReadOnly = True
    end
    object qryItensTotalsoma_titulos: TFloatField
      FieldName = 'soma_titulos'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensTotalsoma_pagos: TFloatField
      FieldName = 'soma_pagos'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensTotalsoma_tarifas: TFloatField
      FieldName = 'soma_tarifas'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryItensTotalds_situacao: TStringField
      FieldName = 'ds_situacao'
      ReadOnly = True
      Size = 24
    end
    object qryItensTotalsn_tarifa_lancada: TSmallintField
      FieldName = 'sn_tarifa_lancada'
    end
    object qryItensTotalqtd_baixados: TLargeintField
      FieldName = 'qtd_baixados'
      ReadOnly = True
    end
    object qryItensTotalqtd_informativos: TLargeintField
      FieldName = 'qtd_informativos'
      ReadOnly = True
    end
    object qryItensTotalqtd_pendentes: TLargeintField
      FieldName = 'qtd_pendentes'
      ReadOnly = True
    end
    object qryItensTotalqtd_spc: TLargeintField
      FieldName = 'qtd_spc'
    end
  end
  object qryTitulos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select ri.cd_retorno, ri.nr_sequencia, rit.cd_mensalidade, me.cd' +
        '_mensalidade_origem'
      ', me.valorbruto + IFNULL(me.valorjuros_fixo, 0) as vl_titulo'
      ', me.descontoextra'
      ', GET_DESCONTOS(me.cd_mensalidade, NULL) as vl_desc_calc'
      ', me.valorextra'
      ', me.valorjuros'
      ', me.valorpago'
      
        ', (IFNULL(me.valorbruto, 0) - IFNULL(me.descontoextra,0) + IFNUL' +
        'L(me.valorjuros_fixo,0) + IFNULL(me.valorextra,0)) as "vl_total"'
      ', IFNULL(tt.ds_tipo_titulo,'#39#39') as ds_tipo_titulo'
      ', me.datavencimento '
      ', me.parcela'
      ''
      'FROM retorno_itens as ri'
      
        'LEFT JOIN retorno_itens_titulos as rit ON (rit.cd_retorno = ri.c' +
        'd_retorno and rit.nr_sequencia = ri.nr_sequencia)'
      
        'LEFT JOIN mensalidades as me ON (me.cd_mensalidade = rit.cd_mens' +
        'alidade)'
      'LEFT JOIN coligadas as co ON (co.cd_coligada = me.cd_coligada)'
      
        'LEFT JOIN fin_config_tipos_titulo as tt ON (tt.cd_tipo_titulo = ' +
        'me.cd_tipo_titulo AND tt.cd_coligada_matriz = co.CD_COLIGADA_MAT' +
        'RIZ)'
      
        'where ri.cd_retorno = :cd_retorno AND ri.nr_sequencia = :nr_sequ' +
        'encia'
      'GROUP BY ri.cd_retorno, ri.nr_sequencia, me.cd_mensalidade'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
    object qryTituloscd_retorno: TIntegerField
      FieldName = 'cd_retorno'
      Required = True
    end
    object qryTitulosnr_sequencia: TIntegerField
      Tag = 1
      DisplayLabel = 'Linha'
      FieldName = 'nr_sequencia'
      Required = True
    end
    object qryTituloscd_mensalidade: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.T'#237'tulo'
      FieldName = 'cd_mensalidade'
      Required = True
    end
    object qryTitulosvl_titulo: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      FieldName = 'vl_titulo'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryTitulosdescontoextra: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Fixo'
      FieldName = 'descontoextra'
      DisplayFormat = '#,##0.00'
    end
    object qryTitulosvl_desc_calc: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Cond.'
      FieldName = 'vl_desc_calc'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryTitulosvalorextra: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Extra'
      FieldName = 'valorextra'
      DisplayFormat = '#,##0.00'
    end
    object qryTitulosvalorpago: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Pago'
      FieldName = 'valorpago'
      DisplayFormat = '#,##0.00'
    end
    object qryTitulosvl_total: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Total'
      FieldName = 'vl_total'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryTitulosds_tipo_titulo: TStringField
      Tag = 1
      DisplayLabel = 'Tipo de T'#237'tulo'
      FieldName = 'ds_tipo_titulo'
      ReadOnly = True
      Size = 255
    end
    object qryTitulosdatavencimento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Vencimento'
      FieldName = 'datavencimento'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      FieldName = 'parcela'
      Required = True
    end
    object qryTituloscd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
    end
    object qryTitulosvalorjuros: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Juros'
      FieldName = 'valorjuros'
      DisplayFormat = '#,##0.00'
    end
  end
  object qryTarifaTotal: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT ri.dt_credito'
      ', ri.cd_caixa'
      ', SUM(ri.vl_tarifa) as soma_tarifas'
      ', r.sn_tarifa_lancada'
      'FROM retorno_itens as ri'
      'INNER JOIN retorno as r ON (r.codigo = ri.cd_retorno)'
      
        'INNER JOIN situacoes as si ON (si.cd_situacao = ri.cd_situacao a' +
        'nd si.cd_modulo = 2004)'
      'where ri.cd_retorno =  :cd_retorno'
      'group by ri.dt_credito, ri.cd_caixa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end>
    object qryTarifaTotaldt_credito: TDateTimeField
      FieldName = 'dt_credito'
      Required = True
    end
    object qryTarifaTotalcd_caixa: TIntegerField
      FieldName = 'cd_caixa'
      Required = True
    end
    object qryTarifaTotalsoma_tarifas: TFloatField
      FieldName = 'soma_tarifas'
      ReadOnly = True
    end
    object qryTarifaTotalsn_tarifa_lancada: TSmallintField
      FieldName = 'sn_tarifa_lancada'
    end
  end
  object qyVerificaArquivoRemessa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        #9'ra.cd_arquivo, SUM(CASE WHEN rs.ds_situacao IN ('#39'F'#39', '#39'E'#39') THEN ' +
        '1 ELSE 0 END) nr_pendentes'
      'FROM'
      #9'rem_arquivos ra'
      #9'INNER JOIN rem_envios re ON (re.cd_arquivo = ra.cd_arquivo)'
      
        #9'INNER JOIN rem_status rs ON (rs.nr_nossonumero = re.nr_nossonum' +
        'ero)'
      'WHERE'
      #9'ra.ds_situacao != '#39'R'#39' AND'
      #9're.sn_ignorado = 0'
      'GROUP BY'
      #9'ra.cd_arquivo'
      'HAVING'
      '  nr_pendentes = 0')
    Params = <>
    Left = 624
    Top = 240
    object qyVerificaArquivoRemessacd_arquivo: TIntegerField
      FieldName = 'cd_arquivo'
    end
    object qyVerificaArquivoRemessanr_pendentes: TLargeintField
      FieldName = 'nr_pendentes'
    end
  end
  object qyAtualizaArquivoRemessa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      #9'rem_arquivos'
      'SET'
      '  ds_situacao = '#39'R'#39
      'WHERE'
      '  cd_arquivo = :cd_arquivo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_arquivo'
        ParamType = ptUnknown
      end>
    Left = 656
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_arquivo'
        ParamType = ptUnknown
      end>
  end
end
