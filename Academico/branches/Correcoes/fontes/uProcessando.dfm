object frmProcessando: TfrmProcessando
  Left = 238
  Top = 232
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Processando...'
  ClientHeight = 70
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 70
    Align = alClient
    TabOrder = 0
    object lblRegistros: TLabel
      Left = 17
      Top = 16
      Width = 49
      Height = 14
      Caption = 'Registros:'
    end
    object Bar: TProgressBar
      Left = 16
      Top = 39
      Width = 257
      Height = 16
      Max = 1000
      Step = 1
      TabOrder = 0
    end
  end
end
