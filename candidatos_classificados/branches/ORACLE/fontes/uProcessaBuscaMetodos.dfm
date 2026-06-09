object frmProcessaBuscaMetodos: TfrmProcessaBuscaMetodos
  Left = 0
  Top = 0
  Caption = 'Processamento da busca'
  ClientHeight = 387
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PROCESSAMENTO DA BUSCA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 774
    Height = 362
    Align = alClient
    TabOrder = 1
    object Label12: TLabel
      Left = 164
      Top = 17
      Width = 477
      Height = 22
      Alignment = taCenter
      Caption = 'Aguarde enquanto a compara'#231#227'o de nomes '#233' realizada! '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblMetodo1: TLabel
      Left = 20
      Top = 97
      Width = 62
      Height = 16
      Caption = 'M'#233'todo 1: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblMetodo2: TLabel
      Left = 20
      Top = 119
      Width = 62
      Height = 16
      Caption = 'M'#233'todo 2: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblMetodo3: TLabel
      Left = 20
      Top = 141
      Width = 62
      Height = 16
      Caption = 'M'#233'todo 3: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblMetodo4: TLabel
      Left = 20
      Top = 163
      Width = 62
      Height = 16
      Caption = 'M'#233'todo 4: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblResultadoMetodo1: TLabel
      Left = 88
      Top = 97
      Width = 123
      Height = 16
      Caption = 'Resultado Metodo 01'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblResultadoMetodo2: TLabel
      Left = 88
      Top = 119
      Width = 123
      Height = 16
      Caption = 'Resultado Metodo 02'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblResultadoMetodo3: TLabel
      Left = 88
      Top = 141
      Width = 123
      Height = 16
      Caption = 'Resultado Metodo 03'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblResultadoMetodo4: TLabel
      Left = 88
      Top = 163
      Width = 123
      Height = 16
      Caption = 'Resultado Metodo 04'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 20
      Top = 205
      Width = 196
      Height = 13
      Caption = 'Verificando registros no banco de dados:'
    end
    object Label3: TLabel
      Left = 20
      Top = 261
      Width = 128
      Height = 13
      Caption = 'Progresso da compara'#231#227'o:'
    end
    object ProgressBar1: TProgressBar
      Left = 20
      Top = 224
      Width = 733
      Height = 25
      Align = alCustom
      TabOrder = 0
    end
    object btnFechar: TBitBtn
      Left = 304
      Top = 312
      Width = 137
      Height = 38
      Cancel = True
      Caption = 'Cancelar Busca'
      TabOrder = 1
      TabStop = False
      OnClick = btnFecharClick
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
    object ProgressBar2: TProgressBar
      Left = 20
      Top = 280
      Width = 733
      Height = 26
      TabOrder = 2
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 720
    Top = 248
  end
  object qryInserirPessoasUnimestre: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO'
      '  pessoas_unimestre  '
      'SELECT'
      #9'null,'
      #9'p.cd_pessoa, '
      #9'p.nm_sem_acento,'
      #9'REMOVE_VOGAIS(p.nm_sem_acento),'
      ' ('
      #9#9'SELECT '
      #9#9#9'm2.curso'
      #9#9'FROM'
      #9#9#9'matriculas m2'
      #9#9'WHERE'
      #9#9'cf.cd_turma = m.turma AND'
      #9#9'cf.cd_curso = m.curso AND'
      #9#9'm2.codigoaluno = p.cd_pessoa'
      #9#9'ORDER BY'
      #9#9#9'm2.anosemestre'#9'DESC'
      #9#9'LIMIT 1'
      #9') cd_curso,'
      #9'('
      #9#9'SELECT '
      #9#9#9'm3.turma'
      #9#9'FROM'
      #9#9#9'matriculas m3'
      #9#9'WHERE'
      #9#9'cf.cd_turma = m.turma AND'
      #9#9'cf.cd_curso = m.curso AND'
      #9#9'm3.codigoaluno = p.cd_pessoa'
      #9#9'ORDER BY'
      #9#9#9'm3.anosemestre'#9'DESC'
      #9#9'LIMIT 1'
      #9' ) cd_turma,'
      
        #9'(SELECT cp.ds_contato FROM contatos_pessoas cp WHERE cp.cd_pess' +
        'oa = p.cd_pessoa AND cp.cd_contato = 4 LIMIT 1) ds_email,'
      
        #9'(SELECT cp.ds_contato FROM contatos_pessoas cp WHERE cp.cd_pess' +
        'oa = p.cd_pessoa AND cp.cd_contato = 1 LIMIT 1) ds_telefone'
      'FROM'
      #9'cand_filtros cf'
      ''
      'INNER JOIN matriculas m ON ('
      '   cf.nr_anosemestre = m.anosemestre AND'
      '   cf.cd_turma = m.turma AND'
      '   cf.cd_curso = m.curso AND'
      '   cf.ds_situacoes = m.situacao'
      ')'
      ''
      'INNER JOIN turmas t ON ('
      '   t.cd_coligada = cf.cd_coligada AND'
      '   t.anosemestre = m.anosemestre'#9'AND'
      '   t.curso = m.curso'#9'AND'
      '   t.codigo = m.turma'
      ')'
      ''
      'INNER JOIN cursos_coligadas cc ON ('
      '    cc.CD_COLIGADA = t.cd_coligada AND'
      '    cc.CD_CURSO = m.curso'
      ')'
      ''
      'INNER JOIN departamentos d  ON ('
      '  d.codigo = cc.CD_DEPTO AND'
      '  d.codigo = cf.cd_departamento'
      ')'
      ''
      'INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa)'
      ''
      'GROUP BY'
      #9'p.cd_pessoa'
      'ORDER BY'
      #9'p.nm_pessoa')
    Params = <>
    Left = 720
    Top = 184
  end
  object qryLimpaPessoasUnimestre: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'delete from pessoas_unimestre')
    Params = <>
    Left = 720
    Top = 152
  end
  object qryMetodo1: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '   pessoas_importadas pi'
      'INNER JOIN pessoas_unimestre pu'
      'SET '
      
        'pi.cd_pessoa_unimestre = pu.cd_pessoa_unimestre , pi.sn_encontra' +
        'do = 1 , pi.ds_metodo = '#39'Metodo1'#39
      'WHERE '
      ''
      '   TRIM(pi.ds_nome) = TRIM(pu.ds_nome) '
      #9' AND pi.sn_encontrado = 0'
      #9)
    Params = <>
    Left = 216
    Top = 103
  end
  object qryMetodo2: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '    pessoas_importadas as p_imp'
      ''
      '    INNER JOIN pessoas_unimestre p_unim ON ('
      '        CONCAT('
      '            SUBSTRING_INDEX('
      '                    TRIM(p_imp.ds_nome), '#39' '#39', 1'
      '            ),'
      '            '#39'-'#39',        '
      '            SUBSTRING_INDEX('
      '                TRIM(p_imp.ds_nome), '#39' '#39', - 1'
      '            )'
      '        ) '
      '        = '
      '        CONCAT(        '
      '            SUBSTRING_INDEX('
      '                TRIM(p_unim.ds_nome), '#39' '#39', 1'
      '            ),'
      '            '#39'-'#39','
      '            SUBSTRING_INDEX('
      '                TRIM(p_unim.ds_nome), '#39' '#39', - 1'
      '            )'
      '        )'
      '    )'
      ''
      'SET '
      '    p_imp.cd_pessoa_unimestre = p_unim.cd_pessoa_unimestre,'
      '    p_imp.sn_encontrado = 1,'
      '    p_imp.ds_metodo = '#39'Metodo2'#39
      'WHERE'
      '    p_imp.sn_encontrado = 0')
    Params = <>
    Left = 216
    Top = 136
  end
  object qryMetodo4: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE '
      '  pessoas_importadas pi'
      #9'INNER JOIN pessoas_unimestre pu'
      'SET'
      #9'pi.cd_pessoa_unimestre = pu.cd_pessoa_unimestre,'
      #9'pi.sn_encontrado = 1,'
      #9'pi.ds_metodo = '#39'Metodo4'#39
      'WHERE '
      '  SOUNDEX(TRIM(pi.ds_nome)) = SOUNDEX(TRIM(pu.ds_nome)) AND '
      #9'pi.sn_encontrado = 0')
    Params = <>
    Left = 216
    Top = 200
  end
  object qryMetodo3: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  pessoas_importadas pi'
      'INNER JOIN pessoas_unimestre pu'
      'SET '
      #9'pi.cd_pessoa_unimestre = pu.cd_pessoa_unimestre,'
      #9'pi.sn_encontrado = 1,'
      #9'pi.ds_metodo = '#39'Metodo3'#39
      'WHERE '
      #9'TRIM(pi.ds_consoantes_nome) = TRIM(pu.ds_consoantes_nome) AND '
      #9'pi.sn_encontrado = 0')
    Params = <>
    Left = 216
    Top = 168
  end
  object qryDeletarNomesIguais: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE pi.*'
      'FROM'
      #9'pessoas_importadas AS pi'
      'INNER JOIN ('
      #9'SELECT'
      #9#9'pess_i1.cd_importada,'
      #9#9'pess_i1.ds_nome'
      #9'FROM'
      #9#9'pessoas_importadas pess_i1'
      #9'INNER JOIN ('
      #9#9'SELECT'
      #9#9#9'pess_i2.cd_importada,'
      #9#9#9'pess_i2.ds_nome'
      #9#9'FROM'
      #9#9#9'pessoas_importadas pess_i2'
      #9') AS pess_i3 ON ('
      #9#9'pess_i1.ds_nome = pess_i3.ds_nome'
      #9#9'AND pess_i1.cd_importada <> pess_i3.cd_importada'
      #9')'
      #9'GROUP BY'
      #9#9'pess_i1.ds_nome'
      ') AS corretos ON ('
      #9'pi.ds_nome = corretos.ds_nome'
      #9'AND pi.cd_importada <> corretos.cd_importada'
      ')')
    Params = <>
    Left = 720
    Top = 120
  end
end
