object frm_CadContas: Tfrm_CadContas
  Left = 194
  Top = 130
  Caption = 'Cadastro de Contas'
  ClientHeight = 673
  ClientWidth = 1037
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
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1037
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CADASTRO DE CONTAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 648
    Width = 1037
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 1
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
      Left = 92
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 176
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 260
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 268
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 352
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton8: TToolButton
      Left = 436
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 444
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 528
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object Panel10: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 30
    Width = 1037
    Height = 29
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label31: TLabel
      Left = 10
      Top = 6
      Width = 112
      Height = 13
      Align = alCustom
      Caption = 'Unidade de Ensino:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbUnidadeEnsino: TUMComboBox
      Left = 125
      Top = 3
      Width = 350
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 0
      OnChange = cbUnidadeEnsinoChange
      OnSelect = cbUnidadeEnsinoSelect
      TamanhoMaximo = 0
    end
  end
  object Panel11: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 64
    Width = 1037
    Height = 575
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 9
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 4
      Width = 489
      Height = 571
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 11
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 489
        Height = 392
        HorzScrollBar.Visible = False
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 113
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label12: TLabel
            Left = 16
            Top = 8
            Width = 53
            Height = 13
            Caption = 'C'#243'd. Conta'
            FocusControl = DBCodConta
          end
          object Bevel4: TBevel
            Left = 10
            Top = 52
            Width = 440
            Height = 5
            Shape = bsTopLine
          end
          object Label2: TLabel
            Left = 16
            Top = 64
            Width = 51
            Height = 13
            Caption = 'Descri'#231#227'o:'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 304
            Top = 64
            Width = 70
            Height = 13
            Caption = 'Tipo de Conta:'
          end
          object UMAjuda2: TUMAjuda
            Left = 423
            Top = 11
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
              'O cadastro de contas define quais as contas financeiras a Instit' +
              'ui'#231#227'o controlar'#225'.'#13#10'Essas contas representam o grupo de "Disponib' +
              'ilidades" do Plano de Contas Cont'#225'bil.'#13#10'Voc'#234' poder'#225' controlar su' +
              'as contas Banc'#225'rias (Contas Correntes, Poupan'#231'as, Aplica'#231#245'es) ou' +
              ' Caixas internos.'#13#10#13#10'Para cada conta voc'#234' poder'#225':'#13#10#13#10'[b]Definir ' +
              'as taxas de multa e juros[/b] cobradas por pagamento em atraso.'#13 +
              #10#13#10'[b]Configurar boletos[/b] com o aux'#237'lio da equipe Unimestre e' +
              ' definir mensagens para o sacado.'#13#10#13#10'[b]Vincular lan'#231'amentos com' +
              ' o Plano de Contas[/b] para gerar lan'#231'amentos cont'#225'beis.'#13#10#13#10'[b]D' +
              'efinir os usu'#225'rios[/b] que poder'#227'o acessar cada conta.'#13#10
            Titulo = 'SOBRE A TELA'
            PanelWidth = 550
            PanelHeight = 300
          end
          object DBCodConta: TDBEdit
            Left = 16
            Top = 24
            Width = 81
            Height = 21
            DataField = 'cd_caixa'
            DataSource = srcContas
            Enabled = False
            TabOrder = 0
            OnKeyPress = DBCodContaKeyPress
          end
          object DBEdit2: TDBEdit
            Left = 16
            Top = 80
            Width = 273
            Height = 21
            DataField = 'ds_caixa'
            DataSource = srcContas
            TabOrder = 1
            OnKeyPress = DBCodContaKeyPress
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 304
            Top = 80
            Width = 134
            Height = 21
            DataField = 'tp_conta'
            DataSource = srcContas
            KeyField = 'cd_tipo'
            ListField = 'ds_tipo'
            ListSource = DM.srcTiposConta
            TabOrder = 2
            OnKeyPress = DBCodContaKeyPress
          end
          object DBCheckBox1: TDBCheckBox
            Left = 116
            Top = 26
            Width = 89
            Height = 17
            Caption = 'Conta Ativa'
            DataField = 'sn_ativa'
            DataSource = srcContas
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object pgConta: TPageControl
          Left = 0
          Top = 113
          Width = 489
          Height = 273
          ActivePage = tsPlanoContas
          Align = alTop
          Style = tsFlatButtons
          TabOrder = 1
          OnChange = pgContaChange
          object TabSheet4: TTabSheet
            Caption = 'Dados do Caixa'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label11: TLabel
              Left = 8
              Top = 120
              Width = 60
              Height = 13
              Caption = 'Saldo Inicial:'
              FocusControl = deSaldo
            end
            object Label14: TLabel
              Left = 8
              Top = 40
              Width = 37
              Height = 13
              Caption = '% Multa'
              FocusControl = DBEdit3
            end
            object Label15: TLabel
              Left = 128
              Top = 40
              Width = 72
              Height = 13
              Caption = '% Juros mensal'
              FocusControl = DBEdit11
            end
            object Label19: TLabel
              Left = 280
              Top = 40
              Width = 73
              Height = 13
              Caption = '% Juros ao m'#234's'
              FocusControl = DBEdit15
            end
            object Label23: TLabel
              Left = 146
              Top = 120
              Width = 94
              Height = 13
              Caption = 'Car'#234'ncia Acr'#233'scimo'
              FocusControl = DBEdit19
            end
            object Label24: TLabel
              Left = 248
              Top = 120
              Width = 91
              Height = 13
              Caption = 'Car'#234'ncia Desconto'
              FocusControl = DBEdit20
            end
            object Label28: TLabel
              Left = 348
              Top = 120
              Width = 84
              Height = 13
              Caption = '% Desc. Car'#234'ncia'
              FocusControl = DBEdit20
            end
            object deSaldo: TDBEdit
              Left = 8
              Top = 136
              Width = 129
              Height = 21
              DataField = 'vl_saldo_inicio'
              DataSource = srcContas
              Enabled = False
              TabOrder = 7
              OnKeyPress = DBCodContaKeyPress
            end
            object DBCheckBox2: TDBCheckBox
              Left = 8
              Top = 16
              Width = 105
              Height = 17
              Caption = 'Aplicar multa?'
              DataField = 'sn_multa'
              DataSource = srcContas
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 129
              Top = 17
              Width = 145
              Height = 17
              Caption = 'Aplicar juros diariamente?'
              DataField = 'sn_juros'
              DataSource = srcContas
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox4: TDBCheckBox
              Left = 8
              Top = 83
              Width = 193
              Height = 31
              Caption = 'Aplicar '#237'ndice de corre'#231#227'o mensal?'
              DataField = 'sn_correcao'
              DataSource = srcContas
              TabOrder = 6
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 56
              Width = 105
              Height = 21
              DataField = 'vl_multa_percent'
              DataSource = srcContas
              TabOrder = 1
              OnKeyPress = transformaPonto
            end
            object DBEdit11: TDBEdit
              Left = 128
              Top = 56
              Width = 113
              Height = 21
              DataField = 'vl_juros_percent'
              DataSource = srcContas
              TabOrder = 3
              OnKeyPress = transformaPonto
            end
            object DBCheckBox5: TDBCheckBox
              Left = 280
              Top = 16
              Width = 153
              Height = 17
              Caption = 'Aplicar juros mensalmente?'
              DataField = 'sn_juros_mensal'
              DataSource = srcContas
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit15: TDBEdit
              Left = 280
              Top = 56
              Width = 113
              Height = 21
              DataField = 'vl_juros_mensal'
              DataSource = srcContas
              TabOrder = 5
              OnKeyPress = transformaPonto
            end
            object DBEdit19: TDBEdit
              Left = 146
              Top = 136
              Width = 94
              Height = 21
              DataField = 'nr_dias_acrescimo'
              DataSource = srcContas
              TabOrder = 8
            end
            object DBEdit20: TDBEdit
              Left = 248
              Top = 136
              Width = 93
              Height = 21
              DataField = 'nr_dias_desconto'
              DataSource = srcContas
              TabOrder = 9
            end
            object DBEdit24: TDBEdit
              Left = 348
              Top = 136
              Width = 89
              Height = 21
              DataField = 'vl_dias_desc_perc'
              DataSource = srcContas
              TabOrder = 10
              OnKeyPress = transformaPonto
            end
            object DBCheckBox7: TDBCheckBox
              Left = 8
              Top = 176
              Width = 256
              Height = 17
              Caption = 'Usar esta conta em todas as unidades de ensino'
              DataField = 'sn_todas_coligadas'
              DataSource = srcContas
              TabOrder = 11
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'Dados do Banco'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label5: TLabel
              Left = 8
              Top = 8
              Width = 89
              Height = 13
              Caption = 'N'#250'mero do Banco:'
              FocusControl = DBEdit5
            end
            object Label4: TLabel
              Left = 120
              Top = 8
              Width = 80
              Height = 13
              Caption = 'Nome do Banco:'
              FocusControl = DBEdit4
            end
            object Label6: TLabel
              Left = 8
              Top = 51
              Width = 97
              Height = 13
              Caption = 'N'#250'mero da Ag'#234'ncia:'
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 120
              Top = 51
              Width = 88
              Height = 13
              Caption = 'Nome da Ag'#234'ncia:'
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 8
              Top = 91
              Width = 86
              Height = 13
              Caption = 'N'#250'mero da Conta:'
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 160
              Top = 91
              Width = 71
              Height = 13
              Caption = 'Float Banc'#225'rio:'
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 302
              Top = 91
              Width = 80
              Height = 13
              Caption = 'Data de Cria'#231#227'o:'
              FocusControl = DBEdit10
            end
            object sbAviso1: TSpeedButton
              Tag = 1
              Left = 455
              Top = 3
              Width = 23
              Height = 22
              Hint = 
                'Os campos desta aba est'#227'o desabilitados, pois j'#225' existe um bloqu' +
                'eto configurado para esta conta.'
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
                7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
                1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
                F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
                DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
                1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
                F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
                DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
                1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
                FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
                DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
                1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
                FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
                B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
                ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
                FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
                ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
                D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              OnClick = sbAviso1Click
            end
            object DBEdit5: TDBEdit
              Left = 8
              Top = 24
              Width = 97
              Height = 21
              DataField = 'nr_banco'
              DataSource = srcContas
              TabOrder = 0
              OnKeyPress = DBCodContaKeyPress
            end
            object DBEdit4: TDBEdit
              Left = 118
              Top = 24
              Width = 321
              Height = 21
              DataField = 'nm_banco'
              DataSource = srcContas
              TabOrder = 1
              OnKeyPress = DBCodContaKeyPress
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 67
              Width = 97
              Height = 21
              DataField = 'nr_agencia'
              DataSource = srcContas
              TabOrder = 2
              OnKeyPress = DBCodContaKeyPress
            end
            object DBEdit7: TDBEdit
              Left = 118
              Top = 67
              Width = 321
              Height = 21
              DataField = 'nm_agencia'
              DataSource = srcContas
              TabOrder = 3
              OnKeyPress = DBCodContaKeyPress
            end
            object DBEdit8: TDBEdit
              Left = 8
              Top = 107
              Width = 140
              Height = 21
              DataField = 'nr_conta'
              DataSource = srcContas
              TabOrder = 4
              OnKeyPress = DBCodContaKeyPress
            end
            object DBEdit9: TDBEdit
              Left = 160
              Top = 107
              Width = 129
              Height = 21
              DataField = 'nr_float_bancario'
              DataSource = srcContas
              TabOrder = 5
              OnKeyPress = DBCodContaKeyPress
            end
            object DBEdit10: TDBEdit
              Left = 302
              Top = 107
              Width = 137
              Height = 21
              DataField = 'dt_criacao'
              DataSource = srcContas
              Enabled = False
              TabOrder = 6
              OnKeyPress = DBCodContaKeyPress
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Dados para o Boleto'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label13: TLabel
              Left = 8
              Top = 8
              Width = 68
              Height = 13
              Caption = 'N'#186' Uso Banco'
              FocusControl = DBEdit1
            end
            object Label16: TLabel
              Left = 144
              Top = 8
              Width = 60
              Height = 13
              Caption = 'N'#186' Conv'#234'nio'
              FocusControl = DBEdit12
            end
            object Label17: TLabel
              Left = 280
              Top = 8
              Width = 66
              Height = 13
              Caption = 'N'#186' Transa'#231#227'o'
              FocusControl = DBEdit13
            end
            object Label18: TLabel
              Left = 8
              Top = 56
              Width = 51
              Height = 13
              Caption = 'N'#186' Carteira'
              FocusControl = DBEdit14
            end
            object Label20: TLabel
              Left = 144
              Top = 56
              Width = 72
              Height = 13
              Caption = 'Prefixo do N.N.'
              FocusControl = DBEdit16
            end
            object Label21: TLabel
              Left = 280
              Top = 56
              Width = 91
              Height = 13
              Caption = 'Seq'#252#234'ncia do N.N.'
              FocusControl = DBEdit17
            end
            object Label22: TLabel
              Left = 8
              Top = 104
              Width = 83
              Height = 13
              Caption = 'N'#186' Ultimo cheque'
              FocusControl = DBEdit18
            end
            object sbAviso: TSpeedButton
              Tag = 1
              Left = 455
              Top = 3
              Width = 23
              Height = 22
              Hint = 
                'Os campos desta aba est'#227'o desabilitados, pois j'#225' existe um bloqu' +
                'eto configurado para esta conta.'
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A5D4159DD11292CC118CC90E82C40D
                7FC30D7FC30D7FC30D7FC30D7FC30D7FC30D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
                1AADD891E1FA76DAF976DAF976DAF976DAF976DAF976DAF976DAF976DAF976DA
                F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCD2F5FCA8ECF992E7F792E7F780
                DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
                1CB6DCD2F5FCA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E376DA
                F90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCDBF7FDA8ECF992E7F792E7F780
                DDF36ED3EF5DC9EB4ABEE738B4E376DAF90D7FC3FFFFFFFFFFFFFFFFFFFFFFFF
                1CB6DCE2F9FDA8ECF992E7F792E7F780DDF36ED3EF5DC9EB4ABEE738B4E391E1
                FA0E82C4FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCE2F9FDA8ECF992E7F792E7F780
                DDF36ED3EF5DC9EB4ABEE738B4E391E1FA118CC9FFFFFFFFFFFFFFFFFFFFFFFF
                1CB6DCFFFFFFEDFBFDE2F9FDDBF7FDD2F5FCD2F5FCC7F3FBB9F0FAA8ECF991E1
                FA159DD1FFFFFFFFFFFFFFFFFFFFFFFF1CB6DCADADADEBEBEBADADAD21B4D81C
                B6DC1CB6DC21B4D8ADADADC5C5C5ADADAD1AADD8FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFADADADEFEFEFADADADFFFFFFFFFFFFFFFFFFFFFFFFADADADC5C5C5ADAD
                ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEFEFEFADADADFFFFFFFF
                FFFFFFFFFFFFFFFFADADADC5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFADADADFFFFFFEFEFEFADADADADADADADADADADADADADADADC7C7C7ADAD
                ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFFFFFFD5D5D5D5
                D5D5D5D5D5C7C7C7C5C5C5ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFADADADADADADADADADADADADADADADADADADFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              OnClick = sbAviso1Click
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 24
              Width = 129
              Height = 21
              DataField = 'nr_uso_banco'
              DataSource = srcContas
              TabOrder = 0
            end
            object DBEdit12: TDBEdit
              Left = 144
              Top = 24
              Width = 129
              Height = 21
              DataField = 'nr_convenio'
              DataSource = srcContas
              TabOrder = 1
            end
            object DBEdit13: TDBEdit
              Left = 280
              Top = 24
              Width = 129
              Height = 21
              DataField = 'nr_transacao'
              DataSource = srcContas
              TabOrder = 2
            end
            object DBEdit14: TDBEdit
              Left = 8
              Top = 72
              Width = 129
              Height = 21
              DataField = 'nr_carteira'
              DataSource = srcContas
              TabOrder = 3
            end
            object DBEdit16: TDBEdit
              Left = 144
              Top = 72
              Width = 129
              Height = 21
              DataField = 'ds_nn_prefixo'
              DataSource = srcContas
              TabOrder = 4
            end
            object DBEdit17: TDBEdit
              Left = 280
              Top = 72
              Width = 129
              Height = 21
              DataField = 'nr_nn_ultimo'
              DataSource = srcContas
              TabOrder = 5
            end
            object DBEdit18: TDBEdit
              Left = 8
              Top = 120
              Width = 134
              Height = 21
              DataField = 'nr_ultimo_cheque'
              DataSource = srcContas
              TabOrder = 6
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Msg para o Boleto'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object DBMemo2: TDBMemo
              Left = 0
              Top = 0
              Width = 481
              Height = 242
              Align = alClient
              DataField = 'ds_mensagem_bloqueto'
              DataSource = srcContas
              TabOrder = 0
            end
          end
          object tsPlanoContas: TTabSheet
            Caption = 'Plano de Contas'
            ImageIndex = 4
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 0
              Width = 481
              Height = 242
              VertScrollBar.Position = 122
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              object Label25: TLabel
                Left = 9
                Top = -109
                Width = 166
                Height = 13
                Caption = 'Conta do ativo no plano de contas:'
                FocusControl = DBEdit21
              end
              object Label26: TLabel
                Left = 9
                Top = -62
                Width = 226
                Height = 13
                Caption = 'Conta de resultado para descontos concedidos:'
                FocusControl = DBEdit21
              end
              object Label27: TLabel
                Left = 9
                Top = -15
                Width = 190
                Height = 13
                Caption = 'Conta de resultado para juros recebidos:'
                FocusControl = DBEdit21
              end
              object Label29: TLabel
                Left = 9
                Top = 32
                Width = 297
                Height = 13
                Caption = 'Conta de resultado para despesas com tarifas de boleto/cart'#227'o'
                FocusControl = DBLookupComboBox5
              end
              object Label30: TLabel
                Left = 9
                Top = 79
                Width = 283
                Height = 13
                Caption = 'Centro de custo para despesas com tarifas de boleto/cart'#227'o'
                FocusControl = DBLookupComboBox6
              end
              object Label32: TLabel
                Left = 9
                Top = 126
                Width = 284
                Height = 13
                Caption = 'Conta de resultado para pagamento de multa ao fornecedor:'
                FocusControl = DBLookupComboBox7
              end
              object Label33: TLabel
                Left = 9
                Top = 173
                Width = 281
                Height = 13
                Caption = 'Conta de resultado para pagamento de juros ao fornecedor:'
                FocusControl = DBLookupComboBox8
              end
              object Label34: TLabel
                Left = 9
                Top = 220
                Width = 308
                Height = 13
                Caption = 'Conta de resultado para recebimento de desconto de fornecedor:'
                FocusControl = DBLookupComboBox9
              end
              object UMAjuda1: TUMAjuda
                Left = 391
                Top = -122
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
                  'As configura'#231#245'es abaixo servem para vincular alguns lan'#231'amentos ' +
                  'com '#13#10'as suas respectivas contas do Plano de Contas da Institui'#231 +
                  #227'o.'#13#10#13#10'A classifica'#231#227'o dos lan'#231'amentos nestas contas ocorrer'#225' so' +
                  'mente '#13#10'ap'#243's as baixas serem efetuadas por esta conta financeira' +
                  '.'#13#10
                Titulo = 'AJUDA'
                PanelWidth = 370
                PanelHeight = 150
              end
              object sbConta: TSpeedButton
                Left = 403
                Top = -90
                Width = 24
                Height = 22
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
                OnClick = sbContaClick
              end
              object SpeedButton1: TSpeedButton
                Left = 403
                Top = -43
                Width = 24
                Height = 22
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
                OnClick = SpeedButton1Click
              end
              object SpeedButton2: TSpeedButton
                Left = 403
                Top = 4
                Width = 24
                Height = 22
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
                OnClick = SpeedButton2Click
              end
              object SpeedButton3: TSpeedButton
                Left = 403
                Top = 51
                Width = 24
                Height = 22
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
                OnClick = SpeedButton3Click
              end
              object SpeedButton4: TSpeedButton
                Left = 403
                Top = 98
                Width = 24
                Height = 22
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
                OnClick = SpeedButton4Click
              end
              object SpeedButton5: TSpeedButton
                Left = 403
                Top = 145
                Width = 24
                Height = 22
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
                OnClick = SpeedButton5Click
              end
              object SpeedButton6: TSpeedButton
                Left = 403
                Top = 192
                Width = 24
                Height = 22
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
                OnClick = SpeedButton6Click
              end
              object SpeedButton7: TSpeedButton
                Left = 403
                Top = 239
                Width = 24
                Height = 22
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
                OnClick = SpeedButton7Click
              end
              object DBEdit21: TDBEdit
                Left = 9
                Top = -90
                Width = 75
                Height = 21
                DataField = 'cd_plano_conta'
                DataSource = srcContas
                TabOrder = 0
              end
              object DBLookupComboBox2: TDBLookupComboBox
                Left = 90
                Top = -90
                Width = 312
                Height = 21
                DataField = 'descPlanoContas'
                DataSource = srcContas
                TabOrder = 1
                OnEnter = DBLookupComboBox2Enter
                OnExit = DBLookupComboBox2Exit
              end
              object DBEdit22: TDBEdit
                Left = 9
                Top = -43
                Width = 75
                Height = 21
                DataField = 'cd_conta_desconto'
                DataSource = srcContas
                TabOrder = 2
              end
              object DBLookupComboBox3: TDBLookupComboBox
                Left = 90
                Top = -43
                Width = 312
                Height = 21
                DataField = 'descPlanoDesconto'
                DataSource = srcContas
                TabOrder = 3
                OnEnter = DBLookupComboBox3Enter
                OnExit = DBLookupComboBox3Exit
              end
              object DBEdit23: TDBEdit
                Left = 8
                Top = 4
                Width = 76
                Height = 21
                DataField = 'cd_conta_acrescimo'
                DataSource = srcContas
                TabOrder = 4
              end
              object DBLookupComboBox4: TDBLookupComboBox
                Left = 90
                Top = 4
                Width = 312
                Height = 21
                DataField = 'descPlanoAcrescimos'
                DataSource = srcContas
                TabOrder = 5
                OnEnter = DBLookupComboBox4Enter
                OnExit = DBLookupComboBox4Exit
              end
              object DBEdit25: TDBEdit
                Left = 8
                Top = 51
                Width = 76
                Height = 21
                DataField = 'cd_conta_tarifa'
                DataSource = srcContas
                TabOrder = 6
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 90
                Top = 51
                Width = 312
                Height = 21
                DataField = 'descPlanoTarifa'
                DataSource = srcContas
                TabOrder = 7
                OnEnter = DBLookupComboBox5Enter
                OnExit = DBLookupComboBox5Exit
              end
              object DBEdit26: TDBEdit
                Left = 8
                Top = 98
                Width = 76
                Height = 21
                DataField = 'cd_centro_tarifa'
                DataSource = srcContas
                TabOrder = 8
              end
              object DBLookupComboBox6: TDBLookupComboBox
                Left = 90
                Top = 98
                Width = 312
                Height = 21
                DataField = 'descCentroCustos'
                DataSource = srcContas
                TabOrder = 9
                OnEnter = DBLookupComboBox6Enter
                OnExit = DBLookupComboBox6Exit
              end
              object DBEdit27: TDBEdit
                Left = 8
                Top = 145
                Width = 76
                Height = 21
                DataField = 'cd_conta_multa_cp'
                DataSource = srcContas
                TabOrder = 10
              end
              object DBLookupComboBox7: TDBLookupComboBox
                Left = 90
                Top = 145
                Width = 312
                Height = 21
                DataField = 'dsMultaCP'
                DataSource = srcContas
                TabOrder = 11
                OnEnter = DBLookupComboBox7Enter
                OnExit = DBLookupComboBox7Exit
              end
              object DBEdit28: TDBEdit
                Left = 8
                Top = 192
                Width = 76
                Height = 21
                DataField = 'cd_conta_juros_cp'
                DataSource = srcContas
                TabOrder = 12
              end
              object DBLookupComboBox8: TDBLookupComboBox
                Left = 90
                Top = 192
                Width = 312
                Height = 21
                DataField = 'dsJurosCP'
                DataSource = srcContas
                TabOrder = 13
                OnEnter = DBLookupComboBox8Enter
                OnExit = DBLookupComboBox8Exit
              end
              object DBEdit29: TDBEdit
                Left = 8
                Top = 239
                Width = 76
                Height = 21
                DataField = 'cd_conta_desc_cp'
                DataSource = srcContas
                TabOrder = 14
              end
              object DBLookupComboBox9: TDBLookupComboBox
                Left = 90
                Top = 239
                Width = 312
                Height = 21
                DataField = 'dsContaDescCP'
                DataSource = srcContas
                TabOrder = 15
                OnEnter = DBLookupComboBox9Enter
                OnExit = DBLookupComboBox9Exit
              end
            end
          end
          object tsUsuarios: TTabSheet
            Caption = 'Usu'#225'rios'
            ImageIndex = 5
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object cklUsuarios: TCheckListBox
              Left = 0
              Top = 0
              Width = 450
              Height = 219
              OnClickCheck = cklUsuariosClickCheck
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
            end
            object Panel8: TPanel
              Left = 450
              Top = 0
              Width = 31
              Height = 219
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbMarcar: TSpeedButton
                Left = 3
                Top = 4
                Width = 25
                Height = 22
                Hint = 'Ativar todos'
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
              object sbDesmarcar: TSpeedButton
                Left = 3
                Top = 27
                Width = 25
                Height = 22
                Hint = 'Desativar todos'
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
              object sbPadrao: TSpeedButton
                Left = 3
                Top = 56
                Width = 25
                Height = 22
                Hint = 'Definir a conta como padr'#227'o para este usu'#225'rio'
                AllowAllUp = True
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                  C8807FF7777777777FF700000000000000007777777777777777333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
                OnClick = sbPadraoClick
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 219
              Width = 481
              Height = 23
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object DBCheckBox6: TDBCheckBox
                Left = 0
                Top = 4
                Width = 410
                Height = 17
                Caption = 'Aceitar transfer'#234'ncias de qualquer usu'#225'rio.'
                DataField = 'sn_transf_aberta'
                DataSource = srcContas
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 392
        Width = 489
        Height = 179
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBMemo1: TDBMemo
          AlignWithMargins = True
          Left = 11
          Top = 23
          Width = 467
          Height = 156
          Margins.Left = 11
          Margins.Top = 0
          Margins.Right = 11
          Margins.Bottom = 0
          Align = alClient
          DataField = 'ds_observacao'
          DataSource = srcContas
          TabOrder = 0
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 23
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 12
            Top = 7
            Width = 61
            Height = 13
            Caption = 'Observa'#231#227'o:'
            FocusControl = DBMemo1
          end
        end
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 500
      Top = 15
      Width = 537
      Height = 560
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object grd: TDBGrid
        Left = 0
        Top = 34
        Width = 537
        Height = 526
        Align = alClient
        BorderStyle = bsNone
        DataSource = srcContas
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pmQtd
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_caixa'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_caixa'
            Title.Caption = 'Descri'#231#227'o'
            Width = 397
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ativa'
            Title.Caption = 'Ativa'
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 537
        Height = 25
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'CONTAS CADASTRADAS'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnAnoSemestre: TPanel
        Left = 0
        Top = 25
        Width = 537
        Height = 9
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
  end
  object ImageList1: TImageList
    Left = 440
    Top = 400
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object qyContas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyContasCalcFields
    BeforeInsert = qyContasBeforeInsert
    AfterInsert = qyContasAfterInsert
    BeforeEdit = qyContasBeforeEdit
    BeforePost = qyContasBeforePost
    OnNewRecord = qyContasNewRecord
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  fin_cadastro_contas'
      'WHERE'
      '  cd_coligada = :cd_coligada'
      'ORDER BY'
      '  tp_conta,'
      '  ds_caixa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 524
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyContasds_caixa: TStringField
      FieldName = 'ds_caixa'
      Origin = 'WMESTRE12.cadastro_contas.ds_caixa'
      Size = 255
    end
    object qyContasnm_banco: TStringField
      FieldName = 'nm_banco'
      Origin = 'WMESTRE12.cadastro_contas.nm_banco'
      Size = 100
    end
    object qyContasnr_banco: TStringField
      FieldName = 'nr_banco'
      Origin = 'WMESTRE12.cadastro_contas.nr_banco'
      Size = 30
    end
    object qyContasnm_agencia: TStringField
      FieldName = 'nm_agencia'
      Origin = 'WMESTRE12.cadastro_contas.nm_agencia'
      Size = 100
    end
    object qyContasnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'WMESTRE12.cadastro_contas.nr_agencia'
      Size = 30
    end
    object qyContasnr_conta: TStringField
      FieldName = 'nr_conta'
      Origin = 'WMESTRE12.cadastro_contas.nr_conta'
      Size = 30
    end
    object qyContasdt_criacao: TDateTimeField
      FieldName = 'dt_criacao'
      Origin = 'WMESTRE12.cadastro_contas.dt_criacao'
    end
    object qyContassn_ativa: TStringField
      FieldName = 'sn_ativa'
      Origin = 'WMESTRE12.cadastro_contas.sn_ativa'
      FixedChar = True
      Size = 1
    end
    object qyContasds_observacao: TMemoField
      FieldName = 'ds_observacao'
      Origin = 'WMESTRE12.cadastro_contas.ds_observacao'
      BlobType = ftMemo
      Size = 1
    end
    object qyContasativa: TStringField
      FieldKind = fkCalculated
      FieldName = 'ativa'
      Size = 1
      Calculated = True
    end
    object qyContasnr_uso_banco: TStringField
      DisplayLabel = 'N'#186' Uso Banco'
      FieldName = 'nr_uso_banco'
      Origin = 'WMESTRE12.fin_cadastro_contas.nr_uso_banco'
    end
    object qyContasds_mensagem_bloqueto: TMemoField
      DisplayLabel = 'Mensagem do corpo do boleto'
      FieldName = 'ds_mensagem_bloqueto'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_mensagem_bloqueto'
      BlobType = ftMemo
      Size = 1
    end
    object qyContassn_multa: TStringField
      DisplayLabel = 'Aplicar multa'
      FieldName = 'sn_multa'
      Origin = 'WMESTRE12.fin_cadastro_contas.sn_multa'
      FixedChar = True
      Size = 1
    end
    object qyContassn_juros: TStringField
      DisplayLabel = 'Aplicar Juros'
      FieldName = 'sn_juros'
      Origin = 'WMESTRE12.fin_cadastro_contas.sn_juros'
      FixedChar = True
      Size = 1
    end
    object qyContassn_correcao: TStringField
      DisplayLabel = 'Aplicar Corre'#231#227'o Poupan'#231'a'
      FieldName = 'sn_correcao'
      Origin = 'WMESTRE12.fin_cadastro_contas.sn_correcao'
      FixedChar = True
      Size = 1
    end
    object qyContasvl_multa_percent: TFloatField
      DisplayLabel = 'Percentual da Multa'
      FieldName = 'vl_multa_percent'
      Origin = 'WMESTRE12.fin_cadastro_contas.vl_multa_percent'
    end
    object qyContasvl_juros_percent: TFloatField
      DisplayLabel = 'Percentual do Juros'
      FieldName = 'vl_juros_percent'
      Origin = 'WMESTRE12.fin_cadastro_contas.vl_juros_percent'
    end
    object qyContasnr_carteira: TStringField
      DisplayLabel = 'Carteira'
      FieldName = 'nr_carteira'
      Origin = 'WMESTRE12.fin_cadastro_contas.nr_carteira'
    end
    object qyContasnr_convenio: TStringField
      DisplayLabel = 'N'#186' Conv'#234'nio'
      FieldName = 'nr_convenio'
      Origin = 'WMESTRE12.fin_cadastro_contas.nr_convenio'
      Size = 15
    end
    object qyContasnr_transacao: TStringField
      DisplayLabel = 'N'#186' Transa'#231#227'o'
      FieldName = 'nr_transacao'
      Origin = 'WMESTRE12.fin_cadastro_contas.nr_transacao'
      Size = 5
    end
    object qyContascd_coligada: TSmallintField
      FieldName = 'cd_coligada'
      Origin = 'WMESTRE12.fin_cadastro_contas.cd_coligada'
    end
    object qyContasds_identificacao_retorno: TStringField
      FieldName = 'ds_identificacao_retorno'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_identificacao_retorno'
      Size = 30
    end
    object qyContasnm_arquivo_bloqueto: TStringField
      FieldName = 'nm_arquivo_bloqueto'
      Origin = 'WMESTRE12.fin_cadastro_contas.nm_arquivo_bloqueto'
      Size = 50
    end
    object qyContasds_nn_prefixo: TStringField
      DisplayLabel = 'Prefixo do N.N.'
      FieldName = 'ds_nn_prefixo'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_nn_prefixo'
    end
    object qyContasdt_saldo_base: TDateTimeField
      FieldName = 'dt_saldo_base'
      Origin = 'WMESTRE12.fin_cadastro_contas.dt_saldo_base'
    end
    object qyContassn_juros_mensal: TStringField
      FieldName = 'sn_juros_mensal'
      Origin = 'WMESTRE12.fin_cadastro_contas.sn_juros_mensal'
      FixedChar = True
      Size = 1
    end
    object qyContasvl_juros_mensal: TFloatField
      FieldName = 'vl_juros_mensal'
      Origin = 'WMESTRE12.fin_cadastro_contas.vl_juros_mensal'
    end
    object qyContasdescPlanoContas: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlanoContas'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_plano_conta'
      Size = 100
      Lookup = True
    end
    object qyContasdescPlanoDesconto: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlanoDesconto'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta_desconto'
      Size = 100
      Lookup = True
    end
    object qyContasdescPlanoAcrescimos: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlanoAcrescimos'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta_acrescimo'
      Size = 100
      Lookup = True
    end
    object qyContasvl_saldo_inicio: TFloatField
      FieldName = 'vl_saldo_inicio'
      Origin = 'WMESTRE12.fin_cadastro_contas.vl_saldo_inicio'
      DisplayFormat = '###,###,##0.00'
    end
    object qyContasvl_dias_desc_perc: TFloatField
      FieldName = 'vl_dias_desc_perc'
      Origin = 'WMESTRE12.fin_cadastro_contas.vl_dias_desc_perc'
    end
    object qyContassn_saldo_disponivel: TSmallintField
      FieldName = 'sn_saldo_disponivel'
      Origin = 'WMESTRE12.fin_cadastro_contas.sn_saldo_disponivel'
    end
    object qyContasds_categoria: TStringField
      FieldName = 'ds_categoria'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_categoria'
      Size = 100
    end
    object qyContasds_grupo_categoria: TStringField
      FieldName = 'ds_grupo_categoria'
      Origin = 'WMESTRE12.fin_cadastro_contas.ds_grupo_categoria'
      Size = 100
    end
    object qyContasdescPlanoTarifa: TStringField
      FieldKind = fkLookup
      FieldName = 'descPlanoTarifa'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta_tarifa'
      Size = 100
      Lookup = True
    end
    object qyContasdescCentroCustos: TStringField
      FieldKind = fkLookup
      FieldName = 'descCentroCustos'
      LookupDataSet = qyCentros
      LookupKeyFields = 'cd_centro'
      LookupResultField = 'ds_centro'
      KeyFields = 'cd_centro_tarifa'
      Size = 100
      Lookup = True
    end
    object qyContastp_conta: TSmallintField
      FieldName = 'tp_conta'
    end
    object qyContasnr_float_bancario: TSmallintField
      FieldName = 'nr_float_bancario'
    end
    object qyContasnr_ultimo_cheque: TIntegerField
      DisplayLabel = 'N'#186' Ultimo cheque'
      FieldName = 'nr_ultimo_cheque'
    end
    object qyContasnr_nn_ultimo: TIntegerField
      DisplayLabel = 'Seq'#252#234'ncia do N.N.'
      FieldName = 'nr_nn_ultimo'
    end
    object qyContasnr_dias_acrescimo: TIntegerField
      DisplayLabel = 'Car'#234'ncia Acr'#233'scimo'
      FieldName = 'nr_dias_acrescimo'
    end
    object qyContasnr_dias_desconto: TIntegerField
      DisplayLabel = 'Car'#234'ncia Desconto'
      FieldName = 'nr_dias_desconto'
    end
    object qyContascd_boleto_online: TLargeintField
      FieldName = 'cd_boleto_online'
    end
    object qyContascd_plano_conta: TLargeintField
      FieldName = 'cd_plano_conta'
    end
    object qyContascd_conta_desconto: TLargeintField
      FieldName = 'cd_conta_desconto'
    end
    object qyContascd_conta_acrescimo: TLargeintField
      FieldName = 'cd_conta_acrescimo'
    end
    object qyContascd_conta_tarifa: TLargeintField
      FieldName = 'cd_conta_tarifa'
    end
    object qyContascd_centro_tarifa: TLargeintField
      FieldName = 'cd_centro_tarifa'
    end
    object qyContascd_caixa: TIntegerField
      FieldName = 'cd_caixa'
    end
    object qyContassn_transf_aberta: TSmallintField
      FieldName = 'sn_transf_aberta'
    end
    object qyContassn_todas_coligadas: TSmallintField
      FieldName = 'sn_todas_coligadas'
      Required = True
    end
    object qyContascd_conta_desc_cp: TLargeintField
      FieldName = 'cd_conta_desc_cp'
    end
    object qyContascd_conta_multa_cp: TLargeintField
      FieldName = 'cd_conta_multa_cp'
    end
    object qyContascd_conta_juros_cp: TLargeintField
      FieldName = 'cd_conta_juros_cp'
    end
    object qyContasdsContaDescCP: TStringField
      FieldKind = fkLookup
      FieldName = 'dsContaDescCP'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta_desc_cp'
      Size = 50
      Lookup = True
    end
    object qyContasdsMultaCP: TStringField
      FieldKind = fkLookup
      FieldName = 'dsMultaCP'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta_multa_cp'
      Size = 50
      Lookup = True
    end
    object qyContasdsJurosCP: TStringField
      FieldKind = fkLookup
      FieldName = 'dsJurosCP'
      LookupDataSet = qyPlanos
      LookupKeyFields = 'cd_conta'
      LookupResultField = 'ds_conta'
      KeyFields = 'cd_conta_juros_cp'
      Size = 50
      Lookup = True
    end
  end
  object srcContas: TDataSource
    DataSet = qyContas
    OnStateChange = srcContasStateChange
    OnDataChange = srcContasDataChange
    Left = 556
    Top = 217
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 648
    Top = 216
  end
  object qyPlanos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * from fin_config_plano_contas '
      'WHERE cd_coligada_matriz = :cd_coligada '
      'ORDER BY cd_classificacao, ds_conta')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qyCentros: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT * from fin_centro_custos'
      'WHERE cd_coligada = :cd_coligada '
      'ORDER BY cd_classificacao, ds_centro')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qrySelectUsuarios: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      #9'DISTINCT p.cd_pessoa CODIGO,'#9
      #9'CONCAT('
      '      P.NM_PESSOA, '
      #9#9#9'(CASE WHEN'
      #9#9#9#9'C.SN_PADRAO = 1 THEN '#39'- PADR'#195'O'#39
      #9#9#9'ELSE'#9
      #9#9#9#9#39' '#39
      #9#9#9'END)'#9
      '   ) NM_USUARIO,'
      #9' (CASE WHEN'
      '     C.CD_USUARIO is NULL THEN '#39'0'#39
      #9#9'ELSE '#39'1'#39
      #9#9'END) SN_ATIVO,'
      '   C.SN_PADRAO,'
      '   C.CD_CAIXA'
      'FROM'
      #9'pessoas p'
      #9'INNER JOIN nu_grupos_pessoas np ON (p.cd_pessoa = np.cd_pessoa)'
      
        #9'INNER JOIN nu_modulos_acoes nma ON ( nma.ds_chave = '#39'1'#39' AND nma' +
        '.cd_modulo IN (select cd_modulo from nu_modulos where ds_chave =' +
        ' '#39'Academico'#39'))'
      
        #9'INNER JOIN nu_grupos_permissoes ngp ON (ngp.cd_acao = nma.cd_ac' +
        'ao AND np.cd_grupo = ngp.cd_grupo) '
      #9'LEFT JOIN FIN_CONTAS_USUARIOS C ON'
      '         (P.CD_PESSOA = C.CD_USUARIO) AND'
      '         (C.CD_CAIXA = :CD_CAIXA) AND'
      '         (C.CD_COLIGADA = :CD_COLIGADA)'
      'WHERE '
      #9'(p.sn_bloqueado <> 1 AND COALESCE(ngp.nr_permissao,0) <> 0)'
      'ORDER BY'
      #9'NM_USUARIO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qrySelectUsuariosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qrySelectUsuariosNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      ReadOnly = True
      Size = 68
    end
    object qrySelectUsuariosSN_ATIVO: TStringField
      FieldName = 'SN_ATIVO'
      ReadOnly = True
      Size = 1
    end
    object qrySelectUsuariosSN_PADRAO: TSmallintField
      FieldName = 'SN_PADRAO'
    end
    object qrySelectUsuariosCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
      Required = True
    end
  end
  object qryInsertUsuarios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_CONTAS_USUARIOS'
      '   (CD_CAIXA, CD_COLIGADA, CD_USUARIO)'
      'VALUES'
      '   (:CD_CAIXA, :CD_COLIGADA, :CD_USUARIO)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteUsuarios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE FROM'
      '   FIN_CONTAS_USUARIOS'
      'WHERE'
      '   CD_CAIXA = :CD_CAIXA AND'
      '   CD_COLIGADA = :CD_COLIGADA AND'
      '   CD_USUARIO = :CD_USUARIO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateUsuarios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE FIN_CONTAS_USUARIOS'
      'SET SN_PADRAO = 0'
      'WHERE'
      '   CD_COLIGADA = :CD_COLIGADA AND'
      '   CD_USUARIO = :CD_USUARIO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
  end
  object qryReplaceUsuarios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'REPLACE INTO FIN_CONTAS_USUARIOS'
      '   (CD_CAIXA, CD_COLIGADA, CD_USUARIO, SN_PADRAO)'
      'VALUES'
      '   (:CD_CAIXA, :CD_COLIGADA, :CD_USUARIO, 1)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=MERGE INTO FIN_CONTAS_USUARIOS CU USING'#13#10'('#13#10'   SELECT'#13#10'  ' +
        '    :CD_CAIXA CD_CAIXA,'#13#10'      :CD_COLIGADA CD_COLIGADA,'#13#10'      ' +
        ':CD_USUARIO CD_USUARIO'#13#10'   FROM'#13#10'      DUAL'#13#10') UP ON'#13#10'   (CU.CD_' +
        'CAIXA = UP.CD_CAIXA AND'#13#10'    CU.CD_COLIGADA = UP.CD_COLIGADA AND' +
        #13#10'    CU.CD_USUARIO = UP.CD_USUARIO)'#13#10'WHEN MATCHED THEN'#13#10'   UPDA' +
        'TE SET'#13#10'      CU.SN_PADRAO = 1'#13#10'WHEN NOT MATCHED THEN'#13#10'   INSERT' +
        ' (CU.CD_CAIXA, CU.CD_COLIGADA, CU.CD_USUARIO, CU.SN_PADRAO)'#13#10'   ' +
        'VALUES (UP.CD_CAIXA, UP.CD_COLIGADA, UP.CD_USUARIO, 1)'
      
        'mysql-5=REPLACE INTO FIN_CONTAS_USUARIOS'#13#10'   (CD_CAIXA, CD_COLIG' +
        'ADA, CD_USUARIO, SN_PADRAO)'#13#10'VALUES'#13#10'   (:CD_CAIXA, :CD_COLIGADA' +
        ', :CD_USUARIO, 1)')
    Left = 488
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
end
