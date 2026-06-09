object frmTesourariaCompensar: TfrmTesourariaCompensar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Compensa'#231#227'o de Movimento'
  ClientHeight = 180
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 88
    Width = 98
    Height = 13
    Caption = 'Compensar na data:'
  end
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 293
    Height = 11
    Align = alTop
    Shape = bsSpacer
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 46
    Height = 13
    Caption = 'C'#243'd. Mov'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 50
    Height = 13
    Caption = 'N'#250'm. Doc.'
  end
  object Label4: TLabel
    Left = 152
    Top = 40
    Width = 65
    Height = 13
    Caption = 'N'#250'm. Cheque'
  end
  object dtpCompensar: TDateTimePicker
    Left = 152
    Top = 104
    Width = 121
    Height = 21
    Date = 38608.790178333340000000
    Format = 'dd/MM/yyyy'
    Time = 38608.790178333340000000
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'COMPENSAR MOVIMENTO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edCodMov: TEdit
    Left = 8
    Top = 56
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edNumDoc: TEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edNumChe: TEdit
    Left = 152
    Top = 56
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 98
    Top = 145
    Width = 90
    Height = 25
    Caption = 'Confirmar'
    Default = True
    ModalResult = 1
    TabOrder = 5
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Left = 194
    Top = 145
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    Kind = bkCancel
  end
end

