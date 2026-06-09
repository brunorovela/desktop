object fPlanosDisciplinas: TfPlanosDisciplinas
  Left = 178
  Top = 67
  Caption = 'Planos de Pagamento'
  ClientHeight = 536
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel7: TBevel
    Left = 0
    Top = 502
    Width = 909
    Height = 9
    Align = alBottom
    Shape = bsSpacer
    ExplicitWidth = 792
  end
  object Bevel3: TBevel
    Left = 0
    Top = 25
    Width = 3
    Height = 477
    Align = alLeft
    Shape = bsSpacer
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PLANOS DE PAGAMENTO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 553
    Top = 25
    Width = 356
    Height = 477
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Bevel5: TBevel
      Left = 0
      Top = 0
      Width = 356
      Height = 15
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 265
    end
    object grd: TDBGrid
      Left = 0
      Top = 69
      Width = 356
      Height = 408
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPlanos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_plano'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_plano'
          Width = 55
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 15
      Width = 356
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PLANOS CADASTRADOS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnAnoSemestre: TPanel
      Left = 0
      Top = 40
      Width = 356
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label14: TLabel
        Left = 8
        Top = 7
        Width = 72
        Height = 14
        Caption = 'Ano/Semestre:'
      end
      object txtAnoSemestre: TMaskEdit
        Left = 85
        Top = 3
        Width = 55
        Height = 22
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '19931'
      end
      object UpDown1: TUpDown
        Left = 136
        Top = 3
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 1
        OnClick = UpDown1Click
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 511
    Width = 909
    Height = 25
    Align = alBottom
    ButtonWidth = 85
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
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
    object btnInserir: TToolButton
      Left = 8
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TToolButton
      Left = 93
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 178
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 263
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 271
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 356
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton8: TToolButton
      Left = 441
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 449
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 534
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object Panel4: TPanel
    Left = 3
    Top = 25
    Width = 550
    Height = 477
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 550
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 6
        Width = 51
        Height = 14
        Caption = 'C'#243'd. Plano'
        FocusControl = dbCodigo
      end
      object Label2: TLabel
        Left = 72
        Top = 6
        Width = 93
        Height = 14
        Caption = 'Descri'#231#227'o do Plano'
        FocusControl = dbDescricao
      end
      object sbCopia: TSpeedButton
        Left = 399
        Top = 22
        Width = 87
        Height = 22
        Caption = 'F10 Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = sbCopiaClick
      end
      object dbCodigo: TDBEdit
        Left = 6
        Top = 22
        Width = 60
        Height = 22
        DataField = 'cd_plano'
        DataSource = dsPlanos
        Enabled = False
        TabOrder = 0
      end
      object dbDescricao: TDBEdit
        Left = 72
        Top = 22
        Width = 321
        Height = 22
        DataField = 'ds_plano'
        DataSource = dsPlanos
        TabOrder = 1
      end
    end
    object pgPlano: TPageControl
      Left = 0
      Top = 60
      Width = 550
      Height = 417
      ActivePage = tsItens
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      object tsItens: TTabSheet
        Caption = 'Itens do Plano'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 193
          Width = 542
          Height = 192
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsItens
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'nr_disc_min'
              Title.Alignment = taCenter
              Title.Caption = 'Min'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_disc_max'
              Title.Alignment = taCenter
              Title.Caption = 'Max'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descTipoTitulo'
              Title.Caption = 'Tipo de T'#237'tulo'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_parcelas'
              Title.Caption = 'Parc.'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_parcela'
              Title.Caption = 'Valor Parc.'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_desconto'
              Title.Caption = 'Desc. Cond.'
              Width = 62
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dt_primeira_parc'
              Title.Alignment = taCenter
              Title.Caption = 'Venc. 1'#170' Par.'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_SEGUNDA_PARC'
              Title.Caption = 'Venc. 2'#170' Par.'
              Width = 73
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 542
          Height = 193
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 16
            Top = 37
            Width = 61
            Height = 14
            Caption = 'N'#186' Min. Disc.'
            FocusControl = dbMinDisc
          end
          object Label7: TLabel
            Left = 16
            Top = 81
            Width = 57
            Height = 14
            Caption = 'N'#186' Parcelas'
            FocusControl = DBEdit6
          end
          object Label9: TLabel
            Left = 90
            Top = 81
            Width = 91
            Height = 14
            Caption = 'Valor das Parcelas'
            FocusControl = DBEdit8
          end
          object Label5: TLabel
            Left = 90
            Top = 37
            Width = 65
            Height = 14
            Caption = 'N'#186' Max. Disc.'
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 164
            Top = 37
            Width = 63
            Height = 14
            Caption = 'Tipo de T'#237'tulo'
            FocusControl = DBLookupComboBox1
          end
          object Label8: TLabel
            Left = 203
            Top = 81
            Width = 86
            Height = 14
            Caption = 'Desc. Condicional'
            FocusControl = DBEdit7
          end
          object Label10: TLabel
            Left = 248
            Top = 126
            Width = 131
            Height = 14
            Caption = 'Venc. das demais parcelas'
            FocusControl = bdVencDemais
          end
          object btnIncluirItem: TSpeedButton
            Left = 358
            Top = 6
            Width = 36
            Height = 24
            Hint = 'Incluir Plano de Contas'
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
            OnClick = btnIncluirItemClick
          end
          object btnExcluirItem: TSpeedButton
            Left = 395
            Top = 6
            Width = 36
            Height = 24
            Hint = 'Incluir Plano de Contas'
            Flat = True
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              1000030000000002000000000000000000000000000000000000007C0000E003
              00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
              FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
              FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
              1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
              FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
              000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C}
            OnClick = btnExcluirItemClick
          end
          object btnSalvarItem: TSpeedButton
            Left = 437
            Top = 6
            Width = 36
            Height = 24
            Hint = 'Incluir Plano de Contas'
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              00000000000000000000000000000084840000000000FF00FF00FF00FF000000
              0000008484000084840000848400008484000084840000848400008484000084
              84000084840000848400008484000084840000000000FF00FF00FF00FF000000
              0000008484000084840000000000000000000000000000000000000000000000
              00000000000000000000008484000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF000000
              00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            OnClick = btnSalvarItemClick
          end
          object Label12: TLabel
            Left = 3
            Top = 6
            Width = 226
            Height = 14
            Caption = 'Itens do Plano por n'#250'mero de disciplinas'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 16
            Top = 126
            Width = 95
            Height = 14
            Caption = 'Venc. da 1'#170' parcela'
            FocusControl = DBEdit1
          end
          object Label3: TLabel
            Left = 132
            Top = 126
            Width = 95
            Height = 14
            Caption = 'Venc. da 2'#170' parcela'
            FocusControl = DBEdit2
          end
          object dbMinDisc: TDBEdit
            Left = 16
            Top = 53
            Width = 65
            Height = 22
            DataField = 'nr_disc_min'
            DataSource = dsItens
            TabOrder = 0
            OnKeyPress = dbMinDiscKeyPress
          end
          object DBEdit6: TDBEdit
            Left = 16
            Top = 97
            Width = 65
            Height = 22
            DataField = 'nr_parcelas'
            DataSource = dsItens
            TabOrder = 3
          end
          object DBEdit8: TDBEdit
            Left = 90
            Top = 97
            Width = 104
            Height = 22
            DataField = 'vl_parcela'
            DataSource = dsItens
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 90
            Top = 53
            Width = 65
            Height = 22
            DataField = 'nr_disc_max'
            DataSource = dsItens
            TabOrder = 1
            OnKeyPress = dbMinDiscKeyPress
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 164
            Top = 53
            Width = 306
            Height = 22
            DataField = 'descTipoTitulo'
            DataSource = dsItens
            TabOrder = 2
          end
          object DBCheckBox1: TDBCheckBox
            Left = 330
            Top = 100
            Width = 96
            Height = 17
            Caption = 'Pode Repetir?'
            DataField = 'sn_pode_repetir'
            DataSource = dsItens
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object bdVencDemais: TDBEdit
            Left = 248
            Top = 142
            Width = 110
            Height = 22
            DataField = 'dt_inicial'
            DataSource = dsItens
            TabOrder = 9
          end
          object DBEdit7: TDBEdit
            Left = 203
            Top = 97
            Width = 104
            Height = 22
            DataField = 'vl_desconto'
            DataSource = dsItens
            TabOrder = 5
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 142
            Width = 110
            Height = 22
            DataField = 'dt_primeira_parc'
            DataSource = dsItens
            TabOrder = 7
          end
          object dbchUltimoMes: TDBCheckBox
            Left = 364
            Top = 145
            Width = 104
            Height = 17
            Caption = #218'ltimo dia do m'#234's'
            DataField = 'sn_ultimo_dia_mes'
            DataSource = dsItens
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 16
            Top = 170
            Width = 198
            Height = 17
            Caption = 'Vencimento somente em dias '#250'teis?'
            DataField = 'sn_dia_util'
            DataSource = dsItens
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit2: TDBEdit
            Left = 132
            Top = 142
            Width = 110
            Height = 22
            DataField = 'DT_SEGUNDA_PARC'
            DataSource = dsItens
            TabOrder = 8
          end
        end
      end
      object tsTurmas: TTabSheet
        Caption = 'Turmas'
        ImageIndex = 1
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 542
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object sbAdicionarCurso: TSpeedButton
            Left = 4
            Top = 2
            Width = 115
            Height = 24
            Caption = 'Adicionar Curso'
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
            OnClick = sbAdicionarCursoClick
          end
          object sbAdicionarTurma: TSpeedButton
            Left = 119
            Top = 2
            Width = 115
            Height = 24
            Caption = 'Adicionar Turma'
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
            OnClick = sbAdicionarTurmaClick
          end
          object sbExcluirTurma: TSpeedButton
            Left = 234
            Top = 2
            Width = 115
            Height = 24
            Caption = 'Excluir Turma'
            Flat = True
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              1000030000000002000000000000000000000000000000000000007C0000E003
              00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
              FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
              FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
              1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
              FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
              000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C}
            OnClick = sbExcluirTurmaClick
          end
          object sbExcluirTudo: TSpeedButton
            Left = 349
            Top = 2
            Width = 115
            Height = 24
            Caption = 'Excluir Tudo'
            Flat = True
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              1000030000000002000000000000000000000000000000000000007C0000E003
              00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
              FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
              FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
              1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
              FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
              000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
              1F7C1F7C1F7C}
            OnClick = sbExcluirTudoClick
          end
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 41
          Width = 542
          Height = 344
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsTurma
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'cd_turma'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_anosem'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'serie'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cd_curso'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_curso'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 544
    Top = 512
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
  object qyPlanos: TUMZQuery
    Connection = DM.db
    BeforeInsert = qyPlanosBeforeInsert
    AfterInsert = qyPlanosAfterInsert
    BeforeEdit = qyPlanosBeforeEdit
    OnNewRecord = qyPlanosNewRecord
    SQL.Strings = (
      'SELECT * FROM fin_plano_pgto ORDER BY ds_plano')
    Params = <>
    Top = 448
    object qyPlanosds_plano: TStringField
      DisplayLabel = 'Descri'#231#227'o do Plano'
      FieldName = 'ds_plano'
      Origin = 'WMESTRE12.fin_plano_pgto.ds_plano'
      Size = 150
    end
    object qyPlanoscd_plano: TLargeintField
      DisplayLabel = 'C'#243'd. Plano'
      FieldName = 'cd_plano'
      Required = True
    end
    object qyPlanosnr_anosem: TIntegerField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'nr_anosem'
    end
  end
  object dsPlanos: TDataSource
    DataSet = qyPlanos
    OnStateChange = dsPlanosStateChange
    Left = 32
    Top = 448
  end
  object qyItens: TUMZQuery
    Connection = DM.db
    BeforeInsert = qyItensBeforeInsert
    BeforeEdit = qyItensBeforeEdit
    OnNewRecord = qyItensNewRecord
    SQL.Strings = (
      'SELECT * FROM fin_planos_pgto_itens WHERE cd_plano = :cd_plano '
      'ORDER BY nr_disc_min, nr_parcelas')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsPlanos
    Left = 64
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_plano'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyItensvl_parcela: TFloatField
      DisplayLabel = 'Valor das Parcelas'
      FieldName = 'vl_parcela'
      Origin = 'WMESTRE12.fin_planos_pgto_itens.vl_parcela'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyItensvl_desconto: TFloatField
      DisplayLabel = 'Desc. Pgto em Dia'
      FieldName = 'vl_desconto'
      Origin = 'WMESTRE12.fin_planos_pgto_itens.vl_desconto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyItensdt_inicial: TDateTimeField
      DisplayLabel = 'Data Inicial'
      FieldName = 'dt_inicial'
      Origin = 'WMESTRE12.fin_planos_pgto_itens.dt_inicial'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyItensdescTipoTitulo: TStringField
      FieldKind = fkLookup
      FieldName = 'descTipoTitulo'
      LookupDataSet = qyTiposTitulos
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'cd_tipo_titulo'
      Size = 100
      Lookup = True
    end
    object qyItensdt_primeira_parc: TDateTimeField
      DisplayLabel = 'Data Primeira Parcela'
      FieldName = 'dt_primeira_parc'
      Origin = 'WMESTRE12.fin_planos_pgto_itens.dt_primeira_parc'
      OnChange = qyItensdt_primeira_parcChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qyItenssn_dia_util: TSmallintField
      DisplayLabel = 'Vencimento somente em dias uteis'
      FieldName = 'sn_dia_util'
      Origin = 'WMESTRE12.fin_planos_pgto_itens.sn_dia_util'
    end
    object qyItenscd_plano_item: TLargeintField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'cd_plano_item'
      Required = True
    end
    object qyItenscd_plano: TLargeintField
      DisplayLabel = 'C'#243'd. Plano'
      FieldName = 'cd_plano'
    end
    object qyItensnr_disc_min: TSmallintField
      DisplayLabel = 'N'#186' Min. Disc.'
      FieldName = 'nr_disc_min'
    end
    object qyItensnr_disc_max: TSmallintField
      DisplayLabel = 'N'#186' Max. Disc.'
      FieldName = 'nr_disc_max'
      OnGetText = qyItensnr_disc_maxGetText
    end
    object qyItenssn_pode_repetir: TSmallintField
      DisplayLabel = 'Pode Repetir?'
      FieldName = 'sn_pode_repetir'
    end
    object qyItenscd_tipo_titulo: TLargeintField
      DisplayLabel = 'C'#243'd. Tipo T'#237'tulo'
      FieldName = 'cd_tipo_titulo'
    end
    object qyItensnr_parcelas: TIntegerField
      DisplayLabel = 'N'#186' Parcelas'
      FieldName = 'nr_parcelas'
    end
    object qyItenssn_ultimo_dia_mes: TSmallintField
      FieldName = 'sn_ultimo_dia_mes'
    end
    object qyItensDT_SEGUNDA_PARC: TDateTimeField
      FieldName = 'DT_SEGUNDA_PARC'
      OnChange = qyItensDT_SEGUNDA_PARCChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object qyTiposTitulos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CD_TIPO_TITULO,'
      '   DS_TIPO_TITULO'
      'FROM'
      '   FIN_TIPOS_TITULO'
      'WHERE'
      '   CT_TIPO_TITULO = 1'
      'ORDER BY'
      '   DS_TIPO_TITULO')
    Params = <>
    Left = 128
    Top = 448
    object qyTiposTituloscd_tipo_titulo: TSmallintField
      DisplayLabel = 'C'#243'd.Tipo'
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.cd_tipo_titulo'
    end
    object qyTiposTitulosds_tipo_titulo: TStringField
      DisplayLabel = 'Descri'#231#227'o do T'#237'tulo'
      FieldName = 'ds_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.ds_tipo_titulo'
      Size = 255
    end
  end
  object dsItens: TDataSource
    DataSet = qyItens
    OnStateChange = dsItensStateChange
    Left = 96
    Top = 448
  end
  object qyTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   P.ID_PLANO_TURMA,'
      '   P.CD_PLANO,'
      '   P.CD_TURMA,'
      '   P.NR_ANOSEM,'
      '   T.DESCRICAO DS_TURMA,'
      '   T.SERIE,'
      '   C.CD_CURSO,'
      '   C.DS_CURSO'
      'FROM'
      '   FIN_PLANO_TURMAS P'
      '      JOIN TURMAS T ON'
      '         (P.CD_TURMA = T.CODIGO) AND'
      '         (P.NR_ANOSEM = T.ANOSEMESTRE)'
      '      JOIN CURSOS_MESTRE C ON'
      '         (T.CURSO = C.CD_CURSO)'
      'WHERE'
      '   P.CD_PLANO = :CD_PLANO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_plano'
        ParamType = ptUnknown
      end>
    DataSource = dsPlanos
    Left = 160
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_plano'
        ParamType = ptUnknown
      end>
    object qyTurmascd_turma: TStringField
      DisplayLabel = 'Turma'
      FieldName = 'cd_turma'
      Size = 50
    end
    object qyTurmasds_turma: TStringField
      DisplayLabel = 'Desc. Turma'
      FieldName = 'ds_turma'
      Size = 40
    end
    object qyTurmasserie: TSmallintField
      DisplayLabel = 'Etapa'
      FieldName = 'serie'
    end
    object qyTurmasds_curso: TStringField
      DisplayLabel = 'Desc. Curso'
      FieldName = 'ds_curso'
      Size = 100
    end
    object qyTurmascd_curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'cd_curso'
      Size = 15
    end
    object qyTurmasid_plano_turma: TLargeintField
      FieldName = 'id_plano_turma'
      Required = True
    end
    object qyTurmascd_plano: TLargeintField
      FieldName = 'cd_plano'
    end
    object qyTurmasnr_anosem: TIntegerField
      DisplayLabel = 'Ano/Sem'
      FieldName = 'nr_anosem'
    end
  end
  object dsTurma: TDataSource
    DataSet = qyTurmas
    Left = 192
    Top = 448
  end
end
