object frmImpMens: TfrmImpMens
  Left = 307
  Top = 218
  ActiveControl = radSelecionado
  BorderStyle = bsDialog
  Caption = 'Imprimir...'
  ClientHeight = 346
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 346
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object sbPropriedades: TSpeedButton
      Left = 7
      Top = 312
      Width = 81
      Height = 25
      Caption = 'Configurar'
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000001F7C10421042000000001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000D5561F7CCE39000000001042CE3900001F7C
        1F7C1F7C1F7C1F7C1F7C1042CE39396739671F7C744E524A524A10420000CE39
        00001F7C1F7C1F7C1042CE395A6B39671F7C1F7C744E524A524A524A10420000
        00001F7C1F7C1F7C1042DE7B39671F7C1F7CDE7B524A744E524A104210421042
        CE3900001F7C1F7C1042DE7B1F7CDE7BDE7B396739673967524A524A1042CE39
        CE3900001F7C1F7C1042DE7BDE7B5A6B5A6B007C0564396739671F7C10421042
        CE3900001F7C1F7C1042DE7B7B6FE0034032396739675A6BCE3910420000CE39
        CE3900001F7C1F7C1F7C104210427B6F5A6B5A6B1042CE391F7C1F7C0000CE39
        CE391F7C1F7C1F7C1F7C1F7C1F7C1042DE7BCE391F7C1F7C7B6F9B6F7B6F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10429B6FBC73BD77DE7B7B6F
        000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042BD77BD77DE7B1042
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104210421F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      OnClick = sbPropriedadesClick
    end
    object grp1: TGroupBox
      Left = 7
      Top = 104
      Width = 274
      Height = 105
      Caption = ' Boletos '
      TabOrder = 0
      OnEnter = grp1Enter
      object Label1: TLabel
        Left = 172
        Top = 21
        Width = 18
        Height = 14
        Caption = 'at'#233':'
      end
      object sbBloqueaConta: TSpeedButton
        Left = 226
        Top = 46
        Width = 23
        Height = 21
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
          333333333F777773FF333333008888800333333377333F3773F3333077870787
          7033333733337F33373F3308888707888803337F33337F33337F330777880887
          7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
          7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
          00333337777777777733333308033308033333337F7F337F7F33333308033308
          033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
          7333333373F77733733333333088888033333333373FFFF73333333333000003
          3333333333777773333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbBloqueaContaClick
      end
      object radSelecionado: TRadioButton
        Left = 14
        Top = 21
        Width = 82
        Height = 17
        Caption = 'Sele&cionado'
        TabOrder = 0
        OnClick = radSelecionadoClick
      end
      object radParcela: TRadioButton
        Left = 102
        Top = 21
        Width = 37
        Height = 17
        Caption = 'De:'
        TabOrder = 1
        OnClick = radParcelaClick
      end
      object edParcelaDe: TEdit
        Left = 142
        Top = 18
        Width = 27
        Height = 22
        Enabled = False
        TabOrder = 2
        Text = '1'
        OnKeyPress = edParcelaDeKeyPress
      end
      object edParcelaAte: TEdit
        Left = 193
        Top = 18
        Width = 27
        Height = 22
        Enabled = False
        TabOrder = 3
        Text = '12'
        OnKeyPress = edParcelaDeKeyPress
      end
      object cbContas: TComboBox
        Left = 14
        Top = 46
        Width = 211
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 4
      end
      object chkAgrupar: TCheckBox
        Left = 14
        Top = 74
        Width = 234
        Height = 17
        Caption = 'Agrupar boletos com o mesmo vencimento'
        TabOrder = 5
      end
    end
    object btnFechar: TButton
      Left = 181
      Top = 312
      Width = 80
      Height = 25
      Caption = 'F12 Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnImprimir: TButton
      Left = 94
      Top = 312
      Width = 81
      Height = 25
      Caption = 'F7 Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnImprimirClick
    end
    object grp2: TGroupBox
      Left = 7
      Top = 5
      Width = 274
      Height = 93
      Caption = ' Recibo '
      TabOrder = 3
      OnEnter = grp2Enter
      object lblCopias: TLabel
        Left = 163
        Top = 21
        Width = 53
        Height = 14
        Caption = '(c'#243'pias: 1)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object radFiscal: TRadioButton
        Left = 14
        Top = 44
        Width = 143
        Height = 17
        Caption = 'S&elecionado'
        TabOrder = 1
      end
      object radAgrupado: TRadioButton
        Left = 14
        Top = 67
        Width = 143
        Height = 17
        Caption = 'A&grupado'
        TabOrder = 2
      end
      object radSelecionado2: TRadioButton
        Left = 14
        Top = 21
        Width = 143
        Height = 17
        Caption = '&Selecionado'
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 215
      Width = 274
      Height = 91
      Caption = ' Extrato '
      TabOrder = 4
      OnEnter = GroupBox1Enter
      object radExtratoTotal: TRadioButton
        Left = 14
        Top = 21
        Width = 204
        Height = 17
        Caption = 'Extrato Total do Aluno'
        TabOrder = 0
      end
      object radExtratoVencidos: TRadioButton
        Left = 14
        Top = 44
        Width = 204
        Height = 17
        Caption = 'Extrato Vencidos do Aluno'
        TabOrder = 1
      end
      object radExtratoPendente: TRadioButton
        Left = 14
        Top = 67
        Width = 204
        Height = 17
        Caption = 'Extrato Pendentes/Vencidos do Aluno'
        TabOrder = 2
      end
    end
  end
  object Query1: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 248
    Top = 192
  end
  object qyUpdMens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '')
    Params = <>
    Left = 248
    Top = 224
  end
  object qryTitulosResp: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   m1.cd_mensalidade'
      'FROM'
      '   mensalidades m1'
      '      JOIN mensalidades m2 ON'
      '         (m1.cd_resp = m2.cd_resp)'
      'WHERE m1.situacao not in (3,4,5,7) AND '
      '   m2.cd_mensalidade = :cd_mensalidade AND'
      '   DATE(m1.datapagamento) LIKE DATE(m2.datapagamento)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
  end
end
