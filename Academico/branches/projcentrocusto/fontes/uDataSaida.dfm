object frmDataSaida: TfrmDataSaida
  Left = 213
  Top = 197
  BorderStyle = bsDialog
  Caption = 'Data de Sa'#237'da:'
  ClientHeight = 41
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 7
    Top = 12
    Width = 204
    Height = 19
    Caption = 'Confirmar a Data de Sa'#237'da:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 232
    Top = 8
    Width = 121
    Height = 27
    DataField = 'DataSaida'
    DataSource = DM.dtcMatriculas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = DBEdit1KeyPress
  end
end

