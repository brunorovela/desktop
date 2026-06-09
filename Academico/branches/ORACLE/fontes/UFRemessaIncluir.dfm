object frmRemessaIncluir: TfrmRemessaIncluir
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gerar Remessa'
  ClientHeight = 386
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 6
  Padding.Top = 3
  Padding.Right = 6
  Padding.Bottom = 6
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 6
    Top = 3
    Width = 641
    Height = 325
    Align = alTop
    AutoSize = True
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object bvlTitulo: TBevel
      Left = 7
      Top = 7
      Width = 627
      Height = 19
      Align = alTop
      ExplicitLeft = 312
      ExplicitTop = 48
      ExplicitWidth = 50
    end
    object lblCurso: TLabel
      Left = 12
      Top = 76
      Width = 28
      Height = 13
      Caption = 'Curso'
      FocusControl = edtCurso
    end
    object lblTurma: TLabel
      Left = 12
      Top = 116
      Width = 30
      Height = 13
      Caption = 'Turma'
      FocusControl = edtTurma
    end
    object lblAluno: TLabel
      Left = 12
      Top = 156
      Width = 27
      Height = 13
      Caption = 'Aluno'
      FocusControl = edtAluno
    end
    object lblVencimento: TLabel
      Left = 12
      Top = 196
      Width = 55
      Height = 13
      Caption = 'Vencimento'
      FocusControl = dtpVenctoDe
    end
    object lblVenctoAte: TLabel
      Left = 143
      Top = 216
      Width = 16
      Height = 13
      Caption = 'at'#233
      FocusControl = dtpVenctoAte
    end
    object lblEmissao: TLabel
      Left = 12
      Top = 236
      Width = 38
      Height = 13
      Caption = 'Emiss'#227'o'
      FocusControl = dtpEmissaoDe
    end
    object lblEmissaoAte: TLabel
      Left = 143
      Top = 256
      Width = 16
      Height = 13
      Caption = 'at'#233
      FocusControl = dtpEmissaoAte
    end
    object lblTipoTitulo: TLabel
      Left = 331
      Top = 76
      Width = 62
      Height = 13
      Caption = 'Tipo de t'#237'tulo'
      FocusControl = clbTiposTitulo
    end
    object lblAcao: TLabel
      Left = 331
      Top = 236
      Width = 82
      Height = 13
      Caption = 'A'#231#227'o de remessa'
      FocusControl = dblcAcoes
    end
    object sbCurso: TSpeedButton
      Left = 293
      Top = 92
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
      OnClick = sbCursoClick
    end
    object sbTurma: TSpeedButton
      Left = 293
      Top = 132
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
      OnClick = sbTurmaClick
    end
    object sbAluno: TSpeedButton
      Left = 293
      Top = 172
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
      OnClick = sbAlunoClick
    end
    object lblFiltros: TLabel
      Left = 12
      Top = 9
      Width = 35
      Height = 13
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbMarcarTudo: TSpeedButton
      Left = 612
      Top = 92
      Width = 23
      Height = 22
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
      OnClick = sbMarcarTudoClick
    end
    object sbDesmarcarTudo: TSpeedButton
      Left = 612
      Top = 117
      Width = 23
      Height = 22
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
      OnClick = sbDesmarcarTudoClick
    end
    object lblParcelaAte: TLabel
      Left = 79
      Top = 299
      Width = 16
      Height = 13
      Caption = 'at'#233
      FocusControl = speParcelaAte
    end
    object bvlSep1: TBevel
      Left = 322
      Top = 32
      Width = 3
      Height = 286
      Shape = bsLeftLine
    end
    object meAnoSemestre: TMaskEdit
      Left = 12
      Top = 52
      Width = 48
      Height = 21
      EditMask = '9999/9;0;_'
      MaxLength = 6
      TabOrder = 1
    end
    object ubAnoSemestre: TUpDown
      Left = 60
      Top = 52
      Width = 17
      Height = 21
      Min = -100
      TabOrder = 2
      OnClick = ubAnoSemestreClick
    end
    object edtCurso: TEdit
      Left = 12
      Top = 92
      Width = 278
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edtTurma: TEdit
      Left = 12
      Top = 132
      Width = 278
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object edtAluno: TEdit
      Left = 12
      Top = 172
      Width = 278
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object dtpVenctoDe: TDateTimePicker
      Left = 12
      Top = 212
      Width = 128
      Height = 21
      Date = 42948.000000000000000000
      Time = 42948.000000000000000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 6
      OnChange = dtpVenctoDeChange
    end
    object dtpEmissaoAte: TDateTimePicker
      Left = 162
      Top = 252
      Width = 128
      Height = 21
      Date = 42948.999988425920000000
      Time = 42948.999988425920000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 9
      OnChange = dtpEmissaoAteChange
    end
    object dblcAcoes: TDBLookupComboBox
      Left = 331
      Top = 252
      Width = 278
      Height = 21
      KeyField = 'CD_ACAO'
      ListField = 'DS_ACAO'
      ListSource = dsAcoes
      TabOrder = 13
    end
    object chkReservas: TCheckBox
      Left = 331
      Top = 276
      Width = 209
      Height = 17
      Caption = 'Incluir reservas como pendentes'
      TabOrder = 14
    end
    object chkAnoSemestre: TCheckBox
      Left = 12
      Top = 32
      Width = 88
      Height = 17
      Caption = 'Ano/Semestre'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object dtpEmissaoDe: TDateTimePicker
      Left = 12
      Top = 252
      Width = 128
      Height = 21
      Date = 42948.000000000000000000
      Time = 42948.000000000000000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 8
      OnChange = dtpEmissaoDeChange
    end
    object dtpVenctoAte: TDateTimePicker
      Left = 162
      Top = 213
      Width = 128
      Height = 21
      Date = 42948.999988425920000000
      Time = 42948.999988425920000000
      ShowCheckbox = True
      Checked = False
      TabOrder = 7
      OnChange = dtpVenctoAteChange
    end
    object clbTiposTitulo: TCheckListBox
      Left = 331
      Top = 92
      Width = 278
      Height = 142
      ItemHeight = 13
      TabOrder = 12
    end
    object chkParcelas: TCheckBox
      Left = 12
      Top = 276
      Width = 65
      Height = 17
      Caption = 'Parcelas'
      TabOrder = 15
      OnClick = chkParcelasClick
    end
    object speParcelaDe: TSpinEdit
      Left = 12
      Top = 296
      Width = 64
      Height = 22
      Enabled = False
      MaxValue = 999
      MinValue = 0
      TabOrder = 10
      Value = 1
    end
    object speParcelaAte: TSpinEdit
      Left = 98
      Top = 296
      Width = 64
      Height = 22
      Enabled = False
      MaxValue = 999
      MinValue = 0
      TabOrder = 11
      Value = 1
    end
  end
  object bbtnSalvar: TBitBtn
    Left = 494
    Top = 331
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 2
    Kind = bkOK
  end
  object bbtnCancelar: TBitBtn
    Left = 572
    Top = 331
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object stbStatus: TStatusBar
    Left = 6
    Top = 361
    Width = 641
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object prbProgresso: TProgressBar
    Left = 313
    Top = 338
    Width = 150
    Height = 17
    Smooth = True
    Step = 1
    TabOrder = 5
    Visible = False
  end
  object bbtnLimpar: TBitBtn
    Left = 6
    Top = 331
    Width = 104
    Height = 25
    Caption = 'Limpar filtros'
    TabOrder = 1
    OnClick = bbtnLimparClick
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
  end
  object qryAcoes: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_ACAO'
    SQL.Strings = (
      'SELECT'
      '  CD_ACAO,'
      '  DS_ACAO,'
      '  DS_CHAVE'
      'FROM'
      '  REM_ACOES'
      'WHERE'
      '  DS_CHAVE IN ('#39'incluir_dda'#39', '#39'cancelar_dda'#39')')
    Params = <>
    IndexFieldNames = 'DS_ACAO Asc'
    Left = 144
    Top = 56
    object qryAcoesCD_ACAO: TIntegerField
      FieldName = 'CD_ACAO'
      Required = True
    end
    object qryAcoesDS_ACAO: TStringField
      FieldName = 'DS_ACAO'
      Required = True
      Size = 255
    end
    object qryAcoesDS_CHAVE: TStringField
      FieldName = 'DS_CHAVE'
      Required = True
      Size = 255
    end
  end
  object dsAcoes: TDataSource
    DataSet = qryAcoes
    OnDataChange = dsAcoesDataChange
    Left = 176
    Top = 56
  end
  object qryTiposTitulo: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_TIPO_TITULO'
    SQL.Strings = (
      'SELECT'
      #9'CD_TIPO_TITULO,'
      #9'DS_TIPO_TITULO'
      'FROM'
      #9'FIN_CONFIG_TIPOS_TITULO'
      'WHERE'
      #9'CT_TIPO_TITULO = 1 AND'
      #9'SN_ATIVO = 1 AND'
      #9'CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'DS_TIPO_TITULO Asc'
    Left = 144
    Top = 24
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
  end
end
