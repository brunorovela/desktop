object frmCadDeficienciasCampos: TfrmCadDeficienciasCampos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Necessidades Especiais'
  ClientHeight = 354
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvInfoPessoa: TBevel
    Left = 9
    Top = 34
    Width = 373
    Height = 26
  end
  object lbInfoPessoa: TLabel
    Left = 16
    Top = 40
    Width = 38
    Height = 13
    Caption = 'Pessoa:'
  end
  object lbPessoa: TLabel
    Left = 60
    Top = 40
    Width = 321
    Height = 14
    AutoSize = False
    Caption = 'lbPessoa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Cadastro de Necessidades Especiais'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 65
    Width = 392
    Height = 289
    Align = alBottom
    TabOrder = 1
  end
end
