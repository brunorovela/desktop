object FSelPessoa: TFSelPessoa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Sele'#231#227'o de pessoas'
  ClientHeight = 558
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 22
    Align = alTop
    Caption = 'SELECIONE UMA PESSOA'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 22
    Width = 582
    Height = 536
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object bvlSep2: TBevel
      Left = 0
      Top = 59
      Width = 582
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 416
    end
    object bvlSep1: TBevel
      Left = 0
      Top = 492
      Width = 582
      Height = 3
      Align = alBottom
      Shape = bsSpacer
      ExplicitTop = 445
    end
    object pnlRodaPe: TPanel
      Left = 0
      Top = 495
      Width = 582
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object sbSelecione: TSpeedButton
        Left = 393
        Top = 6
        Width = 87
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
        OnClick = sbSelecioneClick
      end
      object sbFechar: TSpeedButton
        Left = 486
        Top = 6
        Width = 87
        Height = 25
        Hint = 'Sair'
        Caption = 'F12 Sair'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777744447777777777444444447777777444777744
          4777777447777774477777447777777744777744777777774477774477777777
          4477774477777777447777744777747447777774477774444777777777777444
          7777777777777444477777777777777777777777777777777777}
        OnClick = sbFecharClick
      end
    end
    object pnlGrid: TPanel
      Left = 0
      Top = 62
      Width = 582
      Height = 430
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object bvlSep3: TBevel
        Left = 0
        Top = 0
        Width = 582
        Height = 3
        Align = alTop
        Shape = bsSpacer
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 416
      end
      object dbgPessoa: TDBGrid
        Left = 0
        Top = 3
        Width = 582
        Height = 427
        Align = alClient
        DataSource = dsPessoas
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgPessoaDblClick
        OnTitleClick = dbgPessoaTitleClick
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
            Width = 800
            Visible = True
          end>
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 582
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object ledCodigo: TLabeledEdit
        Left = 88
        Top = 6
        Width = 105
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 14
        EditLabel.Caption = 'C'#243'digo:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object ledNome: TLabeledEdit
        Left = 88
        Top = 32
        Width = 249
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 14
        EditLabel.Caption = 'Nome:'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        TabOrder = 1
      end
    end
  end
  object qryPessoas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   p.CD_PESSOA, UPPER( p.NM_PESSOA) '
      'FROM'
      '   PESSOAS p'
      
        '   LEFT JOIN NU_GRUPOS_PESSOAS ngp ON(p.CD_PESSOA = NGP.CD_PESSO' +
        'A)')
    Params = <>
    Left = 248
    Top = 216
    object qryPessoasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
    end
    object qryPessoasNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      Size = 60
    end
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 280
    Top = 216
  end
end
