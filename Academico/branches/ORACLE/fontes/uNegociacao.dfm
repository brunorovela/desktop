object frmNegociacao: TfrmNegociacao
  Left = 0
  Top = 25
  BorderStyle = bsDialog
  ClientHeight = 686
  ClientWidth = 1054
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 55
    Width = 1054
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 700
  end
  object Bevel1: TBevel
    Left = 0
    Top = 25
    Width = 1054
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 700
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 60
    Width = 1054
    Height = 626
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Nova Negocia'#231#227'o'
      object Panel4: TPanel
        Left = 0
        Top = 35
        Width = 613
        Height = 529
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 613
          Height = 290
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            613
            290)
          object sbMarcarVencidas: TSpeedButton
            Left = 580
            Top = 2
            Width = 25
            Height = 22
            Hint = 'Selecionar Parcelas Vencidas'
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              76030000424D7603000000000000360000002800000011000000100000000100
              18000000000040030000C30E0000C30E00000000000000000000FFFFFF9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
              9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFFFF00FFFF
              FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFF9C9C9CFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFF00FFFFFF9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9CFFFFFF9C9C9CFFFFFFFFFFFF000000FFFFFFFFFFFF9C
              9C9CFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF9C9C9CFFFFFF000000FFFFFF000000FFFFFF9C9C9CFFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFF
              FFFFFFFF0000009C9C9CFFFFFF00FFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9CFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFF
              FF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFF9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFFFF00FFFFFF9C9C9CFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
              9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF9C9C9CFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            OnClick = sbMarcarVencidasClick
            ExplicitLeft = 554
          end
          object sbDesmarcar: TSpeedButton
            Left = 555
            Top = 2
            Width = 25
            Height = 22
            Hint = 'Desmarcar parcelas selecionadas'
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              76030000424D7603000000000000360000002800000011000000100000000100
              18000000000040030000C30E0000C30E00000000000000000000FFFFFF999999
              999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFF999999999999999999999999999999999999999999FFFFFF00FFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFF9999999999999999999999
              99999999999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF999999FFFFFF00FFFFFF999999999999999999999999999999
              999999999999FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFF
              FF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFF999999
              999999999999999999999999999999999999FFFFFF00FFFFFF999999FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
              9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF999999FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFF999999999999999999999999999999999999999999FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            OnClick = sbDesmarcarClick
          end
          object sbMarcar: TSpeedButton
            Left = 529
            Top = 2
            Width = 25
            Height = 22
            Hint = 'Selecionar Parcelas'
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              82020000424D8202000000000000420000002800000011000000100000000100
              10000300000040020000C30E0000C30E00000000000000000000007C0000E003
              00001F000000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7F
              FF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
              FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
              FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F0000FF7F
              734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7FFF7FFF7F
              FF7F0000734EFF7F734E734E734E734E734E734E734EFF7F0000FF7F734EFF7F
              FF7FFF7FFF7FFF7F734EFF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F
              734E734E734E734E734E734E734EFF7F734EFF7FFF7F0000FF7FFF7F734EFF7F
              0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7F0000FF7F0000FF7F
              734EFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7F
              FF7F0000734EFF7F0000FF7F734E734E734E734E734E734E734EFF7F734EFF7F
              FF7FFF7FFF7FFF7F734EFF7F0000FF7F734EFF7FFF7FFF7FFF7FFF7F734EFF7F
              734E734E734E734E734E734E734EFF7F0000FF7F734EFF7FFF7F0000FF7FFF7F
              734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F0000FF7F
              0000FF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F734EFF7F
              FF7FFF7FFF7F0000734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
              734EFF7FFF7FFF7FFF7FFF7F734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              0000FF7F734E734E734E734E734E734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              FF7FFF7F0000}
            OnClick = sbMarcarClick
          end
          object sbParcelasPagas: TSpeedButton
            Left = 500
            Top = 2
            Width = 25
            Height = 22
            Hint = 'Apresentar parcelas j'#225' pagas'
            AllowAllUp = True
            Anchors = [akTop, akRight]
            GroupIndex = 1
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            Visible = False
            OnClick = sbParcelasPagasClick
            ExplicitLeft = 474
          end
          object Label5: TLabel
            Left = 5
            Top = 6
            Width = 288
            Height = 13
            Caption = 'Selecione as parcelas atuais que ser'#227'o negociadas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object grdAtuais: TStringGrid
            AlignWithMargins = True
            Left = 4
            Top = 26
            Width = 603
            Height = 246
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderStyle = bsNone
            ColCount = 12
            DefaultColWidth = 60
            DefaultRowHeight = 19
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs, goRowSelect]
            ParentFont = False
            TabOrder = 0
            OnClick = grdAtuaisClick
            OnDrawCell = grdAtuaisDrawCell
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 290
          Width = 613
          Height = 239
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 7
            Top = 16
            Width = 573
            Height = 219
            Caption = '   Composi'#231#227'o dos valores da negocia'#231#227'o:   '
            TabOrder = 1
            DesignSize = (
              573
              219)
            object Label7: TLabel
              Left = 6
              Top = 97
              Width = 212
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '( + ) Acr'#233'scimos por atraso de pagamentos:'
            end
            object Label12: TLabel
              Left = 325
              Top = 98
              Width = 139
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Ref. negocia'#231#245'es anteriores:'
            end
            object Label32: TLabel
              Left = 6
              Top = 127
              Width = 173
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '( - ) Descontos nas novas parcelas: '
            end
            object Label8: TLabel
              Left = 6
              Top = 155
              Width = 164
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = '( = ) Valor total l'#237'quido a negociar:'
            end
            object Label10: TLabel
              Left = 6
              Top = 184
              Width = 84
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Valor da entrada:'
            end
            object Label6: TLabel
              Left = 6
              Top = 42
              Width = 122
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'Valor Nominal a Negociar:'
            end
            object Label4: TLabel
              Left = 185
              Top = 127
              Width = 32
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Em %:'
            end
            object Label11: TLabel
              Left = 281
              Top = 126
              Width = 45
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Em Valor:'
            end
            object Label2: TLabel
              Left = 402
              Top = 155
              Width = 64
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Em Cr'#233'ditos: '
            end
            object Label21: TLabel
              Left = 402
              Top = 184
              Width = 30
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Saldo:'
            end
            object Label22: TLabel
              Left = 6
              Top = 18
              Width = 111
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'Regras de Negocia'#231#227'o:'
            end
            object UMAjuda1: TUMAjuda
              Left = 535
              Top = 11
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
                'Ao utilizar uma regra de negocia'#231#227'o os valores e as configura'#231#245'e' +
                's da negocia'#231#227'o s'#227'o '#13#10'setados com base nos valores definidos no ' +
                'plano de negocia'#231#227'o selecionado.'#13#10#13#10'S'#227'o apenas apresentadas regr' +
                'as ativas, com data de limite de vencimento com pelo menos'#13#10'um m' +
                #234's a frente e tamb'#233'm onde existam parcelas disponiveis para sere' +
                'm negociadas.'#13#10#13#10'Ao selecionar uma regra as linhas que c'#244'ntem me' +
                'nsalidades que possuem um tipo de titulo '#13#10'diferente dos tipos n' +
                'egociaveis s'#227'o destacadas em vermelho e n'#227'o s'#227'o selecionadas por' +
                ' padr'#227'o.'
              Titulo = 'AJUDA'
              PanelWidth = 500
              PanelHeight = 250
            end
            object Label23: TLabel
              Left = 6
              Top = 70
              Width = 93
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = '( + ) Valor da Multa'
            end
            object lblPercentualEntrada: TLabel
              Left = 194
              Top = 184
              Width = 28
              Height = 13
              Caption = 'em %'
            end
            object lblValorEntrada: TLabel
              Left = 283
              Top = 184
              Width = 41
              Height = 13
              Caption = 'em valor'
            end
            object dbBruto: TDBEdit
              Left = 228
              Top = 40
              Width = 178
              Height = 21
              Color = clBtnFace
              DataField = 'vl_bruto_negocia'
              DataSource = dsNegocia
              ReadOnly = True
              TabOrder = 1
              OnExit = dbBrutoExit
              OnKeyPress = dbBrutoKeyPress
            end
            object dbJurosNegociados: TDBEdit
              Left = 470
              Top = 95
              Width = 91
              Height = 21
              Anchors = [akTop, akRight]
              Color = clBtnFace
              DataField = 'JurosNegociado'
              DataSource = dsNegocia
              TabOrder = 4
              OnKeyPress = dbBrutoKeyPress
            end
            object edPorcentagemDesc: TUMEditMonetario
              Left = 228
              Top = 123
              Width = 52
              Height = 21
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              TabOrder = 5
              Text = '0,00'
              OnEnter = edPorcentagemDescEnter
              OnExit = edPorcentagemDescExit
              OnKeyPress = edPorcentagemDescKeyPress
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
            object edValorDesc: TUMEditMonetario
              Left = 335
              Top = 123
              Width = 61
              Height = 21
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              TabOrder = 6
              Text = '0,00'
              OnEnter = edValorDescEnter
              OnExit = edValorDescExit
              OnKeyPress = edValorDescKeyPress
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
            object dbLiberarDescontos: TCheckBox
              Left = 425
              Top = 123
              Width = 136
              Height = 17
              Anchors = [akTop, akRight]
              Caption = 'Manter ap'#243's vencimento'
              TabOrder = 7
            end
            object dbTotal: TDBEdit
              Left = 261
              Top = 225
              Width = 195
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'ValTotal'
              DataSource = dsNegocia
              ReadOnly = True
              TabOrder = 13
              OnKeyPress = dbBrutoKeyPress
            end
            object dbEntrada: TDBEdit
              Left = 330
              Top = 181
              Width = 66
              Height = 21
              DataField = 'vl_entrada'
              DataSource = dsNegocia
              TabOrder = 11
              OnChange = dbEntradaChange
              OnExit = dbEntradaExit
              OnKeyPress = dbBrutoKeyPress
            end
            object dbLiquido: TDBEdit
              Left = 228
              Top = 152
              Width = 168
              Height = 21
              Color = clBtnFace
              DataField = 'ValTotal'
              DataSource = dsNegocia
              ReadOnly = True
              TabOrder = 8
              OnKeyPress = dbBrutoKeyPress
            end
            object dbCreditos: TDBEdit
              Left = 471
              Top = 152
              Width = 91
              Height = 21
              Anchors = [akRight]
              Color = clBtnFace
              DataField = 'vl_creditos'
              DataSource = dsNegocia
              ReadOnly = True
              TabOrder = 9
              OnKeyPress = dbBrutoKeyPress
            end
            object DBEdit1: TDBEdit
              Left = 471
              Top = 181
              Width = 91
              Height = 21
              Anchors = [akRight]
              Color = clBtnFace
              DataField = 'ValLiquido'
              DataSource = dsNegocia
              ReadOnly = True
              TabOrder = 12
              OnKeyPress = dbBrutoKeyPress
            end
            object cbRegras: TUMComboBox
              Left = 228
              Top = 11
              Width = 295
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cbRegrasChange
              TamanhoMaximo = 0
            end
            object edJuros: TUMEditMonetario
              Left = 228
              Top = 95
              Width = 90
              Height = 21
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              TabOrder = 3
              Text = '0,00'
              OnChange = edJurosChange
              OnExit = edJurosExit
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
            object edMulta: TUMEditMonetario
              Left = 228
              Top = 67
              Width = 90
              Height = 21
              BiDiMode = bdRightToLeft
              Enabled = False
              ParentBiDiMode = False
              ReadOnly = True
              TabOrder = 2
              Text = '0,00'
              OnChange = edJurosChange
              OnExit = edJurosExit
              Mascara = '###,###,##0.00'
              CasasDecimais = 2
              EnterProximoCampo = True
            end
            object edtPercentualEntrada: TEdit
              Left = 228
              Top = 181
              Width = 52
              Height = 21
              TabOrder = 10
              OnExit = edtPercentualEntradaExit
              OnKeyPress = edtPercentualEntradaKeyPress
            end
          end
          object ckbCorrige: TCheckBox
            Left = 7
            Top = -2
            Width = 397
            Height = 17
            Caption = 
              'Corrigir os valores com multas e juros at'#233' a data da entrada da ' +
              'negocia'#231#227'o.'
            TabOrder = 0
            OnClick = ckbCorrigeClick
          end
        end
      end
      object Panel5: TPanel
        Left = 613
        Top = 35
        Width = 433
        Height = 529
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel3: TBevel
          Left = 0
          Top = 0
          Width = 10
          Height = 314
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 448
          ExplicitTop = 456
          ExplicitHeight = 50
        end
        object Panel12: TPanel
          Left = 0
          Top = 314
          Width = 433
          Height = 215
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object W: TGroupBox
            Left = 6
            Top = 9
            Width = 411
            Height = 206
            Caption = '   Dados sobre as novas parcelas:   '
            TabOrder = 0
            object Label16: TLabel
              Left = 15
              Top = 156
              Width = 67
              Height = 13
              Caption = 'Observa'#231#245'es:'
            end
            object Label30: TLabel
              Left = 15
              Top = 132
              Width = 163
              Height = 13
              Caption = 'Tipo de T'#237'tulo das novas parcelas:'
            end
            object Label15: TLabel
              Left = 15
              Top = 106
              Width = 178
              Height = 13
              Caption = 'V'#237'ncular as novas parcelas na Turma:'
            end
            object Label14: TLabel
              Left = 380
              Top = 77
              Width = 12
              Height = 16
              Caption = '%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 15
              Top = 79
              Width = 157
              Height = 13
              Caption = 'Incluir Juros nas novas parcelas:'
            end
            object sb6X: TSpeedButton
              Left = 261
              Top = 24
              Width = 24
              Height = 21
              Caption = '6 x'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = sb6XClick
            end
            object sb5X: TSpeedButton
              Left = 238
              Top = 24
              Width = 23
              Height = 21
              Caption = '5 x'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = sb5XClick
            end
            object sb4X: TSpeedButton
              Left = 213
              Top = 24
              Width = 25
              Height = 21
              Caption = '4 x'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = sb4XClick
            end
            object sb3X: TSpeedButton
              Left = 189
              Top = 24
              Width = 24
              Height = 21
              Caption = '3 x'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = sb3XClick
            end
            object sb2X: TSpeedButton
              Left = 165
              Top = 24
              Width = 24
              Height = 21
              Caption = '2 x'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = sb2XClick
            end
            object sb1X: TSpeedButton
              Left = 142
              Top = 24
              Width = 23
              Height = 21
              Caption = '1 x'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = sb1XClick
            end
            object Label19: TLabel
              Left = 15
              Top = 28
              Width = 118
              Height = 13
              Alignment = taRightJustify
              Caption = 'Quantidade de parcelas:'
            end
            object Label17: TLabel
              Left = 298
              Top = 28
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = '+ Parcelas:'
            end
            object Label18: TLabel
              Left = 15
              Top = 54
              Width = 100
              Height = 13
              Caption = 'Primeiro vencimento:'
            end
            object btnCalcular: TBitBtn
              Left = 266
              Top = 176
              Width = 135
              Height = 25
              Hint = 'Efetuar simula'#231#227'o de c'#225'lculo'
              Caption = 'F5 Atualizar c'#225'lculo '
              TabOrder = 0
              OnClick = btnCalcularClick
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
            end
            object dbOBS: TDBEdit
              Left = 91
              Top = 154
              Width = 311
              Height = 21
              DataField = 'ds_negocia'
              DataSource = dsNegocia
              TabOrder = 8
              OnKeyPress = dbBrutoKeyPress
            end
            object cbTipoTitulos: TUMComboBox
              Left = 199
              Top = 129
              Width = 203
              Height = 22
              Style = csOwnerDrawFixed
              ItemHeight = 16
              TabOrder = 7
              OnChange = cbTipoTitulosChange
              TamanhoMaximo = 0
            end
            object cbTurma: TComboBox
              Left = 199
              Top = 103
              Width = 203
              Height = 22
              Style = csOwnerDrawFixed
              ItemHeight = 16
              TabOrder = 6
              OnChange = cbTurmaChange
              OnKeyPress = dbBrutoKeyPress
            end
            object txtJuros: TEdit
              Left = 303
              Top = 77
              Width = 72
              Height = 21
              TabOrder = 5
              Text = '2'
              OnChange = txtJurosChange
              OnExit = txtJurosExit
              OnKeyPress = txtJurosKeyPress
            end
            object cbData: TComboBox
              Left = 199
              Top = 51
              Width = 98
              Height = 22
              Style = csOwnerDrawFixed
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 2
              Text = 'A partir de:'
              Items.Strings = (
                'A partir de:'
                'Entrada em:')
            end
            object umdtApartir: TUMDateTimePicker
              Left = 303
              Top = 50
              Width = 96
              Height = 21
              BevelOuter = bvNone
              TabOrder = 3
              ImgBotaoCalendario.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
                D8E9EC9BA0B99CA3BDA1A6BEA0A2B9A8A8B9ABA5B2A59FAAA7A6B893A0BD789E
                C78CA5B5C0B39ED8E9ECD8E9ECC6DBF29EBBDC86AAD27BA1CB799EC67FA0C688
                A6C78CA6C58FABCA809EC27DA3CC6DA0D090ACBFB5AB98BCB0A487DFF64AA2E2
                3A95D53B9AE13192DD3698E2409DE23C95D93C95DC3A95DF3C97E14399DF4D95
                D483A5BDAEAA9BB3A99E279AEC309CE43297D839A0E6339DE9309BE83A9EE235
                97DD389DEB37A1F5349AEA3E99DF51A0E278A1C0A6A69DB5AEA63490D67CCAEE
                BDFAFF84C1DBB8F9FF86C8E8B5EDFBA5DDF195D5F1A0E7FC87C5EFBEF3FF75BB
                F170A3C9A0A7A5B0ADA74AA5F27BBFE2D1FEFF91BDD1BFF0FF94C6DFCFF4FABA
                E1F3ABDEF3B0ECFD98C7F2D4F7FF6FB3EB629DCC9FADAEADADAB1887F050A2E7
                81B5D77FB0D279B0DD6FA7DB8BB6DB7DABD869A5E9549CF1639BDE89B0DB5DA8
                ED599BD098ABB2A0A5A5158FFE66C1FCBAF3FF8EC2E6B7F2FF85C1EFC0EEFCA4
                D7F72F72C3084DB373AFF3C8F2FF6CBAFD539AD292A9B3A5ABAD138FFF64BEFF
                BBF4FF8BC0EBB0ECFF85C4FCBDEDFE9ED1F7286BC80648B864A3F0C2EEFF62B4
                FA549BD790A9B4A3ABAD1D8AF94898EC80B1E26F9ECF82B6F3679DE088B0E581
                ACE9528CDF3076DB659AED8AB1EB58A5F45095D28BA1AD9CA3A64B99EE8FC6EF
                D8F7FFAAC7DFD4F5FFA5C9EAD2E9FCBDD6F7B5DBF7B4E3FEA4C6F9D4EEFF6FB6
                F75D9FD99AADB8ACB1B3438CD788C3E9CDF9FF99C5E3C5F5FF91C1E7C8F0FBB4
                DAF3A9D8F3AFE6FD97C4F1CCF5FF6EB7F7609ED293A4AC9EA2A5379DF241A1EC
                49A4E646A2EA4BABF83C9BEB50A9F14DA3ED4CA7F641A0F74DA7F94FA2ED479E
                ED659BCB9BA6AAA6A6A63196EE2E94EB1F87DD2691EF1D8BED1C8AEC2992EF1E
                83DF2A90ED1F86E7238BEC2184E12A83D771A2CDC9D0D1E5E2E2458BDC4491E9
                287DDE2D88F1207BE72681EB3B92F92B7FE13A8AE92B7CDD3086EB2F86EB3B8C
                E08EBBE2EAF0F0D8E9ECB5EDFF80C0F9317DE269BBFD3084F15DAFF43B8AF14F
                9AEA62A8F33D83DF6DB9FE2D7EE779C6F7C4EFFFD8E9ECD8E9EC}
              OnChangeDate = umdtApartirChangeDate
              Date = 42271.000000000000000000
              InverterPosicaoCalendario = False
              MostraCalenadarioDesdeCampoTexto = True
            end
            object txtParcelas: TSpinEdit
              Left = 359
              Top = 22
              Width = 45
              Height = 22
              MaxValue = 99
              MinValue = 1
              TabOrder = 1
              Value = 1
              OnChange = txtParcelasChange
              OnKeyPress = dbBrutoKeyPress
            end
            object cbJuros: TComboBox
              Left = 199
              Top = 77
              Width = 98
              Height = 22
              Style = csOwnerDrawFixed
              Color = clBtnFace
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 4
              Text = 'Simples'
              OnChange = cbJurosChange
              Items.Strings = (
                'Simples'
                'Composto')
            end
          end
        end
        object Panel13: TPanel
          Left = 10
          Top = 0
          Width = 423
          Height = 314
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            423
            314)
          object Label9: TLabel
            Left = 2
            Top = 6
            Width = 290
            Height = 13
            Caption = 'Novas parcelas que ser'#227'o geradas pela negocia'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object grdTotais: TStringGrid
            Left = 2
            Top = 268
            Width = 411
            Height = 21
            TabStop = False
            Anchors = [akLeft, akRight, akBottom]
            BorderStyle = bsNone
            Color = clBtnFace
            ColCount = 6
            DefaultColWidth = 48
            DefaultRowHeight = 19
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
            ParentFont = False
            ScrollBars = ssNone
            TabOrder = 0
            OnDrawCell = grdTotaisDrawCell
            OnKeyPress = grdNovasKeyPress
            RowHeights = (
              19)
          end
          object grdNovas: TStringGrid
            Left = 6
            Top = 25
            Width = 411
            Height = 244
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderStyle = bsNone
            ColCount = 6
            DefaultColWidth = 60
            DefaultRowHeight = 19
            RowCount = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs]
            ParentFont = False
            TabOrder = 1
            OnDrawCell = grdNovasDrawCell
            OnGetEditMask = grdNovasGetEditMask
            OnKeyDown = grdNovasKeyDown
            OnKeyPress = grdNovasKeyPress
            OnSelectCell = grdNovasSelectCell
            OnSetEditText = grdNovasSetEditText
            RowHeights = (
              19
              19
              19
              19
              19
              19
              19
              19
              19
              19
              19
              22
              19
              19
              19
              19
              19
              19
              19
              19)
          end
        end
      end
      object pnRodape: TPanel
        Left = 0
        Top = 564
        Width = 1046
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          1046
          34)
        object Bevel2: TBevel
          Left = 480
          Top = -56
          Width = 50
          Height = 50
        end
        object btnCancelar: TBitBtn
          Left = 913
          Top = 2
          Width = 116
          Height = 31
          Hint = 'Cancelar Negocia'#231#227'o'
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = 'Cancelar'
          TabOrder = 0
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
        object btnSimular: TBitBtn
          Left = 772
          Top = 2
          Width = 136
          Height = 31
          Hint = 'Confirmar Negocia'#231#227'o'
          Anchors = [akTop, akRight]
          Caption = 'Salvar Simula'#231#227'o'
          TabOrder = 1
          OnClick = SpeedButton2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
        end
        object btnConfirmar: TBitBtn
          Left = 619
          Top = 3
          Width = 149
          Height = 31
          Hint = 'Confirmar Negocia'#231#227'o'
          Anchors = [akTop, akRight]
          Caption = 'Confirmar Negocia'#231#227'o'
          TabOrder = 2
          OnClick = btnConfirmarClick
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
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1046
        Height = 35
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        object Label31: TLabel
          Left = 5
          Top = 10
          Width = 129
          Height = 13
          Caption = 'Simula'#231#245'es de Negocia'#231#227'o:'
        end
        object sbExcluir: TSpeedButton
          Left = 579
          Top = 7
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          OnClick = sbExcluirClick
        end
        object cbSimulacao: TComboBox
          Left = 140
          Top = 7
          Width = 439
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
          Text = 'Iniciar uma nova negocia'#231#227'o'
          OnChange = SpeedButton3Click
          Items.Strings = (
            'Iniciar uma nova negocia'#231#227'o')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Negocia'#231#245'es Anteriores'
      ImageIndex = 1
      object pnRegistradas: TPanel
        Left = 0
        Top = 0
        Width = 1046
        Height = 199
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1046
          199)
        object DBGrid1: TDBGrid
          Left = 9
          Top = 32
          Width = 1030
          Height = 160
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          DataSource = dsNegociaAnterior
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taLeftJustify
              Expanded = False
              FieldName = 'cd_negocia'
              Title.Caption = 'C'#243'd. '
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_negocia'
              Title.Caption = 'Data/Hora'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValTotal'
              Title.Alignment = taRightJustify
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_entrada'
              Title.Alignment = taRightJustify
              Title.Caption = 'Entrada'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_bruto_negocia'
              Title.Alignment = taRightJustify
              Title.Caption = 'Bruto'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_juros_negocia'
              Title.Alignment = taRightJustify
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValLiquido'
              Title.Alignment = taRightJustify
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vl_creditos'
              Title.Alignment = taRightJustify
              Title.Caption = 'Nr. Cr'#233'ditos'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_simula'
              Title.Caption = 'Usu'#225'rio Sim.'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_negocia'
              Title.Caption = 'Usu'#225'rio Neg.'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_negocia'
              Width = 180
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 1046
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label20: TLabel
            Left = 8
            Top = 7
            Width = 255
            Height = 13
            Caption = 'Negocia'#231#245'es realizadas para este estudante.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 199
        Width = 609
        Height = 365
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          609
          365)
        object Label27: TLabel
          Left = 9
          Top = 6
          Width = 179
          Height = 13
          Caption = 'Parcelas que foram negociadas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid2: TDBGrid
          Left = 9
          Top = 25
          Width = 592
          Height = 334
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          DataSource = dsParcAtual
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'parcela'
              Width = 55
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'datavencimento'
              Title.Alignment = taCenter
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_tipo_titulo'
              Title.Caption = 'Tipo de T'#237'tulo'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_bruto'
              Title.Alignment = taRightJustify
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorjuros'
              Title.Alignment = taRightJustify
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_total'
              Title.Alignment = taRightJustify
              Width = 80
              Visible = True
            end>
        end
      end
      object Panel2: TPanel
        Left = 609
        Top = 199
        Width = 437
        Height = 365
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          437
          365)
        object Label28: TLabel
          Left = 6
          Top = 6
          Width = 226
          Height = 13
          Caption = 'Novas parcelas criadas pela negocia'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid3: TDBGrid
          Left = 6
          Top = 27
          Width = 424
          Height = 334
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          DataSource = dsParcNova
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'parcela'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'datavencimento'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_total'
              Title.Alignment = taRightJustify
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorpago'
              Title.Alignment = taRightJustify
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'datapagamento'
              Title.Alignment = taCenter
              Width = 80
              Visible = True
            end>
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 564
        Width = 1046
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        DesignSize = (
          1046
          34)
        object btnNegociacao: TSpeedButton
          Left = 583
          Top = 2
          Width = 152
          Height = 31
          Anchors = [akTop, akRight]
          Caption = 'Imprimir Negocia'#231#227'o'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
            0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C60000000000C6C6C60000000000FF00FF00FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000C6C6C60000000000FF00FF0000000000C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
            FF00C6C6C600C6C6C600000000000000000000000000FF00FF0000000000C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
            8400C6C6C600C6C6C60000000000C6C6C60000000000FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C60000000000C6C6C60000000000C6C6C60000000000FF00FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000C6C6C60000000000C6C6C6000000000000000000FF00FF00FF00
            FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
            0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
            000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
            000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnNegociacaoClick
          ExplicitLeft = 557
        end
        object btnDesfazer: TSpeedButton
          Left = 739
          Top = 2
          Width = 152
          Height = 31
          Anchors = [akTop, akRight]
          Caption = 'Desfazer Negocia'#231#227'o'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          OnClick = btnDesfazerClick
        end
        object BitBtn1: TBitBtn
          Left = 897
          Top = 2
          Width = 142
          Height = 31
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = 'Fechar'
          TabOrder = 0
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1054
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'NEGOCIA'#199#195'O FINANCEIRA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 1054
    Height = 25
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 35
      Height = 13
      Caption = 'Nome:'
    end
    object lbNome: TLabel
      Left = 56
      Top = 5
      Width = 409
      Height = 13
      AutoSize = False
      Caption = 'CLAUDIONOR SILVEIRA'
    end
    object Label3: TLabel
      Left = 480
      Top = 4
      Width = 70
      Height = 13
      Caption = 'C'#243'd. Pessoa:'
    end
    object lbCodigo: TLabel
      Left = 560
      Top = 4
      Width = 81
      Height = 13
      AutoSize = False
      Caption = '000000-0'
    end
  end
  object tblMensalidades: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblMensalidadesCalcFields
    BeforePost = tblMensalidadesBeforePost
    SQL.Strings = (
      'select r.nm_pessoa as nm_resp'
      '     , m.datavencimento'
      '     , m.databasecorrecao'
      '     , m.situacao'
      '     , m.parcela'
      '     , m.cd_mensalidade'
      '     , m.sn_liberar_juros'
      '     , m.sn_liberar_descontos'
      '     , m.valorjuros'
      '     , m.valorjuros_fixo'
      '     , m.valorbruto'
      '     , m.valordesconto'
      '     , m.valorextra'
      '     , m.valorpago'
      '     , m.descontoextra'
      '     , m.valortotal'
      '     , m.turma'
      '     , m.anosemestre'
      '     , m.nr_creditos'
      '     , m.tipoparcela'
      '     , tti.ds_tipo_titulo'
      '     , tti.cd_tipo_titulo'
      
        '     , GET_ACRESCIMOS(m.cd_mensalidade, NULL ) as juros_calc    ' +
        '       '
      
        '     , GET_DESCONTOS(m.cd_mensalidade, NULL ) as desconto_calc  ' +
        '        '
      ''
      ' from Mensalidades AS m'
      'INNER JOIN Pessoas AS p ON (m.CodigoAluno = p.cd_pessoa ) '
      
        'LEFT JOIN pessoas AS r ON (IFNULL(m.cd_resp, p.cd_resp_finan) = ' +
        'r.cd_pessoa)'
      
        'LEFT JOIN fin_tipos_titulo tti ON (m.cd_tipo_titulo = tti.cd_tip' +
        'o_titulo AND m.cd_coligada = tti.cd_coligada)'
      'LIMIT 10')
    Params = <>
    Left = 288
    Top = 56
    object tblMensalidadesValorTotalCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorTotalCalc'
      Calculated = True
    end
    object tblMensalidadesValorJurosCalc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorJurosCalc'
      Calculated = True
    end
    object tblMensalidadesValorDescontoCalc: TCurrencyField
      Tag = 1
      DisplayLabel = 'Desc.Cond.'
      FieldKind = fkCalculated
      FieldName = 'ValorDescontoCalc'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object tblMensalidadesdatavencimento: TDateTimeField
      FieldName = 'datavencimento'
    end
    object tblMensalidadesdatabasecorrecao: TDateTimeField
      FieldName = 'databasecorrecao'
    end
    object tblMensalidadessituacao: TSmallintField
      FieldName = 'situacao'
    end
    object tblMensalidadesparcela: TSmallintField
      FieldName = 'parcela'
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
    end
    object tblMensalidadessn_liberar_juros: TSmallintField
      FieldName = 'sn_liberar_juros'
    end
    object tblMensalidadessn_liberar_descontos: TSmallintField
      FieldName = 'sn_liberar_descontos'
    end
    object tblMensalidadesvalorjuros: TFloatField
      FieldName = 'valorjuros'
    end
    object tblMensalidadesvalorjuros_fixo: TFloatField
      FieldName = 'valorjuros_fixo'
    end
    object tblMensalidadesvalorbruto: TFloatField
      FieldName = 'valorbruto'
    end
    object tblMensalidadesvalordesconto: TFloatField
      FieldName = 'valordesconto'
    end
    object tblMensalidadesvalorextra: TFloatField
      FieldName = 'valorextra'
    end
    object tblMensalidadesvalorpago: TFloatField
      FieldName = 'valorpago'
    end
    object tblMensalidadesdescontoextra: TFloatField
      FieldName = 'descontoextra'
    end
    object tblMensalidadesturma: TStringField
      FieldName = 'turma'
      Size = 50
    end
    object tblMensalidadesanosemestre: TSmallintField
      FieldName = 'anosemestre'
    end
    object tblMensalidadesnr_creditos: TFloatField
      FieldName = 'nr_creditos'
    end
    object tblMensalidadesvalortotal: TFloatField
      FieldName = 'valortotal'
    end
    object tblMensalidadestipoparcela: TSmallintField
      FieldName = 'tipoparcela'
    end
    object tblMensalidadesnm_resp: TStringField
      FieldName = 'nm_resp'
      Size = 60
    end
    object tblMensalidadesjuros_calc: TFloatField
      FieldName = 'juros_calc'
    end
    object tblMensalidadesdesconto_calc: TFloatField
      FieldName = 'desconto_calc'
    end
    object tblMensalidadesds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object tblMensalidadescd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
    end
  end
  object qryPoupanca: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select Avg( IndicePoupanca ) as Media from Poupanca'
      'where'
      'Data >= :DataInicio and Data <= :DataFim')
    Params = <
      item
        DataType = ftDateTime
        Name = 'DataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataFim'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DataFim'
        ParamType = ptUnknown
      end>
    object qryPoupancaMedia: TFloatField
      FieldName = 'Media'
    end
  end
  object qyNegocia: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyNegociaCalcFields
    BeforePost = qyNegociaBeforePost
    AfterPost = qyNegociaAfterPost
    SQL.Strings = (
      'SELECT * from fin_negocia'
      'WHERE cd_pessoa = :CdPessoa AND cd_negocia = :CdNegocia')
    Params = <
      item
        DataType = ftInteger
        Name = 'CdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CdNegocia'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CdNegocia'
        ParamType = ptUnknown
      end>
    object qyNegociacd_negocia: TLargeintField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'cd_negocia'
      Origin = 'WMESTRE12.fin_negocia.cd_negocia'
    end
    object qyNegociacd_pessoa: TIntegerField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.fin_negocia.cd_pessoa'
    end
    object qyNegociads_negocia: TStringField
      DisplayLabel = 'OBS.'
      FieldName = 'ds_negocia'
      Origin = 'WMESTRE12.fin_negocia.ds_negocia'
      Size = 200
    end
    object qyNegociadt_negocia: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'dt_negocia'
      Origin = 'WMESTRE12.fin_negocia.dt_negocia'
    end
    object qyNegociavl_bruto_negocia: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'vl_bruto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_bruto_negocia'
      OnChange = qyNegociavl_bruto_negociaChange
      DisplayFormat = '###,##0.00'
    end
    object qyNegociavl_juros_negocia: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'vl_juros_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_juros_negocia'
      OnChange = qyNegociavl_juros_negociaChange
      DisplayFormat = '###,##0.00'
    end
    object qyNegociavl_entrada: TFloatField
      DisplayLabel = 'Entrada'
      FieldName = 'vl_entrada'
      Origin = 'WMESTRE12.fin_negocia.vl_entrada'
      OnChange = qyNegociavl_entradaChange
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaValLiquido: TCurrencyField
      DisplayLabel = 'L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'ValLiquido'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaValTotal: TCurrencyField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'ValTotal'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaNomeUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeUsuario'
      Size = 30
      Calculated = True
    end
    object qyNegociavl_creditos: TFloatField
      FieldName = 'vl_creditos'
      Origin = 'WMESTRE12.fin_negocia.vl_creditos'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociacd_simulacao: TIntegerField
      FieldName = 'cd_simulacao'
      Origin = 'WMESTRE12.fin_negocia.cd_simulacao'
    end
    object qyNegociaJurosNegociado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'JurosNegociado'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociavl_desconto_negocia: TFloatField
      FieldName = 'vl_desconto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_desconto_negocia'
    end
    object qyNegociacd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
    object qyNegociavl_juros_negocia_visual: TFloatField
      DisplayLabel = 'Juros'
      FieldKind = fkCalculated
      FieldName = 'vl_juros_negocia_visual'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
  end
  object dsNegocia: TDataSource
    DataSet = qyNegocia
    OnDataChange = dsNegociaDataChange
    Left = 352
    Top = 56
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 512
    Top = 56
  end
  object qyParcAtual: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      'm.parcela, m.datavencimento,'
      
        '(COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALESCE(' +
        'm.descontoextra,0)) valor_bruto,'
      'm.valorjuros,'
      
        '(COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALESCE(' +
        'm.descontoextra,0) + COALESCE(m.valorjuros,0)) valor_total'
      ', tt.ds_tipo_titulo'
      'FROM'
      'mensalidades m'
      
        'INNER JOIN fin_negocia_parc_atual n ON (m.cd_mensalidade = n.cd_' +
        'mensalidade)'
      'INNER JOIN coligadas as c oN (c.cd_coligada = m.cd_coligada)'
      
        'INNER JOIN fin_config_tipos_titulo as tt ON (tt.cd_tipo_titulo =' +
        ' m.cd_tipo_titulo and c.CD_COLIGADA_MATRIZ = tt.cd_coligada_matr' +
        'iz)'
      'WHERE'
      '  n.cd_negocia = :cd_negocia')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsNegociaAnterior
    Left = 384
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyParcAtualparcela: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
    end
    object qyParcAtualdatavencimento: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'datavencimento'
    end
    object qyParcAtualds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object qyParcAtualvalor_bruto: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'valor_bruto'
      DisplayFormat = '###,##0.00'
    end
    object qyParcAtualvalorjuros: TFloatField
      DisplayLabel = 'Valor Juros'
      FieldName = 'valorjuros'
      DisplayFormat = '###,##0.00'
    end
    object qyParcAtualvalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      DisplayFormat = '###,##0.00'
    end
  end
  object qyParcNovas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   m.parcela, m.datavencimento, '
      
        '   (COALESCE(m.valorbruto,0) + COALESCE(m.valorextra,0) - COALES' +
        'CE(m.descontoextra,0) - COALESCE(m.valordesconto,0) + COALESCE(I' +
        'F(m.situacao in (2,10), m.valorjuros, m.valorjuros_fixo),0)) val' +
        'or_total,'
      '   m.valorpago, m.datapagamento, m.nossonumero'
      'FROM '
      '   mensalidades m, fin_negocia_parc_nova n'
      'WHERE'
      '  m.cd_mensalidade = n.cd_mensalidade AND '
      '  n.cd_negocia = :cd_negocia')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsNegociaAnterior
    Left = 448
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_negocia'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyParcNovasparcela: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
    end
    object qyParcNovasdatavencimento: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'datavencimento'
    end
    object qyParcNovasvalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      DisplayFormat = '###,##0.00'
    end
    object qyParcNovasvalorpago: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'valorpago'
      DisplayFormat = '###,##0.00'
    end
    object qyParcNovasdatapagamento: TDateTimeField
      DisplayLabel = 'Data Pgto.'
      FieldName = 'datapagamento'
    end
    object qyParcNovasnossonumero: TStringField
      FieldName = 'nossonumero'
      Size = 50
    end
  end
  object dsParcNova: TDataSource
    AutoEdit = False
    DataSet = qyParcNovas
    Left = 480
    Top = 56
  end
  object dsParcAtual: TDataSource
    AutoEdit = False
    DataSet = qyParcAtual
    Left = 416
    Top = 56
  end
  object spNegocia: TZStoredProc
    Connection = DM.db
    Params = <>
    StoredProcName = 'PROC_COMPETENCIA'
    Left = 224
    Top = 56
  end
  object qyNegociaAnterior: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyNegociaAnteriorCalcFields
    SQL.Strings = (
      
        'SELECT n.*, un.nm_pessoa As nm_usuario_negocia, u.nm_pessoa as n' +
        'm_usuario_simula from '
      '   fin_negocia n '
      '   LEFT JOIN pessoas un ON (n.cd_usuario = un.cd_pessoa)'
      
        '   LEFT JOIN fin_negocia_simula s ON (n.cd_simulacao = s.cd_simu' +
        'lacao)'
      '   LEFT JOIN pessoas u ON (s.cd_usuario = u.cd_pessoa)'
      'WHERE n.cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 544
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyNegociaAnteriords_negocia: TStringField
      DisplayLabel = 'OBS.'
      FieldName = 'ds_negocia'
      Origin = 'WMESTRE12.fin_negocia.ds_negocia'
      Size = 200
    end
    object qyNegociaAnteriorcd_negocia: TLargeintField
      DisplayLabel = 'C'#243'd. Pessoa'
      FieldName = 'cd_negocia'
      Origin = 'WMESTRE12.fin_negocia.cd_negocia'
    end
    object qyNegociaAnteriordt_negocia: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'dt_negocia'
      Origin = 'WMESTRE12.fin_negocia.dt_negocia'
      DisplayFormat = 'dd/mm/yy hh:nn'
    end
    object qyNegociaAnteriorvl_bruto_negocia: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'vl_bruto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_bruto_negocia'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaAnteriorvl_juros_negocia: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'vl_juros_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_juros_negocia'
      OnChange = qyNegociavl_juros_negociaChange
      DisplayFormat = '###,##0.00'
    end
    object cd_usuario: TSmallintField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'cd_usuario'
      Origin = 'WMESTRE12.fin_negocia.cd_usuario'
    end
    object qyNegociaAnteriorValLiquido: TCurrencyField
      DisplayLabel = 'L'#237'quido'
      FieldKind = fkCalculated
      FieldName = 'ValLiquido'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaAnteriorValTotal: TCurrencyField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'ValTotal'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaAnteriorvl_creditos: TFloatField
      FieldName = 'vl_creditos'
      Origin = 'WMESTRE12.fin_negocia.vl_creditos'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaAnteriorcd_simulacao: TIntegerField
      FieldName = 'cd_simulacao'
      Origin = 'WMESTRE12.fin_negocia.cd_simulacao'
    end
    object qyNegociaAnteriorJurosNegociado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'JurosNegociado'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qyNegociaAnteriorvl_desconto_negocia: TFloatField
      FieldName = 'vl_desconto_negocia'
      Origin = 'WMESTRE12.fin_negocia.vl_desconto_negocia'
    end
    object qyNegociaAnteriornm_usuario_negocia: TStringField
      FieldName = 'nm_usuario_negocia'
      Size = 30
    end
    object qyNegociaAnteriornm_usuario_simula: TStringField
      FieldName = 'nm_usuario_simula'
      Size = 30
    end
    object qyNegociaAnteriorvl_entrada: TFloatField
      FieldName = 'vl_entrada'
      DisplayFormat = '###,##0.00'
    end
    object qyNegociaAnteriorcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
    end
  end
  object dsNegociaAnterior: TDataSource
    DataSet = qyNegociaAnterior
    Left = 576
    Top = 56
  end
  object qryPlanosNegocia: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  FP.cd_plano_negociacao,'
      '  FP.ds_desc_negocia,'
      '  FT.ds_tipo_titulo,'
      '  FP.vl_entrada_minima,'
      '  FP.nr_max_parcelas,'
      '  FT.cd_tipo_titulo,'
      '  fp.nr_situacao_titulo,'
      '  fp.tp_juros,'
      '  fp.sn_usar_todas_turmas,'
      '  fp.vl_juros,'
      '  fp.vl_min_divida,'
      '  fp.vl_max_divida,'
      
        '  TIMESTAMPDIFF(MONTH, date(now()), date(FP.dt_fim_plano)) as me' +
        'sesDisponiveis,'
      '  fp.vl_min_parcela,'
      '  fp.nr_dia_vencimento,'
      '  fp.sn_acrescimo,'
      ' fp.vl_multa'
      'FROM'
      '  fin_planos_negociacao FP'
      
        'LEFT JOIN fin_config_tipos_titulo FT ON (FT.cd_tipo_titulo = FP.' +
        'tp_titulo_emitido)'
      'WHERE'
      '  FP.sn_ativo = 1;')
    Params = <>
    DataSource = dsPlanosNegocia
    Left = 608
    Top = 56
    object qryPlanosNegociacd_plano_negociacao: TLargeintField
      FieldName = 'cd_plano_negociacao'
    end
    object qryPlanosNegociads_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
    object qryPlanosNegociavl_entrada_minima: TFloatField
      FieldName = 'vl_entrada_minima'
    end
    object qryPlanosNegocianr_max_parcelas: TLargeintField
      FieldName = 'nr_max_parcelas'
    end
    object qryPlanosNegociads_desc_negocia: TStringField
      FieldName = 'ds_desc_negocia'
      Size = 255
    end
    object qryPlanosNegociacd_tipo_titulo: TIntegerField
      FieldName = 'cd_tipo_titulo'
    end
    object qryPlanosNegociamesesDisponiveis: TLargeintField
      FieldName = 'mesesDisponiveis'
    end
    object qryPlanosNegocianr_situacao_titulo: TIntegerField
      FieldName = 'nr_situacao_titulo'
    end
    object qryPlanosNegociatp_juros: TStringField
      FieldName = 'tp_juros'
    end
    object qryPlanosNegociasn_usar_todas_turmas: TSmallintField
      FieldName = 'sn_usar_todas_turmas'
    end
    object qryPlanosNegociavl_juros: TFloatField
      FieldName = 'vl_juros'
    end
    object qryPlanosNegociavl_min_divida: TFloatField
      FieldName = 'vl_min_divida'
    end
    object qryPlanosNegociavl_max_divida: TFloatField
      FieldName = 'vl_max_divida'
    end
    object qryPlanosNegociavl_min_parcela: TFloatField
      FieldName = 'vl_min_parcela'
    end
    object qryPlanosNegocianr_dia_vencimento: TIntegerField
      FieldName = 'nr_dia_vencimento'
    end
    object qryPlanosNegociasn_acrescimo: TIntegerField
      FieldName = 'sn_acrescimo'
    end
    object qryPlanosNegociavl_multa: TFloatField
      FieldName = 'vl_multa'
    end
  end
  object dsPlanosNegocia: TDataSource
    Left = 640
    Top = 56
  end
  object qryPlanosNegociaTurmas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_plano_negociacao'
      'FROM'
      '  fin_planos_negociacao_turmas'
      'WHERE'
      '  cd_plano_negociacao = :cd_plano AND'
      '  cd_turma = :cd_turma')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    Left = 672
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end>
    object qryPlanosNegociaTurmascd_plano_negociacao: TIntegerField
      FieldName = 'cd_plano_negociacao'
    end
  end
end
