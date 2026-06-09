object frm_Grade_Horarios: Tfrm_Grade_Horarios
  Left = 374
  Top = 271
  BorderStyle = bsDialog
  Caption = 'Hor'#225'rio(s) da Disciplina'
  ClientHeight = 193
  ClientWidth = 321
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
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 152
    Width = 305
    Height = 5
    Style = bsRaised
  end
  object btnFechar: TButton
    Left = 223
    Top = 162
    Width = 89
    Height = 25
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
  object grd: TDBGrid
    Left = 8
    Top = 8
    Width = 305
    Height = 137
    DataSource = srcHorarios
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'semana'
        Title.Caption = 'Dia da semana'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HR_INICIO'
        Title.Caption = 'Hora In'#237'cio'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HR_FIM'
        Title.Caption = 'Hora Fim'
        Width = 70
        Visible = True
      end>
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
  object srcHorarios: TDataSource
    DataSet = qyHorarios
    Left = 184
    Top = 160
  end
  object qyHorarios: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyHorariosCalcFields
    SQL.Strings = (
      'SELECT'
      #9'h.hr_inicio,'
      #9'h.hr_fim,'
      #9'th.dia_semana'
      'FROM'
      #9'horarios h,'
      #9'turmas_horarios th'
      'WHERE'
      #9'th.cd_horario = h.codigo AND'
      #9'th.anosemestre = :anosemestre AND'
      #9'th.turma = :turma AND'
      #9'th.disciplina = :disciplina')
    Params = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 152
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    object qyHorariosdia_semana: TSmallintField
      FieldName = 'dia_semana'
      Origin = 'WMESTRE12.turmas_horarios.dia_semana'
      ReadOnly = True
    end
    object qyHorariossemana: TStringField
      FieldKind = fkCalculated
      FieldName = 'semana'
      ReadOnly = True
      Calculated = True
    end
    object qyHorariosHR_INICIO: TDateTimeField
      FieldName = 'HR_INICIO'
      ReadOnly = True
      DisplayFormat = 't'
      EditMask = '!90:00;1;_'
    end
    object qyHorariosHR_FIM: TDateTimeField
      FieldName = 'HR_FIM'
      ReadOnly = True
      DisplayFormat = 't'
      EditMask = '!90:00;1;_'
    end
  end
end
