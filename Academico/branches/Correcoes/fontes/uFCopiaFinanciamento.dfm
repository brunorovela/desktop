object formCopiaFinanceiro: TformCopiaFinanceiro
  Left = 0
  Top = 0
  Caption = 'Copia de Financiamento Estudantil'
  ClientHeight = 138
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  PopupParent = frmFinanciamentoEstudantil.Owner
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 97
    Align = alTop
    TabOrder = 0
    object Bevel9: TBevel
      Left = 216
      Top = 23
      Width = 3
      Height = 73
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 209
      ExplicitTop = 29
      ExplicitHeight = 74
    end
    object pnTitulo: TPanel
      Left = 1
      Top = 1
      Width = 428
      Height = 22
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'COPIA DE FINANCIAMENTO ESTUDANTIL'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 219
      Top = 23
      Width = 215
      Height = 73
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object gbDestino: TGroupBox
        Left = 6
        Top = 6
        Width = 200
        Height = 51
        Caption = 'DADOS DE DESTINO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lbDTAnoSem: TLabel
          Left = 16
          Top = 24
          Width = 72
          Height = 13
          Caption = 'Ano/Semestre:'
        end
        object edAnoSemDest: TMaskEdit
          Left = 104
          Top = 21
          Width = 50
          Height = 21
          EditMask = '9999'
          MaxLength = 4
          TabOrder = 0
          Text = '    '
        end
        object udDAnoSem: TUpDown
          Left = 156
          Top = 20
          Width = 18
          Height = 22
          Min = -100
          TabOrder = 1
          OnClick = udDAnoSemClick
        end
      end
    end
    object pnMatricula: TPanel
      Left = 1
      Top = 23
      Width = 215
      Height = 73
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object gbOrigem: TGroupBox
        Left = 8
        Top = 6
        Width = 200
        Height = 51
        Caption = 'DADOS DE ORIGEM'
        TabOrder = 0
        object lbOTAnoSem: TLabel
          Left = 16
          Top = 21
          Width = 72
          Height = 13
          Caption = 'Ano/Semestre:'
        end
        object UpDown1: TUpDown
          Left = 156
          Top = 16
          Width = 17
          Height = 22
          Min = -100
          TabOrder = 0
          OnClick = UpDown1Click
        end
        object edAnoSemOrigem: TMaskEdit
          Left = 100
          Top = 16
          Width = 50
          Height = 21
          EditMask = '9999'
          MaxLength = 4
          TabOrder = 1
          Text = '    '
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 430
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnCopiarTurma: TSpeedButton
      Left = 278
      Top = 6
      Width = 121
      Height = 26
      Caption = 'Copiar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      OnClick = btnCopiarTurmaClick
    end
  end
  object qryInsereBolsas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT IGNORE INTO pessoas_bolsas ('
      #9'cd_pessoa,'
      #9'sn_re_fies,'
      #9'sn_re_governo_estadual,'
      #9'sn_re_governo_municipal,'
      #9'sn_re_ies,'
      #9'sn_re_entidades_externas,'
      #9'sn_re_outros,'
      #9'sn_nre_prouni_integral,'
      #9'sn_nre_prouni_parcial,'
      #9'sn_nre_ies,'
      #9'sn_nre_governo_estadual,'
      #9'sn_nre_governo_municipal,'
      #9'sn_nre_entidades_externas,'
      #9'sn_nre_outros,'
      #9'sn_as_alimentacao,'
      #9'sn_as_moradia,'
      #9'sn_as_transporte,'
      #9'sn_as_mat_didatico,'
      #9'sn_as_bolsa_trabalho,'
      #9'sn_as_bolsa_permanencia,'
      #9'sn_at_complementar,'
      #9'sn_at_pesquisa,'
      #9'sn_at_extensao,'
      #9'sn_at_monitoria,'
      #9'sn_at_extracurricular,'
      #9'sn_at_re_pesquisa,'
      #9'sn_at_re_extensao,'
      #9'sn_at_re_monitoria,'
      #9'sn_at_re_extracurricular,'
      #9'nr_ano_censo,'
      #9'cd_curso,'
      #9'sn_parfor'
      ') SELECT'
      #9'cd_pessoa,'
      #9'sn_re_fies,'
      #9'sn_re_governo_estadual,'
      #9'sn_re_governo_municipal,'
      #9'sn_re_ies,'
      #9'sn_re_entidades_externas,'
      #9'sn_re_outros,'
      #9'sn_nre_prouni_integral,'
      #9'sn_nre_prouni_parcial,'
      #9'sn_nre_ies,'
      #9'sn_nre_governo_estadual,'
      #9'sn_nre_governo_municipal,'
      #9'sn_nre_entidades_externas,'
      #9'sn_nre_outros,'
      #9'sn_as_alimentacao,'
      #9'sn_as_moradia,'
      #9'sn_as_transporte,'
      #9'sn_as_mat_didatico,'
      #9'sn_as_bolsa_trabalho,'
      #9'sn_as_bolsa_permanencia,'
      #9'sn_at_complementar,'
      #9'sn_at_pesquisa,'
      #9'sn_at_extensao,'
      #9'sn_at_monitoria,'
      #9'sn_at_extracurricular,'
      #9'sn_at_re_pesquisa,'
      #9'sn_at_re_extensao,'
      #9'sn_at_re_monitoria,'
      #9'sn_at_re_extracurricular,'
      #9':anosemdestino,'
      #9'cd_curso,'
      #9'sn_parfor'
      'FROM'
      #9'pessoas_bolsas'
      'WHERE'
      #9'nr_ano_censo = :anosemorigem'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemdestino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemorigem'
        ParamType = ptUnknown
      end>
    Left = 16
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemdestino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemorigem'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaFinan: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT count(cd_pessoa_bolsa) as countpessoas'
      'FROM pessoas_bolsas '
      'where nr_ano_censo = :anosemdest')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemdest'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemdest'
        ParamType = ptUnknown
      end>
  end
  object qryLimpaBolsas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from pessoas_bolsas where nr_ano_censo = :anoatual')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anoatual'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anoatual'
        ParamType = ptUnknown
      end>
  end
end
