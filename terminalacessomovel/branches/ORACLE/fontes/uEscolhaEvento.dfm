object fEscolhaEventos: TfEscolhaEventos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Escolha o evento para finalizar.'
  ClientHeight = 88
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbListaEventos: TLabel
    Left = 8
    Top = 8
    Width = 83
    Height = 13
    Caption = 'Lista de eventos:'
  end
  object cbEventos: TComboBox
    Left = 8
    Top = 27
    Width = 427
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
