object frmSelPlanoPgto: TfrmSelPlanoPgto
  Left = 352
  Top = 185
  Caption = 'Selecionar o Plano de pagamento...'
  ClientHeight = 324
  ClientWidth = 405
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
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 11
    Top = 40
    Width = 382
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 127
    Top = 14
    Width = 52
    Height = 14
    Caption = 'Descri'#231#227'o:'
  end
  object SpeedButton1: TSpeedButton
    Left = 208
    Top = 296
    Width = 87
    Height = 25
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
  end
  object Label1: TLabel
    Left = 9
    Top = 14
    Width = 39
    Height = 14
    Caption = 'Per'#237'odo:'
  end
  object grd: TDBGrid
    Left = 10
    Top = 56
    Width = 383
    Height = 233
    DataSource = srcPlanoPgto
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pmQtd
    TabOrder = 0
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
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 291
        Visible = True
      end>
  end
  object txtDescricao: TEdit
    Left = 184
    Top = 10
    Width = 209
    Height = 22
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = txtDescricaoKeyPress
  end
  object btnFechar: TButton
    Left = 303
    Top = 296
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
  object txtAnoSemestre: TMaskEdit
    Left = 51
    Top = 10
    Width = 55
    Height = 22
    TabStop = False
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 3
    Text = '19931'
  end
  object udAnoSemestre: TUpDown
    Left = 102
    Top = 10
    Width = 16
    Height = 24
    Min = -100
    TabOrder = 4
    OnClick = udAnoSemestreClick
  end
  object qryPlanoPgto: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'select * from planospagamento')
    Params = <>
    Left = 48
    Top = 296
    object qryPlanoPgtocodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.planospagamento.codigo'
    end
    object qryPlanoPgtoanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.planospagamento.anosemestre'
    end
    object qryPlanoPgtodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.planospagamento.descricao'
      Size = 50
    end
    object qryPlanoPgtoturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.planospagamento.turma'
      Size = 15
    end
    object qryPlanoPgtocurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.planospagamento.curso'
      Size = 15
    end
    object qryPlanoPgtoparcelas: TSmallintField
      FieldName = 'parcelas'
      Origin = 'WMESTRE12.planospagamento.parcelas'
    end
    object qryPlanoPgtovalorcobrado: TFloatField
      FieldName = 'valorcobrado'
      Origin = 'WMESTRE12.planospagamento.valorcobrado'
    end
    object qryPlanoPgtovalorcontrato: TFloatField
      FieldName = 'valorcontrato'
      Origin = 'WMESTRE12.planospagamento.valorcontrato'
    end
    object qryPlanoPgtotaxamaterial: TFloatField
      FieldName = 'taxamaterial'
      Origin = 'WMESTRE12.planospagamento.taxamaterial'
    end
    object qryPlanoPgtotaxaapostila: TFloatField
      FieldName = 'taxaapostila'
      Origin = 'WMESTRE12.planospagamento.taxaapostila'
    end
    object qryPlanoPgtodesconto: TFloatField
      FieldName = 'desconto'
      Origin = 'WMESTRE12.planospagamento.desconto'
    end
    object qryPlanoPgtomatricula: TFloatField
      FieldName = 'matricula'
      Origin = 'WMESTRE12.planospagamento.matricula'
    end
    object qryPlanoPgtoapartir: TDateTimeField
      FieldName = 'apartir'
      Origin = 'WMESTRE12.planospagamento.apartir'
    end
    object qryPlanoPgtonumerotaxasmaterial: TSmallintField
      FieldName = 'numerotaxasmaterial'
      Origin = 'WMESTRE12.planospagamento.numerotaxasmaterial'
    end
    object qryPlanoPgtoparagrafo3: TStringField
      FieldName = 'paragrafo3'
      Origin = 'WMESTRE12.planospagamento.paragrafo3'
      Size = 150
    end
    object qryPlanoPgtonr_dias_parczero: TSmallintField
      FieldName = 'nr_dias_parczero'
      Origin = 'WMESTRE12.planospagamento.nr_dias_parczero'
    end
    object qryPlanoPgtosn_dias_uteis: TStringField
      FieldName = 'sn_dias_uteis'
      Origin = 'WMESTRE12.planospagamento.sn_dias_uteis'
      FixedChar = True
      Size = 1
    end
    object qryPlanoPgtosn_creditos: TStringField
      FieldName = 'sn_creditos'
      Origin = 'WMESTRE12.planospagamento.sn_creditos'
      FixedChar = True
      Size = 1
    end
    object qryPlanoPgtonr_creditos_base: TFloatField
      FieldName = 'nr_creditos_base'
      Origin = 'WMESTRE12.planospagamento.nr_creditos_base'
    end
  end
  object srcPlanoPgto: TDataSource
    DataSet = qryPlanoPgto
    Left = 16
    Top = 296
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 80
    Top = 296
  end
end
