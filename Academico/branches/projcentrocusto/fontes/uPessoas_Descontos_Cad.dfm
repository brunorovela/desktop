object frm_pessoas_Descontos_Cad: Tfrm_pessoas_Descontos_Cad
  Left = 206
  Top = 190
  BorderStyle = bsDialog
  Caption = 'Descontos Fixos'
  ClientHeight = 305
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 29
    Width = 497
    Height = 12
    Align = alTop
    Shape = bsSpacer
  end
  object Label1: TLabel
    Left = 128
    Top = 56
    Width = 89
    Height = 13
    Caption = 'Código da Pessoa:'
    FocusControl = txtCodigoAluno
    Transparent = True
  end
  object Label2: TLabel
    Left = 123
    Top = 184
    Width = 94
    Height = 13
    Caption = 'Plano de Desconto:'
    Transparent = True
  end
  object Label3: TLabel
    Left = 138
    Top = 88
    Width = 79
    Height = 13
    Caption = 'Ano/Sem. Inicio:'
    Transparent = True
  end
  object Label4: TLabel
    Left = 147
    Top = 120
    Width = 70
    Height = 13
    Caption = 'Ano/Sem. Fim:'
    Transparent = True
  end
  object Label5: TLabel
    Left = 144
    Top = 152
    Width = 73
    Height = 13
    Caption = 'Departamento: '
    Transparent = True
  end
  object Label6: TLabel
    Left = 119
    Top = 212
    Width = 98
    Height = 13
    Caption = 'Incluir na 1ª Parcela:'
    Transparent = True
  end
  object btnCodigoAluno: TSpeedButton
    Left = 329
    Top = 56
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
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PROGRAMAÇÃO DE DESCONTOS FIXOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object btnCancelar: TButton
    Left = 337
    Top = 272
    Width = 75
    Height = 25
    Caption = 'F6 Cancelar'
    TabOrder = 7
    TabStop = False
    OnClick = btnCancelarClick
  end
  object btnConfirmar: TButton
    Left = 417
    Top = 272
    Width = 75
    Height = 25
    Caption = 'F7 Confirmar'
    TabOrder = 8
    TabStop = False
    OnClick = btnConfirmarClick
  end
  object txtCodigoAluno: TDBEdit
    Left = 224
    Top = 56
    Width = 105
    Height = 21
    DataField = 'cd_pessoa'
    DataSource = dtcDescontos
    TabOrder = 0
    OnKeyPress = txtCodigoAlunoKeyPress
  end
  object DBCheckBox1: TDBCheckBox
    Left = 221
    Top = 211
    Width = 15
    Height = 17
    Alignment = taLeftJustify
    DataField = 'sn_primeira_parcela'
    DataSource = dtcDescontos
    TabOrder = 5
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    OnKeyPress = txtCodigoAlunoKeyPress
  end
  object UpDown1: TUpDown
    Left = 328
    Top = 87
    Width = 16
    Height = 24
    Min = -100
    Position = 0
    TabOrder = 9
    Wrap = False
    OnClick = UpDown1Click
  end
  object txtAnoSemInicio: TMaskEdit
    Left = 224
    Top = 87
    Width = 105
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
    Text = '19931'
  end
  object txtAnoSemFim: TMaskEdit
    Left = 224
    Top = 118
    Width = 105
    Height = 22
    EditMask = '9999/9;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 2
    Text = '19931'
  end
  object UpDown2: TUpDown
    Left = 328
    Top = 118
    Width = 16
    Height = 24
    Min = -100
    Position = 0
    TabOrder = 10
    Wrap = False
    OnClick = UpDown2Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 224
    Top = 149
    Width = 217
    Height = 21
    DataField = 'descDepto'
    DataSource = dtcDescontos
    TabOrder = 3
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 224
    Top = 180
    Width = 217
    Height = 21
    DataField = 'descPlanos'
    DataSource = dtcDescontos
    TabOrder = 4
  end
  object tblDescontos: TUMZQuery
    Connection = db
    
    
    SQL.Strings = (
      'select pd.* from pessoas_descontos pd'
      'WHERE cd_pessoa = :cd_pessoa'
      'AND vl_anosem_inicio =  :vl_anosem_inicio'
      'AND vl_anosem_fim = :vl_anosem_fim'
      'AND cd_depto = :cd_depto')
    Left = 448
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vl_anosem_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vl_anosem_fim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_depto'
        ParamType = ptUnknown
      end>
    object tblDescontoscd_pessoa: TIntegerField
      DisplayLabel = 'Cod. Pessoa'
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas_descontos.cd_pessoa'
    end
    object tblDescontoscd_desconto: TIntegerField
      DisplayLabel = 'Cod. Desconto'
      FieldName = 'cd_desconto'
      Origin = 'WMESTRE12.pessoas_descontos.cd_desconto'
    end
    object tblDescontosvl_anosem_inicio: TSmallintField
      DisplayLabel = 'Ano/Sem. Inicio'
      FieldName = 'vl_anosem_inicio'
      Origin = 'WMESTRE12.pessoas_descontos.vl_anosem_inicio'
      DisplayFormat = '0000/0'
    end
    object tblDescontosvl_anosem_fim: TSmallintField
      DisplayLabel = 'Ano/Sem. Fim'
      FieldName = 'vl_anosem_fim'
      Origin = 'WMESTRE12.pessoas_descontos.vl_anosem_fim'
      DisplayFormat = '0000/0'
    end
    object tblDescontoscd_depto: TSmallintField
      DisplayLabel = 'Cod. Depto'
      FieldName = 'cd_depto'
      Origin = 'WMESTRE12.pessoas_descontos.cd_depto'
    end
    object tblDescontossn_primeira_parcela: TStringField
      DisplayLabel = '1ª Parcela'
      FieldName = 'sn_primeira_parcela'
      Origin = 'WMESTRE12.pessoas_descontos.sn_primeira_parcela'
      FixedChar = True
      Size = 1
    end
    object tblDescontosdescDepto: TStringField
      FieldKind = fkLookup
      FieldName = 'descDepto'
      LookupDataSet = DM.tblDeptos
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'cd_depto'
      Size = 100
      Lookup = True
    end
    object tblDescontosdescPlanos: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlanos'
      LookupDataSet = DM.tblPlanoDesc
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricaoplano'
      KeyFields = 'cd_desconto'
      Size = 50
      Lookup = True
    end
  end
  object dtcDescontos: TDataSource
    DataSet = tblDescontos
    Left = 448
    Top = 192
  end
end

