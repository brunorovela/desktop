object fFiltrosConsulta: TfFiltrosConsulta
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Filtros das Consultas'
  ClientHeight = 314
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 574
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 0
      Top = 221
      Width = 574
      Height = 9
      Align = alBottom
      Shape = bsSpacer
    end
    object Bevel2: TBevel
      Left = 565
      Top = 65
      Width = 9
      Height = 156
      Align = alRight
      Shape = bsSpacer
    end
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 574
      Height = 9
      Align = alTop
      Shape = bsSpacer
    end
    object Bevel4: TBevel
      Left = 0
      Top = 65
      Width = 9
      Height = 156
      Align = alLeft
      Shape = bsSpacer
      Style = bsRaised
    end
    object Panel3: TPanel
      Left = 0
      Top = 9
      Width = 574
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object rbPersonalizar: TRadioButton
        Left = 8
        Top = 32
        Width = 129
        Height = 17
        Caption = 'Personalizar os filtros'
        TabOrder = 0
        OnClick = rbPersonalizarClick
      end
      object rbPadrao: TRadioButton
        Left = 8
        Top = 8
        Width = 233
        Height = 17
        Caption = 'Usar os filtros padr'#227'o (J'#225' cadastrados)'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    object sgFiltros: TStringGrid
      Left = 9
      Top = 65
      Width = 556
      Height = 156
      Align = alClient
      Enabled = False
      TabOrder = 1
      ColWidths = (
        64
        81
        106
        111
        64)
      RowHeights = (
        24
        24
        24
        24
        24)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 252
    Width = 574
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 417
      Top = 22
      Width = 150
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 254
      Top = 22
      Width = 150
      Height = 30
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Kind = bkCancel
    end
    object ckSemprePadrao: TCheckBox
      Left = 8
      Top = 8
      Width = 169
      Height = 17
      Caption = 'Usar sempre os filtros padr'#227'o'
      TabOrder = 2
      OnClick = ckSemprePadraoClick
    end
  end
  object ZReadOnlyQuery1: TUMZQuery
    Params = <>
    Left = 496
  end
  object qyRConsultaFiltros: TUMZQuery
    Connection = DM.ZConn
    Params = <>
    Left = 464
  end
end
