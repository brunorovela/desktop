object frmEmProtesto: TfrmEmProtesto
  Left = 261
  Top = 144
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Mensalidades em Protestos...'
  ClientHeight = 440
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 440
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 398
      Width = 771
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnFechar: TButton
        Left = 235
        Top = 4
        Width = 89
        Height = 34
        Caption = 'F12 Fechar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        OnClick = btnFecharClick
      end
      object btnImprimir: TButton
        Left = 131
        Top = 4
        Width = 97
        Height = 34
        Caption = 'F8 &Imprimir'
        TabOrder = 1
        OnClick = btnImprimirClick
      end
      object btnExcluir: TButton
        Left = 3
        Top = 4
        Width = 121
        Height = 34
        Caption = 'F5 R&etirar Protesto'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 771
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'MENSALIDADES EM PROTESTOS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 1
      Top = 26
      Width = 771
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object sbSelecionado: TSpeedButton
        Left = 4
        Top = 3
        Width = 224
        Height = 22
        GroupIndex = 1
        Down = True
        Caption = 'Visualizar somente o aluno Selecionado'
        Flat = True
        OnClick = sbSelecionadoClick
      end
      object sbTodos: TSpeedButton
        Left = 228
        Top = 3
        Width = 224
        Height = 22
        GroupIndex = 1
        Caption = 'Visualizar todos os alunos'
        Flat = True
        OnClick = sbTodosClick
      end
    end
    object tcProtestos: TTabControl
      Left = 1
      Top = 57
      Width = 771
      Height = 341
      Align = alClient
      TabOrder = 3
      Tabs.Strings = (
        'Todas as Anota'#231#245'es')
      TabIndex = 0
      OnChange = tcProtestosChange
      object sbSelecionarColuna: TSpeedButton
        Left = 743
        Top = 0
        Width = 25
        Height = 21
        Hint = 'Selecionar Colunas'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
          DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
          0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
          808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
          90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
          6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
          9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
          50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
          3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
          A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
          9F806000402000808080808020202000600000804000804020FF7F00BF000000
          00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
          2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
          702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
          0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
          A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
          9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
          8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
          707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
          DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
          DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
          AFAFAF303030000000000000000000000000000000000000000000303030AFAF
          AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbSelecionarColunaClick
      end
      object grd: TDBGrid
        Left = 4
        Top = 25
        Width = 763
        Height = 312
        Align = alClient
        DataSource = dtcEmProtesto
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtd
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codigoaluno'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parcela'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavencimento'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'turma'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataemissao'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usuario'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nossonumero'
            Width = 80
            Visible = True
          end>
      end
    end
  end
  object dtcEmProtesto: TDataSource
    DataSet = tblApresentaEmProtesto
    Left = 424
    Top = 176
  end
  object qryUpdate: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'update [Mensalidades] set Situacao = 2'
      'where'
      'CodigoAluno = :CodigoAluno and'
      'Parcela = :Parcela and'
      'DataVencimento = :DataVencimento and'
      'Turma = :Turma')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
  end
  object tblEmProtesto: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblEmProtestoNewRecord
    SQL.Strings = (
      'select '
      '    *'
      'from '
      '    EmProtesto'
      'where'
      '   DataEmissao = :DataEmissao')
    Params = <
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end>
    object tblEmProtestoParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'EmProtesto.Parcela'
    end
    object tblEmProtestoDataVencimento: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'DataVencimento'
      Origin = 'EmProtesto.DataVencimento'
    end
    object tblEmProtestoTurma: TStringField
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'EmProtesto.Turma'
      Size = 50
    end
    object tblEmProtestoValor: TFloatField
      FieldName = 'Valor'
      Origin = 'EmProtesto.Valor'
    end
    object tblEmProtestoDataEmissao: TDateTimeField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DataEmissao'
      Origin = 'EmProtesto.DataEmissao'
    end
    object tblEmProtestoUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'EmProtesto.Usuario'
      Size = 30
    end
    object tblEmProtestoNossoNumero: TStringField
      DisplayWidth = 20
      FieldName = 'NossoNumero'
      Origin = 'EmProtesto.NossoNumero'
      Size = 10
    end
    object tblEmProtestoGerado: TStringField
      FieldName = 'Gerado'
      Origin = 'WMESTRE12.emprotesto.Gerado'
      Size = 50
    end
    object tblEmProtestocodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
    end
    object tblEmProtestocd_mensalidade: TLargeintField
      FieldName = 'cd_mensalidade'
    end
  end
  object tblApresentaEmProtesto: TUMZQuery
    Connection = DM.db
    OnNewRecord = tblEmProtestoNewRecord
    SQL.Strings = (
      'SELECT'
      '   emp.codigoaluno,'
      '   emp.parcela,'
      '   emp.datavencimento,'
      '   emp.turma,'
      '   emp.valor,'
      '   emp.dataemissao,'
      '   emp.usuario,'
      '   emp.gerado,'
      '   emp.nossonumero,'
      '   emp.cd_mensalidade,'
      '   COALESCE(m.ds_historico, '#39#39') ds_historico,'
      '   (CASE WHEN m.cd_mensalidade IS NULL THEN 0 '
      '         ELSE GET_ACRESCIMOS(m.cd_mensalidade, NULL) '
      '    END) juros,'
      '   p.nm_pessoa'
      'FROM'
      '   emprotesto emp'
      '      JOIN pessoas p ON (emp.codigoaluno = p.cd_pessoa)'
      
        '      LEFT JOIN mensalidades m ON (emp.cd_mensalidade = m.cd_men' +
        'salidade)'
      'ORDER BY'
      '   p.nm_pessoa')
    Params = <>
    Left = 456
    Top = 176
    object tblApresentaEmProtestocodigoaluno: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Aluno'
      FieldName = 'codigoaluno'
      Origin = 'WMESTRE12.emprotesto.codigoaluno'
    end
    object tblApresentaEmProtestonm_pessoa: TStringField
      Tag = 1
      DisplayLabel = 'Nome do Aluno'
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
    object tblApresentaEmProtestoparcela: TSmallintField
      Tag = 1
      DisplayLabel = 'Parc.'
      FieldName = 'parcela'
      Origin = 'WMESTRE12.emprotesto.parcela'
    end
    object tblApresentaEmProtestodatavencimento: TDateTimeField
      Tag = 1
      DisplayLabel = 'Vencimento'
      FieldName = 'datavencimento'
      Origin = 'WMESTRE12.emprotesto.datavencimento'
    end
    object tblApresentaEmProtestoturma: TStringField
      Tag = 1
      DisplayLabel = 'Turma'
      FieldName = 'turma'
      Origin = 'WMESTRE12.emprotesto.turma'
      Size = 50
    end
    object tblApresentaEmProtestovalor: TFloatField
      Tag = 1
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'WMESTRE12.emprotesto.valor'
      DisplayFormat = '###,###,##0.00'
    end
    object tblApresentaEmProtestodataemissao: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'dataemissao'
      Origin = 'WMESTRE12.emprotesto.dataemissao'
    end
    object tblApresentaEmProtestousuario: TStringField
      Tag = 1
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      Origin = 'WMESTRE12.emprotesto.usuario'
      Size = 30
    end
    object tblApresentaEmProtestonossonumero: TStringField
      Tag = 1
      DisplayLabel = 'Nosso N'#250'mero'
      DisplayWidth = 20
      FieldName = 'nossonumero'
      Origin = 'WMESTRE12.emprotesto.nossonumero'
      Size = 10
    end
    object tblApresentaEmProtestogerado: TStringField
      Tag = 1
      DisplayLabel = 'Gerado'
      FieldName = 'gerado'
      Origin = 'WMESTRE12.emprotesto.gerado'
      FixedChar = True
      Size = 1
    end
    object tblApresentaEmProtestods_historico: TStringField
      Tag = 1
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'ds_historico'
      Origin = 'WMESTRE12.emprotesto.ds_historico'
      Size = 150
    end
    object tblApresentaEmProtestojuros: TFloatField
      Tag = 1
      DisplayLabel = 'Juros Atu.'
      FieldName = 'juros'
      Origin = 'WMESTRE12.emprotesto.juros'
      DisplayFormat = '###,###,##0.00'
    end
    object tblApresentaEmProtestocd_mensalidade: TLargeintField
      FieldName = 'cd_mensalidade'
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 488
    Top = 176
  end
end
