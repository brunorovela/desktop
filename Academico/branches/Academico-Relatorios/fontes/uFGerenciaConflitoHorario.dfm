object formGerenciaConflitoHorario: TformGerenciaConflitoHorario
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Gerenciar conflito de Hor'#225'rios'
  ClientHeight = 484
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'GERENCIAR CONFLITO DE HOR'#193'RIOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 450
    Width = 792
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TBitBtn
      Left = 278
      Top = 6
      Width = 91
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
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
    end
    object Button2: TBitBtn
      Left = 399
      Top = 6
      Width = 93
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 6
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
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
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 409
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 88
      Height = 13
      Caption = 'Hor'#225'rios Novos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 210
      Width = 118
      Height = 13
      Caption = 'Hor'#225'rios em Conflito:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sgdHorariosNovos: TStringGrid
      Left = 16
      Top = 32
      Width = 761
      Height = 169
      ColCount = 7
      DefaultColWidth = 100
      DefaultRowHeight = 17
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnDrawCell = sgdHorariosNovosDrawCell
      OnSelectCell = sgdHorariosNovosSelectCell
    end
    object dbHorariosConflito: TDBGrid
      Left = 16
      Top = 233
      Width = 761
      Height = 173
      DataSource = dsHorariosConflito
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbHorariosConflitoCellClick
      OnDrawColumnCell = dbHorariosConflitoDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_disciplina'
          Title.Caption = 'Disciplina'
          Width = 213
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_dia_semana'
          Title.Caption = 'Dia Semana'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_horario'
          Title.Caption = 'Hor'#225'rio'
          Width = 213
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_inicial'
          ReadOnly = False
          Title.Caption = 'Data Inicio'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_final'
          ReadOnly = False
          Title.Caption = 'Data Fim'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SELECAO'
          Title.Caption = 'Excluir'
          Width = 51
          Visible = True
        end>
    end
    object maskDataInicio: TUMDateTimePicker
      Left = 523
      Top = 252
      Width = 83
      Height = 21
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      ImgBotaoCalendario.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
        D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
        C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
        A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
        3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
        D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
        97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
        BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
        F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
        E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
        81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
        ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
        D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
        BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
        FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
        ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
        D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
        F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
        DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
        49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
        ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
        83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
        287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
        E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
        9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
      OnChangeDate = maskDataInicioChangeDate
      Date = 42443.000000000000000000
    end
    object maskDataFim: TUMDateTimePicker
      Left = 609
      Top = 252
      Width = 114
      Height = 21
      BevelOuter = bvNone
      Caption = 'maskDataFim'
      TabOrder = 3
      Visible = False
      ImgBotaoCalendario.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
        D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
        C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
        A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
        3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
        D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
        97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
        BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
        F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
        E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
        81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
        ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
        D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
        BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
        FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
        ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
        D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
        F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
        DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
        49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
        ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
        83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
        287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
        E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
        9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
      OnChangeDate = maskDataFimChangeDate
      Date = 42443.000000000000000000
    end
  end
  object qryHorariosNovos: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 448
    Top = 40
  end
  object qryHorariosConflito: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'd.descricao ds_disciplina,'
      '  thc.cd_disciplina,'
      #9'CASE'
      #9#9'WHEN thc.nr_dia_semana = 1 THEN '#39'Domingo'#39
      #9#9'WHEN thc.nr_dia_semana = 2 THEN '#39'Segunda'#39
      #9#9'WHEN thc.nr_dia_semana = 3 THEN '#39'Ter'#231'a'#39
      #9#9'WHEN thc.nr_dia_semana = 4 THEN '#39'Quarta'#39
      #9#9'WHEN thc.nr_dia_semana = 5 THEN '#39'Quinta'#39
      #9#9'WHEN thc.nr_dia_semana = 6 THEN '#39'Sexta'#39
      #9#9'WHEN thc.nr_dia_semana = 7 THEN '#39'S'#225'bado'#39
      #9'END AS ds_dia_semana,'
      ' CONCAT('
      
        #9'h.codigo, " - ", h.ds_horario, " (", h.hr_inicio, " - ", h.hr_f' +
        'im, ")"'
      ') ds_horario,'
      ' COALESCE('
      #9'DATE_FORMAT(thc.dt_inicial, "%d/%m/%Y"),'
      #9'"Primeiro hor'#225'rio da turma"'
      ') dt_inicial,'
      #9'COALESCE('
      #9#9'DATE_FORMAT(thc.dt_final, "%d/%m/%Y"),'
      #9#9'"Hor'#225'rio atual da turma"'
      #9') dt_final,'
      '  thc.cd_horario,'
      #9'thc.nr_dia_semana,'
      '  thc.cd_turmas_horarios,'
      '  thc.dt_inicial as dt_inicial_original,'
      '  thc.dt_final as dt_final_original'
      'FROM'
      #9'turmas_horarios_config thc'
      'INNER JOIN horarios h ON (h.codigo = thc.cd_horario)'
      'INNER JOIN turmas t ON ('
      #9't.codigo = thc.cd_turma_base'
      #9'AND t.anosemestre = thc.nr_anosemestre'
      ')'
      'INNER JOIN disciplinas d ON ('
      #9'd.codigo = thc.cd_disciplina'
      #9'AND t.curso = d.curso'
      ')'
      'WHERE'
      #9'thc.cd_turmas_horarios in (:horarios)'
      'ORDER BY'
      #9'thc.nr_dia_semana,'
      #9'thc.dt_inicial,'
      #9'thc.dt_final')
    Params = <
      item
        DataType = ftUnknown
        Name = 'horarios'
        ParamType = ptUnknown
      end>
    Left = 752
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'horarios'
        ParamType = ptUnknown
      end>
    object qryHorariosConflitods_dia_semana: TStringField
      FieldName = 'ds_dia_semana'
      Size = 255
    end
    object qryHorariosConflitods_disciplina: TStringField
      FieldName = 'ds_disciplina'
      Size = 255
    end
    object qryHorariosConflitods_horario: TStringField
      FieldName = 'ds_horario'
      Size = 255
    end
    object qryHorariosConflitodt_inicial: TStringField
      FieldName = 'dt_inicial'
      Size = 255
    end
    object qryHorariosConflitodt_final: TStringField
      FieldName = 'dt_final'
      Size = 255
    end
    object qryHorariosConflitocd_horario: TIntegerField
      FieldName = 'cd_horario'
    end
    object qryHorariosConflitonr_dia_semana: TIntegerField
      FieldName = 'nr_dia_semana'
    end
    object qryHorariosConflitocd_turmas_horarios: TIntegerField
      FieldName = 'cd_turmas_horarios'
    end
    object qryHorariosConflitocd_disciplina: TIntegerField
      FieldName = 'cd_disciplina'
    end
    object qryHorariosConflitodt_inicial_original: TDateField
      FieldName = 'dt_inicial_original'
    end
    object qryHorariosConflitodt_final_original: TDateField
      FieldName = 'dt_final_original'
    end
  end
  object dsHorariosConflito: TDataSource
    DataSet = qryHorariosConflito
    Left = 720
    Top = 244
  end
  object qryUpdateConflitoInicio: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  turmas_horarios_config'
      'SET dt_inicial = :dt_inicio'
      'WHERE'
      '  cd_turmas_horarios = :turmahorario')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turmahorario'
        ParamType = ptUnknown
      end>
    Left = 688
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turmahorario'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateConflitoFim: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '  turmas_horarios_config'
      'SET dt_final = :dt_fim'
      'WHERE'
      '  cd_turmas_horarios = :turmahorario')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dt_fim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turmahorario'
        ParamType = ptUnknown
      end>
    Left = 656
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt_fim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turmahorario'
        ParamType = ptUnknown
      end>
  end
end
