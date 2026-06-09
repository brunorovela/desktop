object fLiberarJurosDescontos: TfLiberarJurosDescontos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Liberar Juros Descontos'
  ClientHeight = 243
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 6
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbParcela: TLabel
    Left = 60
    Top = 40
    Width = 370
    Height = 13
    AutoSize = False
    Caption = 'Parcela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 39
    Height = 13
    Caption = 'Parcela:'
  end
  object Label3: TLabel
    Left = 8
    Top = 116
    Width = 106
    Height = 13
    Caption = 'Parcelas j'#225' abonadas:'
  end
  object DBCheckBox1: TDBCheckBox
    Left = 60
    Top = 59
    Width = 225
    Height = 17
    Caption = 'Liberar juros ap'#243's vencimento.'
    DataField = 'sn_liberar_juros'
    DataSource = dtcMensalidades
    TabOrder = 0
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 60
    Top = 82
    Width = 225
    Height = 17
    Caption = 'Conceder descontos ap'#243's vencimento.'
    DataField = 'sn_liberar_descontos'
    DataSource = dtcMensalidades
    TabOrder = 1
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 25
    Align = alTop
    Caption = 'Liberar Juros e Descontos'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 260
    Top = 207
    Width = 90
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 356
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object meAbonos: TMemo
    Left = 60
    Top = 143
    Width = 370
    Height = 51
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object dtcMensalidades: TDataSource
    AutoEdit = False
    DataSet = DM.tblMensalidades
    Left = 256
    Top = 88
  end
end
