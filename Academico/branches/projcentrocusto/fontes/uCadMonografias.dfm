object formCadMonografias: TformCadMonografias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Monografias'
  ClientHeight = 690
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbCurso: TSpeedButton
    Left = 671
    Top = 68
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
    OnClick = sbCursoClick
  end
  object lbCurso: TLabel
    Left = 366
    Top = 49
    Width = 28
    Height = 13
    Caption = 'Curso'
  end
  object sbTurma: TSpeedButton
    Left = 671
    Top = 114
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
    OnClick = sbTurmaClick
  end
  object lbTurma: TLabel
    Left = 369
    Top = 97
    Width = 30
    Height = 13
    Caption = 'Turma'
  end
  object sbAluno: TSpeedButton
    Left = 315
    Top = 68
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
    OnClick = sbAlunoClick
  end
  object lbAluno: TLabel
    Left = 30
    Top = 49
    Width = 27
    Height = 13
    Caption = 'Aluno'
  end
  object lbIdeiaInicial: TLabel
    Left = 30
    Top = 146
    Width = 54
    Height = 13
    Caption = 'Id'#233'ia Inicial'
  end
  object lbTema: TLabel
    Left = 367
    Top = 146
    Width = 26
    Height = 13
    Caption = 'Tema'
  end
  object lbOrientadorAceitou: TLabel
    Left = 30
    Top = 361
    Width = 91
    Height = 13
    Caption = 'Orientador Aceitou'
  end
  object lbNotaConceito: TLabel
    Left = 215
    Top = 407
    Width = 69
    Height = 13
    Caption = 'Nota/Conceito'
  end
  object lbSituacaoResultado: TLabel
    Left = 30
    Top = 407
    Width = 92
    Height = 13
    Caption = 'Situa'#231#227'o Resultado'
  end
  object lbObservacoes: TLabel
    Left = 32
    Top = 546
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object lbValorPago: TLabel
    Left = 548
    Top = 407
    Width = 51
    Height = 13
    Caption = 'Valor Pago'
  end
  object tlbFormaEnvio: TLabel
    Left = 366
    Top = 407
    Width = 74
    Height = 13
    Caption = 'Forma de Envio'
  end
  object lbDataInicio: TLabel
    Left = 216
    Top = 360
    Width = 51
    Height = 13
    Caption = 'Data In'#237'cio'
  end
  object lbDataEntrega: TLabel
    Left = 367
    Top = 361
    Width = 64
    Height = 13
    Caption = 'Data Entrega'
  end
  object lbOrientador: TLabel
    Left = 30
    Top = 95
    Width = 52
    Height = 13
    Caption = 'Orientador'
  end
  object sbtOrientador: TSpeedButton
    Left = 315
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
    OnClick = sbtOrientadorClick
  end
  object Label1: TLabel
    Left = 31
    Top = 2
    Width = 109
    Height = 13
    Caption = #193'rea de Conhecimento'
  end
  object Label2: TLabel
    Left = 592
    Top = 1
    Width = 68
    Height = 13
    Caption = 'Ano/Semestre'
  end
  object Label3: TLabel
    Left = 548
    Top = 361
    Width = 103
    Height = 13
    Caption = 'Data Pag. Orientador'
  end
  object Label4: TLabel
    Left = 368
    Top = 272
    Width = 150
    Height = 13
    Caption = 'Data de envio para o professor'
  end
  object lbRetorno: TLabel
    Left = 548
    Top = 272
    Width = 141
    Height = 13
    Caption = 'Data de retorno do professor'
  end
  object Label6: TLabel
    Left = 32
    Top = 315
    Width = 93
    Height = 13
    Caption = 'Data do Certificado'
  end
  object Label7: TLabel
    Left = 216
    Top = 315
    Width = 93
    Height = 13
    Caption = 'Data de Aprova'#231#227'o'
  end
  object Label8: TLabel
    Left = 368
    Top = 315
    Width = 170
    Height = 13
    Caption = 'Data de Impress'#227'o da Monografia. '
  end
  object lblSolicitacaoCertificado: TLabel
    Left = 32
    Top = 453
    Width = 120
    Height = 13
    Caption = 'Solicita'#231#227'o do Certificado'
  end
  object lblRecebimentoCertificado: TLabel
    Left = 216
    Top = 454
    Width = 132
    Height = 13
    Caption = 'Recebimento do Certificado'
  end
  object lblRecebimentoAta: TLabel
    Left = 369
    Top = 454
    Width = 100
    Height = 13
    Caption = 'Recebimento da ATA'
  end
  object lblRecebimentoArtigo: TLabel
    Left = 548
    Top = 454
    Width = 109
    Height = 13
    Caption = 'Recebimento do Artigo'
  end
  object Label5: TLabel
    Left = 32
    Top = 500
    Width = 108
    Height = 13
    Caption = 'Unidade Certificadora:'
  end
  object dbeCurso: TDBEdit
    Left = 399
    Top = 43
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    DataField = 'cd_curso'
    DataSource = formMonografias.dsMonografia
    TabOrder = 43
    Visible = False
  end
  object dbeTurma: TDBEdit
    Left = 367
    Top = 114
    Width = 298
    Height = 21
    CharCase = ecUpperCase
    DataField = 'cd_turma'
    DataSource = formMonografias.dsMonografia
    Enabled = False
    TabOrder = 5
    OnChange = dbeTurmaChange
  end
  object dbeAluno: TDBEdit
    Left = 63
    Top = 45
    Width = 23
    Height = 21
    CharCase = ecUpperCase
    DataField = 'cd_pessoa'
    DataSource = formMonografias.dsMonografia
    TabOrder = 44
    Visible = False
  end
  object dbmIdeiaInicial: TDBMemo
    Left = 30
    Top = 165
    Width = 318
    Height = 89
    Hint = 
      'Texto inicial produzido pelo aluno para demonstrar id'#233'ia inicial' +
      ' ao orientador.'
    HelpType = htKeyword
    DataField = 'ds_ideia_inicial'
    DataSource = formMonografias.dsMonografia
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object dbmTema: TDBMemo
    Left = 367
    Top = 165
    Width = 337
    Height = 89
    Hint = 'Descri'#231#227'o final do tema da monografia.'
    DataField = 'ds_tema'
    DataSource = formMonografias.dsMonografia
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object dbeNotaConceito: TDBEdit
    Left = 215
    Top = 426
    Width = 68
    Height = 21
    DataField = 'ds_nota_conceito'
    DataSource = formMonografias.dsMonografia
    TabOrder = 28
  end
  object dbmObservacoes: TDBMemo
    Left = 31
    Top = 565
    Width = 673
    Height = 65
    DataField = 'ds_observacao'
    DataSource = formMonografias.dsMonografia
    ScrollBars = ssVertical
    TabOrder = 39
  end
  object dbeValor: TDBEdit
    Left = 548
    Top = 426
    Width = 121
    Height = 21
    Hint = 'Valor pago a orienta'#231#227'o.'
    DataField = 'vl_pago'
    DataSource = formMonografias.dsMonografia
    ParentShowHint = False
    ShowHint = False
    TabOrder = 30
  end
  object btnCancel: TBitBtn
    Left = 566
    Top = 649
    Width = 112
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 42
    OnClick = btnCancelClick
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
  object btnOk: TBitBtn
    Left = 437
    Top = 649
    Width = 114
    Height = 25
    Caption = 'Ok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 41
    OnClick = btnOkClick
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
  object dtpDataInicio: TDateTimePicker
    Left = 282
    Top = 380
    Width = 21
    Height = 21
    Date = 39903.732651909720000000
    Time = 39903.732651909720000000
    TabOrder = 22
    OnChange = dtpDataInicioChange
  end
  object dbeDataInicio: TDBEdit
    Left = 273
    Top = 356
    Width = 28
    Height = 21
    Hint = 
      'Data de In'#237'cio da Orienta'#231#227'o (data que professor aceitou orienta' +
      #231#227'o)'
    DataField = 'dt_inicio'
    DataSource = formMonografias.dsMonografia
    TabOrder = 45
    Visible = False
  end
  object dbeDataEntrega: TDBEdit
    Left = 437
    Top = 356
    Width = 25
    Height = 21
    Hint = 'Data que aluno entregou monografia.'
    DataField = 'dt_entrega'
    DataSource = formMonografias.dsMonografia
    TabOrder = 46
    Visible = False
  end
  object dtpDataEntrega: TDateTimePicker
    Left = 442
    Top = 380
    Width = 21
    Height = 21
    Date = 39903.732651909720000000
    Time = 39903.732651909720000000
    TabOrder = 24
    OnChange = dtpDataEntregaChange
  end
  object edtCurso: TEdit
    Left = 366
    Top = 70
    Width = 299
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edtAluno: TEdit
    Left = 30
    Top = 68
    Width = 279
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object dblSituacaoResultado: TDBLookupComboBox
    Left = 30
    Top = 426
    Width = 179
    Height = 21
    DataField = 'ds_situacao'
    DataSource = formMonografias.dsMonografia
    TabOrder = 27
  end
  object DBEdit1: TDBEdit
    Left = 86
    Top = 91
    Width = 23
    Height = 21
    CharCase = ecUpperCase
    DataField = 'cd_orientador'
    DataSource = formMonografias.dsMonografia
    TabOrder = 47
    Visible = False
  end
  object edtOrientador: TEdit
    Left = 30
    Top = 114
    Width = 280
    Height = 21
    Hint = 'Selecione o professor a orientar esta monografia.'
    HelpType = htKeyword
    Enabled = False
    TabOrder = 4
  end
  object dblSituacao: TDBLookupComboBox
    Left = 30
    Top = 380
    Width = 179
    Height = 21
    DataField = 'ds_monografia_situacao'
    DataSource = formMonografias.dsMonografia
    TabOrder = 20
  end
  object dblFormaEnvio: TDBLookupComboBox
    Left = 366
    Top = 426
    Width = 141
    Height = 21
    DataField = 'ds_forma_envioo'
    DataSource = formMonografias.dsMonografia
    TabOrder = 29
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 30
    Top = 21
    Width = 318
    Height = 21
    Hint = #193'rea de conhecimento da monografia.'
    HelpType = htKeyword
    DataField = 'ds_area'
    DataSource = formMonografias.dsMonografia
    TabOrder = 0
  end
  object UpDownCursos: TUpDown
    Left = 640
    Top = 20
    Width = 14
    Height = 21
    Min = -100
    TabOrder = 48
    OnClick = UpDownCursosClick
  end
  object txtAnoSemestre: TMaskEdit
    Left = 588
    Top = 20
    Width = 54
    Height = 22
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 660
    Top = 20
    Width = 23
    Height = 21
    CharCase = ecUpperCase
    DataField = 'nr_anosemestre'
    DataSource = formMonografias.dsMonografia
    TabOrder = 49
    Visible = False
  end
  object dbeDataPagOrientador: TDBEdit
    Left = 651
    Top = 356
    Width = 23
    Height = 21
    Hint = 
      'Data em que foi liberado pagamento da monografia para orientador' +
      ', caso a institui'#231#227'o o fa'#231'a.'
    DataField = 'dt_pag_orientador'
    DataSource = formMonografias.dsMonografia
    TabOrder = 50
    Visible = False
  end
  object dtPagOrientador: TDateTimePicker
    Left = 621
    Top = 380
    Width = 21
    Height = 21
    Date = 39903.732651909720000000
    Time = 39903.732651909720000000
    TabOrder = 26
    OnChange = dtPagOrientadorChange
  end
  object DBCheckBox1: TDBCheckBox
    Left = 31
    Top = 636
    Width = 150
    Height = 17
    Hint = 'Se monografia est'#225' indicada pelo orientador a ser publicada.'
    Caption = 'Indicado Para Publica'#231#227'o'
    DataField = 'sn_indicacao'
    DataSource = formMonografias.dsMonografia
    ParentShowHint = False
    ShowHint = False
    TabOrder = 40
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object mEData: TMaskEdit
    Left = 215
    Top = 380
    Width = 68
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 21
    Text = '  /  /    '
    OnExit = dtpDataInicioChange
  end
  object mEDtEntrega: TMaskEdit
    Left = 369
    Top = 380
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 23
    Text = '  /  /    '
    OnExit = dtpDataEntregaChange
  end
  object mEDatPag: TMaskEdit
    Left = 548
    Top = 380
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 25
    Text = '  /  /    '
    OnExit = dtPagOrientadorChange
  end
  object edlbFormatoCD: TLabeledEdit
    Left = 32
    Top = 288
    Width = 121
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Formato CD'
    TabOrder = 8
    OnChange = edlbFormatoCDChange
  end
  object edlbTaxa: TLabeledEdit
    Left = 215
    Top = 288
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Taxa'
    TabOrder = 9
    OnChange = edlbTaxaChange
  end
  object dtEnvioProfessor: TDateTimePicker
    Left = 441
    Top = 288
    Width = 21
    Height = 21
    Date = 0.732651909718697600
    Format = 'dd/MM/yyyy'
    Time = 0.732651909718697600
    TabOrder = 11
    OnChange = dtEnvioProfessorChange
  end
  object dtRetornoProfessor: TDateTimePicker
    Left = 621
    Top = 288
    Width = 21
    Height = 21
    Date = 39903.732651909720000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732651909720000000
    TabOrder = 13
    OnChange = dtRetornoProfessorChange
  end
  object dtImpressao: TDateTimePicker
    Left = 442
    Top = 334
    Width = 21
    Height = 21
    Date = 39903.732651909720000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732651909720000000
    TabOrder = 19
    OnChange = dtImpressaoChange
  end
  object dtAprovacao: TDateTimePicker
    Left = 288
    Top = 334
    Width = 21
    Height = 21
    Date = 0.732651909718697500
    Format = 'dd/MM/yyyy'
    Time = 0.732651909718697500
    TabOrder = 17
    OnChange = dtAprovacaoChange
  end
  object dtCertificado: TDateTimePicker
    Left = 104
    Top = 334
    Width = 21
    Height = 21
    Date = 39903.732651909720000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732651909720000000
    TabOrder = 15
    OnChange = dtCertificadoChange
  end
  object meDtImpressaoMonografia: TMaskEdit
    Left = 369
    Top = 334
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 18
    Text = '  /  /    '
    OnExit = dtImpressaoChange
  end
  object meDtaprovacao: TMaskEdit
    Left = 215
    Top = 334
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 16
    Text = '  /  /    '
    OnExit = dtAprovacaoChange
  end
  object meDtCertificado: TMaskEdit
    Left = 30
    Top = 334
    Width = 75
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 14
    Text = '  /  /    '
    OnExit = dtCertificadoChange
  end
  object meDtenviouProfessor: TMaskEdit
    Left = 369
    Top = 288
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 10
    Text = '  /  /    '
    OnExit = dtEnvioProfessorChange
  end
  object meDtRetornoProfessor: TMaskEdit
    Left = 548
    Top = 288
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 12
    Text = '  /  /    '
    OnExit = dtRetornoProfessorChange
  end
  object meDtSolicitacaoCertificado: TMaskEdit
    Left = 30
    Top = 473
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 31
    Text = '  /  /    '
    OnExit = dtSolicitacaoCertificadoChange
  end
  object meDtRecebimentoCertificado: TMaskEdit
    Left = 216
    Top = 473
    Width = 72
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 33
    Text = '  /  /    '
    OnExit = dtRecebimentoCertificadoChange
  end
  object meDtRecebimentoAta: TMaskEdit
    Left = 368
    Top = 473
    Width = 74
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 35
    Text = '  /  /    '
    OnExit = dtRecebimentoAtaChange
  end
  object meDtRecebimentoArtigo: TMaskEdit
    Left = 548
    Top = 473
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 37
    Text = '  /  /    '
    OnExit = dtRecebimentoArtigoChange
  end
  object dtSolicitacaoCertificado: TDateTimePicker
    Left = 109
    Top = 472
    Width = 21
    Height = 21
    Date = 39903.732650462960000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732650462960000000
    TabOrder = 32
    OnChange = dtSolicitacaoCertificadoChange
  end
  object dtRecebimentoCertificado: TDateTimePicker
    Left = 288
    Top = 473
    Width = 21
    Height = 21
    Date = 39903.732650462960000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732650462960000000
    TabOrder = 34
    OnChange = dtRecebimentoCertificadoChange
  end
  object dtRecebimentoAta: TDateTimePicker
    Left = 442
    Top = 473
    Width = 21
    Height = 21
    Date = 39903.732650462960000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732650462960000000
    TabOrder = 36
    OnChange = dtRecebimentoAtaChange
  end
  object dtRecebimentoArtigo: TDateTimePicker
    Left = 621
    Top = 473
    Width = 21
    Height = 21
    Date = 39903.732650462960000000
    Format = 'dd/MM/yyyy'
    Time = 39903.732650462960000000
    TabOrder = 38
    OnChange = dtRecebimentoArtigoChange
  end
  object cbUnidadeCertificadora: TComboBox
    Left = 32
    Top = 519
    Width = 316
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 51
  end
  object qyUnidadeCertificadora: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  ie.*,'
      '  t.codigo'
      'FROM'
      '  instituicoes_ensino AS ie'
      
        'INNER JOIN turmas AS t ON(ie.cd_instituicao = t.cd_unidade_certi' +
        'ficadora)'
      'GROUP BY'
      #9'ie.cd_instituicao'
      'ORDER BY'
      '  ie.nm_instituicao')
    Params = <>
    Left = 368
    Top = 8
    object qyUnidadeCertificadoranm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Size = 80
    end
    object qyUnidadeCertificadorads_credenciamento: TStringField
      FieldName = 'ds_credenciamento'
      Size = 150
    end
    object qyUnidadeCertificadoranm_fantasia: TStringField
      FieldName = 'nm_fantasia'
      Size = 80
    end
    object qyUnidadeCertificadorads_endereco: TStringField
      FieldName = 'ds_endereco'
      Size = 80
    end
    object qyUnidadeCertificadorads_complemento: TStringField
      FieldName = 'ds_complemento'
      Size = 50
    end
    object qyUnidadeCertificadorads_bairro: TStringField
      FieldName = 'ds_bairro'
      Size = 50
    end
    object qyUnidadeCertificadorads_cidade: TStringField
      FieldName = 'ds_cidade'
      Size = 50
    end
    object qyUnidadeCertificadorads_estado: TStringField
      FieldName = 'ds_estado'
      Size = 3
    end
    object qyUnidadeCertificadorads_cep: TStringField
      FieldName = 'ds_cep'
      Size = 8
    end
    object qyUnidadeCertificadorads_diretor: TStringField
      FieldName = 'ds_diretor'
      Size = 80
    end
    object qyUnidadeCertificadorads_tipo: TStringField
      FieldName = 'ds_tipo'
      Size = 1
    end
    object qyUnidadeCertificadorads_telefone1: TStringField
      FieldName = 'ds_telefone1'
      Size = 25
    end
    object qyUnidadeCertificadorads_telefone2: TStringField
      FieldName = 'ds_telefone2'
      Size = 25
    end
    object qyUnidadeCertificadorads_email: TStringField
      FieldName = 'ds_email'
      Size = 100
    end
    object qyUnidadeCertificadorads_site: TStringField
      FieldName = 'ds_site'
      Size = 100
    end
    object qyUnidadeCertificadorasn_educacao_infantil: TStringField
      FieldName = 'sn_educacao_infantil'
      Size = 1
    end
    object qyUnidadeCertificadorasn_ensino_fundamental: TStringField
      FieldName = 'sn_ensino_fundamental'
      Size = 1
    end
    object qyUnidadeCertificadorasn_ensino_medio: TStringField
      FieldName = 'sn_ensino_medio'
      Size = 1
    end
    object qyUnidadeCertificadorasn_ensino_superior: TStringField
      FieldName = 'sn_ensino_superior'
      Size = 1
    end
    object qyUnidadeCertificadorasn_cursos_profissionalizantes: TStringField
      FieldName = 'sn_cursos_profissionalizantes'
      Size = 1
    end
    object qyUnidadeCertificadorasn_ensino_especial: TStringField
      FieldName = 'sn_ensino_especial'
      Size = 1
    end
    object qyUnidadeCertificadorasn_unidade_certificadora: TSmallintField
      FieldName = 'sn_unidade_certificadora'
    end
    object qyUnidadeCertificadorasn_convenio: TSmallintField
      FieldName = 'sn_convenio'
    end
    object qyUnidadeCertificadoraim_logo: TBlobField
      FieldName = 'im_logo'
    end
    object qyUnidadeCertificadoracd_municipio_correio: TIntegerField
      FieldName = 'cd_municipio_correio'
    end
    object qyUnidadeCertificadoracd_bairro: TIntegerField
      FieldName = 'cd_bairro'
    end
    object qyUnidadeCertificadoraDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object qyUnidadeCertificadoracd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
  end
end
