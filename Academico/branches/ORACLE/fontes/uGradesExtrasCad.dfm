object FrmGradesExtraCad: TFrmGradesExtraCad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Grades Extras'
  ClientHeight = 573
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 486
    Height = 10
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 483
  end
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 60
    Height = 13
    Caption = 'C'#243'd. Pessoa'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 144
    Top = 45
    Width = 94
    Height = 13
    Caption = 'Nome do Estudante'
    FocusControl = DBLookupComboBox1
  end
  object Label3: TLabel
    Left = 16
    Top = 91
    Width = 28
    Height = 13
    Caption = 'Curso'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 176
    Top = 91
    Width = 43
    Height = 13
    Caption = 'Ano/Sem'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 327
    Top = 91
    Width = 28
    Height = 13
    Caption = 'Etapa'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 144
    Top = 134
    Width = 45
    Height = 13
    Caption = 'Atividade'
    FocusControl = DBLookupComboBox2
  end
  object Label7: TLabel
    Left = 16
    Top = 134
    Width = 67
    Height = 13
    Caption = 'C'#243'd Atividade'
    FocusControl = DBEdit5
  end
  object Label8: TLabel
    Left = 16
    Top = 179
    Width = 89
    Height = 13
    Caption = 'T'#237'tulo da Atividade'
    FocusControl = DBEdit6
  end
  object Label9: TLabel
    Left = 16
    Top = 412
    Width = 70
    Height = 13
    Caption = 'Horas originais'
    FocusControl = DBEdit7
  end
  object Label10: TLabel
    Left = 208
    Top = 412
    Width = 93
    Height = 13
    Caption = 'Local de Realiza'#231#227'o'
    FocusControl = DBEdit8
  end
  object Label11: TLabel
    Left = 16
    Top = 455
    Width = 51
    Height = 13
    Caption = 'Data In'#237'cio'
    FocusControl = DBEdit9
  end
  object Label12: TLabel
    Left = 112
    Top = 455
    Width = 64
    Height = 13
    Caption = 'Data T'#233'rmino'
    FocusControl = DBEdit10
  end
  object btnCurso: TSpeedButton
    Left = 134
    Top = 107
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
  object btnCodigoAluno: TSpeedButton
    Left = 107
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
    OnClick = btnCodigoAlunoClick
  end
  object Label13: TLabel
    Left = 16
    Top = 224
    Width = 38
    Height = 13
    Caption = 'Resumo'
    FocusControl = DBEdit5
  end
  object lblAnexar: TLabel
    Left = 16
    Top = 367
    Width = 74
    Height = 13
    Caption = 'Anexar arquivo'
  end
  object sbAnexo: TSpeedButton
    Left = 288
    Top = 384
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
    OnClick = sbAnexoClick
  end
  object sbDownloadAnexo: TSpeedButton
    Left = 345
    Top = 384
    Width = 23
    Height = 22
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
    OnClick = sbDownloadAnexoClick
  end
  object sbRemoverAnexo: TSpeedButton
    Left = 316
    Top = 384
    Width = 23
    Height = 22
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
    OnClick = sbRemoverAnexoClick
  end
  object Label14: TLabel
    Left = 112
    Top = 411
    Width = 84
    Height = 13
    Caption = 'Horas (deferidas)'
    FocusControl = DBEdit7
  end
  object lbMensagemHoras: TLabel
    Left = 16
    Top = 500
    Width = 445
    Height = 26
    Caption = 
      'ATEN'#199#195'O: As horas (deferidas) ultrapassaram a quantidade de hora' +
      's m'#225'xima permitida. Foi ajustado para para que sejam deferidas a' +
      'penas as horas restantes.'
    FocusControl = DBEdit9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Label15: TLabel
    Left = 208
    Top = 455
    Width = 45
    Height = 13
    Caption = 'Situa'#231#227'o:'
    FocusControl = DBEdit10
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GRADES EXTRAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
  end
  object btnCancelar: TBitBtn
    Left = 272
    Top = 538
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 16
    OnClick = btnCancelarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnConfirmar: TBitBtn
    Left = 361
    Top = 538
    Width = 107
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 15
    OnClick = btnConfirmarClick
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
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 64
    Width = 91
    Height = 21
    DataField = 'cd_pessoa'
    DataSource = dsExtraAluno
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 144
    Top = 64
    Width = 325
    Height = 21
    DataField = 'DesPessoa'
    DataSource = dsExtraAluno
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 107
    Width = 117
    Height = 21
    DataField = 'cd_curso'
    DataSource = dsExtraAluno
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 173
    Top = 107
    Width = 134
    Height = 21
    DataField = 'nr_anosem'
    DataSource = dsExtraAluno
    TabOrder = 3
    OnEnter = DBEdit3Enter
    OnKeyDown = DBEdit3KeyDown
  end
  object DBEdit4: TDBEdit
    Left = 327
    Top = 107
    Width = 141
    Height = 21
    DataField = 'nr_etapa'
    DataSource = dsExtraAluno
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 144
    Top = 150
    Width = 324
    Height = 21
    DataField = 'descAtividade'
    DataSource = dsExtraAluno
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 16
    Top = 150
    Width = 117
    Height = 21
    DataField = 'cd_ge_atividade'
    DataSource = dsExtraAluno
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 16
    Top = 195
    Width = 453
    Height = 21
    DataField = 'ds_atividade'
    DataSource = dsExtraAluno
    TabOrder = 7
  end
  object DBEdit7: TDBEdit
    Left = 16
    Top = 429
    Width = 74
    Height = 21
    DataField = 'nr_horas_original'
    DataSource = dsExtraAluno
    TabOrder = 10
    OnExit = copiarHorasDeferidas
  end
  object DBEdit8: TDBEdit
    Left = 208
    Top = 429
    Width = 260
    Height = 21
    DataField = 'ds_local'
    DataSource = dsExtraAluno
    TabOrder = 12
  end
  object DBEdit9: TDBEdit
    Left = 16
    Top = 471
    Width = 74
    Height = 21
    DataField = 'dt_inicio'
    DataSource = dsExtraAluno
    TabOrder = 13
  end
  object DBEdit10: TDBEdit
    Left = 112
    Top = 471
    Width = 74
    Height = 21
    DataField = 'dt_termino'
    DataSource = dsExtraAluno
    TabOrder = 14
  end
  object DBMemo1: TDBMemo
    Left = 16
    Top = 240
    Width = 452
    Height = 120
    DataField = 'ds_resumo'
    DataSource = dsExtraAluno
    TabOrder = 8
  end
  object edAnexar: TEdit
    Left = 16
    Top = 384
    Width = 266
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 112
    Top = 429
    Width = 74
    Height = 21
    DataField = 'nr_horas'
    DataSource = dsExtraAluno
    TabOrder = 11
    OnExit = VerificarHorasDeferidas
  end
  object cbSituacao: TUMComboBox
    Left = 208
    Top = 471
    Width = 260
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 18
    OnChange = cbSituacaoChange
    Items.Strings = (
      'Em aberto'
      'Deferido'
      'Indeferido')
    TamanhoMaximo = 0
  end
  object qyExtraAluno: TUMZQuery
    Connection = DM.db
    BeforeOpen = qyExtraAlunoBeforeOpen
    SQL.Strings = (
      'SELECT '
      '   * '
      'FROM ge_alunos'
      'WHERE'
      '   cd_ge_aluno = :cd_ge_aluno'
      '   ')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_ge_aluno'
        ParamType = ptUnknown
      end>
    Left = 14
    Top = 534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_ge_aluno'
        ParamType = ptUnknown
      end>
    object qyExtraAlunocd_curso: TStringField
      DisplayLabel = 'Curso'
      FieldName = 'cd_curso'
      Origin = 'WMESTRE12.ge_alunos.cd_curso'
      Size = 15
    end
    object qyExtraAlunodescAtividade: TStringField
      DisplayLabel = 'Atividade'
      FieldKind = fkLookup
      FieldName = 'descAtividade'
      LookupDataSet = qyAtividades
      LookupKeyFields = 'cd_ge_atividade'
      LookupResultField = 'ds_ge_atividade'
      KeyFields = 'cd_ge_atividade'
      Lookup = True
    end
    object qyExtraAlunonr_horas: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'nr_horas'
      Origin = 'WMESTRE12.ge_alunos.nr_horas'
    end
    object qyExtraAlunonr_horas_original: TFloatField
      FieldName = 'nr_horas_original'
    end
    object qyExtraAlunods_local: TStringField
      DisplayLabel = 'Local de Realiza'#231#227'o'
      FieldName = 'ds_local'
      Origin = 'WMESTRE12.ge_alunos.ds_local'
      Size = 100
    end
    object qyExtraAlunodt_inicio: TDateTimeField
      DisplayLabel = 'Data In'#237'cio'
      DisplayWidth = 18
      FieldName = 'dt_inicio'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyExtraAlunodt_termino: TDateTimeField
      DisplayLabel = 'Data T'#233'rmino'
      FieldName = 'dt_termino'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qyExtraAlunoDesPessoa: TStringField
      DisplayLabel = 'Nome do Estudante'
      FieldKind = fkLookup
      FieldName = 'DesPessoa'
      LookupDataSet = qyPessoas
      LookupKeyFields = 'cd_pessoa'
      LookupResultField = 'nm_pessoa'
      KeyFields = 'cd_pessoa'
      Size = 100
      Lookup = True
    end
    object qyExtraAlunods_atividade: TStringField
      FieldName = 'ds_atividade'
      Origin = 'WMESTRE12.ge_alunos.ds_atividade'
      Size = 255
    end
    object qyExtraAlunocd_ge_aluno: TLargeintField
      DisplayLabel = 'C'#243'd. '
      FieldName = 'cd_ge_aluno'
    end
    object qyExtraAlunocd_pessoa: TLargeintField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'cd_pessoa'
    end
    object qyExtraAlunonr_anosem: TIntegerField
      DisplayLabel = 'Ano/Sem'
      FieldName = 'nr_anosem'
      DisplayFormat = '0000/0'
    end
    object qyExtraAlunocd_ge_atividade: TLargeintField
      DisplayLabel = 'C'#243'd Atividade'
      FieldName = 'cd_ge_atividade'
    end
    object qyExtraAlunonr_etapa: TIntegerField
      DisplayLabel = 'Etapa'
      FieldName = 'nr_etapa'
    end
    object qyExtraAlunocd_situacao: TSmallintField
      FieldName = 'cd_situacao'
      Required = True
    end
    object qyExtraAlunods_resumo: TMemoField
      FieldName = 'ds_resumo'
      BlobType = ftMemo
    end
  end
  object dsExtraAluno: TDataSource
    DataSet = qyExtraAluno
    OnDataChange = dsExtraAlunoDataChange
    Left = 46
    Top = 534
  end
  object qyAtividades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   * '
      'FROM ge_atividades'
      'ORDER BY ds_ge_atividade'
      '   ')
    Params = <>
    Left = 94
    Top = 534
    object qyAtividadesds_ge_atividade: TStringField
      FieldName = 'ds_ge_atividade'
      Origin = 'WMESTRE12.ge_atividades.ds_ge_atividade'
      Size = 100
    end
    object qyAtividadesnr_horas: TFloatField
      FieldName = 'nr_horas'
      Origin = 'WMESTRE12.ge_atividades.nr_horas'
    end
    object qyAtividadescd_ge_atividade: TLargeintField
      FieldName = 'cd_ge_atividade'
      Required = True
    end
    object qyAtividadescd_ge_grupo: TLargeintField
      FieldName = 'cd_ge_grupo'
    end
  end
  object dsAtividades: TDataSource
    DataSet = qyAtividades
    Left = 126
    Top = 534
  end
  object qyPessoas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   cd_pessoa, nm_pessoa '
      'FROM '
      '   pessoas pe')
    Params = <>
    Left = 174
    Top = 534
    object qyPessoascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object qyPessoasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
  end
  object dsPessoas: TDataSource
    DataSet = qyPessoas
    Left = 206
    Top = 534
  end
  object opnBuscaArquivo: TOpenDialog
    Filter = 
      'Documento do Word (doc)|*.doc|Documento do Word (docx)|*.docx|Do' +
      'cumento PDF|*.pdf|Imagem JPG|*.jpg|Imagem JPEG|*.jpeg|Imagem BMP' +
      '|*.bmp'
    Left = 384
    Top = 368
  end
  object qryArquivo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_ge_aluno_anexo,'
      '  cd_ge_aluno,'
      '  mb_anexo,'
      '  nm_original,'
      '  ds_tamanho'
      'FROM'
      '  ge_alunos_anexo'
      'WHERE'
      '  cd_ge_aluno = :cd_ge_aluno')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_ge_aluno'
        ParamType = ptUnknown
      end>
    Left = 448
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_ge_aluno'
        ParamType = ptUnknown
      end>
    object qryArquivocd_ge_aluno_anexo: TIntegerField
      FieldName = 'cd_ge_aluno_anexo'
    end
    object qryArquivocd_ge_aluno: TIntegerField
      FieldName = 'cd_ge_aluno'
    end
    object qryArquivomb_anexo: TMemoField
      FieldName = 'mb_anexo'
      BlobType = ftMemo
    end
    object qryArquivonm_original: TStringField
      FieldName = 'nm_original'
      Size = 100
    end
    object qryArquivods_tamanho: TStringField
      FieldName = 'ds_tamanho'
      Size = 30
    end
  end
  object svrArquivo: TSaveDialog
    Filter = 
      'Documento do Word (*.doc)|*.doc|Documento do Word (*.docx)|*.doc' +
      'x|Documento PDF (*.pdf)|*.pdf|Imagem JPG (*.jpg)|*.jpg|Imagem JP' +
      'EG (*.jpeg)|*.jpeg|Imagem BMP (*.bmp)|*.bmp'
    Left = 416
    Top = 368
  end
end
