object fMatricularDivisaoTitulos: TfMatricularDivisaoTitulos
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 3
  Caption = 'Divis'#227'o de t'#237'tulos por respons'#225'vel'
  ClientHeight = 606
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 329
    Width = 713
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitTop = 270
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 332
    Width = 713
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 296
    ExplicitTop = 432
    ExplicitWidth = 50
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 574
    Width = 713
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 264
    ExplicitTop = 368
    ExplicitWidth = 50
  end
  object pnlParcelasOrigem: TPanel
    Left = 0
    Top = 20
    Width = 713
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pnlParcelasOrigemTit: TPanel
      Left = 0
      Top = 0
      Width = 713
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 
        'Selecione as parcelas para as quais deseja aplicar a divis'#227'o de ' +
        't'#237'tulos'
      TabOrder = 0
    end
    object dbgParcelasOrigem: TDBGrid
      Left = 0
      Top = 22
      Width = 713
      Height = 147
      Align = alClient
      DataSource = dsParcelasOrigem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgParcelasOrigemCellClick
      OnDrawColumnCell = dbgParcelasOrigemDrawColumnCell
      OnTitleClick = dbgParcelasOrigemTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SN_SELECIONADA'
          Title.Alignment = taCenter
          Title.Caption = 'S'
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          Title.Caption = 'Tipo de t'#237'tulo'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELA'
          Title.Caption = 'Parcela'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCTO'
          Title.Caption = 'Vencimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BRUTO'
          Title.Caption = 'Valor bruto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESCONTO'
          Title.Caption = 'Desconto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BOLSA'
          Title.Caption = 'Bolsa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_EXTRA'
          Title.Caption = 'Valor extra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_RESPONSAVEL'
          Title.Caption = 'Respons'#225'vel'
          Width = 135
          Visible = True
        end>
    end
  end
  object pnlResponsavel: TPanel
    Left = 0
    Top = 189
    Width = 713
    Height = 140
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblNomeResponsavel: TLabel
      Left = 109
      Top = 0
      Width = 103
      Height = 13
      Caption = 'Respons'#225'vel do t'#237'tulo'
      FocusControl = dbeNomeResponsavel
    end
    object lblPercentualResponsavel: TLabel
      Left = 0
      Top = 0
      Width = 51
      Height = 13
      Caption = 'Percentual'
      FocusControl = dbePercentualResponsavel
    end
    object sbSelResp: TSpeedButton
      Left = 417
      Top = 16
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = sbSelRespClick
    end
    object sbAplicar: TSpeedButton
      Left = 628
      Top = 16
      Width = 82
      Height = 21
      Caption = 'Calcular'
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
      OnClick = sbAplicarClick
    end
    object lblResultado: TLabel
      Left = 0
      Top = 126
      Width = 97
      Height = 13
      Caption = 'Parcelas resultantes'
    end
    object lblDivisaoProgramada: TLabel
      Left = 0
      Top = 109
      Width = 468
      Height = 13
      Caption = 
        'Esta pessoa possui um plano de divis'#227'o programado. Confira as in' +
        'forma'#231#245'es antes de prosseguir.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object UMAjuda1: TUMAjuda
      Left = 388
      Top = 40
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
        'Esta funcionalidade mudou e caso marcada ser'#225' poss'#237'vel ao gerar ' +
        'as mensalidades no momento da matricula, '#13#10'aplicar um desconto f' +
        'ixo juntamente de uma divis'#227'o e optar por manter na parcela do a' +
        'luno o desconto concedido ou caso desmarcar esta op'#231#227'o a divis'#227'o' +
        ' calcular'#225' percentualmente o desconto entre as duas parcelas ori' +
        'ginadas da divis'#227'o (Comportamento atual do sistema).'#13#10#13#10#13#10'[b]Exe' +
        'mplo de utiliza'#231#227'o:[b] Alguns clientes utilizam combinadamente [' +
        'b]ProUni[b]+[b]FIES[b] e necessitam que o [b]ProUNI[b] seja apli' +
        'cado antes do [b]FIES[b] e que a divis'#227'o realizada para controla' +
        'r o [b]FIES[b] seja feita desconsiderando o desconto referente a' +
        'o [b]ProUNI[b].'
      Titulo = 'AJUDA'
    end
    object dbeNomeResponsavel: TDBEdit
      Left = 109
      Top = 16
      Width = 305
      Height = 21
      DataField = 'NM_RESPONSAVEL'
      DataSource = dsResponsavel
      ReadOnly = True
      TabOrder = 1
    end
    object dbePercentualResponsavel: TDBEdit
      Left = 0
      Top = 16
      Width = 103
      Height = 21
      DataField = 'VL_PERCENTUAL'
      DataSource = dsResponsavel
      TabOrder = 0
      OnKeyPress = dbePercentualResponsavelKeyPress
    end
    object cbManterDesc: TCheckBox
      Left = 0
      Top = 44
      Width = 385
      Height = 17
      Caption = 
        'Manter os descontos apenas na parcela de responsabilidade do alu' +
        'no:'
      TabOrder = 2
      OnClick = cbManterDescClick
    end
    object rbAplicaBruto: TRadioButton
      Left = 0
      Top = 66
      Width = 385
      Height = 17
      Caption = 
        'Efetuar a divis'#227'o do percentual informado com base no valor brut' +
        'o do t'#237'tulo'
      Checked = True
      Enabled = False
      TabOrder = 3
      TabStop = True
    end
    object rbAplicaLiquido: TRadioButton
      Left = 0
      Top = 86
      Width = 393
      Height = 17
      Caption = 
        'Efetuar a divis'#227'o do percentual informado com base no valor l'#237'qu' +
        'ido do t'#237'tulo'
      Enabled = False
      TabOrder = 4
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 577
    Width = 713
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object bbtnConfirmar: TBitBtn
      Left = 547
      Top = 3
      Width = 83
      Height = 25
      Caption = 'Confirmar'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnCancelar: TBitBtn
      Left = 630
      Top = 3
      Width = 83
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnlParcelasDivididas: TPanel
    Left = 0
    Top = 335
    Width = 713
    Height = 239
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object dbgParcelasDivididas: TDBGrid
      Left = 0
      Top = 0
      Width = 713
      Height = 239
      Align = alClient
      DataSource = dsParcelasDivididas
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          Title.Caption = 'Tipo de t'#237'tulo'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELA'
          Title.Caption = 'Parcela'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCTO'
          Title.Caption = 'Vencimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BRUTO'
          Title.Caption = 'Valor bruto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESCONTO'
          Title.Caption = 'Desconto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BOLSA'
          Title.Caption = 'Bolsa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_EXTRA'
          Title.Caption = 'Valor extra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_RESPONSAVEL'
          Title.Caption = 'Respons'#225'vel'
          Width = 142
          Visible = True
        end>
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    Caption = 'DIVIS'#195'O DE T'#205'TULOS POR RESPONS'#193'VEL'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object cdsParcelasOrigem: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_BOLSA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SN_SELECIONADA'
        DataType = ftBoolean
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'PtrItemPlano'
        DataType = ftInteger
      end
      item
        Name = 'VL_CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'NR_PARCELA;PtrItemPlano'
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 144
    Data = {
      D80100009619E0BD01000000180000000F000000000003000000D8010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020014000A4E525F50415243454C
      4104000100000000000944545F56454E43544F040006000000000008564C5F42
      5255544F080004000000010007535542545950450200490006004D6F6E657900
      0B564C5F444553434F4E544F0800040000000100075355425459504502004900
      06004D6F6E65790008564C5F424F4C5341080004000000010007535542545950
      450200490006004D6F6E65790008564C5F455854524108000400000001000753
      5542545950450200490006004D6F6E6579000E43445F524553504F4E53415645
      4C04000100000000000E4E4D5F524553504F4E534156454C0100490000000100
      0557494454480200020040000E534E5F53454C4543494F4E4144410200030000
      0000000843445F434F4E544104000100000000000C5074724974656D506C616E
      6F04000100000000000A564C5F4352454449544F080004000000010007535542
      545950450200490006004D6F6E6579000B4944585F50415243454C4104000100
      0000000001000D44454641554C545F4F524445520200820000000000}
    object cdsParcelasOrigemCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasOrigemDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
    end
    object cdsParcelasOrigemNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasOrigemDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasOrigemVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemVL_BOLSA: TCurrencyField
      FieldName = 'VL_BOLSA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasOrigemCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsParcelasOrigemNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 64
    end
    object cdsParcelasOrigemSN_SELECIONADA: TBooleanField
      FieldName = 'SN_SELECIONADA'
    end
    object cdsParcelasOrigemCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasOrigemPtrItemPlano: TIntegerField
      FieldName = 'PtrItemPlano'
    end
    object cdsParcelasOrigemvl_credito: TCurrencyField
      FieldName = 'VL_CREDITO'
    end
    object cdsParcelasOrigemIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
  end
  object dsParcelasOrigem: TDataSource
    DataSet = cdsParcelasOrigem
    Left = 288
    Top = 160
  end
  object cdsResponsavel: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VL_PERCENTUAL'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 128
    Data = {
      7E0000009619E0BD0100000018000000030000000000030000007E000E43445F
      524553504F4E534156454C04000100000000000E4E4D5F524553504F4E534156
      454C01004900000001000557494454480200020040000D564C5F50455243454E
      5455414C080004000000010007535542545950450200490006004D6F6E657900
      0000}
    object cdsResponsavelCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsResponsavelNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 64
    end
    object cdsResponsavelVL_PERCENTUAL: TCurrencyField
      FieldName = 'VL_PERCENTUAL'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsResponsavel: TDataSource
    AutoEdit = False
    DataSet = cdsResponsavel
    Left = 472
    Top = 136
  end
  object cdsParcelasDivididas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CD_TIPO_TITULO'
        DataType = ftInteger
      end
      item
        Name = 'DS_TIPO_TITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'DT_VENCTO'
        DataType = ftDate
      end
      item
        Name = 'VL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_BOLSA'
        DataType = ftCurrency
      end
      item
        Name = 'VL_EXTRA'
        DataType = ftCurrency
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftInteger
      end
      item
        Name = 'NM_RESPONSAVEL'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'CD_CONTA'
        DataType = ftInteger
      end
      item
        Name = 'PtrItemPlano'
        DataType = ftInteger
      end
      item
        Name = 'VL_CREDITO'
        DataType = ftCurrency
      end
      item
        Name = 'VL_PERCENTUAL_DIVISAO'
        DataType = ftCurrency
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'NR_PARCELA'
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 232
    Data = {
      DD0100009619E0BD01000000180000000F000000000003000000DD010E43445F
      5449504F5F544954554C4F04000100000000000E44535F5449504F5F54495455
      4C4F01004900000001000557494454480200020014000A4E525F50415243454C
      4104000100000000000944545F56454E43544F040006000000000008564C5F42
      5255544F080004000000010007535542545950450200490006004D6F6E657900
      0B564C5F444553434F4E544F0800040000000100075355425459504502004900
      06004D6F6E65790008564C5F424F4C5341080004000000010007535542545950
      450200490006004D6F6E65790008564C5F455854524108000400000001000753
      5542545950450200490006004D6F6E6579000E43445F524553504F4E53415645
      4C04000100000000000E4E4D5F524553504F4E534156454C0100490000000100
      0557494454480200020040000843445F434F4E544104000100000000000C5074
      724974656D506C616E6F04000100000000000A564C5F4352454449544F080004
      000000010007535542545950450200490006004D6F6E65790015564C5F504552
      43454E5455414C5F4449564953414F0800040000000100075355425459504502
      00490006004D6F6E6579000B4944585F50415243454C41040001000000000000
      00}
    object cdsParcelasDivididasCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object cdsParcelasDivididasDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
    end
    object cdsParcelasDivididasNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsParcelasDivididasDT_VENCTO: TDateField
      FieldName = 'DT_VENCTO'
    end
    object cdsParcelasDivididasVL_BRUTO: TCurrencyField
      FieldName = 'VL_BRUTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasVL_BOLSA: TCurrencyField
      FieldName = 'VL_BOLSA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasVL_EXTRA: TCurrencyField
      FieldName = 'VL_EXTRA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcelasDivididasCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object cdsParcelasDivididasNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 64
    end
    object cdsParcelasDivididasCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
    end
    object cdsParcelasDivididasPtrItemPlano: TIntegerField
      FieldName = 'PtrItemPlano'
    end
    object cdsParcelasDivididasVL_CREDITO: TCurrencyField
      FieldName = 'VL_CREDITO'
    end
    object cdsParcelasDivididasVL_PERCENTUAL_DIVISAO: TCurrencyField
      FieldName = 'VL_PERCENTUAL_DIVISAO'
    end
    object cdsParcelasDivididasIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
  end
  object dsParcelasDivididas: TDataSource
    DataSet = cdsParcelasDivididas
    Left = 504
    Top = 232
  end
  object qryDivisaoProgramada: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   P.CD_DESCONTO_PESSOA,'
      '   P.CD_PESSOA,'
      '   P.CD_DEPTO,'
      '   P.DT_INICIO,'
      '   P.DT_FIM,'
      '   P.VL_PERCENTUAL,'
      '   P.NR_PARC_INICIO,'
      '   P.NR_PARC_FIM,'
      '   P.DS_HISTORICO,'
      '   P.CD_RESPONSAVEL,'
      '   P.TP_DESCONTO,'
      '   R.NM_PESSOA NM_RESPONSAVEL,'
      '   p.sn_manter_desconto_fixo,'
      '   p.nr_forma_aplicar_divisao'
      'FROM'
      '   PESSOAS_DESCONTOS P'
      ''
      '      JOIN PESSOAS R ON'
      '         (P.CD_RESPONSAVEL = R.CD_PESSOA)'
      'WHERE'
      '   P.CD_PESSOA = :CD_PESSOA AND'
      '   P.CD_DEPTO = :CD_DEPTO AND'
      '   P.TP_DESCONTO = 2 AND'
      '   CURDATE() BETWEEN P.DT_INICIO AND P.DT_FIM')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_DEPTO'
        ParamType = ptUnknown
      end>
    object qryDivisaoProgramadaCD_DESCONTO_PESSOA: TLargeintField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryDivisaoProgramadaCD_PESSOA: TLargeintField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryDivisaoProgramadaCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
      Required = True
    end
    object qryDivisaoProgramadaDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qryDivisaoProgramadaDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
    object qryDivisaoProgramadaVL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
    end
    object qryDivisaoProgramadaNR_PARC_INICIO: TSmallintField
      FieldName = 'NR_PARC_INICIO'
    end
    object qryDivisaoProgramadaNR_PARC_FIM: TIntegerField
      FieldName = 'NR_PARC_FIM'
    end
    object qryDivisaoProgramadaDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Size = 150
    end
    object qryDivisaoProgramadaCD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
    end
    object qryDivisaoProgramadaTP_DESCONTO: TSmallintField
      FieldName = 'TP_DESCONTO'
      Required = True
    end
    object qryDivisaoProgramadaNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 60
    end
    object qryDivisaoProgramadasn_manter_desconto_fixo: TSmallintField
      FieldName = 'sn_manter_desconto_fixo'
    end
    object qryDivisaoProgramadanr_forma_aplicar_divisao: TSmallintField
      FieldName = 'nr_forma_aplicar_divisao'
    end
  end
  object qryTiposTituloDivisao: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_DESCONTO_PESSOA,'
      '   CD_TIPO_TITULO,'
      '   CD_COLIGADA'
      'FROM'
      '   FIN_TP_TITULOS_PESSOAS_DESC'
      'WHERE'
      '   CD_DESCONTO_PESSOA = :CD_DESCONTO_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    DataSource = dsDivisaoProgramada
    Left = 440
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_DESCONTO_PESSOA'
        ParamType = ptUnknown
      end>
    object qryTiposTituloDivisaoCD_DESCONTO_PESSOA: TIntegerField
      FieldName = 'CD_DESCONTO_PESSOA'
      Required = True
    end
    object qryTiposTituloDivisaoCD_TIPO_TITULO: TSmallintField
      FieldName = 'CD_TIPO_TITULO'
      Required = True
    end
    object qryTiposTituloDivisaoCD_COLIGADA: TSmallintField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
  end
  object dsDivisaoProgramada: TDataSource
    DataSet = qryDivisaoProgramada
    Left = 424
    Top = 264
  end
  object cdsDescontos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_DESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_COMPORTAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DS_OBSERVACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'SN_DESCONTO_PLANO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 252
    Top = 144
    Data = {
      E30000009619E0BD010000001800000007000000000003000000E3000B564C5F
      444553434F4E544F080004000000010007535542545950450200490006004D6F
      6E6579001143445F4143414F5F4D4F56494D454E544F04000100000000001043
      445F5449504F5F444553434F4E544F04000100000000001543445F5449504F5F
      434F4D504F5254414D454E544F04000100000000000D44535F4F425345525641
      43414F020049000000010005574944544802000200FF000B4944585F50415243
      454C41040001000000000011534E5F444553434F4E544F5F504C414E4F040001
      00000000000000}
    object cdsDescontosVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDescontosCD_ACAO_MOVIMENTO: TIntegerField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsDescontosCD_TIPO_DESCONTO: TIntegerField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object cdsDescontosCD_TIPO_COMPORTAMENTO: TIntegerField
      FieldName = 'CD_TIPO_COMPORTAMENTO'
    end
    object cdsDescontosDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 255
    end
    object cdsDescontosIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
    object cdsDescontosSN_DESCONTO_PLANO: TIntegerField
      FieldName = 'SN_DESCONTO_PLANO'
    end
  end
  object cdsDescontosDivididos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VL_DESCONTO'
        DataType = ftCurrency
      end
      item
        Name = 'CD_ACAO_MOVIMENTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_DESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO_COMPORTAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DS_OBSERVACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IDX_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'SN_DESCONTO_PLANO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 263
    Data = {
      E30000009619E0BD010000001800000007000000000003000000E3000B564C5F
      444553434F4E544F080004000000010007535542545950450200490006004D6F
      6E6579001143445F4143414F5F4D4F56494D454E544F04000100000000001043
      445F5449504F5F444553434F4E544F04000100000000001543445F5449504F5F
      434F4D504F5254414D454E544F04000100000000000D44535F4F425345525641
      43414F020049000000010005574944544802000200FF000B4944585F50415243
      454C41040001000000000011534E5F444553434F4E544F5F504C414E4F040001
      00000000000000}
    object cdsDescontosDivididosVL_DESCONTO: TCurrencyField
      FieldName = 'VL_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDescontosDivididosCD_ACAO_MOVIMENTO: TIntegerField
      FieldName = 'CD_ACAO_MOVIMENTO'
    end
    object cdsDescontosDivididosCD_TIPO_DESCONTO: TIntegerField
      FieldName = 'CD_TIPO_DESCONTO'
    end
    object cdsDescontosDivididosCD_TIPO_COMPORTAMENTO: TIntegerField
      FieldName = 'CD_TIPO_COMPORTAMENTO'
    end
    object cdsDescontosDivididosDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
    end
    object cdsDescontosDivididosIDX_PARCELA: TIntegerField
      FieldName = 'IDX_PARCELA'
    end
    object cdsDescontosDivididosSN_DESCONTO_PLANO: TIntegerField
      FieldName = 'SN_DESCONTO_PLANO'
    end
  end
end
