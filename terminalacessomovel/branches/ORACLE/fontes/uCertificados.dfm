object fCertificados: TfCertificados
  Left = 0
  Top = 0
  Caption = 'Certificados'
  ClientHeight = 536
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = fechaFormulario
  OnShow = mostraFormulario
  PixelsPerInch = 96
  TextHeight = 13
  object bvSep1: TBevel
    Left = 0
    Top = 22
    Width = 779
    Height = 3
    Align = alTop
    ExplicitWidth = 782
  end
  object bvSep2: TBevel
    Left = 0
    Top = 87
    Width = 779
    Height = 3
    Align = alTop
    ExplicitTop = 89
    ExplicitWidth = 782
  end
  object bvSep3: TBevel
    Left = 0
    Top = 429
    Width = 779
    Height = 3
    Align = alBottom
    ExplicitTop = 427
    ExplicitWidth = 782
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'REGISTRO DE CERTIFICADOS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 517
    Width = 779
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object pnRegistrar: TPanel
    Left = 0
    Top = 432
    Width = 779
    Height = 85
    Align = alBottom
    BevelOuter = bvLowered
    BorderWidth = 2
    TabOrder = 2
    object lbLivro: TLabel
      Left = 8
      Top = 12
      Width = 81
      Height = 13
      Caption = 'Selecione o livro:'
    end
    object bnRegistrar: TSpeedButton
      Left = 302
      Top = 28
      Width = 130
      Height = 22
      Caption = 'Registrar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000600F0000600F00000001000015000000007F0000E6E6
        E600919191004B4B4B00AAFF2A0000DF0000BCBCBC0055FFAA00D8E9EC0000BF
        2A0000FF0900B8B8B800AAFFAA0055FF00005A5A5A00CCCCCC0000FF2A00E0E0
        E0009F9F9F00FFFFFF0000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000080808080803
        0308080808080808080801010101010303010101010101010101080808080005
        09030808080808080808010101010E1202030101010101010101080808080005
        05090308080808080808010101010E1212020301010101010101080808080005
        05050903080808080808010101010E1212120203010101010101080808080005
        0A050509030808080808010101010E120B121202030101010101080808080010
        050A0505090308080808010101010E06120B121202030101010108080808000D
        10050A05050903080808010101010E0606120B12120203010101080808080007
        0A10050A050500080808010101010E110B06120B12120E010101080808080007
        0A0A1005070008080808010101010E110B0B0612110E01010101080808080004
        0A0A0A10000808080808010101010E0F0B0B0B060E0101010101080808080004
        0A0A0400080808080808010101010E0F0B0B0F0E01010101010108080808000C
        0A040008080808080808010101010E010B0F0E0101010101010108080808000C
        0C000808080808080808010101010E01010E010101010101010108080808000C
        00080808080808080808010101010E010E010101010101010101080808080800
        0808080808080808080801010101010E01010101010101010101080808080808
        0808080808080808080801010101010101010101010101010101}
      NumGlyphs = 2
      OnClick = registra
    end
    object bnAdicionaLivro: TSpeedButton
      Left = 175
      Top = 28
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF
        FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF
        FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = adicionaLivro
    end
    object cbLivro: TComboBox
      Left = 8
      Top = 28
      Width = 161
      Height = 22
      Style = csOwnerDrawFixed
      Enabled = False
      ItemHeight = 16
      TabOrder = 0
      OnSelect = selecionaLivro
    end
    object ledPagina: TLabeledEdit
      Left = 214
      Top = 28
      Width = 82
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'P'#225'gina:'
      Enabled = False
      TabOrder = 1
      OnKeyPress = informaPagina
    end
    object pbProgresso: TProgressBar
      Left = 3
      Top = 65
      Width = 773
      Height = 17
      Align = alBottom
      TabOrder = 2
    end
  end
  object pnFiltros: TPanel
    Left = 0
    Top = 25
    Width = 779
    Height = 62
    Align = alTop
    BevelOuter = bvLowered
    BorderWidth = 15
    TabOrder = 0
    object lbEvento: TLabel
      Left = 8
      Top = 9
      Width = 95
      Height = 13
      Caption = 'Selecione o evento:'
    end
    object bnPessoa: TSpeedButton
      Left = 423
      Top = 25
      Width = 23
      Height = 22
      Enabled = False
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
      OnClick = selecionaPessoa
    end
    object bnFechar: TSpeedButton
      Left = 688
      Top = 16
      Width = 75
      Height = 30
      Align = alRight
      Caption = 'Fechar'
      Flat = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
        1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
        1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
        1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
        1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
        1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
        1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
        1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
        1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
        1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
        1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
        1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      OnClick = sair
      ExplicitLeft = 703
      ExplicitTop = 9
      ExplicitHeight = 52
    end
    object cbEvento: TComboBox
      Left = 8
      Top = 28
      Width = 265
      Height = 22
      Style = csOwnerDrawFixed
      Enabled = False
      ItemHeight = 16
      TabOrder = 0
      OnSelect = selecionaEvento
    end
    object ledPessoa: TLabeledEdit
      Left = 279
      Top = 25
      Width = 138
      Height = 21
      EditLabel.Width = 95
      EditLabel.Height = 13
      EditLabel.Caption = 'Selecione a pessoa:'
      Enabled = False
      TabOrder = 1
      OnKeyPress = informaPessoa
    end
  end
  object pnDados: TPanel
    Left = 0
    Top = 90
    Width = 779
    Height = 339
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object dgDados: TDBGrid
      Left = 1
      Top = 1
      Width = 777
      Height = 337
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_inscricao'
          Title.Caption = 'C'#243'd. Inscri'#231#227'o'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_pessoa'
          Title.Caption = 'Pessoa'
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_pessoa'
          Title.Caption = 'C'#243'd. Pessoa'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_horas_evento'
          Title.Caption = 'C.H. do Evento'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_horas_participacao'
          Title.Caption = 'C.H. Pessoa'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_presenca'
          Title.Caption = 'Freq'#252#234'ncia (%)'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_livro'
          Title.Caption = 'Livro'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_folha'
          Title.Caption = 'Folha'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_registro'
          Title.Caption = 'Registro'
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = qyDados
    Left = 24
    Top = 144
  end
  object qyDados: TUMZReadOnlyQuery
    Connection = DM.ZConnTAM
    SQL.Strings = (
      'SELECT'
      '   i.CD_INSCRICAO,'
      '   i.CD_PESSOA,'
      '   p.nm_pessoa,'
      '   v.ch_evento,'
      '   v.ch_pessoa,'
      '   v.vl_frequencia,'
      '   IFNULL(l.nm_livro, "") nm_livro,'
      '   IFNULL(c.nr_folha, "") nr_folha,'
      '   IFNULL(c.nr_registro, "") nr_registro'
      'FROM'
      '   view_eventos_carga v'
      '      JOIN tam_inscricoes i ON(v.cd_inscricao = i.CD_INSCRICAO)'
      '         JOIN pessoas p ON(i.CD_PESSOA = p.cd_pessoa)'
      
        '      LEFT JOIN certificado_eventos c ON(i.CD_EVENTO = c.cd_even' +
        'to AND i.CD_PESSOA = c.cd_pessoa)'
      
        '         LEFT JOIN certificado_livros l ON(c.cd_livro = l.cd_cer' +
        't_livro)'
      'WHERE'
      '   i.CD_EVENTO = :cd_evento AND'
      '   i.CD_PESSOA = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_evento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_evento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qyInsereAtividade: TUMZQuery
    Connection = DM.ZConnTAM
    SQL.Strings = (
      'INSERT INTO ge_alunos('
      '   cd_pessoa,'
      '   cd_curso,'
      '   nr_anosem,'
      '   nr_etapa,'
      '   cd_ge_atividade,'
      '   nr_horas,'
      '   ds_atividade,'
      '   ds_local,'
      '   dt_inicio,'
      '   dt_termino,'
      '   cd_situacao,'
      '   nr_horas_original'
      ')'
      'VALUES('
      '   :cd_pessoa,'
      '   :cd_curso,'
      '   :nr_anosem,'
      '   :nr_etapa,'
      '   :cd_ge_atividade,'
      '   :nr_horas,'
      '   :ds_atividade,'
      '   :ds_local,'
      '   :dt_inicio,'
      '   :dt_termino,'
      '   :cd_situacao,'
      '   :nr_horas_original'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_ge_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_horas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_horas_original'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_anosem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_etapa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_ge_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_horas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_atividade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_local'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_horas_original'
        ParamType = ptUnknown
      end>
  end
  object qyMatriculaAluno: TUMZReadOnlyQuery
    Connection = DM.ZConnTAM
    SQL.Strings = (
      'SELECT'
      #9'm.curso,'
      #9't.serie,'
      #9'm.anosemestre'
      'FROM'
      #9'matriculas m'
      
        #9#9'JOIN turmas t ON(m.turma = t.codigo AND m.anosemestre = t.anos' +
        'emestre AND m.curso = t.curso)'
      #9#9'JOIN situacao s ON(m.situacao = s.cd_situacao)'
      'WHERE'
      #9'm.codigoaluno = :cd_pessoa AND'
      #9's.cd_situacao_pai NOT IN(3, 4, 5, 6, 7, 8)'
      'ORDER BY'
      #9'm.anosemestre DESC'
      'LIMIT 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
end
