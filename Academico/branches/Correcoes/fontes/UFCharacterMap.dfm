object frmCharacterMap: TfrmCharacterMap
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Lista de '#205'cones'
  ClientHeight = 355
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbxCharMap: TScrollBox
    Left = 0
    Top = 0
    Width = 506
    Height = 355
    HorzScrollBar.Visible = False
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object fpnCharMap: TFlowPanel
      Left = 0
      Top = 0
      Width = 506
      Height = 32
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
end
