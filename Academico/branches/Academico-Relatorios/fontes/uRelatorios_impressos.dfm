object frm_Relatorios_impressos: Tfrm_Relatorios_impressos
  Left = 204
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rios'
  ClientHeight = 490
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 32
    Width = 11
    Height = 451
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel5: TBevel
    Left = 873
    Top = 32
    Width = 11
    Height = 451
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 615
  end
  object Bevel7: TBevel
    Left = 0
    Top = 483
    Width = 884
    Height = 7
    Align = alBottom
    Shape = bsSpacer
    ExplicitWidth = 626
  end
  object Bevel1: TBevel
    Left = 0
    Top = 25
    Width = 884
    Height = 7
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 626
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'RELAT'#211'RIOS J'#193' IMPRESSOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnDados: TPanel
    Left = 11
    Top = 32
    Width = 862
    Height = 451
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 862
      Height = 420
      Align = alClient
      DataSource = srcRelatorios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nm_relatorio'
          Title.Caption = 'Relat'#243'rio'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_pessoa'
          Title.Caption = 'Usu'#225'rio'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_impresso'
          Title.Caption = 'Nr. Impresso'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_pessoa'
          Title.Caption = 'C'#243'd. Pessoa - Filtro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'anosemestre'
          Title.Caption = 'Ano/Semestre - Filtro'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'turma'
          Title.Caption = 'Turma - Filtro'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_relatorio'
          Title.Caption = 'Data Impress'#227'o'
          Width = 135
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 0
      Top = 420
      Width = 862
      Height = 31
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object sbImprimir: TSpeedButton
        Left = 409
        Top = 6
        Width = 89
        Height = 22
        Caption = 'F7 Imprimir'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000001F7C10421042000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000D5561F7CCE39000000001042CE3900001F7C
          1F7C1F7C1F7C1F7C1F7C1042CE39396739671F7C744E524A524A10420000CE39
          00001F7C1F7C1F7C1042CE395A6B39671F7C1F7C744E524A524A524A10420000
          00001F7C1F7C1F7C1042DE7B39671F7C1F7CDE7B524A744E524A104210421042
          CE3900001F7C1F7C1042DE7B1F7CDE7BDE7B396739673967524A524A1042CE39
          CE3900001F7C1F7C1042DE7BDE7B5A6B5A6B007C0564396739671F7C10421042
          CE3900001F7C1F7C1042DE7B7B6FE0034032396739675A6BCE3910420000CE39
          CE3900001F7C1F7C1F7C104210427B6F5A6B5A6B1042CE391F7C1F7C0000CE39
          CE391F7C1F7C1F7C1F7C1F7C1F7C1042DE7BCE391F7C1F7C7B6F9B6F7B6F1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10429B6FBC73BD77DE7B7B6F
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042BD77BD77DE7B1042
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104210421F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = sbImprimirClick
      end
      object sbFechar: TSpeedButton
        Left = 504
        Top = 5
        Width = 89
        Height = 22
        Caption = 'F12 Fechar'
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
        OnClick = sbFecharClick
      end
    end
  end
  object popTurmas: TPopupMenu
    AutoHotkeys = maManual
    Left = 616
    Top = 136
  end
  object qyRelatorios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  r.*,'
      #9'ri.*,'
      '  p.nm_pessoa'
      'FROM'
      #9'relatorios r'
      ''
      'INNER JOIN relatorios_impressos ri ON('
      '  ri.cd_relatorio = r.cd_relatorio'
      ')'
      'INNER JOIN pessoas p ON ('
      '  p.cd_pessoa = ri.cd_usuario'
      ')'
      ''
      'WHERE'
      #9'ri.cd_relatorio = r.cd_relatorio AND'
      #9'r.cd_modulo = :modulo'
      'ORDER BY'
      #9'ri.dt_relatorio DESC')
    Params = <
      item
        DataType = ftInteger
        Name = 'modulo'
        ParamType = ptInput
      end>
    Left = 171
    Top = 124
    ParamData = <
      item
        DataType = ftInteger
        Name = 'modulo'
        ParamType = ptInput
      end>
    object qyRelatoriosnm_relatorio: TStringField
      FieldName = 'nm_relatorio'
      Origin = 'WMESTRE12.relatorios.nm_relatorio'
      Size = 50
    end
    object qyRelatorioscd_modulo: TIntegerField
      FieldName = 'cd_modulo'
      Origin = 'WMESTRE12.relatorios.cd_modulo'
    end
    object qyRelatorioscd_cabecalho: TIntegerField
      FieldName = 'cd_cabecalho'
      Origin = 'WMESTRE12.relatorios.cd_cabecalho'
    end
    object qyRelatoriosds_grupo: TStringField
      FieldName = 'ds_grupo'
      Origin = 'WMESTRE12.relatorios.ds_grupo'
      Size = 50
    end
    object qyRelatoriosnm_arquivo: TStringField
      FieldName = 'nm_arquivo'
      Origin = 'WMESTRE12.relatorios.nm_arquivo'
      Size = 50
    end
    object qyRelatoriosds_parametros: TStringField
      FieldName = 'ds_parametros'
      Origin = 'WMESTRE12.relatorios.ds_parametros'
      Size = 255
    end
    object qyRelatoriosds_ordem: TStringField
      FieldName = 'ds_ordem'
      Origin = 'WMESTRE12.relatorios.ds_ordem'
      Size = 255
    end
    object qyRelatoriossn_disponivel: TStringField
      FieldName = 'sn_disponivel'
      Origin = 'WMESTRE12.relatorios.sn_disponivel'
      FixedChar = True
      Size = 1
    end
    object qyRelatoriosds_formula_grupo: TStringField
      FieldName = 'ds_formula_grupo'
      Origin = 'WMESTRE12.relatorios.ds_formula_grupo'
      Size = 255
    end
    object qyRelatoriosds_sql: TMemoField
      FieldName = 'ds_sql'
      Origin = 'WMESTRE12.relatorios.ds_sql'
      BlobType = ftMemo
      Size = 1
    end
    object qyRelatoriossn_impressao_numero: TStringField
      FieldName = 'sn_impressao_numero'
      Origin = 'WMESTRE12.relatorios.sn_impressao_numero'
      FixedChar = True
      Size = 1
    end
    object qyRelatoriosds_sql_ordem: TStringField
      FieldName = 'ds_sql_ordem'
      Origin = 'WMESTRE12.relatorios.ds_sql_ordem'
      Size = 255
    end
    object qyRelatoriosanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.relatorios_impressos.anosemestre'
    end
    object qyRelatoriosturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.relatorios_impressos.turma'
      Size = 15
    end
    object qyRelatoriosdt_relatorio: TDateTimeField
      FieldName = 'dt_relatorio'
      Origin = 'WMESTRE12.relatorios_impressos.dt_relatorio'
    end
    object qyRelatoriosds_formula: TMemoField
      FieldName = 'ds_formula'
      Origin = 'WMESTRE12.relatorios.ds_formula'
      BlobType = ftMemo
      Size = 1
    end
    object qyRelatoriosds_especial: TMemoField
      FieldName = 'ds_especial'
      Origin = 'WMESTRE12.relatorios.ds_especial'
      BlobType = ftMemo
      Size = 1
    end
    object qyRelatoriosnr_impresso: TLargeintField
      FieldName = 'nr_impresso'
      Required = True
    end
    object qyRelatorioscd_pessoa: TLargeintField
      FieldName = 'cd_pessoa'
    end
    object qyRelatoriosCD_RELATORIO: TLargeintField
      FieldName = 'CD_RELATORIO'
    end
    object qyRelatoriossn_pode_exportar: TSmallintField
      FieldName = 'sn_pode_exportar'
      Required = True
    end
    object qyRelatoriosnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
  end
  object srcRelatorios: TDataSource
    DataSet = qyRelatorios
    Left = 171
    Top = 156
  end
end
