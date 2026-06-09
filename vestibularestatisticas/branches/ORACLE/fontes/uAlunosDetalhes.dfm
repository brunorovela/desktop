object frm_Detalhes: Tfrm_Detalhes
  Left = 273
  Top = 185
  Caption = 'Detalhes do aluno'
  ClientHeight = 313
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object btnFechar: TSpeedButton
    Left = 440
    Top = 288
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
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 49
    Height = 16
    Caption = 'C'#243'digo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 41
    Height = 16
    Caption = 'Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 44
    Height = 16
    Caption = 'Turma:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 40
    Height = 16
    Caption = 'Curso:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 144
    Width = 90
    Height = 16
    Caption = 'Ano/semestre:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 176
    Width = 97
    Height = 16
    Caption = 'Inst. Vestibular:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 16
    Top = 208
    Width = 107
    Height = 16
    Caption = 'Curso Vestibular:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 240
    Width = 103
    Height = 16
    Caption = 'Status do nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 128
    Top = 16
    Width = 400
    Height = 17
    DataField = 'cd_pessoa'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText2: TDBText
    Left = 128
    Top = 48
    Width = 400
    Height = 17
    DataField = 'nm_pessoa'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText3: TDBText
    Left = 128
    Top = 80
    Width = 400
    Height = 17
    DataField = 'turma'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText4: TDBText
    Left = 128
    Top = 112
    Width = 400
    Height = 17
    DataField = 'apelido'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText5: TDBText
    Left = 128
    Top = 144
    Width = 400
    Height = 17
    DataField = 'anosemestre'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText6: TDBText
    Left = 128
    Top = 176
    Width = 400
    Height = 17
    DataField = 'nm_instituicao'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText7: TDBText
    Left = 128
    Top = 208
    Width = 400
    Height = 17
    DataField = 'ds_curso'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText8: TDBText
    Left = 128
    Top = 240
    Width = 400
    Height = 17
    DataField = 'ds_status'
    DataSource = srcDetalhes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object qyDetalhes: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'a.cd_pessoa,'
      #9'a.cd_candidato,'
      #9'a.ds_status,'
      #9'i.cd_inst_vestibular,'
      #9'i.ds_curso,'
      #9'ies.nm_instituicao,'
      #9'p.nm_pessoa,'
      #9'm.anosemestre,'
      #9'm.curso,'
      #9'm.turma,'
      #9'c.ds_contato,'
      #9'cur.apelido'
      'FROM'
      #9'pessoas p'
      
        #9#9'INNER JOIN matriculas m ON (m.codigoaluno = p.cd_pessoa AND (m' +
        '.situacao = 0 OR m.situacao = 1))'
      
        #9#9'INNER JOIN cursos cur ON (cur.codigo = m.curso AND cur.anoseme' +
        'stre = m.anosemestre)'
      
        #9#9'LEFT JOIN contatos_pessoas c ON (c.cd_pessoa = p.cd_pessoa AND' +
        ' c.cd_contato = 4)'
      #9#9'INNER JOIN alunos_vestibular a ON (a.cd_pessoa = p.cd_pessoa)'
      
        #9#9'INNER JOIN instituicoes_vestibular i ON (i.cd_inst_vestibular ' +
        '= a.cd_inst_vestibular)'
      
        #9#9'INNER JOIN instituicoes_ensino ies ON (ies.cd_instituicao = i.' +
        'cd_instituicao)'
      'WHERE'
      #9'i.nr_anosemestre = :nr_anosemestre AND'
      #9'p.cd_pessoa = :cd_pessoa AND'
      #9'i.cd_inst_vestibular = :cd_inst_vestibular'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_inst_vestibular'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_inst_vestibular'
        ParamType = ptUnknown
      end>
    object qyDetalhescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
    object qyDetalhescd_candidato: TIntegerField
      FieldName = 'cd_candidato'
    end
    object qyDetalhesds_status: TStringField
      FieldName = 'ds_status'
    end
    object qyDetalhescd_inst_vestibular: TIntegerField
      FieldName = 'cd_inst_vestibular'
    end
    object qyDetalhesds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 255
    end
    object qyDetalhesnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qyDetalhescurso: TStringField
      FieldName = 'curso'
      Size = 15
    end
    object qyDetalhesturma: TStringField
      FieldName = 'turma'
      Size = 15
    end
    object qyDetalhesds_contato: TStringField
      FieldName = 'ds_contato'
      Size = 100
    end
    object qyDetalhesapelido: TStringField
      FieldName = 'apelido'
      Size = 50
    end
    object qyDetalhesnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Size = 80
    end
    object qyDetalhesanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
  end
  object srcDetalhes: TDataSource
    DataSet = qyDetalhes
    Left = 16
    Top = 288
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
end
