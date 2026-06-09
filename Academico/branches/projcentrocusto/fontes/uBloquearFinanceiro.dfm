object frmBloquearFinanceiro: TfrmBloquearFinanceiro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Bloquear altera'#231#245'es financeiras'
  ClientHeight = 337
  ClientWidth = 389
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
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 149
    Height = 13
    Caption = 'Selecione a Unidade de Ensino:'
  end
  object lbData: TLabel
    Left = 24
    Top = 125
    Width = 150
    Height = 13
    Caption = 'Selecione a data de refer'#234'ncia:'
  end
  object Label3: TLabel
    Left = 24
    Top = 83
    Width = 129
    Height = 13
    Caption = 'Selecione uma das op'#231#245'es:'
  end
  object Label2: TLabel
    Left = 24
    Top = 187
    Width = 129
    Height = 13
    Caption = 'Selecione uma das op'#231#245'es:'
  end
  object lbBoleto: TLabel
    Left = 24
    Top = 229
    Width = 150
    Height = 13
    Caption = 'Selecione a data de refer'#234'ncia:'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BLOQUEAR FINANCEIRO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object cbUnidadesMatriz: TComboBox
    Left = 24
    Top = 56
    Width = 337
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = cbUnidadesMatrizChange
  end
  object dtBloqueio: TDateTimePicker
    Left = 24
    Top = 141
    Width = 337
    Height = 21
    Date = 39281.720328807870000000
    Time = 39281.720328807870000000
    TabOrder = 2
  end
  object cbOpcoes: TComboBox
    Left = 24
    Top = 98
    Width = 337
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Liberar altera'#231#245'es com datas inferiores'
    OnChange = cbOpcoesChange
    Items.Strings = (
      'Liberar altera'#231#245'es com datas inferiores'
      'Bloquear altera'#231#245'es com datas inferiores')
  end
  object btnConfirmar: TBitBtn
    Left = 186
    Top = 299
    Width = 92
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = btnConfirmarClick
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
  object btnCancelar: TBitBtn
    Left = 280
    Top = 299
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object cbBloqueto: TComboBox
    Left = 24
    Top = 202
    Width = 337
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = 'Liberar impress'#227'o de boletos em qualquer data'
    OnChange = cbOpcoesChange
    Items.Strings = (
      'Liberar impress'#227'o de boletos em qualquer data'
      'Bloquear impress'#227'o de boletos com vencimento a partir de')
  end
  object dtBoleto: TDateTimePicker
    Left = 24
    Top = 245
    Width = 337
    Height = 21
    Date = 39281.720328807870000000
    Time = 39281.720328807870000000
    TabOrder = 7
  end
  object qryBloqueiaFin: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE'
      '   COLIGADAS_MATRIZ'
      'SET'
      '   SN_BLOQUEAR_FINANCEIRO = :SN_BLOQUEAR_FINANCEIRO,'
      '   DT_BLOQUEIO_FINANCEIRO = :DT_BLOQUEIO_FINANCEIRO,'
      '   SN_BLOQUEAR_BOLETO = :SN_BLOQUEAR_BOLETO,'
      '   DT_BLOQUEIO_BOLETO = :DT_BLOQUEIO_BOLETO'
      'WHERE'
      '   CD_COLIGADA = :CD_COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'SN_BLOQUEAR_FINANCEIRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BLOQUEIO_FINANCEIRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_BLOQUEAR_BOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BLOQUEIO_BOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN_BLOQUEAR_FINANCEIRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BLOQUEIO_FINANCEIRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SN_BLOQUEAR_BOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_BLOQUEIO_BOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
  end
end
