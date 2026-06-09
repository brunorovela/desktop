object FrmNF: TFrmNF
  Left = 0
  Top = 0
  Caption = 'Controle de Notas Fiscais'
  ClientHeight = 491
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 29
    Width = 847
    Height = 12
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 784
  end
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CONTROLE DE NOTAS FISCAIS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pcNotas: TPageControl
    Left = 0
    Top = 41
    Width = 847
    Height = 450
    ActivePage = tsNovaNota
    Align = alClient
    TabOrder = 1
    OnChange = pcNotasChange
    OnChanging = pcNotasChanging
    object tsNotasEmitidas: TTabSheet
      Caption = 'Rela'#231#227'o de Notas Fiscais'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Splitter1: TSplitter
        Left = 313
        Top = 0
        Height = 382
        ExplicitHeight = 379
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 313
        Height = 382
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 313
          Height = 25
          Align = alTop
          Caption = 'NOTAS FISCAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdNotas: TDBGrid
          Left = 0
          Top = 25
          Width = 313
          Height = 357
          Align = alClient
          DataSource = dsNotas
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'nr_nf'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_nf'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_bruto'
              Title.Caption = 'VL.BRUTO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sn_cancelada'
              Width = 30
              Visible = True
            end>
        end
      end
      object Panel2: TPanel
        Left = 316
        Top = 0
        Width = 523
        Height = 382
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 523
          Height = 25
          Align = alTop
          Caption = 'ITENS DA NOTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdItens: TDBGrid
          Left = 0
          Top = 25
          Width = 523
          Height = 357
          Align = alClient
          DataSource = dsItens
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'codigoaluno'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'parcela'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'datavencimento'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'turma'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorbruto'
              Width = 80
              Visible = True
            end>
        end
      end
      object toolPessoa: TToolBar
        Left = 0
        Top = 382
        Width = 839
        Height = 40
        Align = alBottom
        AutoSize = True
        ButtonHeight = 36
        ButtonWidth = 75
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        ShowCaptions = True
        TabOrder = 2
        object ToolButton2: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object sbSelecionaColuna1: TSpeedButton
          Left = 8
          Top = 0
          Width = 30
          Height = 36
          Hint = 'Selecionar Colunas das Notas'
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
          OnClick = sbSelecionaColuna1Click
        end
        object sbSelecionarColuna: TSpeedButton
          Left = 38
          Top = 0
          Width = 30
          Height = 36
          Hint = 'Selecionar Colunas dos itens da nota'
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
        object ToolButton7: TToolButton
          Left = 68
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object Panel5: TPanel
          Left = 76
          Top = 0
          Width = 463
          Height = 36
          TabOrder = 0
          object Label9: TLabel
            Left = 140
            Top = 10
            Width = 21
            Height = 13
            Caption = 'At'#233':'
          end
          object Label10: TLabel
            Left = 358
            Top = 10
            Width = 21
            Height = 13
            Caption = 'At'#233':'
          end
          object btnPlay: TSpeedButton
            Left = 430
            Top = 5
            Width = 26
            Height = 22
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF004B4B4B004B4B4B00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000000DF000000BF2A004B4B4B00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000000DF000000DF000000BF2A004B4B4B00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000000DF000000DF000000DF000000BF2A004B4B
              4B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000000DF000000FF090000DF000000DF000000BF
              2A004B4B4B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000000FF2A0000DF000000FF090000DF000000DF
              000000BF2A004B4B4B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000055FF000000FF2A0000DF000000FF090000DF
              000000DF000000BF2A004B4B4B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000055FFAA0000FF090000FF2A0000DF000000FF
              090000DF000000DF0000007F0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F000055FFAA0000FF090000FF090000FF2A0000DF
              000055FFAA00007F0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F0000AAFF2A0000FF090000FF090000FF090000FF
              2A00007F0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F0000AAFF2A0000FF090000FF0900AAFF2A00007F
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F0000AAFFAA0000FF0900AAFF2A00007F0000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F0000AAFFAA00AAFFAA00007F0000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00007F0000AAFFAA00007F0000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00007F0000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            OnClick = btnPlayClick
          end
          object ckbData: TCheckBox
            Left = 1
            Top = 10
            Width = 59
            Height = 17
            Caption = 'Data:'
            TabOrder = 0
            OnClick = ckbDataClick
          end
          object ckbNF: TCheckBox
            Left = 265
            Top = 10
            Width = 43
            Height = 17
            Caption = 'NF:'
            TabOrder = 1
            OnClick = ckbNFClick
          end
          object txtNFInicio: TEdit
            Left = 306
            Top = 6
            Width = 45
            Height = 21
            TabOrder = 2
          end
          object txtNFFim: TEdit
            Left = 383
            Top = 6
            Width = 45
            Height = 21
            TabOrder = 3
          end
          object umdtInicio: TUMDateTimePicker
            Left = 51
            Top = 7
            Width = 85
            Height = 21
            BevelOuter = bvNone
            TabOrder = 4
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
            Date = 42256.000000000000000000
          end
          object umdtFim: TUMDateTimePicker
            Left = 167
            Top = 7
            Width = 85
            Height = 21
            BevelOuter = bvNone
            TabOrder = 5
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
            Date = 42256.000000000000000000
          end
        end
        object ToolButton6: TToolButton
          Left = 539
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object btnNova: TToolButton
          Left = 547
          Top = 0
          AutoSize = True
          Caption = 'F2 Gerar Nota'
          ImageIndex = 0
          OnClick = btnNovaClick
        end
        object btnCancelar: TToolButton
          Left = 626
          Top = 0
          Caption = 'F6 Cancelar'
          ImageIndex = 2
          OnClick = btnCancelarClick
        end
        object btnImprimir: TToolButton
          Left = 701
          Top = 0
          AutoSize = True
          Caption = 'F7 Imprimir'
          ImageIndex = 6
          OnClick = btnImprimirClick
        end
        object ToolButton1: TToolButton
          Left = 765
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object btnFechar: TToolButton
          Left = 773
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 8
          OnClick = btnFecharClick
        end
      end
    end
    object tsNovaNota: TTabSheet
      Caption = 'Gerar Novas Notas'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 839
        Height = 9
        Align = alTop
        Shape = bsSpacer
        ExplicitWidth = 776
      end
      object Bevel3: TBevel
        Left = 0
        Top = 50
        Width = 839
        Height = 9
        Align = alTop
        Shape = bsSpacer
        ExplicitWidth = 776
      end
      object Bevel4: TBevel
        Left = 0
        Top = 295
        Width = 839
        Height = 3
        Align = alTop
        Shape = bsSpacer
        ExplicitTop = 293
      end
      object Bevel5: TBevel
        Left = 0
        Top = 394
        Width = 839
        Height = 3
        Align = alBottom
        Shape = bsSpacer
        ExplicitTop = 388
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 397
        Width = 839
        Height = 25
        Align = alBottom
        ButtonWidth = 100
        Caption = 'toolPessoa'
        EdgeBorders = [ebTop, ebBottom]
        Images = ImageList2
        List = True
        ShowCaptions = True
        TabOrder = 2
        object btnFiltrar: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = 'Atualizar Filtro'
          ImageIndex = 5
          OnClick = btnFiltrarClick
        end
        object ToolButton4: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object btnGerarNota: TToolButton
          Left = 108
          Top = 0
          AutoSize = True
          Caption = 'F2 Gerar Notas'
          ImageIndex = 0
          OnClick = btnGerarNotaClick
        end
        object ToolButton3: TToolButton
          Left = 212
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 220
          Top = 0
          AutoSize = True
          Caption = 'F12 Fechar'
          ImageIndex = 8
          OnClick = ToolButton5Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 59
        Width = 839
        Height = 236
        Align = alTop
        Caption = '  Incluir os seguintes t'#237'tulos:   '
        TabOrder = 0
        object Label1: TLabel
          Left = 267
          Top = 140
          Width = 21
          Height = 13
          Caption = 'At'#233':'
        end
        object Label2: TLabel
          Left = 267
          Top = 163
          Width = 21
          Height = 13
          Caption = 'At'#233':'
        end
        object Label3: TLabel
          Left = 267
          Top = 186
          Width = 21
          Height = 13
          Caption = 'At'#233':'
        end
        object btnDepartamento: TSpeedButton
          Left = 404
          Top = 43
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
          OnClick = btnDepartamentoClick
        end
        object btnCurso: TSpeedButton
          Left = 404
          Top = 66
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
          OnClick = btnCursoClick
        end
        object btnTurma: TSpeedButton
          Left = 404
          Top = 89
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
          OnClick = btnTurmaClick
        end
        object btnPessoa: TSpeedButton
          Left = 404
          Top = 112
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
          OnClick = btnPessoaClick
        end
        object Label11: TLabel
          Left = 457
          Top = 24
          Width = 168
          Height = 13
          Caption = 'Incluir os seguintes Tipos de T'#237'tulo:'
        end
        object sbMarcar: TSpeedButton
          Left = 702
          Top = 19
          Width = 25
          Height = 22
          Hint = 'Selecionar Parcelas'
          Flat = True
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
          OnClick = sbMarcarClick
        end
        object sbDesmarcar: TSpeedButton
          Left = 727
          Top = 19
          Width = 25
          Height = 22
          Hint = 'Desmarcar parcelas selecionadas'
          Flat = True
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
          OnClick = sbDesmarcarClick
        end
        object Label12: TLabel
          Left = 267
          Top = 209
          Width = 21
          Height = 13
          Caption = 'At'#233':'
        end
        object ckbAnoSemestre: TCheckBox
          Left = 16
          Top = 23
          Width = 145
          Height = 17
          Caption = 'Ano/Semestre:'
          TabOrder = 0
          OnClick = ckbAnoSemestreClick
        end
        object ckbDepartamento: TCheckBox
          Left = 16
          Top = 47
          Width = 145
          Height = 17
          Caption = 'Departamento:'
          TabOrder = 1
          OnClick = ckbDepartamentoClick
        end
        object ckbCurso: TCheckBox
          Left = 16
          Top = 70
          Width = 145
          Height = 17
          Caption = 'Curso:'
          TabOrder = 2
          OnClick = ckbCursoClick
        end
        object ckbTurma: TCheckBox
          Left = 16
          Top = 93
          Width = 145
          Height = 17
          Caption = 'Turma:'
          TabOrder = 3
          OnClick = ckbTurmaClick
        end
        object ckbPessoa: TCheckBox
          Left = 16
          Top = 116
          Width = 145
          Height = 17
          Caption = 'Pessoa:'
          TabOrder = 4
          OnClick = ckbPessoaClick
        end
        object ckbVencimento: TCheckBox
          Left = 16
          Top = 162
          Width = 145
          Height = 17
          Caption = 'Data de Vencimento:'
          TabOrder = 6
          OnClick = ckbVencimentoClick
        end
        object ckbPagamento: TCheckBox
          Left = 16
          Top = 185
          Width = 145
          Height = 17
          Caption = 'Data de Pagamento:'
          TabOrder = 7
          OnClick = ckbPagamentoClick
        end
        object ckbParcela: TCheckBox
          Left = 16
          Top = 139
          Width = 145
          Height = 17
          Caption = 'N'#250'mero de Parcela:'
          TabOrder = 5
          OnClick = ckbParcelaClick
        end
        object txtDepartamento: TEdit
          Left = 147
          Top = 45
          Width = 257
          Height = 21
          ReadOnly = True
          TabOrder = 9
        end
        object txtCurso: TEdit
          Left = 147
          Top = 68
          Width = 257
          Height = 21
          ReadOnly = True
          TabOrder = 10
        end
        object txtTurma: TEdit
          Left = 147
          Top = 91
          Width = 257
          Height = 21
          ReadOnly = True
          TabOrder = 11
        end
        object txtPessoa: TEdit
          Left = 147
          Top = 114
          Width = 257
          Height = 21
          ReadOnly = True
          TabOrder = 12
        end
        object txtParcelaInicio: TEdit
          Left = 147
          Top = 137
          Width = 106
          Height = 21
          TabOrder = 13
        end
        object txtParcelaFim: TEdit
          Left = 298
          Top = 137
          Width = 106
          Height = 21
          TabOrder = 14
        end
        object txtAnoSemestre: TMaskEdit
          Left = 147
          Top = 21
          Width = 59
          Height = 22
          EditMask = '9999/9;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 8
          Text = '20051'
        end
        object UpDown1: TUpDown
          Left = 206
          Top = 21
          Width = 16
          Height = 24
          Min = -100
          TabOrder = 15
          OnClick = UpDown1Click
        end
        object cklbTitulos: TCheckListBox
          Left = 457
          Top = 43
          Width = 296
          Height = 162
          ItemHeight = 13
          TabOrder = 16
        end
        object ckCompetencia: TCheckBox
          Left = 16
          Top = 208
          Width = 125
          Height = 17
          Caption = 'Data de Compet'#234'ncia:'
          TabOrder = 17
          OnClick = ckCompetenciaClick
        end
        object umdtVencimentoInicio: TUMDateTimePicker
          Left = 147
          Top = 158
          Width = 106
          Height = 21
          BevelOuter = bvNone
          TabOrder = 18
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
          Date = 42256.000000000000000000
        end
        object umdtVencimentoFim: TUMDateTimePicker
          Left = 298
          Top = 158
          Width = 106
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
          Date = 42256.000000000000000000
        end
        object umdtPagamentoInicio: TUMDateTimePicker
          Left = 147
          Top = 181
          Width = 106
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
          Date = 42256.000000000000000000
        end
        object umdtPagamentoFim: TUMDateTimePicker
          Left = 298
          Top = 181
          Width = 106
          Height = 21
          BevelOuter = bvNone
          TabOrder = 21
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
          Date = 42256.000000000000000000
        end
        object umdtCompetenciaInicio: TUMDateTimePicker
          Left = 147
          Top = 203
          Width = 106
          Height = 21
          BevelOuter = bvNone
          TabOrder = 22
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
          Date = 42256.000000000000000000
        end
        object umdtCompetenciaFim: TUMDateTimePicker
          Left = 298
          Top = 203
          Width = 106
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
          Date = 42256.000000000000000000
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 298
        Width = 839
        Height = 96
        Align = alClient
        Caption = '  Resumo:  '
        TabOrder = 1
        object Label4: TLabel
          Left = 16
          Top = 24
          Width = 173
          Height = 13
          Caption = 'N'#250'mero de Notas que s'#227'o geradas: '
        end
        object Label5: TLabel
          Left = 16
          Top = 46
          Width = 115
          Height = 13
          Caption = 'N'#250'mero total de T'#237'tulos:'
        end
        object Label6: TLabel
          Left = 360
          Top = 16
          Width = 82
          Height = 13
          Caption = 'Valor total Bruto:'
        end
        object Label7: TLabel
          Left = 360
          Top = 39
          Width = 86
          Height = 13
          Caption = 'Valor total Bolsas:'
        end
        object Label8: TLabel
          Left = 360
          Top = 62
          Width = 80
          Height = 13
          Caption = 'Valor total Pago:'
        end
        object txtNumeroNotas: TEdit
          Left = 195
          Top = 21
          Width = 82
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object txtTotalTitulos: TEdit
          Left = 195
          Top = 43
          Width = 82
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object txtTotalBruto: TEdit
          Left = 457
          Top = 13
          Width = 104
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object txtTotalBolsas: TEdit
          Left = 457
          Top = 36
          Width = 104
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object txtTotalPago: TEdit
          Left = 457
          Top = 59
          Width = 104
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 9
        Width = 839
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 153
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object RadioGroup1: TRadioGroup
            Left = 0
            Top = 0
            Width = 153
            Height = 41
            Align = alClient
            Caption = ' Notas Emitidas em: '
            TabOrder = 0
          end
          object umdtEmissao: TUMDateTimePicker
            Left = 10
            Top = 15
            Width = 90
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
            Date = 42256.000000000000000000
          end
        end
        object rgAgrupar: TRadioGroup
          Left = 153
          Top = 0
          Width = 686
          Height = 41
          Align = alClient
          Caption = '  Agrupar Notas Por:  '
          Columns = 5
          ItemIndex = 0
          Items.Strings = (
            'T'#237'tulo'
            'Pessoa'
            'Curso da Grade'
            'Turma'
            'Nota Fiscal')
          TabOrder = 1
        end
      end
    end
  end
  object ImageList2: TImageList
    Left = 656
    Top = 128
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
      840073737300737373000000000000000000000000007B7B7B000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      8400848484007373730000000000000000007B7B7B000000FF00000000000000
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
      00000000000000000000000000000000000000000000000000007B7B7B000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F700848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000FF000000000000000000000000000000000000000000000000000000
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
  object qyNotas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from fin_nf')
    Params = <>
    Left = 8
    Top = 128
    object qyNotasdt_nf: TDateTimeField
      Tag = 1
      DisplayLabel = 'DATA'
      DisplayWidth = 10
      FieldName = 'dt_nf'
      Origin = 'WMESTRE12.fin_nf.dt_nf'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyNotasvl_bruto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.BRUTO'
      FieldName = 'vl_bruto'
      Origin = 'WMESTRE12.fin_nf.vl_bruto'
      DisplayFormat = '###,###,##0.00'
    end
    object qyNotasvl_bolsas: TFloatField
      Tag = 1
      DisplayLabel = 'VL.BOLSAS'
      FieldName = 'vl_bolsas'
      Origin = 'WMESTRE12.fin_nf.vl_bolsas'
      DisplayFormat = '###,###,##0.00'
    end
    object qyNotasvl_pago: TFloatField
      Tag = 1
      DisplayLabel = 'VL.PAGO'
      FieldName = 'vl_pago'
      Origin = 'WMESTRE12.fin_nf.vl_pago'
      DisplayFormat = '###,###,##0.00'
    end
    object qyNotassn_cancelada: TSmallintField
      Tag = 1
      DisplayLabel = 'Canc.'
      DisplayWidth = 5
      FieldName = 'sn_cancelada'
      Origin = 'WMESTRE12.fin_nf.sn_cancelada'
      OnGetText = qyNotassn_canceladaGetText
    end
    object qyNotasgrupo_curso: TStringField
      Tag = 1
      DisplayLabel = 'Grupo Curso'
      DisplayWidth = 10
      FieldName = 'grupo_curso'
      Origin = 'WMESTRE12.fin_nf.grupo_curso'
      Size = 15
    end
    object qyNotasgrupo_turma: TStringField
      Tag = 1
      DisplayLabel = 'Grupo Turma'
      DisplayWidth = 50
      FieldName = 'grupo_turma'
      Origin = 'WMESTRE12.fin_nf.grupo_turma'
      Size = 50
    end
    object qyNotasfiltro_depto: TSmallintField
      Tag = 1
      DisplayLabel = 'Depto'
      DisplayWidth = 10
      FieldName = 'filtro_depto'
      Origin = 'WMESTRE12.fin_nf.filtro_depto'
    end
    object qyNotasfiltro_curso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      DisplayWidth = 10
      FieldName = 'filtro_curso'
      Origin = 'WMESTRE12.fin_nf.filtro_curso'
      Size = 15
    end
    object qyNotasfiltro_turma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'filtro_turma'
      Origin = 'WMESTRE12.fin_nf.filtro_turma'
      Size = 50
    end
    object qyNotasfiltro_vencimento_inicio: TDateTimeField
      Tag = 1
      DisplayLabel = 'Venc. Inicio'
      DisplayWidth = 10
      FieldName = 'filtro_vencimento_inicio'
      Origin = 'WMESTRE12.fin_nf.filtro_vencimento_inicio'
    end
    object qyNotasfiltro_vencimento_fim: TDateTimeField
      Tag = 1
      DisplayLabel = 'Vencimento Fim'
      FieldName = 'filtro_vencimento_fim'
      Origin = 'WMESTRE12.fin_nf.filtro_vencimento_fim'
    end
    object qyNotasfiltro_pagamento_inicio: TDateTimeField
      Tag = 1
      DisplayLabel = 'Pgto Inicio'
      DisplayWidth = 10
      FieldName = 'filtro_pagamento_inicio'
      Origin = 'WMESTRE12.fin_nf.filtro_pagamento_inicio'
    end
    object qyNotasfiltro_pagamento_fim: TDateTimeField
      Tag = 1
      DisplayLabel = 'Pgto Fim'
      DisplayWidth = 10
      FieldName = 'filtro_pagamento_fim'
      Origin = 'WMESTRE12.fin_nf.filtro_pagamento_fim'
    end
    object qyNotasfiltro_tipo_titulo: TStringField
      Tag = 1
      DisplayLabel = 'Tipos T'#237'tulos'
      DisplayWidth = 10
      FieldName = 'filtro_tipo_titulo'
      Origin = 'WMESTRE12.fin_nf.filtro_tipo_titulo'
      Size = 100
    end
    object qyNotasnr_nf: TLargeintField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'nr_nf'
      Required = True
    end
    object qyNotasgrupo_titulo: TLargeintField
      DisplayLabel = 'Grupo T'#237'tulo'
      FieldName = 'grupo_titulo'
    end
    object qyNotasgrupo_pessoa: TLargeintField
      DisplayLabel = 'Grupo Pessoa'
      FieldName = 'grupo_pessoa'
    end
    object qyNotasfiltro_anosemestre: TLargeintField
      DisplayLabel = 'Ano/Sem'
      FieldName = 'filtro_anosemestre'
    end
    object qyNotasfiltro_pessoa: TLargeintField
      DisplayLabel = 'Pessoa'
      FieldName = 'filtro_pessoa'
    end
    object qyNotasfiltro_parcela_fim: TLargeintField
      DisplayLabel = 'Parc. Fim'
      FieldName = 'filtro_parcela_fim'
    end
    object qyNotasfiltro_parcela_inicio: TLargeintField
      FieldName = 'filtro_parcela_inicio'
    end
  end
  object qyItens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select Mensalidades.*, Pessoas.nm_pessoa as NomeAluno, '
      
        'CAST(Mensalidades.cd_resp AS  CHAR) cd_resp_finan, Resp.nm_pesso' +
        'a as NomeResponsavel, fin_tipos_titulo.ds_tipo_titulo, fin_plano' +
        '_contas.ds_conta, fin_centro_custos.ds_centro, fin_bolsas_tipos.' +
        'ds_bolsa, fin_moedas.ds_sigla, moedas_pgto.ds_sigla MoedaPgto'
      'FROM Mensalidades '
      
        'INNER JOIN Pessoas ON (Mensalidades.CodigoAluno = Pessoas.cd_pes' +
        'soa ) LEFT JOIN pessoas Resp ON (Mensalidades.cd_resp = Resp.cd_' +
        'pessoa) '
      
        'INNER JOIN fin_moedas ON (Mensalidades.cd_moeda = fin_moedas.cd_' +
        'moeda)'
      
        'LEFT JOIN fin_tipos_titulo ON (Mensalidades.cd_tipo_titulo = fin' +
        '_tipos_titulo.cd_tipo_titulo AND Mensalidades.cd_coligada = fin_' +
        'tipos_titulo.cd_coligada)'
      
        'LEFT JOIN fin_plano_contas ON (Mensalidades.cd_plano_conta = fin' +
        '_plano_contas.cd_conta AND Mensalidades.cd_coligada = fin_plano_' +
        'contas.cd_coligada)'
      
        'LEFT JOIN fin_centro_custos ON (Mensalidades.cd_centro_custo = f' +
        'in_centro_custos.cd_centro AND Mensalidades.cd_coligada = fin_ce' +
        'ntro_custos.cd_coligada)'
      
        'LEFT JOIN fin_bolsas_tipos ON (Mensalidades.cd_bolsa = fin_bolsa' +
        's_tipos.cd_bolsa)'
      
        'LEFT JOIN fin_moedas moedas_pgto ON (Mensalidades.cd_moeda_pgto ' +
        '= moedas_pgto.cd_moeda)'
      ''
      'where Mensalidades.DataVencimento = :DataVencimento'
      '')
    Params = <
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end>
    object qyItensparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      DisplayWidth = 5
      FieldName = 'parcela'
    end
    object qyItensdatavencimento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'datavencimento'
    end
    object qyItensdt_competencia: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt.Compet'#234'ncia'
      DisplayWidth = 10
      FieldName = 'dt_competencia'
    end
    object qyItensturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 10
      FieldName = 'turma'
      Size = 50
    end
    object qyItensdataemissao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt.Emiss'#227'o'
      DisplayWidth = 10
      FieldName = 'dataemissao'
    end
    object qyItensnossonumero: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'mero'
      DisplayWidth = 10
      FieldName = 'nossonumero'
      Size = 30
    end
    object qyItensvalorbruto: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Bruto'
      FieldName = 'valorbruto'
      DisplayFormat = '###,###,##0.00'
    end
    object qyItenscd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
    end
    object qyItensvalordesconto: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Desconto'
      FieldName = 'valordesconto'
    end
    object qyItensdescontoextra: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Bolsa'
      FieldName = 'descontoextra'
    end
    object qyItensvalorextra: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Extra'
      FieldName = 'valorextra'
      DisplayFormat = '###,###,##0.00'
    end
    object qyItensvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '###,###,##0.00'
    end
    object qyItensvalorjuros: TFloatField
      FieldName = 'valorjuros'
      DisplayFormat = '###,###,##0.00'
    end
    object qyItensvalorjuros_fixo: TFloatField
      FieldName = 'valorjuros_fixo'
      DisplayFormat = '###,###,##0.00'
    end
    object qyItensvalorpago: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Pago'
      FieldName = 'valorpago'
      DisplayFormat = '###,###,##0.00'
    end
    object qyItensdatapagamento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt Pagamento'
      DisplayWidth = 10
      FieldName = 'datapagamento'
    end
    object qyItensdt_credito: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      DisplayWidth = 10
      FieldName = 'dt_credito'
    end
    object qyItensusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object qyItenssituacao: TSmallintField
      FieldName = 'situacao'
    end
    object qyItensbloqueto: TStringField
      FieldName = 'bloqueto'
      FixedChar = True
      Size = 1
    end
    object qyItensanosemestre: TSmallintField
      Tag = 1
      DisplayLabel = 'Ano/Sem'
      FieldName = 'anosemestre'
    end
    object qyItensdatabasecorrecao: TDateTimeField
      FieldName = 'databasecorrecao'
    end
    object qyItensindicecorrecao: TFloatField
      FieldName = 'indicecorrecao'
    end
    object qyItenscurso: TStringField
      Tag = 1
      DisplayLabel = 'Curso'
      FieldName = 'curso'
      Size = 15
    end
    object qyItensdepto: TSmallintField
      Tag = 1
      DisplayLabel = 'Depto'
      DisplayWidth = 5
      FieldName = 'depto'
    end
    object qyItensocorrencia_remessa: TSmallintField
      FieldName = 'ocorrencia_remessa'
    end
    object qyItenstipoparcela: TSmallintField
      FieldName = 'tipoparcela'
    end
    object qyItensocorrencia_retorno: TSmallintField
      FieldName = 'ocorrencia_retorno'
    end
    object qyItenssn_credito_parcela: TStringField
      FieldName = 'sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
    object qyItensnr_creditos: TFloatField
      FieldName = 'nr_creditos'
    end
    object qyItenscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object qyItensds_historico: TStringField
      FieldName = 'ds_historico'
      Size = 150
    end
    object qyItensvl_pago_moeda: TFloatField
      FieldName = 'vl_pago_moeda'
    end
    object qyItenscd_resp: TIntegerField
      FieldName = 'cd_resp'
    end
    object qyItenscd_bolsa: TIntegerField
      FieldName = 'cd_bolsa'
    end
    object qyItensvl_credito: TFloatField
      FieldName = 'vl_credito'
    end
    object qyItensNomeAluno: TStringField
      Tag = 1
      DisplayLabel = 'Nome Pessoa'
      DisplayWidth = 30
      FieldName = 'NomeAluno'
      Size = 60
    end
    object qyItensNomeResponsavel: TStringField
      Tag = 1
      DisplayLabel = 'Nome Respons'#225'vel'
      DisplayWidth = 30
      FieldName = 'NomeResponsavel'
      Size = 60
    end
    object qyItensds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object qyItensds_conta: TStringField
      FieldName = 'ds_conta'
      Size = 255
    end
    object qyItensds_centro: TStringField
      FieldName = 'ds_centro'
      Size = 255
    end
    object qyItensds_bolsa: TStringField
      FieldName = 'ds_bolsa'
      Size = 100
    end
    object qyItensds_sigla: TStringField
      FieldName = 'ds_sigla'
      Size = 30
    end
    object qyItensMoedaPgto: TStringField
      FieldName = 'MoedaPgto'
      Size = 30
    end
    object qyItenscd_resp_finan: TStringField
      FieldName = 'cd_resp_finan'
      Size = 11
    end
    object qyItenscd_mensalidade: TIntegerField
      DisplayLabel = 'C'#243'd.T'#237'tulo'
      FieldName = 'cd_mensalidade'
      Required = True
    end
    object qyItenscodigoaluno: TIntegerField
      DisplayLabel = 'C'#243'd.Pessoa'
      FieldName = 'codigoaluno'
    end
    object qyItenscd_usuario: TLargeintField
      FieldName = 'cd_usuario'
    end
    object qyItenscd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
    end
    object qyItenscd_centro_custo: TLargeintField
      FieldName = 'cd_centro_custo'
      Required = True
    end
    object qyItenscd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
      Required = True
    end
    object qyItenscd_boleto: TLargeintField
      FieldName = 'cd_boleto'
    end
    object qyItenscd_caixa: TIntegerField
      FieldName = 'cd_caixa'
    end
    object qyItenscd_moeda: TLargeintField
      FieldName = 'cd_moeda'
    end
    object qyItenscd_moeda_pgto: TLargeintField
      FieldName = 'cd_moeda_pgto'
    end
    object qyItenscd_recibo: TIntegerField
      FieldName = 'cd_recibo'
    end
    object qyItensNR_NF: TLargeintField
      Tag = 1
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NR_NF'
    end
  end
  object dsNotas: TDataSource
    AutoEdit = False
    DataSet = qyNotas
    OnDataChange = dsNotasDataChange
    Left = 40
    Top = 128
  end
  object dsItens: TDataSource
    AutoEdit = False
    DataSet = qyItens
    Left = 352
    Top = 128
  end
  object qyFiltroTitulos: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 496
    Top = 128
  end
  object popImprimir: TPopupMenu
    Left = 456
    Top = 176
    object NotaSelecionada1: TMenuItem
      Caption = 'Nota Selecionada'
      OnClick = NotaSelecionada1Click
    end
    object odasasnotasfiltradas1: TMenuItem
      Tag = 1
      Caption = 'Todas as notas filtradas'
      OnClick = NotaSelecionada1Click
    end
  end
end
