object frmQuadroHorario: TfrmQuadroHorario
  Left = 100
  Top = 241
  Width = 808
  Height = 608
  Caption = 'Quadro de Horário'
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object dkTop: TDock97
    Left = 0
    Top = 25
    Width = 800
    Height = 208
    object twTurmas: TToolWindow97
      Left = 0
      Top = 0
      Caption = 'Turmas'
      CloseButton = False
      ClientAreaHeight = 204
      ClientAreaWidth = 787
      DockPos = 0
      FullSize = True
      MinClientHeight = 100
      MinClientWidth = 100
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 787
        Height = 204
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 372
          Top = 1
          Width = 6
          Height = 202
          Cursor = crHSplit
          Align = alRight
          Color = clNavy
          ParentColor = False
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 371
          Height = 202
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object panel76: TPanel
            Left = 2
            Top = 2
            Width = 367
            Height = 23
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'TURMAS DISPONÍVEIS'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dgTurmas: TwwDBGrid
            Left = 2
            Top = 25
            Width = 367
            Height = 146
            Selected.Strings = (
              'Codigo'#9'10'#9'Código'
              'Descricao'#9'40'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsTurmas
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dgTurmasDblClick
          end
          object Panel5: TPanel
            Left = 2
            Top = 171
            Width = 367
            Height = 29
            Align = alBottom
            TabOrder = 2
            object SpeedButton1: TSpeedButton
              Left = 100
              Top = 2
              Width = 167
              Height = 25
              Hint = 'Sair'
              Caption = 'F9 Professores/Turmas'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
                000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
                FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
                00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
                00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
                FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
                0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
                05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
                55557F7777777555555500000005555555557777777555555555}
              NumGlyphs = 2
            end
          end
        end
        object Panel4: TPanel
          Left = 378
          Top = 1
          Width = 408
          Height = 202
          Align = alRight
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Caption = 'Panel4'
          TabOrder = 1
          object paNomeProfessor: TPanel
            Left = 2
            Top = 2
            Width = 404
            Height = 23
            Align = alTop
            BevelOuter = bvLowered
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  object dkBottom: TDock97
    Left = 0
    Top = 543
    Width = 800
    Height = 31
    Position = dpBottom
    object tbGeral: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Menu'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object btnSalvar: TSpeedButton
        Left = 454
        Top = 1
        Width = 78
        Height = 25
        Hint = 'Salvar'
        Caption = 'F4 &Salvar'
        Enabled = False
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          2222220000000000000220330000008803022033000000880302203300000088
          0302203300000000030220333333333333022033000000003302203088888888
          0302203088888888030220308888888803022030888888880302203088888888
          0002203088888888080220000000000000022222222222222222}
        OnClick = btnSalvarClick
      end
      object btnGerarQuadro: TSpeedButton
        Left = 348
        Top = 1
        Width = 106
        Height = 25
        Hint = 'Sair'
        Caption = 'F3 &Gera Quadro'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        NumGlyphs = 2
        OnClick = btnGerarQuadroClick
      end
      object btnSair: TSpeedButton
        Left = 692
        Top = 1
        Width = 73
        Height = 25
        Hint = 'Sair'
        Caption = 'F12 Sai&r'
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777744447777777777444444447777777444777744
          4777777447777774477777447777777744777744777777774477774477777777
          4477774477777777447777744777747447777774477774444777777777777444
          7777777777777444477777777777777777777777777777777777}
        OnClick = btnSairClick
      end
      object btnAtualizar: TSpeedButton
        Left = 266
        Top = 1
        Width = 82
        Height = 25
        Hint = 'Sair'
        Caption = 'F2 &Atualiza'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337FF3333333333330003333333333333777F333333333333080333
          3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
          33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
          B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
          BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
          B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
          3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
          333333333337F33333333333333B333333333333333733333333}
        NumGlyphs = 2
        OnClick = btnAtualizarClick
      end
      object btnExcluir: TSpeedButton
        Left = 532
        Top = 1
        Width = 79
        Height = 25
        Hint = 'Excluir'
        Caption = 'F5 E&xcluir'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btnExcluirClick
      end
      object btnImprimir: TSpeedButton
        Left = 611
        Top = 1
        Width = 81
        Height = 25
        Hint = 'Imprimir'
        Caption = 'F7 Im&primir'
        Enabled = False
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          22222200000000000222208888888880802200000000000008020888888BBB88
          0002088888877788080200000000000008800888888888808080200000000008
          0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
          022222220FFFFFFFF02222222000000000222222222222222222}
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 266
        Height = 27
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 7
          Width = 71
          Height = 13
          Caption = 'Ano/Semestre:'
        end
        object Label2: TLabel
          Left = 126
          Top = 7
          Width = 31
          Height = 13
          Caption = 'Turno:'
        end
        object meAnoSemestre: TMaskEdit
          Left = 75
          Top = 3
          Width = 44
          Height = 21
          EditMask = '9999/9;0;_'
          MaxLength = 6
          TabOrder = 0
          Text = 'meAnoSemestre'
        end
        object cboTurno: TComboBox
          Left = 158
          Top = 3
          Width = 104
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'MATUTINO'
            'VESPERTINO'
            'NOTURNO')
        end
      end
    end
  end
  object panel7: TPanel
    Left = 0
    Top = 233
    Width = 800
    Height = 310
    Align = alClient
    TabOrder = 2
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 25
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'QUADRO DE HORÁRIO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object quProfessores: TwwQuery
    Connection = db
    
    SQL.Strings = (
      
        'Select P.Codigo,P.Apelido,T.Codigo as Turma,TP.Disciplina,D.Sigl' +
        'a,D.Descricao,TP.NumeroAulas'
      'From Professores P,TurmasProfessores TP,Turmas T,Disciplinas D'
      'Where T.AnoSemestre =:AnoSemestre'
      'And   T.Turno  =:Turno'
      'And   TP.Turma = T.Codigo'
      'And   P.Codigo = TP.Professor'
      'And   D.Codigo = TP.Disciplina'
      'Order By P.Apelido,T.Codigo,TP.Disciplina')
    ValidateWithMask = True
    Left = 224
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turno'
        ParamType = ptUnknown
      end>
  end
  object dsProfessores: TwwDataSource
    DataSet = quProfessores
    Left = 224
    Top = 85
  end
  object quTurmas: TwwQuery
    Connection = db
    
    SQL.Strings = (
      'Select Distinct T.AnoSemestre,T.Codigo,T.Descricao'
      'From Turmas T,TurmasProfessores TP'
      'Where  T.AnoSemestre =:AnoSemestre'
      'and    T.Turno =:Turno '
      'and    T.Codigo = TP.Turma '
      'Order By Codigo')
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 251
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turno'
        ParamType = ptUnknown
      end>
    object quTurmasCodigo: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'Codigo'
      Origin = 'Turmas.Codigo'
      Size = 15
    end
    object quTurmasDescricao: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'Descricao'
      Origin = 'Turmas.Descricao'
      Size = 40
    end
    object quTurmasAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Semestre'
      FieldName = 'AnoSemestre'
      Origin = 'Turmas.AnoSemestre'
      Visible = False
      DisplayFormat = '9999/9'
      EditFormat = '9999/9'
    end
  end
  object dsTurmas: TwwDataSource
    AutoEdit = False
    DataSet = quTurmas
    Left = 252
    Top = 85
  end
  object quQH: TwwQuery
    Connection = db
    
    SQL.Strings = (
      'Select * From QuadroHorario'
      'Where AnoSemestre =:AnoSemestre'
      '    And Turno =:Turno ')
    ValidateWithMask = True
    Left = 279
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turno'
        ParamType = ptUnknown
      end>
  end
  object dsQuadroHorario: TwwDataSource
    AutoEdit = False
    DataSet = quQH
    Left = 276
    Top = 85
  end
end

