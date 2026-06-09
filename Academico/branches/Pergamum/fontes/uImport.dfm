object frmImport: TfrmImport
  Left = 175
  Top = 48
  Width = 496
  Height = 440
  Caption = 'Importa'#231#227'o...'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 160
    Top = 160
    Width = 32
    Height = 14
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 160
    Top = 192
    Width = 32
    Height = 14
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 160
    Top = 224
    Width = 32
    Height = 14
    Caption = 'Label3'
  end
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Importar Mensalidades...'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Bar: TProgressBar
    Left = 160
    Top = 13
    Width = 177
    Height = 15
    TabOrder = 1
  end
  object Button2: TButton
    Left = 16
    Top = 40
    Width = 129
    Height = 25
    Caption = 'Importar Matriculas...'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 72
    Width = 129
    Height = 25
    Caption = 'Importar Alunos...'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Bar2: TProgressBar
    Left = 160
    Top = 45
    Width = 177
    Height = 15
    TabOrder = 4
  end
  object Bar3: TProgressBar
    Left = 160
    Top = 77
    Width = 177
    Height = 15
    TabOrder = 5
  end
  object btnPlanilha: TButton
    Left = 16
    Top = 104
    Width = 129
    Height = 25
    Caption = 'Importar Planilha...'
    TabOrder = 6
    OnClick = btnPlanilhaClick
  end
  object Bar4: TProgressBar
    Left = 160
    Top = 109
    Width = 177
    Height = 15
    TabOrder = 7
  end
  object Button4: TButton
    Left = 16
    Top = 136
    Width = 129
    Height = 25
    Caption = 'Imp. Planilha Escolar...'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Bar5: TProgressBar
    Left = 160
    Top = 141
    Width = 177
    Height = 15
    TabOrder = 9
  end
  object Button5: TButton
    Left = 16
    Top = 168
    Width = 129
    Height = 25
    Caption = 'Imp. Uninformare...'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Bar6: TProgressBar
    Left = 160
    Top = 173
    Width = 177
    Height = 15
    TabOrder = 11
  end
  object Button6: TButton
    Left = 16
    Top = 200
    Width = 129
    Height = 25
    Caption = 'Imp. Notas'
    TabOrder = 12
    OnClick = Button6Click
  end
  object Bar7: TProgressBar
    Left = 160
    Top = 205
    Width = 177
    Height = 15
    TabOrder = 13
  end
  object Button7: TButton
    Left = 16
    Top = 232
    Width = 129
    Height = 25
    Caption = 'Atualiza'#231#227'o Hist'#243'rico'
    TabOrder = 14
    OnClick = Button7Click
  end
  object Bar8: TProgressBar
    Left = 160
    Top = 237
    Width = 177
    Height = 15
    TabOrder = 15
  end
  object Button8: TButton
    Left = 16
    Top = 264
    Width = 129
    Height = 25
    Caption = 'Atual. Situa'#231#227'o Hist.'
    TabOrder = 16
    OnClick = Button8Click
  end
  object Bar9: TProgressBar
    Left = 160
    Top = 269
    Width = 177
    Height = 15
    TabOrder = 17
  end
  object Button9: TButton
    Left = 16
    Top = 328
    Width = 129
    Height = 25
    Caption = 'Temp'
    TabOrder = 18
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 16
    Top = 296
    Width = 129
    Height = 25
    Caption = 'Atual. Situa'#231#227'o Matr.'
    TabOrder = 19
    OnClick = Button10Click
  end
  object Bar10: TProgressBar
    Left = 160
    Top = 301
    Width = 177
    Height = 15
    TabOrder = 20
  end
  object txtCurso: TEdit
    Left = 352
    Top = 208
    Width = 65
    Height = 22
    TabOrder = 21
    Text = 'CURSO'
  end
  object txtAnoSemestre: TEdit
    Left = 352
    Top = 232
    Width = 65
    Height = 22
    TabOrder = 22
    Text = 'PERIODO'
  end
  object chk: TCheckBox
    Left = 352
    Top = 280
    Width = 97
    Height = 17
    Caption = 'In Transaction'
    TabOrder = 23
  end
  object txtTurma: TEdit
    Left = 352
    Top = 256
    Width = 65
    Height = 22
    TabOrder = 24
    Text = 'TURMA'
  end
  object Button11: TButton
    Left = 16
    Top = 360
    Width = 129
    Height = 25
    Caption = 'Novo N'#250'mero IBES'
    TabOrder = 25
    OnClick = Button11Click
  end
  object tblMens: TZTable
    Connection = db
    
    TableName = 'DADOS'
    Left = 280
    Top = 72
    object tblMensCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblMensNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object tblMensDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object tblMensValorBruto: TFloatField
      FieldName = 'ValorBruto'
    end
    object tblMensValorGratuidade: TFloatField
      FieldName = 'ValorGratuidade'
    end
    object tblMensValorBase: TFloatField
      FieldName = 'ValorBase'
    end
    object tblMensValorDescontoPercetual: TFloatField
      FieldName = 'ValorDescontoPercetual'
    end
    object tblMensPercentualDesconto: TFloatField
      FieldName = 'PercentualDesconto'
    end
    object tblMensValorExtra: TFloatField
      FieldName = 'ValorExtra'
    end
    object tblMensValorLiquido: TFloatField
      FieldName = 'ValorLiquido'
    end
    object tblMensValorAcrescimo: TFloatField
      FieldName = 'ValorAcrescimo'
    end
    object tblMensValorDescontoBaixa: TFloatField
      FieldName = 'ValorDescontoBaixa'
    end
    object tblMensTipoBaixa: TIntegerField
      FieldName = 'TipoBaixa'
    end
    object tblMensValorPago: TFloatField
      FieldName = 'ValorPago'
    end
    object tblMensObservacao: TStringField
      FieldName = 'Observacao'
      Size = 255
    end
    object tblMensTurma: TStringField
      FieldName = 'Turma'
      Size = 255
    end
    object tblMensDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
    end
    object tblMensParcela: TStringField
      FieldName = 'Parcela'
      Size = 5
    end
    object tblMensAnoLetivo: TIntegerField
      FieldName = 'AnoLetivo'
    end
    object tblMensSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
  end
  object tblMensalidades: TZTable
    Connection = db
    
    TableName = 'Mensalidades'
    Left = 248
    Top = 72
    object tblMensalidadesCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblMensalidadesParcela: TSmallintField
      FieldName = 'Parcela'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object tblMensalidadesTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblMensalidadesDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
    end
    object tblMensalidadesNossoNumero: TStringField
      FieldName = 'NossoNumero'
      Size = 30
    end
    object tblMensalidadesValorBruto: TFloatField
      FieldName = 'ValorBruto'
    end
    object tblMensalidadesValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
    end
    object tblMensalidadesDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
    end
    object tblMensalidadesValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
    object tblMensalidadesValorPago: TFloatField
      FieldName = 'ValorPago'
    end
    object tblMensalidadesDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
    end
    object tblMensalidadesSituacao: TSmallintField
      FieldName = 'Situacao'
    end
    object tblMensalidadesUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object tblMensalidadesAnoLetivo: TSmallintField
      FieldName = 'AnoLetivo'
    end
    object tblMensalidadesSemestre: TSmallintField
      FieldName = 'Semestre'
    end
    object tblMensalidadesBloqueto: TBooleanField
      FieldName = 'Bloqueto'
    end
    object tblMensalidadesValorExtra: TFloatField
      FieldName = 'ValorExtra'
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
    end
  end
  object tblMatriculas: TZTable
    Connection = db
    
    IndexFieldNames = 'CodigoAluno;Turma;Periodo;Sequencia'
    TableName = 'Matriculas'
    Left = 216
    Top = 72
    object tblMatriculasCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblMatriculasTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblMatriculasPeriodo: TSmallintField
      FieldName = 'Periodo'
    end
    object tblMatriculasSequencia: TSmallintField
      FieldName = 'Sequencia'
    end
    object tblMatriculasDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
    end
    object tblMatriculasUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object tblMatriculasPlanoPagamento: TIntegerField
      FieldName = 'PlanoPagamento'
    end
    object tblMatriculasSituacao: TSmallintField
      FieldName = 'Situacao'
    end
    object tblMatriculasImpresso: TBooleanField
      FieldName = 'Impresso'
    end
  end
  object qryMens: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select CodigoAluno, Turma, AnoLetivo, Semestre'
      
        'from [Mensalidades] group by CodigoAluno, Turma, AnoLetivo, Seme' +
        'stre')
    Left = 312
    Top = 72
    object qryMensCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object qryMensTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object qryMensAnoLetivo: TSmallintField
      FieldName = 'AnoLetivo'
    end
    object qryMensSemestre: TSmallintField
      FieldName = 'Semestre'
    end
  end
  object tblAlunos: TZTable
    Connection = db
    
    TableName = 'Alunos'
    Left = 248
    Top = 40
    object tblAlunosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblAlunosNome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
    object tblAlunosDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object tblAlunosCidadeNascimento: TStringField
      FieldName = 'CidadeNascimento'
      Size = 22
    end
    object tblAlunosEstadoNascimento: TStringField
      FieldName = 'EstadoNascimento'
      Size = 2
    end
    object tblAlunosEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object tblAlunosComplemento: TStringField
      FieldName = 'Complemento'
      Size = 10
    end
    object tblAlunosCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tblAlunosBairro: TStringField
      FieldName = 'Bairro'
    end
    object tblAlunosCidade: TStringField
      FieldName = 'Cidade'
    end
    object tblAlunosEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblAlunosTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 25
    end
    object tblAlunosSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tblAlunosNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 15
    end
    object tblAlunosIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 15
    end
    object tblAlunosOrgaoExp: TStringField
      FieldName = 'OrgaoExp'
      Size = 10
    end
    object tblAlunosTurma: TStringField
      FieldName = 'Turma'
      Size = 30
    end
    object tblAlunosCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object tblAlunosRM_CSM: TStringField
      FieldName = 'RM_CSM'
      Size = 15
    end
    object tblAlunosNumeroMilitar: TStringField
      FieldName = 'NumeroMilitar'
      Size = 12
    end
    object tblAlunosSerieMilitar: TStringField
      FieldName = 'SerieMilitar'
      Size = 1
    end
    object tblAlunosDataExpMilitar: TDateTimeField
      FieldName = 'DataExpMilitar'
    end
    object tblAlunosLocalExpMilitar: TStringField
      FieldName = 'LocalExpMilitar'
      Size = 15
    end
    object tblAlunosOrganizacaoMilitar: TStringField
      FieldName = 'OrganizacaoMilitar'
      Size = 10
    end
    object tblAlunosTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 10
    end
    object tblAlunosPai: TStringField
      FieldName = 'Pai'
      Size = 45
    end
    object tblAlunosMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tblAlunosResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 30
    end
    object tblAlunosCPF_Responsavel: TStringField
      FieldName = 'CPF_Responsavel'
    end
    object tblAlunosEnderecoResponsavel: TStringField
      FieldName = 'EnderecoResponsavel'
      Size = 40
    end
    object tblAlunosComplementoResponsavel: TStringField
      FieldName = 'ComplementoResponsavel'
      Size = 40
    end
    object tblAlunosCidadeResponsavel: TStringField
      FieldName = 'CidadeResponsavel'
      Size = 30
    end
    object tblAlunosCEPResponsavel: TStringField
      FieldName = 'CEPResponsavel'
      Size = 9
    end
    object tblAlunosUFResponsavel: TStringField
      FieldName = 'UFResponsavel'
      Size = 2
    end
    object tblAlunosTelefoneResponsavel: TStringField
      FieldName = 'TelefoneResponsavel'
      Size = 30
    end
    object tblAlunosTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 25
    end
    object tblAlunosFuncionario: TStringField
      FieldName = 'Funcionario'
    end
    object tblAlunosVersaoCracha: TIntegerField
      FieldName = 'VersaoCracha'
    end
    object tblAlunosCodigoAlunoIndicado: TIntegerField
      FieldName = 'CodigoAlunoIndicado'
    end
    object tblAlunosEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
  end
  object tblAlunosImp: TZTable
    Connection = db
    
    TableName = 'DADOS1'
    Left = 312
    Top = 40
    object tblAlunosImpCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblAlunosImpNome: TStringField
      FieldName = 'Nome'
      Size = 255
    end
    object tblAlunosImpDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object tblAlunosImpCidadeNascimento: TStringField
      FieldName = 'CidadeNascimento'
      Size = 255
    end
    object tblAlunosImpEstadoNascimento: TStringField
      FieldName = 'EstadoNascimento'
      Size = 255
    end
    object tblAlunosImpEndereco: TStringField
      FieldName = 'Endereco'
      Size = 255
    end
    object tblAlunosImpComplemento: TStringField
      FieldName = 'Complemento'
      Size = 255
    end
    object tblAlunosImpCEP: TStringField
      FieldName = 'CEP'
      Size = 255
    end
    object tblAlunosImpBairro: TStringField
      FieldName = 'Bairro'
      Size = 255
    end
    object tblAlunosImpCidade: TStringField
      FieldName = 'Cidade'
      Size = 255
    end
    object tblAlunosImpEstado: TStringField
      FieldName = 'Estado'
      Size = 255
    end
    object tblAlunosImpTelefone: TStringField
      FieldName = 'Telefone'
      Size = 255
    end
    object tblAlunosImpSexo: TStringField
      FieldName = 'Sexo'
      Size = 255
    end
    object tblAlunosImpNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 255
    end
    object tblAlunosImpRG: TStringField
      FieldName = 'RG'
      Size = 255
    end
    object tblAlunosImpOrgaoEmissor: TStringField
      FieldName = 'OrgaoEmissor'
      Size = 255
    end
    object tblAlunosImpTurma: TStringField
      FieldName = 'Turma'
      Size = 255
    end
  end
  object tblAlunosImp2: TZTable
    Connection = db
    
    IndexFieldNames = 'Codigo'
    MasterFields = 'Codigo'
    MasterSource = dtcAlunosImp
    TableName = 'DADOS2'
    Left = 280
    Top = 40
    object tblAlunosImp2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblAlunosImp2CPF: TStringField
      FieldName = 'CPF'
      Size = 255
    end
    object tblAlunosImp2RM_CSM: TStringField
      FieldName = 'RM_CSM'
      Size = 255
    end
    object tblAlunosImp2NumeroMilitar: TIntegerField
      FieldName = 'NumeroMilitar'
    end
    object tblAlunosImp2SerieMilitar: TStringField
      FieldName = 'SerieMilitar'
      Size = 255
    end
    object tblAlunosImp2DataMilitar: TDateTimeField
      FieldName = 'DataMilitar'
    end
    object tblAlunosImp2LocalMilitar: TStringField
      FieldName = 'LocalMilitar'
      Size = 255
    end
    object tblAlunosImp2OrgMilitar: TStringField
      FieldName = 'OrgMilitar'
      Size = 255
    end
    object tblAlunosImp2TipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 255
    end
    object tblAlunosImp2Pai: TStringField
      FieldName = 'Pai'
      Size = 255
    end
    object tblAlunosImp2Mae: TStringField
      FieldName = 'Mae'
      Size = 255
    end
    object tblAlunosImp2Responsavel: TStringField
      FieldName = 'Responsavel'
      Size = 255
    end
    object tblAlunosImp2CPF_Responsavel: TStringField
      FieldName = 'CPF_Responsavel'
      Size = 255
    end
    object tblAlunosImp2Funcionario: TStringField
      FieldName = 'Funcionario'
      Size = 255
    end
    object tblAlunosImp2Cracha: TIntegerField
      FieldName = 'Cracha'
    end
  end
  object dtcAlunosImp: TDataSource
    DataSet = tblAlunosImp
    Left = 312
    Top = 8
  end
  object tblMensErro: TZTable
    Connection = db
    
    TableName = 'DADOS_ERRO'
    Left = 216
    Top = 40
    object tblMensErroCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblMensErroNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object tblMensErroDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object tblMensErroValorBruto: TFloatField
      FieldName = 'ValorBruto'
    end
    object tblMensErroValorGratuidade: TFloatField
      FieldName = 'ValorGratuidade'
    end
    object tblMensErroValorBase: TFloatField
      FieldName = 'ValorBase'
    end
    object tblMensErroValorDescontoPercetual: TFloatField
      FieldName = 'ValorDescontoPercetual'
    end
    object tblMensErroPercentualDesconto: TFloatField
      FieldName = 'PercentualDesconto'
    end
    object tblMensErroValorExtra: TFloatField
      FieldName = 'ValorExtra'
    end
    object tblMensErroValorLiquido: TFloatField
      FieldName = 'ValorLiquido'
    end
    object tblMensErroValorAcrescimo: TFloatField
      FieldName = 'ValorAcrescimo'
    end
    object tblMensErroValorDescontoBaixa: TFloatField
      FieldName = 'ValorDescontoBaixa'
    end
    object tblMensErroTipoBaixa: TIntegerField
      FieldName = 'TipoBaixa'
    end
    object tblMensErroValorPago: TFloatField
      FieldName = 'ValorPago'
    end
    object tblMensErroObservacao: TStringField
      FieldName = 'Observacao'
      Size = 255
    end
    object tblMensErroTurma: TStringField
      FieldName = 'Turma'
      Size = 255
    end
    object tblMensErroAnoLetivo: TIntegerField
      FieldName = 'AnoLetivo'
    end
    object tblMensErroSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
    object tblMensErroParcela: TStringField
      FieldName = 'Parcela'
      Size = 5
    end
  end
  object tblDebitos: TZTable
    Connection = db
    
    TableName = 'DEBITOS'
    Left = 184
    Top = 72
    object tblDebitosCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tblDebitosALUNO: TStringField
      FieldName = 'ALUNO'
      Size = 255
    end
    object tblDebitosFONE: TStringField
      FieldName = 'FONE'
      Size = 255
    end
    object tblDebitosTURMA: TStringField
      FieldName = 'TURMA'
      Size = 255
    end
    object tblDebitosTURMA1: TStringField
      FieldName = 'TURMA1'
      Size = 255
    end
    object tblDebitosPeriodoSequencia: TStringField
      FieldName = 'PeriodoSequencia'
      Size = 255
    end
    object tblDebitosADTAR: TStringField
      FieldName = 'A/D/T    A/R'
      Size = 255
    end
    object tblDebitosCDPC: TFloatField
      FieldName = 'CD PC'
    end
    object tblDebitosVencimento: TDateTimeField
      FieldName = 'Vencimento'
    end
    object tblDebitosValorParcela: TFloatField
      FieldName = 'ValorParcela'
    end
    object tblDebitosParcelas: TFloatField
      FieldName = 'Parcelas'
    end
  end
  object tblDebErros: TZTable
    Connection = db
    
    TableName = 'DEBITOS_ERRO'
    Left = 184
    Top = 40
    object tblDebErrosCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tblDebErrosALUNO: TStringField
      FieldName = 'ALUNO'
      Size = 255
    end
    object tblDebErrosFONE: TStringField
      FieldName = 'FONE'
      Size = 255
    end
    object tblDebErrosTURMA: TStringField
      FieldName = 'TURMA'
      Size = 255
    end
    object tblDebErrosTURMA1: TStringField
      FieldName = 'TURMA1'
      Size = 255
    end
    object tblDebErrosPeriodoSequencia: TStringField
      FieldName = 'PeriodoSequencia'
      Size = 255
    end
    object tblDebErrosADTAR: TStringField
      FieldName = 'A/D/T    A/R'
      Size = 255
    end
    object tblDebErrosCDPC: TFloatField
      FieldName = 'CD PC'
    end
    object tblDebErrosVencimento: TDateTimeField
      FieldName = 'Vencimento'
    end
    object tblDebErrosValorParcela: TFloatField
      FieldName = 'ValorParcela'
    end
    object tblDebErrosParcelas: TFloatField
      FieldName = 'Parcelas'
    end
  end
  object tblInf: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select * from ImportacaoInformare'
      'where TURMA = :TURMA')
    Left = 216
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TURMA'
        ParamType = ptUnknown
      end>
    object tblInfCONTRATO: TFloatField
      FieldName = 'CONTRATO'
      Origin = 'ImportacaoInformare.CONTRATO'
    end
    object tblInfALUNO: TStringField
      FieldName = 'ALUNO'
      Origin = 'ImportacaoInformare.ALUNO'
      Size = 50
    end
    object tblInfTURMA: TIntegerField
      FieldName = 'TURMA'
      Origin = 'ImportacaoInformare.TURMA'
    end
    object tblInfCURSO: TStringField
      FieldName = 'CURSO'
      Origin = 'ImportacaoInformare.CURSO'
      Size = 15
    end
    object tblInfPARCELA: TStringField
      FieldName = 'PARCELA'
      Origin = 'ImportacaoInformare.PARCELA'
      Size = 5
    end
    object tblInfVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
      Origin = 'ImportacaoInformare.VENCIMENTO'
    end
    object tblInfVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ImportacaoInformare.VALOR'
    end
    object tblInfSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'ImportacaoInformare.SITUACAO'
      Size = 1
    end
    object tblInfVALOR_PGTO: TFloatField
      FieldName = 'VALOR_PGTO'
      Origin = 'ImportacaoInformare.CONTRATO'
    end
    object tblInfDATA_PGTO: TDateTimeField
      FieldName = 'DATA_PGTO'
      Origin = 'ImportacaoInformare.ALUNO'
    end
  end
  object qryInsAlunos: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'INSERT INTO Alunos '
      '( Codigo, Nome, Sexo, DataNascimento, Responsavel, '
      'RGResponsavel, CPF, Endereco, Bairro, CEP, Cidade, Estado, '
      'CidadeNascimento, EstadoNascimento, TelefoneResponsavel, '
      'Telefone2, Telefone1, Email, NomeSemAcento )'
      'SELECT :NovoCodigo,  UCASE(ALUNOS_INF.ALUNO), ALUNOS_INF.SEXO, '
      'ALUNOS_INF.NASCIMENTO,  UCASE(ALUNOS_INF.RESPONSA), '
      'ALUNOS_INF.RG_RES, ALUNOS_INF.CPF, '
      'UCASE(ALUNOS_INF.ENDERECO), UCASE(ALUNOS_INF.BAIRRO), '
      'ALUNOS_INF.CEP, UCASE(ALUNOS_INF.CIDADE), ALUNOS_INF.UF, '
      'UCASE(ALUNOS_INF.CIDADE_NAS), ALUNOS_INF.ESTADO_NAS, '
      'ALUNOS_INF.FONE_RES, ALUNOS_INF.FONE_RES2, '
      'ALUNOS_INF.FONE_COM, ALUNOS_INF.E_MAIL, :SemAcento'
      'FROM ALUNOS_INF where ALUNOS_INF.CONTRATO = :CONTRATO')
    Left = 248
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NovoCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SemAcento'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryInsMatriculas: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'insert into Matriculas'
      '(CodigoAluno, AnoSemestre, Turma, DataEmissao, '
      'Usuario, PlanoPagamento, Situacao)'
      'values'
      '(:CodigoAluno, :AnoSemestre, :Turma, :DataEmissao, :Usuario, '
      ':PlanoPagamento, :Situacao)')
    Left = 280
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PlanoPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'update Mensalidades'
      'set ValorPago = :ValorPago, '
      'DataPagamento = :DataPagamento, '
      'Situacao = 0, '
      'DescontoExtra = 0,'
      'ValorTotal = ValorBruto'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Parcela = :Parcela and'
      'DataVencimento = :DataVencimento and'
      'Turma = :Turma')
    Left = 312
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
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
  object xFicha: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'insert into FichaIndividual (AnoSemestre, Turma,'
      'CodigoGrade, CodigoAluno,'
      'Curso, Disciplina, Grau,'
      'Serie, Nota1, Falta1,'
      'Exame1, Nota2, Falta2,'
      'Exame2, Nota3, Falta3,'
      'Exame3, Nota4, Falta4, Exame4,'
      'NotaExame, [2aEpoca],'
      'MediaFinal, Frequencia,'
      'TotalFaltas, Situacao,'
      'Usuario, CodigoEscola)'
      'values'
      ''
      '(:AnoSemestre, :Turma,'
      ':CodigoGrade, :CodigoAluno,'
      ':Curso, :Disciplina, :Grau,'
      ':Serie, :Nota1, :Falta1,'
      ':Exame1, :Nota2, :Falta2,'
      ':Exame2, :Nota3, :Falta3,'
      ':Exame3, :Nota4, :Falta4, :Exame4,'
      ':NotaExame, :SegEpoca,'
      ':MediaFinal, :Frequencia,'
      ':TotalFaltas, :Situacao,'
      ':Usuario, :CodigoEscola)')
    Left = 192
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CodigoGrade'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Grau'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Nota1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Falta1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Exame1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Nota2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Falta2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Exame2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Nota3'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Falta3'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Exame3'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Nota4'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Falta4'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Exame4'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NotaExame'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SegEpoca'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MediaFinal'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Frequencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TotalFaltas'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodigoEscola'
        ParamType = ptUnknown
      end>
  end
end

