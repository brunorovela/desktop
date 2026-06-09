object frm_Retorno_Banco: Tfrm_Retorno_Banco
  Left = 221
  Top = 184
  Caption = 'Arquivo Retorno / Bancos'
  ClientHeight = 499
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 62
    Width = 793
    Height = 437
    Align = alClient
    TabOrder = 0
    object pnHistorico: TPanel
      Left = 288
      Top = 1
      Width = 504
      Height = 435
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 2
        Top = 2
        Width = 500
        Height = 431
        ActivePage = tsRetornos
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        OnChange = PageControl1Change
        object tsRetornos: TTabSheet
          Caption = 'Hist'#243'ricos de Retornos'
          object pgHistorico: TTabControl
            Left = 0
            Top = 0
            Width = 492
            Height = 399
            Align = alClient
            TabOrder = 0
            Tabs.Strings = (
              'Ultimos Retornos'
              'Todos os Retornos')
            TabIndex = 0
            OnChange = pgHistoricoChange
            object grd: TDBGrid
              Left = 4
              Top = 25
              Width = 484
              Height = 345
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtcRetorno
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = pmQtd
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
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
                  FieldName = 'Rejeitados'
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
            object Panel6: TPanel
              Left = 4
              Top = 370
              Width = 484
              Height = 25
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object ToolBar: TToolBar
                Left = 0
                Top = 3
                Width = 484
                Height = 22
                Align = alBottom
                ButtonWidth = 99
                Images = ImageList1
                List = True
                ShowCaptions = True
                TabOrder = 0
                object sbExcluir: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Excluir o hist'#243'rico de baixas'
                  AutoSize = True
                  Caption = 'F9 Excluir'
                  ImageIndex = 0
                  OnClick = sbExcluirClick
                end
                object ToolButton2: TToolButton
                  Left = 78
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton2'
                  ImageIndex = 1
                  Style = tbsSeparator
                end
                object ToolButton3: TToolButton
                  Left = 86
                  Top = 0
                  Hint = 'Imprimir todo o conte'#250'do do retorno'
                  AutoSize = True
                  Caption = 'Imprimir Tudo'
                  ImageIndex = 1
                  OnClick = ToolButton3Click
                end
                object ToolButton4: TToolButton
                  Left = 180
                  Top = 0
                  Hint = 'Imprimir somente as baixas do retorno'
                  AutoSize = True
                  Caption = 'Imprimir Baixas'
                  ImageIndex = 1
                  OnClick = ToolButton4Click
                end
                object ToolButton7: TToolButton
                  Left = 283
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton7'
                  ImageIndex = 4
                  Style = tbsSeparator
                end
                object ToolButton1: TToolButton
                  Left = 291
                  Top = 0
                  Hint = 'Imprimir recibos do retorno'
                  AutoSize = True
                  Caption = 'Recibos'
                  ImageIndex = 1
                  OnClick = ToolButton1Click
                end
                object ToolButton5: TToolButton
                  Left = 361
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton5'
                  ImageIndex = 3
                  Style = tbsSeparator
                end
                object ToolButton6: TToolButton
                  Left = 369
                  Top = 0
                  AutoSize = True
                  Caption = 'F12 Fechar'
                  ImageIndex = 2
                  OnClick = ToolButton6Click
                end
                object ToolButton9: TToolButton
                  Left = 455
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton9'
                  ImageIndex = 3
                  Style = tbsSeparator
                end
                object SpeedButton1: TSpeedButton
                  Left = 463
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
        object tsConteudo: TTabSheet
          Caption = 'Itens do Arquivo'
          ImageIndex = 1
          object tcItens: TTabControl
            Left = 0
            Top = 0
            Width = 492
            Height = 399
            Align = alClient
            TabOrder = 0
            Tabs.Strings = (
              'Todos os Itens'
              'OK')
            TabIndex = 0
            OnChange = tcItensChange
            object grdItens: TDBGrid
              Left = 4
              Top = 25
              Width = 484
              Height = 345
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtcItens
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = pmQtd
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnTitleClick = grdItensTitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Ocorrencia'
                  Width = 145
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ds_motivo'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NossoNumero'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Vencimento'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ValorTitulo'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataPagamento'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ValorPago'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'vl_tarifa'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CodigoAluno'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SequenciaNoArquivo'
                  Width = 50
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 4
              Top = 370
              Width = 484
              Height = 25
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object ToolBar1: TToolBar
                Left = 0
                Top = 3
                Width = 484
                Height = 22
                Align = alBottom
                ButtonWidth = 86
                Images = ImageList1
                List = True
                ShowCaptions = True
                TabOrder = 0
                object btBaixar: TToolButton
                  Left = 0
                  Top = 0
                  Caption = 'Baixar T'#237'tulo'
                  ImageIndex = 4
                  OnClick = btBaixarClick
                end
                object ToolButton8: TToolButton
                  Left = 86
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton8'
                  ImageIndex = 1
                  Style = tbsSeparator
                end
                object sbSelecionarColuna: TSpeedButton
                  Left = 94
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
                object ToolButton10: TToolButton
                  Left = 119
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton10'
                  ImageIndex = 2
                  Style = tbsSeparator
                end
                object btFechar: TToolButton
                  Left = 127
                  Top = 0
                  AutoSize = True
                  Caption = 'F12 Fechar'
                  ImageIndex = 2
                  OnClick = btFecharClick
                end
              end
            end
          end
        end
      end
    end
    object pnBaixa: TPanel
      Left = 1
      Top = 1
      Width = 287
      Height = 435
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object lbConta: TLabel
        Left = 10
        Top = 335
        Width = 31
        Height = 14
        Caption = 'Conta:'
      end
      object lbBanco: TLabel
        Left = 10
        Top = 315
        Width = 34
        Height = 14
        Caption = 'Banco:'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 240
        Width = 273
        Height = 57
        Style = bsRaised
      end
      object lblReg: TLabel
        Left = 18
        Top = 251
        Width = 49
        Height = 14
        Caption = 'Registros:'
      end
      object btnBaixar: TSpeedButton
        Left = 176
        Top = 56
        Width = 73
        Height = 22
        Caption = 'Baixar'
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
        OnClick = btnBaixarClick
      end
      object btnCodigoDepartamento: TSpeedButton
        Left = 249
        Top = 27
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
      object Label1: TLabel
        Left = 10
        Top = 11
        Width = 140
        Height = 14
        Caption = 'Selecione o Arquivo Retorno:'
      end
      object Bar: TProgressBar
        Left = 16
        Top = 272
        Width = 257
        Height = 16
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 8
        Top = 96
        Width = 273
        Height = 129
        TabOrder = 1
        object lblBaixados: TLabel
          Left = 16
          Top = 37
          Width = 48
          Height = 14
          Caption = 'Baixados:'
        end
        object lblRejeitados: TLabel
          Left = 16
          Top = 80
          Width = 160
          Height = 14
          Caption = 'Rejeitados (N.N. n'#227'o encontrado)'
        end
        object lblRegistros: TLabel
          Left = 16
          Top = 16
          Width = 49
          Height = 14
          Caption = 'Registros:'
        end
        object lblOutras: TLabel
          Left = 16
          Top = 59
          Width = 96
          Height = 14
          Caption = 'Outras Ocorr'#234'ncias'
        end
      end
      object txtArquivo: TEdit
        Left = 8
        Top = 28
        Width = 241
        Height = 22
        TabOrder = 2
        OnKeyPress = txtArquivoKeyPress
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 11
      Top = 34
      Width = 92
      Height = 14
      Caption = 'Unidade de Ensino:'
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 793
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
      TabOrder = 0
    end
    object cbColigadas: TUMComboBox
      Left = 109
      Top = 31
      Width = 267
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 1
      OnChange = cbColigadasChange
      OnCloseUp = cbColigadasCloseUp
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'Arquivos de Retorno|*.ret;*.txt|Arquivos CSV|*.csv|Todos os Arqu' +
      'ivos *.*|*.*'
    Left = 320
    Top = 184
  end
  object dtcRetorno: TDataSource
    DataSet = tblRetorno
    Left = 400
    Top = 272
  end
  object dtcItens: TDataSource
    AutoEdit = False
    DataSet = tblItens
    OnDataChange = dtcItensDataChange
    Left = 368
    Top = 272
  end
  object qryDelete: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from [ListaCobranca]'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Parcela = :Parcela and'
      'DataVencimento = :DataVencimento and'
      'Turma = :Turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
  end
  object tblRetorno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      '   c.*,retorno.*, fcc.ds_caixa'
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
    Left = 400
    Top = 240
    ParamData = <
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptUnknown
      end>
    object tblRetornoDataRetorno: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data'
      FieldName = 'DataRetorno'
      Origin = 'Retorno.DataRetorno'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblRetornoBaixados: TSmallintField
      Tag = 1
      FieldName = 'Baixados'
      Origin = 'Retorno.Baixados'
    end
    object tblRetornoRejeitados: TSmallintField
      Tag = 1
      FieldName = 'Rejeitados'
      Origin = 'Retorno.Rejeitados'
    end
    object tblRetornoNomeArquivo: TStringField
      Tag = 1
      DisplayLabel = 'Arquivo'
      DisplayWidth = 50
      FieldName = 'NomeArquivo'
      Origin = 'Retorno.NomeArquivo'
      Size = 255
    end
    object tblRetornooutras_ocorrencias: TSmallintField
      Tag = 1
      DisplayLabel = 'Outras'
      FieldName = 'outras_ocorrencias'
      Origin = 'WMESTRE12.retorno.outras_ocorrencias'
    end
    object tblRetornocd_banco: TStringField
      FieldName = 'cd_banco'
      Origin = 'WMESTRE12.retorno.cd_banco'
      FixedChar = True
      Size = 3
    end
    object tblRetornocodigo: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object tblRetornousuario: TIntegerField
      FieldName = 'usuario'
    end
    object tblRetornonm_coligada: TStringField
      Tag = 1
      DisplayLabel = 'Unidade de ensino'
      FieldName = 'nm_coligada'
      Size = 50
    end
    object tblRetornocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object tblRetornods_caixa: TStringField
      Tag = 1
      DisplayLabel = 'Caixa'
      FieldName = 'ds_caixa'
      Required = True
      Size = 70
    end
  end
  object tblItens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  i.*,'
      '  c.sn_baixar,'
      '  m.turma,'
      '  m.ds_historico,'
      '  m.valorbruto,'
      '  m.valordesconto,'
      '  m.descontoextra,'
      '  m.valorextra,'
      '  p.nm_pessoa,'
      '  p.ds_cpf,'
      '  b.ds_motivo,'
      '  resp.nm_pessoa AS responsavel'
      'FROM'
      '  itensretorno i'
      '  INNER JOIN retorno r ON (i.codigoretorno = r.codigo)'
      
        '  LEFT JOIN mensalidades m ON (i.cd_mensalidade = m.cd_mensalida' +
        'de AND i.codigoaluno = m.codigoaluno)'
      '  LEFT JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)'
      '  LEFT JOIN pessoas resp ON(m.cd_resp = resp.cd_pessoa)'
      
        '  LEFT JOIN banco_codigo_retorno c ON (c.cd_retorno = i.cd_ocorr' +
        'encia and c.cd_banco = r.cd_banco)'
      
        '  LEFT JOIN banco_retorno_motivos b ON (b.cd_banco = r.cd_banco ' +
        'AND b.cd_motivo = i.cd_motivo AND c.cd_grupo_motivos = b.cd_grup' +
        'o_motivos)'
      'WHERE'
      '  codigoretorno = :codigoretorno'
      'ORDER BY'
      '  i.sequencianoarquivo')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoretorno'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoretorno'
        ParamType = ptUnknown
      end>
    object tblItensCodigoRetorno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Ret.'
      DisplayWidth = 6
      FieldName = 'CodigoRetorno'
      Origin = 'ItensRetorno.CodigoRetorno'
    end
    object tblItensSequencia: TIntegerField
      Tag = 1
      DisplayLabel = 'Seq.'
      DisplayWidth = 6
      FieldName = 'Sequencia'
      Origin = 'ItensRetorno.Sequencia'
    end
    object tblItensOcorrencia: TStringField
      Tag = 1
      DisplayLabel = 'Ocorr'#234'ncia'
      DisplayWidth = 30
      FieldName = 'Ocorrencia'
      Origin = 'ItensRetorno.Ocorrencia'
      Size = 50
    end
    object tblItensVencimento: TDateTimeField
      Tag = 1
      Alignment = taCenter
      DisplayWidth = 10
      FieldName = 'Vencimento'
      Origin = 'ItensRetorno.Vencimento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblItensValorTitulo: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. T'#237'tulo'
      FieldName = 'ValorTitulo'
      Origin = 'ItensRetorno.ValorTitulo'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensNossoNumero: TStringField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'Nosso N'#250'mero'
      DisplayWidth = 30
      FieldName = 'NossoNumero'
      Origin = 'ItensRetorno.NossoNumero'
      Size = 30
    end
    object tblItensValorAcrescimo: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.Acr'#233'scimo'
      FieldName = 'ValorAcrescimo'
      Origin = 'ItensRetorno.ValorAcrescimo'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensValorPago: TFloatField
      Tag = 1
      DisplayLabel = 'Vl.Pago'
      FieldName = 'ValorPago'
      Origin = 'ItensRetorno.ValorPago'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensCodigoAluno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd.Aluno'
      FieldName = 'CodigoAluno'
      Origin = 'ItensRetorno.CodigoAluno'
      DisplayFormat = '00000000'
    end
    object tblItensParcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      DisplayWidth = 5
      FieldName = 'Parcela'
      Origin = 'ItensRetorno.Parcela'
    end
    object tblItensSequenciaNoArquivo: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'SequenciaNoArquivo'
      Origin = 'ItensRetorno.SequenciaNoArquivo'
    end
    object tblItensDataPagamento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt.Pagto'
      DisplayWidth = 10
      FieldName = 'DataPagamento'
      Origin = 'ItensRetorno.DataPagamento'
    end
    object tblItenscd_mensalidade: TLargeintField
      Tag = 1
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      DisplayWidth = 8
      FieldName = 'cd_mensalidade'
    end
    object tblItenscd_motivo: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'd. Motivo'
      DisplayWidth = 8
      FieldName = 'cd_motivo'
      Origin = 'WMESTRE12.itensretorno.cd_motivo'
      Size = 10
    end
    object tblItensds_motivo: TStringField
      Tag = 1
      DisplayLabel = 'Motivo'
      DisplayWidth = 30
      FieldName = 'ds_motivo'
      Size = 100
    end
    object tblItensvl_tarifa: TFloatField
      Tag = 1
      DisplayLabel = 'Tarifa'
      FieldName = 'vl_tarifa'
      Origin = 'WMESTRE12.itensretorno.vl_tarifa'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensvalorbruto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Bruto'
      FieldName = 'valorbruto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensvalordesconto: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Desconto'
      FieldName = 'valordesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensdescontoextra: TFloatField
      Tag = 1
      DisplayLabel = 'Desc. Extra'
      FieldName = 'descontoextra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensvalorextra: TFloatField
      Tag = 1
      DisplayLabel = 'Vl. Extra'
      FieldName = 'valorextra'
      DisplayFormat = '###,###,##0.00'
    end
    object tblItensnm_pessoa: TStringField
      Tag = 1
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object tblItensds_historico: TStringField
      Tag = 1
      DisplayLabel = 'Hist. T'#237'tulo'
      DisplayWidth = 30
      FieldName = 'ds_historico'
      Size = 150
    end
    object tblItensds_cpf: TStringField
      Tag = 1
      DisplayLabel = 'CPF'
      DisplayWidth = 10
      FieldName = 'ds_cpf'
      Size = 11
    end
    object tblItensturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      DisplayWidth = 50
      FieldName = 'turma'
      Size = 50
    end
    object tblItenssn_baixado: TSmallintField
      FieldName = 'sn_baixado'
    end
    object tblItenssn_baixar: TStringField
      FieldName = 'sn_baixar'
      FixedChar = True
      Size = 1
    end
    object tblItensdt_credito: TDateTimeField
      Tag = 1
      DisplayLabel = 'Dt. Cr'#233'dito'
      DisplayWidth = 10
      FieldName = 'dt_credito'
    end
    object tblItensresponsavel: TStringField
      Tag = 1
      DisplayLabel = 'Respons'#225'vel'
      DisplayWidth = 30
      FieldName = 'responsavel'
      Size = 60
    end
    object tblItensCD_OCORRENCIA: TStringField
      DisplayLabel = 'C'#243'd. Ocorr'#234'ncia'
      FieldName = 'CD_OCORRENCIA'
      Size = 10
    end
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
    Left = 384
    Top = 136
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
  end
  object ImageList1: TImageList
    Left = 454
    Top = 141
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF007F7F7F000000
      00007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000FFFFFF007F7F7F00FFFFFF00000000000000
      00000000000000000000FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000FFFFFF000000
      0000FFFFFF007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7F000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F00000000007F7F7F00000000000000
      00007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F0000000000000000000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00FFFFFF00000000007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC00FC0000000000FC00906800000000
      200000920000000000001E3C0000000000001C520000000000001E0200000000
      00001C16000000000000180E000000000000001800000000000010B200000000
      E000E17800000000F800FAC000000000F000F49200000000E001E0F100000000
      C403C40300000000EC07EC0700000000FFFFFFFFFFFFE003FFF9FC7FE3FF8000
      FFF9F21F83FF0000E3F3E40F000F0000E3F3C203003F0000E1C78603002F0000
      F08F8C01000F0000F81F9001000F0000FC3F802100010001F81F800100010003
      F09FC06300010007E1C7F18F000F000C83E3FE01000F00308FF1FF07002F0001
      FFFFFF8F803FC007FFFFFFFFE3FFF01F00000000000000000000000000000000
      000000000000}
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 656
    Top = 293
  end
  object tblMotivos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select rm.cd_banco, rm.cd_motivo, rm.ds_motivo from banco_retorn' +
        'o_motivos rm, banco_codigo_retorno cr'
      
        'where rm.cd_banco = cr.cd_banco AND rm.cd_grupo_motivos = cr.cd_' +
        'grupo_motivos'
      'AND '
      
        '   rm.cd_banco = :cd_banco AND cr.cd_retorno = :cd_retorno AND r' +
        'm.cd_motivo = :cd_motivo')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_motivo'
        ParamType = ptUnknown
      end>
    Left = 448
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_retorno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_motivo'
        ParamType = ptUnknown
      end>
    object tblMotivoscd_motivo: TStringField
      FieldName = 'cd_motivo'
      Origin = 'WMESTRE12.banco_retorno_motivos.cd_motivo'
      Size = 10
    end
    object tblMotivosds_motivo: TStringField
      FieldName = 'ds_motivo'
      Origin = 'WMESTRE12.banco_retorno_motivos.ds_motivo'
      Size = 100
    end
    object tblMotivoscd_banco: TStringField
      FieldName = 'cd_banco'
      Origin = 'WMESTRE12.banco_retorno_motivos.cd_banco'
      FixedChar = True
      Size = 3
    end
  end
  object qItensGrupo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   OCORRENCIA'
      'FROM'
      '   ITENSRETORNO I'
      '      JOIN RETORNO R ON'
      '         (I.CODIGORETORNO = R.CODIGO)'
      'WHERE'
      '   CODIGORETORNO = :CODIGORETORNO'
      'GROUP BY '
      '   OCORRENCIA'
      '   ')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoretorno'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoretorno'
        ParamType = ptUnknown
      end>
    object qItensGrupoocorrencia: TStringField
      FieldName = 'ocorrencia'
      Origin = 'WMESTRE12.itensretorno.ocorrencia'
      Size = 50
    end
  end
  object qryColigadas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_coligada,nm_coligada'
      'FROM'
      '  coligadas')
    Params = <>
    Left = 16
    Top = 120
  end
end
