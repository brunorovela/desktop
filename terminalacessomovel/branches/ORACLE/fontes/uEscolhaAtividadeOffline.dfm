object fEscolheAtividadeOffline: TfEscolheAtividadeOffline
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Escolha a sua Atividade'
  ClientHeight = 85
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbAtividadeEscolha: TLabel
    Left = 8
    Top = 8
    Width = 199
    Height = 13
    Caption = 'Escolha uma atividade que deseja entrar:'
  end
  object cbAtividades: TComboBox
    Left = 8
    Top = 27
    Width = 413
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
  end
  object btEntrar: TButton
    Left = 176
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btEntrarClick
  end
end
