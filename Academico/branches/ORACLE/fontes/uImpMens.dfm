object frmImpMens: TfrmImpMens
  Left = 307
  Top = 218
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Imprimir...'
  ClientHeight = 471
  ClientWidth = 401
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
  object pnlGeral: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 471
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    object bvlSep1: TBevel
      Left = 3
      Top = 117
      Width = 395
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 160
      ExplicitTop = 296
      ExplicitWidth = 50
    end
    object bvlSep4: TBevel
      Left = 3
      Top = 337
      Width = 395
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 122
      ExplicitTop = 381
      ExplicitWidth = 50
    end
    object bvlSep5: TBevel
      Left = 3
      Top = 434
      Width = 395
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 264
      ExplicitTop = 480
      ExplicitWidth = 50
    end
    object pnlRecibo: TPanel
      Left = 3
      Top = 3
      Width = 395
      Height = 114
      Align = alTop
      Padding.Left = 6
      Padding.Top = 6
      Padding.Right = 6
      Padding.Bottom = 6
      TabOrder = 0
      OnEnter = grp2Enter
      object lblRecibo: TLabel
        Left = 7
        Top = 7
        Width = 381
        Height = 14
        Align = alTop
        Caption = 'Recibo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 37
      end
      object bvlRecibo: TBevel
        Left = 7
        Top = 21
        Width = 381
        Height = 86
        Align = alClient
        ExplicitWidth = 810
        ExplicitHeight = 83
      end
      object lblCopias: TLabel
        Left = 273
        Top = 27
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
      object radSelecionado2: TRadioButton
        Left = 14
        Top = 27
        Width = 256
        Height = 17
        Caption = '&Selecionado'
        TabOrder = 0
      end
      object radFiscal: TRadioButton
        Left = 14
        Top = 47
        Width = 256
        Height = 17
        Caption = 'S&elecionado'
        TabOrder = 1
      end
      object radAgrupado: TRadioButton
        Left = 14
        Top = 67
        Width = 256
        Height = 17
        Caption = 'A&grupado'
        TabOrder = 2
      end
      object rbMensalidadesAgrupadas: TRadioButton
        Left = 14
        Top = 87
        Width = 256
        Height = 17
        Caption = 'Fiscal agrupado'
        TabOrder = 3
      end
    end
    object pnlBoleto: TPanel
      Left = 3
      Top = 120
      Width = 395
      Height = 217
      Align = alTop
      Padding.Left = 6
      Padding.Top = 6
      Padding.Right = 6
      Padding.Bottom = 6
      TabOrder = 1
      OnEnter = grp1Enter
      object lblBoleto: TLabel
        Left = 7
        Top = 7
        Width = 381
        Height = 14
        Align = alTop
        Caption = 'Boletos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 42
      end
      object bvlBoleto: TBevel
        Left = 7
        Top = 21
        Width = 381
        Height = 189
        Align = alClient
        ExplicitLeft = 46
        ExplicitTop = 56
        ExplicitWidth = 50
        ExplicitHeight = 50
      end
      object sbBloqueaConta: TSpeedButton
        Left = 273
        Top = 27
        Width = 23
        Height = 22
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
      object bvlSep2: TBevel
        Left = 14
        Top = 75
        Width = 365
        Height = 3
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 206
        Top = 129
        Width = 15
        Height = 14
        Caption = 'at'#233
        Enabled = False
      end
      object lblVenctoAte: TLabel
        Left = 206
        Top = 154
        Width = 15
        Height = 14
        Caption = 'at'#233
        Enabled = False
      end
      object bvlSep3: TBevel
        Left = 14
        Top = 175
        Width = 365
        Height = 3
        Shape = bsTopLine
      end
      object UMAjuda1: TUMAjuda
        Left = 339
        Top = 179
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C0060000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6F4F4F4FAFAFA
          FCFCFCFEFEFEFEFEFEFCFCFCFAFAFAF4F4F4F6F6F6FCFCFCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9EAEADD
          DDDDC7C5C4A8A294968F798D83698D8369968F79A8A294C7C5C4DDDDDDE9EAEA
          F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFBFBFBCDCCC996875F967523C0911AD6A422E5B22DE5B22DD6A422C0911A96
          752396875FCDCCC9FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFC4BBADB1923DD0A321EBC03EE3BB3EDEB73FDCB442DCB4
          42DEB73FE3BB3EEBC03ED0A321B1923DC4BBADFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDACEABA87F06DFBB3DE0BD46D0A639C99732
          C59031C48E31C48E31C59031C99732D0A639E0BD46DFBB3DA87F06DACEABFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DAC19C7600DEC045D8B342C9
          9733C68F31C69031C38C28C0871FC0871FC38C28C69031C68F31C99733D8B342
          DEC0459C7600E1DAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB09341D6B8
          43D8B447CB9836C99234CB9537C38C27B78523BE9441BE9441B78523C38C27CB
          9537C99234CB9836D8B447D6B843B09341FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF
          D6C9A6B4921ADEBF53D1A13CCC9738CC9737D09D41BB800FD5BC86FFFFFFFFFF
          FFD5BC86BB8010D09D41CC9737CC9738D1A13CDEBF53B4921AD6C9A6FFFFFFFF
          FFFFFFFFFFFEFEFEAB903AD7B84DD9B24AD19F3ECE9B3BCE9B3AD1A043C08819
          D0B26EFBF9F4FCFAF5D0B16DC08717D1A043CE9B3ACE9B3BD19F3ED9B24AD7B8
          4DAB903AFEFEFEFFFFFFFFFFFFEFEADDA88516E0C05DDAB04BD3A23FD29E3DD2
          9E3ED3A041CB9630BF912CC7A14AC69F47C19435CD9938D3A040D29E3DD29E3D
          D3A23FDAB04BE0C05DA88516EFEADDFFFFFFFFFFFFE6DFCAB9982FE9CC77DEB8
          5FD9AD52D6A548D4A13FD7A647C78F1FD6B97DFFFFFFFFFFFFF0E8DCBF8C26D1
          9D37D5A343D6A548D9AD52DEB85FE9CC77B9982FE6DFCAFFFFFFFFFFFFE0D7BD
          C5A841EED27DE1BD66DFB762DDB25CDBAD56DCAE56DAAB4EC79636E8D9BEFFFF
          FFFFFFFFE1CDA5C28F27DBAD54DDB25CDFB762E1BD66EED27DC5A841E0D7BDFF
          FFFFFFFFFFDFD6BDCAAF51F2DB87E5C36BE2BC66E1B763DFB35FD3A23FD09C36
          CD982EC69738EEE3CFFFFFFFFFFFFFD9BB84D3A342E3BA69E2BC65E5C36BF2DB
          87CAAF51DFD6BDFFFFFFFFFFFFE5DDC8C9B25EF6E291E9CC74E7C46CE7C270D2
          A440D2B268DFC894CFAB5BCB9627CEA552FEFFFFFFFFFFEADCBCCD9E35E8C473
          E7C46CE9CC74F6E291C9B25EE5DDC8FFFFFFFFFFFFEEE9DBBEA658FAEAA3EED4
          7BEBCD76EDCD7BD3A73CEFE5CBFFFFFFF5EFE4CDA44BD8B974FFFFFFFFFFFFED
          E2C5D2A63CEDCD7BEBCD76EED47BFAEAA3BEA658EEE9DBFFFFFFFFFFFFFEFEFE
          B49D58F9EFBCF4DF8AEFD780F0D480E0BC58E1CB94FEFEFFFEFEFDFDFCFAFDFD
          FCFEFEFDFFFFFFE8D7AFDCB750F0D582EFD77FF4DF8AF9EFBCB49D58FEFEFEFF
          FFFFFFFFFFFFFFFFD6CAA6D1BE83FFF4BCF1DD84F2DB87F0D57BDCBD61F5EFE1
          FFFFFFFFFFFFFFFFFFFFFFFFF9F5EFDABD68EED277F2DB88F1DD83FFF4BCD1BE
          83D6CAA6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDB69E5BFAF3D2F9ECADF4E18AF6
          E18EEED579E0C772ECE0BBF8F6ECF9F6EDEEE4C3E0C978E7CD6DF7E28FF3E08A
          F9ECADFAF3D2B69E5BFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D8BFAD93
          3FFFFFE8FBF0B9F6E694F7E591F4DF85E7D072DFC96CDFC96CE6CF72F3DD83F7
          E692F6E694FBF0B9FFFFE9AD933FE1D8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD6CAA6AB903DFAF5DDFFFEDBFBF0B5F9ECA6F9EA9DF9E895F9E8
          95F9EA9DF9ECA6FBF0B6FFFEDBFAF5DDAB903DD6CAA6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DBC3B7A160D4C699FDF9E4FFFFE5
          FFFFDEFFFFDBFFFFDBFFFFDEFFFFE5FDF9E4D6C79AB7A060E4DBC2FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD5
          C9A4B19A57BEAA6DCFBF8BD6C798D6C798CFBF8BBEAB6EB19A56D5C8A3FEFEFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFEBDDE7E0CBE0D6BBE0D6BBE7E0CBEFEBDDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Transparent = True
        Caption = 
          'Esta op'#231#227'o imprime o boleto selecionado com uma nova data de ven' +
          'cimento, calculando os acr'#233'scimos conforme configurados.'#13#10#13#10
        Titulo = 'AJUDA'
        PanelWidth = 500
        PanelHeight = 250
      end
      object cbContas: TComboBox
        Left = 11
        Top = 27
        Width = 256
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 0
        OnChange = cbContasChange
      end
      object chkAgrupar: TCheckBox
        Left = 14
        Top = 52
        Width = 256
        Height = 17
        Caption = 'Agrupar boletos com o mesmo vencimento'
        TabOrder = 1
      end
      object radSelecionado: TRadioButton
        Left = 14
        Top = 84
        Width = 189
        Height = 17
        Caption = 'Apenas a parcela selecionada'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = radSelecionadoClick
      end
      object radParcela: TRadioButton
        Left = 14
        Top = 104
        Width = 189
        Height = 17
        Caption = 'Intervalo de parcelas'
        TabOrder = 3
        OnClick = radParcelaClick
      end
      object speParcelaDe: TSpinEdit
        Left = 119
        Top = 125
        Width = 84
        Height = 23
        Enabled = False
        MaxValue = 99999
        MinValue = 0
        TabOrder = 5
        Value = 1
      end
      object speParcelaAte: TSpinEdit
        Left = 224
        Top = 125
        Width = 84
        Height = 23
        Enabled = False
        MaxValue = 99999
        MinValue = 0
        TabOrder = 6
        Value = 12
      end
      object chkParcelas: TCheckBox
        Left = 32
        Top = 129
        Width = 84
        Height = 17
        Caption = 'Parcela'
        Enabled = False
        TabOrder = 4
        OnClick = chkParcelasClick
      end
      object chkVencto: TCheckBox
        Left = 32
        Top = 152
        Width = 84
        Height = 17
        Caption = 'Vencimento'
        Enabled = False
        TabOrder = 7
        OnClick = chkVenctoClick
      end
      object dtpVenctoDe: TDatePickerEx
        Left = 119
        Top = 151
        Width = 84
        Height = 23
        Enabled = False
        MaxLength = 10
        TabOrder = 8
        Text = '20122017'
      end
      object dtpVenctoAte: TDatePickerEx
        Left = 224
        Top = 151
        Width = 84
        Height = 23
        Enabled = False
        MaxLength = 10
        TabOrder = 9
        Text = '20122017'
      end
      object ckbDataBoleto: TCheckBox
        Left = 14
        Top = 184
        Width = 235
        Height = 17
        Caption = 'Gerar boleto com nova data de vencimento'
        TabOrder = 10
        OnClick = ckbDataBoletoClick
      end
      object txtDtBoleto: TDatePickerEx
        Left = 252
        Top = 181
        Width = 84
        Height = 23
        Enabled = False
        MaxLength = 10
        TabOrder = 11
        Text = '20122017'
      end
      object ckbRemessaOnline: TCheckBox
        Left = 209
        Top = 87
        Width = 184
        Height = 14
        Caption = 'Imprimir e Registrar Online'
        Checked = True
        State = cbChecked
        TabOrder = 12
        OnClick = ckbDataBoletoClick
      end
    end
    object pnlExtrato: TPanel
      Left = 3
      Top = 340
      Width = 395
      Height = 94
      Align = alTop
      Padding.Left = 6
      Padding.Top = 6
      Padding.Right = 6
      Padding.Bottom = 6
      TabOrder = 2
      OnEnter = GroupBox1Enter
      object lblExtrato: TLabel
        Left = 7
        Top = 7
        Width = 381
        Height = 14
        Align = alTop
        Caption = 'Extrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 38
      end
      object bvlExtrato: TBevel
        Left = 7
        Top = 21
        Width = 381
        Height = 66
        Align = alClient
        ExplicitLeft = 328
        ExplicitTop = 56
        ExplicitWidth = 50
        ExplicitHeight = 50
      end
      object radExtratoTotal: TRadioButton
        Left = 14
        Top = 27
        Width = 256
        Height = 17
        Caption = 'Extrato total do aluno'
        TabOrder = 0
      end
      object radExtratoVencidos: TRadioButton
        Left = 14
        Top = 47
        Width = 256
        Height = 17
        Caption = 'Extrato dos t'#237'tulos vencidos do aluno'
        TabOrder = 1
      end
      object radExtratoPendente: TRadioButton
        Left = 14
        Top = 67
        Width = 256
        Height = 17
        Caption = 'Extrato dos t'#237'tulos pendente/vencidos do aluno'
        TabOrder = 2
      end
    end
    object pnlBotoes: TPanel
      Left = 3
      Top = 437
      Width = 395
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object sbPropriedades: TSpeedButton
        Left = 7
        Top = 3
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
      object btnImprimir: TButton
        Left = 88
        Top = 3
        Width = 81
        Height = 25
        Caption = 'F7 Imprimir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnImprimirClick
      end
      object btnFechar: TButton
        Left = 169
        Top = 3
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
    end
  end
  object Query1: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 168
    Top = 40
  end
  object qyUpdMens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      '')
    Params = <>
    Left = 200
    Top = 40
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
    Left = 232
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
  end
  object qryBoletoRegistroOnline: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_caixa'
      'FROM'
      #9'fin_cadastro_contas fcc'
      #9'INNER JOIN rem_registro_online rro ON ('
      #9#9'rro.CD_BOLETO = fcc.cd_boleto_online'
      #9')'
      'WHERE'
      #9'cd_caixa = :cd_caixa'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_caixa'
        ParamType = ptUnknown
      end>
  end
end
