object frmProcuraCheque: TfrmProcuraCheque
  Left = 339
  Top = 272
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Digite os dados do Cheque'
  ClientHeight = 505
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pcBuscar: TPageControl
    Left = 0
    Top = 0
    Width = 533
    Height = 464
    ActivePage = tsIncAlt
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object tsBuscar: TTabSheet
      Caption = 'Buscar'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 55
        Top = 32
        Width = 82
        Height = 16
        Caption = 'N'#186' do Banco:'
      end
      object Label5: TLabel
        Left = 43
        Top = 73
        Width = 94
        Height = 16
        Caption = 'N'#186' da Ag'#234'ncia:'
      end
      object Label6: TLabel
        Left = 77
        Top = 114
        Width = 60
        Height = 16
        Caption = 'N'#186' da CC:'
      end
      object Label7: TLabel
        Left = 46
        Top = 155
        Width = 91
        Height = 16
        Caption = 'N'#186' do Cheque:'
      end
      object Label9: TLabel
        Left = 43
        Top = 196
        Width = 94
        Height = 16
        Caption = 'Compensa'#231#227'o:'
      end
      object txtCheque_Banco: TEdit
        Left = 156
        Top = 30
        Width = 146
        Height = 24
        TabOrder = 0
        OnKeyPress = txtValor
      end
      object txtCheque_Agencia: TEdit
        Left = 156
        Top = 69
        Width = 146
        Height = 24
        TabOrder = 1
        OnKeyPress = txtValor
      end
      object txtCheque_CC: TEdit
        Left = 156
        Top = 111
        Width = 146
        Height = 24
        TabOrder = 2
        OnKeyPress = txtValor
      end
      object txtCheque_nro: TEdit
        Left = 156
        Top = 152
        Width = 146
        Height = 24
        TabOrder = 3
        OnKeyPress = txtValor
      end
      object txtCheque_Data: TMaskEdit
        Left = 156
        Top = 194
        Width = 146
        Height = 24
        EditMask = '!99/99/00;1;_'
        MaxLength = 8
        TabOrder = 4
        Text = '  /  /  '
        OnKeyPress = txtValor
      end
    end
    object tsBuscarAvancado: TTabSheet
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label12: TLabel
        Left = 3
        Top = 9
        Width = 109
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dados Acad'#234'micos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 7
        Top = 35
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano/Sem:'
      end
      object Label15: TLabel
        Left = 137
        Top = 35
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aluno:'
      end
      object sbBuscaAluno: TSpeedButton
        Left = 276
        Top = 31
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
        OnClick = sbBuscaAlunoClick
      end
      object Label18: TLabel
        Left = 2
        Top = 328
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 23
        Top = 93
        Width = 33
        Height = 13
        Caption = 'Banco:'
      end
      object Label20: TLabel
        Left = 187
        Top = 94
        Width = 42
        Height = 13
        Caption = 'Ag'#234'ncia:'
      end
      object Label21: TLabel
        Left = 168
        Top = 126
        Width = 61
        Height = 13
        Caption = 'C. Corrente:'
      end
      object Label22: TLabel
        Left = 2
        Top = 124
        Width = 55
        Height = 13
        Caption = 'N. Cheque:'
      end
      object Label23: TLabel
        Left = 3
        Top = 65
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dados do Cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 3
        Top = 229
        Width = 126
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de Compensa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataAte: TLabel
        Left = 159
        Top = 252
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 'at'#233
      end
      object Label30: TLabel
        Left = 2
        Top = 380
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Conta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmissaoAte: TLabel
        Left = 159
        Top = 300
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 'at'#233
      end
      object Label32: TLabel
        Left = 3
        Top = 277
        Width = 93
        Height = 13
        Caption = 'Data de Emiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FLbTitVlCheque: TLabel
        Left = 3
        Top = 154
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor do cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 314
        Top = 35
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Titular:'
      end
      object sbBuscaTitular: TSpeedButton
        Left = 456
        Top = 31
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
        OnClick = sbBuscaTitularClick
      end
      object mskAnoSem: TMaskEdit
        Tag = 1
        Left = 61
        Top = 31
        Width = 48
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
        Text = '20051'
      end
      object udAnoSem: TUpDown
        Left = 110
        Top = 31
        Width = 13
        Height = 21
        TabOrder = 18
        OnClick = udAnoSemClick
      end
      object txtAluno: TEdit
        Left = 173
        Top = 31
        Width = 103
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
      end
      object cbListaSituacao: TComboBox
        Left = 21
        Top = 347
        Width = 468
        Height = 29
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 0
        ParentFont = False
        TabOrder = 16
      end
      object edABanco: TEdit
        Left = 61
        Top = 89
        Width = 100
        Height = 21
        TabOrder = 2
        OnKeyPress = txtValor
      end
      object edAAgencia: TEdit
        Left = 234
        Top = 89
        Width = 100
        Height = 21
        TabOrder = 3
        OnKeyPress = txtValor
      end
      object edACheque: TEdit
        Left = 61
        Top = 121
        Width = 100
        Height = 21
        TabOrder = 4
        OnKeyPress = txtValor
      end
      object edACCorrente: TEdit
        Left = 234
        Top = 121
        Width = 100
        Height = 21
        TabOrder = 5
        OnKeyPress = txtValor
      end
      object ckbData: TCheckBox
        Left = 23
        Top = 251
        Width = 37
        Height = 17
        Caption = 'De:'
        TabOrder = 10
        OnClick = ckbDataClick
      end
      object dtVencInicial: TDateTimePicker
        Left = 62
        Top = 249
        Width = 91
        Height = 21
        Date = 38051.000000000000000000
        Time = 38051.000000000000000000
        TabOrder = 11
      end
      object dtVencFinal: TDateTimePicker
        Left = 182
        Top = 248
        Width = 91
        Height = 21
        Date = 38051.000000000000000000
        Time = 38051.000000000000000000
        Enabled = False
        TabOrder = 12
      end
      object cbListaConta: TComboBox
        Left = 21
        Top = 402
        Width = 468
        Height = 29
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 0
        ParentFont = False
        TabOrder = 17
      end
      object dtEmissaoAte: TDateTimePicker
        Left = 182
        Top = 296
        Width = 91
        Height = 21
        Date = 38051.000000000000000000
        Time = 38051.000000000000000000
        Enabled = False
        TabOrder = 15
      end
      object dtEmissaoDe: TDateTimePicker
        Left = 62
        Top = 297
        Width = 91
        Height = 21
        Date = 38051.000000000000000000
        Time = 38051.000000000000000000
        TabOrder = 14
      end
      object ckbEmissao: TCheckBox
        Left = 23
        Top = 299
        Width = 37
        Height = 17
        Caption = 'De:'
        TabOrder = 13
        OnClick = ckbEmissaoClick
      end
      object FCbVlMenorIgual: TCheckBox
        Left = 21
        Top = 204
        Width = 103
        Height = 17
        Caption = 'Menor ou igual '#224':'
        TabOrder = 8
        OnClick = habilitaFiltroValor
      end
      object FCbVlMaiorIgual: TCheckBox
        Left = 21
        Top = 173
        Width = 103
        Height = 17
        Caption = 'Maior ou igual '#224':'
        TabOrder = 6
        OnClick = habilitaFiltroValor
      end
      object FEdVlMenorIgual: TEdit
        Left = 130
        Top = 202
        Width = 107
        Height = 21
        Enabled = False
        TabOrder = 9
        OnExit = fimDigitacaoValor
        OnKeyPress = recebeValorCheque
      end
      object FEdVlMaiorIgual: TEdit
        Left = 130
        Top = 171
        Width = 107
        Height = 21
        Enabled = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        OnExit = fimDigitacaoValor
        OnKeyPress = recebeValorCheque
      end
      object txtnm_titular: TEdit
        Left = 354
        Top = 31
        Width = 103
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 19
      end
    end
    object tsIncAlt: TTabSheet
      Caption = 'Inclus'#227'o/Altera'#231#227'o'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 26
        Top = 247
        Width = 45
        Height = 14
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 37
        Top = 110
        Width = 34
        Height = 14
        Caption = 'Banco:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 28
        Top = 75
        Width = 43
        Height = 14
        Caption = 'Ag'#234'ncia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 13
        Top = 144
        Width = 58
        Height = 14
        Caption = 'C. Corrente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 18
        Top = 38
        Width = 53
        Height = 14
        Caption = 'N. Cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 9
        Top = 9
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dados do Cheque:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = -110
        Top = 242
        Width = 45
        Height = 14
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 42
        Top = 176
        Width = 28
        Height = 14
        Caption = 'Valor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = -1
        Top = 212
        Width = 72
        Height = 14
        Caption = 'Compensa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btnCodigoAluno: TSpeedButton
        Left = 482
        Top = 68
        Width = 23
        Height = 24
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
      object Label3: TLabel
        Left = 252
        Top = 51
        Width = 90
        Height = 14
        Caption = 'C'#243'digo da Pessoa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 252
        Top = 121
        Width = 178
        Height = 14
        Caption = 'Associar o cheque com as parcelas:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 2
        Top = 349
        Width = 69
        Height = 14
        Caption = 'Observa'#231#245'es:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 253
        Top = 99
        Width = 30
        Height = 14
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbNome: TLabel
        Left = 289
        Top = 99
        Width = 3
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 40
        Top = 282
        Width = 31
        Height = 14
        Alignment = taRightJustify
        Caption = 'Conta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbPessoa: TLabel
        Left = 253
        Top = 9
        Width = 206
        Height = 42
        Caption = 
          'Selecione um c'#243'digo de pessoa para relacionar o cheque com um t'#237 +
          'tulo j'#225' baixado.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label31: TLabel
        Left = 39
        Top = 316
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = 'Titular:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object edIBanco: TEdit
        Left = 77
        Top = 105
        Width = 148
        Height = 24
        TabOrder = 2
        OnKeyPress = txtValor
      end
      object edIAgencia: TEdit
        Left = 77
        Top = 70
        Width = 148
        Height = 24
        TabOrder = 1
        OnKeyPress = txtValor
      end
      object edINumero: TEdit
        Left = 77
        Top = 33
        Width = 148
        Height = 24
        TabOrder = 0
        OnKeyPress = txtValor
      end
      object edIConta: TEdit
        Left = 77
        Top = 139
        Width = 148
        Height = 24
        TabOrder = 3
        OnKeyPress = txtValor
      end
      object edIValor: TEdit
        Left = 77
        Top = 173
        Width = 148
        Height = 24
        TabOrder = 4
        OnKeyPress = edIValorKePress
      end
      object dtICompensacao: TDateTimePicker
        Left = 77
        Top = 208
        Width = 148
        Height = 24
        Date = 38051.000000000000000000
        Time = 38051.000000000000000000
        TabOrder = 5
      end
      object cbISituacao: TComboBox
        Left = 77
        Top = 242
        Width = 148
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 0
        ParentFont = False
        TabOrder = 6
      end
      object clbParcelas: TCheckListBox
        Left = 252
        Top = 138
        Width = 253
        Height = 125
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 15
        Items.Strings = (
          'Parc. num dd/mm/AAAA valor')
        ParentFont = False
        TabOrder = 7
        OnEnter = clbParcelasEnter
      end
      object edAluno: TEdit
        Left = 252
        Top = 68
        Width = 227
        Height = 24
        TabOrder = 8
        OnKeyPress = txtValor
      end
      object mmObservacoes: TMemo
        Left = 77
        Top = 345
        Width = 428
        Height = 78
        TabOrder = 9
      end
      object cbContas: TComboBox
        Left = 77
        Top = 277
        Width = 428
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 10
      end
      object Ednm_titular: TEdit
        Left = 77
        Top = 311
        Width = 428
        Height = 24
        TabOrder = 11
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 464
    Width = 533
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 143
      Top = 8
      Width = 114
      Height = 25
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
    object btnCancel: TBitBtn
      Left = 272
      Top = 8
      Width = 112
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
  end
  object qyParcelas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   M.CD_MENSALIDADE,'
      '   M.PARCELA,'
      '   M.DATAPAGAMENTO,'
      '   M.VALORPAGO,'
      '   C.CD_CHEQUE'
      'FROM'
      '   MENSALIDADES M'
      '      LEFT JOIN FIN_CHEQUES_MENSALIDADES C ON'
      '         (M.CD_MENSALIDADE = C.CD_MENSALIDADE) AND'
      '         (C.CD_CHEQUE = :CHEQUE)'
      'WHERE'
      '   M.SITUACAO IN (0,1) AND'
      '   M.CODIGOALUNO = :ALUNO AND'
      '   M.CD_COLIGADA IN ( %s )'
      'ORDER BY'
      '   M.DATAPAGAMENTO DESC,'
      '   M.PARCELA ASC')
    Params = <
      item
        DataType = ftLargeint
        Name = 'cheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'aluno'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 58
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'cheque'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'aluno'
        ParamType = ptUnknown
      end>
  end
end
