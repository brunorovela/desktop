object frmPlanos: TfrmPlanos
  Left = 178
  Top = 67
  Caption = 'Planos de Pagamento'
  ClientHeight = 545
  ClientWidth = 792
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel3: TBevel
    Left = 516
    Top = 25
    Width = 11
    Height = 486
    Align = alLeft
    Shape = bsSpacer
    ExplicitHeight = 477
  end
  object Bevel7: TBevel
    Left = 0
    Top = 511
    Width = 792
    Height = 9
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 502
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 792
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
    Left = 527
    Top = 25
    Width = 265
    Height = 486
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Bevel5: TBevel
      Left = 0
      Top = 0
      Width = 265
      Height = 15
      Align = alTop
      Shape = bsSpacer
    end
    object grd: TDBGrid
      Left = 0
      Top = 69
      Width = 265
      Height = 417
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtcPlanos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = pmQtdPlanos
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Curso'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Turma'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Parcelas'
          Title.Caption = 'Parc.'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 200
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 15
      Width = 265
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
      Width = 265
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
  object Panel4: TPanel
    Left = 0
    Top = 25
    Width = 516
    Height = 486
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel1: TBevel
      Left = 0
      Top = 297
      Width = 516
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 260
    end
    object Bevel6: TBevel
      Left = 0
      Top = 278
      Width = 516
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 241
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 302
      Width = 516
      Height = 184
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtcItens
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmQtdItens
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nr_dia'
          Title.Caption = 'Dia'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Mes'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_ano'
          Title.Caption = 'Ano'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Parcela'
          Title.Caption = 'Parc.'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorBruto'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorDesconto'
          Title.Caption = 'Vl.Desc.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorExtra'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescontoExtra'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotal'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sn_credito_parcela'
          Title.Alignment = taCenter
          Title.Caption = 'CR'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_creditos_minimos'
          Title.Caption = 'CR.M'#237'n'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descTipoTitulo'
          Title.Caption = 'Tipo T'#237't.'
          Width = 70
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 516
      Height = 278
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 15
        Top = 41
        Width = 52
        Height = 14
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbeDescricao
      end
      object Label4: TLabel
        Left = 364
        Top = 79
        Width = 65
        Height = 14
        Caption = 'Qtd. Parcelas'
        FocusControl = DBEdit3
      end
      object Label11: TLabel
        Left = 15
        Top = 236
        Width = 53
        Height = 14
        Caption = 'A partir de:'
        FocusControl = DBEdit10
      end
      object Label1: TLabel
        Left = 383
        Top = 40
        Width = 69
        Height = 14
        Caption = 'Ano/Semestre'
        FocusControl = DBEdit12
      end
      object btnCalcular: TSpeedButton
        Left = 254
        Top = 244
        Width = 126
        Height = 28
        Hint = 'Calcular as parcelas para o plano de pagamento'
        Caption = 'F11 Calcular Parcelas'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
        OnClick = btnCalcularClick
      end
      object btnCopiar: TSpeedButton
        Left = 383
        Top = 244
        Width = 109
        Height = 28
        Hint = 'Copiar o plano selecionado para outro per'#237'odo'
        Caption = 'F10 Copiar Plano'
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
        OnClick = btnCopiarClick
      end
      object Label13: TLabel
        Left = 15
        Top = 80
        Width = 29
        Height = 14
        Caption = 'Curso'
      end
      object Label15: TLabel
        Left = 190
        Top = 80
        Width = 83
        Height = 14
        Caption = 'Turma (Opcional)'
      end
      object Label3: TLabel
        Left = 15
        Top = 198
        Width = 72
        Height = 14
        Caption = 'Obs. Especiais'
        FocusControl = DBEdit1
      end
      object Label19: TLabel
        Left = 15
        Top = 3
        Width = 92
        Height = 14
        Caption = 'Unidade de Ensino:'
      end
      object dbeDescricao: TDBEdit
        Left = 15
        Top = 57
        Width = 354
        Height = 22
        Hint = 'Descri'#231#227'o do plano de pagamento'
        DataField = 'Descricao'
        DataSource = dtcPlanos
        TabOrder = 0
        OnEnter = dbeDescricaoEnter
        OnKeyDown = dbeDescricaoKeyDown
        OnKeyPress = dbeDescricaoKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 364
        Top = 95
        Width = 130
        Height = 22
        Hint = 'Quantidade de Parcelas'
        DataField = 'Parcelas'
        DataSource = dtcPlanos
        TabOrder = 4
        OnEnter = dbeDescricaoEnter
        OnKeyDown = dbeDescricaoKeyDown
        OnKeyPress = dbeDescricaoKeyPress
      end
      object DBEdit10: TDBEdit
        Left = 15
        Top = 250
        Width = 122
        Height = 22
        Hint = 'Data do primeiro vencimento'
        DataField = 'Apartir'
        DataSource = dtcPlanos
        TabOrder = 7
        OnEnter = dbeDescricaoEnter
        OnKeyDown = dbeDescricaoKeyDown
        OnKeyPress = dbeDescricaoKeyPress
      end
      object DBEdit12: TDBEdit
        Left = 383
        Top = 56
        Width = 111
        Height = 22
        Hint = 'Ano/Semestre vigente'
        DataField = 'AnoSemestre'
        DataSource = dtcPlanos
        TabOrder = 1
        OnEnter = dbeDescricaoEnter
        OnKeyPress = dbeDescricaoKeyPress
      end
      object dbCurso: TDBComboBox
        Left = 15
        Top = 96
        Width = 162
        Height = 22
        Hint = 'Curso a ser aplicado o plano de pagamento'
        DataField = 'Curso'
        DataSource = dtcPlanos
        ItemHeight = 14
        TabOrder = 2
        OnEnter = dbeDescricaoEnter
        OnKeyPress = dbeDescricaoKeyPress
      end
      object dbTurma: TDBComboBox
        Left = 190
        Top = 96
        Width = 163
        Height = 22
        Hint = 'Turma a ser aplicado o plano de pagamento (Vazio para todas)'
        DataField = 'Turma'
        DataSource = dtcPlanos
        ItemHeight = 14
        TabOrder = 3
        OnEnter = dbeDescricaoEnter
        OnKeyPress = dbeDescricaoKeyPress
      end
      object DBEdit1: TDBEdit
        Left = 15
        Top = 214
        Width = 479
        Height = 22
        Hint = 'Observa'#231#245'es diversas (pode ser usado para impress'#227'o do contrato)'
        DataField = 'PARAGRAFO3'
        DataSource = dtcPlanos
        TabOrder = 6
        OnEnter = dbeDescricaoEnter
        OnKeyDown = dbeDescricaoKeyDown
        OnKeyPress = dbeDescricaoKeyPress
      end
      object DBCheckBox1: TDBCheckBox
        Left = 364
        Top = 135
        Width = 125
        Height = 20
        Caption = 'Considerar Dias '#218'teis'
        DataField = 'sn_dias_uteis'
        DataSource = dtcPlanos
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object pgTipoPlano: TPageControl
        Left = 15
        Top = 121
        Width = 490
        Height = 76
        ActivePage = tsValorFixo
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 5
        OnChange = pgTipoPlanoChange
        OnChanging = pgTipoPlanoChanging
        object tsValorFixo: TTabSheet
          Caption = 'Valor Fixo'
          object Label5: TLabel
            Left = 3
            Top = 0
            Width = 57
            Height = 14
            Caption = 'Valor Bruto:'
            FocusControl = DBEdit4
          end
          object Label8: TLabel
            Left = 98
            Top = 0
            Width = 56
            Height = 14
            Caption = 'Valor Extra:'
            FocusControl = DBEdit7
          end
          object Label9: TLabel
            Left = 193
            Top = 0
            Width = 70
            Height = 14
            Caption = 'Desc. Condic.:'
            FocusControl = DBEdit8
          end
          object Label6: TLabel
            Left = 288
            Top = 0
            Width = 70
            Height = 14
            Caption = 'Vl. Parc. Zero:'
            FocusControl = DBEdit5
          end
          object Label10: TLabel
            Left = 383
            Top = 0
            Width = 78
            Height = 14
            Caption = 'Dias Parc. Zero:'
            FocusControl = DBEdit2
          end
          object DBEdit4: TDBEdit
            Left = 3
            Top = 20
            Width = 90
            Height = 22
            Hint = 'Valor bruto a ser cobrado'
            DataField = 'ValorCobrado'
            DataSource = dtcPlanos
            TabOrder = 0
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit7: TDBEdit
            Left = 98
            Top = 20
            Width = 90
            Height = 22
            Hint = 'Valor extra (materiais, apostilas, uniforme...)'
            DataField = 'TaxaApostila'
            DataSource = dtcPlanos
            TabOrder = 1
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit8: TDBEdit
            Left = 193
            Top = 20
            Width = 90
            Height = 22
            Hint = 'Valor de desconto para pagamento antecipado'
            DataField = 'Desconto'
            DataSource = dtcPlanos
            TabOrder = 2
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit5: TDBEdit
            Left = 288
            Top = 20
            Width = 90
            Height = 22
            Hint = 
              'Valor a ser cobrado como matr'#237'cula ou parcela de taxa de materia' +
              'is'
            DataField = 'Matricula'
            DataSource = dtcPlanos
            TabOrder = 3
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit2: TDBEdit
            Left = 383
            Top = 20
            Width = 90
            Height = 22
            DataField = 'nr_dias_parczero'
            DataSource = dtcPlanos
            TabOrder = 4
          end
        end
        object tsValorCreditos: TTabSheet
          Caption = 'Por Cr'#233'ditos'
          ImageIndex = 1
          object Label12: TLabel
            Left = 3
            Top = 0
            Width = 88
            Height = 14
            Caption = 'Qtd. Cr'#233'dito Base:'
            FocusControl = DBEdit11
          end
          object Label16: TLabel
            Left = 98
            Top = 0
            Width = 65
            Height = 14
            Caption = 'Valor Cr'#233'dito:'
            FocusControl = DBEdit9
          end
          object Label7: TLabel
            Left = 193
            Top = 0
            Width = 70
            Height = 14
            Caption = 'Desc. Condic.:'
            FocusControl = DBEdit6
          end
          object Label17: TLabel
            Left = 288
            Top = 0
            Width = 70
            Height = 14
            Caption = 'Vl. Parc. Zero:'
            FocusControl = DBEdit13
          end
          object Label18: TLabel
            Left = 383
            Top = 0
            Width = 78
            Height = 14
            Caption = 'Dias Parc. Zero:'
            FocusControl = DBEdit14
          end
          object DBEdit11: TDBEdit
            Left = 3
            Top = 20
            Width = 90
            Height = 22
            Hint = 'Define a quantidade de Cr'#233'ditos representada no Valor Cobrado'
            DataField = 'nr_creditos_base'
            DataSource = dtcPlanos
            TabOrder = 0
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit9: TDBEdit
            Left = 98
            Top = 20
            Width = 90
            Height = 22
            Hint = 'Valor bruto a ser cobrado'
            DataField = 'ValorCobrado'
            DataSource = dtcPlanos
            TabOrder = 1
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit6: TDBEdit
            Left = 193
            Top = 20
            Width = 90
            Height = 22
            Hint = 'Valor de desconto para pagamento antecipado'
            DataField = 'Desconto'
            DataSource = dtcPlanos
            TabOrder = 2
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit13: TDBEdit
            Left = 288
            Top = 20
            Width = 90
            Height = 22
            Hint = 
              'Valor a ser cobrado como matr'#237'cula ou parcela de taxa de materia' +
              'is'
            DataField = 'Matricula'
            DataSource = dtcPlanos
            TabOrder = 3
            OnEnter = dbeDescricaoEnter
            OnKeyDown = dbeDescricaoKeyDown
            OnKeyPress = dbeDescricaoKeyPress
          end
          object DBEdit14: TDBEdit
            Left = 384
            Top = 20
            Width = 90
            Height = 22
            DataField = 'nr_dias_parczero'
            DataSource = dtcPlanos
            TabOrder = 4
          end
        end
      end
      object dbckbDiasUteis: TDBCheckBox
        Left = 144
        Top = 251
        Width = 74
        Height = 17
        Caption = 'Dias '#250'teis'
        DataField = 'sn_dias_uteis'
        DataSource = dtcPlanos
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 15
        Top = 18
        Width = 479
        Height = 22
        DataField = 'nm_coligada'
        DataSource = dtcPlanos
        TabOrder = 10
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 283
      Width = 516
      Height = 14
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PARCELAS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 520
    Width = 792
    Height = 25
    Align = alBottom
    ButtonWidth = 85
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
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
  object dtcPlanos: TDataSource
    DataSet = tblPlanos
    OnStateChange = dtcPlanosStateChange
    OnDataChange = dtcPlanosDataChange
    Left = 504
    Top = 448
  end
  object tblPlanos: TUMZQuery
    Connection = DM.db
    AfterOpen = tblPlanosAfterOpen
    BeforePost = tblPlanosBeforePost
    BeforeDelete = tblPlanosBeforeDelete
    OnNewRecord = tblPlanosNewRecord
    SQL.Strings = (
      'select * from PlanosPagamento '
      'where'
      'AnoSemestre = :AnoSemestre'
      'order by Curso, Turma, Descricao')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 504
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblPlanosCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'PlanosPagamento.Codigo'
    end
    object tblPlanosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Origin = 'PlanosPagamento.Codigo'
      Size = 50
    end
    object tblPlanosTurma: TStringField
      FieldName = 'Turma'
      Origin = 'PlanosPagamento.Turma'
      Size = 50
    end
    object tblPlanosParcelas: TSmallintField
      FieldName = 'Parcelas'
      Origin = 'PlanosPagamento.Parcelas'
    end
    object tblPlanosValorCobrado: TFloatField
      FieldName = 'ValorCobrado'
      Origin = 'PlanosPagamento.ValorCobrado'
      OnChange = tblPlanosValorCobradoChange
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object tblPlanosValorContrato: TFloatField
      FieldName = 'ValorContrato'
      Origin = 'PlanosPagamento.ValorContrato'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object tblPlanosTaxaApostila: TFloatField
      FieldName = 'TaxaApostila'
      Origin = 'PlanosPagamento.TaxaApostila'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object tblPlanosDesconto: TFloatField
      FieldName = 'Desconto'
      Origin = 'PlanosPagamento.Desconto'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object tblPlanosMatricula: TFloatField
      FieldName = 'Matricula'
      Origin = 'PlanosPagamento.Matricula'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '0.000'
    end
    object tblPlanosAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'PlanosPagamento.Codigo'
      DisplayFormat = '0000/0'
      EditFormat = '0000/0'
    end
    object tblPlanosCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.PlanosPagamento.Curso'
      OnChange = tblPlanosCursoChange
      Size = 15
    end
    object tblPlanosPARAGRAFO3: TStringField
      FieldName = 'PARAGRAFO3'
      Origin = 'WMESTRE12.PlanosPagamento.PARAGRAFO3'
      Size = 150
    end
    object tblPlanosnr_dias_parczero: TSmallintField
      DisplayLabel = 'Car'#234'ncia Parc. Zero'
      FieldName = 'nr_dias_parczero'
      Origin = 'WMESTRE12.planospagamento.nr_dias_parczero'
    end
    object tblPlanossn_creditos: TStringField
      FieldName = 'sn_creditos'
      Origin = 'WMESTRE12.planospagamento.sn_creditos'
      FixedChar = True
      Size = 1
    end
    object tblPlanosnr_creditos_base: TFloatField
      FieldName = 'nr_creditos_base'
      Origin = 'WMESTRE12.planospagamento.nr_creditos_base'
      DisplayFormat = '##0.000'
      EditFormat = '0.000'
    end
    object tblPlanoscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.planospagamento.cd_coligada'
    end
    object tblPlanoscd_tipo_plano: TSmallintField
      FieldName = 'cd_tipo_plano'
      Origin = 'WMESTRE12.planospagamento.cd_tipo_plano'
    end
    object tblPlanossn_dias_uteis: TStringField
      FieldName = 'sn_dias_uteis'
      Origin = 'WMESTRE12.planospagamento.sn_dias_uteis'
      FixedChar = True
      Size = 1
    end
    object tblPlanosnr_max_disciplinas: TLargeintField
      FieldName = 'nr_max_disciplinas'
    end
    object tblPlanosAPARTIR: TDateTimeField
      FieldName = 'APARTIR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object tblPlanosnm_coligada: TStringField
      FieldKind = fkLookup
      FieldName = 'nm_coligada'
      LookupDataSet = DM.qryColigadas
      LookupKeyFields = 'CD_COLIGADA'
      LookupResultField = 'NM_COLIGADA'
      KeyFields = 'cd_coligada'
      Lookup = True
    end
  end
  object qryMax: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'SELECT CAST(MAX(CODIGO) AS SIGNED) AS ULTIMO FROM PLANOSPAGAMENT' +
        'O')
    Params = <>
    SQLList.Strings = (
      
        'oracle=SELECT CAST(MAX(CODIGO) AS NUMBER(19)) AS ULTIMO FROM PLA' +
        'NOSPAGAMENTO'
      
        'mysql-5=SELECT CAST(MAX(CODIGO) AS SIGNED) AS ULTIMO FROM PLANOS' +
        'PAGAMENTO')
    Left = 536
    Top = 416
    object qryMaxULTIMO: TLargeintField
      FieldName = 'ULTIMO'
      ReadOnly = True
    end
  end
  object tblItens: TUMZQuery
    Connection = DM.db
    BeforePost = tblItensBeforePost
    BeforeDelete = tblItensBeforeDelete
    SQL.Strings = (
      'select * from ItensPlanosPagamento'
      'where'
      'CodigoPlano = :Codigo'
      'order by Parcela')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dtcPlanos
    Left = 472
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblItensCodigoPlano: TIntegerField
      FieldName = 'CodigoPlano'
      Origin = 'ItensPlanosPagamento.CodigoPlano'
    end
    object tblItensMes: TSmallintField
      DisplayWidth = 5
      FieldName = 'Mes'
      Origin = 'ItensPlanosPagamento.Mes'
    end
    object tblItensParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'ItensPlanosPagamento.CodigoPlano'
    end
    object tblItensValorBruto: TFloatField
      DisplayLabel = 'Vl.Bruto'
      DisplayWidth = 11
      FieldName = 'ValorBruto'
      Origin = 'ItensPlanosPagamento.ValorBruto'
      DisplayFormat = '###,###,##0.000'
    end
    object tblItensValorDesconto: TFloatField
      DisplayLabel = 'Vl.Desconto'
      DisplayWidth = 11
      FieldName = 'ValorDesconto'
      Origin = 'ItensPlanosPagamento.ValorDesconto'
      DisplayFormat = '###,###,##0.000'
    end
    object tblItensValorExtra: TFloatField
      DisplayLabel = 'Vl.Extra'
      DisplayWidth = 11
      FieldName = 'ValorExtra'
      Origin = 'ItensPlanosPagamento.ValorExtra'
      DisplayFormat = '###,###,##0.000'
    end
    object tblItensDescontoExtra: TFloatField
      DisplayLabel = 'Desc.Extra'
      DisplayWidth = 11
      FieldName = 'DescontoExtra'
      Origin = 'ItensPlanosPagamento.DescontoExtra'
      DisplayFormat = '###,###,##0.000'
    end
    object tblItensValorTotal: TFloatField
      DisplayLabel = 'Vl.Total'
      DisplayWidth = 11
      FieldName = 'ValorTotal'
      Origin = 'ItensPlanosPagamento.ValorTotal'
      DisplayFormat = '###,###,##0.000'
    end
    object tblItensnr_dia: TSmallintField
      FieldName = 'nr_dia'
      Origin = 'WMESTRE12.itensplanospagamento.nr_dia'
    end
    object tblItensnr_ano: TSmallintField
      FieldName = 'nr_ano'
      Origin = 'WMESTRE12.itensplanospagamento.nr_ano'
    end
    object tblItensnr_creditos_minimos: TFloatField
      FieldName = 'nr_creditos_minimos'
      Origin = 'WMESTRE12.itensplanospagamento.nr_creditos_minimos'
    end
    object tblItenssn_credito_parcela: TStringField
      FieldName = 'sn_credito_parcela'
      Origin = 'WMESTRE12.itensplanospagamento.sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
    object tblItenscd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.itensplanospagamento.cd_coligada'
    end
    object tblItenscd_tipo_parcela: TSmallintField
      FieldName = 'cd_tipo_parcela'
      Origin = 'WMESTRE12.itensplanospagamento.cd_tipo_parcela'
    end
    object tblItensdescTipoTitulo: TStringField
      FieldKind = fkLookup
      FieldName = 'descTipoTitulo'
      LookupDataSet = qyTipoTit
      LookupKeyFields = 'cd_tipo_titulo'
      LookupResultField = 'ds_tipo_titulo'
      KeyFields = 'cd_tipo_parcela'
      Size = 50
      Lookup = True
    end
  end
  object dtcItens: TDataSource
    DataSet = tblItens
    Left = 472
    Top = 448
  end
  object qryInsertPlano: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'insert into PlanosPagamento'
      '( Codigo, cd_coligada, AnoSemestre, Descricao, Turma,  Curso,'
      
        'Parcelas, ValorCobrado, ValorContrato, TaxaApostila, Desconto, M' +
        'atricula, '
      
        'Apartir,  Paragrafo3, nr_dias_parczero, sn_dias_uteis, sn_credit' +
        'os, nr_creditos_base, cd_tipo_plano)'
      
        'VALUES(:NovoCodigo, :NovaColigada, :NovoAnoSemestre, :NovaDescri' +
        'cao, :NovaTurma, :NovoCurso, '
      ':NovaParcelas, :NovoValorCobrado, :NovoValorContrato, '
      
        ':NovaTaxaApostila, :NovoDesconto, :NovaMatricula, :NovoApartir, ' +
        ' :NovoParagrafo3, :NrDiasParczero, :SnDiasUteis, '
      ':sn_creditos, :nr_creditos_base, :CdTipoPlano)')
    Params = <
      item
        DataType = ftInteger
        Name = 'NovoCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaColigada'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NovoAnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaDescricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NovaTurma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoCurso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaParcelas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoValorCobrado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoValorContrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaTaxaApostila'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaMatricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoApartir'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoParagrafo3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NrDiasParczero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SnDiasUteis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_creditos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos_base'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CdTipoPlano'
        ParamType = ptUnknown
      end>
    Left = 576
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NovoCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaColigada'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NovoAnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaDescricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NovaTurma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoCurso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaParcelas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoValorCobrado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoValorContrato'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaTaxaApostila'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaMatricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoApartir'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovoParagrafo3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NrDiasParczero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SnDiasUteis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_creditos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos_base'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CdTipoPlano'
        ParamType = ptUnknown
      end>
  end
  object qryInsertParcelas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'insert into ItensPlanosPagamento'
      
        '(CodigoPlano, cd_coligada, Mes, nr_dia, nr_ano, Parcela, ValorBr' +
        'uto, ValorDesconto, '
      
        'ValorExtra, DescontoExtra, ValorTotal, nr_creditos_minimos, sn_c' +
        'redito_parcela, cd_tipo_parcela)'
      
        'VALUES (:NovoCodigo, :NovaColigada, :Mes, :nr_dia, :nr_ano, :Par' +
        'cela, :ValorBruto, :ValorDesconto, :ValorExtra, :DescontoExtra, ' +
        ':ValorTotal, :nr_creditos_minimos, :sn_credito_parcela, :CdTipoP' +
        'arcela)')
    Params = <
      item
        DataType = ftInteger
        Name = 'NovoCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaColigada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_dia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_ano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos_minimos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CdTipoParcela'
        ParamType = ptUnknown
      end>
    Left = 608
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NovoCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NovaColigada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_dia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_ano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos_minimos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CdTipoParcela'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 648
    Top = 416
  end
  object ImageList1: TImageList
    Left = 440
    Top = 344
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
  object pmQtdItens: TPopupMenu
    OnPopup = pmQtdItensPopup
    Left = 472
    Top = 480
  end
  object pmQtdPlanos: TPopupMenu
    OnPopup = pmQtdPlanosPopup
    Left = 504
    Top = 480
  end
  object qyTipoTit: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   fin_tipos_titulo'
      'WHERE ct_tipo_titulo = 1 '
      '            AND cd_coligada = :cd_coligada'
      'ORDER BY ds_tipo_titulo')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyTipoTitcd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.cd_tipo_titulo'
    end
    object qyTipoTitds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.ds_tipo_titulo'
      Size = 255
    end
    object qyTipoTitct_tipo_titulo: TSmallintField
      FieldName = 'ct_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.ct_tipo_titulo'
    end
    object qyTipoTitcd_conta: TLargeintField
      FieldName = 'cd_conta'
    end
    object qyTipoTitcd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qyTipoTitcd_padrao: TIntegerField
      FieldName = 'cd_padrao'
    end
  end
end
