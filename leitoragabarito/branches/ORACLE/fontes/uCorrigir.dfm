object frmCorrigir: TfrmCorrigir
  Left = 297
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Corrigindo Provas...'
  ClientHeight = 468
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 4
    Top = 8
    Width = 453
    Height = 29
  end
  object lbStatus: TLabel
    Left = 10
    Top = 11
    Width = 76
    Height = 22
    Caption = 'lbStatus'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 52
    Height = 14
    Caption = 'C'#243'd. Aluno'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 88
    Top = 48
    Width = 72
    Height = 14
    Caption = 'Nome do Aluno'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 88
    Top = 88
    Width = 30
    Height = 14
    Caption = 'Turma'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 200
    Top = 88
    Width = 69
    Height = 14
    Caption = 'Ano/Semestre'
    FocusControl = DBEdit5
  end
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 41
    Height = 14
    Caption = 'Gabarito'
    FocusControl = DBEdit1
  end
  object Bevel2: TBevel
    Left = 4
    Top = 436
    Width = 453
    Height = 5
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 3
    Top = 38
    Width = 453
    Height = 5
    Style = bsRaised
  end
  object Bevel4: TBevel
    Left = 3
    Top = 327
    Width = 453
    Height = 5
    Style = bsRaised
  end
  object Bevel5: TBevel
    Left = 3
    Top = 131
    Width = 453
    Height = 2
    Style = bsRaised
  end
  object sbPararLeitura: TSpeedButton
    Left = 271
    Top = 442
    Width = 90
    Height = 22
    Caption = 'Parar Leitura'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000D8E9ECD8E9EC
      D9A77DA37600A37600A37600D9A77DD8E9ECD8E9ECD9A77DA37600A37600A376
      00D9A77DD8E9ECD8E9ECD8E9ECD8E9ECA37600D9A77DCB8C44CB8C44A37600D8
      E9ECD8E9ECA37600FF9F7FCB8C44CB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FF9F7FD9A77DCB8C44A37600D8E9ECD8E9ECAA7F55FF9F7FD9A77DCB8C
      44A37600D8E9ECD8E9ECD8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8
      E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C
      44A37600D8E9ECD8E9ECD8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8
      E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C
      44A37600D8E9ECD8E9ECD8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8
      E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C
      44A37600D8E9ECD8E9ECD8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8
      E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C
      44A37600D8E9ECD8E9ECD8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8
      E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C
      44A37600D8E9ECD8E9ECD8E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8
      E9ECD8E9ECAA7F55FFFFCCD9A77DCB8C44A37600D8E9ECD8E9ECD8E9ECD8E9EC
      AA7F55FFFFCCFFFFCCD9A77DA37600D8E9ECD8E9ECAA7F55FFFFCCFFFFCCFF9F
      7FA37600D8E9ECD8E9ECD8E9ECD8E9ECD9A77DAA7F55AA7F55AA7F55D9A77DD8
      E9ECD8E9ECD9A77DAA7F55AA7F55AA7F55D9A77DD8E9ECD8E9EC}
    OnClick = sbPararLeituraClick
  end
  object sbIniciarLeitura: TSpeedButton
    Left = 365
    Top = 442
    Width = 90
    Height = 22
    Caption = 'Iniciar Leitura'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000D8E9ECD8E9EC
      D8E9ECD8E9ECD8E9EC4B4B4B4B4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F0000DF0000BF2A4B
      4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC007F0000DF0000DF0000BF2A4B4B4BD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F0000DF0000DF0000
      DF0000BF2A4B4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC007F0000DF0000FF0900DF0000DF0000BF2A4B4B4BD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F0000FF2A00DF0000
      FF0900DF0000DF0000BF2A4B4B4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC007F0055FF0000FF2A00DF0000FF0900DF0000DF0000BF2A4B4B
      4BD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F0055FFAA00FF0900
      FF2A00DF0000FF0900DF0000DF00007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC007F0055FFAA00FF0900FF0900FF2A00DF0055FFAA007F00D8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F00AAFF2A00FF0900
      FF0900FF0900FF2A007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC007F00AAFF2A00FF0900FF09AAFF2A007F00D8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F00AAFFAA00FF09AA
      FF2A007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9EC007F00AAFFAAAAFFAA007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC007F00AAFFAA007F00D8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
      D8E9ECD8E9ECD8E9EC007F00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
      ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
      E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
    OnClick = sbIniciarLeituraClick
  end
  object sbSalvarLog: TSpeedButton
    Left = 129
    Top = 442
    Width = 138
    Height = 22
    Caption = 'Salvar Log em Arquivo'
    Flat = True
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000000000000101
      0100020202000303030004040400050505000606060007070700080808000909
      09000A0A0A000B0B0B000C0C0C00130E0E00271413003C1A19004C1E1D005B22
      2000652522006F272400772926007B2A27007D2A27007E2A27007F2A2700802A
      2800802A2800812B2800822B2800842B2900852B2900822B2800802A2800812A
      2800812A2800802A27007F2927007E2826007D2825007D2724007D2523007C23
      21007B2120007B1F1E007A1D1D00791C1C00791B1B00791B1B00791A1A007918
      1800781717007816160078161600781616007817170077181800771A1900761B
      1B00761D1C00761E1D007521200073242300712726006E2B2A0069302F006334
      33005F3635005B393800573B3B00523F3E004C4242004A454500484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700585858005959
      59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
      610062626200636363006464640065656500666666006A636300725F5F007B5B
      5B0082585800895555008F525200955050009A4E4E009E4C4C00A44B4B00A949
      4900AD484800B0474700B3484800B5484800B7494900B8494900B9494900B948
      4900B9484900B9484900B9484900B9484900BA484900BA484900BB484900BB49
      4900BB494A00BC494A00BC494A00BD4A4A00BE4A4B00BE4A4B00BE4B4B00BE4B
      4C00BE4C4C00BE4C4D00BD4D4D00BB4E4E00BA4F4E00B9504F00B8505000B852
      5100B7525200B7535200B7535200B6545300B7565500B7575600B7595800B65C
      5B00B65F5D00B6616000B6646300B7686700B66E6D00B5737200B3787700B17C
      7B00B27F7F00B0828200B4848400B8868600BB878700BC898800BC8B8A00BC8D
      8D00BC908F00B9939300B9979700B99C9C00B9A1A200BAA8A900BBADAE00BDB2
      B300BFB7B800C0BABB00C0BBBC00BFBCBD00BFBDBE00BFBDBE00BFBEBE00BFBD
      BE00BFBDBF00C0BCBF00C1BAC000C3B4C200C6AAC600CC9ACB00D288D200DB6F
      DA00E74AE600F12BF000FB0DFA00FD05FD00FE01FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
      FE00FE00FE00FE00FE00FE03FE00FD09FD00F828F800F343F300EF5CEE00EB71
      EA00E787E600E499E300E2A7E000E0B2DD00DEBBDB00DDC3DA00DBCAD800DACF
      D800DAD2D800D9D4D800D9D6D800DAD8D900DBD9DA00DBDADB00DCDADC00DCDB
      DD00DDDCDE00DFDFE000E3E3E400E9E9EA00EDEDEE00F1F1F100F5F5F500F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600D1D1D1D1D1D1
      D1D1D1D1D1D1D1D1D1D1D1D11B1BA3A3A3A3A3A3A32D1BD1D1D1D11B8C75EB34
      34F3F0ECB5331E1BD1D1D11B8773EE3434EDF3EEBA331E1BD1D1D11B8773F234
      34EBF3F2B8331E1BD1D1D11B8773F3F2EBEBEDEDB8361E1BD1D1D11B80798A97
      978D76918975871BD1D1D11B709AA6AAAAAAA7A7ABAC891BD1D1D11B89FFFFFF
      FFFFFFFFFFFF891BD1D1D11B89FFFFFFFFFFFFFFFFFF891BD1D1D11B89FFB8B8
      B8B8B8B8B8FF891BD1D1D11B89FFFFFFFFFFFFFFFFFF891BD1D1D11B89FFB8B8
      B8B8B8B8B8FF891BD1D1D11B89FFFFFFFFFFFFFFFFFF891BD1D1D1D11BFFFFFF
      FFFFFFFFFFFF1BD1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1}
    OnClick = sbSalvarLogClick
  end
  object Label6: TLabel
    Left = 352
    Top = 88
    Width = 25
    Height = 14
    Caption = 'Parte'
    FocusControl = DBEdit6
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 64
    Width = 73
    Height = 22
    DataField = 'cd_pessoa'
    DataSource = srcLeitura
    Enabled = False
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 88
    Top = 64
    Width = 365
    Height = 22
    DataField = 'nm_pessoa'
    DataSource = srcLeitura
    Enabled = False
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 88
    Top = 104
    Width = 105
    Height = 22
    DataField = 'cd_turma'
    DataSource = srcLeitura
    Enabled = False
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 200
    Top = 104
    Width = 144
    Height = 22
    DataField = 'nr_anosemestre'
    DataSource = srcLeitura
    Enabled = False
    TabOrder = 3
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 104
    Width = 73
    Height = 22
    DataField = 'ds_nome_gabarito'
    DataSource = srcLeitura
    Enabled = False
    TabOrder = 4
  end
  object reLog: TRichEdit
    Left = 6
    Top = 335
    Width = 449
    Height = 100
    BorderStyle = bsNone
    Color = clBtnFace
    TabOrder = 5
  end
  object grdRespostas: TDBGrid
    Left = 8
    Top = 136
    Width = 444
    Height = 185
    DataSource = srcRespostas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Color = 16777088
        Expanded = False
        FieldName = 'nr_questao'
        Title.Caption = 'Quest'#227'o'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_resposta_aluno'
        Title.Caption = 'Resposta do aluno'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_resposta_gabarito'
        Title.Caption = 'Resposta do gabarito'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 100
        Visible = True
      end>
  end
  object cbContabilizar: TCheckBox
    Left = 8
    Top = 445
    Width = 121
    Height = 17
    Caption = 'Contabilizar acertos'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object DBEdit6: TDBEdit
    Left = 352
    Top = 104
    Width = 101
    Height = 22
    DataField = 'nr_parte'
    DataSource = srcLeitura
    Enabled = False
    TabOrder = 8
  end
  object qyLeitura: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  g.cd_prova,'
      '  a.cd_prova_aluno,'
      '  a.cd_prova_gabarito,'
      '  g.ds_nome_gabarito,'
      '  a.cd_pessoa,'
      '  p.nm_pessoa,'
      '  a.cd_turma,'
      '  a.nr_anosemestre,'
      '  pac.nr_questao_inicial,'
      '  pac.nr_questao_final,'
      '  pac.nr_parte'
      'FROM'
      '  leitora_provas_alunos a'
      
        '     INNER JOIN leitora_provas_alunos_cartoes pac ON (pac.cd_pro' +
        'va_aluno = a.cd_prova_aluno)'
      
        '     INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabari' +
        'to = a.cd_prova_gabarito)'
      '     INNER JOIN pessoas p ON (a.cd_pessoa = p.cd_pessoa)'
      'WHERE'
      '  pac.cd_equivalente = :cd_equivalente'
      'GROUP BY'
      '  a.cd_prova_gabarito'
      'ORDER BY'
      '   g.cd_prova DESC')
    Params = <
      item
        DataType = ftString
        Name = 'cd_equivalente'
        ParamType = ptUnknown
        Value = '0'
      end>
    Left = 424
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_equivalente'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyLeituracd_prova: TIntegerField
      FieldName = 'cd_prova'
    end
    object qyLeituracd_prova_aluno: TIntegerField
      FieldName = 'cd_prova_aluno'
    end
    object qyLeituracd_prova_gabarito: TIntegerField
      FieldName = 'cd_prova_gabarito'
    end
    object qyLeiturads_nome_gabarito: TStringField
      FieldName = 'ds_nome_gabarito'
      Size = 15
    end
    object qyLeituracd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qyLeituranm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyLeituracd_turma: TStringField
      FieldName = 'cd_turma'
      Size = 15
    end
    object qyLeituranr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      DisplayFormat = '0000/0'
    end
    object qyLeituranr_questao_inicial: TSmallintField
      FieldName = 'nr_questao_inicial'
    end
    object qyLeituranr_questao_final: TSmallintField
      FieldName = 'nr_questao_final'
    end
    object qyLeituranr_parte: TIntegerField
      FieldName = 'nr_parte'
    end
  end
  object srcLeitura: TDataSource
    DataSet = qyLeitura
    OnDataChange = srcLeituraDataChange
    Left = 400
    Top = 144
  end
  object qyRespostas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'r.nr_questao,'
      #9'r.ds_resposta AS ds_resposta_aluno,'
      #9'gr.ds_resposta AS ds_resposta_gabarito,'
      #9'r.cd_situacao'
      'FROM'
      #9'leitora_provas_alunos_resp r'
      
        '  INNER JOIN leitora_provas_alunos a ON (a.cd_prova_aluno = r.cd' +
        '_prova_aluno)'
      '  INNER JOIN leitora_provas_gabaritos_resp gr ON ('
      
        '    gr.cd_prova_gabarito = a.cd_prova_gabarito AND gr.nr_questao' +
        ' = r.nr_questao AND'
      '    gr.nr_parte = r.nr_parte'
      '  )'
      'WHERE'
      #9'gr.sn_discursiva <> 1 AND'
      #9'r.cd_prova_aluno = :cd_prova_aluno AND'
      '  r.nr_parte = :nr_parte'
      'ORDER BY'
      #9'r.nr_questao')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'nr_parte'
        ParamType = ptUnknown
      end>
    DataSource = srcLeitura
    Left = 424
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova_aluno'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'nr_parte'
        ParamType = ptUnknown
      end>
    object qyRespostasnr_questao: TSmallintField
      FieldName = 'nr_questao'
    end
    object qyRespostasds_resposta_aluno: TStringField
      FieldName = 'ds_resposta_aluno'
      FixedChar = True
      Size = 3
    end
    object qyRespostasds_resposta_gabarito: TStringField
      FieldName = 'ds_resposta_gabarito'
      FixedChar = True
      Size = 3
    end
    object qyRespostascd_situacao: TSmallintField
      FieldName = 'cd_situacao'
    end
    object qyRespostasds_situacao: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_situacao'
      LookupDataSet = DM.qyAlunosRespostasSituacoes
      LookupKeyFields = 'cd_situacao'
      LookupResultField = 'ds_situacao'
      KeyFields = 'cd_situacao'
      Size = 50
      Lookup = True
    end
  end
  object srcRespostas: TDataSource
    DataSet = qyRespostas
    Left = 400
    Top = 192
  end
  object sdLog: TSaveDialog
    DefaultExt = '*.log'
    Filter = 'Arquivo de log (*.log)|*.log|Arquivo do Excel (*.csv)|*.csv'
    Title = 'Defina a pasta e o nome do arquivo de Log'
    Left = 40
    Top = 432
  end
end
