object fDefineSQL: TfDefineSQL
  Left = 0
  Top = 0
  Width = 467
  Height = 361
  Caption = 'Defina o SQL da Consulta abaixo:'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 459
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancelar: TBitBtn
      Left = 332
      Top = 6
      Width = 125
      Height = 31
      TabOrder = 0
      Kind = bkCancel
    end
    object btnOk: TBitBtn
      Left = 199
      Top = 6
      Width = 125
      Height = 31
      TabOrder = 1
      Kind = bkOK
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 285
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 454
      Top = 5
      Width = 5
      Height = 275
      Align = alRight
      Shape = bsSpacer
    end
    object Bevel3: TBevel
      Left = 0
      Top = 280
      Width = 459
      Height = 5
      Align = alBottom
      Shape = bsSpacer
    end
    object Bevel4: TBevel
      Left = 0
      Top = 0
      Width = 459
      Height = 5
      Align = alTop
      Shape = bsSpacer
    end
    object Bevel5: TBevel
      Left = 0
      Top = 5
      Width = 5
      Height = 275
      Align = alLeft
      Shape = bsSpacer
    end
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 449
      Height = 275
      Align = alClient
      BevelKind = bkSoft
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel2: TBevel
        Left = 0
        Top = 23
        Width = 5
        Height = 243
        Align = alLeft
        Shape = bsSpacer
      end
      object Bevel6: TBevel
        Left = 0
        Top = 18
        Width = 445
        Height = 5
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel7: TBevel
        Left = 440
        Top = 23
        Width = 5
        Height = 243
        Align = alRight
        Shape = bsSpacer
      end
      object Bevel8: TBevel
        Left = 0
        Top = 266
        Width = 445
        Height = 5
        Align = alBottom
        Shape = bsSpacer
      end
      object pnLinhas: TPanel
        Left = 0
        Top = 0
        Width = 445
        Height = 18
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '   6 Linhas'
        TabOrder = 0
      end
      object meSQL: TMemo
        Left = 5
        Top = 23
        Width = 435
        Height = 243
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = meSQLKeyDown
        OnKeyPress = meSQLKeyPress
      end
    end
  end
end
