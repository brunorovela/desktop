object frmNegociar: TfrmNegociar
  Left = 234
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Negociar...'
  ClientHeight = 393
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 32
    Top = 144
    Width = 23
    Height = 22
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 471
    Height = 393
    Align = alClient
    TabOrder = 12
    object btnFechar: TSpeedButton
      Left = 383
      Top = 357
      Width = 81
      Height = 25
      Hint = 'Imprimir'
      Caption = 'F12 Fechar'
      OnClick = btnFecharClick
    end
    object btnConfirmar: TSpeedButton
      Left = 295
      Top = 357
      Width = 81
      Height = 25
      Caption = 'F7 Confirmar'
      OnClick = btnConfirmarClick
    end
    object SpeedButton6: TSpeedButton
      Left = 5
      Top = 153
      Width = 153
      Height = 22
      Caption = 'Marcar Todas'
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
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 160
      Top = 153
      Width = 153
      Height = 22
      Caption = 'Desmarcar Todas'
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
      OnClick = SpeedButton7Click
    end
  end
  object lst: TCheckListBox
    Left = 4
    Top = 49
    Width = 309
    Height = 104
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 0
    OnClick = lstClick
  end
  object Panel1: TPanel
    Left = 4
    Top = 30
    Width = 309
    Height = 20
    Alignment = taLeftJustify
    Caption = '   PARCELAS VENCIDAS / PENDENTES'
    TabOrder = 1
  end
  object lst2: TCheckListBox
    Left = 4
    Top = 201
    Width = 285
    Height = 169
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 4
    Top = 182
    Width = 285
    Height = 20
    Alignment = taLeftJustify
    Caption = '   NOVAS PARCELAS'
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 4
    Top = 4
    Width = 461
    Height = 22
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object DBText1: TDBText
      Left = 12
      Top = 4
      Width = 57
      Height = 14
      DataField = 'CodigoAluno'
      DataSource = frmMensalidades.dtcMensalidades
    end
    object DBText2: TDBText
      Left = 60
      Top = 4
      Width = 265
      Height = 14
      DataField = 'NomeAluno'
      DataSource = frmMensalidades.dtcMensalidades
    end
  end
  object btn1x: TButton
    Tag = 1
    Left = 319
    Top = 30
    Width = 145
    Height = 23
    Caption = '1 X ( 30 dias )'
    TabOrder = 5
    OnClick = btn1xClick
  end
  object btn2x: TButton
    Tag = 2
    Left = 319
    Top = 55
    Width = 145
    Height = 23
    Caption = '2 X'
    TabOrder = 6
    OnClick = btn2xClick
  end
  object btn3x: TButton
    Tag = 3
    Left = 319
    Top = 79
    Width = 145
    Height = 23
    Caption = '3 X'
    TabOrder = 7
    OnClick = btn2xClick
  end
  object btn4x: TButton
    Tag = 4
    Left = 319
    Top = 104
    Width = 145
    Height = 23
    Caption = '4 X'
    TabOrder = 8
    OnClick = btn2xClick
  end
  object btn5x: TButton
    Tag = 5
    Left = 319
    Top = 128
    Width = 145
    Height = 23
    Caption = '5 X'
    TabOrder = 9
    OnClick = btn2xClick
  end
  object btn6x: TButton
    Tag = 6
    Left = 319
    Top = 153
    Width = 145
    Height = 23
    Caption = '6 X'
    TabOrder = 10
    OnClick = btn2xClick
  end
  object Panel4: TPanel
    Left = 295
    Top = 182
    Width = 169
    Height = 171
    TabOrder = 11
    object Label5: TLabel
      Left = 12
      Top = 43
      Width = 54
      Height = 14
      Caption = 'A partir de:'
    end
    object Label4: TLabel
      Left = 21
      Top = 16
      Width = 45
      Height = 14
      Caption = 'Parcelas:'
    end
    object Label1: TLabel
      Left = 21
      Top = 97
      Width = 45
      Height = 14
      Caption = 'Juros de:'
    end
    object Label2: TLabel
      Left = 148
      Top = 85
      Width = 12
      Height = 16
      Caption = '%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 124
      Width = 61
      Height = 14
      Caption = 'Turma Base:'
    end
    object Label6: TLabel
      Left = 26
      Top = 70
      Width = 40
      Height = 14
      Caption = 'Entrada:'
    end
    object txtJuros: TEdit
      Left = 68
      Top = 90
      Width = 77
      Height = 22
      TabOrder = 0
      Text = '2'
      OnKeyPress = txtJurosKeyPress
    end
    object btnCalcular: TButton
      Left = 14
      Top = 142
      Width = 141
      Height = 23
      Caption = 'F5 Executar C'#225'lculo'
      TabOrder = 1
      OnClick = btnCalcularClick
    end
    object datApartir: TDateTimePicker
      Left = 68
      Top = 36
      Width = 89
      Height = 22
      Date = 35955.000000000000000000
      Time = 35955.000000000000000000
      TabOrder = 2
    end
    object txtParcelas: TSpinEdit
      Left = 68
      Top = 9
      Width = 45
      Height = 23
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object cbTurma: TComboBox
      Left = 68
      Top = 117
      Width = 95
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
    object txtVlrEntrada: TEdit
      Left = 68
      Top = 63
      Width = 77
      Height = 22
      TabOrder = 5
    end
  end
  object qryPoupanca: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select Avg( IndicePoupanca ) as Media from Poupanca'
      'where'
      'Data >= :DataInicio and Data <= :DataFim')
    Left = 248
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataFim'
        ParamType = ptUnknown
      end>
    object qryPoupancaMedia: TFloatField
      FieldName = 'Media'
    end
  end
  object tblMensalidades: TUMZQuery
    BeforePost = tblMensalidadesBeforePost
    OnCalcFields = tblMensalidadesCalcFields
    Connection = db
    
    
    SQL.Strings = (
      'select * from Mensalidades')
    Left = 280
    Top = 120
    object tblMensalidadesCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Mensalidades.CodigoAluno'
    end
    object tblMensalidadesParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
      Origin = 'Mensalidades.DataVencimento'
    end
    object tblMensalidadesTurma: TStringField
      DisplayWidth = 15
      FieldName = 'Turma'
      Origin = 'Mensalidades.Turma'
      Size = 15
    end
    object tblMensalidadesDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Mensalidades.DataEmissao'
    end
    object tblMensalidadesNossoNumero: TStringField
      FieldName = 'NossoNumero'
      Origin = 'Mensalidades.NossoNumero'
      Size = 30
    end
    object tblMensalidadesValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'Mensalidades.ValorBruto'
    end
    object tblMensalidadesValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'Mensalidades.ValorDesconto'
    end
    object tblMensalidadesDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'Mensalidades.DescontoExtra'
    end
    object tblMensalidadesValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'Mensalidades.ValorExtra'
    end
    object tblMensalidadesValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'Mensalidades.ValorTotal'
    end
    object tblMensalidadesValorJuros: TFloatField
      FieldName = 'ValorJuros'
      Origin = 'Mensalidades.ValorJuros'
    end
    object tblMensalidadesValorPago: TFloatField
      FieldName = 'ValorPago'
      Origin = 'Mensalidades.ValorPago'
    end
    object tblMensalidadesDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
      Origin = 'Mensalidades.DataPagamento'
    end
    object tblMensalidadesSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Mensalidades.Situacao'
    end
    object tblMensalidadesUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Mensalidades.Usuario'
      Size = 30
    end
    object tblMensalidadesAnoLetivo: TSmallintField
      FieldName = 'AnoLetivo'
      Origin = 'Mensalidades.AnoLetivo'
    end
    object tblMensalidadesSemestre: TSmallintField
      FieldName = 'Semestre'
      Origin = 'Mensalidades.Semestre'
    end
    object tblMensalidadesCodigoCarta: TIntegerField
      FieldName = 'CodigoCarta'
      Origin = 'Mensalidades.CodigoCarta'
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Mensalidades.AnoSemestre'
    end
    object tblMensalidadesDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
      Origin = 'Mensalidades.DataBaseCorrecao'
    end
    object tblMensalidadesIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
      Origin = 'Mensalidades.IndiceCorrecao'
    end
    object tblMensalidadesValorTotalCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      Calculated = True
    end
    object tblMensalidadesValorJurosCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      Calculated = True
    end
    object tblMensalidadesBloqueto: TStringField
      FieldName = 'Bloqueto'
      Origin = 'WMESTRE12.mensalidades.Bloqueto'
      Size = 1
    end
    object tblMensalidadesCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'WMESTRE12.mensalidades.Curso'
      Size = 15
    end
    object tblMensalidadesDepto: TSmallintField
      FieldName = 'Depto'
      Origin = 'WMESTRE12.mensalidades.Depto'
    end
    object tblMensalidadesTipoParcela: TSmallintField
      FieldName = 'TipoParcela'
      Origin = 'WMESTRE12.mensalidades.TipoParcela'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Origin = 'WMESTRE12.mensalidades.cd_mensalidade'
    end
    object tblMensalidadescd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
      Origin = 'WMESTRE12.mensalidades.cd_mensalidade_origem'
    end
    object tblMensalidadescd_forma_pgto: TIntegerField
      FieldName = 'cd_forma_pgto'
      Origin = 'WMESTRE12.mensalidades.cd_forma_pgto'
    end
    object tblMensalidadescd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.mensalidades.cd_coligada'
    end
  end
end

