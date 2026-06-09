object frm_Grade_Professor: Tfrm_Grade_Professor
  Left = 293
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Professor da Disciplina'
  ClientHeight = 100
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 56
    Width = 417
    Height = 5
    Style = bsRaised
  end
  object bvProfessor: TBevel
    Left = 8
    Top = 8
    Width = 417
    Height = 41
  end
  object lbProfessor: TLabel
    Left = 16
    Top = 20
    Width = 89
    Height = 19
    Caption = 'lbProfessor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnFechar: TButton
    Left = 335
    Top = 66
    Width = 89
    Height = 25
    Caption = 'F12 Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
end

