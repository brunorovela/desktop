object frm_Caixas_Planilha: Tfrm_Caixas_Planilha
  Left = 164
  Top = 185
  Caption = 'Caixas'
  ClientHeight = 449
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CAIXAS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object grd: TDBGrid
    AlignWithMargins = True
    Left = 0
    Top = 85
    Width = 855
    Height = 334
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 7
    Align = alClient
    BorderStyle = bsNone
    DataSource = srcCaixa
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    OnKeyDown = grdKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_caixa'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_caixa'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_tipo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_banco'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descSituacao'
        Width = 100
        Visible = True
      end>
  end
  object pnRodape: TPanel
    Left = 0
    Top = 426
    Width = 855
    Height = 23
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object sbAbrirCaixa: TSpeedButton
      Left = 0
      Top = 0
      Width = 107
      Height = 23
      Align = alLeft
      Caption = 'Abrir o Caixa'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000A8A8A8666666
        3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D
        3DA7A7A7E3DFE0E3DFE066666655DFD43D3D3D55DFFF55DFFF55DFFF55DFFF55
        DFFF55DFD455DFFF55DFD455DFFF55C0D43D3D3DE3DFE0E3DFE066666600F2FF
        55DFD43D3D3DA9FFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFD455DF
        FF55DFD43D3D3DE3DFE073737354FFFF00F2FF55DFD43D3D3D3D3D3D3D3D3D3D
        3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D73737354FFFF
        54FFFF00F2FF55DFD400F2FF55DFD499F8FF99F8FF99F8FF99F8FF99F8FF99F8
        FF99F8FFB4B4B4E3DFE0818181A9FFFF54FFFF54FFFF00F2FFEFAD007F5B00EF
        AD00AAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FF767676E3DFE081818154FFFF
        A9FFFF54FFFF54FFFF7F5B00D9A77D7F5B00FFFFFFAAFFFF99F8FFAAFFFF99F8
        FFAAFFFF767676E3DFE09A9A9AA9FFFF54FFFFEFAD00A27600A27600D9A77DA3
        77007F5B00EFAD00AAFFFF99F8FFAAFFFF99F8FF767676E3DFE09A9A9A54FFFF
        A9FFFFAA7F00FFFFCCD9A77DD9A77DD9A77DD9A77D7F5B00AAFFFFAAFFFF99F8
        FFAAFFFF818181E3DFE0A7A7A7A7A7A755C0D4F7D06CE5B726E2B629F6CF6DAA
        7F00AA7F00F7CF6CAAFFFF99F8FFAAFFFF99F8FF8E8E8EE3DFE0E3DFE0A7A7A7
        00F2FF00F2FF00F1FFF1BF2BFFFFCCAA7F00AAFFFFAAFFFFAAFFFF55DFFF55DF
        FF55C0D49A9A9AE3DFE0E3DFE09B9B9B54FFFF67F4FF67F4FFF8D06DFDC831F7
        CF6CAAFFFFAAFFFFB4B4B4A0A0A08D8D8D818181A7A7A7E3DFE0E3DFE0E3DFE0
        9B9B9B8D8D8D8D8D8DB4B4B4909090FFFFFFAAFFFFFFFFFFA1A1A1E6E6E6DADA
        DADADADAB4B4B4E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0919191FF
        FFFFFFFFFFAAFFFFA7A7A7FFFFFFE7E7E7B4B4B4E3DFE0E3DFE0E3DFE0E3DFE0
        E3DFE0E3DFE0E3DFE0E3DFE0919191FFFFFFFFFFFFFFFFFF8D8D8DFFFFFFB4B4
        B4E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0B4B4B49A
        9A9A9A9A9A8E8E8E818181C1C1C1E3DFE0E3DFE0E3DFE0E3DFE0}
      OnClick = sbAbrirCaixaClick
      ExplicitLeft = 1
    end
    object sbFechar: TSpeedButton
      Left = 770
      Top = 0
      Width = 87
      Height = 23
      Align = alLeft
      Caption = 'F12 Fechar'
      Flat = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
        1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
        1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
        1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
        1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
        1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
        1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
        1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
        1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
        1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
        1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
        1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      OnClick = sbFecharClick
      ExplicitLeft = 684
    end
    object sbFecharCaixa: TSpeedButton
      Left = 107
      Top = 0
      Width = 110
      Height = 23
      Align = alLeft
      Caption = 'Fechar o Caixa'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000A8A8A8666666
        3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D
        3DA7A7A7E3DFE0E3DFE066666655DFD43D3D3D55DFFF55DFFF55DFFF55DFFF55
        DFFF55DFD455DFFF55DFD455DFFF55C0D43D3D3DE3DFE0E3DFE066666600F2FF
        55DFD43D3D3DA9FFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFD455DF
        FF55DFD43D3D3DE3DFE073737354FFFF00F2FF55DFD43D3D3D3D3D3D3D3D3D3D
        3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D73737354FFFF
        54FFFF00F2FF55DFD400F2FF55DFD4FFFFFF98F7FF99F7FF98F7FF98F7FF98F7
        FF98F7FF98F7FFB4B4B4818181A9FFFF54FFFF54FFFF00F2FF55DFD4B4B4B4FF
        FFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFAAFFFF99F8FFB4B4B481818154FFFF
        A9FFFF818181737373595959595959595959595959737373AAFFFF99F8FFAAFF
        FF99F8FFAAFFFF7676769A9A9AA9FFFF54FFFF818181005FFF001FFF001FFF00
        1FFF001FFF59595999F8FFAAFFFF99F8FFAAFFFF99F8FF7676769A9A9A54FFFF
        A9FFFF8181811D94F71D94F7005FFF001FFF001FFF595959AAFFFF99F8FFAAFF
        FF99F8FFAAFFFF818181A7A7A7A7A7A700F2FFA7A7A79A9A9A9A9A9A9A9A9A9A
        9A9A9A9A9AA7A7A799F8FFAAFFFF99F8FFAAFFFF99F8FF8E8E8EE3DFE0A7A7A7
        00F2FF00F2FF00F2FF00F2FFB4B4B4FFFFFFAAFFFFAAFFFFAAFFFF99F8FF55DF
        FF55DFFF55C0D49A9A9AE3DFE09B9B9B54FFFF67F4FF67F4FF67F4FF919191FF
        FFFFAAFFFFAAFFFFAAFFFFB4B4B4A0A0A08D8D8D818181A7A7A7E3DFE0E3DFE0
        9B9B9B8D8D8D8D8D8DB4B4B4909090FFFFFFFFFFFFAAFFFFAAFFFFA1A1A1E6E6
        E6DADADADADADAB4B4B4E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0919191FF
        FFFFAAFFFFFFFFFFAAFFFFA7A7A7FFFFFFE7E7E7B4B4B4E3DFE0E3DFE0E3DFE0
        E3DFE0E3DFE0E3DFE0E3DFE0919191FFFFFFFFFFFFAAFFFFFFFFFF8D8D8DFFFF
        FFB4B4B4E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0E3DFE0B4B4B4A7
        A7A7A7A7A79A9A9A8E8E8E818181C1C1C1E3DFE0E3DFE0E3DFE0}
      OnClick = sbFecharCaixaClick
      ExplicitLeft = 108
    end
    object sbImprimirResumo: TSpeedButton
      Left = 645
      Top = 0
      Width = 125
      Height = 23
      Align = alLeft
      Caption = 'F7 Imprimir Resumo'
      Flat = True
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
      OnClick = sbImprimirResumoClick
      ExplicitLeft = 559
    end
    object sbPlanilhaCaixa: TSpeedButton
      Left = 304
      Top = 0
      Width = 125
      Height = 23
      Align = alLeft
      Caption = 'Planilha de Caixa'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      OnClick = sbPlanilhaCaixaClick
      ExplicitLeft = 218
    end
    object btnTransferencia: TSpeedButton
      Left = 429
      Top = 0
      Width = 102
      Height = 23
      Align = alLeft
      Caption = 'Transfer'#234'ncia'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btnTransferenciaClick
      ExplicitLeft = 435
      ExplicitTop = 3
    end
    object btnAtualizarSaldo: TSpeedButton
      Left = 531
      Top = 0
      Width = 114
      Height = 23
      Align = alLeft
      Caption = 'Atualizar Saldo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      OnClick = btnAtualizarSaldoClick
      ExplicitLeft = 445
    end
    object FBnFiltra: TSpeedButton
      Left = 217
      Top = 0
      Width = 87
      Height = 23
      Align = alLeft
      Caption = 'Filtrar'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000000000007B7B7B00FF00
        FF00FF00FF00FF00FF007B7B7B00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
        000000000000FF00FF0000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
        000000000000FF00FF0000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        00007B7B7B0000000000000000000000000000000000FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
        FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
        FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
        FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B00
        00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
        00007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B00
        00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
        00007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = FBnFiltraClick
      ExplicitLeft = 256
      ExplicitTop = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 855
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label31: TLabel
      Left = 6
      Top = 6
      Width = 112
      Height = 13
      Align = alCustom
      Caption = 'Unidade de Ensino:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbUnidadeEnsino: TUMComboBox
      Left = 124
      Top = 3
      Width = 350
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbUnidadeEnsinoChange
      OnSelect = cbUnidadeEnsinoSelect
      TamanhoMaximo = 0
      SelecionarUnicoAutomatico = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 52
    Width = 855
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object ckbInativas: TCheckBox
      Left = 6
      Top = 7
      Width = 179
      Height = 17
      Caption = 'Listar as contas ativas e inativas.'
      TabOrder = 0
      OnClick = ckbInativasClick
    end
  end
  object qyCaixas: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyCaixasCalcFields
    SQL.Strings = (
      'SELECT '
      '   c.*, t.ds_tipo'
      'FROM '
      '  fin_cadastro_contas c, '
      '  fin_cadastro_contas_tipos t'
      'WHERE'
      '  t.cd_tipo = c.tp_conta AND '
      '  c.cd_coligada = :cd_coligada'
      'ORDER BY c.sn_ativa = '#39'S'#39', c.cd_caixa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    object qyCaixasds_caixa: TStringField
      DisplayLabel = 'Descri'#231#227'o da Conta'
      FieldName = 'ds_caixa'
      Size = 255
    end
    object qyCaixasds_tipo: TStringField
      DisplayLabel = 'Tipo de Conta'
      FieldName = 'ds_tipo'
      Size = 255
    end
    object qyCaixasnm_banco: TStringField
      DisplayLabel = 'Nome do Banco'
      FieldName = 'nm_banco'
      Size = 100
    end
    object qyCaixasdescSituacao: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'descSituacao'
      Size = 30
      Calculated = True
    end
    object qyCaixassn_ativa: TStringField
      FieldName = 'sn_ativa'
      FixedChar = True
      Size = 1
    end
    object qyCaixastp_conta: TSmallintField
      FieldName = 'tp_conta'
    end
    object qyCaixascd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
    object qyCaixasvl_saldo_inicio: TFloatField
      FieldName = 'vl_saldo_inicio'
    end
    object qyCaixascd_caixa: TIntegerField
      DisplayLabel = 'Cod. Conta'
      FieldName = 'cd_caixa'
      Required = True
    end
  end
  object srcCaixa: TDataSource
    DataSet = qyCaixas
    OnDataChange = srcCaixaDataChange
    Left = 264
    Top = 224
  end
  object qyControle: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select '
      '   * '
      'from fin_controle_caixa'
      'where  '
      '   ds_situacao= '#39'A'#39'  AND '
      '  cd_coligada = :cd_coligada'
      'ORDER By cd_conta_banco')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_coligada'
        ParamType = ptUnknown
      end>
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 328
    Top = 224
  end
  object qryFiltro: TUMZQuery
    Connection = DM.db
    SortedFields = 'dt_movimento, tp_entrada_saida, dt_registro'
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT'
      '   M.DS_MOEDA,'
      '   M.DS_SIGLA,'
      '   T.CD_MOVIMENTO_TE,'
      '   T.CD_COLIGADA,'
      '   T.CD_CAIXA,'
      '   T.CD_ABERTURA_CAIXA,'
      '   T.DT_MOVIMENTO,'
      '   T.CD_ACAO,'
      '   T.NR_DOCUMENTO,'
      '   T.DS_MOVIMENTO,'
      '   T.DT_LIBERACAO,'
      '   T.CD_ORIGEM,'
      '   T.TP_ENTRADA_SAIDA,'
      '   T.VL_MOVIMENTO,'
      '   T.CD_MOEDA,'
      '   T.VL_MOEDA,'
      '   T.VL_SALDO,'
      '   T.VL_DINHEIRO,'
      '   T.VL_CHEQUE,'
      '   T.CD_MENSALIDADE,'
      '   T.CD_USUARIO,'
      '   T.SN_COMPENSADO,'
      '   T.DT_COMPENSACAO,'
      '   T.CD_FORMA_PGTO,'
      '   T.DT_REGISTRO,'
      '   T.NR_CHEQUE,'
      '   T.VL_SALDO_COMPENSADO,'
      '   T.CD_TITULO,'
      '   T.NR_ESTORNO,'
      '   T.CD_TRANSFERE,'
      '   T.CD_CHEQUE,'
      '   T.DS_OBSERVACAO,'
      '   T.DS_OBSERVACAO,'
      '   PE.NM_PESSOA NM_FORNECEDOR,'
      '   CASE'
      '      WHEN T.CD_ORIGEM = 1 THEN '#39'CR'#39
      '      WHEN T.CD_ORIGEM = 2 THEN '#39'CP'#39
      '      WHEN T.CD_ORIGEM = 3 THEN '#39'TE'#39
      '      WHEN T.CD_ORIGEM = 4 THEN '#39'CE'#39
      '      ELSE '#39#39
      '   END desOrigem,'
      '   CASE'
      '      WHEN T.TP_ENTRADA_SAIDA = 1 THEN T.VL_MOVIMENTO'
      '      ELSE -T.VL_MOVIMENTO'
      '   END ValMovimento,'
      '   CASE'
      '      WHEN T.TP_ENTRADA_SAIDA = 1 THEN T.VL_MOVIMENTO'
      '      ELSE 0.0'
      '   END ValEntradasBanco,'
      '   CASE'
      '      WHEN T.TP_ENTRADA_SAIDA = 2 THEN T.VL_MOVIMENTO'
      '      ELSE 0.0'
      '   END ValSaidasBanco,'
      '   CASE'
      '      WHEN T.TP_ENTRADA_SAIDA = 1 THEN '#39'E'#39
      '      ELSE '#39'S'#39
      '   END desES,'
      '   CASE'
      '      WHEN T.VL_DINHEIRO <= 0 THEN '#39'C'#39
      '      WHEN T.VL_CHEQUE > 0 THEN '#39'A'#39
      '      ELSE '#39'D'#39
      '   END desDinCh,'
      '   CASE'
      '      WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN C.DS_CHEQUE'
      '      WHEN T.VL_DINHEIRO > 0 THEN '#39#39
      '      ELSE '#39'-'#39
      '   END desCh,'
      '   CASE'
      '      WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN S.DS_VALOR'
      '      WHEN T.VL_DINHEIRO > 0 THEN '#39#39
      '      ELSE '#39'-'#39
      '   END desChSit,'
      '   CASE'
      '      WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN S.DS_SIGLA'
      '      WHEN T.VL_DINHEIRO > 0 THEN '#39#39
      '      ELSE '#39'-'#39
      '   END desChSitSigla,'
      '   CASE'
      '      WHEN TRIM(C.DS_CHEQUE) <> '#39#39' THEN CC.DS_CAIXA'
      '      WHEN T.VL_DINHEIRO > 0 THEN '#39#39
      '      ELSE '#39'-'#39
      '   END desChCaixa, '
      '   US.NM_PESSOA AS NM_USUARIO'
      'FROM'
      '   FIN_MOV_TESOURARIA T'
      '      LEFT JOIN FIN_MOEDAS M ON'
      '         (T.CD_MOEDA = M.CD_MOEDA)'
      '      LEFT JOIN FIN_CHEQUES C ON'
      '         (T.CD_CHEQUE = C.CD_CHEQUE)'
      '         LEFT JOIN FIN_CADASTRO_CONTAS CC ON'
      '            (C.CD_CAIXA = CC.CD_CAIXA) AND'
      '            (T.CD_COLIGADA = CC.CD_COLIGADA)'
      '         LEFT JOIN SITUACOES S ON'
      '            (C.CD_SITUACAO = S.CD_SITUACAO) AND'
      '            (S.CD_MODULO = 2050)'
      '         LEFT JOIN FIN_CONTAS_PAGAR CP ON '
      
        '                  (CP.CD_TITULO = T.CD_TITULO AND CP.CD_COLIGADA' +
        ' = T.CD_COLIGADA) '
      
        '         LEFT JOIN PESSOAS as PE ON (PE.CD_PESSOA = CP.CD_PESSOA' +
        ')'
      
        '         LEFT JOIN PESSOAS as US ON (US.CD_PESSOA = T.CD_USUARIO' +
        ')'
      'WHERE'
      '   T.CD_CAIXA = :CD_CAIXA AND'
      '   T.CD_COLIGADA = :CD_COLIGADA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'dt_movimento Asc, tp_entrada_saida Asc, dt_registro Asc'
    Left = 816
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_CAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qryFiltroDS_MOEDA: TStringField
      FieldName = 'DS_MOEDA'
      Size = 50
    end
    object qryFiltroDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Size = 30
    end
    object qryFiltroCD_MOVIMENTO_TE: TLargeintField
      FieldName = 'CD_MOVIMENTO_TE'
      Required = True
    end
    object qryFiltroCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryFiltroCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
    end
    object qryFiltroCD_ABERTURA_CAIXA: TIntegerField
      FieldName = 'CD_ABERTURA_CAIXA'
    end
    object qryFiltroDT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
    end
    object qryFiltroCD_ACAO: TIntegerField
      FieldName = 'CD_ACAO'
    end
    object qryFiltroNR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
      Size = 50
    end
    object qryFiltroDS_MOVIMENTO: TStringField
      FieldName = 'DS_MOVIMENTO'
      Size = 255
    end
    object qryFiltroDT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
    end
    object qryFiltroCD_ORIGEM: TSmallintField
      FieldName = 'CD_ORIGEM'
    end
    object qryFiltroTP_ENTRADA_SAIDA: TSmallintField
      FieldName = 'TP_ENTRADA_SAIDA'
    end
    object qryFiltroVL_MOVIMENTO: TFloatField
      FieldName = 'VL_MOVIMENTO'
    end
    object qryFiltroCD_MOEDA: TLargeintField
      FieldName = 'CD_MOEDA'
    end
    object qryFiltroVL_MOEDA: TFloatField
      FieldName = 'VL_MOEDA'
    end
    object qryFiltroVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object qryFiltroVL_DINHEIRO: TFloatField
      FieldName = 'VL_DINHEIRO'
    end
    object qryFiltroVL_CHEQUE: TFloatField
      FieldName = 'VL_CHEQUE'
    end
    object qryFiltroCD_MENSALIDADE: TLargeintField
      FieldName = 'CD_MENSALIDADE'
      Required = True
    end
    object qryFiltroCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object qryFiltroSN_COMPENSADO: TSmallintField
      FieldName = 'SN_COMPENSADO'
    end
    object qryFiltroDT_COMPENSACAO: TDateTimeField
      FieldName = 'DT_COMPENSACAO'
    end
    object qryFiltroCD_FORMA_PGTO: TLargeintField
      FieldName = 'CD_FORMA_PGTO'
    end
    object qryFiltroDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
    end
    object qryFiltroNR_CHEQUE: TIntegerField
      FieldName = 'NR_CHEQUE'
    end
    object qryFiltroVL_SALDO_COMPENSADO: TFloatField
      FieldName = 'VL_SALDO_COMPENSADO'
    end
    object qryFiltroCD_TITULO: TLargeintField
      FieldName = 'CD_TITULO'
    end
    object qryFiltroNR_ESTORNO: TLargeintField
      FieldName = 'NR_ESTORNO'
    end
    object qryFiltroCD_TRANSFERE: TLargeintField
      FieldName = 'CD_TRANSFERE'
    end
    object qryFiltroCD_CHEQUE: TLargeintField
      FieldName = 'CD_CHEQUE'
    end
    object qryFiltroDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object qryFiltroDS_OBSERVACAO_1: TMemoField
      FieldName = 'DS_OBSERVACAO_1'
      BlobType = ftMemo
    end
    object qryFiltroNM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Size = 60
    end
    object qryFiltrodesOrigem: TStringField
      FieldName = 'desOrigem'
      ReadOnly = True
      Size = 2
    end
    object qryFiltroValMovimento: TFloatField
      FieldName = 'ValMovimento'
      ReadOnly = True
    end
    object qryFiltroValEntradasBanco: TFloatField
      FieldName = 'ValEntradasBanco'
      ReadOnly = True
    end
    object qryFiltroValSaidasBanco: TFloatField
      FieldName = 'ValSaidasBanco'
      ReadOnly = True
    end
    object qryFiltrodesES: TStringField
      FieldName = 'desES'
      ReadOnly = True
      Size = 1
    end
    object qryFiltrodesDinCh: TStringField
      FieldName = 'desDinCh'
      ReadOnly = True
      Size = 1
    end
    object qryFiltrodesCh: TStringField
      FieldName = 'desCh'
      ReadOnly = True
      Size = 30
    end
    object qryFiltrodesChSit: TStringField
      FieldName = 'desChSit'
      ReadOnly = True
      Size = 255
    end
    object qryFiltrodesChSitSigla: TStringField
      FieldName = 'desChSitSigla'
      ReadOnly = True
      Size = 50
    end
    object qryFiltrodesChCaixa: TStringField
      FieldName = 'desChCaixa'
      ReadOnly = True
      Size = 255
    end
    object qryFiltroNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 60
    end
  end
end
