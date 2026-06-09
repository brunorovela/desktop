object FrmEasyInnerOffLine: TFrmEasyInnerOffLine
  Left = 454
  Top = 345
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo OffLine EasyInner.dll'
  ClientHeight = 507
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnvia: TLabel
    Left = 327
    Top = 342
    Width = 3
    Height = 13
  end
  object lblBilhetes: TLabel
    Left = 114
    Top = 482
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 136
    Top = 342
    Width = 86
    Height = 13
    Caption = 'Bilhetes coletados'
  end
  object btnEnviar: TButton
    Left = 8
    Top = 336
    Width = 121
    Height = 25
    Caption = '&Enviar Configura'#231#245'es'
    TabOrder = 0
    OnClick = btnEnviarClick
  end
  object btnReceber: TButton
    Left = 8
    Top = 475
    Width = 97
    Height = 25
    Caption = '&Receber Bilhetes'
    TabOrder = 1
    OnClick = btnReceberClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 7
    Width = 465
    Height = 322
    Caption = 'Configura'#231#245'es'
    TabOrder = 2
    object lblInner: TLabel
      Left = 6
      Top = 22
      Width = 67
      Height = 13
      Caption = 'N'#250'mero Inner:'
    end
    object lblTipoConexao: TLabel
      Left = 6
      Top = 101
      Width = 69
      Height = 13
      Caption = 'Tipo Conex'#227'o:'
    end
    object lblPorta: TLabel
      Left = 6
      Top = 75
      Width = 28
      Height = 13
      Caption = 'Porta:'
    end
    object lblQdtDigitos: TLabel
      Left = 6
      Top = 49
      Width = 92
      Height = 13
      Caption = 'N'#250'mero de D'#237'gitos:'
    end
    object lblTipoLeitor: TLabel
      Left = 6
      Top = 150
      Width = 53
      Height = 13
      Caption = 'Tipo Leitor:'
    end
    object lblTipoEquipamento: TLabel
      Left = 6
      Top = 126
      Width = 89
      Height = 13
      Caption = 'Tipo Equipamento:'
    end
    object Label1: TLabel
      Left = 46
      Top = 208
      Width = 56
      Height = 13
      Caption = 'Par'#226'metros:'
    end
    object lblCatraca: TLabel
      Left = 8
      Top = 178
      Width = 194
      Height = 13
      Caption = 'Ao entrar, a catraca est'#225' instalada '#224' sua:'
      Enabled = False
    end
    object imgCatraca: TImage
      Left = 360
      Top = 152
      Width = 65
      Height = 57
      Stretch = True
    end
    object Label3: TLabel
      Left = 271
      Top = 96
      Width = 71
      Height = 13
      Caption = 'Padr'#227'o Cart'#227'o:'
    end
    object TGroupBox
      Left = 215
      Top = 176
      Width = 136
      Height = 33
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 20
      object optEsquerda: TRadioButton
        Left = 5
        Top = 11
        Width = 73
        Height = 17
        Caption = 'Esquerda'
        Enabled = False
        TabOrder = 0
        OnClick = optEsquerdaClick
      end
      object optDireita: TRadioButton
        Left = 79
        Top = 11
        Width = 55
        Height = 17
        Caption = 'Direita'
        Enabled = False
        TabOrder = 1
        OnClick = optDireitaClick
      end
    end
    object txtNumInner: TEdit
      Left = 100
      Top = 22
      Width = 60
      Height = 21
      MaxLength = 5
      TabOrder = 0
      Text = '1'
    end
    object cboTipoConexao: TComboBox
      Left = 100
      Top = 98
      Width = 165
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnClick = cboTipoConexaoClick
    end
    object txtPorta: TEdit
      Left = 100
      Top = 73
      Width = 60
      Height = 21
      MaxLength = 5
      TabOrder = 2
      Text = '3570'
    end
    object txtDigitos: TEdit
      Left = 100
      Top = 47
      Width = 60
      Height = 21
      TabOrder = 3
      Text = '14'
    end
    object cboTipoLeitor: TComboBox
      Left = 100
      Top = 149
      Width = 165
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = cboTipoLeitorChange
      OnClick = cboTipoConexaoClick
    end
    object chkDoisLeitores: TCheckBox
      Left = 278
      Top = 149
      Width = 78
      Height = 17
      Caption = '2 Leitores?'
      Enabled = False
      TabOrder = 5
    end
    object GroupBox3: TGroupBox
      Left = 180
      Top = 17
      Width = 277
      Height = 64
      Caption = 'Vers'#227'o'
      TabOrder = 6
      object lblVersao: TMemo
        Left = 5
        Top = 16
        Width = 268
        Height = 41
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object cboEquipamento: TComboBox
      Left = 100
      Top = 123
      Width = 205
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      OnChange = cboEquipamentoChange
      OnClick = cboTipoConexaoClick
      Items.Strings = (
        'Coletor'
        'Catraca 2 Sentidos'
        'Catraca para Entrada'
        'Catraca para Sa'#237'da'
        'Catraca Sa'#237'da Liberada'
        'Catraca Entrada Liberada'
        'Catraca Liberada 2 Sentidos'
        'Catraca Sentido Giro')
    end
    object chkHorarios: TCheckBox
      Left = 117
      Top = 223
      Width = 60
      Height = 17
      Caption = '&Hor'#225'rios'
      TabOrder = 8
    end
    object chkLista: TCheckBox
      Left = 117
      Top = 246
      Width = 44
      Height = 17
      Caption = '&Lista'
      TabOrder = 9
    end
    object chkBio: TCheckBox
      Left = 213
      Top = 223
      Width = 66
      Height = 16
      Caption = 'Biometria'
      TabOrder = 10
      OnClick = chkBioClick
    end
    object chkRelogio: TCheckBox
      Left = 317
      Top = 224
      Width = 60
      Height = 17
      Caption = '&Rel'#243'gio'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object chkMensagem: TCheckBox
      Left = 317
      Top = 269
      Width = 78
      Height = 17
      Caption = '&Mensagens'
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
    object chkSirene: TCheckBox
      Left = 117
      Top = 267
      Width = 57
      Height = 17
      Caption = '&Sirene'
      TabOrder = 13
    end
    object chkTeclado: TCheckBox
      Left = 317
      Top = 246
      Width = 60
      Height = 17
      Caption = 'Teclado'
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
    object chkListaBio: TCheckBox
      Left = 211
      Top = 245
      Width = 85
      Height = 17
      Hint = 'Usu'#225'rios sem Biometria'
      Caption = 'Lista sem Bio'
      Enabled = False
      TabOrder = 15
      OnClick = chkListaBioClick
    end
    object chkVerificacao: TCheckBox
      Left = 211
      Top = 268
      Width = 74
      Height = 17
      Caption = 'Verifica'#231#227'o'
      Enabled = False
      TabOrder = 16
      OnClick = chkVerificacaoClick
    end
    object chkIdentificacao: TCheckBox
      Left = 211
      Top = 291
      Width = 81
      Height = 17
      Caption = 'Identifica'#231#227'o'
      Enabled = False
      TabOrder = 17
    end
    object rdbPadraoLivre: TRadioButton
      Left = 348
      Top = 97
      Width = 53
      Height = 17
      Caption = '&Livre'
      Checked = True
      TabOrder = 18
      TabStop = True
    end
    object rdbPadraoTopdata: TRadioButton
      Left = 396
      Top = 97
      Width = 61
      Height = 17
      Caption = '&Topdata'
      TabOrder = 19
      OnClick = rdbPadraoTopdataClick
    end
    object txtCatraoMaster: TEdit
      Left = 16
      Top = 288
      Width = 97
      Height = 21
      Enabled = False
      TabOrder = 21
      Text = '0'
    end
    object chkCartaoMaster: TCheckBox
      Left = 16
      Top = 264
      Width = 89
      Height = 14
      Caption = 'Cart'#227'o Master'
      TabOrder = 22
      OnClick = chkCartaoMasterClick
    end
  end
  object lstBilhetes: TListBox
    Left = 8
    Top = 367
    Width = 465
    Height = 98
    ItemHeight = 13
    ScrollWidth = 1
    TabOrder = 3
  end
end
