object frmImpAlunos: TfrmImpAlunos
  Left = 260
  Top = 192
  Caption = 'Imprimir...'
  ClientHeight = 180
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
    Height = 180
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 116
      Width = 65
      Height = 14
      Caption = 'Turma/Curso:'
    end
    object grpReimp: TRadioGroup
      Left = 8
      Top = 8
      Width = 225
      Height = 97
      Caption = ' Reimprimir: '
      Items.Strings = (
        'Contrato'
        'Requerimento')
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 144
      Top = 150
      Width = 89
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
      Left = 48
      Top = 150
      Width = 89
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
      Left = 88
      Top = 112
      Width = 145
      Height = 22
      ItemHeight = 14
      TabOrder = 3
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
    object dat: TDateTimePicker
      Left = 104
      Top = 69
      Width = 89
      Height = 22
      Date = 35955.727549074070000000
      Time = 35955.727549074070000000
      TabOrder = 5
    end
    object lstCursos: TListBox
      Left = 160
      Top = 32
      Width = 57
      Height = 25
      ItemHeight = 14
      TabOrder = 6
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
      TabOrder = 8
      Visible = False
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
    Left = 16
    Top = 136
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
