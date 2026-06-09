object frmImpAlunos: TfrmImpAlunos
  Left = 260
  Top = 192
  Caption = 'Imprimir...'
  ClientHeight = 239
  ClientWidth = 245
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 245
    Height = 239
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 151
      Width = 65
      Height = 14
      Caption = 'Turma/Curso:'
    end
    object Label2: TLabel
      Left = 9
      Top = 179
      Width = 93
      Height = 14
      Caption = 'Data de Impress'#227'o:'
    end
    object grpReimp: TRadioGroup
      Left = 8
      Top = 8
      Width = 225
      Height = 137
      Caption = ' Reimprimir: '
      Items.Strings = (
        'Contrato'
        'Requerimento'
        'Protocolo de Documenta'#231#227'o')
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 128
      Top = 203
      Width = 108
      Height = 25
      Caption = 'F12 Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnImprimir: TButton
      Left = 10
      Top = 203
      Width = 108
      Height = 25
      Caption = 'F7 Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnImprimirClick
    end
    object cmb: TComboBox
      Left = 106
      Top = 148
      Width = 127
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 3
      OnChange = cmbChange
    end
    object lstAnoSemestre: TListBox
      Left = 104
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 4
      Visible = False
    end
    object lstCursos: TListBox
      Left = 160
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 5
      Visible = False
    end
    object lstRequerimento: TListBox
      Left = 160
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 7
      Visible = False
    end
    object lstTurma: TListBox
      Left = 176
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 6
      Visible = False
    end
    object umdtReq: TUMDateTimePicker
      Left = 106
      Top = 176
      Width = 127
      Height = 21
      BevelOuter = bvNone
      TabOrder = 8
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
      Date = 42635.000000000000000000
      InverterPosicaoCalendario = True
      MostraCalenadarioDesdeCampoTexto = False
    end
  end
  object qryTurmasCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      
        '   m.codigoaluno, m.situacao, m.turma, m.anosemestre, m.dataemis' +
        'sao, s.ds_situacao, i.*, t.serie, m.cd_matricula_curso'
      'from '
      '   matriculas m, situacao s, matriculas_ingresso i, turmas t'
      'where'
      '   m.situacao = s.cd_situacao '
      '   and i.cd_ingresso = m.cd_ingresso'
      '   and t.codigo = m.turma and t.anosemestre = m.anosemestre'
      '   and m.codigoaluno = :cd_pessoa'
      'order by'
      '   m.anosemestre ASC ,m.dataemissao ASC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 192
    Top = 107
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryTurmasCursoscodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
      Required = True
    end
    object qryTurmasCursossituacao: TSmallintField
      FieldName = 'situacao'
    end
    object qryTurmasCursosturma: TStringField
      DisplayWidth = 50
      FieldName = 'turma'
      Required = True
      Size = 50
    end
    object qryTurmasCursosanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Required = True
    end
    object qryTurmasCursosdataemissao: TDateTimeField
      FieldName = 'dataemissao'
    end
    object qryTurmasCursosds_situacao: TStringField
      FieldName = 'ds_situacao'
      Size = 15
    end
    object qryTurmasCursoscd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
    end
    object qryTurmasCursosds_ingresso: TStringField
      FieldName = 'ds_ingresso'
      Size = 50
    end
    object qryTurmasCursoscd_padrao: TIntegerField
      FieldName = 'cd_padrao'
    end
    object qryTurmasCursoscd_auxiliar: TLargeintField
      FieldName = 'cd_auxiliar'
    end
    object qryTurmasCursosserie: TSmallintField
      FieldName = 'serie'
      Required = True
    end
    object qryTurmasCursoscd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
    end
  end
end
