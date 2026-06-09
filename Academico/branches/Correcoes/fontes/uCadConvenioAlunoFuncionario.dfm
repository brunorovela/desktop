object frmCadConveioPessoa: TfrmCadConveioPessoa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Aluno/Funcion'#225'rio Conv'#234'nio'
  ClientHeight = 167
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbPessoa: TLabel
    Left = 8
    Top = 73
    Width = 34
    Height = 13
    Caption = 'Pessoa'
  end
  object sbSelecionarPessoa: TSpeedButton
    Left = 367
    Top = 89
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
    OnClick = sbSelecionarPessoaClick
  end
  object lbCargoCriterio: TLabel
    Left = 8
    Top = 31
    Width = 160
    Height = 13
    Caption = 'Nome do Cargo/N'#237'vel na Empresa'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 25
    Align = alTop
    Caption = 'CADASTRO DE ALUNO/FUNCION'#193'RIO CONVENIADO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 142
    Width = 422
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'tbBotoesAcao'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmCadConvenioPgto.imgBotoes
    List = True
    ShowCaptions = True
    TabOrder = 1
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tpSeparador1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 84
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton14: TToolButton
      Left = 172
      Top = 0
      Width = 8
      Caption = 'tpSeparador2'
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object txtNomeEmpresa: TEdit
    Left = 8
    Top = 89
    Width = 353
    Height = 21
    ReadOnly = True
    TabOrder = 2
    OnClick = txtNomeEmpresaClick
  end
  object dbCriterio: TDBLookupComboBox
    Left = 8
    Top = 50
    Width = 273
    Height = 21
    DataField = 'cd_convenio_criterio'
    DataSource = frmCadConvenioPgto.dsAlunosFuncionarios
    KeyField = 'cd_convenio_criterio'
    ListField = 'ds_cargo'
    ListSource = frmCadConvenioPgto.dsCriterios
    TabOrder = 3
  end
end
