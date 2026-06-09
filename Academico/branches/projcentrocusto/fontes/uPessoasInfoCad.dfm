object fPessoasInfoCad: TfPessoasInfoCad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Contatos e Informa'#231#245'es'
  ClientHeight = 705
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 680
    Width = 445
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOk: TBitBtn
      Left = 221
      Top = 0
      Width = 112
      Height = 25
      Align = alRight
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 333
      Top = 0
      Width = 112
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 445
    Height = 680
    ActivePage = tsInfo
    Align = alClient
    TabOrder = 1
    object tsInfo: TTabSheet
      Caption = 'Informa'#231#245'es de contato'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 437
        Height = 649
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 9
          Top = 54
          Width = 142
          Height = 16
          Caption = 'Descri'#231#227'o da Informa'#231#227'o'
        end
        object Label3: TLabel
          Left = 9
          Top = 144
          Width = 161
          Height = 16
          Hint = 
            'Informe um nome e tecle ENTER para localizar entre os nomes seme' +
            'lhantes dispon'#237'veis no banco de dados.'
          Caption = 'Nome da Pessoa de Contato'
          ParentShowHint = False
          ShowHint = True
        end
        object sbSelecionaPessoa: TSpeedButton
          Left = 400
          Top = 166
          Width = 33
          Height = 24
          Flat = True
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
          OnClick = sbSelecionaPessoaClick
        end
        object lblFone2: TLabel
          Left = 224
          Top = 191
          Width = 61
          Height = 16
          Caption = 'Telefone 2'
        end
        object Label6: TLabel
          Left = 9
          Top = 291
          Width = 35
          Height = 16
          Caption = 'E-Mail'
        end
        object Label5: TLabel
          Left = 248
          Top = 542
          Width = 56
          Height = 16
          Caption = 'Data Info.'
          FocusControl = DBEdit5
        end
        object Label7: TLabel
          Left = 226
          Top = 393
          Width = 109
          Height = 16
          Caption = 'Turma Interessada'
          FocusControl = DBEdit7
        end
        object lblCidade: TLabel
          Left = 226
          Top = 443
          Width = 39
          Height = 16
          Caption = 'Cidade'
        end
        object lblEstado: TLabel
          Left = 9
          Top = 443
          Width = 38
          Height = 16
          Caption = 'Estado'
        end
        object Label11: TLabel
          Left = 9
          Top = 6
          Width = 51
          Height = 16
          Caption = 'Unidade:'
        end
        object Label13: TLabel
          Left = 9
          Top = 493
          Width = 53
          Height = 16
          Caption = 'Endere'#231'o'
        end
        object Label12: TLabel
          Left = 9
          Top = 543
          Width = 224
          Height = 16
          Caption = 'Forma que ficou sabendo da institui'#231#227'o'
        end
        object lblFone1: TLabel
          Left = 9
          Top = 191
          Width = 61
          Height = 16
          Caption = 'Telefone 1'
        end
        object lblFone3: TLabel
          Left = 9
          Top = 241
          Width = 61
          Height = 16
          Caption = 'Telefone 3'
        end
        object lblFone4: TLabel
          Left = 224
          Top = 241
          Width = 61
          Height = 16
          Caption = 'Telefone 4'
        end
        object Label1: TLabel
          Left = 9
          Top = 393
          Width = 33
          Height = 16
          Caption = 'Curso'
          FocusControl = DBEdit7
        end
        object btnCodigoCurso: TSpeedButton
          Left = 190
          Top = 415
          Width = 29
          Height = 24
          Flat = True
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
          OnClick = btnCodigoCursoClick
        end
        object btnCodigoTurma: TSpeedButton
          Left = 403
          Top = 415
          Width = 30
          Height = 24
          Flat = True
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
          OnClick = btnCodigoTurmaClick
        end
        object Label4: TLabel
          Left = 9
          Top = 343
          Width = 77
          Height = 16
          Caption = #193'rea/Assunto'
          FocusControl = DBEdit7
        end
        object btnAreaAssunto: TSpeedButton
          Left = 275
          Top = 363
          Width = 30
          Height = 24
          Flat = True
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
          OnClick = btnAreaAssuntoClick
        end
        object Label14: TLabel
          Left = 321
          Top = 343
          Width = 90
          Height = 16
          Caption = 'Data de retorno'
          FocusControl = DBEdit7
        end
        object cbNomePessoa: TComboBox
          Left = 9
          Top = 166
          Width = 386
          Height = 24
          Hint = 
            'Informe um nome e tecle ENTER para localizar entre os nomes seme' +
            'lhantes dispon'#237'veis no banco de dados.'
          AutoDropDown = True
          ItemHeight = 16
          ParentShowHint = False
          ShowHint = True
          Sorted = True
          TabOrder = 2
          OnChange = cbNomePessoaChange
          OnExit = cbNomePessoaExit
          OnKeyPress = cbNomePessoaKeyPress
          OnSelect = cbNomePessoaSelect
        end
        object DBEdit1: TDBEdit
          Left = 224
          Top = 213
          Width = 209
          Height = 24
          DataField = 'ds_telefone2'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 4
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit6: TDBEdit
          Left = 9
          Top = 313
          Width = 425
          Height = 24
          DataField = 'ds_email'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 7
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 248
          Top = 565
          Width = 185
          Height = 24
          DataField = 'dt_informacao'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          MaxLength = 16
          TabOrder = 17
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit7: TDBEdit
          Left = 224
          Top = 415
          Width = 173
          Height = 24
          CharCase = ecUpperCase
          DataField = 'cd_turma'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 12
        end
        object dblcMunicipios: TDBLookupComboBox
          Left = 224
          Top = 465
          Width = 209
          Height = 24
          DataField = 'ds_cidade_lk'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 14
        end
        object dblcEstados: TDBLookupComboBox
          Left = 9
          Top = 465
          Width = 210
          Height = 24
          DataField = 'ds_estado'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 13
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 9
          Top = 594
          Width = 425
          Height = 49
          Caption = 'Informa'#231#227'o por:'
          Columns = 4
          DataField = 'cd_origem'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          Items.Strings = (
            'Telefone'
            'E-Mail'
            'Site'
            'Pessoalmente')
          ParentBackground = True
          TabOrder = 18
          Values.Strings = (
            '1'
            '2'
            '4'
            '3')
        end
        object cbUnidadeEnsino: TUMComboBox
          Left = 9
          Top = 28
          Width = 385
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 0
          OnSelect = cbUnidadeEnsinoSelect
          TamanhoMaximo = 0
        end
        object DBEdit3: TDBEdit
          Left = 9
          Top = 514
          Width = 425
          Height = 24
          DataField = 'ds_endereco'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 15
          OnKeyPress = DBEdit2KeyPress
        end
        object cbFormaConheceu: TComboBox
          Left = 9
          Top = 565
          Width = 233
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 16
        end
        object DBEdit12: TDBEdit
          Left = 224
          Top = 260
          Width = 209
          Height = 24
          DataField = 'ds_telefone4'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 6
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit13: TDBEdit
          Left = 9
          Top = 415
          Width = 176
          Height = 24
          DataField = 'ds_curso'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 11
        end
        object DBEdit11: TDBEdit
          Left = 9
          Top = 260
          Width = 210
          Height = 24
          DataField = 'ds_telefone3'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 5
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit4: TDBEdit
          Left = 9
          Top = 213
          Width = 210
          Height = 24
          DataField = 'ds_contatos'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          TabOrder = 3
          OnKeyPress = DBEdit2KeyPress
        end
        object dtRetorno: TDateTimePicker
          Left = 341
          Top = 363
          Width = 92
          Height = 25
          Date = 38282.000000000000000000
          Time = 38282.000000000000000000
          TabOrder = 10
        end
        object dbDsInformacao: TDBMemo
          Left = 9
          Top = 76
          Width = 420
          Height = 62
          DataField = 'ds_informacao'
          DataSource = fPessoasInformacoes.dsPessoasInfo
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object checksnretorno: TCheckBox
          Left = 323
          Top = 367
          Width = 12
          Height = 17
          Caption = ' '
          TabOrder = 9
          OnClick = checksnretornoClick
        end
        object cbAreaAssunto: TUMComboBox
          Left = 9
          Top = 363
          Width = 260
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 8
          TamanhoMaximo = 0
        end
      end
    end
    object tsObs: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      object pannelobs: TPanel
        Left = 0
        Top = 0
        Width = 437
        Height = 649
        Align = alClient
        TabOrder = 0
        object Panel4: TPanel
          Left = 1
          Top = 61
          Width = 435
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object Label9: TLabel
            Left = 8
            Top = -2
            Width = 37
            Height = 16
            Caption = 'Label9'
          end
          object DBEdit9: TDBEdit
            Left = 8
            Top = 18
            Width = 425
            Height = 24
            DataField = 'ds_obs2'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 111
          Width = 435
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object Label10: TLabel
            Left = 8
            Top = -2
            Width = 44
            Height = 16
            Caption = 'Label10'
          end
          object DBEdit10: TDBEdit
            Left = 8
            Top = 20
            Width = 425
            Height = 24
            DataField = 'ds_obs3'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 435
          Height = 60
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object Label8: TLabel
            Left = 9
            Top = 4
            Width = 37
            Height = 16
            Caption = 'Label8'
          end
          object DBEdit8: TDBEdit
            Left = 8
            Top = 26
            Width = 425
            Height = 24
            DataField = 'ds_obs1'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 161
          Width = 435
          Height = 120
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          Visible = False
          object lbl11: TLabel
            Left = 9
            Top = 4
            Width = 27
            Height = 16
            Caption = 'lbl11'
          end
          object DBMemo1: TDBMemo
            Left = 8
            Top = 26
            Width = 425
            Height = 79
            DataField = 'ds_obs4'
            DataSource = fPessoasInformacoes.dsPessoasInfo
            TabOrder = 0
            Visible = False
          end
        end
      end
    end
  end
  object qryPessoas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_pessoa,'
      '   nm_pessoa'
      'FROM'
      '   pessoas'
      'WHERE'
      '   nm_pessoa LIKE :nm_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nm_pessoa'
        ParamType = ptUnknown
      end>
    Left = 406
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nm_pessoa'
        ParamType = ptUnknown
      end>
    object qryPessoascd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.pessoas.cd_pessoa'
    end
    object qryPessoasnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
  end
end
