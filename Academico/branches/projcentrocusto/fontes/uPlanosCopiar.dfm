object frmPlanosCopiar: TfrmPlanosCopiar
  Left = 257
  Top = 233
  BorderStyle = bsDialog
  Caption = 'Copiar Planos de Pagamento'
  ClientHeight = 247
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 412
    Height = 10
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel1: TBevel
    Left = 0
    Top = 35
    Width = 412
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 40
    Width = 412
    Height = 26
    Align = alTop
    Shape = bsSpacer
  end
  object Label1: TLabel
    Left = 8
    Top = 46
    Width = 76
    Height = 13
    Caption = 'Nome do Plano:'
  end
  object lbNomePlano: TLabel
    Left = 90
    Top = 46
    Width = 90
    Height = 13
    Caption = 'NOME DO PLANO'
  end
  object Bevel4: TBevel
    Left = 0
    Top = 91
    Width = 412
    Height = 118
    Align = alTop
    Shape = bsSpacer
  end
  object Label2: TLabel
    Left = 53
    Top = 100
    Width = 48
    Height = 13
    Caption = 'Ano/Sem:'
  end
  object Label4: TLabel
    Left = 50
    Top = 133
    Width = 51
    Height = 13
    Caption = 'A partir de:'
  end
  object Panel3: TPanel
    Left = 0
    Top = 10
    Width = 412
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'COPIAR PLANO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 143
    Top = 215
    Width = 129
    Height = 28
    Caption = '&Confirmar'
    TabOrder = 1
    Kind = bkAll
  end
  object BitBtn2: TBitBtn
    Left = 279
    Top = 214
    Width = 129
    Height = 28
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object Panel1: TPanel
    Left = 0
    Top = 66
    Width = 412
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'NOVO PLANO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object edAnosemestre: TMaskEdit
    Left = 117
    Top = 97
    Width = 52
    Height = 21
    EditMask = '9999/9;0;_'
    MaxLength = 6
    TabOrder = 4
  end
  object UpDown1: TUpDown
    Left = 168
    Top = 97
    Width = 17
    Height = 21
    Min = -100
    TabOrder = 5
    OnClick = UpDown1Click
  end
  object dtpAPartirDe: TDateTimePicker
    Left = 117
    Top = 128
    Width = 81
    Height = 21
    Date = 40821.381394108790000000
    Time = 40821.381394108790000000
    TabOrder = 6
  end
  object ckbCalcularParcelas: TCheckBox
    Left = 117
    Top = 156
    Width = 146
    Height = 17
    Caption = 'Calcular Parcelas'
    TabOrder = 7
  end
  object ckbCopiarTurmas: TCheckBox
    Left = 117
    Top = 179
    Width = 146
    Height = 17
    Caption = 'Copiar Turmas'
    TabOrder = 8
  end
end
