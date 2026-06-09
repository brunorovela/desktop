object fmtabbusca: Tfmtabbusca
  Left = 243
  Top = 222
  Caption = 'Selecionar dados'
  ClientHeight = 261
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object grseleciona: TDBGrid
    Left = 0
    Top = 0
    Width = 482
    Height = 217
    Align = alClient
    DataSource = dsSelecao
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 217
    Width = 482
    Height = 44
    Align = alBottom
    TabOrder = 0
    object buAceitar: TButton
      Left = 10
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Aceitar'
      TabOrder = 0
      OnClick = buAceitarClick
    end
    object buFechar: TButton
      Left = 92
      Top = 12
      Width = 75
      Height = 25
      Caption = 'F12 &Fechar'
      TabOrder = 1
      OnClick = buFecharClick
    end
  end
  object dsSelecao: TDataSource
    DataSet = quSelecao
    Left = 138
    Top = 94
  end
  object quSelecao: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 192
    Top = 96
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 656
    Top = 293
  end
end
