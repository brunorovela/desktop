object fMensalidadeGerar: TfMensalidadeGerar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gera'#231#227'o de t'#237'tulos a receber'
  ClientHeight = 589
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    Caption = 'GERA'#199#195'O DE T'#205'TULOS A RECEBER'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlGeral: TPanel
    Left = 0
    Top = 52
    Width = 706
    Height = 537
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object bvlSep2: TBevel
      Left = 5
      Top = 191
      Width = 696
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 153
      ExplicitWidth = 725
    end
    object gbFiltros: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 10
      Width = 696
      Height = 181
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Sele'#231#227'o'
      TabOrder = 0
      object lblTurmaVincular: TLabel
        Left = 5
        Top = 62
        Width = 113
        Height = 13
        Caption = 'Vincular t'#237'tulos '#224' turma:'
      end
      object sbSelTurma: TSpeedButton
        Left = 233
        Top = 78
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
      object pnlSelecao: TPanel
        Left = 2
        Top = 15
        Width = 692
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object pnlTipoSelecao: TPanel
          Left = 0
          Top = 0
          Width = 231
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lblSelecao: TLabel
            Left = 3
            Top = 3
            Width = 88
            Height = 13
            Caption = 'Gerar t'#237'tulos para:'
          end
          object cbSelecao: TComboBox
            Left = 3
            Top = 19
            Width = 228
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 0
            OnSelect = cbSelecaoSelect
            Items.Strings = (
              'Uma pessoa espec'#237'fica'
              'Todos os alunos de uma turma'
              'Todos os alunos de um curso'
              'Todos os alunos de um ano/semestre')
          end
        end
      end
      object dblcTurmas: TDBLookupComboBox
        Left = 5
        Top = 78
        Width = 228
        Height = 21
        KeyField = 'DS_TURMA'
        ListField = 'DS_TURMA'
        ListSource = dsTurmas
        TabOrder = 1
        OnCloseUp = dblcTurmasCloseUp
        OnKeyUp = dblcTurmasKeyUp
      end
      object chkSomenteAtivos: TCheckBox
        Left = 5
        Top = 105
        Width = 275
        Height = 17
        Caption = 'Considerar somente estudantes com situa'#231#227'o ATIVA'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkSomenteAtivosClick
      end
      object chkAgruparResp: TCheckBox
        Left = 5
        Top = 128
        Width = 203
        Height = 17
        Caption = 'Gerar um '#250'nico t'#237'tulo por respons'#225'vel'
        TabOrder = 3
      end
      object pnlTotalizacao: TPanel
        Left = 2
        Top = 140
        Width = 692
        Height = 39
        Align = alBottom
        AutoSize = True
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 4
        object lblTotalizacao: TLabel
          Left = 5
          Top = 5
          Width = 682
          Height = 13
          Align = alTop
          Caption = 'Selecionando pessoas. Aguarde...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          ExplicitWidth = 187
        end
        object bvlSep3: TBevel
          Left = 5
          Top = 18
          Width = 682
          Height = 3
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = 272
          ExplicitTop = 32
          ExplicitWidth = 50
        end
        object aniProgresso: TAnimate
          Left = 5
          Top = 21
          Width = 682
          Height = 13
          Align = alTop
          Center = False
          StopFrame = 14
          Visible = False
        end
      end
    end
    object gbInfo: TGroupBox
      Left = 5
      Top = 196
      Width = 696
      Height = 307
      Align = alClient
      Caption = 'Informa'#231#245'es do t'#237'tulo'
      TabOrder = 1
      object lblValorBruto: TLabel
        Left = 5
        Top = 107
        Width = 57
        Height = 13
        Caption = 'Valor bruto:'
        FocusControl = dbeValorBruto
      end
      object lblValorExtra: TLabel
        Left = 145
        Top = 107
        Width = 57
        Height = 13
        Caption = 'Valor extra:'
        FocusControl = dbeValorExtra
      end
      object lblValorDesc: TLabel
        Left = 285
        Top = 107
        Width = 104
        Height = 13
        Caption = 'Desconto condicional:'
        FocusControl = dbeValorDesc
      end
      object lblDescExtra: TLabel
        Left = 425
        Top = 107
        Width = 78
        Height = 13
        Caption = 'Desconto extra:'
        FocusControl = dbeDescExtra
      end
      object lblTiposTitulo: TLabel
        Left = 5
        Top = 21
        Width = 66
        Height = 13
        Caption = 'Tipo do t'#237'tulo:'
        FocusControl = dblcTiposTitulo
      end
      object lblCentroCusto: TLabel
        Left = 5
        Top = 64
        Width = 86
        Height = 13
        Caption = 'Centro de custos:'
        FocusControl = dblcCentroCustos
      end
      object lblPlanoContas: TLabel
        Left = 333
        Top = 64
        Width = 80
        Height = 13
        Caption = 'Plano de contas:'
        FocusControl = dblcPlanos
      end
      object lblHistorico: TLabel
        Left = 333
        Top = 21
        Width = 45
        Height = 13
        Caption = 'Hist'#243'rico:'
        FocusControl = dbeHistorico
      end
      object lblParcelaIni: TLabel
        Left = 5
        Top = 150
        Width = 67
        Height = 13
        Caption = 'Parcela inicial:'
        FocusControl = dbeParcelaIni
      end
      object lblParcelaFim: TLabel
        Left = 145
        Top = 150
        Width = 62
        Height = 13
        Caption = 'Parcela final:'
        FocusControl = dbeParcelaFim
      end
      object lblDataVencto: TLabel
        Left = 285
        Top = 150
        Width = 59
        Height = 13
        Caption = 'Vencimento:'
        FocusControl = dtpVencto
      end
      object dbeValorBruto: TDBEdit
        Left = 5
        Top = 123
        Width = 134
        Height = 21
        DataField = 'VL_BRUTO'
        DataSource = dsTitulo
        TabOrder = 6
        OnKeyPress = transformaPonto
      end
      object dbeValorExtra: TDBEdit
        Left = 145
        Top = 123
        Width = 134
        Height = 21
        DataField = 'VL_EXTRA'
        DataSource = dsTitulo
        TabOrder = 7
        OnKeyPress = transformaPonto
      end
      object dbeValorDesc: TDBEdit
        Left = 285
        Top = 123
        Width = 134
        Height = 21
        DataField = 'VL_DESCONTO'
        DataSource = dsTitulo
        TabOrder = 8
        OnKeyPress = transformaPonto
      end
      object dbeDescExtra: TDBEdit
        Left = 425
        Top = 123
        Width = 134
        Height = 21
        DataField = 'VL_DESC_EXTRA'
        DataSource = dsTitulo
        TabOrder = 9
        OnKeyPress = transformaPonto
      end
      object dblcTiposTitulo: TDBLookupComboBox
        Left = 5
        Top = 37
        Width = 308
        Height = 21
        DataField = 'DS_TIPO_TITULO'
        DataSource = dsTitulo
        TabOrder = 0
      end
      object dblcCentroCustos: TDBLookupComboBox
        Left = 52
        Top = 80
        Width = 261
        Height = 21
        DataField = 'DS_CENTRO'
        DataSource = dsTitulo
        TabOrder = 2
      end
      object dbeCentro: TDBEdit
        Left = 5
        Top = 80
        Width = 44
        Height = 21
        DataField = 'CD_CENTRO'
        DataSource = dsTitulo
        TabOrder = 1
      end
      object dblcPlanos: TDBLookupComboBox
        Left = 380
        Top = 80
        Width = 261
        Height = 21
        DataField = 'DS_PLANO'
        DataSource = dsTitulo
        TabOrder = 4
      end
      object dbePlano: TDBEdit
        Left = 333
        Top = 80
        Width = 44
        Height = 21
        DataField = 'CD_PLANO'
        DataSource = dsTitulo
        TabOrder = 3
      end
      object dbeHistorico: TDBEdit
        Left = 333
        Top = 37
        Width = 308
        Height = 21
        DataField = 'DS_HISTORICO'
        DataSource = dsTitulo
        TabOrder = 5
      end
      object dbeParcelaIni: TDBEdit
        Left = 5
        Top = 166
        Width = 134
        Height = 21
        DataField = 'NR_PARCELA_INI'
        DataSource = dsTitulo
        TabOrder = 10
      end
      object dbeParcelaFim: TDBEdit
        Left = 145
        Top = 166
        Width = 134
        Height = 21
        DataField = 'NR_PARCELA_FIM'
        DataSource = dsTitulo
        TabOrder = 11
      end
      object dtpVencto: TDateTimePicker
        Left = 285
        Top = 166
        Width = 134
        Height = 21
        Date = 41029.999988425920000000
        Time = 41029.999988425920000000
        TabOrder = 12
        OnChange = dtpVenctoChange
      end
      object rgOpcaoVencto: TRadioGroup
        Left = 5
        Top = 193
        Width = 554
        Height = 42
        Caption = 'Op'#231#245'es de vencimento'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'No dia selecionado'
          'Apenas em dias '#250'teis'
          'N'#227'o gerar em finais de semana')
        TabOrder = 13
      end
      object chkAjustar: TCheckBox
        Left = 5
        Top = 242
        Width = 209
        Height = 17
        Caption = 'Ajustar conforme cr'#233'ditos acad'#234'micos'
        TabOrder = 14
      end
      object chkNaoDuplicar: TCheckBox
        Left = 5
        Top = 264
        Width = 281
        Height = 17
        Caption = 'N'#227'o duplicar t'#237'tulos com o mesmo n'#250'mero de parcelas'
        TabOrder = 15
      end
    end
    object pnlBotoes: TPanel
      Left = 5
      Top = 503
      Width = 696
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object bbtnConfirmar: TBitBtn
        Left = 521
        Top = 3
        Width = 81
        Height = 25
        Caption = 'Confirmar'
        ModalResult = 1
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 608
        Top = 3
        Width = 81
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 21
    Width = 706
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label31: TLabel
      Left = 10
      Top = 12
      Width = 112
      Height = 13
      Align = alCustom
      Caption = 'Unidade de Ensino:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbUnidadeEnsino: TUMComboBox
      Left = 128
      Top = 10
      Width = 350
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = cbUnidadeEnsinoSelect
      TamanhoMaximo = 0
    end
  end
  object cdsTurmas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 120
    object cdsTurmasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Size = 50
    end
    object cdsTurmasNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object cdsTurmasDS_TURMA: TStringField
      FieldName = 'DS_TURMA'
      Size = 70
    end
    object cdsTurmasCD_CENTRO: TIntegerField
      FieldName = 'CD_CENTRO'
    end
  end
  object dsTurmas: TDataSource
    AutoEdit = False
    DataSet = cdsTurmas
    OnDataChange = dsTurmasDataChange
    Left = 416
    Top = 120
  end
  object qryTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_TIPO_TITULO'
    SQL.Strings = (
      'SELECT'
      '   CD_TIPO_TITULO,'
      '   DS_TIPO_TITULO,'
      '   CD_CONTA,'
      '   VL_PADRAO,'
      '   NR_PARCELA'
      'FROM'
      '   FIN_CONFIG_TIPOS_TITULO'
      'WHERE'
      '   CT_TIPO_TITULO = 1 AND'
      '   CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ'
      '   AND SN_ATIVO = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_TIPO_TITULO Asc'
    Left = 576
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    object qryTiposTituloCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTiposTituloDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      Size = 255
    end
    object qryTiposTituloCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object qryTiposTituloVL_PADRAO: TFloatField
      FieldName = 'VL_PADRAO'
    end
    object qryTiposTituloNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
  end
  object qryCentrosCusto: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_CENTRO'
    SQL.Strings = (
      'SELECT'
      '   CD_CENTRO,'
      '   DS_CENTRO,'
      '   SN_ATIVO,'
      '  cd_coligada_matriz'
      'FROM'
      '   FIN_CONFIG_CENTRO_CUSTOS'
      'WHERE'
      '   TP_CENTRO = 1 AND'
      '   SN_ATIVO = 1 AND'
      '   CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_CENTRO Asc'
    Left = 576
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    object qryCentrosCustoCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
      Required = True
    end
    object qryCentrosCustoDS_CENTRO: TStringField
      FieldName = 'DS_CENTRO'
      Size = 255
    end
    object qryCentrosCustoSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object qryCentrosCustocd_coligada_matriz: TIntegerField
      FieldName = 'cd_coligada_matriz'
      Required = True
    end
  end
  object qryPlanosConta: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_CONTA'
    SQL.Strings = (
      'SELECT'
      '   CD_CONTA,'
      '   DS_CONTA'
      'FROM'
      '   FIN_CONFIG_PLANO_CONTAS'
      'WHERE'
      '   TP_CONTA = 1 AND'
      '   TP_ENTRADA_SAIDA IN (0,1) AND'
      '   SN_ATIVO = 1 AND'
      '   CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_CONTA Asc'
    Left = 576
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    object qryPlanosContaCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object qryPlanosContaDS_CONTA: TStringField
      FieldName = 'DS_CONTA'
      Size = 255
    end
  end
  object cdsTitulo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 96
    object cdsTituloVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTituloVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTituloVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTituloVL_DESC_EXTRA: TCurrencyField
      FieldName = 'VL_DESC_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTituloCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
      OnChange = cdsTituloCD_TIPO_TITULOChange
    end
    object cdsTituloCD_CENTRO: TIntegerField
      FieldName = 'CD_CENTRO'
    end
    object cdsTituloCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
    end
    object cdsTituloDS_TIPO_TITULO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_TIPO_TITULO'
      LookupDataSet = qryTiposTitulo
      LookupKeyFields = 'CD_TIPO_TITULO'
      LookupResultField = 'DS_TIPO_TITULO'
      KeyFields = 'CD_TIPO_TITULO'
      Lookup = True
    end
    object cdsTituloDS_CENTRO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_CENTRO'
      LookupDataSet = qryCentrosCusto
      LookupKeyFields = 'CD_CENTRO'
      LookupResultField = 'DS_CENTRO'
      KeyFields = 'CD_CENTRO'
      Lookup = True
    end
    object cdsTituloDS_PLANO: TStringField
      FieldKind = fkLookup
      FieldName = 'DS_PLANO'
      LookupDataSet = qryPlanosConta
      LookupKeyFields = 'CD_CONTA'
      LookupResultField = 'DS_CONTA'
      KeyFields = 'CD_PLANO'
      Lookup = True
    end
    object cdsTituloNR_PARCELA_INI: TIntegerField
      FieldName = 'NR_PARCELA_INI'
    end
    object cdsTituloNR_PARCELA_FIM: TIntegerField
      FieldName = 'NR_PARCELA_FIM'
    end
    object cdsTituloDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Size = 255
    end
    object cdsTituloDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
    end
  end
  object dsTitulo: TDataSource
    DataSet = cdsTitulo
    Left = 328
    Top = 56
  end
  object qrySelecao: TUMZReadOnlyQuery
    Connection = DM.db
    OnCalcFields = qrySelecaoCalcFields
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   M.CODIGOALUNO,'
      '   P.CD_RESP_FINAN,'
      '   P.CD_PESSOA,'
      '   M.TURMA,'
      '   M.CURSO,'
      '   M.ANOSEMESTRE,'
      '   C.CD_DEPTO,'
      '   M.SITUACAO'
      'FROM'
      '   MATRICULAS M'
      '      JOIN PESSOAS P ON'
      '         (M.CODIGOALUNO = P.CD_PESSOA)'
      '      JOIN TURMAS T ON'
      '         (M.ANOSEMESTRE = T.ANOSEMESTRE) AND'
      '         (M.TURMA = T.CODIGO)      '
      '      JOIN CURSOS_COLIGADAS C ON'
      '         (M.CURSO = C.CD_CURSO) AND'
      '         (T.CD_COLIGADA = C.CD_COLIGADA)'
      'WHERE'
      '   M.ANOSEMESTRE = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qrySelecaoCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
      Required = True
    end
    object qrySelecaoCD_RESP_FINAN: TIntegerField
      FieldName = 'CD_RESP_FINAN'
    end
    object qrySelecaoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qrySelecaoTURMA: TStringField
      FieldName = 'TURMA'
      Required = True
      Size = 50
    end
    object qrySelecaoCURSO: TStringField
      FieldName = 'CURSO'
      Size = 15
    end
    object qrySelecaoANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object qrySelecaoCD_DEPTO: TSmallintField
      FieldName = 'CD_DEPTO'
      Required = True
    end
    object qrySelecaoSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object qrySelecaoCD_RESPONSAVEL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CD_RESPONSAVEL'
      Calculated = True
    end
  end
  object qryTurmasPessoa: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TURMA,'
      '   ANOSEMESTRE,'
      '   CD_CENTRO,'
      '   SITUACAO'
      'FROM'
      '('
      'SELECT DISTINCT'
      '   M.TURMA,'
      '   M.ANOSEMESTRE,'
      '   T.CD_CENTRO,'
      '   '#39'ignorar'#39' AS situacao'
      'FROM'
      '   MENSALIDADES M'
      ''
      '      JOIN TURMAS T ON'
      '         (M.TURMA = T.CODIGO) AND'
      '         (M.ANOSEMESTRE = T.ANOSEMESTRE)'
      'WHERE'
      '   M.CODIGOALUNO = :CD_PESSOA'
      'UNION'
      'SELECT DISTINCT'
      '   M.TURMA,'
      '   M.ANOSEMESTRE,'
      '   T.CD_CENTRO,'
      '   M.situacao'
      'FROM'
      '   MATRICULAS M'
      '   '
      '      JOIN TURMAS T ON'
      '         (M.TURMA = T.CODIGO) AND'
      '         (M.ANOSEMESTRE = T.ANOSEMESTRE)'
      'WHERE'
      '   M.CODIGOALUNO = :CD_PESSOA'
      ') T'
      'WHERE'
      '    t.situacao <> '#39'ignorar'#39
      'ORDER BY anosemestre DESC, CASE SITUACAO'
      '    WHEN 1 THEN 5'
      '    WHEN 0 THEN 4'
      '    WHEN 9 THEN 3'
      '    WHEN 2 THEN 2'
      '    WHEN 10 THEN 1'
      '    ELSE 0'
      'END DESC;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryTurmasPessoaTURMA: TStringField
      FieldName = 'TURMA'
      ReadOnly = True
      Size = 50
    end
    object qryTurmasPessoaANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      ReadOnly = True
    end
    object qryTurmasPessoaCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
      ReadOnly = True
    end
  end
  object cdsResponsaveis: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 272
    object cdsResponsaveisCD_RESP_FINAN: TIntegerField
      FieldName = 'CD_RESP_FINAN'
    end
    object cdsResponsaveisNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object cdsResponsaveisCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Size = 50
    end
    object cdsResponsaveisNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsResponsaveisCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
  end
  object qryPessoa: TUMZReadOnlyQuery
    Connection = DM.db
    OnCalcFields = qryPessoaCalcFields
    SQL.Strings = (
      'SELECT'
      '   CD_RESP_FINAN,'
      '   CD_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaCD_RESP_FINAN: TIntegerField
      FieldName = 'CD_RESP_FINAN'
    end
    object qryPessoaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryPessoaCD_RESPONSAVEL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CD_RESPONSAVEL'
      Calculated = True
    end
  end
end
