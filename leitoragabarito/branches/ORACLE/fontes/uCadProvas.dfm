object frmCadProvas: TfrmCadProvas
  Left = 108
  Top = 84
  Caption = 'T'#205'TULO'
  ClientHeight = 532
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 25
    Width = 11
    Height = 473
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel7: TBevel
    Left = 0
    Top = 498
    Width = 814
    Height = 9
    Align = alBottom
    Shape = bsSpacer
    ExplicitWidth = 792
  end
  object Label3: TLabel
    Left = 336
    Top = 80
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Provas'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnGrade: TPanel
    Left = 11
    Top = 25
    Width = 310
    Height = 473
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel5: TBevel
      Left = 0
      Top = 0
      Width = 310
      Height = 5
      Align = alTop
      Shape = bsSpacer
    end
    object Panel2: TPanel
      Left = 0
      Top = 5
      Width = 310
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PROVAS CADASTRADAS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnAnoSemestre: TPanel
      Left = 0
      Top = 30
      Width = 310
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 0
      Top = 35
      Width = 310
      Height = 41
      Align = alTop
      TabOrder = 2
      object Label7: TLabel
        Left = 8
        Top = 14
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ano/Semestre:'
      end
      object txtAnoSemestre: TMaskEdit
        Tag = 1
        Left = 104
        Top = 10
        Width = 185
        Height = 22
        TabStop = False
        EditMask = '9999/9;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 0
        Text = '19931'
      end
      object UpDown3: TUpDown
        Left = 286
        Top = 9
        Width = 16
        Height = 24
        Min = -100
        TabOrder = 1
        OnClick = UpDown3Click
      end
      object cbAnoSemextre: TCheckBox
        Left = 83
        Top = 12
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbAnoSemextreClick
      end
    end
    object tqu: TDBGrid
      Left = 0
      Top = 76
      Width = 310
      Height = 397
      Align = alClient
      BorderStyle = bsNone
      DataSource = srcProvas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = pmQtd
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnTitleClick = tquTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_prova'
          Title.Caption = 'C'#243'digo'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nr_prova'
          Title.Caption = 'N'#250'mero'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_prova'
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end>
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 507
    Width = 814
    Height = 25
    Align = alBottom
    ButtonWidth = 88
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnInserir: TToolButton
      Left = 8
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TToolButton
      Left = 96
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 184
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnEcluirClick
    end
    object tbCopiarProva: TToolButton
      Left = 272
      Top = 0
      Caption = 'Copiar Prova'
      ImageIndex = 8
      OnClick = tbCopiarProvaClick
    end
    object ToolButton4: TToolButton
      Left = 360
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 368
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 456
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton11: TToolButton
      Left = 544
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnImprimir: TToolButton
      Left = 552
      Top = 0
      AutoSize = True
      Caption = 'F7 Imprimir'
      ImageIndex = 6
      OnClick = btnImprimirClick
    end
    object ToolButton8: TToolButton
      Left = 633
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 641
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 729
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object Panel4: TPanel
    Left = 321
    Top = 25
    Width = 493
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel6: TBevel
      Left = 0
      Top = 169
      Width = 493
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 0
      ExplicitWidth = 471
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 493
      Height = 169
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 6
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbCodigo
      end
      object Label4: TLabel
        Left = 16
        Top = 46
        Width = 51
        Height = 13
        Caption = 'Nro. Prova'
        FocusControl = dbNumero
      end
      object Label2: TLabel
        Left = 80
        Top = 46
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDescricao
      end
      object Label5: TLabel
        Left = 404
        Top = 6
        Width = 74
        Height = 13
        Caption = 'Qtd. Corre'#231#245'es:'
        FocusControl = dbeQtdCorrecoes
      end
      object Label6: TLabel
        Left = 404
        Top = 46
        Width = 69
        Height = 13
        Caption = 'Ano/semestre:'
        FocusControl = dbeAnoSemestre
      end
      object Label8: TLabel
        Left = 264
        Top = 6
        Width = 95
        Height = 13
        Caption = 'Corrigir com a Prova'
        FocusControl = DBEdit1
      end
      object UMAjuda1: TUMAjuda
        Left = 443
        Top = 134
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C0060000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6F4F4F4FAFAFA
          FCFCFCFEFEFEFEFEFEFCFCFCFAFAFAF4F4F4F6F6F6FCFCFCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9EAEADD
          DDDDC7C5C4A8A294968F798D83698D8369968F79A8A294C7C5C4DDDDDDE9EAEA
          F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFBFBFBCDCCC996875F967523C0911AD6A422E5B22DE5B22DD6A422C0911A96
          752396875FCDCCC9FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFC4BBADB1923DD0A321EBC03EE3BB3EDEB73FDCB442DCB4
          42DEB73FE3BB3EEBC03ED0A321B1923DC4BBADFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDACEABA87F06DFBB3DE0BD46D0A639C99732
          C59031C48E31C48E31C59031C99732D0A639E0BD46DFBB3DA87F06DACEABFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DAC19C7600DEC045D8B342C9
          9733C68F31C69031C38C28C0871FC0871FC38C28C69031C68F31C99733D8B342
          DEC0459C7600E1DAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB09341D6B8
          43D8B447CB9836C99234CB9537C38C27B78523BE9441BE9441B78523C38C27CB
          9537C99234CB9836D8B447D6B843B09341FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF
          D6C9A6B4921ADEBF53D1A13CCC9738CC9737D09D41BB800FD5BC86FFFFFFFFFF
          FFD5BC86BB8010D09D41CC9737CC9738D1A13CDEBF53B4921AD6C9A6FFFFFFFF
          FFFFFFFFFFFEFEFEAB903AD7B84DD9B24AD19F3ECE9B3BCE9B3AD1A043C08819
          D0B26EFBF9F4FCFAF5D0B16DC08717D1A043CE9B3ACE9B3BD19F3ED9B24AD7B8
          4DAB903AFEFEFEFFFFFFFFFFFFEFEADDA88516E0C05DDAB04BD3A23FD29E3DD2
          9E3ED3A041CB9630BF912CC7A14AC69F47C19435CD9938D3A040D29E3DD29E3D
          D3A23FDAB04BE0C05DA88516EFEADDFFFFFFFFFFFFE6DFCAB9982FE9CC77DEB8
          5FD9AD52D6A548D4A13FD7A647C78F1FD6B97DFFFFFFFFFFFFF0E8DCBF8C26D1
          9D37D5A343D6A548D9AD52DEB85FE9CC77B9982FE6DFCAFFFFFFFFFFFFE0D7BD
          C5A841EED27DE1BD66DFB762DDB25CDBAD56DCAE56DAAB4EC79636E8D9BEFFFF
          FFFFFFFFE1CDA5C28F27DBAD54DDB25CDFB762E1BD66EED27DC5A841E0D7BDFF
          FFFFFFFFFFDFD6BDCAAF51F2DB87E5C36BE2BC66E1B763DFB35FD3A23FD09C36
          CD982EC69738EEE3CFFFFFFFFFFFFFD9BB84D3A342E3BA69E2BC65E5C36BF2DB
          87CAAF51DFD6BDFFFFFFFFFFFFE5DDC8C9B25EF6E291E9CC74E7C46CE7C270D2
          A440D2B268DFC894CFAB5BCB9627CEA552FEFFFFFFFFFFEADCBCCD9E35E8C473
          E7C46CE9CC74F6E291C9B25EE5DDC8FFFFFFFFFFFFEEE9DBBEA658FAEAA3EED4
          7BEBCD76EDCD7BD3A73CEFE5CBFFFFFFF5EFE4CDA44BD8B974FFFFFFFFFFFFED
          E2C5D2A63CEDCD7BEBCD76EED47BFAEAA3BEA658EEE9DBFFFFFFFFFFFFFEFEFE
          B49D58F9EFBCF4DF8AEFD780F0D480E0BC58E1CB94FEFEFFFEFEFDFDFCFAFDFD
          FCFEFEFDFFFFFFE8D7AFDCB750F0D582EFD77FF4DF8AF9EFBCB49D58FEFEFEFF
          FFFFFFFFFFFFFFFFD6CAA6D1BE83FFF4BCF1DD84F2DB87F0D57BDCBD61F5EFE1
          FFFFFFFFFFFFFFFFFFFFFFFFF9F5EFDABD68EED277F2DB88F1DD83FFF4BCD1BE
          83D6CAA6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB69E5BFAF3D2F9ECADF4E18AF6
          E18EEED579E0C772ECE0BBF8F6ECF9F6EDEEE4C3E0C978E7CD6DF7E28FF3E08A
          F9ECADFAF3D2B69E5BFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D8BFAD93
          3FFFFFE8FBF0B9F6E694F7E591F4DF85E7D072DFC96CDFC96CE6CF72F3DD83F7
          E692F6E694FBF0B9FFFFE9AD933FE1D8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD6CAA6AB903DFAF5DDFFFEDBFBF0B5F9ECA6F9EA9DF9E895F9E8
          95F9EA9DF9ECA6FBF0B6FFFEDBFAF5DDAB903DD6CAA6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DBC3B7A160D4C699FDF9E4FFFFE5
          FFFFDEFFFFDBFFFFDBFFFFDEFFFFE5FDF9E4D6C79AB7A060E4DBC2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD5
          C9A4B19A57BEAA6DCFBF8BD6C798D6C798CFBF8BBEAB6EB19A56D5C8A3FEFEFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFEBDDE7E0CBE0D6BBE0D6BBE7E0CBEFEBDDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Transparent = True
        Caption = 
          '[b]- Utilizar nota compartilhada entre disciplinas:[/b]:'#13#10'      ' +
          ' Quando esta op'#231#227'o estiver habilitada, ao atribuir as notas para' +
          ' os alunos, o sistema ir'#225' aplicar o total de acertos do aluno pa' +
          'ra cada disciplina do mesmo.'#13#10#13#10'[b]- Qtd. Partes:[/b]:'#13#10'       D' +
          'efine em quantas partes os gabaritos ser'#227'o impressos.'#13#10'       Ex' +
          'emplo: 1 prova separada em 2 partes com 40 quest'#245'es (1'#170' com 30 q' +
          'uest'#245'es e 2'#170' com 10 quest'#245'es).'#13#10'                      Ser'#225' impre' +
          'sso 2 folhas de gabarito, sendo o 1'#186' de 1 a 30 e o 2'#186' de 1 a 10.' +
          ' Onde cada um representa uma parte do gabarito do aluno.'
        Titulo = 'AJUDA'
        Position = poBottomCenter
      end
      object Label11: TLabel
        Left = 16
        Top = 120
        Width = 53
        Height = 13
        Caption = 'Qtd. Partes'
      end
      object dbCodigo: TDBEdit
        Left = 16
        Top = 22
        Width = 134
        Height = 21
        DataField = 'cd_prova'
        DataSource = srcProvas
        Enabled = False
        TabOrder = 0
      end
      object dbNumero: TDBEdit
        Left = 16
        Top = 62
        Width = 59
        Height = 21
        DataField = 'nr_prova'
        DataSource = srcProvas
        TabOrder = 1
      end
      object dbDescricao: TDBEdit
        Left = 80
        Top = 62
        Width = 318
        Height = 21
        DataField = 'ds_prova'
        DataSource = srcProvas
        TabOrder = 2
        OnKeyPress = dbDescricaoKeyPress
      end
      object dbeQtdCorrecoes: TDBEdit
        Left = 404
        Top = 22
        Width = 65
        Height = 21
        DataField = 'nr_correcoes'
        DataSource = srcProvas
        TabOrder = 4
      end
      object UpDown2: TUpDown
        Left = 466
        Top = 21
        Width = 16
        Height = 21
        Min = -100
        TabOrder = 7
        OnClick = UpDown2Click
      end
      object dbeAnoSemestre: TDBEdit
        Left = 404
        Top = 62
        Width = 65
        Height = 21
        DataField = 'nr_anosemestre'
        DataSource = srcProvas
        TabOrder = 3
      end
      object UpDown1: TUpDown
        Left = 466
        Top = 61
        Width = 16
        Height = 21
        Min = -100
        TabOrder = 8
        OnClick = UpDown1Click
      end
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 97
        Width = 233
        Height = 17
        Caption = 'Na atribui'#231#227'o, permitir notas maiores que 10.'
        DataField = 'sn_permitir_maior'
        DataSource = srcProvas
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit1: TDBEdit
        Left = 264
        Top = 22
        Width = 134
        Height = 21
        DataField = 'cd_proxima_prova'
        DataSource = srcProvas
        TabOrder = 5
      end
      object rgTipoProva: TRadioGroup
        Left = 147
        Top = 126
        Width = 192
        Height = 34
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Objetiva'
          'Discursiva')
        TabOrder = 9
      end
      object DBCheckBox2: TDBCheckBox
        Left = 257
        Top = 97
        Width = 225
        Height = 17
        Caption = 'Utilizar nota compartilhada entre disciplinas.'
        DataField = 'sn_nota_compartilhada'
        DataSource = srcProvas
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbedQtdPartesGabarito: TDBEdit
        Left = 16
        Top = 139
        Width = 82
        Height = 21
        DataField = 'nr_qtd_partes_gabarito'
        DataSource = srcProvas
        Enabled = False
        TabOrder = 11
      end
      object UpDown4: TUpDown
        Left = 97
        Top = 138
        Width = 16
        Height = 21
        Min = -100
        TabOrder = 12
        OnClick = UpDown4Click
        OnMouseEnter = UpDown4MouseEnter
        OnMouseLeave = UpDown4MouseLeave
      end
      object DBCheckBox3: TDBCheckBox
        Left = 159
        Top = 24
        Width = 69
        Height = 17
        Caption = 'Simulado'
        DataField = 'sn_simulado'
        DataSource = srcProvas
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 174
      Width = 493
      Height = 299
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 1
      object Bevel1: TBevel
        Left = 32
        Top = 6
        Width = 417
        Height = 338
      end
      object pgDisciplinas: TPageControl
        Left = 1
        Top = 1
        Width = 491
        Height = 297
        ActivePage = tsDisciplinas
        Align = alClient
        Images = ilDisciplinas
        Style = tsFlatButtons
        TabOrder = 0
        OnChange = pgDisciplinasChange
        OnChanging = pgDisciplinasChanging
        object tsDisciplinas: TTabSheet
          Caption = 'Disciplinas'
          object grdDisciplinas: TDBGrid
            Left = 0
            Top = 0
            Width = 483
            Height = 240
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = srcDisciplinas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cd_curso'
                Title.Caption = 'C'#243'd. Curso'
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Caption = 'Disciplina'
                Width = 244
                Visible = True
              end>
          end
          object ToolBar2: TToolBar
            Left = 0
            Top = 240
            Width = 483
            Height = 25
            Align = alBottom
            ButtonWidth = 58
            Caption = 'toolPessoa'
            EdgeBorders = [ebTop, ebBottom]
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 1
            object ToolButton5: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 9
              Style = tbsSeparator
            end
            object tbIncluirDisciplina: TToolButton
              Left = 8
              Top = 0
              AutoSize = True
              Caption = 'Incluir'
              ImageIndex = 0
              OnClick = tbIncluirDisciplinaClick
            end
            object tbExcluirDisciplina: TToolButton
              Left = 67
              Top = 0
              AutoSize = True
              Caption = 'Excluir'
              ImageIndex = 2
              OnClick = tbExcluirDisciplinaClick
            end
            object ToolButton10: TToolButton
              Left = 129
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
          end
        end
        object tsGabaritos: TTabSheet
          Caption = 'Gabaritos'
          ImageIndex = 2
          object ToolBar3: TToolBar
            Left = 0
            Top = 240
            Width = 483
            Height = 25
            Align = alBottom
            ButtonWidth = 108
            Caption = 'toolPessoa'
            EdgeBorders = [ebTop, ebBottom]
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton6: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 9
              Style = tbsSeparator
            end
            object tbIncluirGabarito: TToolButton
              Left = 8
              Top = 0
              AutoSize = True
              Caption = 'Incluir'
              ImageIndex = 0
              OnClick = tbIncluirGabaritoClick
            end
            object tbExcluirGabarito: TToolButton
              Left = 67
              Top = 0
              AutoSize = True
              Caption = 'Excluir'
              ImageIndex = 2
              OnClick = tbExcluirGabaritoClick
            end
            object ToolButton12: TToolButton
              Left = 129
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object ToolButton16: TToolButton
              Left = 137
              Top = 0
              AutoSize = True
              Caption = 'Importar Gabarito'
              ImageIndex = 8
              OnClick = ToolButton16Click
            end
          end
          object grdGabaritos: TDBGrid
            Left = 0
            Top = 0
            Width = 483
            Height = 240
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = srcGabaritos
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdGabaritosDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ds_nome_gabarito'
                Title.Caption = 'Gabarito'
                Width = 160
                Visible = True
              end>
          end
        end
        object tsTurmas: TTabSheet
          Caption = 'Turmas'
          ImageIndex = 1
          object grdTurmas: TDBGrid
            Left = 0
            Top = 0
            Width = 483
            Height = 300
            Align = alTop
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = srcTurmas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = grdTurmasDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'nr_anosemestre'
                Title.Caption = 'Ano/Semestre'
                Width = 127
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cd_turma'
                Title.Caption = 'C'#243'd. Turma'
                Width = 278
                Visible = True
              end>
          end
          object ToolBar1: TToolBar
            Left = 0
            Top = 240
            Width = 483
            Height = 25
            Align = alBottom
            ButtonWidth = 88
            Caption = 'toolPessoa'
            EdgeBorders = [ebTop, ebBottom]
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 1
            object ToolButton3: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 9
              Style = tbsSeparator
            end
            object tbIncluirTurma: TToolButton
              Left = 8
              Top = 0
              AutoSize = True
              Caption = 'Incluir Turma'
              ImageIndex = 0
              OnClick = tbIncluirTurmaClick
            end
            object ToolButton7: TToolButton
              Left = 100
              Top = 0
              Caption = 'Incluir Aluno'
              ImageIndex = 0
              OnClick = ToolButton7Click
            end
            object tbExcluirTurma: TToolButton
              Left = 188
              Top = 0
              AutoSize = True
              Caption = 'Excluir'
              ImageIndex = 2
              OnClick = tbExcluirTurmaClick
            end
            object ToolButton9: TToolButton
              Left = 250
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnImprimirTurma: TToolButton
              Left = 258
              Top = 0
              AutoSize = True
              Caption = 'Imprimir'
              ImageIndex = 6
              OnClick = btnImprimirTurmaClick
            end
            object ToolButton13: TToolButton
              Left = 324
              Top = 0
              Width = 8
              Caption = 'ToolButton13'
              ImageIndex = 4
              Style = tbsSeparator
            end
          end
        end
        object tsProvas: TTabSheet
          Caption = 'Provas do Di'#225'rio'
          ImageIndex = 3
          object ToolBar4: TToolBar
            Left = 0
            Top = 240
            Width = 483
            Height = 25
            Align = alBottom
            ButtonWidth = 91
            Caption = 'toolPessoa'
            EdgeBorders = [ebTop, ebBottom]
            Images = ImageList1
            List = True
            ShowCaptions = True
            TabOrder = 0
            object ToolButton17: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 9
              Style = tbsSeparator
            end
            object tbIncluirProva: TToolButton
              Left = 8
              Top = 0
              AutoSize = True
              Caption = 'Incluir'
              ImageIndex = 0
              OnClick = tbIncluirProvaClick
            end
            object tbExcluirProva: TToolButton
              Left = 67
              Top = 0
              AutoSize = True
              Caption = 'Excluir'
              ImageIndex = 2
              OnClick = tbExcluirProvaClick
            end
            object ToolButton20: TToolButton
              Left = 129
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object tbExcluirTodasProvas: TToolButton
              Left = 137
              Top = 0
              Caption = 'Excluir Todas'
              ImageIndex = 2
              OnClick = tbExcluirTodasProvasClick
            end
          end
          object clbProvasDiario: TCheckListBox
            Left = 0
            Top = 46
            Width = 483
            Height = 194
            OnClickCheck = clbProvasDiarioClickCheck
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 1
            OnDragDrop = clbProvasDiarioDragDrop
            OnDragOver = clbProvasDiarioDragOver
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 483
            Height = 46
            Align = alTop
            TabOrder = 2
            object Label9: TLabel
              Left = 1
              Top = 1
              Width = 481
              Height = 13
              Align = alTop
              Caption = 
                ' - Inclua as provas nas quais as notas ser'#227'o atribuidas no di'#225'ri' +
                'o de classe '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 349
            end
            object Label10: TLabel
              Left = 1
              Top = 19
              Width = 481
              Height = 26
              Align = alBottom
              Caption = 
                ' - Selecione (pela box) as provas em que a digita'#231#227'o das quest'#245'e' +
                's descritivas ser'#227'o feitas pelo Di'#225'rio On-Line'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              ExplicitWidth = 479
            end
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 400
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000073AD000073AD000073
      AD000073AD000073AD000073AD000073AD000073AD000073AD000073AD000073
      AD000073AD000073AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636B009C636B009C636B009C63
      6B009C636B009C636B007342420063CEF70063CEF70063CEF70063CEF70063CE
      F7001084A5000073AD0000000000000000009B9C9B009B9C9B00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300636563009B9C9B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C636B00FFF7DE00FFE7C600FFE7
      C600F7DEBD00FFE7C60021392100006B0800006B0800006B08004ACEA50063CE
      F7001084A50063CEE7000073AD000000000063656300CECFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00636563009B9C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C6B6B00FFFFEF00FFEFCE00F7DE
      BD00EFD6B500FFE7C6007342420052CED600006B0800006B0800006B080042BD
      7B001084A50094EFF7000073AD000000000063656300CECFCE00636563006365
      6300636563006365630063656300636563006365630063656300636563006365
      6300CECFCE006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094737300FFFFF700FFEFD600FFEF
      CE00F7DEBD00FFE7C600734242006BD6F7006BD6F700006B080018523100006B
      0800187B8C00A5EFF7000073AD000000000063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE946B00FFFFF700FFF7E700FFEF
      D600FFE7C600FFEFD6007342420073DEF70073DEF70042C68C00006B080039BD
      6300006B080094EFF70052CED6000073AD0063656300CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00009A
      000000FF00006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE946B00FFFFF700FFFFEF00FFF7
      E700FFF7E700FFF7E7007342420094EFF70052CEBD006B946B00006B080039BD
      6300006B08006B9C6B0094948C000073AD009B9C9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006365630063656300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D69C7300FFFFF700FFFFF700FFFF
      EF00EFCEAD00B5A58C0073424200086B6B00006B0800006B080039BD630039BD
      6B0039BD6300006B0800006B08000073AD00000000009B9C9B00F3F3F300CECF
      CE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECFCE00CECF
      CE00CECFCE00CECFCE009B9C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEA57B00FFFFF700FFFFF700FFF7
      DE009C636B009C636B00D69C730084E7F70042C68C00006B080042BD730042C6
      8C0039BD6300006B0800EFD6B5007342420000000000000000009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B009B9C9B00000000009B9C9B009B9C9B009B9C
      9B009B9C9B009B9C9B009B9C9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEA57B00CE946B00CE946B00CE94
      6B009C636B00C6A584008CEFF7008CEFF7008CEFF7005A524200006B080039BD
      6300006B0800EFCEAD00FFE7C600734242000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000073AD00FFFFF7008CEF
      F7008CEFF7008CEFF7000073AD000073AD000073AD00CE946B006B9C6B00006B
      0800F7E7C600FFE7C600FFEFD600734242000000000000000000000000000000
      000000000000000000003EB3FF0046DDFF0000CFFF0046DDFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073AD000073
      AD000073AD000073AD00000000000000000000000000CE946B00FFFFF700FFFF
      EF00FFF7E700FFF7E700FFF7E700734242000000000000000000000000000000
      0000000000003EB3FF003EB3FF003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D69C7300FFFFF700FFFF
      F700FFFFEF00EFCEAD00B5A58C00734242000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA57B00FFFFF700FFFF
      F700FFF7DE009C636B009C636B00D69C73000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEA57B00CE946B00CE94
      6B00CE946B009C636B00D69C7300000000000000000000000000000000000000
      00000000000000000000000000003EB3FF0000CFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003EB3FF00009AFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080038003000000000003000100000000
      00013FF000000000000100000000000000010000000000000000000000000000
      00007FF80000000000008000000000000000C001000000000000FE3F00000000
      8000FC1F00000000C380F80F00000000FF80FE3F00000000FF80FE3F00000000
      FF81FE3F00000000FFFFFE3F00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
      E00FF870F21F83FFCFC7F800E40F000F87E3FA10C203003FA3F3FA108603002F
      31F9F8008C01000F38F980019001000F3C798013802100013E39801380010001
      3F198013C06300019F8B801FF18F000F8FC3801FFE01000FC7E7801FFF07002F
      E00F801FFF8F803FF83FFFFFFFFFE3FFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qyProvas: TUMZQuery
    Connection = DM.db
    AfterEdit = qyProvasAfterEdit
    OnNewRecord = qyProvasNewRecord
    SQL.Strings = (
      'SELECT * FROM leitora_provas'
      'ORDER BY cd_prova')
    Params = <>
    Left = 124
    Top = 113
    object qyProvascd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas.cd_prova'
    end
    object qyProvasnr_prova: TSmallintField
      FieldName = 'nr_prova'
      Origin = 'WMESTRE12.leitora_provas.nr_prova'
    end
    object qyProvasds_prova: TStringField
      FieldName = 'ds_prova'
      Origin = 'WMESTRE12.leitora_provas.ds_prova'
      Size = 100
    end
    object qyProvasnr_correcoes: TIntegerField
      FieldName = 'nr_correcoes'
      Origin = 'WMESTRE12.leitora_provas.nr_correcoes'
    end
    object qyProvasnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.leitora_provas.nr_anosemestre'
      DisplayFormat = '0000/0'
      EditFormat = '0000/0'
    end
    object qyProvassn_permitir_maior: TSmallintField
      FieldName = 'sn_permitir_maior'
    end
    object qyProvascd_proxima_prova: TIntegerField
      DisplayLabel = 'Corrigir com a Prova'
      FieldName = 'cd_proxima_prova'
      Origin = 'WMESTRE12.leitora_provas.cd_proxima_prova'
    end
    object qyProvassn_tipo_prova: TSmallintField
      FieldName = 'sn_tipo_prova'
    end
    object qyProvassn_nota_compartilhada: TIntegerField
      FieldName = 'sn_nota_compartilhada'
    end
    object qyProvasnr_qtd_partes_gabarito: TIntegerField
      FieldName = 'nr_qtd_partes_gabarito'
    end
    object qyProvassn_simulado: TIntegerField
      FieldName = 'sn_simulado'
    end
  end
  object srcProvas: TDataSource
    DataSet = qyProvas
    OnStateChange = srcProvasStateChange
    OnDataChange = srcProvasDataChange
    Left = 156
    Top = 113
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 184
    Top = 112
  end
  object ilDisciplinas: TImageList
    Left = 472
    Top = 400
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      0000000000000000000000000000000000000000000000630000006300000063
      0000006300000063000000630000006300000000000000000000000000000000
      0000000000000000000000000000000000000000000073D6FF006BD6FF0031AD
      E700009CCE00009CCE00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDCFD000FFF8F500907E7D00D2C6C600FFFAFA00FFFEFF00FFFEFF000000
      0000000000000000000000000000000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000063000000630000006B00000873
      0800087308004ABD630000730800006B00000063000063291000632910006329
      1000632910006329100063291000000000000000000073CEF700ADF7FF007BDE
      FF007BDEFF0063D6F70031ADE700009CCE00009CCE00009CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6A7A400EFDAD800EFDAD900FFF0ED00FFF2ED00D5B4B100E9CAC900E8C9
      CA00E0C6C600DABEBE00F3EBEC00000000000000000000000000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006300000063000039BD5A0039BD
      5A0052AD8400CECEC60042BD5A00007308000063000063311000F76B5200EF63
      4A00EF634A00EF5A4200E75A3900632910000000000029ADDE007BD6FF006BDE
      FF0073DEFF0073DEFF0073DEFF0073DEFF007BDEFF007BE7FF007BDEFF007BDE
      FF00009CCE00000000000000000000000000000000000000000000000000FFFE
      FB00FFF5EF00F4DDDB00F1DEDB00F5DDDD00F3DDD800F1DEDB00FFF2EF00FFE9
      E500DBBCB900E3C5C400F3EBEC00000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      000000000000000000000000000000000000006300000063000039BD5A000873
      0800CECEC600CECEC60052BD630039BD5A0000630000E75A3900DEC6C600E7DE
      D600E75A3900EF634A00EF5A4200632910000000000031ADE70039B5E7007BDE
      FF007BDEFF007BDEFF009C3100009C3100009C3100009C3100007BDEFF007BE7
      FF0063D6F7000000000000000000000000000000000000000000000000009B8A
      8700F3E0DD00F5E0DE00F5E0DF00F4DFDD00F4DFDD00F3DEDD00F1DCDA00F2DD
      DB00FFF8F500EAD3D100E9DFDF00000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      000000000000000000000000000000000000000000000063000000630000184A
      4200104A84004AAD9400184A4A000873080031520800EF634A00DECECE00E7DE
      D600FF8C9C00E75A3900EF63420063291000000000005ACEF70029ADDE00BDFF
      FF007BE7FF0084E7FF009C3100000039FF00185AFF008431210084E7FF0084EF
      FF005ACEF700009CCE0000000000000000000000000000000000FFFEFF00FFF7
      F400907B7900FBE8E500F6E1DF00F5E4E100FEEDEA00F5E2DF00F4E1DE00FBEA
      E700FFFBFB00EDD6D400D4C8C800000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000000000000010101000101010001018
      180008429C0008429C0008429C0000000000E75A3900EF634A00FF8C9C00E7DE
      D600E7DED600EF634A0063291000000000000000000063CEF70039B5E700C6FF
      FF008CF7FF0084EFFF009C3100007BBDFF00E7FFFF000039FF0084EFFF0084EF
      FF0063D6F700009CCE0000000000000000000000000000000000A4929100F5E6
      E30095807F00DFE8FF002043AB00ECE6FD00FFF5F100FFFAF600FFF4F000FEF5
      F100EDDBDA00F0D9D700B4A6A700000000000000000000000000BD4A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100010101000101818000842
      9C0008429C0008429C0008429C0008429C00000000000852AD001063CE001063
      CE001063CE00085294000000000000000000000000007BD6FF005ACEF70029AD
      DE00B5F7FF00D6FFFF009C3100009C3100009C31000084312100185AFF007BD6
      FF0073DEFF00A5F7FF0042BDE7000000000000000000F4E8E800FFF8F500FFF7
      F400FFFDFA002B7DED00BDC9ED006375C200C0C8F700CABEBE00917F7E00FFFD
      FE00EFDAD800F1DAD80095838400000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000000000000000000000000000000000001010100010101000104263001052
      BD001052BD001052BD001052BD001052BD000852AD00298CF700298CF700298C
      F700298CF700298CF7000852940000000000000000007BDEFF005ACEF70031AD
      E700009CD600009CD600009CD6007BD6FF00E7FFFF00A5F7FF007BCEFF00297B
      EF0084E7FF00BDFFFF00B5F7FF000000000000000000E0D4D200FFF8F800FFF9
      F600FFF9F600425DAD000060EF00E6F4FF009BB4F200162F8B006B5B6200FFFE
      FF00F1DCDA00F2DDDB00A18C8B00000000000000000000000000BD4A0000BD4A
      0000BD4A0000BD4A000084210000DEC6A500DE843100CE6B1800842100000000
      000000000000000000000000000000000000101010001010100010425A001063
      CE001063CE001063CE001063CE001063CE002184E700299CFF00299CFF00299C
      FF00299CFF00299CFF00299CFF0008529400000000009CF7FF0073DEFF007BDE
      FF007BDEFF007BDEFF009C3100009C3100009C3100009C310000EFFFFF00EFFF
      FF00D6FFFF00F7FFFF00FFFFFF00009CCE0092828300FFFCFB00FFFBFA00FFFA
      F900FFFAF900FFFAF9001F449600006CF4002E72D700056AFC00104FC200BBB4
      C300B39C9A00F7E2E100D1B9B900000000000000000000000000BD4A00000000
      0000000000000000000084210000842100008421000084210000842100000000
      0000186B1000186B100000000000000000001010100010101000101818001873
      D600218CF700218CF700218CF7001873D600299CFF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF000852940000000000ADF7FF007BE7FF007BE7
      FF007BE7FF007BE7FF009C310000FFFFFF000039FF009C310000009CCE00009C
      CE00009CCE00009CCE00009CCE00009CCE00C2B6B600FFFCFB00FFFCFB00FFFC
      FB00FFFCFB00FFFCFB00FFFBFA003455A5000C90FF00007EFF00007EFF00004E
      CC00717B9900C7B9BA00826A6A00000000008421000084210000842100008421
      0000842100000000000000000000000000000000000000000000000000000000
      0000186B1000186B100000000000000000001010100010101000639C6B001018
      180010425A00184A7B00184A7B0010212100429CBD00319CEF00319CFF00319C
      FF00319CFF00319CFF00319CE70010425A0000000000CEFFFF0084EFFF008CF7
      FF008CF7FF008CF7FF009C3100007BBDFF00E7FFFF000039FF00A5F7FF00B5F7
      FF00009CCE0000000000000000000000000000000000B1A5A500FFFEFD00FFFD
      FD00FFFDFC00FFFDFC00FFFDFC00FFFDFC009EAFF20029B8FF000097FA0099BC
      E400CAC0C000C9CDD200316F93000000000084210000DEC6A500DE843100CE6B
      1800842100000000000000000000000000000000000000000000186B10001873
      10001873100018731000186B1000186B1000000000001010100010101000639C
      6B00639C6B0010101000101010000000000008529400217BD60010425A001042
      5A0010425A00217BD600104A840010426B0000000000A5F7FF00A5F7FF008CF7
      FF008CF7FF0094F7FF009C310000FFFFFF00FFFFFF000039FF000063EF00009C
      CE000000000000000000000000000000000000000000000000008D7D7E00FFFE
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFEFE00F1F7FF000062B700E1FB
      FF00F7F1F20020D7F70001E1FE00518FAD008421000084210000842100008421
      0000842100000000000000000000000000000000000000000000186B10001873
      10001873100018731000186B1000186B10000000000000000000101010001010
      1000101010001010100000000000000000000000000008529400085294000852
      94000852940010425A0010425A00000000000000000000000000009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000039
      FF0000000000000000000000000000000000000000000000000000000000FAF0
      F000C7BDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00948281006C5C
      6300FFF8F90082F6FD0087FFFF0084B4CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187310001873100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000085294000852
      940008529400104A840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6EAEA009C8E8F00FFFEFF00FFFFFF00FFFFFE00EFE7E7000000
      0000FFF5F5005287AC007AAFD400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186B1000186B100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF9F900BBABAC00FFFEFF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000DC1FFFFFFFFFFBFFC01F80FF81FFF01F
      DC1F0001803FF001DFFF00008007E001DC1F00008007E001C01F80008003C001
      DC1F81018003C001DFFF008380018001DC1F000180018001C01F000080000001
      DC1300008000000107F300008007800107C08100800FC00007C0C381C3EFE000
      FFF3FFC3FFFFF811FFF3FFFFFFFFFF1F00000000000000000000000000000000
      000000000000}
  end
  object qyDisciplinas: TUMZQuery
    Connection = DM.db
    OnNewRecord = qyDisciplinasNewRecord
    SQL.Strings = (
      'SELECT'
      #9'pd.cd_prova_disciplina,'
      #9'pd.cd_prova,'
      #9'pd.cd_disciplina,'
      #9'pd.cd_curso,'
      #9'd.descricao'
      'FROM'
      #9'leitora_provas_disciplinas pd'
      
        #9#9'INNER JOIN disciplinas d ON (d.curso = pd.cd_curso AND d.codig' +
        'o = pd.cd_disciplina)'
      'WHERE'
      #9'pd.cd_prova = :cd_prova'
      'ORDER BY'
      #9'pd.cd_curso,'
      #9'd.descricao'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = srcProvas
    Left = 336
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyDisciplinascd_prova_disciplina: TIntegerField
      FieldName = 'cd_prova_disciplina'
      Origin = 'WMESTRE12.leitora_provas_disciplinas.cd_prova_disciplina'
    end
    object qyDisciplinascd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas_disciplinas.cd_prova'
    end
    object qyDisciplinascd_disciplina: TSmallintField
      FieldName = 'cd_disciplina'
      Origin = 'WMESTRE12.leitora_provas_disciplinas.cd_disciplina'
    end
    object qyDisciplinascd_curso: TStringField
      FieldName = 'cd_curso'
      Origin = 'WMESTRE12.leitora_provas_disciplinas.cd_curso'
      Size = 15
    end
    object qyDisciplinasdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 100
    end
  end
  object srcDisciplinas: TDataSource
    DataSet = qyDisciplinas
    Left = 360
    Top = 304
  end
  object qyTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'a.nr_anosemestre,'
      #9'a.cd_turma,'
      #9'g.cd_prova'
      'FROM'
      #9'leitora_provas_alunos a'
      
        #9#9'INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito ' +
        '= a.cd_prova_gabarito)'
      'WHERE'
      #9'g.cd_prova = :cd_prova'
      'GROUP BY'
      #9'a.nr_anosemestre,'
      #9'a.cd_turma')
    Params = <
      item
        DataType = ftString
        Name = 'cd_prova'
        ParamType = ptUnknown
      end>
    DataSource = srcProvas
    Left = 520
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_prova'
        ParamType = ptUnknown
      end>
    object qyTurmasnr_anosemestre: TSmallintField
      FieldName = 'nr_anosemestre'
      Origin = 'WMESTRE12.leitora_provas_alunos.nr_anosemestre'
    end
    object qyTurmascd_turma: TStringField
      FieldName = 'cd_turma'
      Origin = 'WMESTRE12.leitora_provas_alunos.cd_turma'
      Size = 50
    end
    object qyTurmascd_prova: TIntegerField
      FieldName = 'cd_prova'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.cd_prova'
    end
  end
  object srcTurmas: TDataSource
    DataSet = qyTurmas
    Left = 544
    Top = 304
  end
  object srcGabaritos: TDataSource
    DataSet = qyGabaritos
    Left = 456
    Top = 304
  end
  object qyGabaritos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'g.cd_prova_gabarito,'
      #9'g.ds_nome_gabarito,'
      #9'COUNT(gr.nr_questao) AS nr_questoes'
      'FROM'
      #9'leitora_provas_gabaritos g'
      
        #9#9'LEFT JOIN leitora_provas_gabaritos_resp gr ON (gr.cd_prova_gab' +
        'arito = g.cd_prova_gabarito)'
      'WHERE'
      #9'g.cd_prova = :cd_prova'
      'GROUP BY'
      #9'g.cd_prova_gabarito'
      'ORDER BY'
      #9'g.ds_nome_gabarito')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = srcProvas
    Left = 432
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_prova'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyGabaritoscd_prova_gabarito: TIntegerField
      FieldName = 'cd_prova_gabarito'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.cd_prova_gabarito'
    end
    object qyGabaritosds_nome_gabarito: TStringField
      FieldName = 'ds_nome_gabarito'
      Origin = 'WMESTRE12.leitora_provas_gabaritos.ds_nome_gabarito'
      Size = 15
    end
  end
  object qyDiarioProvas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'dp.*, t.descricao AS dsTurma, d.descricao AS dsDisciplina'
      'FROM'
      #9'diario_provas AS dp'
      
        '        INNER JOIN turmas AS t ON (t.codigo = dp.turma AND t.ano' +
        'semestre = dp.anosemestre)'
      
        '        INNER JOIN disciplinas AS d ON (d.codigo = dp.disciplina' +
        ' AND d.curso = t.curso)')
    Params = <>
    DataSource = srcProvas
    Left = 600
    Top = 304
  end
  object srcDiarioProvas: TDataSource
    DataSet = qyDiarioProvas
    Left = 624
    Top = 304
  end
  object cdsSituacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 320
    object cdsSituacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object cdsSituacaodescricao: TStringField
      FieldName = 'descricao'
    end
  end
  object dsSituacao: TDataSource
    DataSet = cdsSituacao
    Left = 640
    Top = 320
  end
  object sqlProcessorDeleteTurma: TZSQLProcessor
    Params = <>
    Script.Strings = (
      'DELETE D.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_DIS` D'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         A.`CD_PROVA_ALUNO`'
      '      FROM'
      '         `LEITORA_PROVAS_GABARITOS` G'
      '            JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '               (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         D.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      
        '         (A.`NR_ANOSEMESTRE`, A.`CD_TURMA`, G.`CD_PROVA`) IN (%s' +
        ')'
      '   );'
      ''
      'DELETE C.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_CARTOES` C'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         A.`CD_PROVA_ALUNO`'
      '      FROM'
      '         `LEITORA_PROVAS_GABARITOS` G'
      '            JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '               (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         C.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      
        '         (A.`NR_ANOSEMESTRE`, A.`CD_TURMA`, G.`CD_PROVA`) IN (%s' +
        ')'
      '   );'
      ''
      'DELETE R.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_RESP` R'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         A.`CD_PROVA_ALUNO`'
      '      FROM'
      '         `LEITORA_PROVAS_GABARITOS` G'
      '            JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '               (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         R.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      
        '         (A.`NR_ANOSEMESTRE`, A.`CD_TURMA`, G.`CD_PROVA`) IN (%s' +
        ')'
      '   );'
      ''
      'DELETE A.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS` A'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA_GABARITO`'
      '      FROM'
      '         `LEITORA_PROVAS_GABARITOS` G'
      '      WHERE'
      '         A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND'
      
        '         (A.`NR_ANOSEMESTRE`, A.`CD_TURMA`, G.`CD_PROVA`) IN (%s' +
        ')'
      '   );')
    Connection = DM.db
    Delimiter = ';'
    Left = 40
    Top = 248
  end
  object sqlProcessorDeleteProva: TZSQLProcessor
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    Script.Strings = (
      'DELETE R.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_RESP` R'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         R.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA` = :CD_PROVA'
      '   );'
      ''
      'DELETE D.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_DIS` D'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         D.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA` = :CD_PROVA'
      '   );'
      ''
      'DELETE C.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_CARTOES` C'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         C.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA` = :CD_PROVA'
      '   );'
      ''
      'DELETE A.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS` A'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '         `LEITORA_PROVAS_GABARITOS` G'
      '      WHERE'
      '         A.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND'
      '         G.`CD_PROVA` = :CD_PROVA'
      '   );'
      ''
      'DELETE R.*'
      'FROM'
      '   `LEITORA_PROVAS_GABARITOS_RESP` R'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '         `LEITORA_PROVAS_GABARITOS` G'
      '      WHERE'
      '         R.`CD_PROVA_GABARITO` = G.`CD_PROVA_GABARITO` AND'
      '         G.`CD_PROVA` = :CD_PROVA'
      '   );'
      ''
      'DELETE FROM `LEITORA_PROVAS_GABARITOS`'
      'WHERE'
      '   `CD_PROVA` = :CD_PROVA;'
      ''
      
        'DELETE FROM `LEITORA_PROVAS_DISCIPLINAS` WHERE `CD_PROVA` = :CD_' +
        'PROVA;'
      ''
      'DELETE FROM `LEITORA_PROVAS` WHERE `CD_PROVA` = :CD_PROVA;')
    Connection = DM.db
    Delimiter = ';'
    Left = 40
    Top = 280
  end
  object sqlProcessorDeleteGabaritos: TZSQLProcessor
    Params = <>
    Script.Strings = (
      'DELETE R.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_RESP` R'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         R.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA_GABARITO` IN (%s)'
      '   );'
      ''
      'DELETE D.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_DIS` D'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         D.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA_GABARITO` IN (%s)'
      '   );'
      ''
      'DELETE C.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_CARTOES` C'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         C.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA_GABARITO` IN (%s)'
      '   );'
      ''
      'DELETE FROM `LEITORA_PROVAS_ALUNOS`'
      'WHERE'
      '   `CD_PROVA_GABARITO` IN (%s);'
      ''
      'DELETE FROM `LEITORA_PROVAS_GABARITOS_RESP`'
      'WHERE'
      '   `CD_PROVA_GABARITO` IN (%s);'
      ''
      'DELETE FROM `LEITORA_PROVAS_GABARITOS`'
      'WHERE'
      '   `CD_PROVA_GABARITO` IN (%s);')
    Connection = DM.db
    Delimiter = ';'
    Left = 40
    Top = 312
  end
  object sqlProcessorDeleteGabarito: TZSQLProcessor
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA_GABARITO'
        ParamType = ptUnknown
      end>
    Script.Strings = (
      'DELETE R.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_RESP` R'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         R.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA_GABARITO` :CD_PROVA_GABARITO'
      '   );'
      ''
      'DELETE D.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_DIS` D'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         D.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA_GABARITO` = :CD_PROVA_GABARITO'
      '   );'
      ''
      'DELETE C.*'
      'FROM'
      '   `LEITORA_PROVAS_ALUNOS_CARTOES` C'
      'WHERE'
      '   EXISTS ('
      '      SELECT'
      '         G.`CD_PROVA`'
      '      FROM'
      '        `LEITORA_PROVAS_GABARITOS` G'
      '           JOIN `LEITORA_PROVAS_ALUNOS` A ON'
      '              (G.`CD_PROVA_GABARITO` = A.`CD_PROVA_GABARITO`)'
      '      WHERE'
      '         C.`CD_PROVA_ALUNO` = A.`CD_PROVA_ALUNO` AND'
      '         G.`CD_PROVA_GABARITO` = :CD_PROVA_GABARITO'
      '   );'
      ''
      'DELETE FROM `LEITORA_PROVAS_ALUNOS`'
      'WHERE'
      '   `CD_PROVA_GABARITO` = :CD_PROVA_GABARITO;'
      ''
      'DELETE FROM `LEITORA_PROVAS_GABARITOS_RESP`'
      'WHERE'
      '   `CD_PROVA_GABARITO` = :CD_PROVA_GABARITO;'
      ''
      'DELETE FROM `LEITORA_PROVAS_GABARITOS`'
      'WHERE'
      '   `CD_PROVA_GABARITO` = :CD_PROVA_GABARITO;')
    Connection = DM.db
    Delimiter = ';'
    Left = 40
    Top = 344
  end
end
