object frmAgrupamentoSelecionaHorarios: TfrmAgrupamentoSelecionaHorarios
  Left = 0
  Top = 0
  Caption = 'Selecione, arraste e solte'
  ClientHeight = 407
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbCategoria: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 18
      Caption = 'Categoria:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbCategorias: TComboBox
      Left = 87
      Top = 5
      Width = 208
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnSelect = cbCategoriasSelect
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 551
    Height = 366
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object dbgHorarios: TDBGrid
      Left = 0
      Top = 0
      Width = 551
      Height = 366
      Align = alClient
      DataSource = dsHorarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColEnter = dbgHorariosColEnter
      Columns = <
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_horario'
          Title.Caption = 'Descri'#231#227'o'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hr_inicio'
          Title.Caption = 'Inicio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hr_fim'
          Title.Caption = 'Fim'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_chave'
          Title.Caption = 'Chave'
          Width = 200
          Visible = True
        end>
    end
  end
  object dsHorarios: TDataSource
    DataSet = qryHorariosU
    Left = 256
    Top = 144
  end
  object qyCategoriasU: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT DISTINCT'
      '   ds_categoria'
      'FROM'
      '   horarios'
      'WHERE'
      '   TRIM(ds_categoria) <> '#39#39
      'ORDER BY'
      '   ds_categoria')
    Params = <>
    Left = 328
    object qyCategoriasUds_categoria: TStringField
      FieldName = 'ds_categoria'
      Size = 255
    end
  end
  object qryHorariosU: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 224
    Top = 144
    object qryHorariosUcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryHorariosUds_horario: TStringField
      FieldName = 'ds_horario'
    end
    object qryHorariosUhr_inicio: TTimeField
      FieldName = 'hr_inicio'
    end
    object qryHorariosUhr_fim: TTimeField
      FieldName = 'hr_fim'
    end
    object qryHorariosUds_sigla: TStringField
      FieldName = 'ds_sigla'
    end
    object qryHorariosUturno: TStringField
      FieldName = 'turno'
    end
    object qryHorariosUcd_horario_urania: TLargeintField
      FieldName = 'cd_horario_urania'
    end
    object qryHorariosUds_chave: TStringField
      FieldName = 'ds_chave'
    end
    object qryHorariosUds_categoria: TStringField
      FieldName = 'ds_categoria'
    end
  end
end
