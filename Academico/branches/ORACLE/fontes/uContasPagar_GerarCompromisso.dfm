object frm_ContasPagar_GerarCompromisso: Tfrm_ContasPagar_GerarCompromisso
  Left = 220
  Top = 111
  BorderStyle = bsDialog
  Caption = 'Gerar Compromisso a Pagar'
  ClientHeight = 416
  ClientWidth = 742
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
    Left = 0
    Top = 0
    Width = 742
    Height = 10
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 406
    Width = 742
    Height = 10
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 10
    Width = 10
    Height = 396
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel4: TBevel
    Left = 732
    Top = 10
    Width = 10
    Height = 396
    Align = alRight
    Shape = bsSpacer
  end
  object pgCompromisso: TPageControl
    Left = 10
    Top = 10
    Width = 722
    Height = 396
    ActivePage = tsInfGerais
    Align = alClient
    MultiLine = True
    TabOrder = 0
    OnChanging = pgCompromissoChanging
    object tsInfGerais: TTabSheet
      Caption = 'Informa'#231#245'es Gerais'
      object Bevel5: TBevel
        Left = 0
        Top = 339
        Width = 714
        Height = 28
        Align = alBottom
        Shape = bsTopLine
      end
      object sbAvancar: TSpeedButton
        Left = 624
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F6 Avan'#231'ar'
        Flat = True
        Glyph.Data = {
          DA010000424DDA010000000000003600000028000000090000000F0000000100
          180000000000A4010000C30E0000C30E00000000000000000000E3DFE04B4B4B
          4B4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000BF2A4B
          4B4BE3DFE0E3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000BF2A4B4B
          4BE3DFE0E3DFE0E3DFE0E3DFE000007F0000DF0000DF0000DF0000BF2A4B4B4B
          E3DFE0E3DFE0E3DFE000007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BE3
          DFE0E3DFE000007F0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4BE3DF
          E000007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B4B00007F
          0055FFAA00FF0900FF2A00DF0000FF0900DF0000DF00007F0000007F0055FFAA
          00FF0900FF0900FF2A00DF0055FFAA007F00E3DFE000007F00AAFF2A00FF0900
          FF0900FF0900FF2A007F00E3DFE0E3DFE000007F00AAFF2A00FF0900FF09AAFF
          2A007F00E3DFE0E3DFE0E3DFE000007F00AAFFAA00FF09AAFF2A007F00E3DFE0
          E3DFE0E3DFE0E3DFE000007F00AAFFAAAAFFAA007F00E3DFE0E3DFE0E3DFE0E3
          DFE0E3DFE000007F00AAFFAA007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DF
          E000E3DFE0007F00E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE000}
        OnClick = sbAvancarClick
      end
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 59
        Height = 14
        Caption = 'Fornecedor:'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 256
        Top = 56
        Width = 45
        Height = 14
        Caption = 'Hist'#243'rico:'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 232
        Top = 104
        Width = 112
        Height = 14
        Caption = 'N'#250'mero do Documento:'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 8
        Top = 152
        Width = 102
        Height = 14
        Caption = 'Data de Lan'#231'amento:'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 368
        Top = 152
        Width = 99
        Height = 14
        Caption = 'Data de Vencimento:'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 456
        Top = 104
        Width = 68
        Height = 14
        Caption = 'Valor do T'#237'tulo'
        FocusControl = DBEdit7
      end
      object Label10: TLabel
        Left = 8
        Top = 104
        Width = 66
        Height = 14
        Caption = 'Tipo de T'#237'tulo:'
      end
      object Bevel7: TBevel
        Left = 152
        Top = 24
        Width = 553
        Height = 22
      end
      object Label1: TLabel
        Left = 152
        Top = 8
        Width = 30
        Height = 14
        Caption = 'Nome:'
      end
      object SpeedButton1: TSpeedButton
        Left = 112
        Top = 24
        Width = 23
        Height = 22
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
        OnClick = SpeedButton1Click
      end
      object lbNomeFornecedor: TLabel
        Left = 157
        Top = 27
        Width = 32
        Height = 16
        Caption = '        '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbCancelar: TSpeedButton
        Left = 539
        Top = 345
        Width = 85
        Height = 22
        Caption = 'Cancelar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
          FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbCancelarClick
      end
      object Label17: TLabel
        Left = 6
        Top = 56
        Width = 81
        Height = 14
        Caption = 'Plano de Contas:'
      end
      object Label18: TLabel
        Left = 184
        Top = 152
        Width = 87
        Height = 14
        Caption = 'Data Compet'#234'ncia'
        FocusControl = DBEdit1
      end
      object Label19: TLabel
        Left = 544
        Top = 152
        Width = 106
        Height = 14
        Caption = 'Data p/ Prov'#225'vel Pgto.'
        FocusControl = DBEdit8
      end
      object Label20: TLabel
        Left = 6
        Top = 200
        Width = 87
        Height = 14
        Caption = 'Centro de Custos:'
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 22
        DataField = 'cd_pessoa'
        DataSource = srcCompromisso
        TabOrder = 0
        OnExit = DBEdit2Exit
      end
      object DBEdit3: TDBEdit
        Left = 256
        Top = 72
        Width = 449
        Height = 22
        DataField = 'ds_despesa'
        DataSource = srcCompromisso
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 232
        Top = 120
        Width = 209
        Height = 22
        DataField = 'nr_documento'
        DataSource = srcCompromisso
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 8
        Top = 168
        Width = 160
        Height = 22
        DataField = 'dt_emissao'
        DataSource = srcCompromisso
        Enabled = False
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 368
        Top = 168
        Width = 160
        Height = 22
        DataField = 'dt_vencimento'
        DataSource = srcCompromisso
        TabOrder = 8
      end
      object DBEdit7: TDBEdit
        Left = 456
        Top = 120
        Width = 144
        Height = 22
        DataField = 'vl_despesa'
        DataSource = srcCompromisso
        TabOrder = 5
      end
      object DBCheckBox1: TDBCheckBox
        Left = 8
        Top = 296
        Width = 241
        Height = 17
        Caption = 'Somente para Previs'#227'o de Compromisso'
        DataField = 'sn_previsao'
        DataSource = srcCompromisso
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 8
        Top = 120
        Width = 209
        Height = 22
        DataField = 'cd_tipo_titulo'
        DataSource = srcCompromisso
        KeyField = 'cd_tipo_titulo'
        ListField = 'ds_tipo_titulo'
        TabOrder = 3
      end
      object DBComboBox1: TDBComboBox
        Left = 6
        Top = 72
        Width = 243
        Height = 22
        Style = csDropDownList
        DataField = 'ds_conta'
        DataSource = srcPlanoContas
        ItemHeight = 14
        TabOrder = 1
        OnChange = dcxPlanoContasChange
      end
      object DBEdit1: TDBEdit
        Left = 184
        Top = 168
        Width = 160
        Height = 22
        DataField = 'dt_competencia'
        DataSource = srcCompromisso
        TabOrder = 7
      end
      object DBEdit8: TDBEdit
        Left = 544
        Top = 168
        Width = 160
        Height = 22
        DataField = 'dt_provavel_pgto'
        DataSource = srcCompromisso
        TabOrder = 9
      end
      object DBComboBox2: TDBComboBox
        Left = 6
        Top = 216
        Width = 339
        Height = 22
        Style = csDropDownList
        DataField = 'ds_centro'
        DataSource = srcPlanoContas
        ItemHeight = 14
        TabOrder = 10
        OnChange = dcxCentroCustosChange
      end
    end
    object tsPlanoContas: TTabSheet
      Caption = 'Plano de Contas'
      ImageIndex = 1
      object Bevel6: TBevel
        Left = 0
        Top = 339
        Width = 714
        Height = 28
        Align = alBottom
        Shape = bsTopLine
      end
      object sbVoltar: TSpeedButton
        Left = 455
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F5 Voltar'
        Flat = True
        Glyph.Data = {
          DA010000424DDA010000000000003600000028000000090000000F0000000100
          180000000000A4010000C30E0000C30E00000000000000000000E3DFE0E3DFE0
          E3DFE0E3DFE0E3DFE0E3DFE04B4B4B4B4B4BE3DFE000E3DFE0E3DFE0E3DFE0E3
          DFE0E3DFE04B4B4B00BF2A00DF00007F0000E3DFE0E3DFE0E3DFE0E3DFE04B4B
          4B00BF2A00DF0000DF00007F0000E3DFE0E3DFE0E3DFE04B4B4B00BF2A00DF00
          00DF0000DF00007F0000E3DFE0E3DFE04B4B4B00BF2A00DF0000DF0000FF0900
          DF00007F0000E3DFE04B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A007F
          00004B4B4B00BF2A00DF0000DF0000FF0900DF0000FF2A55FF00007F0000007F
          0000DF0000DF0000FF0900DF0000FF2A00FF0955FFAA007F0000E3DFE0007F00
          55FFAA00DF0000FF2A00FF0900FF0955FFAA007F0000E3DFE0E3DFE0007F0000
          FF2A00FF0900FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0007F00AAFF
          2A00FF0900FF09AAFF2A007F0000E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFF2A
          00FF09AAFFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAAAA
          FFAA007F0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00AAFFAA007F
          0000E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0007F00E3DFE000}
        OnClick = sbVoltarClick
      end
      object sbFinalizar: TSpeedButton
        Left = 625
        Top = 345
        Width = 85
        Height = 22
        Caption = 'F6 Finalizar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          00000000000000000000000000000084840000000000FF00FF00FF00FF000000
          0000008484000084840000848400008484000084840000848400008484000084
          84000084840000848400008484000084840000000000FF00FF00FF00FF000000
          0000008484000084840000000000000000000000000000000000000000000000
          00000000000000000000008484000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF000000
          00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbFinalizarClick
      end
      object sbCancelarPlanoContas: TSpeedButton
        Left = 540
        Top = 345
        Width = 85
        Height = 22
        Caption = 'Cancelar'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
          FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        OnClick = sbCancelarPlanoContasClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 97
        Align = alTop
        TabOrder = 0
        object Label12: TLabel
          Left = 16
          Top = 8
          Width = 104
          Height = 14
          Caption = 'Valor Total informado:'
        end
        object Bevel8: TBevel
          Left = 16
          Top = 23
          Width = 113
          Height = 22
        end
        object DBText1: TDBText
          Left = 22
          Top = 26
          Width = 65
          Height = 17
          DataField = 'vl_entrada'
          DataSource = srcMovimentacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 152
          Top = 8
          Width = 59
          Height = 14
          Caption = 'Fornecedor:'
        end
        object Label14: TLabel
          Left = 16
          Top = 50
          Width = 135
          Height = 14
          Caption = 'Descri'#231#227'o do Compromisso:'
        end
        object Bevel9: TBevel
          Left = 152
          Top = 23
          Width = 553
          Height = 22
        end
        object Bevel10: TBevel
          Left = 16
          Top = 66
          Width = 689
          Height = 22
        end
        object lbNomeFornecedor2: TLabel
          Left = 157
          Top = 27
          Width = 40
          Height = 16
          Caption = '          '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 21
          Top = 69
          Width = 678
          Height = 17
          DataField = 'ds_despesa'
          DataSource = srcCompromisso
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 153
        Width = 714
        Height = 186
        Align = alClient
        DataSource = srcPlanoContas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_conta'
            Title.Caption = 'Plano de Contas'
            Width = 210
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pc_cd_classificacao'
            Title.Caption = 'Classifica'#231#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_centro'
            Title.Caption = 'Centro de Custos'
            Width = 210
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pcc_cd_classificacao'
            Title.Caption = 'Classifica'#231#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_movimento'
            Title.Caption = 'Valor'
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 97
        Width = 714
        Height = 56
        Align = alTop
        TabOrder = 2
        object sbIncluirPlano: TSpeedButton
          Left = 681
          Top = 24
          Width = 23
          Height = 22
          Hint = 'Incluir Plano de Contas'
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000000000000000000000000000FF00FF00000000000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = sbIncluirPlanoClick
        end
        object Label8: TLabel
          Left = 6
          Top = 8
          Width = 81
          Height = 14
          Caption = 'Plano de Contas:'
        end
        object Label9: TLabel
          Left = 286
          Top = 8
          Width = 87
          Height = 14
          Caption = 'Centro de Custos:'
        end
        object Label11: TLabel
          Left = 566
          Top = 8
          Width = 28
          Height = 14
          Caption = 'Valor:'
          FocusControl = deValor
        end
        object Label15: TLabel
          Left = 206
          Top = 8
          Width = 68
          Height = 14
          Caption = 'Classifica'#231#227'o:'
        end
        object Label16: TLabel
          Left = 486
          Top = 8
          Width = 68
          Height = 14
          Caption = 'Classifica'#231#227'o:'
        end
        object dcxPlanoContas: TDBComboBox
          Left = 6
          Top = 24
          Width = 200
          Height = 22
          Style = csDropDownList
          DataField = 'ds_conta'
          DataSource = srcPlanoContas
          ItemHeight = 14
          TabOrder = 0
          OnChange = dcxPlanoContasChange
        end
        object dcxCentroCustos: TDBComboBox
          Left = 286
          Top = 24
          Width = 200
          Height = 22
          Style = csDropDownList
          DataField = 'ds_centro'
          DataSource = srcPlanoContas
          ItemHeight = 14
          TabOrder = 2
          OnChange = dcxCentroCustosChange
        end
        object deValor: TDBEdit
          Left = 568
          Top = 24
          Width = 96
          Height = 22
          DataField = 'vl_movimento'
          DataSource = srcPlanoContas
          TabOrder = 4
        end
        object dcxPCClassificacao: TDBComboBox
          Left = 206
          Top = 24
          Width = 67
          Height = 22
          Style = csDropDownList
          DataField = 'pc_cd_classificacao'
          DataSource = srcPlanoContas
          ItemHeight = 14
          TabOrder = 1
          OnChange = dcxPlanoContasChange2
        end
        object dcxPCCClassificacao: TDBComboBox
          Left = 486
          Top = 24
          Width = 67
          Height = 22
          Style = csDropDownList
          DataField = 'pcc_cd_classificacao'
          DataSource = srcPlanoContas
          ItemHeight = 14
          TabOrder = 3
          OnChange = dcxCentroCustosChange2
        end
      end
    end
  end
  object srcCompromisso: TDataSource
    DataSet = qyCompromisso
    Left = 56
    Top = 368
  end
  object qyCompromisso: TUMZQuery
    Filtered = True
    AfterInsert = qyCompromissoAfterInsert
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   contas_pagar')
    Params = <>
    Left = 24
    Top = 368
    object qyCompromissocd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.contas_pagar.cd_titulo'
    end
    object qyCompromissocd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.contas_pagar.cd_pessoa'
    end
    object qyCompromissods_despesa: TStringField
      FieldName = 'ds_despesa'
      Origin = 'WMESTRE12.contas_pagar.ds_despesa'
      Size = 255
    end
    object qyCompromissonr_documento: TStringField
      FieldName = 'nr_documento'
      Origin = 'WMESTRE12.contas_pagar.nr_documento'
      Size = 50
    end
    object qyCompromissodt_emissao: TDateTimeField
      FieldName = 'dt_emissao'
      Origin = 'WMESTRE12.contas_pagar.dt_emissao'
    end
    object qyCompromissodt_vencimento: TDateTimeField
      FieldName = 'dt_vencimento'
      Origin = 'WMESTRE12.contas_pagar.dt_vencimento'
    end
    object qyCompromissovl_despesa: TFloatField
      FieldName = 'vl_despesa'
      Origin = 'WMESTRE12.contas_pagar.vl_despesa'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyCompromissocd_situacao: TSmallintField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.contas_pagar.cd_situacao'
    end
    object qyCompromissosn_previsao: TStringField
      FieldName = 'sn_previsao'
      Origin = 'WMESTRE12.contas_pagar.sn_previsao'
      FixedChar = True
      Size = 1
    end
    object qyCompromissocd_tipo_titulo: TSmallintField
      FieldName = 'cd_tipo_titulo'
      Origin = 'WMESTRE12.contas_pagar.cd_tipo_titulo'
    end
    object qyCompromissodt_competencia: TDateTimeField
      FieldName = 'dt_competencia'
      Origin = 'WMESTRE12.contas_pagar.dt_competencia'
    end
    object qyCompromissodt_provavel_pgto: TDateTimeField
      FieldName = 'dt_provavel_pgto'
      Origin = 'WMESTRE12.contas_pagar.dt_provavel_pgto'
    end
    object qyCompromissotp_entrada_saida: TSmallintField
      FieldName = 'tp_entrada_saida'
      Origin = 'WMESTRE12.contas_pagar.tp_entrada_saida'
    end
  end
  object qyPlanoContas: TUMZQuery
    UpdateObject = updPlanoContas
    CachedUpdates = True
    AfterInsert = qyPlanoContasAfterInsert
    AfterPost = qyPlanoContasAfterPost
    SQL.Strings = (
      'SELECT'
      '   a.*,'
      '   pc.ds_conta,'
      '   pc.cd_classificacao AS pc_cd_classificacao,'
      '   pcc.ds_centro,'
      '   pcc.cd_classificacao pcc_cd_classificacao'
      'FROM'
      '   apropriacao_cp a,'
      '   plano_contas pc,'
      '   plano_centro_custos pcc'
      'WHERE'
      '   pc.cd_conta = a.cd_conta AND'
      '   pcc.cd_centro = a.cd_centro AND'
      '   pc.tp_entrada_saida = 2 AND'
      '   pc.tp_conta = 2 AND'
      '   pcc.tp_centro = 2 AND'
      '   a.cd_titulo = :cd_titulo AND'
      '   a.nr_sequencia = :nr_sequencia')
    Params = <
      item
        DataType = ftString
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
    Left = 222
    Top = 369
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end>
    object qyPlanoContascd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.apropriacao_cp.cd_titulo'
    end
    object qyPlanoContasnr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.apropriacao_cp.nr_sequencia'
    end
    object qyPlanoContascd_conta: TIntegerField
      FieldName = 'cd_conta'
      Origin = 'WMESTRE12.apropriacao_cp.cd_conta'
    end
    object qyPlanoContascd_centro: TIntegerField
      FieldName = 'cd_centro'
      Origin = 'WMESTRE12.apropriacao_cp.cd_centro'
    end
    object qyPlanoContasvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.apropriacao_cp.vl_movimento'
    end
    object qyPlanoContasds_conta: TStringField
      FieldName = 'ds_conta'
      Origin = 'WMESTRE12.plano_contas.ds_conta'
      Size = 255
    end
    object qyPlanoContasds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.plano_centro_custos.ds_centro'
      Size = 255
    end
    object qyPlanoContaspc_cd_classificacao: TStringField
      FieldName = 'pc_cd_classificacao'
      Origin = 'WMESTRE12.plano_contas.cd_classificacao'
    end
    object qyPlanoContaspcc_cd_classificacao: TStringField
      FieldName = 'pcc_cd_classificacao'
      Origin = 'WMESTRE12.plano_centro_custos.cd_classificacao'
    end
  end
  object srcPlanoContas: TDataSource
    DataSet = qyPlanoContas
    Left = 254
    Top = 369
  end
  object qyMovimentacao: TUMZQuery
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   movimentacao_cp')
    Params = <>
    Left = 102
    Top = 368
    object qyMovimentacaocd_titulo: TIntegerField
      FieldName = 'cd_titulo'
      Origin = 'WMESTRE12.movimentacao_cp.cd_titulo'
    end
    object qyMovimentacaonr_sequencia: TIntegerField
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.movimentacao_cp.nr_sequencia'
    end
    object qyMovimentacaocd_movimento: TIntegerField
      FieldName = 'cd_movimento'
      Origin = 'WMESTRE12.movimentacao_cp.cd_movimento'
    end
    object qyMovimentacaodt_movimento: TDateTimeField
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.movimentacao_cp.dt_movimento'
    end
    object qyMovimentacaovl_entrada: TFloatField
      FieldName = 'vl_entrada'
      Origin = 'WMESTRE12.movimentacao_cp.vl_entrada'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_saida: TFloatField
      FieldName = 'vl_saida'
      Origin = 'WMESTRE12.movimentacao_cp.vl_saida'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_multa: TFloatField
      FieldName = 'vl_multa'
      Origin = 'WMESTRE12.movimentacao_cp.vl_multa'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_juros: TFloatField
      FieldName = 'vl_juros'
      Origin = 'WMESTRE12.movimentacao_cp.vl_juros'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      Origin = 'WMESTRE12.movimentacao_cp.vl_desconto'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaovl_liquido: TFloatField
      FieldName = 'vl_liquido'
      Origin = 'WMESTRE12.movimentacao_cp.vl_liquido'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '0.00'
    end
    object qyMovimentacaocd_movimento_te: TIntegerField
      FieldName = 'cd_movimento_te'
      Origin = 'WMESTRE12.movimentacao_cp.cd_movimento_te'
    end
    object qyMovimentacaods_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.movimentacao_cp.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
  end
  object srcMovimentacao: TDataSource
    DataSet = qyMovimentacao
    Left = 134
    Top = 368
  end
  object updPlanoContas: TZUpdateSQL
    DeleteSQL.Strings = (
      'delete from apropriacao_cp'
      'where'
      '  cd_titulo = :OLD_cd_titulo and'
      '  nr_sequencia = :OLD_nr_sequencia and'
      '  cd_conta = :OLD_cd_conta and'
      '  cd_centro = :OLD_cd_centro and'
      '  vl_movimento = :OLD_vl_movimento')
    InsertSQL.Strings = (
      'insert into apropriacao_cp'
      '  (cd_titulo, nr_sequencia, cd_conta, cd_centro, vl_movimento)'
      'values'
      
        '  (:cd_titulo, :nr_sequencia, :cd_conta, :cd_centro, :vl_movimen' +
        'to)')
    ModifySQL.Strings = (
      'update apropriacao_cp'
      'set'
      '  cd_titulo = :cd_titulo,'
      '  nr_sequencia = :nr_sequencia,'
      '  cd_conta = :cd_conta,'
      '  cd_centro = :cd_centro,'
      '  vl_movimento = :vl_movimento'
      'where'
      '  cd_titulo = :OLD_cd_titulo and'
      '  nr_sequencia = :OLD_nr_sequencia and'
      '  cd_conta = :OLD_cd_conta and'
      '  cd_centro = :OLD_cd_centro and'
      '  vl_movimento = :OLD_vl_movimento')
    UseSequenceFieldForRefreshSQL = False
    Left = 190
    Top = 369
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_sequencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_movimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_nr_sequencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cd_centro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_vl_movimento'
        ParamType = ptUnknown
      end>
  end
end
