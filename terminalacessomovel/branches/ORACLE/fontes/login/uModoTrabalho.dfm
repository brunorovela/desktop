object fModoTrabalho: TfModoTrabalho
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Modo de Trabalho'
  ClientHeight = 91
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 243
    Height = 13
    Caption = 'Escolha o modo em que este terminal ir'#225' trabalhar:'
  end
  object btModoOffLine: TButton
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    Caption = 'OFF-LINE'
    TabOrder = 0
    OnClick = btModoOffLineClick
  end
  object btModoOnline: TButton
    Left = 168
    Top = 48
    Width = 75
    Height = 25
    Caption = 'ON-LINE'
    TabOrder = 1
    OnClick = btModoOnlineClick
  end
end
