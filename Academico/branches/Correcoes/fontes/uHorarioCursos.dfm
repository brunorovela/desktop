object frmHorarioCursos: TfrmHorarioCursos
  Left = 160
  Top = 257
  Width = 603
  Height = 280
  Caption = 'Horário / Cursos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Dock971: TDock97
    Left = 0
    Top = 198
    Width = 595
    Height = 48
    Position = dpBottom
    object tbNavigator: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Navegador'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object sbSair: TSpeedButton
        Left = 181
        Top = 0
        Width = 53
        Height = 44
        Caption = 'Sai&r'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        Layout = blGlyphTop
        NumGlyphs = 2
        OnClick = sbSairClick
      end
      object sbImprime: TSpeedButton
        Left = 80
        Top = 0
        Width = 48
        Height = 44
        Caption = '&Imprime'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object sbPesquisa: TSpeedButton
        Left = 128
        Top = 0
        Width = 53
        Height = 44
        Caption = 'P&esquisa'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object Navigator: TDBNavigator
        Left = 0
        Top = 0
        Width = 80
        Height = 44
        DataSource = dsHorarioCursos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeiro'
          'Anterior'
          'Próximo'
          'Último')
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 198
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 587
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = ' Horário / Cursos'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object dgHorarioCursos: TDBGrid
      Left = 4
      Top = 105
      Width = 587
      Height = 89
      Align = alClient
      DataSource = dsHorarioCursos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object paDados: TPanel
      Left = 4
      Top = 29
      Width = 587
      Height = 76
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 57
        Width = 51
        Height = 13
        Caption = '&Descrição:'
        FocusControl = dbeDescricao
      end
      object Label3: TLabel
        Left = 18
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Có&digo:'
        FocusControl = dbeCodigo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 25
        Top = 12
        Width = 37
        Height = 13
        Caption = '&Curso:'
        FocusControl = dblCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeDescricao: TDBEdit
        Left = 64
        Top = 50
        Width = 251
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Descricao'
        DataSource = dsHorarioCursos
        TabOrder = 1
      end
      object dbeCodigo: TDBEdit
        Left = 64
        Top = 27
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Codigo'
        DataSource = dsHorarioCursos
        Enabled = False
        TabOrder = 0
      end
      object dblCurso: TDBLookupComboBox
        Left = 64
        Top = 4
        Width = 252
        Height = 21
        DataField = 'Curso'
        DataSource = dsHorarioCursos
        Enabled = False
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dsCursos
        TabOrder = 2
      end
    end
  end
  object quHorarioCursos: TUMZQuery
    AfterPost = quHorarioCursosAfterPost
    BeforeDelete = quHorarioCursosBeforeDelete
    OnPostError = quHorarioCursosPostError
    Connection = db
    
    Constrained = True
    
    SQL.Strings = (
      'Select * From HorarioCursos'
      'Order By Curso,Codigo')
    Left = 548
    Top = 12
    object quHorarioCursosCurso: TStringField
      FieldName = 'Curso'
      Origin = 'HorarioCursos.Curso'
      Size = 15
    end
    object quHorarioCursosCodigo: TStringField
      DisplayLabel = 'Código'
      FieldName = 'Codigo'
      Origin = 'HorarioCursos.Codigo'
      Size = 15
    end
    object quHorarioCursosDescricao: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Descricao'
      Origin = 'HorarioCursos.Descricao'
      Size = 50
    end
  end
  object dsHorarioCursos: TDataSource
    DataSet = quHorarioCursos
    Left = 520
    Top = 12
  end
  object dsCursos: TDataSource
    DataSet = quCursos
    Left = 520
    Top = 40
  end
  object quCursos: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'Select * From Cursos'
      'Order By Descricao'
      ''
      '')
    Left = 549
    Top = 40
    object quCursosCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Cursos.Codigo'
      Size = 15
    end
    object quCursosDescricao: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Descricao'
      Origin = 'Cursos.Descricao'
      Size = 50
    end
  end
end

