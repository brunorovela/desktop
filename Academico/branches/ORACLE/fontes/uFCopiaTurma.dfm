object fCopiaTurma: TfCopiaTurma
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Copia de Turmas'
  ClientHeight = 539
  ClientWidth = 702
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
    Width = 702
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
      Width = 684
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
      Left = 693
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
    Top = 505
    Width = 702
    Height = 34
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
      OnClick = bbtnSalvarClick
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
    Width = 702
    Height = 328
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnCentroDireita: TPanel
      Left = 693
      Top = 9
      Width = 9
      Height = 310
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnCentroEsquerda: TPanel
      Left = 0
      Top = 9
      Width = 9
      Height = 310
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnCentroTopo: TPanel
      Left = 0
      Top = 0
      Width = 702
      Height = 9
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
    object pnCentroRodape: TPanel
      Left = 0
      Top = 319
      Width = 702
      Height = 9
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
    end
    object sgCopiaTurmasColigadas: TStringGrid
      Left = 9
      Top = 9
      Width = 684
      Height = 310
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
    Top = 406
    Width = 702
    Height = 99
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 385
      Height = 99
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnCopia'
      TabOrder = 0
      object pnQuestionamentos: TPanel
        Left = 0
        Top = 0
        Width = 385
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object rgCopiaGradesHorarios: TRadioGroup
          Left = 14
          Top = 2
          Width = 363
          Height = 46
          Margins.Left = 7
          Margins.Top = 0
          Margins.Right = 7
          Margins.Bottom = 0
          Align = alCustom
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
        Left = 14
        Top = 50
        Width = 363
        Height = 46
        Margins.Left = 7
        Margins.Top = 0
        Margins.Right = 7
        Margins.Bottom = 0
        Align = alCustom
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
        TabOrder = 1
        OnClick = rgCopiaDisciplinasTurmasProfessorClick
      end
    end
    object Panel2: TPanel
      Left = 391
      Top = 0
      Width = 311
      Height = 99
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 391
      Top = 2
      Width = 293
      Height = 94
      BiDiMode = bdLeftToRight
      Caption = ' Agenda Local '
      ParentBiDiMode = False
      TabOrder = 2
      object Label20: TLabel
        Left = 27
        Top = 28
        Width = 109
        Height = 13
        Align = alCustom
        Caption = 'Data I&n'#237'cio Acad'#234'mico:'
      end
      object Label21: TLabel
        Left = 152
        Top = 28
        Width = 100
        Height = 13
        Caption = 'Data &Fim Acad'#234'mico:'
      end
      object dtpInicio: TDatePickerEx
        Left = 27
        Top = 44
        Width = 96
        Height = 22
        MaxLength = 10
        TabOrder = 0
        Text = '04122017'
      end
      object dtpFim: TDatePickerEx
        Left = 152
        Top = 44
        Width = 96
        Height = 22
        MaxLength = 10
        TabOrder = 1
        Text = '04122017'
      end
    end
  end
  object pnAnosemestre: TPanel
    Left = 0
    Top = 377
    Width = 702
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 14
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
      Left = 105
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
