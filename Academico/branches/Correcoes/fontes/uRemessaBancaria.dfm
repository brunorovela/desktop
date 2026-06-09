object frmRemessaBancaria: TfrmRemessaBancaria
  Left = 0
  Top = 0
  Caption = 'Remessa banc'#225'ria'
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GERAR REMESSA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnLayout: TPanel
    Left = 0
    Top = 25
    Width = 1016
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbLayout: TLabel
      Left = 11
      Top = 10
      Width = 37
      Height = 13
      Caption = 'Layout:'
    end
    object sbConfigLayout: TSpeedButton
      Left = 420
      Top = 6
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666688888
        666666000000666668000008886666000000666600FFFFF00886660000006660
        FFFF1FFFF08866000000660FF1FFFFF1FF088600000060FFFFFFFFFFFFF08600
        000060F1FFFFFFFFF1F0880000000FFFFFFFFFFFFFFF080000000FFFFFFFF777
        7FFF080000000F1FFFFF0000FF1F080000000FFFFFFF07FFFFFF080000000FFF
        FFFF07FFFFFF0600000060F1FFFF07FFF1F08600000060FFFFFF07FFFFF06600
        0000660FF1FF07F1FF06660000006660FFFF0FFFF06666000000666600FFFFF0
        066666000000666666000006666666000000}
      OnClick = sbConfigLayoutClick
    end
    object cbLayouts: TUMComboBox
      Left = 55
      Top = 7
      Width = 362
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbLayoutsChange
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
  end
  object pcRemessa: TPageControl
    Left = 0
    Top = 57
    Width = 1016
    Height = 436
    ActivePage = tsFilaRemessa
    Align = alClient
    TabOrder = 2
    OnChange = pcRemessaChange
    object tsFilaRemessa: TTabSheet
      Caption = 'Fila da remessa'
      object pnFilaRemessa: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 408
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnPesquisarFila: TPanel
          Left = 0
          Top = 0
          Width = 1008
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbPesquisarFila: TLabel
            Left = 7
            Top = 21
            Width = 58
            Height = 13
            Caption = 'Pesquisar:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btFiltrarFila: TButton
            Left = 477
            Top = 17
            Width = 75
            Height = 22
            Caption = 'Filtrar'
            TabOrder = 1
            OnClick = btFiltrarFilaClick
          end
          object edPesquisarFila: TEdit
            Left = 71
            Top = 18
            Width = 400
            Height = 21
            TabOrder = 0
            Text = 
              'Digite um NN, respons'#225'vel, ocorr'#234'ncia ou vencimento que deseja p' +
              'esquisar'
            OnEnter = edPesquisarFilaEnter
            OnExit = edPesquisarFilaExit
            OnKeyDown = edPesquisarFilaKeyDown
          end
        end
        object dbgFilaRemessa: TDBGrid
          Left = 0
          Top = 54
          Width = 1008
          Height = 305
          Align = alClient
          DataSource = dsFilaRemessa
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgFilaRemessaCellClick
          OnDrawColumnCell = dbgFilaRemessaDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'sn_selecao'
              Title.Alignment = taCenter
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_nossonumero'
              Title.Caption = 'Nosso N'#250'mero'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_pessoa'
              Title.Caption = 'Respons'#225'vel'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_aluno'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_vencimento'
              Title.Caption = 'Vencimento'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_nominal'
              Title.Caption = 'Valor nominal'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_desconto'
              Title.Caption = 'Desc. condicional'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_ocorrencia'
              Title.Caption = 'Ocorr'#234'ncia'
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_inclusao'
              Title.Caption = 'Data da a'#231#227'o'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_criticas'
              Width = 233
              Visible = True
            end>
        end
        object tbAcoesFila: TToolBar
          Left = 0
          Top = 382
          Width = 1008
          Height = 26
          Align = alBottom
          ButtonWidth = 157
          EdgeBorders = [ebTop, ebBottom]
          Images = ilAcoes
          List = True
          ShowCaptions = True
          TabOrder = 2
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btMarcar: TSpeedButton
            Left = 8
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Marcar todos'
            Glyph.Data = {
              82020000424D8202000000000000420000002800000011000000100000000100
              10000300000040020000C30E0000C30E00000000000000000000007C0000E003
              00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
              734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
              FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
              FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
              734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
              0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
              734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
              FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
              FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
              734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
              734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
              0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
              FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
              734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7F0000}
            Transparent = False
            OnClick = btMarcarClick
          end
          object btDesmarcar: TSpeedButton
            Left = 31
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Desmarcar todos'
            Glyph.Data = {
              76030000424D7603000000000000360000002800000011000000100000000100
              18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
              999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
              99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
              999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
              FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
              999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            Transparent = False
            OnClick = btDesmarcarClick
          end
          object ToolButton5: TToolButton
            Left = 54
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btVerResumoFila: TToolButton
            Left = 62
            Top = 0
            AutoSize = True
            Caption = 'Ver resumo'
            ImageIndex = 0
            OnClick = btVerResumoFilaClick
          end
          object btnTitulos: TToolButton
            Left = 147
            Top = 0
            AutoSize = True
            Caption = 'Mostrar t'#237'tulos'
            ImageIndex = 7
            OnClick = btnTitulosClick
          end
          object btnSep1: TToolButton
            Left = 247
            Top = 0
            Width = 8
            Caption = 'btnSep1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btnIncluir: TToolButton
            Left = 255
            Top = 0
            AutoSize = True
            Caption = 'F2 Incluir'
            Enabled = False
            ImageIndex = 6
            OnClick = btnIncluirClick
          end
          object btRemoverFila: TToolButton
            Left = 330
            Top = 0
            AutoSize = True
            Caption = 'F9 Remover selecionado(s)'
            ImageIndex = 1
            OnClick = btRemoverFilaClick
          end
          object ToolButton3: TToolButton
            Left = 491
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btGerarArquivoFila: TToolButton
            Left = 499
            Top = 0
            Caption = 'Gerar arquivo de remessa'
            ImageIndex = 2
            OnClick = btGerarArquivoFilaClick
          end
          object ToolButton4: TToolButton
            Left = 656
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btFecharFila: TToolButton
            Left = 664
            Top = 0
            AutoSize = True
            Caption = 'F12 Fechar'
            ImageIndex = 3
            OnClick = btFecharClick
          end
          object ToolButton2: TToolButton
            Left = 749
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 8
            Style = tbsSeparator
          end
        end
        object pnCriticas: TPanel
          Left = 0
          Top = 359
          Width = 1008
          Height = 23
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 
            '   Aten'#231#227'o: Existem registros com inconcist'#234'ncias no cadastro do' +
            ' respons'#225'vel. Essas informa'#231#245'es poder'#227'o ser rejeitadas pelo banc' +
            'o. Favor corrigir o cadastro desses respons'#225'veis antes de export' +
            'ar.'
          Color = clYellow
          TabOrder = 3
          Visible = False
        end
      end
    end
    object tsArquivos: TTabSheet
      Caption = 'Arquivos'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnArquivo: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 408
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnPesquisarArquivo: TPanel
          Left = 0
          Top = 0
          Width = 1008
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbDataExportacaoArquivo: TLabel
            Left = 7
            Top = 20
            Width = 97
            Height = 13
            Caption = 'Data Exporta'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbAteArquivo: TLabel
            Left = 229
            Top = 20
            Width = 16
            Height = 13
            Caption = 'at'#233
          end
          object btFiltrarArquivo: TButton
            Left = 363
            Top = 16
            Width = 75
            Height = 22
            Caption = 'Filtrar'
            TabOrder = 0
            OnClick = btFiltrarArquivoClick
          end
          object dtpFimExportacao: TUMDateTimePicker
            Left = 255
            Top = 17
            Width = 100
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
            OnChangeDate = dtpFimExportacaoChangeDate
            Date = 42859.000000000000000000
            InverterPosicaoCalendario = False
            MostraCalenadarioDesdeCampoTexto = False
          end
          object dtpInicioExportacao: TUMDateTimePicker
            Left = 118
            Top = 17
            Width = 100
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
            OnChangeDate = dtpInicioExportacaoChangeDate
            Date = 42859.000000000000000000
            InverterPosicaoCalendario = False
            MostraCalenadarioDesdeCampoTexto = False
          end
        end
        object dbgArquivo: TDBGrid
          Left = 0
          Top = 54
          Width = 1008
          Height = 328
          Align = alClient
          DataSource = dsArquivos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dbgArquivoDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'dt_exportacao'
              Title.Caption = 'Data'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_arquivo'
              Title.Caption = 'Nome do arquivo'
              Width = 229
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_boletos'
              Title.Caption = 'Qtd. boletos'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_situacao_completa'
              Title.Caption = 'Situa'#231#227'o'
              Width = 300
              Visible = True
            end>
        end
        object tbAcoesPesquisar: TToolBar
          Left = 0
          Top = 382
          Width = 1008
          Height = 26
          Align = alBottom
          ButtonWidth = 146
          EdgeBorders = [ebTop, ebBottom]
          Images = ilAcoes
          List = True
          ShowCaptions = True
          TabOrder = 2
          object ToolButton7: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btConfirmarEnvioBancoArquivo: TToolButton
            Left = 8
            Top = 0
            Caption = 'Confirma envio ao banco'
            ImageIndex = 4
            OnClick = btConfirmarEnvioBancoArquivoClick
          end
          object btVerResumoArquivo: TToolButton
            Left = 154
            Top = 0
            AutoSize = True
            Caption = 'Ver resumo'
            ImageIndex = 0
            OnClick = btVerResumoArquivoClick
          end
          object btExcluirArquivo: TToolButton
            Left = 239
            Top = 0
            AutoSize = True
            Caption = 'F9 Excluir arquivo'
            ImageIndex = 1
            OnClick = btExcluirArquivoClick
          end
          object ToolButton10: TToolButton
            Left = 355
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btBaixarArquivo: TToolButton
            Left = 363
            Top = 0
            AutoSize = True
            Caption = 'Baixar Arquivo'
            ImageIndex = 2
            OnClick = btBaixarArquivoClick
          end
          object ToolButton12: TToolButton
            Left = 464
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btFecharArquivo: TToolButton
            Left = 472
            Top = 0
            AutoSize = True
            Caption = 'F12 Fechar'
            ImageIndex = 3
            OnClick = btFecharArquivoClick
          end
          object ToolButton14: TToolButton
            Left = 557
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 8
            Style = tbsSeparator
          end
        end
      end
    end
    object tsConteudoArquivo: TTabSheet
      Caption = 'Conte'#250'do do arquivo'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnConteudoArquivo: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 408
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnPesquisarConteudoArquivo: TPanel
          Left = 0
          Top = 0
          Width = 1008
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbPesquisarConteudoArquivo: TLabel
            Left = 7
            Top = 21
            Width = 58
            Height = 13
            Caption = 'Pesquisar:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edPesquisarConteudoArquivo: TEdit
            Left = 71
            Top = 18
            Width = 400
            Height = 21
            TabOrder = 0
            Text = 
              'Digite um NN, respons'#225'vel, ocorr'#234'ncia ou vencimento que deseja p' +
              'esquisar'
            OnEnter = edPesquisarConteudoArquivoEnter
            OnExit = edPesquisarConteudoArquivoExit
            OnKeyDown = edPesquisarConteudoArquivoKeyDown
          end
          object btFiltrarConteudoArquivo: TButton
            Left = 477
            Top = 17
            Width = 75
            Height = 22
            Caption = 'Filtrar'
            TabOrder = 1
            OnClick = btFiltrarConteudoArquivoClick
          end
        end
        object tbArquivo: TToolBar
          Left = 0
          Top = 382
          Width = 1008
          Height = 26
          Align = alBottom
          ButtonWidth = 121
          EdgeBorders = [ebTop, ebBottom]
          Images = ilAcoes
          List = True
          ShowCaptions = True
          TabOrder = 1
          object ToolButton17: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object btnReenviar: TToolButton
            Left = 8
            Top = 0
            Caption = 'Reenviar rejeitadas'
            ImageIndex = 5
            OnClick = btnReenviarClick
          end
          object btnTitulosArquivo: TToolButton
            Left = 129
            Top = 0
            AutoSize = True
            Caption = 'Mostrar t'#237'tulos'
            ImageIndex = 7
            OnClick = btnTitulosArquivoClick
          end
          object ToolButton6: TToolButton
            Left = 229
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object btFecharConteudoArquivo: TToolButton
            Left = 237
            Top = 0
            AutoSize = True
            Caption = 'F12 Fechar'
            ImageIndex = 3
            OnClick = btFecharConteudoArquivoClick
          end
        end
        object pnGridConteudoArquivo: TPanel
          Left = 0
          Top = 54
          Width = 1008
          Height = 328
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 2
          object dbgConteudoArquivo: TDBGrid
            Left = 0
            Top = 0
            Width = 1004
            Height = 324
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsConteudoArquivo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgConteudoArquivoDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'nr_nossonumero'
                Title.Caption = 'Nosso N'#250'mero'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_pessoa'
                Title.Caption = 'Respons'#225'vel'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_aluno'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dt_vencimento'
                Title.Caption = 'Vencimento'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_nominal'
                Title.Caption = 'Valor nominal'
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vl_desconto'
                Title.Caption = 'Desc. condicional'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_ocorrencia'
                Title.Caption = 'Ocorr'#234'ncia'
                Width = 233
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_status'
                Title.Caption = 'Status atual'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dt_inclusao'
                Title.Caption = 'Data da a'#231#227'o'
                Width = 120
                Visible = True
              end>
          end
          object cbStatus: TUMComboBox
            Left = 761
            Top = 41
            Width = 105
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            TabOrder = 1
            Visible = False
            OnChange = cbStatusChange
            Items.Strings = (
              'Exportado'
              'Rejeitado')
            TamanhoMaximo = 0
            SelecionarUnicoAutomatico = False
          end
        end
      end
    end
  end
  object ilAcoes: TImageList
    Left = 744
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
      0000000000004B1F1D0052211B00682913006829130052211B004C1F1D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005723
      1900672913009C3E0600B1460100BB4B0000BC4B0000B44702009E3F06006B2B
      12004D1F1C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000004620900035F
      090003560600014F0400014C0400014C0400014C0400014C0400014C0400014C
      0400014C0400013D030000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000062281600933B
      0900C5500000C54F0000BF4D0000BC4A0000BD4C0000BF4C0000C24E0000C751
      0000923A09004E1F1C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078216000C9C2300099A
      1D000796150005920F0003900B00038F0A00038F0A0003900A0003900A00038F
      0A0003960B0002740700013D0300000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000682A13009A3E0600C54F
      0000BC490000BC4C0300BD4D0300BC4A0000BB490000BB490000BC4B0000BD4B
      0000C9500000933B08004B1E1D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000D98250013B53A000FAF
      2D000AAB230006A7180004A51300FFFFFF0018B02300009D030002A30B0003A4
      0C0003AC0D0003960A00014C0400000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081340C00C44F0000C04F
      0100BD500300BF500400BC4A0000BC4A0000BF530600BD4F0400BB480000BC4B
      0000BD4B0000C750000068291300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010A02D001CB4490016AD
      390021B240009EE9AD00A4EBB000D4FBDA00A4EAAB003EBB4700029D0A00039C
      0B0003A40C0003900A00014D0400000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000933B0700AF4A0500C9590700D584
      3E00F8E9DA00CC722A00B73D0000B73D0000DD9C6500F7E7D700D8925800BB48
      0100BB4A0000C44E0000A04005004E1F1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F0028B85B001FB2
      4C0045C26900FAFFFC002CB64700B8E9C20072D18100FBFFFE0044BD4E00039D
      0B0003A50C0003900A00014C04000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000009C3F0500C55D0D00D16B1800E3A5
      6C00FFFFFF00FFFFFF00D1793800B73D0000DC995D00FFFFFF00FEFCFB00E0A4
      7200BF540900BF4D0000B54902004E1F1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F003EC270002DBA
      5F0046C4720077D4930005A42700B6E9C20051C56700FFFFFF0086D79000049E
      0F0003A40C0003900A00014C040000000000000000007B7B7B000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000A0430700D4742300DA7F2E00E9AD
      7800FFFFFF00FFFFFF00FFFFFF00EDC7A500F3DAC000FEFBFA00FFFFFF00FFFF
      FF00EDC7A500BC4A0000BF4B000051201C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F005CCC880038BD
      670025B7580023B6540045C16B00CCF8D900EFFFF300FFFFFF0075D1840008A1
      190005A7120003910B00014D0400000000007B7B7B000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000A6470700DC8B4300E6985100EFBA
      8700FFFFFF00FFFFFF00FFFFFF00EDC7A500F7E3CF00FEFBFA00FFFFFF00FFFE
      FC00EBC6A400BC4B0000BF4B0000592318000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F0070D4970042C2
      70002FBB5F00A9EFC200FFFFFF00FFFFFF00FBFFFF0096DEAA0023B241000BA6
      230009A91C000593110002540500000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000009D400500DE914D00F0B27700F4C4
      9500FFFFFF00FFFFFF00E6A16400DC762100E6AB7300FFFFFF00FEFCFA00E0AA
      7800BD500600C04D0000B54802004D1F1D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F007DD79F004AC5
      760052C97E00FFFFFF00D9FEE700E3FCED0048C473001CB1460011AC35000FA9
      2D000DAC270009991B00035F0900000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000A0410500D47D3500F8C99900FACB
      9C00FEF4ED00F0B27600DC762100DC762100EEBA8B00FBF0E700E1A46C00BC49
      0100BA490000C44F00009E3F06004E1F1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F0086DAA60054C9
      7F005ACB8300FFFFFF007ED89F00BDEBCF003ABF6900B0F0C90044CB6E0015AD
      3B0012AF35000D9E2500056B0C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000B4520D00F4BF8A00FCD1
      A900FAC08600F7B67800ED9E5400E28B3F00E08E4300D77D3100C75B0B00C051
      0400BF4D0100C750000065281500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F0093DEB10066CF
      8C0042C27000A1EDBD00C5F8D800CBF8DD00B7F3CF00E0FFEB004CCE7A0019B0
      480017B1420010A12F0006760F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      FF000000000000000000000000000000000000000000A4410300D3792F00FCD4
      AC00FCD4AC00F4B57800EFAA6800E6934900DC803000D4722000CA641300C457
      0600C95201008E380A0056231A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A1300099E1B50090DD
      AD006CD191005DCC860070D39500FFFFFF008AE5AB0045C4730023B555001DB2
      51001CB54F0015A93D0008841400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000FF0000000000000000000000000000000000000000009F400500D079
      3000F7C79800FBD7B200F4C29100EBAB6E00E59C5700E0904700D9803100CC63
      0F00903B09006328160000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000011A12F0079D79F0099E1
      B6009DE2B80093DEB10083DAA5006DD395004FC97E0035BF680024B7590020B5
      55001FB8580018AD4300098E1600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000000000000000000000A341
      0300B2541300D5884700E3AA7500EBB68600E6AC7600D48C5000B25F23007F36
      1100622816000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022A9400037B5
      550039B5560037B5540033B250002AAF490021AA40001AA6390013A4310012A1
      320012A431000C9A230000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A4007009F460D009F47100095410F00973F0A008C390A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000009B9C9B009B9C9B00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300636563009B9C9B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000063656300CECFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00636563009B9C9B00000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000063656300CECFCE00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300CECFCE006365630063656300000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE0063656300636563000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00009A
      000000FF000063656300636563000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000009B9C9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636563006365630000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000009B9C9B00F3F3F300CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE009B9C9B000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B009B9C9B00000000009B9C9B009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B0000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003EB3FF0046DDFF0000CFFF0046DDFF00000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003EB3FF003EB3FF003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF00009AFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF81FFFFFFFFFFFFFE007FFFFC003
      F9FFC003FFFF8001F0FF8001FFFF8001F0FF8001FC7F8001E07F0000FD7F8001
      C07F0000FD7F8001843F0000E10F80011E3F0000EFEF8001FE1F0000E10F8001
      FF1F0000FD7F8001FF8F8001FD7F8001FFC78001FC7F8001FFE3C003FFFF8001
      FFF8E007FFFFC003FFFFF81FFFFFFFFFFC00FFFF8003FFFFFC00FFF90001E3FF
      2000FFF93FF083FF0000E3F30000000F0000E3F30000003F0000E1C70000002F
      0000F08F7FF8000F0000F81F8000000F0000FC3FC00100010000F81FFE3F0001
      E000F09FFC1F0001F800E1C7F80F000FF00083E3FE3F000FE0018FF1FE3F002F
      C403FFFFFE3F803FEC07FFFFFE3FE3FF00000000000000000000000000000000
      000000000000}
  end
  object qyFilaRemessa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  re.cd_envio,'
      '  re.nr_nossonumero, '
      #9'resp.nm_pessoa,'
      #9're.dt_vencimento,'
      #9're.vl_nominal,'
      #9're.vl_desconto,'
      #9'ro.ds_ocorrencia,'
      #9're.dt_inclusao,'
      #9'al.nm_pessoa as nm_aluno, '
      #9'IF(re.cd_ocorrencia = 1, '
      #9'  TRIM(MID(CONCAT('
      #9'  IF(resp.tp_pessoa = '#39'J'#39
      
        #9'     , IF(LPAD(IFNULL(resp.ds_cnpj, '#39#39'), 14, '#39'0'#39') = '#39'0000000000' +
        '0000'#39', '#39'/CNPJ Inv'#225'lido'#39', '#39#39')'
      
        #9'     , IF(LPAD(IFNULL(resp.ds_cpf, '#39#39'), 11, '#39'0'#39') = '#39'00000000000' +
        #39', '#39'/CPF Inv'#225'lido'#39', '#39#39')'
      #9'  ) , '
      
        #9'  IF(LPAD(IFNULL(resp.ds_cep, '#39#39'), 8, '#39'0'#39') = '#39'00000000'#39', '#39'/CEP ' +
        'Inv'#225'lido'#39', '#39#39'), '
      
        #9'  IF(TRIM(IFNULL(resp.ds_logradouro, '#39#39')) = '#39#39', '#39'/Endere'#231'o Inv'#225 +
        'lido'#39', '#39#39'),'
      
        #9'  IF(TRIM(IFNULL(resp.ds_bairro, '#39#39')) = '#39#39', '#39'/Bairro Inv'#225'lido'#39',' +
        ' '#39#39'), '
      
        #9'  IF(TRIM(IFNULL(resp.ds_cidade, '#39#39')) = '#39#39', '#39'/Cidade Inv'#225'lida'#39' ' +
        ', '#39#39'), '
      
        '      IF(TRIM(IFNULL(resp.ds_estado, '#39#39')) = '#39#39', '#39'/Estado Inv'#225'lid' +
        'o'#39', '#39#39'),'
      
        '      IF(re.dt_vencimento < DATE(CURRENT_DATE()), '#39'/Vencimento I' +
        'nv'#225'lido'#39', '#39#39' )), 2, 250))'
      '     , '#39#39') as ds_criticas'#9' '
      'FROM'
      #9'rem_envios re'
      #9'INNER JOIN pessoas resp ON (resp.cd_pessoa = re.cd_resp)'
      
        #9'INNER JOIN (SELECT DISTINCT cd_layout, cd_ocorrencia, ds_ocorre' +
        'ncia FROM rem_ocorrencias) ro ON ('
      '      ro.cd_ocorrencia = re.cd_ocorrencia AND'
      '      ro.cd_layout = re.cd_layout'
      '  )'
      '  LEFT JOIN fin_boleto as b ON (b.cd_boleto = re.cd_boleto)'
      '  LEFT JOIN pessoas as al ON (al.cd_pessoa = b.cd_pessoa)'
      ''
      'WHERE'
      #9're.cd_layout = :cd_layout AND'
      #9're.sn_ignorado = 0 AND'
      #9're.cd_arquivo IS NULL AND'
      '  CASE WHEN LENGTH(:ds_filtro) > 0 THEN'
      '       ('
      '         re.nr_nossonumero LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '         resp.nm_pessoa LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '   al.nm_pessoa LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '         ro.ds_ocorrencia LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      
        '         DATE_FORMAT(re.dt_vencimento, '#39'%d/%m/%Y'#39') LIKE CONCAT('#39 +
        '%'#39',:ds_filtro,'#39'%'#39')'
      '       )'
      #9#9#9' ELSE 1 = 1 END'
      'ORDER BY'
      #9're.cd_envio ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_filtro'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_filtro'
        ParamType = ptUnknown
      end>
    object qyFilaRemessacd_envio: TIntegerField
      FieldName = 'cd_envio'
    end
    object qyFilaRemessasn_selecao: TBooleanField
      Tag = 1
      DisplayLabel = 'Selecione'
      FieldKind = fkCalculated
      FieldName = 'sn_selecao'
      Calculated = True
    end
    object qyFilaRemessanr_nossonumero: TStringField
      FieldName = 'nr_nossonumero'
      Size = 30
    end
    object qyFilaRemessanm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyFilaRemessadt_vencimento: TDateTimeField
      FieldName = 'dt_vencimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!00/00/0000;1;_'
    end
    object qyFilaRemessavl_nominal: TFloatField
      FieldName = 'vl_nominal'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qyFilaRemessavl_desconto: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = '###,###,##0.00'
    end
    object qyFilaRemessads_ocorrencia: TStringField
      FieldName = 'ds_ocorrencia'
      Size = 255
    end
    object qyFilaRemessadt_inclusao: TDateTimeField
      FieldName = 'dt_inclusao'
      DisplayFormat = 'dd/mm/yyyy hh:MM:ss'
      EditMask = '!00/00/0000 00:00:00;1;_'
    end
    object qyFilaRemessanm_aluno: TStringField
      DisplayLabel = 'Estudante'
      FieldName = 'nm_aluno'
      Size = 60
    end
    object qyFilaRemessads_criticas: TStringField
      DisplayLabel = 'Cr'#237'ticas'
      FieldName = 'ds_criticas'
      Size = 250
    end
  end
  object dsFilaRemessa: TDataSource
    DataSet = qyFilaRemessa
    Left = 672
    Top = 208
  end
  object qyLayouts: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_layout,'
      '  cd_caixa,'
      '  nm_layout,'
      '  nr_remessa,'
      '  cd_origem'
      'FROM'
      '  rem_layouts'
      'WHERE'
      '  sn_ativo = 1 AND'
      '  cd_coligada = :cd_coligada AND'
      '  cd_origem IN (1,3) AND'
      '  sn_cobranca_bancaria = 1'
      'ORDER BY'
      '  nm_layout')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qyRemoverFila: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  rem_envios'
      'SET'
      '  sn_ignorado = 1,'
      '  dt_ignorado = NOW()'
      'WHERE'
      '  cd_envio IN (:cd_envios)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_envios'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_envios'
        ParamType = ptUnknown
      end>
  end
  object qryLayoutEspec: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   nr_inicio,'
      '   nr_tamanho,'
      '   ds_valor,'
      '   chr_fill'
      'FROM'
      '   rem_layout_espec'
      'WHERE'
      '   cd_layout =  :cd_layout AND'
      '   cd_tipo = :cd_tipo'
      'ORDER BY'
      '   nr_inicio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_LAYOUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_LAYOUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO'
        ParamType = ptUnknown
      end>
    object qryLayoutEspecnr_inicio: TIntegerField
      FieldName = 'nr_inicio'
    end
    object qryLayoutEspecnr_tamanho: TIntegerField
      FieldName = 'nr_tamanho'
    end
    object qryLayoutEspecds_valor: TMemoField
      FieldName = 'ds_valor'
      BlobType = ftMemo
    end
    object qryLayoutEspecchr_fill: TStringField
      FieldName = 'chr_fill'
      Size = 1
    end
  end
  object qryContatos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_pessoa,'
      '   cd_contato,'
      '   ds_contato'
      'FROM'
      '   contatos_pessoas'
      'WHERE'
      '   cd_pessoa = :cd_pessoa AND'
      '   cd_contato = :cd_contato'
      'ORDER BY'
      '   ds_contato')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTATO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   CD_PESSOA,'#13#10'   CD_CONTATO,'#13#10'   DS_CONTATO'#13#10'FR' +
        'OM'#13#10'   CONTATOS_PESSOAS'#13#10'WHERE'#13#10'   CD_PESSOA = :CD_PESSOA AND'#13#10' ' +
        '  CD_CONTATO = :CD_CONTATO'#13#10'ORDER BY'#13#10'   DS_CONTATO'#13#10'LIMIT 1'
      
        'oracle=SELECT                      '#13#10'   CD_PESSOA,'#13#10'   CD_CONTAT' +
        'O,'#13#10'   DS_CONTATO'#13#10'FROM'#13#10'   CONTATOS_PESSOAS'#13#10'WHERE'#13#10'   CD_PESSO' +
        'A = :CD_PESSOA AND'#13#10'   CD_CONTATO = :CD_CONTATO AND'#13#10'   ROWNUM <' +
        '= 1'#13#10'ORDER BY'#13#10'   DS_CONTATO')
    Left = 376
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CONTATO'
        ParamType = ptUnknown
      end>
    object qryContatoscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qryContatoscd_contato: TIntegerField
      FieldName = 'cd_contato'
    end
    object qryContatosds_contato: TStringField
      FieldName = 'ds_contato'
      Size = 100
    end
  end
  object dsArquivos: TDataSource
    DataSet = qyArquivos
    Left = 672
    Top = 240
  end
  object qyArquivos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  ra.cd_arquivo,'
      '  ra.dt_exportacao,'
      '  ra.nm_arquivo,'
      '  ra.ds_situacao,'
      
        '  CASE WHEN ra.ds_situacao = '#39'A'#39' THEN '#39'Aguardando envio ao banco' +
        #39
      
        '       WHEN ra.ds_situacao = '#39'U'#39' THEN '#39'Envio confirmado pelo usu' +
        #225'rio'#39
      '       WHEN ra.ds_situacao = '#39'R'#39' THEN '#39'Confirmado pelo retorno'#39
      '       ELSE '#39#39
      '  END ds_situacao_completa,     '
      #9'COUNT(DISTINCT re.nr_nossonumero) nr_boletos'
      'FROM'
      #9'rem_arquivos ra'
      '  INNER JOIN rem_envios re ON (re.cd_arquivo = ra.cd_arquivo)'
      'WHERE'
      '  re.cd_layout = :cd_layout AND'
      '  ra.dt_exportacao BETWEEN :dt_inicio AND :dt_fim AND'
      '  ra.sn_ignorado = 0'
      'GROUP BY'
      #9'ra.cd_arquivo'
      'ORDER BY'
      '  ra.dt_exportacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_fim'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_fim'
        ParamType = ptUnknown
      end>
    object qyArquivoscd_arquivo: TIntegerField
      FieldName = 'cd_arquivo'
    end
    object qyArquivosdt_exportacao: TDateTimeField
      FieldName = 'dt_exportacao'
      DisplayFormat = 'dd/mm/yyyy hh:MM:ss'
      EditMask = '!00/00/0000 00:00:00;1;_'
    end
    object qyArquivosnm_arquivo: TStringField
      FieldName = 'nm_arquivo'
      Size = 255
    end
    object qyArquivosds_situacao_completa: TStringField
      FieldName = 'ds_situacao_completa'
      Size = 255
    end
    object qyArquivosds_situacao: TStringField
      FieldName = 'ds_situacao'
      Size = 3
    end
    object qyArquivosnr_boletos: TLargeintField
      FieldName = 'nr_boletos'
    end
  end
  object dsConteudoArquivo: TDataSource
    DataSet = qyConteudoArquivo
    Left = 672
    Top = 272
  end
  object qyConteudoArquivo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  re.cd_envio,'
      '  re.nr_nossonumero, '
      #9'resp.nm_pessoa,'
      #9're.dt_vencimento,'
      #9're.vl_nominal,'
      #9're.vl_desconto,'
      #9'ro.ds_ocorrencia,'
      #9're.dt_inclusao,'
      #9'al.nm_pessoa as nm_aluno,'
      '  CASE WHEN rs.ds_situacao = '#39'F'#39' THEN '#39'Fila'#39
      '       WHEN rs.ds_situacao = '#39'J'#39' THEN '#39'Rejeitado'#39
      '       WHEN rs.ds_situacao = '#39'E'#39' THEN '#39'Exportado'#39
      '       WHEN rs.ds_situacao = '#39'R'#39' THEN '#39'Registrado'#39
      '       WHEN rs.ds_situacao = '#39'B'#39' THEN '#39'Baixado'#39
      '       WHEN rs.ds_situacao = '#39'S'#39' THEN '#39'Liquidado sem registro'#39
      '       ELSE '#39#39
      '  END ds_status'
      'FROM'
      #9'rem_envios re'
      
        '  INNER JOIN rem_status rs ON (rs.nr_nossonumero = re.nr_nossonu' +
        'mero)'
      #9'INNER JOIN pessoas resp ON (resp.cd_pessoa = re.cd_resp)'
      
        #9'INNER JOIN (SELECT DISTINCT cd_layout, cd_ocorrencia, ds_ocorre' +
        'ncia FROM rem_ocorrencias) ro ON ('
      '      ro.cd_ocorrencia = re.cd_ocorrencia AND'
      '      ro.cd_layout = re.cd_layout'
      '  )'
      '  LEFT JOIN fin_boleto as b ON (b.cd_boleto = re.cd_boleto)'
      '  LEFT JOIN pessoas as al ON (al.cd_pessoa = b.cd_pessoa)'
      'WHERE'
      #9're.cd_layout = :cd_layout AND'
      #9're.cd_arquivo = :cd_arquivo AND'
      #9're.sn_ignorado = 0 AND'
      '  CASE WHEN LENGTH(:ds_filtro) > 0 THEN'
      '       ('
      '         re.nr_nossonumero LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '         resp.nm_pessoa LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '         ro.ds_ocorrencia LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      
        '         DATE_FORMAT(re.dt_vencimento, '#39'%d/%m/%Y'#39') LIKE CONCAT('#39 +
        '%'#39',:ds_filtro,'#39'%'#39')'
      '       )'
      #9#9#9' ELSE 1 = 1 END'
      'ORDER BY'
      #9're.cd_envio ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_arquivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_filtro'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_arquivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_filtro'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'nr_nossonumero'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'dt_vencimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!00/00/0000;1;_'
    end
    object FloatField1: TFloatField
      FieldName = 'vl_nominal'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = '###,###,##0.00'
    end
    object StringField3: TStringField
      FieldName = 'ds_ocorrencia'
      Size = 255
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'dt_inclusao'
      DisplayFormat = 'dd/mm/yyyy hh:MM:ss'
      EditMask = '!00/00/0000 00:00:00;1;_'
    end
    object qyConteudoArquivods_situacao: TStringField
      FieldName = 'ds_status'
      Size = 255
    end
    object qyConteudoArquivonm_aluno: TStringField
      DisplayLabel = 'Estudante'
      FieldName = 'nm_aluno'
      Size = 60
    end
    object qyConteudoArquivocd_envio: TIntegerField
      FieldName = 'cd_envio'
      Required = True
    end
  end
  object sdArquivoRemessa: TSaveDialog
    DefaultExt = 'REM'
    Filter = 'Arquivos de remessa|*.REM'
    Title = 'Baixar arquivo de remessa'
    Left = 416
    Top = 424
  end
  object sdlgRemessa: TSaveDialog
    DefaultExt = '.rem'
    Filter = 'Arquivos de remessa|*.rem|Arquivos de texto|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofCreatePrompt, ofEnableSizing]
    Left = 104
    Top = 280
  end
  object qyTemCriticas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  '#9'IF( MAX(IF(re.cd_ocorrencia = 1, '
      #9'  TRIM(MID(CONCAT('
      #9'  IF(resp.tp_pessoa = '#39'J'#39
      
        #9'     , IF(LPAD(IFNULL(resp.ds_cnpj, '#39#39'), 14, '#39'0'#39') = '#39'0000000000' +
        '0000'#39', '#39'/CNPJ Inv'#225'lido'#39', '#39#39')'
      
        #9'     , IF(LPAD(IFNULL(resp.ds_cpf, '#39#39'), 11, '#39'0'#39') = '#39'00000000000' +
        #39', '#39'/CPF Inv'#225'lido'#39', '#39#39')'
      #9'  ) , '
      
        #9'  IF(LPAD(IFNULL(resp.ds_cep, '#39#39'), 8, '#39'0'#39') = '#39'00000000'#39', '#39'/CEP ' +
        'Inv'#225'lido'#39', '#39#39'), '
      
        #9'  IF(TRIM(IFNULL(resp.ds_logradouro, '#39#39')) = '#39#39', '#39'/Endere'#231'o Inv'#225 +
        'lido'#39', '#39#39'),'
      
        #9'  IF(TRIM(IFNULL(resp.ds_bairro, '#39#39')) = '#39#39', '#39'/Bairro Inv'#225'lido'#39',' +
        ' '#39#39'), '
      
        #9'  IF(TRIM(IFNULL(resp.ds_cidade, '#39#39')) = '#39#39', '#39'/Cidade Inv'#225'lida'#39' ' +
        ', '#39#39'), '
      
        '      IF(TRIM(IFNULL(resp.ds_estado, '#39#39')) = '#39#39', '#39'/Estado Inv'#225'lid' +
        'o'#39', '#39#39'),'
      
        '      IF(re.dt_vencimento < DATE(CURRENT_DATE()), '#39'/Vencimento I' +
        'nv'#225'lido'#39', '#39#39' )), 2, 250))'
      '     , '#39#39')) <> '#39#39', 1, 0) as sn_criticas'#9' '
      'FROM'
      #9'rem_envios re'
      #9'INNER JOIN pessoas resp ON (resp.cd_pessoa = re.cd_resp)'
      
        #9'INNER JOIN (SELECT DISTINCT cd_layout, cd_ocorrencia, ds_ocorre' +
        'ncia FROM rem_ocorrencias) ro ON ('
      '      ro.cd_ocorrencia = re.cd_ocorrencia AND'
      '      ro.cd_layout = re.cd_layout'
      '  )'
      '  LEFT JOIN fin_boleto as b ON (b.cd_boleto = re.cd_boleto)'
      '  LEFT JOIN pessoas as al ON (al.cd_pessoa = b.cd_pessoa)'
      'WHERE'
      #9're.cd_layout = :cd_layout AND'
      #9're.sn_ignorado = 0 AND'
      #9're.cd_arquivo IS NULL AND'
      '  CASE WHEN LENGTH(:ds_filtro) > 0 THEN'
      '       ('
      '         re.nr_nossonumero LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '         resp.nm_pessoa LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '   al.nm_pessoa LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      '         ro.ds_ocorrencia LIKE CONCAT('#39'%'#39',:ds_filtro,'#39'%'#39') OR'
      
        '         DATE_FORMAT(re.dt_vencimento, '#39'%d/%m/%Y'#39') LIKE CONCAT('#39 +
        '%'#39',:ds_filtro,'#39'%'#39')'
      '       )'
      #9#9#9' ELSE 1 = 1 END')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_filtro'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_layout'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_filtro'
        ParamType = ptUnknown
      end>
  end
end
