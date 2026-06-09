object fCopiaTurma: TfCopiaTurma
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Copia de Turmas'
  ClientHeight = 475
  ClientWidth = 691
  Color = clBtnFace
  Constraints.MinHeight = 506
  Constraints.MinWidth = 699
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnTopEsquerda: TPanel
      Left = 0
      Top = 0
      Width = 9
      Height = 49
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object rgCopiarMaisUnidades: TRadioGroup
      Left = 9
      Top = 0
      Width = 673
      Height = 49
      Align = alClient
      Caption = 'Deseja copiar para mais de uma unidade?'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Sim'
        'N'#227'o')
      ParentFont = False
      TabOrder = 1
      OnClick = rgCopiarMaisUnidadesClick
    end
    object pnTopDireita: TPanel
      Left = 682
      Top = 0
      Width = 9
      Height = 49
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 435
    Width = 691
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object bbtnCancelar: TSpeedButton
      Left = 368
      Top = 6
      Width = 113
      Height = 25
      Caption = 'F6 Cancelar'
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
      OnClick = bbtnCancelarClick
    end
    object bbtnSalvar: TBitBtn
      Left = 192
      Top = 6
      Width = 113
      Height = 25
      Caption = 'F5 Salvar'
      ModalResult = 1
      TabOrder = 0
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
  object pnCentro: TPanel
    Left = 0
    Top = 49
    Width = 691
    Height = 258
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnCentroDireita: TPanel
      Left = 682
      Top = 9
      Width = 9
      Height = 240
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnCentroEsquerda: TPanel
      Left = 0
      Top = 9
      Width = 9
      Height = 240
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnCentroTopo: TPanel
      Left = 0
      Top = 0
      Width = 691
      Height = 9
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
    object pnCentroRodape: TPanel
      Left = 0
      Top = 249
      Width = 691
      Height = 9
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
    end
    object sgCopiaTurmasColigadas: TStringGrid
      Left = 9
      Top = 9
      Width = 673
      Height = 240
      Align = alClient
      BevelInner = bvNone
      ColCount = 2
      DefaultColWidth = 150
      DefaultRowHeight = 21
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 4
      OnDrawCell = sgCopiaTurmasColigadasDrawCell
    end
  end
  object pnRodape2: TPanel
    Left = 0
    Top = 336
    Width = 691
    Height = 99
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object pnQuestionamentos: TPanel
      Left = 0
      Top = 48
      Width = 691
      Height = 51
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object rgCopiaGradesHorarios: TRadioGroup
        AlignWithMargins = True
        Left = 7
        Top = 0
        Width = 677
        Height = 48
        Margins.Left = 7
        Margins.Top = 0
        Margins.Right = 7
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Deseja copiar as Grades de Hor'#225'rios?'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentFont = False
        TabOrder = 0
      end
    end
    object rgCopiaDisciplinasTurmasProfessor: TRadioGroup
      AlignWithMargins = True
      Left = 7
      Top = 0
      Width = 677
      Height = 48
      Margins.Left = 7
      Margins.Top = 0
      Margins.Right = 7
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Deseja copiar as disciplinas e turmas do professor?'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Sim'
        'N'#227'o')
      ParentFont = False
      TabOrder = 0
      OnClick = rgCopiaDisciplinasTurmasProfessorClick
    end
  end
  object pnAnosemestre: TPanel
    Left = 0
    Top = 307
    Width = 691
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 2
      Width = 83
      Height = 14
      Caption = 'Ano/Semestre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object medAnosemestre: TMaskEdit
      Left = 100
      Top = 0
      Width = 120
      Height = 21
      EditMask = '!9999/0;1;_'
      MaxLength = 6
      TabOrder = 0
      Text = '    / '
    end
  end
  object qryContaColigadas: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   count( * ) as cont'
      'FROM'
      '   coligadas   ')
    Params = <>
    Left = 392
    Top = 16
  end
end
