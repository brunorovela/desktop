object frmConfiguraRetorno: TfrmConfiguraRetorno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#245'es de retorno'
  ClientHeight = 340
  ClientWidth = 635
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 340
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 635
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'CONFIGURA'#199#213'ES DE RETORNO'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnValorDivergente: TPanel
      Left = 0
      Top = 25
      Width = 635
      Height = 220
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object RadioGroup1: TRadioGroup
        AlignWithMargins = True
        Left = 8
        Top = 5
        Width = 619
        Height = 210
        Margins.Left = 8
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alClient
        Caption = 'Quando o valor for divergente:'
        TabOrder = 0
      end
      object cbLimitador: TCheckBox
        Left = 16
        Top = 23
        Width = 597
        Height = 26
        Caption = 
          'Se o t'#237'tulo for pago com um valor maior ou menor do que o valor ' +
          'total atualizado da parcela, o sistema poder'#225' ajustar a diferen'#231 +
          'a nos campos de juros e descontos.'
        TabOrder = 1
        WordWrap = True
        OnClick = cbLimitadorClick
      end
      object umedJuros: TUMEditMonetario
        Left = 228
        Top = 61
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '0,00'
        Mascara = '###,###,##0.00'
        CasasDecimais = 2
        EnterProximoCampo = True
      end
      object umedDesconto: TUMEditMonetario
        Left = 228
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '0,00'
        Mascara = '###,###,##0.00'
        CasasDecimais = 2
        EnterProximoCampo = True
      end
      object cbRetiraDesconto: TCheckBox
        Left = 16
        Top = 120
        Width = 531
        Height = 17
        Caption = 
          'Se o t'#237'tulo tiver desconto condicional v'#225'lido, e mesmo assim for' +
          ' pago integral, retirar o desconto do t'#237'tulo.'
        TabOrder = 4
        WordWrap = True
      end
      object cbBaixaParcial: TCheckBox
        Left = 16
        Top = 143
        Width = 590
        Height = 17
        Caption = 
          'Se o pagamento for efetuado com um valor menor do que o valor to' +
          'tal atualizado, efetuar a baixa parcial deste valor.'
        TabOrder = 5
        WordWrap = True
      end
      object Edit1: TEdit
        Left = 40
        Top = 61
        Width = 182
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        Text = 'No campo de juros at'#233' o limite de:'
      end
      object Edit2: TEdit
        Left = 40
        Top = 88
        Width = 182
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
        Text = 'No campo de desconto at'#233' o limite de:'
      end
      object Edit3: TEdit
        Left = 40
        Top = 170
        Width = 566
        Height = 17
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
        Text = 
          'No Obs.: Se o sistema n'#227'o puder ajustar os valores, conforme as ' +
          'configura'#231#245'es acima, o t'#237'tulo ficar'#225' pendente para      baixa ma' +
          'nual, caso o valor pago seja divergente de desconto at'#233' o limite' +
          ' de:'
      end
      object Edit4: TEdit
        Left = 40
        Top = 186
        Width = 566
        Height = 17
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
        Text = 'baixa manual, caso o valor pago seja divergente.'
      end
    end
    object pnTarifas: TPanel
      Left = 0
      Top = 245
      Width = 635
      Height = 95
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 8
        Top = 5
        Width = 619
        Height = 47
        Margins.Left = 8
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alTop
        Caption = 'Tarifas'
        TabOrder = 0
        object cbTarifaAutomatica: TCheckBox
          Left = 8
          Top = 19
          Width = 301
          Height = 17
          Caption = 'Lan'#231'ar automaticamente as tarifas informadas no retorno.'
          TabOrder = 0
        end
      end
      object btnConfirmar: TBitBtn
        Left = 8
        Top = 60
        Width = 107
        Height = 25
        Caption = 'Confirmar'
        TabOrder = 1
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
        Left = 121
        Top = 60
        Width = 83
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
end
