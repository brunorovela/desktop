object frmTableFields: TfrmTableFields
  Left = 541
  Top = 111
  BorderStyle = bsSizeToolWin
  Caption = 'Sele'#231#227'o'
  ClientHeight = 351
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Tree: TTreeView
    Left = 0
    Top = 0
    Width = 563
    Height = 351
    Align = alClient
    DragMode = dmAutomatic
    Indent = 19
    TabOrder = 0
    OnDragDrop = TreeDragDrop
  end
  object qyProvas: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 24
    Top = 24
  end
end
