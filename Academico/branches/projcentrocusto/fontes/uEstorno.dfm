object frmEstorno: TfrmEstorno
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Estorno'
  ClientHeight = 306
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnlEstorno: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 306
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object pnTopo: TPanel
      Left = 0
      Top = 0
      Width = 476
      Height = 25
      Align = alTop
      Caption = 'REGISTRAR MOTIVO ESTORNO'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlPrincipal: TPanel
      Left = 0
      Top = 25
      Width = 476
      Height = 240
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object meMotivo: TMemo
        Left = 0
        Top = 0
        Width = 476
        Height = 240
        Align = alClient
        TabOrder = 0
      end
    end
    object pnlBotton: TPanel
      Left = 0
      Top = 265
      Width = 476
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object btnSalvar: TBitBtn
        Left = 197
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = SalvarClick
      end
    end
  end
end
