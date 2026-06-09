object fEscolheAtividade: TfEscolheAtividade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Escolha a sua Atividade'
  ClientHeight = 149
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbListaEventos: TLabel
    Left = 8
    Top = 8
    Width = 138
    Height = 13
    Caption = 'Lista de eventos dispon'#237'veis:'
  end
  object lbAtividadeEscolha: TLabel
    Left = 8
    Top = 62
    Width = 199
    Height = 13
    Caption = 'Escolha uma atividade que deseja entrar:'
  end
  object btEntrar: TButton
    Left = 176
    Top = 117
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = btEntrarClick
  end
  object cbEventos: TComboBox
    Left = 8
    Top = 27
    Width = 413
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
    OnChange = cbEventosChange
  end
  object cbAtividades: TComboBox
    Left = 8
    Top = 81
    Width = 413
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 16
    TabOrder = 2
  end
end
