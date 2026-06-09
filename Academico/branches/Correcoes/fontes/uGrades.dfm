object frmGrades: TfrmGrades
  Left = 135
  Top = 62
  Width = 808
  Height = 580
  Caption = 'Grades Curriculares'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 505
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 0
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 792
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'GRADES CURRICULARES'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 505
    Width = 800
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object btnNovo: TSpeedButton
      Left = 136
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Novo'
      Caption = 'F2 &Novo'
      Flat = True
    end
    object btnAlterar: TSpeedButton
      Left = 217
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Alterar'
      Caption = 'F3 &Alterar'
      Flat = True
    end
    object btnSalvar: TSpeedButton
      Left = 298
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Salvar'
      Caption = 'F4 &Salvar'
      Flat = True
    end
    object btnExcluir: TSpeedButton
      Left = 379
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Excluir'
      Caption = 'F5 E&xcluir'
      Flat = True
    end
    object btnCancelar: TSpeedButton
      Left = 460
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Cancelar'
      Caption = 'F6 &Cancelar'
      Flat = True
    end
    object btnImprimir: TSpeedButton
      Left = 541
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Imprimir'
      Caption = 'F7 Im&primir'
      Flat = True
    end
    object btnSair: TSpeedButton
      Left = 703
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Sair'
      Caption = 'F12 Sai&r'
      Flat = True
      NumGlyphs = 2
      OnClick = btnSairClick
    end
    object btnPesquisar: TSpeedButton
      Left = 622
      Top = 8
      Width = 81
      Height = 25
      Hint = 'Pesquisar'
      Caption = 'F8 P&esquisar'
      Flat = True
    end
    object Navigator: TDBNavigator
      Left = 16
      Top = 8
      Width = 120
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      TabOrder = 0
    end
  end
end

