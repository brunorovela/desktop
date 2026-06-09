object fGrupoDuplicar: TfGrupoDuplicar
  Left = 0
  Top = 0
  ActiveControl = edtNomeGrupo
  BorderStyle = bsDialog
  Caption = 'UNIMESTRE'
  ClientHeight = 118
  ClientWidth = 246
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
  object lblTexto: TLabel
    Left = 16
    Top = 16
    Width = 172
    Height = 13
    Caption = 'Informe o nome para o novo grupo:'
  end
  object lblAlerta: TLabel
    Left = 16
    Top = 62
    Width = 193
    Height = 13
    Caption = 'O nome informado j'#225' est'#225' em uso.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object edtNomeGrupo: TEdit
    Left = 16
    Top = 35
    Width = 209
    Height = 21
    TabOrder = 0
    OnChange = edtNomeGrupoChange
    OnExit = edtNomeGrupoExit
  end
  object btnOk: TButton
    Left = 75
    Top = 85
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancelar: TButton
    Left = 150
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
end
