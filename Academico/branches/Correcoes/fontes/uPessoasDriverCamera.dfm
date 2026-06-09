object fWebcamDriver: TfWebcamDriver
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecione o driver de v'#237'deo'
  ClientHeight = 64
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cbDriverList: TComboBox
    Left = 8
    Top = 8
    Width = 219
    Height = 19
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    OnSelect = cbDriverListSelect
  end
  object bbtnSelect: TBitBtn
    Left = 136
    Top = 33
    Width = 91
    Height = 25
    Caption = 'Selecionar'
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object filterGraph: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 8
    Top = 32
  end
  object filter: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = filterGraph
    Left = 40
    Top = 32
  end
  object sampGrabber: TSampleGrabber
    FilterGraph = filterGraph
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 72
    Top = 32
  end
end
