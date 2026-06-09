object frmExemplosSDK: TfrmExemplosSDK
  Left = 200
  Top = 140
  Width = 696
  Height = 480
  Caption = 'Exemplos SDK'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 24
    object OffLine1: TMenuItem
      Caption = 'Inner OffLine'
      OnClick = OffLine1Click
    end
    object InnerOnLine1: TMenuItem
      Caption = 'Inner OnLine'
    end
    object InnerBio1: TMenuItem
      Caption = 'Inner Bio'
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre'
    end
  end
end
