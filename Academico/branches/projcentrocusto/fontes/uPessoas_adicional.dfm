object frm_pessoas_adicional: Tfrm_pessoas_adicional
  Left = 241
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Cadastro de Pessoas (dados adicionais)'
  ClientHeight = 391
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 309
    Top = 361
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
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Cadastro de Pessoas (dados adicionais)'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btConfirmar: TBitBtn
    Left = 448
    Top = 352
    Width = 97
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 1
    OnClick = btConfirmarClick
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
  object btCancelar: TBitBtn
    Left = 560
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelarClick
    Kind = bkCancel
  end
  object sxDados: TScrollBox
    Left = 8
    Top = 33
    Width = 625
    Height = 313
    TabOrder = 3
    object tcExtras: TTabControl
      Left = 0
      Top = 0
      Width = 621
      Height = 22
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 0
      Tabs.Strings = (
        'Exemplo 1'
        'Exemplo 2')
      TabIndex = 0
      OnChange = tcExtrasChange
    end
    object pnlConcursos: TPanel
      Left = 0
      Top = 22
      Width = 621
      Height = 287
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object dbgConcursos: TDBGrid
        Left = 0
        Top = 0
        Width = 621
        Height = 287
        Align = alClient
        DataSource = ds_concurso
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Tipo'
            Title.Caption = 'Tipo do Concurso'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Nome do Concurso'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Situacao'
            Title.Caption = 'Situa'#231#227'o da Inscri'#231#227'o'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Title.Caption = 'Data de Inscri'#231#227'o'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_area'
            Title.Caption = '1'#170' '#225'rea selecionada'
            Width = 130
            Visible = True
          end>
      end
    end
    object pnlGrupos: TPanel
      Left = 0
      Top = 22
      Width = 621
      Height = 287
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object dbgGrupos: TDBGrid
        Left = 0
        Top = 0
        Width = 621
        Height = 243
        Align = alTop
        DataSource = dsGrupos
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ds_nome_grupo'
            Title.Caption = 'Nome do grupo'
            Width = 290
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_coligada'
            Title.Caption = 'Coligada'
            Width = 306
            Visible = True
          end>
      end
      object bbtnRemoverGrupo: TBitBtn
        Left = 480
        Top = 249
        Width = 133
        Height = 25
        Caption = 'Remover Grupos'
        TabOrder = 1
        OnClick = bbtnRemoverGrupoClick
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
    object pnlDDA: TPanel
      Left = 0
      Top = 22
      Width = 621
      Height = 287
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object lblConta: TLabel
        Left = 9
        Top = 31
        Width = 74
        Height = 13
        Caption = 'Conta Corrente:'
      end
      object Label1: TLabel
        Left = 9
        Top = 58
        Width = 39
        Height = 13
        Caption = 'Ag'#234'ncia'
      end
      object lblBanco: TLabel
        Left = 9
        Top = 85
        Width = 34
        Height = 13
        Caption = 'Banco:'
      end
      object Label3: TLabel
        Left = 9
        Top = 112
        Width = 88
        Height = 13
        Caption = 'N'#186' do Documento:'
      end
      object lblDDA: TLabel
        Left = 9
        Top = 6
        Width = 49
        Height = 13
        Caption = 'Utiliza DA:'
      end
      object lbNumerico: TLabel
        Left = 9
        Top = 139
        Width = 48
        Height = 13
        Caption = 'Num'#233'rico:'
      end
      object dbConta: TDBEdit
        Left = 103
        Top = 28
        Width = 121
        Height = 21
        DataField = 'nr_conta_corrente'
        DataSource = dsDDA
        TabOrder = 0
      end
      object dbAgencia: TDBEdit
        Left = 103
        Top = 55
        Width = 121
        Height = 21
        DataField = 'nr_agencia'
        DataSource = dsDDA
        TabOrder = 1
      end
      object dbBanco: TDBEdit
        Left = 103
        Top = 82
        Width = 121
        Height = 21
        DataField = 'ds_banco'
        DataSource = dsDDA
        TabOrder = 2
      end
      object dbDocumento: TDBEdit
        Left = 103
        Top = 109
        Width = 121
        Height = 21
        DataField = 'nr_documento'
        DataSource = dsDDA
        TabOrder = 3
      end
      object rgSim: TRadioButton
        Left = 103
        Top = 5
        Width = 89
        Height = 17
        Caption = 'Sim'
        TabOrder = 4
        OnClick = rgSimClick
      end
      object rgNao: TRadioButton
        Left = 150
        Top = 5
        Width = 74
        Height = 17
        Caption = 'N'#227'o'
        TabOrder = 5
        OnClick = rgNaoClick
      end
      object edExemploNumerico: TUMEditNumerico
        Left = 103
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 6
        Text = '0'
      end
    end
  end
  object qyCampos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_CAMPO,'
      '   DS_CAMPO,'
      '   DS_CAMPO_DESCRICAO,'
      '   DS_TIPO,'
      '   DS_PESSOA,'
      '   NR_ORDEM,'
      '  DS_CATEGORIA,'
      '  CD_OPCAO'
      'FROM'
      '   PESSOAS_CAMPOS_ADICIONAIS'
      'WHERE'
      '   DS_PESSOA = :TIPO_PESSOA'
      'ORDER BY'
      '   DS_CATEGORIA, NR_ORDEM')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tipo_pessoa'
        ParamType = ptUnknown
      end>
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo_pessoa'
        ParamType = ptUnknown
      end>
    object qyCamposCD_CAMPO: TIntegerField
      FieldName = 'CD_CAMPO'
    end
    object qyCamposDS_CAMPO: TStringField
      FieldName = 'DS_CAMPO'
      Size = 30
    end
    object qyCamposDS_CAMPO_DESCRICAO: TStringField
      FieldName = 'DS_CAMPO_DESCRICAO'
      Size = 255
    end
    object qyCamposDS_TIPO: TStringField
      FieldName = 'DS_TIPO'
      Size = 1
    end
    object qyCamposDS_PESSOA: TStringField
      FieldName = 'DS_PESSOA'
      Size = 1
    end
    object qyCamposNR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
    end
    object qyCamposDS_CATEGORIA: TStringField
      FieldName = 'DS_CATEGORIA'
      Size = 255
    end
    object qyCamposcd_opcao: TIntegerField
      FieldName = 'cd_opcao'
    end
  end
  object qyCadastroCampos_Opcoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  ctu.*,'
      '  ctc.ds_conteudo'
      'FROM'
      '  pessoas_campos_opcoes ctu'
      
        '  INNER JOIN pessoas_campos_adicionais ctca on(ctu.cd_opcao = ct' +
        'ca.cd_opcao)'
      
        '  LEFT JOIN  pessoas_cadastro ctc on (ctc.cd_campo = ctca.cd_cam' +
        'po)  '
      'WHERE'
      '  ctu.cd_opcao = :cd_opcao'
      '  and ctca.cd_campo = :cd_campo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_opcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_campo'
        ParamType = ptUnknown
      end>
    Left = 608
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_opcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_campo'
        ParamType = ptUnknown
      end>
    object qyCadastroCampos_Opcoescd_opcao: TIntegerField
      FieldName = 'cd_opcao'
    end
    object qyCadastroCampos_Opcoesds_opcao: TStringField
      FieldName = 'ds_opcao'
      Size = 255
    end
    object qyCadastroCampos_Opcoesme_sql: TMemoField
      FieldName = 'me_sql'
      BlobType = ftMemo
      Size = 1
    end
    object qyCadastroCampos_Opcoesme_opcoes: TMemoField
      FieldName = 'me_opcoes'
      BlobType = ftMemo
      Size = 1
    end
    object qyCadastroCampos_Opcoesds_conteudo: TStringField
      FieldName = 'ds_conteudo'
      Size = 100
    end
  end
  object qyCategorias: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  COALESCE(pca.ds_categoria, '#39'Geral'#39') AS ds_categoria,'
      #9'pcc.cd_acao'
      'FROM'
      '  pessoas_campos_adicionais AS pca'
      'INNER JOIN pessoas_campos_categorias AS pcc ON ('
      #9'pcc.nm_categoria = pca.DS_CATEGORIA'
      ')'
      'WHERE'
      '  pca.ds_pessoa = :tipo_pessoa'
      'GROUP BY'
      '  pca.ds_categoria')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tipo_pessoa'
        ParamType = ptUnknown
      end>
    Left = 608
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qryConcursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   cc.cd_concurso ,'
      '   ct.ds_tipo as Tipo ,'
      '   cc.ds_concurso as Nome,'
      '   ci.dt_cadastro  ,'
      '   ca.ds_area ,'
      
        '   CASE WHEN (SELECT COUNT(1) FROM matriculas WHERE codigoaluno ' +
        '= :cd_pessoa) > 0 THEN'
      #9#9'CASE WHEN cia.cd_inscricao_area IS NULL THEN'
      
        #9#9#9'CONCAT((SELECT ds_situacao FROM con_situacoes WHERE ds_chave ' +
        '= '#39'MATRICULADO'#39'), '#39' (Sem '#225'rea confirmada)'#39')'
      #9#9'ELSE'
      
        #9#9#9'(SELECT ds_situacao FROM con_situacoes WHERE ds_chave = '#39'MATR' +
        'ICULADO'#39')'
      #9#9'END'
      #9'ELSE'
      #9#9'CASE WHEN cia.cd_inscricao_area IS NULL THEN'
      #9#9#9'CONCAT(cs.ds_situacao, '#39' (Sem '#225'rea confirmada)'#39')'
      #9#9'ELSE'
      #9#9#9'cs.ds_situacao'
      #9#9'END'
      #9'END AS Situacao'
      'FROM'
      '   con_inscricoes ci'
      
        '   INNER JOIN con_concursos cc ON (cc.cd_concurso = ci.cd_concur' +
        'so)'
      '   INNER JOIN con_tipos ct ON (cc.cd_tipo = ct.cd_tipo)'
      
        '   INNER JOIN con_situacoes cs ON (cs.cd_situacao = ci.cd_situac' +
        'ao)'
      '   LEFT JOIN con_areas ca ON (ci.cd_area = ca.cd_area)'
      
        '   LEFT JOIN con_inscricoes_areas cia ON (cia.cd_inscricao = ci.' +
        'cd_inscricao)'
      'WHERE'
      '   ci.cd_pessoa = :cd_pessoa'
      'ORDER BY'
      '  ci.dt_cadastro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryConcursoscd_concurso: TLargeintField
      FieldName = 'cd_concurso'
      Required = True
    end
    object qryConcursosTipo: TStringField
      FieldName = 'Tipo'
      Size = 255
    end
    object qryConcursosNome: TStringField
      FieldName = 'Nome'
      Size = 255
    end
    object qryConcursosdt_cadastro: TDateTimeField
      FieldName = 'dt_cadastro'
    end
    object qryConcursosSituacao: TStringField
      FieldName = 'Situacao'
      Required = True
      Size = 100
    end
    object qryConcursosds_area: TStringField
      FieldName = 'ds_area'
      Size = 255
    end
  end
  object ds_concurso: TDataSource
    DataSet = qryConcursos
    Left = 64
    Top = 328
  end
  object qryGrupos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   ng.ds_nome_grupo, c.nm_coligada, c.cd_coligada'
      'FROM'
      '   nu_grupos_pessoas ngp'
      '   INNER JOIN nu_grupos  ng ON (ngp.cd_grupo =  ng.cd_grupo)'
      
        '   INNER JOIN coligadas  c  ON (c.cd_coligada =  ngp.cd_coligada' +
        ')'
      'WHERE'
      '    ngp.cd_pessoa =:cd_pessoa '
      'ORDER BY'
      '   ng.ds_nome_grupo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryGruposds_nome_grupo: TStringField
      FieldName = 'ds_nome_grupo'
      Required = True
      Size = 50
    end
    object qryGruposnm_coligada: TStringField
      FieldName = 'nm_coligada'
      Size = 50
    end
  end
  object dsGrupos: TDataSource
    DataSet = qryGrupos
    Left = 64
    Top = 360
  end
  object qryDDA: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   nr_conta_corrente,'
      '   ds_banco,'
      '   nr_agencia,'
      '   nr_documento,'
      '   sn_autoriza_debito,'
      '   cd_pessoa'
      'FROM'
      '   pessoas_debito_automatico'
      'WHERE'
      '   cd_pessoa =:cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryDDAnr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Size = 50
    end
    object qryDDAds_banco: TStringField
      FieldName = 'ds_banco'
      Size = 50
    end
    object qryDDAnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Size = 50
    end
    object qryDDAnr_documento: TStringField
      FieldName = 'nr_documento'
      Size = 50
    end
    object qryDDAsn_autoriza_debito: TSmallintField
      FieldName = 'sn_autoriza_debito'
    end
    object qryDDAcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
  end
  object dsDDA: TDataSource
    DataSet = qryDDA
    Left = 144
    Top = 360
  end
  object QryLogGeral: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO log_geral ('
      #9'CD_PESSOA,'
      #9'CD_USUARIO,'
      #9'DT_LOG,'
      #9'CD_MODULO,'
      #9'CD_CHAVE,'
      #9'CD_ACAO,'
      #9'CD_OPERACAO,'
      #9'CD_COLIGADA,'
      #9'DS_OBSERVACOES'
      ') VALUES ('
      #9':PESSOA,'
      #9':USUARIO,'
      #9':DATALOG,'
      #9':MODULO,'
      #9':CHAVE,'
      #9':ACAO,'
      #9':OPERACAO,'
      #9':COLIGADA,'
      #9':OBSERVACAO'
      ')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATALOG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATALOG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end>
  end
end
