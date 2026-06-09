object frm_Sel_Pessoa: Tfrm_Sel_Pessoa
  Left = 278
  Top = 89
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Selecionar Pessoa'
  ClientHeight = 486
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 448
    Width = 568
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnFechar: TSpeedButton
      Left = 464
      Top = 5
      Width = 87
      Height = 25
      Hint = 'Sair'
      Caption = 'F12 Sai&r'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777744447777777777444444447777777444777744
        4777777447777774477777447777777744777744777777774477774477777777
        4477774477777777447777744777747447777774477774444777777777777444
        7777777777777444477777777777777777777777777777777777}
      OnClick = btnFecharClick
    end
  end
  object Pagina: TPageControl
    Left = 0
    Top = 0
    Width = 568
    Height = 448
    ActivePage = tsAluno
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 1
    object tsPessoa: TTabSheet
      Caption = 'Pessoa'
      ParentShowHint = False
      ShowHint = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Bevel1: TBevel
        Left = 5
        Top = 96
        Width = 548
        Height = 5
        Style = bsRaised
      end
      object Label2: TLabel
        Left = 10
        Top = 14
        Width = 36
        Height = 14
        Caption = 'C'#243'digo:'
      end
      object Label1: TLabel
        Left = 16
        Top = 40
        Width = 30
        Height = 14
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 24
        Top = 66
        Width = 22
        Height = 14
        Caption = 'CPF:'
      end
      object grdPessoa: TDBGrid
        Left = 6
        Top = 111
        Width = 547
        Height = 303
        BorderStyle = bsNone
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = grdPessoaDblClick
        OnKeyPress = grdPessoaKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cd_pessoa'
            Title.Caption = 'Cod. Pessoa'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Title.Caption = 'Nome'
            Width = 298
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_cpf'
            Title.Caption = 'CPF'
            Width = 142
            Visible = True
          end>
      end
      object txtPes_Codigo: TEdit
        Left = 51
        Top = 10
        Width = 72
        Height = 22
        Hint = 'Digite o c'#243'digo sem h'#237'fen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = txtPes_CodigoEnter
        OnKeyPress = txtPes_CodigoKeyPress
      end
      object txtPes_Nome: TEdit
        Left = 51
        Top = 36
        Width = 347
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 2
        OnEnter = txtPes_NomeEnter
        OnKeyPress = txtPes_NomeKeyPress
      end
      object txtPes_CPF: TEdit
        Left = 51
        Top = 62
        Width = 182
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 3
        OnEnter = txtPes_CPFEnter
        OnKeyPress = txtPes_CPFKeyPress
      end
    end
    object tsAluno: TTabSheet
      Caption = 'Acad'#234'mico'
      ImageIndex = 1
      object Label4: TLabel
        Left = 10
        Top = 14
        Width = 36
        Height = 14
        Caption = 'C'#243'digo:'
      end
      object Label5: TLabel
        Left = 16
        Top = 40
        Width = 30
        Height = 14
        Caption = 'Nome:'
      end
      object Label6: TLabel
        Left = 13
        Top = 66
        Width = 33
        Height = 14
        Caption = 'Turma:'
        OnClick = btnFecharClick
      end
      object Bevel2: TBevel
        Left = 5
        Top = 96
        Width = 548
        Height = 5
        Style = bsRaised
      end
      object txtAca_Codigo: TEdit
        Left = 51
        Top = 10
        Width = 72
        Height = 22
        Hint = 'Digite o c'#243'digo sem h'#237'fen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = txtAca_CodigoEnter
        OnKeyPress = txtAca_CodigoKeyPress
      end
      object txtAca_Nome: TEdit
        Left = 51
        Top = 36
        Width = 347
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 1
        OnEnter = txtAca_NomeEnter
        OnKeyPress = txtAca_NomeKeyPress
      end
      object txtAca_Turma: TEdit
        Left = 51
        Top = 62
        Width = 182
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 2
        OnEnter = txtAca_TurmaEnter
        OnKeyPress = txtAca_TurmaKeyPress
      end
      object grdAcademico: TDBGrid
        Left = 6
        Top = 111
        Width = 547
        Height = 303
        BorderStyle = bsNone
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = grdPessoaDblClick
        OnKeyPress = grdPessoaKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cd_pessoa'
            Title.Caption = 'Cod. Pessoa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Title.Caption = 'Nome'
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Turma'
            Title.Caption = 'Turma de Matr'#237'cula'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AnoSemestre'
            Title.Caption = 'Ano/Sem.'
            Width = 60
            Visible = True
          end>
      end
    end
    object tsProfessor: TTabSheet
      Caption = 'Professor'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label7: TLabel
        Left = 10
        Top = 14
        Width = 36
        Height = 14
        Caption = 'C'#243'digo:'
      end
      object Label8: TLabel
        Left = 16
        Top = 40
        Width = 30
        Height = 14
        Caption = 'Nome:'
      end
      object Label9: TLabel
        Left = 13
        Top = 66
        Width = 33
        Height = 14
        Caption = 'Turma:'
      end
      object Bevel3: TBevel
        Left = 5
        Top = 96
        Width = 548
        Height = 5
        Style = bsRaised
      end
      object txtProf_Codigo: TEdit
        Left = 51
        Top = 10
        Width = 72
        Height = 22
        Hint = 'Digite o c'#243'digo sem h'#237'fen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = txtProf_CodigoEnter
        OnKeyPress = txtProf_CodigoKeyPress
      end
      object txtProf_Nome: TEdit
        Left = 51
        Top = 36
        Width = 347
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 1
        OnEnter = txtProf_NomeEnter
        OnKeyPress = txtProf_NomeKeyPress
      end
      object txtProf_Turma: TEdit
        Left = 51
        Top = 62
        Width = 182
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 2
        OnEnter = txtProf_TurmaEnter
        OnKeyPress = txtProf_TurmaKeyPress
      end
      object grdProfessor: TDBGrid
        Left = 6
        Top = 111
        Width = 547
        Height = 303
        BorderStyle = bsNone
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = grdPessoaDblClick
        OnKeyPress = grdPessoaKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cd_pessoa'
            Title.Caption = 'Cod. Pessoa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Title.Caption = 'Nome'
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Turma'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AnoSemestre'
            Title.Caption = 'Ano/Sem.'
            Visible = True
          end>
      end
    end
    object tsAvancada: TTabSheet
      Caption = 'Pesquisa Avan'#231'ada'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lbTurma: TLabel
        Left = 344
        Top = 44
        Width = 33
        Height = 14
        Caption = 'Turma:'
        Enabled = False
      end
      object lbCurso: TLabel
        Left = 344
        Top = 68
        Width = 32
        Height = 14
        Caption = 'Curso:'
        Enabled = False
      end
      object Label10: TLabel
        Left = 10
        Top = 14
        Width = 36
        Height = 14
        Caption = 'C'#243'digo:'
      end
      object Label11: TLabel
        Left = 16
        Top = 40
        Width = 30
        Height = 14
        Caption = 'Nome:'
      end
      object Label12: TLabel
        Left = 24
        Top = 66
        Width = 22
        Height = 14
        Caption = 'CPF:'
      end
      object Bevel4: TBevel
        Left = 5
        Top = 136
        Width = 548
        Height = 5
        Style = bsRaised
      end
      object txtTurma: TEdit
        Left = 384
        Top = 36
        Width = 161
        Height = 22
        Enabled = False
        TabOrder = 5
        OnKeyPress = txtCodigoKeyPress
      end
      object txtCurso: TEdit
        Left = 384
        Top = 63
        Width = 161
        Height = 22
        Enabled = False
        TabOrder = 6
        OnKeyPress = txtCursoKeyPress
      end
      object cbAnoSem: TCheckBox
        Left = 366
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Ano/Semestre:'
        Enabled = False
        TabOrder = 3
        OnClick = cbAnoSemClick
        OnKeyPress = txtCodigoKeyPress
      end
      object txtAnoSemestreCursos: TMaskEdit
        Left = 473
        Top = 10
        Width = 56
        Height = 22
        Enabled = False
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 4
        Text = '19931'
        OnKeyPress = txtCodigoKeyPress
      end
      object UpDownCursos: TUpDown
        Left = 527
        Top = 10
        Width = 17
        Height = 22
        Enabled = False
        Min = -100
        TabOrder = 9
        OnClick = UpDownCursosClick
      end
      object txtCodigo: TEdit
        Left = 51
        Top = 10
        Width = 72
        Height = 22
        Hint = 'Digite o c'#243'digo sem h'#237'fen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = txtCodigoKeyPress
      end
      object txtNome: TEdit
        Left = 51
        Top = 36
        Width = 278
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = txtCodigoKeyPress
      end
      object txtCPF: TEdit
        Left = 51
        Top = 62
        Width = 182
        Height = 22
        CharCase = ecUpperCase
        TabOrder = 2
        OnKeyPress = txtCodigoKeyPress
      end
      object rgTipo: TRadioGroup
        Left = 16
        Top = 91
        Width = 529
        Height = 38
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'Cadastro Pessoas'
          'Somente Alunos'
          'Somente Professores')
        TabOrder = 7
        OnClick = rgTipoClick
      end
      object grdAvancada: TDBGrid
        Left = 6
        Top = 152
        Width = 547
        Height = 262
        BorderStyle = bsNone
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 8
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = grdPessoaDblClick
        OnKeyPress = grdPessoaKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cd_pessoa'
            Title.Caption = 'Cod. Pessoa'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Title.Caption = 'Nome'
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_cpf'
            Title.Caption = 'CPF'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Turma'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Ano/Sem.'
            Width = 50
            Visible = True
          end>
      end
    end
  end
  object dtcAlunos: TDataSource
    DataSet = qryPessoa
    Left = 400
    Top = 264
  end
  object qryPessoa: TUMZQuery
    CachedUpdates = True
    Connection = DM.db
    Left = 368
    Top = 264
  end
end

