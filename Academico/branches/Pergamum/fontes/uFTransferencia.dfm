object fTransferencia: TfTransferencia
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Transfer'#234'ncia Interna de Curso'
  ClientHeight = 544
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = ProcessaTeclasAtalho
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvSep1: TBevel
    Left = 0
    Top = 22
    Width = 794
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 792
  end
  object bvSep2: TBevel
    Left = 0
    Top = 272
    Width = 794
    Height = 3
    Align = alTop
    ExplicitTop = 305
    ExplicitWidth = 792
  end
  object bvSep3: TBevel
    Left = 0
    Top = 519
    Width = 794
    Height = 3
    Align = alBottom
    ExplicitLeft = -8
    ExplicitTop = 477
    ExplicitWidth = 792
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'TRANSFER'#202'NCIA DE CURSO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnMatricula: TPanel
    Left = 0
    Top = 25
    Width = 794
    Height = 247
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbAluno: TLabel
      Left = 8
      Top = 26
      Width = 204
      Height = 13
      Caption = 'C'#211'DIGO DO ALUNO - NOME DO ALUNO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnMatriculaTitulo: TPanel
      Left = 0
      Top = 0
      Width = 794
      Height = 20
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      BorderWidth = 2
      Caption = 'INFORMA'#199#213'ES DE MATR'#205'CULA'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object gbOrigem: TGroupBox
      Left = 8
      Top = 45
      Width = 385
      Height = 189
      Caption = 'MATR'#205'CULA DE ORIGEM'
      TabOrder = 1
      object lbOTTurma: TLabel
        Left = 16
        Top = 51
        Width = 34
        Height = 13
        Caption = 'Turma:'
      end
      object lbOTurma: TLabel
        Left = 160
        Top = 51
        Width = 106
        Height = 13
        Caption = 'TURMA DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTGrade: TLabel
        Left = 16
        Top = 78
        Width = 111
        Height = 13
        Caption = 'Grade - Ano/Semestre:'
      end
      object lbOGrade: TLabel
        Left = 160
        Top = 78
        Width = 169
        Height = 13
        Caption = 'C'#211'DIGO DA GRADE DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTAnoSem: TLabel
        Left = 16
        Top = 134
        Width = 117
        Height = 13
        Caption = 'Ano/Semestre Ingresso:'
      end
      object lbOAnoSem: TLabel
        Left = 160
        Top = 134
        Width = 151
        Height = 13
        Caption = 'ANO/SEMESTRE DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTTurno: TLabel
        Left = 16
        Top = 106
        Width = 32
        Height = 13
        Caption = 'Turno:'
      end
      object lbOTurno: TLabel
        Left = 160
        Top = 106
        Width = 103
        Height = 13
        Caption = 'TURNO DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTFormaIngresso: TLabel
        Left = 16
        Top = 161
        Width = 92
        Height = 13
        Caption = 'Forma de ingresso:'
      end
      object lbOFormaIngresso: TLabel
        Left = 160
        Top = 161
        Width = 175
        Height = 13
        Caption = 'FORMA DE INGRESSO NO CURSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTCurso: TLabel
        Left = 16
        Top = 24
        Width = 32
        Height = 13
        Caption = 'Curso:'
      end
      object lbOCurso: TLabel
        Left = 160
        Top = 24
        Width = 103
        Height = 13
        Caption = 'CURSO DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object gbDestino: TGroupBox
      Left = 399
      Top = 45
      Width = 385
      Height = 189
      Caption = 'NOVA MATR'#205'CULA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object bnSelTurma: TSpeedButton
        Left = 303
        Top = 48
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
        OnClick = SelecionaTurma
      end
      object bnSelCurso: TSpeedButton
        Left = 303
        Top = 21
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
        OnClick = SelecionaCurso
      end
      object lbDTGrade: TLabel
        Left = 16
        Top = 78
        Width = 111
        Height = 13
        Caption = 'Grade - Ano/Semestre:'
      end
      object lbDTTurno: TLabel
        Left = 16
        Top = 106
        Width = 32
        Height = 13
        Caption = 'Turno:'
      end
      object lbDTAnoSem: TLabel
        Left = 16
        Top = 134
        Width = 117
        Height = 13
        Caption = 'Ano/Semestre Ingresso:'
      end
      object lbDTFormaIngresso: TLabel
        Left = 16
        Top = 161
        Width = 94
        Height = 13
        Caption = 'Forma de Ingresso:'
      end
      object lbDTCurso: TLabel
        Left = 16
        Top = 24
        Width = 32
        Height = 13
        Caption = 'Curso:'
      end
      object lbDTTurma: TLabel
        Left = 16
        Top = 51
        Width = 34
        Height = 13
        Caption = 'Turma:'
      end
      object cbDGrade: TComboBox
        Left = 170
        Top = 75
        Width = 156
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 3
        OnSelect = SelecionaGrade
      end
      object cbDTurno: TComboBox
        Left = 170
        Top = 103
        Width = 156
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 4
        OnSelect = SelecionaTurno
      end
      object meAnoSem: TMaskEdit
        Left = 170
        Top = 131
        Width = 51
        Height = 21
        EditMask = '9999/9;0;_'
        MaxLength = 6
        TabOrder = 5
      end
      object udDAnoSem: TUpDown
        Left = 227
        Top = 131
        Width = 17
        Height = 21
        Min = -100
        TabOrder = 0
        OnClick = IncDecAnoSemestre
      end
      object cbDFormaIngresso: TComboBox
        Left = 170
        Top = 158
        Width = 212
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 6
        OnSelect = SelecionaFormaIngresso
      end
      object edDCurso: TEdit
        Left = 170
        Top = 21
        Width = 127
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edDTurma: TEdit
        Left = 170
        Top = 48
        Width = 127
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object tbAcoes: TToolBar
    Left = 0
    Top = 522
    Width = 794
    Height = 22
    Align = alBottom
    ButtonWidth = 89
    Images = ilImagens
    List = True
    ShowCaptions = True
    TabOrder = 2
    object bnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object bnConfirmar: TToolButton
      Left = 8
      Top = 0
      Caption = 'F5 Confirmar'
      ImageIndex = 0
      OnClick = ProcessaTransferencia
    end
    object bnSep2: TToolButton
      Left = 97
      Top = 0
      Width = 8
      ImageIndex = 0
      Style = tbsSeparator
    end
    object bnFechar: TToolButton
      Left = 105
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 1
      OnClick = Fecha
    end
    object bnSep3: TToolButton
      Left = 194
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
  end
  object pnFinanceiro: TPanel
    Left = 0
    Top = 275
    Width = 794
    Height = 244
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 3
    object pnFinanceiroTitulo: TPanel
      Left = 1
      Top = 1
      Width = 792
      Height = 20
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      BorderWidth = 2
      Caption = 'INFORMA'#199#213'ES FINANCEIRAS'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object gbPlanoPagtoOrigem: TGroupBox
      Left = 8
      Top = 82
      Width = 385
      Height = 151
      Caption = 'PLANO DE PAGAMENTO ATUAL'
      TabOrder = 1
      object lbOTDesc: TLabel
        Left = 16
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object lbODesc: TLabel
        Left = 160
        Top = 24
        Width = 211
        Height = 13
        Caption = 'DESCRICAO DO PLANO DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object loOTParcelas: TLabel
        Left = 16
        Top = 56
        Width = 44
        Height = 13
        Caption = 'Parcelas:'
      end
      object lbOParcelas: TLabel
        Left = 160
        Top = 56
        Width = 124
        Height = 13
        Caption = 'N'#218'MERO DE PARCELAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTValor: TLabel
        Left = 16
        Top = 88
        Width = 81
        Height = 13
        Caption = 'Valor da Parcela:'
      end
      object lbOValor: TLabel
        Left = 160
        Top = 88
        Width = 109
        Height = 13
        Caption = 'VALOR DA PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOTValorContrato: TLabel
        Left = 17
        Top = 120
        Width = 89
        Height = 13
        Caption = 'Valor do Contrato:'
      end
      object lbOValorContrato: TLabel
        Left = 160
        Top = 120
        Width = 119
        Height = 13
        Caption = 'VALOR DO CONTRATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object gbPlanoPagtoDestino: TGroupBox
      Left = 399
      Top = 82
      Width = 385
      Height = 151
      Caption = 'NOVO PLANO DE PAGAMENTO'
      TabOrder = 2
      object lbDTDesc: TLabel
        Left = 16
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object lbDTParcelas: TLabel
        Left = 16
        Top = 56
        Width = 44
        Height = 13
        Caption = 'Parcelas:'
      end
      object lbDParcelas: TLabel
        Left = 128
        Top = 56
        Width = 113
        Height = 13
        Caption = 'N'#218'MERO DE PARCELAS'
      end
      object lbDTValor: TLabel
        Left = 16
        Top = 88
        Width = 81
        Height = 13
        Caption = 'Valor da Parcela:'
      end
      object lbDValor: TLabel
        Left = 128
        Top = 88
        Width = 98
        Height = 13
        Caption = 'VALOR DA PARCELA'
      end
      object lbDTValorContrato: TLabel
        Left = 16
        Top = 120
        Width = 89
        Height = 13
        Caption = 'Valor do Contrato:'
      end
      object lbDValorContrato: TLabel
        Left = 128
        Top = 120
        Width = 110
        Height = 13
        Caption = 'VALOR DO CONTRATO'
      end
      object cbPlanoPagto: TComboBox
        Left = 128
        Top = 21
        Width = 254
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 0
        OnSelect = SelecionaPlano
      end
    end
    object rgOpcoesFin: TRadioGroup
      Left = 8
      Top = 27
      Width = 773
      Height = 49
      Caption = 'OP'#199#213'ES PARA GERA'#199#195'O DO FINANCEIRO'
      Columns = 3
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'Manter valores financeiros atuais'
        'Gerar novo financeiro'
        'Ajustar cr'#233'ditos')
      TabOrder = 3
      OnClick = SelecionaFormaFin
    end
  end
  object ilImagens: TImageList
    Left = 744
    Top = 432
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B4B4B004B4B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000BF2A004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000BF2A004B4B4B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000DF000000DF000000BF2A004B4B4B00000000000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000DF000000FF090000DF000000DF000000BF2A004B4B4B000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000000FF2A0000DF000000FF090000DF000000DF000000BF2A004B4B
      4B000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FF000000FF2A0000DF000000FF090000DF000000DF000000BF
      2A004B4B4B00000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF2A0000DF000000FF090000DF000000DF
      0000007F000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F000055FFAA0000FF090000FF090000FF2A0000DF000055FFAA00007F
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF090000FF090000FF2A00007F00000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFF2A0000FF090000FF0900AAFF2A00007F0000000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA0000FF0900AAFF2A00007F000000000000000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00AAFFAA00007F00000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F0000AAFFAA00007F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F9FFFFFF00000000F0FFE3FF00000000
      F07F83FF00000000F03F000F00000000F01F003F00000000F00F002F00000000
      F007000F00000000F007000F00000000F00F000100000000F01F000100000000
      F03F000100000000F07F000F00000000F0FF000F00000000F1FF002F00000000
      FBFF803F00000000FFFFE3FF0000000000000000000000000000000000000000
      000000000000}
  end
  object qyFormasIngresso: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_ingresso,'
      '   ds_ingresso,'
      '   cd_padrao'
      'FROM'
      '   matriculas_ingresso')
    Params = <>
    Left = 728
    Top = 48
  end
  object qyGrades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'CD_GRADE,'
      #9'CD_CURSO'
      'FROM'
      #9'grades'
      'WHERE'
      #9'CD_CURSO = :curso')
    Params = <
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 696
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
  end
  object qyPlanosPagto: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   p.CD_PLANO codigo,'
      '   p.CD_COLIGADA,'
      '   p.NR_ANOSEMESTRE anosemestre,'
      '   p.NR_PARCELAS parcelas,'
      '   p.NR_TAXASMATERIAL numerotaxasmaterial,'
      '   p.NR_DIAS_PARCELA_ZERO nr_dias_parczero,'
      '   p.NR_MAX_DISCIPLINAS nr_max_disciplinas,'
      '   p.CD_TIPO_PLANO cd_tipo_plano,'
      '   pt.CD_TURMA turma,'
      '   pt.CD_CURSO curso,'
      '   p.DS_PARAGRAFO3 paragrafo3,'
      '   p.VL_COBRADO valorcobrado,'
      '   p.VL_CONTRATO valorcontrato,'
      '   p.VL_TAXAMATERIAL taxamaterial,'
      '   p.VL_TAXAAPOSTILA taxaapostila,'
      '   p.VL_DESCONTO desconto,'
      '   p.VL_MATRICULA matricula,'
      '   p.NR_CREDITOS_BASE nr_creditos_base,'
      '   p.DT_APARTIR apartir,'
      '   p.SN_DIAS_UTEIS sn_dias_uteis,'
      '   p.SN_CREDITOS sn_creditos,'
      '   p.DS_PLANO descricao'
      'FROM'
      '   fin_planos as p INNER JOIN fin_planos_turmas as pt'
      '   ON (pt.CD_PLANO = p.CD_PLANO)'
      'WHERE'
      '   (pt.CD_TURMA = :turma ) AND'
      '   (p.NR_ANOSEMESTRE = :anosemestre) ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 760
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
  end
  object qyPlanosPgtoParc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   p.CD_PLANO codigo,'
      '   p.CD_COLIGADA,'
      '   p.NR_ANOSEMESTRE anosemestre,'
      '   p.NR_PARCELAS parcelas,'
      '   p.NR_TAXASMATERIAL numerotaxasmaterial,'
      '   p.NR_DIAS_PARCELA_ZERO nr_dias_parczero,'
      '   p.NR_MAX_DISCIPLINAS nr_max_disciplinas,'
      '   p.CD_TIPO_PLANO cd_tipo_plano,'
      '   pt.CD_TURMA turma,'
      '   pt.CD_CURSO curso,'
      '   p.DS_PARAGRAFO3 paragrafo3,'
      '   p.VL_COBRADO valorcobrado,'
      '   p.VL_CONTRATO valorcontrato,'
      '   p.VL_TAXAMATERIAL taxamaterial,'
      '   p.VL_TAXAAPOSTILA taxaapostila,'
      '   p.VL_DESCONTO desconto,'
      '   p.VL_MATRICULA matricula,'
      '   p.NR_CREDITOS_BASE nr_creditos_base,'
      '   p.DT_APARTIR apartir,'
      '   p.SN_DIAS_UTEIS sn_dias_uteis,'
      '   p.SN_CREDITOS sn_creditos,'
      '   p.DS_PLANO descricao'
      'FROM'
      '   fin_planos as p INNER JOIN fin_planos_turmas as pt'
      '   ON (pt.CD_PLANO = p.CD_PLANO)'
      'WHERE'
      '   (pt.CD_TURMA = :turma ) AND'
      '   (p.NR_ANOSEMESTRE = :anosemestre) AND'
      
        '   ( p.NR_PARCELAS = (SELECT NR_PARCELAS FROM fin_planos WHERE C' +
        'D_PLANO = :codigo) )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    Left = 760
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object qyTurnos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'tu.codigo,'
      #9'tu.descricao'
      'FROM'
      #9'turnos tu'
      'JOIN turmas t ON('
      #9't.turno = tu.codigo'
      ')'
      'WHERE'
      #9't.codigo = :turma'
      #9'AND t.anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 728
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
  end
  object qyGruposAtividadesAluno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  dg.cd_grupo,'
      #9'dg.nm_grupo,'
      '  dgp.cd_pessoa,'
      '  d.descricao nm_disciplina,'
      '  p.nm_pessoa'
      'FROM'
      '  diario_grupos dg'
      #9'INNER JOIN diario_grupos_pessoas dgp ON ('
      #9#9'dgp.cd_grupo =  dg.cd_grupo AND'
      '    dgp.dt_saida IS NULL'
      #9')'
      '  INNER JOIN disciplinas d ON ('
      #9#9'dg.cd_disciplina = d.codigo AND'
      #9#9'dg.cd_curso = d.curso'
      #9')'
      '  INNER JOIN pessoas p ON (p.cd_pessoa = dgp.cd_pessoa)'
      'WHERE'
      #9'dg.nr_anosemestre = :nr_anosemestre AND'
      #9'dg.cd_curso LIKE :cd_curso AND'
      #9'dg.cd_turma LIKE :cd_turma AND'
      #9'dg.sn_ativo = 1 AND'
      #9'dgp.cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 664
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qyInativarAluno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  diario_grupos_pessoas'
      'SET'
      
        '  dt_saida = CASE WHEN :dt_saida >= dt_entrada THEN :dt_saida EL' +
        'SE NOW() END'
      'WHERE'
      '  cd_pessoa = :cd_pessoa AND'
      '  cd_grupo = :cd_grupo AND'
      '  dt_saida IS NULL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dt_saida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end>
    Left = 632
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt_saida'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_grupo'
        ParamType = ptUnknown
      end>
  end
end
