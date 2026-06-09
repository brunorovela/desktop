object frmMensaInformacoes: TfrmMensaInformacoes
  Left = 184
  Top = 205
  BorderStyle = bsDialog
  Caption = 'Informa'#231#245'es da Mensalidades'
  ClientHeight = 454
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancelar: TSpeedButton
    Left = 8
    Top = 424
    Width = 161
    Height = 25
    Caption = 'Cancelar Movimenta'#231#227'o'
    Flat = True
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      0000FF7F1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
      FF7F1F7C1F7C1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C0000
      FF7F1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000FF7F
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C000000001F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C000000000000
      1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C00000000
      FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
      000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
    OnClick = btnCancelarClick
  end
  object BitBtn1: TBitBtn
    Left = 556
    Top = 425
    Width = 115
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'INFORMA'#199#213'ES DA MENSALIDADE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 64
    Width = 663
    Height = 353
    ActivePage = tsMovimento
    TabOrder = 2
    object tsMovimento: TTabSheet
      Caption = 'Movimenta'#231#245'es'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 655
        Height = 260
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsMovimento
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_acao'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_movimento'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_entrada'
            Title.Alignment = taRightJustify
            Title.Caption = 'Entrada'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_saida'
            Title.Alignment = taRightJustify
            Title.Caption = 'Sa'#237'da'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'multa_juros'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'vl_desconto_obs'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_liquido'
            Title.Alignment = taRightJustify
            Title.Caption = 'L'#237'quido'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usu'#225'rio'
            Width = 50
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 260
        Width = 655
        Height = 65
        Align = alBottom
        TabOrder = 1
        object Label12: TLabel
          Left = 8
          Top = 37
          Width = 61
          Height = 13
          Caption = 'Observa'#231#227'o:'
        end
        object lbDescCondicionalAceito: TLabel
          Left = 8
          Top = 6
          Width = 152
          Height = 13
          Caption = #185' Desconto condicional previsto.'
        end
        object lbDescCondicionalPerdido: TLabel
          Left = 192
          Top = 6
          Width = 155
          Height = 13
          Caption = #178' Desconto condicional aplicado.'
        end
        object Bevel1: TBevel
          Left = 8
          Top = 25
          Width = 640
          Height = 1
          Style = bsRaised
        end
        object lbDescontoPrevisto: TLabel
          Left = 372
          Top = 6
          Width = 150
          Height = 13
          Caption = #179' Desconto condicional perdido.'
        end
        object DBMemo1: TDBMemo
          Left = 76
          Top = 32
          Width = 536
          Height = 28
          TabStop = False
          Color = clBtnFace
          DataField = 'ds_observacao'
          DataSource = dsMovimento
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object tsDetalhes: TTabSheet
      Caption = 'Detalhes'
      object Label2: TLabel
        Left = 16
        Top = 80
        Width = 39
        Height = 13
        Caption = 'Parcela:'
      end
      object Label3: TLabel
        Left = 16
        Top = 96
        Width = 59
        Height = 13
        Caption = 'Vencimento:'
      end
      object Label4: TLabel
        Left = 16
        Top = 48
        Width = 33
        Height = 13
        Caption = 'Turma:'
      end
      object Label5: TLabel
        Left = 16
        Top = 112
        Width = 42
        Height = 13
        Caption = 'Emiss'#227'o:'
      end
      object Label6: TLabel
        Left = 16
        Top = 160
        Width = 73
        Height = 13
        Caption = 'Nosso N'#250'mero:'
      end
      object Label7: TLabel
        Left = 304
        Top = 10
        Width = 55
        Height = 13
        Caption = 'Valor Bruto:'
      end
      object Label8: TLabel
        Left = 304
        Top = 26
        Width = 76
        Height = 13
        Caption = 'Valor Desconto:'
      end
      object Label9: TLabel
        Left = 304
        Top = 42
        Width = 76
        Height = 13
        Caption = 'Desconto Extra:'
      end
      object Label10: TLabel
        Left = 304
        Top = 58
        Width = 54
        Height = 13
        Caption = 'Valor Extra:'
      end
      object Label13: TLabel
        Left = 304
        Top = 106
        Width = 55
        Height = 13
        Caption = 'Valor Pago:'
      end
      object Label14: TLabel
        Left = 304
        Top = 122
        Width = 83
        Height = 13
        Caption = 'Data Pagamento:'
      end
      object Label16: TLabel
        Left = 16
        Top = 128
        Width = 39
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object Label20: TLabel
        Left = 16
        Top = 32
        Width = 71
        Height = 13
        Caption = 'Ano/Semestre:'
      end
      object Label23: TLabel
        Left = 16
        Top = 176
        Width = 45
        Height = 13
        Caption = 'Situa'#231#227'o:'
      end
      object Label24: TLabel
        Left = 304
        Top = 90
        Width = 54
        Height = 13
        Caption = 'Valor Total:'
      end
      object Label25: TLabel
        Left = 16
        Top = 192
        Width = 45
        Height = 13
        Caption = 'Bloqueto:'
      end
      object Label27: TLabel
        Left = 16
        Top = 64
        Width = 32
        Height = 13
        Caption = 'Depto:'
      end
      object Label28: TLabel
        Left = 304
        Top = 74
        Width = 55
        Height = 13
        Caption = 'Valor Juros:'
      end
      object Label30: TLabel
        Left = 16
        Top = 16
        Width = 69
        Height = 13
        Caption = 'Resp. Financ.:'
      end
      object Label31: TLabel
        Left = 16
        Top = 144
        Width = 79
        Height = 13
        Caption = 'Ocorr. Remessa:'
      end
      object DBText3: TDBText
        Left = 96
        Top = 16
        Width = 150
        Height = 17
        DataField = 'cd_resp_finan'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 96
        Top = 32
        Width = 150
        Height = 17
        DataField = 'AnoSemestre'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 96
        Top = 48
        Width = 150
        Height = 17
        DataField = 'Turma'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 96
        Top = 64
        Width = 150
        Height = 17
        DataField = 'Depto'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 96
        Top = 80
        Width = 150
        Height = 17
        DataField = 'Parcela'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 96
        Top = 96
        Width = 150
        Height = 17
        DataField = 'DataVencimento'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 96
        Top = 112
        Width = 150
        Height = 17
        DataField = 'DataEmissao'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText10: TDBText
        Left = 96
        Top = 128
        Width = 150
        Height = 17
        DataField = 'Usuario'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText11: TDBText
        Left = 96
        Top = 144
        Width = 150
        Height = 17
        DataField = 'ocorrencia_remessa'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText12: TDBText
        Left = 96
        Top = 160
        Width = 150
        Height = 17
        DataField = 'NossoNumero'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText13: TDBText
        Left = 96
        Top = 192
        Width = 150
        Height = 17
        DataField = 'BloquetoImpresso'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText14: TDBText
        Left = 96
        Top = 176
        Width = 150
        Height = 17
        DataField = 'DescricaoSituacao'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText15: TDBText
        Left = 398
        Top = 10
        Width = 150
        Height = 17
        DataField = 'ValorBruto'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText16: TDBText
        Left = 398
        Top = 26
        Width = 150
        Height = 17
        DataField = 'ValorDesconto'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText17: TDBText
        Left = 398
        Top = 42
        Width = 150
        Height = 17
        DataField = 'DescontoExtra'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText18: TDBText
        Left = 398
        Top = 58
        Width = 150
        Height = 17
        DataField = 'ValorExtra'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText19: TDBText
        Left = 398
        Top = 74
        Width = 150
        Height = 17
        DataField = 'ValorJurosCalc'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText20: TDBText
        Left = 398
        Top = 90
        Width = 150
        Height = 17
        DataField = 'ValorTotalCalc'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText21: TDBText
        Left = 398
        Top = 106
        Width = 150
        Height = 17
        DataField = 'ValorPago'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText22: TDBText
        Left = 398
        Top = 122
        Width = 150
        Height = 17
        DataField = 'DataPagamento'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 208
        Width = 64
        Height = 13
        Caption = 'Nro. Cr'#233'ditos:'
      end
      object DBText30: TDBText
        Left = 96
        Top = 208
        Width = 150
        Height = 17
        DataField = 'nr_creditos'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 304
        Top = 136
        Width = 92
        Height = 13
        Caption = 'A'#231#227'o de Desconto:'
      end
      object DBText25: TDBText
        Left = 398
        Top = 137
        Width = 150
        Height = 17
        DataField = 'ds_acao'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 304
        Top = 151
        Width = 89
        Height = 13
        Caption = 'Obs. de Desconto:'
      end
      object DBText26: TDBText
        Left = 398
        Top = 151
        Width = 254
        Height = 17
        DataField = 'ds_obs'
        DataSource = frmMensalidades.dtcMensalidades
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sgCheques: TStringGrid
        Left = 305
        Top = 192
        Width = 347
        Height = 128
        BorderStyle = bsNone
        Color = clBtnFace
        ColCount = 2
        DefaultColWidth = 87
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 7
        FixedRows = 0
        GridLineWidth = 0
        Options = [goVertLine, goHorzLine, goRangeSelect]
        ScrollBars = ssHorizontal
        TabOrder = 0
      end
    end
    object tsEstorno: TTabSheet
      Caption = 'Estorno'
      ImageIndex = 2
      object Label21: TLabel
        Left = 3
        Top = 16
        Width = 69
        Height = 13
        Caption = 'Data da baixa:'
      end
      object label22: TLabel
        Left = 3
        Top = 35
        Width = 79
        Height = 13
        Caption = 'Data de estorno:'
      end
      object Label26: TLabel
        Left = 3
        Top = 54
        Width = 74
        Height = 13
        Caption = 'Nome do caixa:'
      end
      object Label29: TLabel
        Left = 3
        Top = 92
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object dbBaixa: TDBText
        Left = 98
        Top = 16
        Width = 139
        Height = 17
        DataField = 'dt_baixa'
        DataSource = dsEstorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbDtEstorno: TDBText
        Left = 98
        Top = 35
        Width = 495
        Height = 17
        DataField = 'dt_estorno'
        DataSource = dsEstorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUsuario: TLabel
        Left = 3
        Top = 73
        Width = 39
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object dbUser: TDBText
        Left = 98
        Top = 73
        Width = 511
        Height = 17
        DataField = 'nm_pessoa'
        DataSource = dsEstorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCaixa: TLabel
        Left = 98
        Top = 54
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TLabel
        Left = 97
        Top = 92
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object TsBiblioteca: TTabSheet
      Caption = 'Biblioteca'
      ImageIndex = 3
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 655
        Height = 325
        Align = alClient
        DataSource = dsBibMulta
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object pnTitulo: TPanel
    Left = 8
    Top = 29
    Width = 663
    Height = 29
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 7
      Width = 30
      Height = 13
      Caption = 'Aluno:'
    end
    object DBText1: TDBText
      Left = 44
      Top = 7
      Width = 58
      Height = 17
      DataField = 'CodigoAluno'
      DataSource = frmMensalidades.dtcMensalidades
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 102
      Top = 7
      Width = 271
      Height = 17
      DataField = 'NomeAluno'
      DataSource = frmMensalidades.dtcMensalidades
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 296
      Top = 7
      Width = 56
      Height = 13
      Caption = 'C'#243'd. T'#237'tulo:'
    end
    object Label17: TLabel
      Left = 475
      Top = 7
      Width = 92
      Height = 13
      Caption = 'C'#243'd. T'#237'tulo Origem:'
    end
    object DBText23: TDBText
      Left = 365
      Top = 7
      Width = 103
      Height = 17
      DataField = 'cd_mensalidade'
      DataSource = frmMensalidades.dtcMensalidades
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText24: TDBText
      Left = 573
      Top = 7
      Width = 82
      Height = 17
      DataField = 'cd_mensalidade_origem'
      DataSource = frmMensalidades.dtcMensalidades
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qyMovimento: TUMZQuery
    Connection = DM.db
    SortType = stDescending
    OnCalcFields = qyMovimentoCalcFields
    SQL.Strings = (
      'SELECT'
      '  mp.cd_mensalidade,'
      '  mp.cd_mensalidade_origem,'
      '  mp.datavencimento,'
      '  mp.datapagamento,'
      '  mp.cd_coligada,'
      '  mp.parcela,'
      '  a.ds_acao,'
      '  a.cd_tipo_acao,'
      '  a.cd_acao_automatica,'
      '  cr.*,'
      '  p.nm_pessoa USUARIO,'
      '  mp.situacao,'
      
        #9'CASE WHEN cr.sn_desc_condicional = 1 AND cr.sn_desc_aplicado = ' +
        '1 THEN '#39#178#39
      
        #9#9#9' WHEN cr.sn_desc_condicional = 1 AND mp.situacao NOT IN (2, 1' +
        '0) AND cr.sn_desc_aplicado = 0 THEN '#39#179#39
      #9#9#9' WHEN cr.sn_desc_condicional = 1 THEN '#39#185#39
      '       ELSE '#39#39
      #9'END ds_observacao_condicional,'
      '  CASE WHEN cr.sn_desc_condicional = 1 AND'
      '            cr.vl_desconto_previsto IS NOT NULL AND'
      '            (cr.vl_desconto IS NULL OR cr.vl_desconto = 0) AND'
      
        '            cr.vl_desconto != cr.vl_desconto_previsto THEN cr.vl' +
        '_desconto_previsto'
      '       ELSE 0'
      '  END vl_condicional_previsto'
      'FROM'
      '  fin_mov_cr cr'
      
        #9'INNER JOIN mensalidades m ON (m.cd_mensalidade = cr.cd_mensalid' +
        'ade)'
      
        '  INNER JOIN mensalidades mp ON (mp.cd_mensalidade = COALESCE(cr' +
        '.cd_mensalidade_origem, cr.cd_mensalidade))'
      '  INNER JOIN fin_acoes_movimento a ON (cr.cd_acao = a.cd_acao)'
      '  LEFT JOIN pessoas p ON (p.cd_pessoa = cr.cd_usuario)'
      'WHERE'
      '  cr.cd_mensalidade = :CdMensalidade'
      'ORDER BY'
      '  cr.nr_sequencia')
    Params = <
      item
        DataType = ftInteger
        Name = 'CdMensalidade'
        ParamType = ptUnknown
      end>
    Left = 608
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CdMensalidade'
        ParamType = ptUnknown
      end>
    object qyMovimentocd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
      Origin = 'WMESTRE12.fin_mov_cr.nr_sequencia'
    end
    object qyMovimentocd_mensalidade_origem: TIntegerField
      FieldName = 'cd_mensalidade_origem'
    end
    object qyMovimentodatavencimento: TDateTimeField
      FieldName = 'datavencimento'
    end
    object qyMovimentodatapagamento: TDateTimeField
      FieldName = 'datapagamento'
    end
    object qyMovimentocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_mov_cr.cd_acao'
    end
    object qyMovimentoparcela: TSmallintField
      FieldName = 'parcela'
    end
    object qyMovimentods_acao: TStringField
      DisplayLabel = 'Movimento'
      FieldName = 'ds_acao'
      Origin = 'WMESTRE12.fin_mov_cr.cd_mensalidade'
      Size = 255
    end
    object qyMovimentonr_sequencia: TIntegerField
      DisplayLabel = 'Seq.'
      FieldName = 'nr_sequencia'
      Origin = 'WMESTRE12.fin_mov_cr.cd_acao'
    end
    object qyMovimentodt_movimento: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'dt_movimento'
      Origin = 'WMESTRE12.fin_mov_cr.vl_entrada'
    end
    object qyMovimentovl_entrada: TFloatField
      DisplayLabel = 'Val. Entrada'
      FieldName = 'vl_entrada'
      Origin = 'WMESTRE12.fin_mov_cr.vl_saida'
      DisplayFormat = '#,##0.00'
    end
    object qyMovimentovl_multa: TFloatField
      DisplayLabel = 'Multa'
      FieldName = 'vl_multa'
      Origin = 'WMESTRE12.fin_mov_cr.vl_juros'
      DisplayFormat = '#,##0.00'
    end
    object qyMovimentovl_saida: TFloatField
      DisplayLabel = 'Val. Sa'#237'da'
      FieldName = 'vl_saida'
      Origin = 'WMESTRE12.fin_mov_cr.vl_multa'
      DisplayFormat = '#,##0.00'
    end
    object qyMovimentovl_juros: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'vl_juros'
      Origin = 'WMESTRE12.fin_mov_cr.vl_desconto'
      DisplayFormat = '#,##0.00'
    end
    object qyMovimentovl_desconto: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'vl_desconto'
      Origin = 'WMESTRE12.fin_mov_cr.vl_liquido'
      DisplayFormat = '#,##0.00'
    end
    object qyMovimentovl_liquido: TFloatField
      DisplayLabel = 'Val. L'#237'quido'
      FieldName = 'vl_liquido'
      Origin = 'WMESTRE12.fin_mov_cr.cd_movimento_te'
      DisplayFormat = '#,##0.00'
    end
    object qyMovimentocd_movimento_te: TIntegerField
      FieldName = 'cd_movimento_te'
      Origin = 'WMESTRE12.fin_mov_cr.ds_observacao'
    end
    object qyMovimentods_observacao: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.fin_acoes_movimento.ds_acao'
      BlobType = ftMemo
      Size = 1
    end
    object qyMovimentomulta_juros: TCurrencyField
      DisplayLabel = 'Juros'
      FieldKind = fkCalculated
      FieldName = 'multa_juros'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object qyMovimentocd_tipo_acao: TSmallintField
      FieldName = 'cd_tipo_acao'
      Origin = 'WMESTRE12.fin_mov_cr.nr_sequencia'
    end
    object qyMovimentocd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
    object qyMovimentoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object qyMovimentocd_acao: TLargeintField
      FieldName = 'cd_acao'
    end
    object qyMovimentocd_acao_automatica: TIntegerField
      FieldName = 'cd_acao_automatica'
    end
    object qyMovimentods_observacao_condicional: TStringField
      FieldName = 'ds_observacao_condicional'
      Size = 5
    end
    object qyMovimentovl_desconto_obs: TStringField
      DisplayLabel = 'Desconto'
      FieldKind = fkCalculated
      FieldName = 'vl_desconto_obs'
      Size = 255
      Calculated = True
    end
    object qyMovimentosn_desc_condicional: TSmallintField
      FieldName = 'sn_desc_condicional'
    end
    object qyMovimentosituacao: TIntegerField
      FieldName = 'situacao'
    end
    object qyMovimentovl_condicional_previsto: TFloatField
      FieldName = 'vl_condicional_previsto'
    end
  end
  object dsMovimento: TDataSource
    DataSet = qyMovimento
    Left = 608
    Top = 256
  end
  object qryEstorno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '    p.nm_pessoa, fe.dt_baixa, fe.dt_estorno,CASE WHEN fe.ds_esto' +
        'rno <> '#39#39' THEN fe.ds_estorno ELSE '#39'Motivo de estorno n'#227'o registr' +
        'ado'#39'END ds_estorno, fcc.ds_caixa'
      'FROM'
      '    fin_estornos fe'
      '    LEFT JOIN pessoas p ON ( p.cd_pessoa = fe.cd_usuario )'
      
        '    LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = fe.cd_c' +
        'aixa )'
      'WHERE'
      '   fe.cd_mensalidade = :cd_mensalidade'
      'ORDER BY'
      '   fe.dt_estorno desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    object qryEstornonm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qryEstornodt_baixa: TDateTimeField
      FieldName = 'dt_baixa'
    end
    object qryEstornodt_estorno: TDateTimeField
      FieldName = 'dt_estorno'
    end
    object qryEstornods_estorno: TMemoField
      FieldName = 'ds_estorno'
      BlobType = ftMemo
    end
    object qryEstornods_caixa: TStringField
      FieldName = 'ds_caixa'
      Size = 255
    end
  end
  object dsEstorno: TDataSource
    DataSet = qryEstorno
    Left = 568
    Top = 256
  end
  object qyMultaBib: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 528
    Top = 216
    object qyMultaBibds_titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 45
      FieldName = 'ds_titulo'
      Required = True
      Size = 255
    end
    object qyMultaBibds_codigo_barras: TStringField
      DisplayLabel = 'C'#243'd. Barras'
      DisplayWidth = 10
      FieldName = 'ds_codigo_barras'
      Size = 50
    end
    object qyMultaBibdt_emprestimo: TDateTimeField
      DisplayLabel = 'Empr'#233'stimo'
      DisplayWidth = 18
      FieldName = 'dt_emprestimo'
      Required = True
    end
    object qyMultaBibdt_devolucao: TDateTimeField
      DisplayLabel = 'Prazo de devolu'#231#227'o'
      DisplayWidth = 18
      FieldName = 'dt_devolucao'
      Required = True
    end
    object qyMultaBibdt_entrega: TDateTimeField
      DisplayLabel = 'Entrega'
      DisplayWidth = 18
      FieldName = 'dt_entrega'
    end
    object qyMultaBibds_situacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      DisplayWidth = 20
      FieldName = 'ds_situacao'
      Required = True
      Size = 50
    end
    object qyMultaBibtx_motivo_isencao: TMemoField
      DisplayLabel = 'Motivo isen'#231#227'o'
      DisplayWidth = 30
      FieldName = 'tx_motivo_isencao'
      OnGetText = qyMultaBibtx_motivo_isencaoGetText
      BlobType = ftFmtMemo
    end
  end
  object dsBibMulta: TDataSource
    DataSet = qyMultaBib
    Left = 528
    Top = 256
  end
end
