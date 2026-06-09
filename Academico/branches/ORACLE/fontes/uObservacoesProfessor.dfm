object frm_Professores_Obs: Tfrm_Professores_Obs
  Left = 436
  Top = 292
  BorderStyle = bsDialog
  Caption = 'Observa'#231#245'es das turmas do professor'
  ClientHeight = 336
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object btnFechar: TSpeedButton
    Left = 410
    Top = 300
    Width = 87
    Height = 25
    Hint = 'Imprimir'
    Caption = 'F12 Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = btnFecharClick
  end
  object mem: TDBMemo
    Left = 10
    Top = 10
    Width = 487
    Height = 279
    DataField = 'ds_obs_sistema'
    DataSource = frmProfessores.dsObsProfessor
    ScrollBars = ssVertical
    TabOrder = 0
  end
end

