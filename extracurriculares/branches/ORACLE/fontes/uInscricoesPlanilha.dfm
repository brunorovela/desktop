object frm_Inscricoes_Planilha: Tfrm_Inscricoes_Planilha
  Left = 153
  Top = 121
  Caption = 'Planilha de Inscri'#231#245'es'
  ClientHeight = 517
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'INSCRI'#199#213'ES'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 25
    Width = 792
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object bvTopo: TBevel
      Left = 0
      Top = 35
      Width = 792
      Height = 5
      Align = alTop
      Shape = bsSpacer
    end
    object bvInferior: TBevel
      Left = 0
      Top = 437
      Width = 792
      Height = 5
      Align = alBottom
      Shape = bsSpacer
    end
    object grd: TDBGrid
      Left = 0
      Top = 40
      Width = 792
      Height = 397
      Align = alClient
      DataSource = srcInscricoes
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PESSOA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PESSOA'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_TURMA_MATRICULA'
          Title.Caption = 'Turma'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_MES'
          Width = 50
          Visible = True
        end>
    end
    object pnDatas: TPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 35
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 10
        Width = 89
        Height = 16
        Caption = 'Ano/Semesre:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtAnoSemestre: TMaskEdit
        Left = 113
        Top = 6
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
        TabOrder = 0
        Text = '19931'
      end
      object UpDown2: TUpDown
        Left = 164
        Top = 6
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 1
        OnClick = UpDown2Click
      end
    end
  end
  object tool: TToolBar
    Left = 0
    Top = 492
    Width = 792
    Height = 25
    Align = alBottom
    ButtonWidth = 101
    Caption = 'tool'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    Transparent = False
    object ToolButton9: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btTipoPessoa: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'Tipo de Pessoa'
      DropdownMenu = pmFiltroTipoPessoa
      ImageIndex = 0
      OnClick = btTipoPessoaClick
    end
    object btMes: TToolButton
      Left = 113
      Top = 0
      AutoSize = True
      Caption = 'M'#234's'
      DropdownMenu = pmFiltroMes
      ImageIndex = 0
      OnClick = btMesClick
    end
    object ToolButton4: TToolButton
      Left = 164
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btModalidade: TToolButton
      Left = 172
      Top = 0
      AutoSize = True
      Caption = 'Atividade'
      DropdownMenu = pmFiltroAtividades
      ImageIndex = 0
      OnClick = btModalidadeClick
    end
    object btPessoa: TToolButton
      Left = 247
      Top = 0
      AutoSize = True
      Caption = 'Pessoa'
      DropdownMenu = pmFiltroPessoa
      ImageIndex = 0
      OnClick = btPessoaClick
    end
    object ToolButton5: TToolButton
      Left = 313
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btInscrever: TToolButton
      Left = 321
      Top = 0
      AutoSize = True
      Caption = 'Inscrever'
      ImageIndex = 1
      OnClick = btInscreverClick
    end
    object btRenovarInscricao: TToolButton
      Left = 396
      Top = 0
      AutoSize = True
      Caption = 'Renovar Inscri.'
      DropdownMenu = pmRenovar
      ImageIndex = 1
      OnClick = btRenovarInscricaoClick
    end
    object ToolButton2: TToolButton
      Left = 499
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btFinanceiro: TToolButton
      Left = 507
      Top = 0
      AutoSize = True
      Caption = 'Financeiro'
      ImageIndex = 3
      OnClick = btFinanceiroClick
    end
    object ToolButton8: TToolButton
      Left = 587
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btFechar: TToolButton
      Left = 595
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 2
      OnClick = btFecharClick
    end
    object ToolButton10: TToolButton
      Left = 680
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object toolFinanceiro: TToolBar
    Left = 0
    Top = 467
    Width = 792
    Height = 25
    Align = alBottom
    ButtonWidth = 132
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
    Transparent = False
    Visible = False
    object ToolButton7: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 8
      Top = 0
      Caption = 'Recalcular Valores'
      ImageIndex = 3
      OnClick = ToolButton11Click
    end
    object ToolButton12: TToolButton
      Left = 140
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 148
      Top = 0
      AutoSize = True
      Caption = 'Gerar Mensalidades'
      ImageIndex = 4
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 273
      Top = 0
      AutoSize = True
      Caption = 'Resgatar Pagamentos'
      ImageIndex = 5
      OnClick = ToolButton3Click
    end
    object ToolButton6: TToolButton
      Left = 409
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object qryInscricoes: TUMZQuery
    Connection = DM.db
    BeforeOpen = qryInscricoesBeforeOpen
    AfterClose = qryInscricoesAfterClose
    OnCalcFields = qryInscricoesCalcFields
    SQL.Strings = (
      'SELECT'
      '   P.NM_PESSOA,'
      '   EM.NR_ANOSEMESTRE,'
      '   EM.CD_PESSOA,'
      '   EM.NR_MES,'
      '   EM.CD_TIPO_PESSOA,'
      '   EM.VL_TOTAL,'
      '   EM.VL_DESCONTOS,'
      '   EM.VL_PAGO,'
      '   EM.DT_PAGAMENTO,'
      '   EM.DT_EMISSAO,'
      '   EM.CD_TURMA_MATRICULA'
      'FROM'
      '   EXTRA_MATRICULAS EM '
      '      JOIN PESSOAS P ON'
      '         (EM.CD_PESSOA = P.CD_PESSOA)'
      'WHERE EXISTS'
      '   ('
      '      SELECT'
      '         EMA.CD_ATIVIDADE'
      '      FROM'
      '         EXTRA_MATRICULAS_ATIVIDADES EMA'
      '      WHERE'
      '         EMA.NR_ANOSEMESTRE = EM.NR_ANOSEMESTRE AND'
      '         EMA.CD_PESSOA = EM.CD_PESSOA AND'
      '         EMA.NR_MES = EM.NR_MES'
      '   )'
      'ORDER BY'
      '   P.NM_PESSOA,'
      '   EM.NR_MES')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 524
    Top = 217
    object qryInscricoesNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryInscricoesCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryInscricoesNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qryInscricoesds_mes: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_MES'
      Size = 15
      Calculated = True
    end
    object qryInscricoesCD_TIPO_PESSOA: TIntegerField
      FieldName = 'CD_TIPO_PESSOA'
    end
    object qryInscricoesVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryInscricoesVL_DESCONTOS: TFloatField
      FieldName = 'VL_DESCONTOS'
    end
    object qryInscricoesVL_PAGO: TFloatField
      FieldName = 'VL_PAGO'
    end
    object qryInscricoesDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
    object qryInscricoesDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object qryInscricoesCD_TURMA_MATRICULA: TStringField
      FieldName = 'CD_TURMA_MATRICULA'
      Size = 15
    end
    object qryInscricoesNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryInscricoesField1: TStringField
      FieldKind = fkCalculated
      FieldName = '1'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField2: TStringField
      FieldKind = fkCalculated
      FieldName = '2'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField3: TStringField
      FieldKind = fkCalculated
      FieldName = '3'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField4: TStringField
      FieldKind = fkCalculated
      FieldName = '4'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField5: TStringField
      FieldKind = fkCalculated
      FieldName = '5'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField6: TStringField
      FieldKind = fkCalculated
      FieldName = '6'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField7: TStringField
      FieldKind = fkCalculated
      FieldName = '7'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField8: TStringField
      FieldKind = fkCalculated
      FieldName = '8'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField9: TStringField
      FieldKind = fkCalculated
      FieldName = '9'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField10: TStringField
      FieldKind = fkCalculated
      FieldName = '10'
      Size = 1
      Calculated = True
    end
    object qryInscricoesStringField11: TStringField
      FieldKind = fkCalculated
      FieldName = '11'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField12: TStringField
      FieldKind = fkCalculated
      FieldName = '12'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField13: TStringField
      FieldKind = fkCalculated
      FieldName = '13'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField14: TStringField
      FieldKind = fkCalculated
      FieldName = '14'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField15: TStringField
      FieldKind = fkCalculated
      FieldName = '15'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField16: TStringField
      FieldKind = fkCalculated
      FieldName = '16'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField17: TStringField
      FieldKind = fkCalculated
      FieldName = '17'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField18: TStringField
      FieldKind = fkCalculated
      FieldName = '18'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField19: TStringField
      FieldKind = fkCalculated
      FieldName = '19'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField20: TStringField
      FieldKind = fkCalculated
      FieldName = '20'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField21: TStringField
      FieldKind = fkCalculated
      FieldName = '21'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField22: TStringField
      FieldKind = fkCalculated
      FieldName = '22'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField23: TStringField
      FieldKind = fkCalculated
      FieldName = '23'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField24: TStringField
      FieldKind = fkCalculated
      FieldName = '24'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField25: TStringField
      FieldKind = fkCalculated
      FieldName = '25'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField26: TStringField
      FieldKind = fkCalculated
      FieldName = '26'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField27: TStringField
      FieldKind = fkCalculated
      FieldName = '27'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField28: TStringField
      FieldKind = fkCalculated
      FieldName = '28'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField29: TStringField
      FieldKind = fkCalculated
      FieldName = '29'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField30: TStringField
      FieldKind = fkCalculated
      FieldName = '30'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField31: TStringField
      FieldKind = fkCalculated
      FieldName = '31'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField32: TStringField
      FieldKind = fkCalculated
      FieldName = '32'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField33: TStringField
      FieldKind = fkCalculated
      FieldName = '33'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField34: TStringField
      FieldKind = fkCalculated
      FieldName = '34'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField35: TStringField
      FieldKind = fkCalculated
      FieldName = '35'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField36: TStringField
      FieldKind = fkCalculated
      FieldName = '36'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField37: TStringField
      FieldKind = fkCalculated
      FieldName = '37'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField38: TStringField
      FieldKind = fkCalculated
      FieldName = '38'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField39: TStringField
      FieldKind = fkCalculated
      FieldName = '39'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField40: TStringField
      FieldKind = fkCalculated
      FieldName = '40'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField41: TStringField
      FieldKind = fkCalculated
      FieldName = '41'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField42: TStringField
      FieldKind = fkCalculated
      FieldName = '42'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField43: TStringField
      FieldKind = fkCalculated
      FieldName = '43'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField44: TStringField
      FieldKind = fkCalculated
      FieldName = '44'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField45: TStringField
      FieldKind = fkCalculated
      FieldName = '45'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField46: TStringField
      FieldKind = fkCalculated
      FieldName = '46'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField47: TStringField
      FieldKind = fkCalculated
      FieldName = '47'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField48: TStringField
      FieldKind = fkCalculated
      FieldName = '48'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField49: TStringField
      FieldKind = fkCalculated
      FieldName = '49'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField50: TStringField
      FieldKind = fkCalculated
      FieldName = '50'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField51: TStringField
      FieldKind = fkCalculated
      FieldName = '51'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField52: TStringField
      FieldKind = fkCalculated
      FieldName = '52'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField53: TStringField
      FieldKind = fkCalculated
      FieldName = '53'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField54: TStringField
      FieldKind = fkCalculated
      FieldName = '54'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField55: TStringField
      FieldKind = fkCalculated
      FieldName = '55'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField56: TStringField
      FieldKind = fkCalculated
      FieldName = '56'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField57: TStringField
      FieldKind = fkCalculated
      FieldName = '57'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField58: TStringField
      FieldKind = fkCalculated
      FieldName = '58'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField59: TStringField
      FieldKind = fkCalculated
      FieldName = '59'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField60: TStringField
      FieldKind = fkCalculated
      FieldName = '60'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField61: TStringField
      FieldKind = fkCalculated
      FieldName = '61'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField62: TStringField
      FieldKind = fkCalculated
      FieldName = '62'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField63: TStringField
      FieldKind = fkCalculated
      FieldName = '63'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField64: TStringField
      FieldKind = fkCalculated
      FieldName = '64'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField65: TStringField
      FieldKind = fkCalculated
      FieldName = '65'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField66: TStringField
      FieldKind = fkCalculated
      FieldName = '66'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField67: TStringField
      FieldKind = fkCalculated
      FieldName = '67'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField68: TStringField
      FieldKind = fkCalculated
      FieldName = '68'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField69: TStringField
      FieldKind = fkCalculated
      FieldName = '69'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField70: TStringField
      FieldKind = fkCalculated
      FieldName = '70'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField71: TStringField
      FieldKind = fkCalculated
      FieldName = '71'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField72: TStringField
      FieldKind = fkCalculated
      FieldName = '72'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField73: TStringField
      FieldKind = fkCalculated
      FieldName = '73'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField74: TStringField
      FieldKind = fkCalculated
      FieldName = '74'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField75: TStringField
      FieldKind = fkCalculated
      FieldName = '75'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField76: TStringField
      FieldKind = fkCalculated
      FieldName = '76'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField77: TStringField
      FieldKind = fkCalculated
      FieldName = '77'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField78: TStringField
      FieldKind = fkCalculated
      FieldName = '78'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField79: TStringField
      FieldKind = fkCalculated
      FieldName = '79'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField80: TStringField
      FieldKind = fkCalculated
      FieldName = '80'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField81: TStringField
      FieldKind = fkCalculated
      FieldName = '81'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField82: TStringField
      FieldKind = fkCalculated
      FieldName = '82'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField83: TStringField
      FieldKind = fkCalculated
      FieldName = '83'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField84: TStringField
      FieldKind = fkCalculated
      FieldName = '84'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField85: TStringField
      FieldKind = fkCalculated
      FieldName = '85'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField86: TStringField
      FieldKind = fkCalculated
      FieldName = '86'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField87: TStringField
      FieldKind = fkCalculated
      FieldName = '87'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField88: TStringField
      FieldKind = fkCalculated
      FieldName = '88'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField89: TStringField
      FieldKind = fkCalculated
      FieldName = '89'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField90: TStringField
      FieldKind = fkCalculated
      FieldName = '90'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField91: TStringField
      FieldKind = fkCalculated
      FieldName = '91'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField92: TStringField
      FieldKind = fkCalculated
      FieldName = '92'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField93: TStringField
      FieldKind = fkCalculated
      FieldName = '93'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField94: TStringField
      FieldKind = fkCalculated
      FieldName = '94'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField95: TStringField
      FieldKind = fkCalculated
      FieldName = '95'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField96: TStringField
      FieldKind = fkCalculated
      FieldName = '96'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField97: TStringField
      FieldKind = fkCalculated
      FieldName = '97'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField98: TStringField
      FieldKind = fkCalculated
      FieldName = '98'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField99: TStringField
      FieldKind = fkCalculated
      FieldName = '99'
      Size = 1
      Calculated = True
    end
    object qryInscricoesField100: TStringField
      FieldKind = fkCalculated
      FieldName = '100'
      Size = 1
      Calculated = True
    end
  end
  object srcInscricoes: TDataSource
    DataSet = qryInscricoes
    Left = 556
    Top = 217
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 600
    Top = 216
    object popInscreverPaga: TMenuItem
      Tag = 1
      Caption = 'Inscrever atividade paga'
      OnClick = popInscreverPagaClick
    end
    object PopInscreverIsenta: TMenuItem
      Tag = 2
      Caption = 'Inscrever atividade isenta'
      OnClick = popInscreverPagaClick
    end
    object popCancelarInscricao: TMenuItem
      Tag = 3
      Caption = 'Cancelar Inscri'#231#227'o da atividade'
      OnClick = popInscreverPagaClick
    end
  end
  object pmFiltroAtividades: TPopupMenu
    Left = 192
    Top = 425
    object odos1: TMenuItem
      Caption = 'Todos'
      OnClick = odos1Click
    end
    object Selecionar1: TMenuItem
      Caption = 'Selecionar'
      OnClick = Selecionar1Click
    end
  end
  object ImageList1: TImageList
    Left = 720
    Top = 465
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5AD8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C7B2900C6CEAD009C8C52000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADCECE008CA5A5006B6B5A006B6B
      5A005A6B6B005A6B6B00B5D6D6008C7B2900E7B56B00DEA57B00E7B56B009C8C
      52008CA5A5008CA5A5005A6B6B00ADCECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400ADFFFF009CFFFF009CFF
      FF0052DEFF0052BDD60084630000DEA57B00DEA57B00DEA57B00DEA57B00FF9C
      29008C6B180052DEFF0052C6D600393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400ADFFFF00ADFFFF00ADFF
      FF00ADFFFF0084630000DEA57B00FFFFC600FFFFC600DEA57B00DEA57B00DEA5
      7B00FF9C29008C6B180052DEFF00393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400ADFFFF00ADFFFF00ADFF
      FF00E7BD7B008C6B18008C6B18008C6B1800FFFFC600FFFFC600DEA57B008C6B
      18008C6B18008C6B1800E7BD7B00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400ADFFFF00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF009C7B3100FFFFC600FFFFC600FFF7AD009C7B
      3100B5B5B5009CFFFF0052DEFF00393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400E7DEE700ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00AD8C4200FFFFC600FFFFC600DEA57B00FFD6
      94009CF7FF0052DEFF00ADDED600393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400ADFFFF00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00BD944A00DEA57B00FFF7AD00FFFFC600AD8C42009CF7
      FF009CF7FF009CFFFF0052DEFF005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00E7DEE700ADFFFF00E7DE
      E700ADFFFF00ADFFFF00BD944A00FFE79C00FFF7AD00E7BD7300FFD69400ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500ADFFFF00E7DEE700ADFF
      FF00ADFFFF00AD8C3900DEA57B00FFD69400E7BD7B00ADFFFF00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00ADFFFF00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600E7DEE700ADFFFF00E7DE
      E700D6B56B00D6B56B00D6B56B00D6B56B00EFCE8400C6C6C600C6C6C600ADDE
      D60052BDD60052BDD60052BDD600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5DEDE00B5D6D600B5B5B500B5B5
      B500CECECE00ADDED600ADDED60052DEFF0052DEFF0052DEFF0052DEFF0052DE
      FF0052DEFF0052DEFF007BCEDE00B5D6DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5DEE70000F7FF0000F7
      FF0000F7FF0000F7FF0052BDD600B5E7E700A5BDBD00A5BDBD00A5BDBD00A5BD
      BD00A5BDBD00A5BDBD00A5BDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5C6C6007BF7F70063F7
      FF0063F7FF0063F7FF0031EFF700B5D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5C6C6008C8C
      8C008C8C8C008C8C8C00A5C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      390039393900A5A5A500E7DEE700E7DEE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFF700BDBDA50084845A00CECEB500FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630052DED6003939390052DE
      FF0052DEFF0052DEFF0052DEFF0052DEFF0052DED60052DEFF0052DED60052DE
      FF0052C6D60039393900E7DEE700E7DEE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFE7009C9C
      7B0063634A0063634200189CA50000BDDE00086B730039391800ADA58400EFEF
      DE000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000006363630000F7FF0052DED6003939
      3900ADFFFF0052DEFF0052DEFF0052DEFF0052DEFF0052DEFF0052DEFF0052DE
      D60052DEFF0052DED60039393900E7DEE7000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEE7D6000894A5000094
      AD0000A5BD0000ADC60000ADCE0000B5CE0000BDD60000BDDE0008ADC600106B
      73007B735200E7DECE00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000000000000000000000007373730052FFFF0000F7FF0052DE
      D600393939003939390039393900393939003939390039393900393939003939
      3900393939003939390039393900393939000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000008CBDAD000094AD0000B5
      CE0000CEE70000CEE70000BDD60000A5BD0000BDCE0000C6DE0000BDD60000BD
      DE00108C9C0031391800BDBD9C00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      8400000000008484840000000000000000007373730052FFFF0052FFFF0000F7
      FF0052DED60000F7FF0052DED6009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00B5B5B500E7DEE70000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      00000000000000000000000000000000000000000000F7F7F7006BD6D60008C6
      E70029DEE70031CEDE0010B5CE000094AD00009CAD0000EFFF0000C6DE0000B5
      CE0000C6DE0010737B005A523100E7E7D60000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      84008484840000000000000000000000000084848400ADFFFF0052FFFF0052FF
      FF0000F7FF00EFAD00007B5A0000EFAD0000ADFFFF009CFFFF00ADFFFF009CFF
      FF00ADFFFF009CFFFF0073737300E7DEE70000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFF70042ADB500008CA500008CA500215A5200108C940000AD
      C60000ADCE000094A500294A3100ADAD8C0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C6000000000000000000000000008484840052FFFF00ADFFFF0052FF
      FF0052FFFF007B5A0000DEA57B007B5A0000FFFFFF00ADFFFF009CFFFF00ADFF
      FF009CFFFF00ADFFFF0073737300E7DEE700005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDA50084947B00219CA5000094A50008849400009CAD00009CB500009C
      B500009CB50000C6D60021635200ADAD8C0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C6000000000000000000000000009C9C9C00ADFFFF0052FFFF00EFAD
      0000A5730000A5730000DEA57B00A57300007B5A0000EFAD0000ADFFFF009CFF
      FF00ADFFFF009CFFFF0073737300E7DEE70000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFF70094AD9C002984
      8C0000849C0000849C00008C9C00008C9C00008C9C000094A5000094A5000094
      AD0000D6F70008D6EF006B846B00F7F7E70000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      8400848484000000000000000000000000009C9C9C0052FFFF00ADFFFF00AD7B
      0000FFFFCE00DEA57B00DEA57B00DEA57B00DEA57B007B5A0000ADFFFF00ADFF
      FF009CFFFF00ADFFFF0084848400E7DEE700005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FFFFFF00A5BDAD00087B8C000073
      8C00007B9400008494000084940000849C00008C9C000094AD0000A5BD0000B5
      CE0000D6F70039ADAD00CECEB5000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      840000000000000000000000000000000000A5A5A500A5A5A50052C6D600F7D6
      6B00E7B52100E7B52900F7CE6B00AD7B0000AD7B0000F7CE6B00ADFFFF009CFF
      FF00ADFFFF009CFFFF008C8C8C00E7DEE70000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000008CB5AD0000637B00006B7B000073
      84000094A50000ADC60000849C00006B730008525A00089CBD0008A5BD0029AD
      BD00EFEFE70000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000E7DEE700A5A5A50000F7FF0000F7
      FF0000F7FF00F7BD2900FFFFCE00AD7B0000ADFFFF00ADFFFF00ADFFFF0052DE
      FF0052DEFF0052C6D6009C9C9C00E7DEE700005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000004A8C84000063730000637300005A
      6B000094AD0008ADC6000073840000637300006B7300314A3100C6BD9C000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000E7DEE7009C9C9C0052FFFF0063F7
      FF0063F7FF00FFD66B00FFCE3100F7CE6B00ADFFFF00ADFFFF00B5B5B500A5A5
      A5008C8C8C0084848400A5A5A500E7DEE700005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000C6D6C60010637300005A6B000063
      73001039390018423900006B7B00005A6B00005A6300293921004A4221004252
      2900CECEB500FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000E7DEE700E7DEE7009C9C9C008C8C
      8C008C8C8C00B5B5B50094949400FFFFFF00ADFFFF00FFFFFF00A5A5A500E7E7
      E700DEDEDE00DEDEDE00B5B5B500E7DEE70000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000E7E7DE0039848C000063
      7B00005A6B0000636B00005A73000063730000636B000063730000637300005A
      6B0063633900F7F7E700000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600000000000000
      000000000000000000000000000000000000E7DEE700E7DEE700E7DEE700E7DE
      E700E7DEE700E7DEE70094949400FFFFFF00FFFFFF00ADFFFF00A5A5A500FFFF
      FF00E7E7E700B5B5B500E7DEE700E7DEE70000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      000000000000000000000000000000000000000000000000000000000000CED6
      C600005A6B00006B7B00005A630000526300087B8C0000849C0000849400007B
      94009C9C7B00FFFFF700000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000E7DEE700E7DEE700E7DEE700E7DE
      E700E7DEE700E7DEE70094949400FFFFFF00FFFFFF00FFFFFF008C8C8C00FFFF
      FF00B5B5B500E7DEE700E7DEE700E7DEE700000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6DECE00188494000063730008424A0039524200C6CEBD00E7E7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7DEE700E7DEE700E7DEE700E7DE
      E700E7DEE700E7DEE700B5B5B5009C9C9C009C9C9C008C8C8C0084848400C6C6
      C600E7DEE700E7DEE700E7DEE700E7DEE7000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFE7009CB5A500A5B5A500F7F7F700000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFBF00000000FFFFFF1F00000000
      FFFF000000000000FFFF000000000000FC7F000000000000FD7F000000000000
      FD7F000000000000E10F000000000000EFEF000000000000E10F000000000000
      FD7F000000000000FD7F000000000000FC7F000000000000FFFF800100000000
      FFFF80FF00000000FFFFC1FF00000000FFFF8000FFFFFC1F000C0000E3FFC00F
      0008000083FF800300010000000F800000030000003F800000030000002FF800
      00030000000FF00000030000000F800000030000000100010007000000010007
      000F00000001001F000F0000000F0003000F0000000F8003001F0000002FE003
      003F0000803FF80F007F0000E3FFFC3F00000000000000000000000000000000
      000000000000}
  end
  object pmFiltroTipoPessoa: TPopupMenu
    Left = 24
    Top = 417
  end
  object pmFiltroMes: TPopupMenu
    Left = 120
    Top = 425
    object mes0: TMenuItem
      AutoCheck = True
      Caption = 'Todos'
      Checked = True
      OnClick = mesClick
    end
    object N1: TMenuItem
      AutoCheck = True
      Caption = '-'
    end
    object mes1: TMenuItem
      AutoCheck = True
      Caption = 'Janeiro'
      OnClick = mesClick
    end
    object mes2: TMenuItem
      AutoCheck = True
      Caption = 'Fevereiro'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes3: TMenuItem
      AutoCheck = True
      Caption = 'Mar'#231'o'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes4: TMenuItem
      AutoCheck = True
      Caption = 'Abril'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes5: TMenuItem
      AutoCheck = True
      Caption = 'Maio'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes6: TMenuItem
      AutoCheck = True
      Caption = 'Junho'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes7: TMenuItem
      AutoCheck = True
      Caption = 'Julho'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes8: TMenuItem
      AutoCheck = True
      Caption = 'Agosto'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes9: TMenuItem
      AutoCheck = True
      Caption = 'Setembro'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes10: TMenuItem
      AutoCheck = True
      Caption = 'Outubro'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes11: TMenuItem
      AutoCheck = True
      Caption = 'Novembro'
      GroupIndex = 1
      OnClick = mesClick
    end
    object mes12: TMenuItem
      AutoCheck = True
      Caption = 'Dezembro'
      GroupIndex = 1
      OnClick = mesClick
    end
  end
  object pmFiltroPessoa: TPopupMenu
    Left = 288
    Top = 425
    object odos2: TMenuItem
      Caption = 'Todos'
      OnClick = odos2Click
    end
    object Selecionat1: TMenuItem
      Caption = 'Selecionar'
      OnClick = Selecionat1Click
    end
  end
  object pmRenovar: TPopupMenu
    Left = 520
    Top = 465
    object MenuItem1: TMenuItem
      Caption = 'Renovar para:'
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object Rmes1: TMenuItem
      Tag = 1
      Caption = 'Janeiro'
      OnClick = RenovarInscriClick
    end
    object Rmes2: TMenuItem
      Tag = 2
      Caption = 'Fevereiro'
      OnClick = RenovarInscriClick
    end
    object Rmes3: TMenuItem
      Tag = 3
      Caption = 'Mar'#231'o'
      OnClick = RenovarInscriClick
    end
    object Rmes4: TMenuItem
      Tag = 4
      Caption = 'Abril'
      OnClick = RenovarInscriClick
    end
    object Rmes5: TMenuItem
      Tag = 5
      Caption = 'Maio'
      OnClick = RenovarInscriClick
    end
    object Rmes6: TMenuItem
      Tag = 6
      Caption = 'Junho'
      OnClick = RenovarInscriClick
    end
    object Rmes7: TMenuItem
      Tag = 7
      Caption = 'Julho'
      OnClick = RenovarInscriClick
    end
    object Rmes8: TMenuItem
      Tag = 8
      Caption = 'Agosto'
      OnClick = RenovarInscriClick
    end
    object Rmes9: TMenuItem
      Tag = 9
      Caption = 'Setembro'
      OnClick = RenovarInscriClick
    end
    object Rmes10: TMenuItem
      Tag = 10
      Caption = 'Outubro'
      OnClick = RenovarInscriClick
    end
    object Rmes11: TMenuItem
      Tag = 11
      Caption = 'Novembro'
      OnClick = RenovarInscriClick
    end
    object Rmes12: TMenuItem
      Tag = 12
      Caption = 'Dezembro'
      OnClick = RenovarInscriClick
    end
  end
  object qryMatriculas: TUMZQuery
    Connection = DM.db
    AfterInsert = qryMatriculasAfterInsert
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NR_ANOSEMESTRE,'
      '   NR_MES,'
      '   CD_TIPO_PESSOA,'
      '   VL_TOTAL,'
      '   VL_DESCONTOS,'
      '   VL_PAGO,'
      '   DT_EMISSAO,'
      '   DT_PAGAMENTO,'
      '   CD_TURMA_MATRICULA'
      'FROM'
      '   EXTRA_MATRICULAS'
      '')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 520
    Top = 296
    object qryMatriculasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryMatriculasnm_pessoa: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_PESSOA'
      LookupDataSet = DM.qyPessoas
      LookupKeyFields = 'cd_pessoa'
      LookupResultField = 'nm_pessoa'
      KeyFields = 'cd_pessoa'
      Lookup = True
    end
    object qryMatriculasNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
      Required = True
    end
    object qryMatriculasNR_MES: TIntegerField
      FieldName = 'NR_MES'
      Required = True
    end
    object qryMatriculasCD_TIPO_PESSOA: TIntegerField
      FieldName = 'CD_TIPO_PESSOA'
    end
    object qryMatriculasVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryMatriculasVL_DESCONTOS: TFloatField
      FieldName = 'VL_DESCONTOS'
    end
    object qryMatriculasVL_PAGO: TFloatField
      FieldName = 'VL_PAGO'
    end
    object qryMatriculasDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object qryMatriculasDT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
    end
    object qryMatriculasCD_TURMA_MATRICULA: TStringField
      FieldName = 'CD_TURMA_MATRICULA'
      Size = 15
    end
  end
  object qyMatriculaAtividades: TUMZQuery
    Connection = DM.db
    AfterInsert = qyMatriculaAtividadesAfterInsert
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   extra_matriculas_atividades'
      '')
    Params = <>
    UpdateMode = umUpdateAll
    Left = 520
    Top = 328
    object qyMatriculaAtividadesnr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
      Required = True
    end
    object qyMatriculaAtividadescd_atividade: TIntegerField
      FieldName = 'cd_atividade'
      Required = True
    end
    object qyMatriculaAtividadescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object qyMatriculaAtividadesnr_mes: TIntegerField
      FieldName = 'nr_mes'
      Required = True
    end
    object qyMatriculaAtividadesvl_atividade: TFloatField
      FieldName = 'vl_atividade'
    end
    object qyMatriculaAtividadesds_observacao: TMemoField
      FieldName = 'ds_observacao'
      BlobType = ftMemo
    end
    object qyMatriculaAtividadessn_paga: TSmallintField
      FieldName = 'sn_paga'
      Required = True
    end
  end
  object qyInscricoesAtividades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  :nr_anosemestre,'
      '  :cd_atividade,'
      '  :cd_pessoa,'
      '  :nr_mes,'
      '  :vl_atividade,'
      '  :sn_paga'
      'FROM'
      '  dual')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_paga'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO extra_matriculas_atividades '#13#10'    (nr_anose' +
        'mestre, '#13#10'     cd_atividade, '#13#10'     cd_pessoa, '#13#10'     nr_mes,'#13#10' ' +
        '    vl_atividade,'#13#10'     sn_paga'#13#10'    ) VALUES ('#13#10'     :nr_anosem' +
        'estre,'#13#10'     :cd_atividade,'#13#10'     :cd_pessoa,'#13#10'     :nr_mes,'#13#10'  ' +
        '   :vl_atividade,'#13#10'     :sn_paga'#13#10'    )'
      
        'oracle=MERGE INTO extra_matriculas_atividades ma USING'#13#10'   (SELE' +
        'CT :nr_anosemestre as nr_anosemestre, :cd_atividade as cd_ativid' +
        'ade, :cd_pessoa as cd_pessoa, :nr_mes as nr_mes, :vl_atividade a' +
        's vl_atividade, :sn_paga as sn_paga FROM dual) ma2 ON (ma.nr_ano' +
        'semestre = ma2.nr_anosemestre AND ma.cd_atividade = ma2.cd_ativi' +
        'dade AND ma.cd_pessoa = ma2.cd_pessoa AND ma.nr_mes = ma2.nr_mes' +
        ') '#13#10'   WHEN MATCHED THEN '#13#10'      UPDATE SET ma.vl_atividade = ma' +
        '2.vl_atividade, ma.sn_paga = ma2.sn_paga'#13#10'   WHEN NOT MATCHED TH' +
        'EN '#13#10'      INSERT (ma.nr_anosemestre, ma.cd_atividade, ma.cd_pes' +
        'soa, ma.nr_mes, ma.vl_atividade, ma.sn_paga) VALUES (ma2.nr_anos' +
        'emestre, ma2.cd_atividade, ma2.cd_pessoa, ma2.nr_mes, ma2.vl_ati' +
        'vidade, ma2.sn_paga)')
    Left = 520
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_paga'
        ParamType = ptUnknown
      end>
  end
  object qryRenova: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  :mes_renovar,'
      '  :nr_anosemestre,'
      '  :nr_mes,'
      '  :cd_pessoa'
      'FROM'
      '  dual')
    Params = <
      item
        DataType = ftUnknown
        Name = 'mes_renovar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    SQLList.Strings = (
      
        'mysql-5=REPLACE INTO extra_matriculas_atividades'#13#10'  (nr_anosemes' +
        'tre, cd_atividade, cd_pessoa, nr_mes, vl_atividade, sn_paga)'#13#10'  ' +
        ' SELECT'#13#10'      ema.nr_anosemestre, ema.cd_atividade, ema.cd_pess' +
        'oa, :mes_renovar, IF(ema.sn_paga=1, evp.vl_atividade, 0),  ema.s' +
        'n_paga'#13#10'   FROM'#13#10'      extra_matriculas em,'#13#10'      extra_matricu' +
        'las_atividades ema,'#13#10'      extra_valores_pessoas evp'#13#10'   WHERE'#13#10 +
        '      em.cd_pessoa = ema.cd_pessoa AND'#13#10'      em.nr_anosemestre ' +
        '= ema.nr_anosemestre AND'#13#10'      em.nr_mes = ema.nr_mes AND'#13#10'    ' +
        '  ema.cd_atividade = evp.cd_atividade AND'#13#10'      ema.nr_anosemes' +
        'tre = evp.nr_anosemestre AND'#13#10'      evp.cd_tipo_pessoa = em.cd_t' +
        'ipo_pessoa AND'#13#10'      ema.nr_anosemestre = :nr_anosemestre AND'#13#10 +
        '      ema.nr_mes = :nr_mes AND'#13#10'      ema.cd_pessoa = :cd_pessoa'
      
        'oracle=MERGE INTO EXTRA_MATRICULAS_ATIVIDADES MA USING'#13#10'('#13#10'   SE' +
        'LECT'#13#10'      EMA.NR_ANOSEMESTRE,'#13#10'      EMA.CD_ATIVIDADE,'#13#10'      ' +
        'EMA.CD_PESSOA,'#13#10'      :MES_RENOVAR AS NR_MES,'#13#10'      CASE EMA.SN' +
        '_PAGA'#13#10'         WHEN 1 THEN EVP.VL_ATIVIDADE'#13#10'         ELSE 0'#13#10' ' +
        '     END VL_ATIVIDADE,'#13#10'      EMA.SN_PAGA'#13#10'   FROM'#13#10'      EXTRA_' +
        'MATRICULAS EM,'#13#10'      EXTRA_MATRICULAS_ATIVIDADES EMA,'#13#10'      EX' +
        'TRA_VALORES_PESSOAS EVP'#13#10'   WHERE'#13#10'      EM.CD_PESSOA = EMA.CD_P' +
        'ESSOA AND'#13#10'      EM.NR_ANOSEMESTRE = EMA.NR_ANOSEMESTRE AND'#13#10'   ' +
        '   EM.NR_MES = EMA.NR_MES AND'#13#10'      EMA.CD_ATIVIDADE = EVP.CD_A' +
        'TIVIDADE AND'#13#10'      EMA.NR_ANOSEMESTRE = EVP.NR_ANOSEMESTRE AND'#13 +
        #10'      EVP.CD_TIPO_PESSOA = EM.CD_TIPO_PESSOA AND'#13#10'      EMA.NR_' +
        'ANOSEMESTRE = :NR_ANOSEMESTRE AND'#13#10'      EMA.NR_MES = :NR_MES AN' +
        'D'#13#10'      EMA.CD_PESSOA = :CD_PESSOA'#13#10') MA2 ON'#13#10'('#13#10'   MA.NR_ANOSE' +
        'MESTRE = MA2.NR_ANOSEMESTRE AND'#13#10'   MA.CD_ATIVIDADE = MA2.CD_ATI' +
        'VIDADE AND'#13#10'   MA.CD_PESSOA = MA2.CD_PESSOA AND'#13#10'   MA.NR_MES = ' +
        'MA2.NR_MES'#13#10')'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET'#13#10'      MA.VL_ATI' +
        'VIDADE = MA2.VL_ATIVIDADE,'#13#10'      MA.SN_PAGA = MA2.SN_PAGA'#13#10'WHEN' +
        ' NOT MATCHED THEN'#13#10'   INSERT'#13#10'   ('#13#10'      MA.NR_ANOSEMESTRE,'#13#10'  ' +
        '    MA.CD_ATIVIDADE,'#13#10'      MA.CD_PESSOA,'#13#10'      MA.NR_MES,'#13#10'   ' +
        '   MA.VL_ATIVIDADE,'#13#10'      MA.SN_PAGA'#13#10'   )'#13#10'   VALUES'#13#10'   ('#13#10'  ' +
        '    MA2.NR_ANOSEMESTRE,'#13#10'      MA2.CD_ATIVIDADE,'#13#10'      MA2.CD_P' +
        'ESSOA,'#13#10'      MA2.NR_MES,'#13#10'      MA2.VL_ATIVIDADE,'#13#10'      MA2.SN' +
        '_PAGA'#13#10'   )')
    Left = 520
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mes_renovar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_mes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qryAtividades: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'CD_ATIVIDADE'
    SQL.Strings = (
      'SELECT'
      '   CD_ATIVIDADE,'
      '   DS_ATIVIDADE,'
      '   DS_SIGLA'
      'FROM'
      '   EXTRA_ATIVIDADES'
      'WHERE'
      '   NR_ANOSEMESTRE = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'CD_ATIVIDADE Asc'
    Left = 320
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qryAtividadesCD_ATIVIDADE: TIntegerField
      FieldName = 'CD_ATIVIDADE'
      Required = True
    end
    object qryAtividadesDS_ATIVIDADE: TStringField
      FieldName = 'DS_ATIVIDADE'
      Size = 50
    end
    object qryAtividadesDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
    end
  end
  object qryUpdValores: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '   EXTRA_MATRICULAS'
      'SET'
      '   VL_TOTAL = :VL_TOTAL,'
      '   VL_DESCONTOS = :VL_DESCONTO'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA AND'
      '   NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   NR_MES = :NR_MES')
    Params = <
      item
        DataType = ftUnknown
        Name = 'VL_TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VL_TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_DESCONTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
  end
  object qryTiposPessoa: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'DS_TIPO_PESSOA'
    SQL.Strings = (
      'SELECT'
      '   CD_TIPO_PESSOA,'
      '   DS_TIPO_PESSOA,'
      '   SN_ATIVO,'
      '   TP_PESSOA,'
      '   DS_OBSERVACAO'
      'FROM'
      '   EXTRA_TIPOS_PESSOAS'
      'WHERE'
      '   SN_ATIVO = 1')
    Params = <>
    IndexFieldNames = 'DS_TIPO_PESSOA Asc'
    Left = 584
    Top = 384
    object qryTiposPessoaCD_TIPO_PESSOA: TIntegerField
      FieldName = 'CD_TIPO_PESSOA'
      Required = True
    end
    object qryTiposPessoaDS_TIPO_PESSOA: TStringField
      FieldName = 'DS_TIPO_PESSOA'
      Size = 50
    end
    object qryTiposPessoaSN_ATIVO: TSmallintField
      FieldName = 'SN_ATIVO'
    end
    object qryTiposPessoaTP_PESSOA: TStringField
      FieldName = 'TP_PESSOA'
      Size = 1
    end
    object qryTiposPessoaDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
  end
end
