object frmSelMens: TfrmSelMens
  Left = 309
  Top = 178
  Width = 546
  Height = 255
  Caption = 'Selecionar a Mensalidade...'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 221
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 16
      Width = 67
      Height = 14
      Caption = 'C'#243'digo Aluno:'
    end
    object SpeedButton1: TSpeedButton
      Left = 344
      Top = 200
      Width = 87
      Height = 22
      Caption = 'Selecionar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object txtCodigo: TEdit
      Left = 87
      Top = 12
      Width = 90
      Height = 22
      TabOrder = 0
      OnKeyPress = txtCodigoKeyPress
    end
    object grd: TDBGrid
      Left = 8
      Top = 40
      Width = 521
      Height = 155
      DataSource = dtcMensalidades
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmQtd
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDblClick = grdDblClick
      OnKeyPress = grdKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'NomeAluno'
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataVencimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Parcela'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotalCalc'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoSituacao'
          Width = 49
          Visible = True
        end>
    end
    object btnFechar: TButton
      Left = 438
      Top = 199
      Width = 89
      Height = 25
      Caption = 'F12 Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      OnClick = btnFecharClick
    end
  end
  object tblMensalidades: TZTable
    BeforePost = tblMensalidadesBeforePost
    OnCalcFields = tblMensalidadesCalcFields
    Connection = db
    
    IndexFieldNames = 'CodigoAluno;Situacao'
    TableName = 'Mensalidades'
    Left = 360
    Top = 152
    object tblMensalidadesCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      DisplayFormat = '000000-0'
    end
    object tblMensalidadesParcela: TSmallintField
      FieldName = 'Parcela'
      DisplayFormat = '00'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DataVencimento'
      DisplayFormat = 'dd/mm/yyyy'
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
    object tblMensalidadesValorExtra: TFloatField
      FieldName = 'ValorExtra'
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
    object tblMensalidadesValorTotalCalc: TFloatField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesDescricaoSituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'DescricaoSituacao'
      Size = 5
      Calculated = True
    end
    object tblMensalidadesNomeAluno: TStringField
      DisplayLabel = 'Aluno'
      FieldKind = fkLookup
      FieldName = 'NomeAluno'
      LookupDataSet = tblAlunos
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodigoAluno'
      LookupCache = True
      Size = 50
      Lookup = True
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
    end
    object tblMensalidadesCodigoCarta: TIntegerField
      FieldName = 'CodigoCarta'
    end
    object tblMensalidadesDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
    end
    object tblMensalidadesIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
    end
  end
  object tblAlunos: TZTable
    Connection = db
    
    IndexFieldNames = 'Codigo'
    MasterFields = 'CodigoAluno'
    MasterSource = dtcMensalidades
    TableName = 'Alunos'
    Left = 392
    Top = 152
    object tblAlunosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblAlunosNome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
  end
  object dtcMensalidades: TDataSource
    DataSet = tblMensalidades
    Left = 360
    Top = 184
  end
  object dtcAlunos: TDataSource
    DataSet = tblAlunos
    Left = 392
    Top = 184
  end
  object tblPoupanca: TZTable
    Connection = db
    
    IndexName = 'PrimaryKey'
    TableName = 'Poupanca'
    Left = 424
    Top = 152
    object tblPoupancaData: TDateTimeField
      FieldName = 'Data'
    end
    object tblPoupancaIndicePoupanca: TFloatField
      FieldName = 'IndicePoupanca'
    end
    object tblPoupancaIndiceCorrigido: TFloatField
      FieldName = 'IndiceCorrigido'
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 360
    Top = 120
  end
end

