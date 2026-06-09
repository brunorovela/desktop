object frmMatricular: TfrmMatricular
  Left = 219
  Top = 192
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Matricular...'
  ClientHeight = 420
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 425
    Top = 41
    Width = 71
    Height = 14
    Caption = 'Data Matr'#237'cula:'
  end
  object Label2: TLabel
    Left = 16
    Top = 41
    Width = 55
    Height = 14
    Caption = 'Ano Letivo:'
  end
  object Bevel1: TBevel
    Left = 7
    Top = 119
    Width = 626
    Height = 5
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 212
    Top = 41
    Width = 32
    Height = 14
    Caption = 'Curso:'
  end
  object btnCurso: TSpeedButton
    Left = 385
    Top = 35
    Width = 34
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    OnClick = btnCursoClick
  end
  object Bevel2: TBevel
    Left = 7
    Top = 64
    Width = 626
    Height = 5
    Style = bsRaised
  end
  object Label6: TLabel
    Left = 7
    Top = 75
    Width = 90
    Height = 14
    Caption = 'Forma de Ingresso'
    FocusControl = DBLookupComboBox1
  end
  object Label7: TLabel
    Left = 221
    Top = 75
    Width = 100
    Height = 14
    Caption = 'Institui'#231#227'o de Origem'
    FocusControl = DBLookupComboBox2
  end
  object Page: TPageControl
    Left = 8
    Top = 134
    Width = 626
    Height = 244
    ActivePage = tabImprimir
    TabOrder = 5
    OnChange = PageChange
    OnChanging = PageChanging
    object tabMatricula: TTabSheet
      Caption = 'Turma de Matr'#237'cula'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 3
        Top = 3
        Width = 616
        Height = 214
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Panel4'
        TabOrder = 0
        object grd: TDBGrid
          Left = 7
          Top = 3
          Width = 601
          Height = 182
          BorderStyle = bsNone
          DataSource = dtcTurmas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = grdDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_VALOR'
              Title.Caption = 'Situa'#231#227'o'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VAGAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtd_matriculas'
              Title.Caption = 'Qtd. Matriculas'
              Width = 86
              Visible = True
            end>
        end
        object CheckBox1: TCheckBox
          Left = 7
          Top = 191
          Width = 218
          Height = 18
          TabStop = False
          Caption = 'Exibir Somente a etapa seguinte'
          TabOrder = 1
          OnClick = CheckBox1Click
        end
      end
    end
    object tabDisc: TTabSheet
      Caption = 'Disciplinas'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel6: TPanel
        Left = 0
        Top = 5
        Width = 616
        Height = 215
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label8: TLabel
          Left = 7
          Top = 7
          Width = 115
          Height = 14
          Caption = 'Disciplinas Matriculadas'
        end
        object SpeedButton1: TSpeedButton
          Left = 13
          Top = 187
          Width = 176
          Height = 21
          Caption = 'Mostrar outras Disciplinas'
          OnClick = SpeedButton1Click
        end
        object btnRemoverDisciplinas: TSpeedButton
          Left = 196
          Top = 187
          Width = 176
          Height = 21
          Caption = 'Remover Disciplinas Selecionadas'
          OnClick = btnRemoverDisciplinasClick
        end
        object lbCreditos: TLabel
          Left = 392
          Top = 190
          Width = 101
          Height = 14
          Caption = 'N'#250'mero de Cr'#233'ditos: '
        end
        object lstDisciplinas: TCheckListBox
          Left = 13
          Top = 28
          Width = 588
          Height = 157
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          Items.Strings = (
            'TURMA - 0000000000 - NOME DA DISCIPLINA APARECE AQUI')
          ParentFont = False
          TabOrder = 0
          OnDragDrop = lstDisciplinasDragDrop
          OnDragOver = lstDisciplinasDragOver
        end
      end
    end
    object tabPlano: TTabSheet
      Caption = 'Plano de Pagamento'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 202
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Panel2'
        TabOrder = 0
        object grd2: TDBGrid
          Left = 7
          Top = 7
          Width = 602
          Height = 186
          BorderStyle = bsNone
          DataSource = dtcPlanos
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = grd2DblClick
          OnKeyPress = grd2KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Turma'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Parcelas'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Matricula'
              Title.Caption = 'Parcela Zero.'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorCobrado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Apartir'
              Title.Caption = 'A Partir de'
              Width = 70
              Visible = True
            end>
        end
        object pnSemPlano: TPanel
          Left = 21
          Top = 28
          Width = 568
          Height = 155
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object Label9: TLabel
            Left = 23
            Top = 7
            Width = 50
            Height = 15
            Caption = 'Aten'#231#227'o:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 40
            Top = 35
            Width = 387
            Height = 15
            Caption = 
              'N'#227'o existe plano de pagamento cadastrado para a turma selecionad' +
              'a.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 40
            Top = 58
            Width = 458
            Height = 30
            Caption = 
              'Para criar um plano de pagamento, utilize a op'#231#227'o Cadastro - Pla' +
              'no de Pagamento no m'#243'dulo Financeiro.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label12: TLabel
            Left = 40
            Top = 98
            Width = 267
            Height = 15
            Caption = 'Se voc'#234' continuar, nenhuma parcela ser'#225' criada.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
    object tabVencimento: TTabSheet
      Caption = 'Vencimentos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 609
        Height = 202
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 152
          Top = 41
          Width = 33
          Height = 14
          Caption = 'dia '#250'til.'
        end
        object Label5: TLabel
          Left = 29
          Top = 92
          Width = 70
          Height = 14
          Caption = 'A partir do dia:'
        end
        object sbMarcarNovas: TSpeedButton
          Left = 212
          Top = 7
          Width = 20
          Height = 23
          Hint = 'Selecionar Parcelas'
          Flat = True
          Glyph.Data = {
            82020000424D8202000000000000420000002800000011000000100000000100
            10000300000040020000C30E0000C30E00000000000000000000007C0000E003
            00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
            734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
            FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
            FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
            734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
            734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
            FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
            FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
            734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
            734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
            0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
            FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000}
          OnClick = sbMarcarNovasClick
        end
        object sbDesmarcarNovas: TSpeedButton
          Left = 212
          Top = 30
          Width = 20
          Height = 21
          Hint = 'Desmarcar parcelas selecionadas'
          Flat = True
          Glyph.Data = {
            76030000424D7603000000000000360000002800000011000000100000000100
            18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
            999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
            99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
            999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
            FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
            999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = sbDesmarcarNovasClick
        end
        object sbAlterar: TSpeedButton
          Left = 212
          Top = 51
          Width = 20
          Height = 24
          Hint = 'Ajustar Valores'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          OnClick = sbAlterarClick
        end
        object btnExecutarPlano: TSpeedButton
          Left = 11
          Top = 167
          Width = 215
          Height = 28
          Caption = 'F6 Finalizar Matr'#237'cula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = btnExecutarPlanoClick
        end
        object Label16: TLabel
          Left = 29
          Top = 115
          Width = 83
          Height = 14
          Caption = 'Qtd. de Parcelas:'
        end
        object SpeedButton2: TSpeedButton
          Left = 197
          Top = 112
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
          OnClick = SpeedButton2Click
        end
        object btnPlanosDesconto: TButton
          Left = 11
          Top = 139
          Width = 215
          Height = 24
          Caption = 'F5 Planos de Desconto...'
          TabOrder = 6
          OnClick = btnPlanosDescontoClick
        end
        object radUtil: TRadioButton
          Left = 7
          Top = 41
          Width = 100
          Height = 17
          Caption = '&Calcular para o :'
          TabOrder = 0
          OnClick = radUtilClick
        end
        object txtDiaUtil: TEdit
          Left = 112
          Top = 37
          Width = 34
          Height = 22
          TabOrder = 1
          Text = '6'
          OnEnter = txtDiaUtilEnter
          OnExit = txtDiaUtilExit
          OnKeyPress = txtDiaUtilKeyPress
        end
        object radSempre: TRadioButton
          Left = 7
          Top = 64
          Width = 154
          Height = 18
          Caption = 'Calcular &sempre para o dia:'
          TabOrder = 2
          OnClick = radSempreClick
        end
        object txtSempreDia: TEdit
          Left = 162
          Top = 63
          Width = 34
          Height = 22
          TabOrder = 3
          Text = '15'
          OnChange = txtSempreDiaChange
          OnEnter = txtSempreDiaEnter
          OnExit = txtDiaUtilExit
          OnKeyPress = txtSempreDiaKeyPress
        end
        object txtApartir: TMaskEdit
          Left = 119
          Top = 90
          Width = 77
          Height = 22
          TabOrder = 4
          OnExit = txtDiaUtilExit
          OnKeyPress = txtApartirKeyPress
        end
        object lst: TCheckListBox
          Left = 231
          Top = 7
          Width = 370
          Height = 186
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 7
        end
        object radPlano: TRadioButton
          Left = 7
          Top = 19
          Width = 195
          Height = 16
          Caption = 'Manter conforme o Plano de Pgto.'
          Checked = True
          TabOrder = 8
          TabStop = True
          OnClick = radPlanoClick
        end
        object pnAltera: TPanel
          Left = 232
          Top = 7
          Width = 369
          Height = 51
          BevelOuter = bvLowered
          TabOrder = 9
          Visible = False
          object Label18: TLabel
            Left = 7
            Top = 6
            Width = 53
            Height = 14
            Caption = 'Valor Extra'
          end
          object sbConfirmaAltera: TSpeedButton
            Left = 315
            Top = 21
            Width = 26
            Height = 22
            Hint = 'Confirmar altera'#231#227'o de desconto/juros'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbConfirmaAlteraClick
          end
          object sbCancelaAltera: TSpeedButton
            Left = 341
            Top = 21
            Width = 24
            Height = 22
            Hint = 'Cancelar altera'#231#227'o de desconto/juros'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
              993337777F777F3377F3393999707333993337F77737333337FF993399933333
              399377F3777FF333377F993339903333399377F33737FF33377F993333707333
              399377F333377FF3377F993333101933399377F333777FFF377F993333000993
              399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
              99333773FF777F777733339993707339933333773FF7FFF77333333999999999
              3333333777333777333333333999993333333333377777333333}
            NumGlyphs = 2
            OnClick = sbCancelaAlteraClick
          end
          object Label13: TLabel
            Left = 110
            Top = 6
            Width = 51
            Height = 14
            Caption = 'Desc. Fixo'
          end
          object Label15: TLabel
            Left = 216
            Top = 6
            Width = 63
            Height = 14
            Caption = 'Desc. em Dia'
          end
          object edValorExtra: TEdit
            Left = 6
            Top = 21
            Width = 94
            Height = 22
            TabOrder = 0
            OnKeyPress = edValorExtraKeyPress
          end
          object edDescontoEmDia: TEdit
            Left = 213
            Top = 21
            Width = 95
            Height = 22
            TabOrder = 2
            OnKeyPress = edValorExtraKeyPress
          end
          object edDescontoFixo: TEdit
            Left = 109
            Top = 21
            Width = 94
            Height = 22
            TabOrder = 1
            OnKeyPress = edValorExtraKeyPress
          end
        end
        object txtParcelas: TEdit
          Left = 119
          Top = 112
          Width = 77
          Height = 22
          TabOrder = 5
        end
      end
    end
    object tabImprimir: TTabSheet
      Caption = 'Imprimir'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 617
        Height = 202
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object lbMsg: TLabel
          Left = 7
          Top = 7
          Width = 118
          Height = 28
          Alignment = taCenter
          AutoSize = False
          Caption = 'Finalizando Matr'#237'cula...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label14: TLabel
          Left = 20
          Top = 43
          Width = 59
          Height = 14
          Caption = 'Impress'#245'es:'
        end
        object sbDesmarcar: TSpeedButton
          Left = 124
          Top = 31
          Width = 23
          Height = 22
          Hint = 'Desmarcar parcelas selecionadas'
          Flat = True
          Glyph.Data = {
            76030000424D7603000000000000360000002800000011000000100000000100
            18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
            999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
            99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
            999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
            FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
            999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = sbDesmarcarClick
        end
        object sbMarcar: TSpeedButton
          Left = 124
          Top = 8
          Width = 23
          Height = 23
          Hint = 'Selecionar Parcelas'
          Flat = True
          Glyph.Data = {
            82020000424D8202000000000000420000002800000011000000100000000100
            10000300000040020000C30E0000C30E00000000000000000000007C0000E003
            00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
            734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
            FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
            FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
            734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
            734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
            FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
            FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
            734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
            734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
            0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
            FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000}
          OnClick = sbMarcarClick
        end
        object btnRecibo: TButton
          Left = 16
          Top = 61
          Width = 113
          Height = 24
          Caption = 'F7 Recibo...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnReciboClick
        end
        object btnRequerimento: TButton
          Left = 16
          Top = 87
          Width = 113
          Height = 25
          Caption = 'F8 Requerimento...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnRequerimentoClick
        end
        object btnBloqueto: TButton
          Left = 16
          Top = 114
          Width = 113
          Height = 25
          Caption = 'F9 Bloqueto...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnBloquetoClick
        end
        object btnContrato: TButton
          Left = 16
          Top = 141
          Width = 113
          Height = 25
          Caption = 'F10 Contrato...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnContratoClick
        end
        object btnConfiguracoes: TButton
          Left = 16
          Top = 168
          Width = 113
          Height = 25
          Caption = 'F11 Configurar'
          TabOrder = 4
          OnClick = btnConfiguracoesClick
        end
        object chkList: TCheckListBox
          Left = 145
          Top = 7
          Width = 464
          Height = 186
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'MATRICULAR...'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object txtAnoSemestre: TDBEdit
    Left = 79
    Top = 36
    Width = 106
    Height = 22
    DataField = 'AnoSemestre'
    DataSource = dtcMatriculas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    OnKeyPress = txtAnoKeyPress
  end
  object btnF2: TButton
    Left = 352
    Top = 384
    Width = 89
    Height = 24
    Caption = '<< F2 Voltar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnF2Click
  end
  object btnF3: TButton
    Left = 448
    Top = 384
    Width = 90
    Height = 24
    Caption = 'F3 Avan'#231'ar >>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnF3Click
  end
  object btnFechar: TButton
    Left = 544
    Top = 384
    Width = 89
    Height = 24
    Caption = 'F12 Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnFecharClick
  end
  object EditDataMatricula: TDBEdit
    Left = 502
    Top = 36
    Width = 107
    Height = 22
    DataField = 'DataEmissao'
    DataSource = dtcMatriculas
    TabOrder = 2
    OnKeyPress = EditDataMatriculaKeyPress
  end
  object txtCurso: TDBEdit
    Left = 247
    Top = 36
    Width = 138
    Height = 22
    DataField = 'Curso'
    DataSource = dtcMatriculas
    TabOrder = 1
    OnKeyPress = txtCursoKeyPress
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 7
    Top = 91
    Width = 210
    Height = 22
    DataField = 'descIngressos'
    DataSource = dtcMatriculas
    TabOrder = 3
    OnKeyPress = DBLookupComboBox1KeyPress
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 221
    Top = 91
    Width = 412
    Height = 22
    DataField = 'descInstituicao'
    DataSource = dtcMatriculas
    TabOrder = 4
    OnKeyPress = DBLookupComboBox2KeyPress
  end
  object dtcTurmas: TDataSource
    DataSet = tblTurmas
    Left = 560
    Top = 324
  end
  object dtcMatriculas: TDataSource
    DataSet = tblMatriculas
    OnDataChange = dtcMatriculasDataChange
    Left = 528
    Top = 324
  end
  object dtcPlanos: TDataSource
    DataSet = tblPlanos
    Left = 496
    Top = 324
  end
  object tblTurmas: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblTurmasCalcFields
    SQL.Strings = (
      'SELECT'
      '   T.ANOSEMESTRE,'
      '   T.CODIGO,'
      '   T.CURSO,'
      '   T.SERIE,'
      '   T.TURNO,'
      '   T.DESCRICAO,'
      '   T.CONTRATO,'
      '   T.VAGAS,'
      '   T.SN_BLOQUEAR_VAGAS,'
      '   T.HORAINICIO,'
      '   T.HORAFIM,'
      '   T.DATAINICIO,'
      '   T.DATAFIM,'
      '   T.IDADECONCLUSAO,'
      '   T.DATACONCLUSAO,'
      '   T.CD_CENTRO,'
      '   T.CD_SITUACAO,'
      '   T.SN_USAR_PLANO,'
      '   T.CD_COLIGADA,'
      '   C.CD_DEPTO DEPTO,'
      '   S.DS_VALOR'
      'FROM'
      '   TURMAS T'
      '      JOIN CURSOS_COLIGADAS C ON'
      '         (T.CURSO = C.CD_CURSO) AND'
      '         (T.CD_COLIGADA = C.CD_COLIGADA)       '
      '      JOIN SITUACOES S ON'
      '         (T.CD_SITUACAO = S.CD_SITUACAO)'
      'WHERE'
      '   T.ANOSEMESTRE = :ANOSEMESTRE AND'
      '   T.CURSO = :CURSO AND'
      '   S.CD_MODULO = 1148'
      'ORDER BY'
      '   T.CODIGO')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 560
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object tblTurmasqtd_matriculas: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qtd_matriculas'
      Calculated = True
    end
    object tblTurmasANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Required = True
    end
    object tblTurmasCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 50
    end
    object tblTurmasCURSO: TStringField
      FieldName = 'CURSO'
      Required = True
      Size = 15
    end
    object tblTurmasSERIE: TSmallintField
      FieldName = 'SERIE'
      Required = True
    end
    object tblTurmasTURNO: TStringField
      FieldName = 'TURNO'
      Size = 1
    end
    object tblTurmasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object tblTurmasCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 50
    end
    object tblTurmasVAGAS: TSmallintField
      FieldName = 'VAGAS'
    end
    object tblTurmasSN_BLOQUEAR_VAGAS: TSmallintField
      FieldName = 'SN_BLOQUEAR_VAGAS'
    end
    object tblTurmasHORAINICIO: TDateTimeField
      FieldName = 'HORAINICIO'
    end
    object tblTurmasHORAFIM: TDateTimeField
      FieldName = 'HORAFIM'
    end
    object tblTurmasDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object tblTurmasDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
    object tblTurmasIDADECONCLUSAO: TSmallintField
      FieldName = 'IDADECONCLUSAO'
    end
    object tblTurmasDATACONCLUSAO: TDateTimeField
      FieldName = 'DATACONCLUSAO'
    end
    object tblTurmasCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object tblTurmasCD_SITUACAO: TSmallintField
      FieldName = 'CD_SITUACAO'
    end
    object tblTurmasSN_USAR_PLANO: TSmallintField
      FieldName = 'SN_USAR_PLANO'
      Required = True
    end
    object tblTurmasDEPTO: TSmallintField
      FieldName = 'DEPTO'
      Required = True
    end
    object tblTurmasDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 255
    end
    object tblTurmasCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
  object tblMatriculas: TUMZQuery
    Connection = DM.db
    AfterInsert = tblMatriculasAfterInsert
    BeforePost = tblMatriculasBeforePost
    OnNewRecord = tblMatriculasNewRecord
    SQL.Strings = (
      'select * from Matriculas')
    Params = <>
    Left = 528
    Top = 292
    object tblMatriculasCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Matriculas.CodigoAluno'
    end
    object tblMatriculasTurma: TStringField
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'Matriculas.Turma'
      Size = 50
    end
    object tblMatriculasAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'Matriculas.CodigoAluno'
      DisplayFormat = '0000/0'
      EditFormat = '00000;0;_'
    end
    object tblMatriculasDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Matriculas.DataEmissao'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object tblMatriculasUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Matriculas.Usuario'
      Size = 30
    end
    object tblMatriculasPlanoPagamento: TIntegerField
      FieldName = 'PlanoPagamento'
      Origin = 'Matriculas.PlanoPagamento'
    end
    object tblMatriculasSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Matriculas.Situacao'
    end
    object tblMatriculasDataSaida: TDateTimeField
      FieldName = 'DataSaida'
      Origin = 'Matriculas.DataSaida'
    end
    object tblMatriculasPlanoDesconto: TIntegerField
      FieldName = 'PlanoDesconto'
      Origin = 'Matriculas.PlanoDesconto'
    end
    object tblMatriculasCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'Matriculas.AnoSemestre'
      Size = 15
    end
    object tblMatriculasTurmaDependencia: TStringField
      FieldName = 'TurmaDependencia'
      Origin = 'Matriculas.Turma'
      Size = 50
    end
    object tblMatriculasdescInstituicao: TStringField
      DisplayLabel = 'Institui'#231#227'o de Origem'
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao_formatado'
      KeyFields = 'cd_instituicao_origem'
      Size = 100
      Lookup = True
    end
    object tblMatriculasdescIngressos: TStringField
      DisplayLabel = 'Forma de Ingresso'
      FieldKind = fkLookup
      FieldName = 'descIngressos'
      LookupDataSet = DM.tblIngressos
      LookupKeyFields = 'cd_ingresso'
      LookupResultField = 'ds_ingresso'
      KeyFields = 'cd_ingresso'
      Size = 50
      Lookup = True
    end
    object tblMatriculasImpresso: TStringField
      FieldName = 'Impresso'
      Origin = 'WMESTRE12.matriculas.Impresso'
      Size = 1
    end
    object tblMatriculasDiploma: TStringField
      FieldName = 'Diploma'
      Origin = 'WMESTRE12.matriculas.Diploma'
      Size = 1
    end
    object tblMatriculasnr_aluno: TSmallintField
      FieldName = 'nr_aluno'
      Origin = 'WMESTRE12.matriculas.nr_aluno'
    end
    object tblMatriculascd_matricula: TStringField
      FieldName = 'cd_matricula'
      Origin = 'WMESTRE12.matriculas.cd_matricula'
    end
    object tblMatriculascd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
    end
    object tblMatriculascd_instituicao_origem: TIntegerField
      FieldName = 'cd_instituicao_origem'
    end
    object tblMatriculascd_matricula_curso: TLargeintField
      FieldName = 'cd_matricula_curso'
    end
  end
  object tblPlanos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from PlanosPagamento order by Curso, Turma, Descricao')
    Params = <>
    Left = 496
    Top = 292
    object tblPlanosCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Origin = 'PlanosPagamento.Codigo'
    end
    object tblPlanosTurma: TStringField
      Alignment = taCenter
      FieldName = 'Turma'
      Origin = 'PlanosPagamento.Turma'
      Size = 50
    end
    object tblPlanosParcelas: TSmallintField
      DisplayLabel = 'Parc.'
      FieldName = 'Parcelas'
      Origin = 'PlanosPagamento.Parcelas'
    end
    object tblPlanosValorCobrado: TFloatField
      DisplayLabel = 'Vl. Cobrado'
      DisplayWidth = 8
      FieldName = 'ValorCobrado'
      Origin = 'PlanosPagamento.ValorCobrado'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosValorContrato: TFloatField
      FieldName = 'ValorContrato'
      Origin = 'PlanosPagamento.ValorContrato'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosTaxaApostila: TFloatField
      DisplayLabel = 'Tx. Apostila'
      DisplayWidth = 8
      FieldName = 'TaxaApostila'
      Origin = 'PlanosPagamento.TaxaApostila'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosDesconto: TFloatField
      FieldName = 'Desconto'
      Origin = 'PlanosPagamento.Desconto'
      DisplayFormat = '###,###,##0.00'
    end
    object tblPlanosMatricula: TFloatField
      FieldName = 'Matricula'
      Origin = 'PlanosPagamento.Matricula'
    end
    object tblPlanosApartir: TDateTimeField
      FieldName = 'Apartir'
      Origin = 'PlanosPagamento.Apartir'
    end
    object tblPlanosAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'PlanosPagamento.Codigo'
    end
    object tblPlanosDescricao: TStringField
      DisplayLabel = 'Plano'
      FieldName = 'Descricao'
      Origin = 'PlanosPagamento.AnoSemestre'
      Size = 100
    end
    object tblPlanosnr_dias_parczero: TSmallintField
      FieldName = 'nr_dias_parczero'
      Origin = 'WMESTRE12.planospagamento.nr_dias_parczero'
    end
    object tblPlanossn_dias_uteis: TStringField
      FieldName = 'sn_dias_uteis'
      Origin = 'WMESTRE12.planospagamento.sn_dias_uteis'
      FixedChar = True
      Size = 1
    end
    object tblPlanossn_creditos: TStringField
      FieldName = 'sn_creditos'
      Origin = 'WMESTRE12.planospagamento.sn_creditos'
      FixedChar = True
      Size = 1
    end
    object tblPlanosnr_creditos_base: TFloatField
      FieldName = 'nr_creditos_base'
      Origin = 'WMESTRE12.planospagamento.nr_creditos_base'
    end
  end
  object tblMatriculasRead: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from Matriculas')
    Params = <>
    Left = 432
    Top = 292
    object tblMatriculasReadCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Matriculas.CodigoAluno'
    end
    object tblMatriculasReadTurma: TStringField
      FieldName = 'Turma'
      Origin = 'Matriculas.Turma'
      Size = 50
    end
    object tblMatriculasReadAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Matriculas.CodigoAluno'
    end
    object tblMatriculasReadDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Matriculas.DataEmissao'
    end
    object tblMatriculasReadUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Matriculas.Usuario'
      Size = 30
    end
    object tblMatriculasReadPlanoPagamento: TIntegerField
      FieldName = 'PlanoPagamento'
      Origin = 'Matriculas.PlanoPagamento'
    end
    object tblMatriculasReadSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Matriculas.Situacao'
    end
    object tblMatriculasReadDataSaida: TDateTimeField
      FieldName = 'DataSaida'
      Origin = 'Matriculas.DataSaida'
    end
    object tblMatriculasReadPlanoDesconto: TIntegerField
      FieldName = 'PlanoDesconto'
      Origin = 'Matriculas.PlanoDesconto'
    end
    object tblMatriculasReadImpresso: TStringField
      FieldName = 'Impresso'
      Origin = 'WMESTRE12.matriculas.Impresso'
      Size = 1
    end
    object tblMatriculasReadDiploma: TStringField
      FieldName = 'Diploma'
      Origin = 'WMESTRE12.matriculas.Diploma'
      Size = 1
    end
  end
  object tblItensPagamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'fpi.CD_PLANO_ITEM AS codigoplano,'
      #9'fp.CD_COLIGADA AS cd_coligada,'
      #9'fpi.NR_MES AS mes,'
      #9'fpi.NR_PARCELA AS parcela,'
      #9'fpi.VL_BRUTO AS valorbruto,'
      #9'fpi.VL_DESCONTO AS valordesconto,'
      #9'fpi.VL_EXTRA AS valorextra,'
      #9'fpi.VL_DESCONTO_EXTRA AS descontoextra,'
      #9'fpi.VL_TOTAL AS valortotal,'
      #9'fpi.NR_DIA AS nr_dia,'
      #9'fpi.NR_ANO AS nr_ano,'
      #9'fpi.NR_CREDITOS_MINIMOS AS nr_creditos_minimos,'
      #9'CASE WHEN fpi.SN_CREDITO_PARCELA = 1 THEN'
      #9#9#39'S'#39
      #9'ELSE'
      #9#9#39'N'#39
      #9'END AS sn_credito_parcela,'
      #9'fpi.CD_TIPO_PARCELA AS cd_tipo_parcela,'
      #9'fpi.CD_PLANO_ITEM AS cd_item_plano,'
      #9'ftt.cd_conta, ftt.ds_tipo_titulo'
      'FROM'
      #9'fin_planos_itens fpi'
      #9'INNER JOIN fin_planos fp ON (fp.CD_PLANO = fpi.CD_PLANO)'
      
        #9'LEFT JOIN fin_tipos_titulo ftt ON (fpi.CD_TIPO_PARCELA = ftt.cd' +
        '_tipo_titulo AND ftt.cd_coligada = fp.CD_COLIGADA)'
      'WHERE'
      #9'fpi.CD_PLANO = :Codigo'
      'ORDER BY'
      #9'fpi.NR_PARCELA')
    Params = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dtcPlanos
    Left = 464
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblItensPagamentoCodigoPlano: TIntegerField
      FieldName = 'CodigoPlano'
      Origin = 'ItensPlanosPagamento.CodigoPlano'
    end
    object tblItensPagamentoMes: TSmallintField
      FieldName = 'Mes'
      Origin = 'ItensPlanosPagamento.Mes'
    end
    object tblItensPagamentoParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'ItensPlanosPagamento.Parcela'
    end
    object tblItensPagamentoValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'ItensPlanosPagamento.ValorBruto'
    end
    object tblItensPagamentoValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'ItensPlanosPagamento.ValorDesconto'
    end
    object tblItensPagamentoValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'ItensPlanosPagamento.ValorExtra'
    end
    object tblItensPagamentoDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'ItensPlanosPagamento.DescontoExtra'
    end
    object tblItensPagamentoValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'ItensPlanosPagamento.ValorTotal'
    end
    object tblItensPagamentonr_creditos_minimos: TFloatField
      FieldName = 'nr_creditos_minimos'
      Origin = 'WMESTRE12.itensplanospagamento.nr_creditos_minimos'
    end
    object tblItensPagamentosn_credito_parcela: TStringField
      FieldName = 'sn_credito_parcela'
      Origin = 'WMESTRE12.itensplanospagamento.sn_credito_parcela'
      FixedChar = True
      Size = 1
    end
    object tblItensPagamentonr_dia: TSmallintField
      FieldName = 'nr_dia'
      Origin = 'WMESTRE12.itensplanospagamento.nr_dia'
    end
    object tblItensPagamentonr_ano: TSmallintField
      FieldName = 'nr_ano'
      Origin = 'WMESTRE12.itensplanospagamento.nr_ano'
    end
    object tblItensPagamentocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.itensplanospagamento.cd_coligada'
    end
    object tblItensPagamentocd_tipo_parcela: TSmallintField
      FieldName = 'cd_tipo_parcela'
      Origin = 'WMESTRE12.itensplanospagamento.cd_tipo_parcela'
    end
    object tblItensPagamentods_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Origin = 'WMESTRE12.fin_tipos_titulo.ds_tipo_titulo'
      Size = 255
    end
    object tblItensPagamentocd_conta: TLargeintField
      FieldName = 'cd_conta'
    end
    object tblItensPagamentocd_item_plano: TIntegerField
      FieldName = 'cd_item_plano'
      Required = True
    end
  end
  object tblMens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from mensalidades'
      'where '
      'codigoaluno = :codigo '
      'and parcela = :parcela'
      'and datavencimento = :data'
      'and turma = :turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end>
    Left = 591
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end>
  end
  object qMat: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 332
    Top = 293
  end
  object qCaixaDepto: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 364
    Top = 293
  end
  object tblPlanoDesc: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 396
    Top = 293
  end
  object qryInsert: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'insert into Mensalidades '
      
        '(CodigoAluno, Parcela, DataVencimento, dt_competencia, Turma, Da' +
        'taEmissao, NossoNumero, '
      
        'ValorBruto, ValorDesconto, DescontoExtra, ValorExtra, ValorTotal' +
        ', ValorJuros, '
      'ValorPago, DataPagamento, Situacao, Usuario, Bloqueto, '
      
        'AnoSemestre, DataBaseCorrecao, IndiceCorrecao, Curso, Depto, Tip' +
        'oParcela, sn_credito_parcela, '
      
        'nr_creditos, cd_mensalidade_origem, cd_tipo_titulo, cd_plano_con' +
        'ta, cd_centro_custo, ds_historico, cd_coligada, cd_caixa, '
      'cd_item_plano, vl_credito)'
      'VALUES'
      
        '(:CodigoAluno, :Parcela, :DataVencimento, :dt_competencia, :Turm' +
        'a, :DataEmissao, '
      
        ':NossoNumero, :ValorBruto, :ValorDesconto, :DescontoExtra, :Valo' +
        'rExtra, '
      ':ValorTotal, :ValorJuros, :ValorPago, :DataPagamento, :Situacao,'
      ':Usuario, :Bloqueto, :AnoSemestre, '
      
        ':DataBaseCorrecao, :IndiceCorrecao, :Curso, :Depto, :Tipo, :sn_c' +
        'redito_parcela, '
      
        ':nr_creditos, :cd_mensalidade_origem, :cd_tipo_titulo, :cd_plano' +
        '_conta, :cd_centro_custo, :ds_historico,  :cd_coligada, :cd_caix' +
        'a, '
      ':cd_item_plano, :vl_credito)')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_plano_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro_custo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_item_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_credito'
        ParamType = ptUnknown
      end>
    Left = 600
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataVencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_competencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataEmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NossoNumero'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorBruto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorDesconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DescontoExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorExtra'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorJuros'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ValorPago'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataPagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'Situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bloqueto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataBaseCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IndiceCorrecao'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Depto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sn_credito_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_creditos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade_origem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_tipo_titulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_plano_conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_centro_custo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_historico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_item_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vl_credito'
        ParamType = ptUnknown
      end>
  end
  object qryMatricularGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FICHAINDIVIDUAL'
      
        '   (ANOSEMESTRE, CODIGOALUNO, TURMA, TURMAMATRICULA, CODIGOGRADE' +
        ', DISCIPLINA,'
      '    SITUACAO, CURSO, SERIE, GRAU)'
      'SELECT DISTINCT'
      '   T.ANOSEMESTRE,'
      '   :CODIGOALUNO,'
      '   T.CODIGO,'
      '   :TURMAMATRICULA,'
      
        '   CONCAT(g.NR_ANO_INICIAL,g.CD_CURSO,lpad(gd.NR_SERIE,2,0),t.tu' +
        'rno,lpad(gd.CD_DISCIPLINA,5,0)) CODIGO,'
      '   GD.CD_DISCIPLINA,'
      '   :SITUACAO,'
      '   T.CURSO,'
      '   T.SERIE,'
      '   T.GRAU'
      'FROM'
      '   TURMAS T'
      
        '   INNER JOIN CURSOS C ON (T.CURSO = C.CODIGO and T.ANOSEMESTRE ' +
        '= C.ANOSEMESTRE)'
      
        '   INNER JOIN GRADES G ON (G.CD_GRADE = T.CD_GRADE and T.CURSO =' +
        ' G.CD_CURSO)'
      
        '   INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE' +
        ' AND GD.CD_CURSO = T.CURSO AND GD.NR_SERIE = T.serie)'
      'WHERE '
      '   T.ANOSEMESTRE = :ANOSEMESTRE AND'
      '   T.CODIGO = :TURMA AND'
      '   GD.CD_DISCIPLINA = :DISCIPLINA')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turmaMatricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turmaMatricula'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end>
  end
  object qryTurmasLotacaoVagas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  fi.anosemestre nr_anosemestre,'
      '  fi.turma cd_turma,'
      '  fi.disciplina cd_disciplina,'
      '  fi.curso cd_curso,'
      '  t.sn_bloquear_vagas,'
      '  t.vagas nr_vagas,'
      '  d.descricao ds_disciplina,'
      '  COUNT(*) NR_MATRICULADOS'
      'FROM'
      '   fichaindividual fi'
      '      JOIN situacao s ON'
      '         (fi.situacao = s.cd_situacao)'
      '      JOIN turmas t ON'
      '         (fi.turma = t.codigo) AND'
      '         (fi.anosemestre = t.anosemestre)'
      '      JOIN disciplinas d ON'
      '         (fi.disciplina = d.codigo) AND'
      '         (fi.curso = d.curso)'
      'WHERE'
      '  s.cd_situacao_pai NOT IN (3, 4, 6, 7, 8)'
      'GROUP BY'
      ' fi.turma,'
      ' fi.disciplina,'
      ' fi.anosemestre,'
      ' fi.curso,'
      ' t.sn_bloquear_vagas,'
      ' t.vagas,'
      ' d.descricao')
    Params = <>
    SQLList.Strings = (
      
        'oracle=SELECT'#13#10'  fi.anosemestre nr_anosemestre,'#13#10'  fi.turma cd_t' +
        'urma,'#13#10'  fi.disciplina cd_disciplina,'#13#10'  fi.curso cd_curso,'#13#10'  t' +
        '.sn_bloquear_vagas,'#13#10'  t.vagas nr_vagas,'#13#10'  d.descricao ds_disci' +
        'plina,'#13#10'  CAST(COUNT(*) AS NUMBER(19)) NR_MATRICULADOS'#13#10'FROM'#13#10'  ' +
        ' fichaindividual fi'#13#10'      JOIN situacao s ON'#13#10'         (fi.situ' +
        'acao = s.cd_situacao)'#13#10'      JOIN turmas t ON'#13#10'         (fi.turm' +
        'a = t.codigo) AND'#13#10'         (fi.anosemestre = t.anosemestre)'#13#10'  ' +
        '    JOIN disciplinas d ON'#13#10'         (fi.disciplina = d.codigo) A' +
        'ND'#13#10'         (fi.curso = d.curso)'#13#10'WHERE'#13#10'  s.cd_situacao_pai NO' +
        'T IN (3, 4, 6, 7, 8)'#13#10'GROUP BY'#13#10' fi.turma,'#13#10' fi.disciplina,'#13#10' fi' +
        '.anosemestre,'#13#10' fi.curso,'#13#10' t.sn_bloquear_vagas,'#13#10' t.vagas,'#13#10' d.' +
        'descricao')
    Left = 336
    Top = 256
    object qryTurmasLotacaoVagasNR_ANOSEMESTRE: TIntegerField
      FieldName = 'NR_ANOSEMESTRE'
    end
    object qryTurmasLotacaoVagasCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Size = 50
    end
    object qryTurmasLotacaoVagasCD_DISCIPLINA: TIntegerField
      FieldName = 'CD_DISCIPLINA'
    end
    object qryTurmasLotacaoVagasCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryTurmasLotacaoVagasSN_BLOQUEAR_VAGAS: TSmallintField
      FieldName = 'SN_BLOQUEAR_VAGAS'
    end
    object qryTurmasLotacaoVagasNR_VAGAS: TIntegerField
      FieldName = 'NR_VAGAS'
    end
    object qryTurmasLotacaoVagasDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      Size = 150
    end
    object qryTurmasLotacaoVagasNR_MATRICULADOS: TLargeintField
      FieldName = 'NR_MATRICULADOS'
      ReadOnly = True
    end
  end
  object qryBloqDataVencto: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  nr_dia_vencimento'
      'FROM'
      '  pessoas'
      'WHERE'
      '  cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qryBloqDataVenctonr_dia_vencimento: TLargeintField
      FieldName = 'nr_dia_vencimento'
    end
  end
  object qrySelectHorarios: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   DISTINCT CONCAT(DIA_SEMANA, CONCAT('#39'_'#39', CD_HORARIO)) HORARIO'
      'FROM'
      '   TURMAS_HORARIOS'
      'WHERE'
      '   ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   TURMA = :CD_TURMA AND'
      '   DISCIPLINA = :CD_DISCIPLINA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   DISTINCT CONCAT(DIA_SEMANA, '#39'_'#39', CD_HORARIO) ' +
        'HORARIO'#13#10'FROM'#13#10'   TURMAS_HORARIOS'#13#10'WHERE'#13#10'   ANOSEMESTRE = :NR_A' +
        'NOSEMESTRE AND'#13#10'   TURMA = :CD_TURMA AND'#13#10'   DISCIPLINA = :CD_DI' +
        'SCIPLINA'
      
        'oracle=SELECT'#13#10'   DISTINCT DIA_SEMANA || '#39'_'#39' || CD_HORARIO HORAR' +
        'IO'#13#10'FROM'#13#10'   TURMAS_HORARIOS'#13#10'WHERE'#13#10'   ANOSEMESTRE = :NR_ANOSEM' +
        'ESTRE AND'#13#10'   TURMA = :CD_TURMA AND'#13#10'   DISCIPLINA = :CD_DISCIPL' +
        'INA')
    Left = 264
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    object qrySelectHorariosHORARIO: TStringField
      FieldName = 'HORARIO'
      ReadOnly = True
      Size = 81
    end
  end
  object qrySelectSerie: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   SERIE'
      'FROM'
      '   TURMAS'
      'WHERE'
      '   CODIGO = :CD_TURMA AND'
      '   ANOSEMESTRE = :NR_ANOSEMESTRE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end>
    object qrySelectSerieSERIE: TIntegerField
      FieldName = 'SERIE'
    end
  end
  object qrySelectPreReq: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   PRE.CD_CURSO,'
      '   PRE.CD_GRADE,'
      '   PRE.CD_DISCIPLI,'
      '   PRE.CD_DISCIPLI_PRE,'
      '   D.DESCRICAO'
      'FROM'
      '   DISCIPLINAS_PREREQ PRE'
      '      JOIN DISCIPLINAS D ON'
      '         (PRE.CD_DISCIPLI = D.CODIGO) AND'
      '         (D.curso = PRE.CD_CURSO),'
      '   TURMAS T'
      'WHERE'
      '   PRE.CD_CURSO = :CD_CURSO AND'
      '   PRE.CD_DISCIPLI = :CD_DISCIPLINA AND'
      '   T.CODIGO = :CD_TURMA AND'
      '   T.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   PRE.CD_GRADE = :CD_GRADE'
      'ORDER BY'
      '   PRE.CD_DISCIPLI')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'mysql-5=SELECT'#13#10'   PRE.*,'#13#10'   D.DESCRICAO'#13#10'FROM'#13#10'   DISCIPLINAS_' +
        'PREREQ PRE'#13#10'      INNER JOIN DISCIPLINAS D ON'#13#10'         (PRE.CD_' +
        'DISCIPLI = D.CODIGO) AND'#13#10'         (D.curso = PRE.CD_CURSO),'#13#10'  ' +
        ' TURMAS T'#13#10'WHERE'#13#10'   PRE.CD_CURSO = :CD_CURSO AND'#13#10'   PRE.CD_DIS' +
        'CIPLI = :CD_DISCIPLINA AND'#13#10'   T.CODIGO = :CD_TURMA AND'#13#10'   T.AN' +
        'OSEMESTRE = :NR_ANOSEMESTRE AND'#13#10'   PRE.CD_GRADE = IF(T.CURSO = ' +
        'PRE.CD_CURSO, :CD_GRADE, T.CD_GRADE)'#13#10'ORDER BY'#13#10'   PRE.CD_DISCIP' +
        'LI'
      
        'oracle=SELECT'#13#10'   PRE.*,'#13#10'   D.DESCRICAO'#13#10'FROM'#13#10'   DISCIPLINAS_P' +
        'REREQ PRE'#13#10'      INNER JOIN DISCIPLINAS D ON'#13#10'         (PRE.CD_D' +
        'ISCIPLI = D.CODIGO) AND'#13#10'         (D.curso = PRE.CD_CURSO),'#13#10'   ' +
        'TURMAS T'#13#10'WHERE'#13#10'   PRE.CD_CURSO = :CD_CURSO AND'#13#10'   PRE.CD_DISC' +
        'IPLI = :CD_DISCIPLINA AND'#13#10'   T.CODIGO = :CD_TURMA AND'#13#10'   T.ANO' +
        'SEMESTRE = :NR_ANOSEMESTRE AND'#13#10'   PRE.CD_GRADE = DECODE(T.CURSO' +
        ', PRE.CD_CURSO, :CD_GRADE, T.CD_GRADE)'#13#10'ORDER BY'#13#10'   PRE.CD_DISC' +
        'IPLI')
    Left = 264
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRADE'
        ParamType = ptUnknown
      end>
    object qrySelectPreReqCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qrySelectPreReqCD_GRADE: TLargeintField
      FieldName = 'CD_GRADE'
    end
    object qrySelectPreReqCD_DISCIPLI: TIntegerField
      FieldName = 'CD_DISCIPLI'
    end
    object qrySelectPreReqCD_DISCIPLI_PRE: TIntegerField
      FieldName = 'CD_DISCIPLI_PRE'
    end
    object qrySelectPreReqDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
  end
  object qrySelectNaoCursadas: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   D.CODIGO,'
      '   D.DESCRICAO,'
      '   FI.CODIGOALUNO'
      'FROM'
      '   DISCIPLINAS D'
      '      LEFT JOIN FICHAINDIVIDUAL FI ON'
      '         (FI.DISCIPLINA = D.CODIGO) AND'
      '         (D.CURSO = FI.CURSO) AND'
      '         (FI.CODIGOALUNO = :CD_PESSOA)'
      '         LEFT JOIN SITUACAO S ON'
      '            (FI.SITUACAO = S.CD_SITUACAO)'
      'WHERE'
      '   S.CD_SITUACAO_PAI IN (0, 12) AND'
      '   D.CURSO = :CD_CURSO AND'
      '   D.CODIGO = :CD_DISCIPLINA AND'
      '   FI.CODIGOALUNO IS NULL')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    Left = 264
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    object qrySelectNaoCursadasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qrySelectNaoCursadasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object qrySelectNaoCursadasCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
  end
  object qrySelectCreditos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   G.NUMEROAULAS'
      'FROM'
      '   GRADECURRICULAR G,'
      '   TURMAS T,'
      '   CURSOS C,'
      '   DISCIPLINAS D'
      'WHERE'
      '   G.SERIE = T.SERIE AND'
      '   G.ANOSEMESTRE = T.ANOSEMESTRE AND'
      '   G.CURSO = T.CURSO AND'
      '   G.TURNO = T.TURNO AND'
      '   T.CURSO = C.CODIGO AND'
      '   T.ANOSEMESTRE = C.ANOSEMESTRE AND'
      '   G.DISCIPLINA = D.CODIGO AND'
      '   G.CURSO = D.CURSO AND'
      '   G.CD_GRADE = T.CD_GRADE AND'
      '   T.CODIGO = :CD_TURMA AND'
      '   T.ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   G.DISCIPLINA = :CD_DISCIPLINA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TURMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DISCIPLINA'
        ParamType = ptUnknown
      end>
    object qrySelectCreditosNUMEROAULAS: TFloatField
      FieldName = 'NUMEROAULAS'
    end
  end
end
