object fBuscaPessoa: TfBuscaPessoa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Busca de pessoas'
  ClientHeight = 552
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 22
    Width = 666
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = 192
    ExplicitTop = 232
    ExplicitWidth = 50
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 666
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BUSCA DE PESSOAS'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlAll: TPanel
    Left = 0
    Top = 25
    Width = 666
    Height = 527
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object bvlSep2: TBevel
      Left = 3
      Top = 64
      Width = 660
      Height = 3
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 135
      ExplicitTop = 38
      ExplicitWidth = 50
    end
    object bvlSep3: TBevel
      Left = 3
      Top = 489
      Width = 660
      Height = 3
      Align = alBottom
      Shape = bsBottomLine
      ExplicitLeft = 135
      ExplicitTop = 38
      ExplicitWidth = 50
    end
    object dbgPessoas: TDBGrid
      Left = 3
      Top = 67
      Width = 660
      Height = 422
      Align = alClient
      DataSource = dsPessoas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgPessoasDblClick
      OnTitleClick = dbgPessoasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PESSOA'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PESSOA'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 303
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_NASCIMENTO'
          Title.Caption = 'Data nascimento'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CPF'
          Title.Caption = 'CPF'
          Width = 141
          Visible = True
        end>
    end
    object pnlFiltros: TPanel
      Left = 3
      Top = 3
      Width = 660
      Height = 61
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblCodigo: TLabel
        Left = 10
        Top = 9
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object lblNome: TLabel
        Left = 16
        Top = 36
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object edtCodigo: TEdit
        Left = 53
        Top = 6
        Width = 108
        Height = 21
        TabOrder = 0
        OnKeyPress = edtCodigoKeyPress
      end
      object edtNome: TEdit
        Left = 53
        Top = 33
        Width = 268
        Height = 21
        TabOrder = 1
        OnKeyPress = edtNomeKeyPress
      end
    end
    object pnlOpcoes: TPanel
      Left = 3
      Top = 492
      Width = 660
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object sbSelecionar: TSpeedButton
        Left = 493
        Top = 3
        Width = 79
        Height = 25
        Caption = 'Selecionar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = sbSelecionarClick
      end
      object sbFechar: TSpeedButton
        Left = 572
        Top = 3
        Width = 79
        Height = 25
        Caption = 'Fechar'
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
      end
    end
  end
  object dsPessoas: TDataSource
    AutoEdit = False
    DataSet = qryPessoas
    Left = 288
    Top = 304
  end
  object qryPessoas: TUMZReadOnlyQuery
    Connection = DM.conn
    SortedFields = 'NM_PESSOA'
    SortType = stIgnored
    Filtered = True
    SQL.Strings = (
      'SELECT'
      '   CD_PESSOA,'
      '   NM_PESSOA,'
      '   DT_NASCIMENTO,'
      '   DS_CPF'
      'FROM'
      '   PESSOAS')
    Params = <>
    IndexFieldNames = 'NM_PESSOA'
    Left = 320
    Top = 304
    object qryPessoasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryPessoasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
    object qryPessoasDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
    end
    object qryPessoasDS_CPF: TStringField
      FieldName = 'DS_CPF'
      EditMask = '000\.000\.000-00;0;'
      Size = 11
    end
  end
end
