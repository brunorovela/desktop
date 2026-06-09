object frmConfirmarMatricula: TfrmConfirmarMatricula
  Left = 257
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Confirma'#231#227'o de Matr'#237'cula...'
  ClientHeight = 276
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 539
    Height = 232
    ActivePage = tsPlano
    TabOrder = 0
    OnChange = PageControl1Change
    object tsPlano: TTabSheet
      Caption = 'Planos de Pagamento'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 529
        Height = 201
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Panel2'
        TabOrder = 0
        object grd2: TDBGrid
          Left = 8
          Top = 8
          Width = 513
          Height = 185
          DataSource = dtcPlanos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmQtd
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = grd2DblClick
          OnKeyPress = grd2KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 184
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Turma'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Parcelas'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TaxaMaterial'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TaxaApostila'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorCobrado'
              Width = 68
              Visible = True
            end>
        end
      end
    end
    object tsVencimentos: TTabSheet
      Caption = 'Vencimentos'
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 529
        Height = 201
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 168
          Top = 26
          Width = 33
          Height = 14
          Caption = 'dia '#250'til.'
        end
        object Label5: TLabel
          Left = 45
          Top = 86
          Width = 71
          Height = 14
          Caption = 'A partir do dia:'
        end
        object btnPlanosDesconto: TButton
          Left = 17
          Top = 122
          Width = 206
          Height = 25
          Caption = 'F5 Planos de Desconto...'
          TabOrder = 0
          OnClick = btnPlanosDescontoClick
        end
        object radUtil: TRadioButton
          Left = 24
          Top = 26
          Width = 100
          Height = 17
          Caption = '&Calcular para o :'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object txtDiaUtil: TEdit
          Left = 128
          Top = 23
          Width = 33
          Height = 22
          TabOrder = 2
          Text = '6'
          OnEnter = txtDiaUtilEnter
          OnExit = txtDiaUtilExit
          OnKeyPress = txtDiaUtilKeyPress
        end
        object radSempre: TRadioButton
          Left = 24
          Top = 59
          Width = 153
          Height = 17
          Caption = 'Calcular &sempre para o dia:'
          TabOrder = 3
        end
        object txtSempreDia: TEdit
          Left = 179
          Top = 56
          Width = 33
          Height = 22
          TabOrder = 4
          Text = '15'
          OnEnter = txtSempreDiaEnter
          OnExit = txtSempreDiaExit
          OnKeyPress = txtDiaUtilKeyPress
        end
        object txtApartir: TMaskEdit
          Left = 123
          Top = 82
          Width = 89
          Height = 22
          TabOrder = 5
          OnExit = txtApartirExit
          OnKeyPress = txtApartirKeyPress
        end
        object btnExecutarPlano: TButton
          Left = 17
          Top = 159
          Width = 206
          Height = 25
          Caption = 'F6 Executar Plano...'
          TabOrder = 6
          OnClick = btnExecutarPlanoClick
        end
        object lst: TCheckListBox
          Left = 226
          Top = 4
          Width = 286
          Height = 185
          OnClickCheck = lstClickCheck
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 7
          OnMouseUp = lstMouseUp
        end
      end
    end
    object tsImprimir: TTabSheet
      Caption = 'Imprimir'
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 529
        Height = 201
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Panel5'
        TabOrder = 0
        object btnRecibo: TButton
          Left = 16
          Top = 16
          Width = 113
          Height = 25
          Caption = 'F7 Recibo...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnReciboClick
        end
        object btnRequerimento: TButton
          Left = 16
          Top = 64
          Width = 113
          Height = 25
          Caption = 'F8 Requerimento...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnRequerimentoClick
        end
        object btnBloqueto: TButton
          Left = 16
          Top = 112
          Width = 113
          Height = 25
          Caption = 'F9 Bloqueto...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnBloquetoClick
        end
        object btnContrato: TButton
          Left = 16
          Top = 160
          Width = 113
          Height = 25
          Caption = 'F10 Contrato...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnContratoClick
        end
        object chkList: TCheckListBox
          Left = 144
          Top = 16
          Width = 377
          Height = 169
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 4
        end
      end
    end
  end
  object btnFechar: TButton
    Left = 458
    Top = 245
    Width = 89
    Height = 25
    Caption = 'F12 Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object btnImprimir: TButton
    Left = 362
    Top = 245
    Width = 89
    Height = 25
    Caption = 'F6 Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object tblPlanos: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'select * from PlanosPagamento'
      'where Turma = :Turma and'
      'AnoSemestre = :AnoSemestre')
    Left = 392
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblPlanosCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Origin = 'PlanosPagamento.Codigo'
    end
    object tblPlanosTurma: TStringField
      Alignment = taCenter
      FieldName = 'Turma'
      Origin = 'PlanosPagamento.Turma'
      Size = 15
    end
    object tblPlanosParcelas: TSmallintField
      DisplayLabel = 'Parc.'
      FieldName = 'Parcelas'
      Origin = 'PlanosPagamento.Parcelas'
    end
    object tblPlanosValorCobrado: TFloatField
      DisplayLabel = 'Vl. Cobrado'
      DisplayWidth = 8
      FieldName = 'ValorCobrado'
      Origin = 'PlanosPagamento.ValorCobrado'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosValorContrato: TFloatField
      FieldName = 'ValorContrato'
      Origin = 'PlanosPagamento.ValorContrato'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosTaxaMaterial: TFloatField
      DisplayLabel = 'Tx. Material'
      DisplayWidth = 8
      FieldName = 'TaxaMaterial'
      Origin = 'PlanosPagamento.TaxaMaterial'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosTaxaApostila: TFloatField
      DisplayLabel = 'Tx. Apostila'
      DisplayWidth = 8
      FieldName = 'TaxaApostila'
      Origin = 'PlanosPagamento.TaxaApostila'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosDesconto: TFloatField
      FieldName = 'Desconto'
      Origin = 'PlanosPagamento.Desconto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosMatricula: TFloatField
      FieldName = 'Matricula'
      Origin = 'PlanosPagamento.Matricula'
    end
    object tblPlanosApartir: TDateTimeField
      FieldName = 'Apartir'
      Origin = 'PlanosPagamento.Apartir'
    end
    object tblPlanosNumeroTaxasMaterial: TSmallintField
      FieldName = 'NumeroTaxasMaterial'
      Origin = 'PlanosPagamento.NumeroTaxasMaterial'
    end
    object tblPlanosAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'PlanosPagamento.Codigo'
    end
    object tblPlanosDescricao: TStringField
      DisplayLabel = 'Plano'
      FieldName = 'Descricao'
      Origin = 'PlanosPagamento.AnoSemestre'
    end
  end
  object dtcPlanos: TDataSource
    DataSet = tblPlanos
    Left = 392
    Top = 216
  end
  object tblItensPagamento: TUMZQuery
    Connection = db
    
    DataSource = dtcPlanos
    SQL.Strings = (
      'select * from ItensPlanosPagamento where'
      'CodigoPlano = :Codigo'
      'order by Parcela')
    Left = 360
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object tblItensPagamentoCodigoPlano: TIntegerField
      FieldName = 'CodigoPlano'
      Origin = 'ItensPlanosPagamento.CodigoPlano'
    end
    object tblItensPagamentoMes: TSmallintField
      FieldName = 'Mes'
      Origin = 'ItensPlanosPagamento.Mes'
    end
    object tblItensPagamentoParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'ItensPlanosPagamento.Parcela'
    end
    object tblItensPagamentoValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'ItensPlanosPagamento.ValorBruto'
    end
    object tblItensPagamentoValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'ItensPlanosPagamento.ValorDesconto'
    end
    object tblItensPagamentoValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'ItensPlanosPagamento.ValorExtra'
    end
    object tblItensPagamentoDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'ItensPlanosPagamento.DescontoExtra'
    end
    object tblItensPagamentoValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'ItensPlanosPagamento.ValorTotal'
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end

