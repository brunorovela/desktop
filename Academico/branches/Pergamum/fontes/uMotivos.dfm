object frmMotivos: TfrmMotivos
  Left = 213
  Top = 243
  ActiveControl = txtMotivo
  BorderStyle = bsDialog
  Caption = 'Motivo...'
  ClientHeight = 129
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Tag = 1
    Left = 49
    Top = 11
    Width = 34
    Height = 14
    Caption = 'Motivo:'
  end
  object Label2: TLabel
    Tag = 1
    Left = 8
    Top = 103
    Width = 75
    Height = 14
    Caption = 'Autorizado por:'
  end
  object pnlUsuario: TPanel
    Left = 88
    Top = 98
    Width = 185
    Height = 25
    Caption = 'pnlUsuario'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 98
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
    Style = bsNew
  end
  object btnCancelar: TBitBtn
    Tag = 1
    Left = 360
    Top = 98
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
    Kind = bkCancel
    Style = bsNew
  end
  object txtMotivo: TDBMemo
    Left = 88
    Top = 8
    Width = 353
    Height = 81
    DataField = 'Motivo'
    DataSource = DM.dtcMotivos
    TabOrder = 3
  end
end
