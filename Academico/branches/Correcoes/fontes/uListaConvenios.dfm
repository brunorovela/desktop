object fListaConvenios: TfListaConvenios
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Lista de Conv'#234'nios'
  ClientHeight = 294
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object treeofConvenios: TTreeView
    Left = 0
    Top = 0
    Width = 426
    Height = 294
    Align = alClient
    Indent = 19
    TabOrder = 0
    OnMouseDown = treeofConveniosMouseDown
  end
  object qConveniados: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from '
      'instituicoes_ensino '
      'where '
      'sn_convenio=1'
      'order by nm_instituicao asc')
    Params = <>
    Left = 40
    Top = 24
  end
end
