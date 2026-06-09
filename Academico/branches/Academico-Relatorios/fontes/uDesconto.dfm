object frmDesconto: TfrmDesconto
  Left = 233
  Top = 169
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Desconto...'
  ClientHeight = 213
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 282
    Height = 213
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 8
      Top = 8
      Width = 265
      Height = 161
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 97
        Width = 94
        Height = 16
        Caption = 'Desconto Extra:'
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 125
        Height = 16
        Caption = 'Desconto Percentual:'
      end
      object Label3: TLabel
        Left = 44
        Top = 129
        Width = 66
        Height = 16
        Caption = 'Valor Final:'
      end
      object EditValor: TDBEdit
        Left = 120
        Top = 93
        Width = 121
        Height = 24
        DataField = 'DescontoExtra'
        DataSource = DM.dtcMensalidades
        TabOrder = 1
        OnEnter = txtDescontoEnter
        OnKeyPress = EditValorKeyPress
      end
      object txtDesconto: TEdit
        Left = 152
        Top = 60
        Width = 89
        Height = 24
        TabOrder = 0
        OnEnter = txtDescontoEnter
        OnKeyPress = txtDescontoKeyPress
      end
      object pnlValor: TPanel
        Left = 12
        Top = 8
        Width = 241
        Height = 41
        Alignment = taRightJustify
        Caption = 'pnlValor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object EditFinal: TEdit
        Left = 120
        Top = 124
        Width = 121
        Height = 24
        TabOrder = 2
        OnEnter = EditFinalEnter
        OnKeyPress = EditFinalKeyPress
      end
    end
    object btnOk: TBitBtn
      Left = 116
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Ok'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 196
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Kind = bkCancel
    end
  end
end

