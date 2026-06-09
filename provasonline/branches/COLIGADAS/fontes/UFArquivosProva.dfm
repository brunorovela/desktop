object fArquivosProva: TfArquivosProva
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 3
  Caption = 'Arquivos gerados'
  ClientHeight = 495
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSep1: TBevel
    Left = 0
    Top = 470
    Width = 448
    Height = 3
    Align = alBottom
    Shape = bsTopLine
    ExplicitLeft = 312
    ExplicitTop = 216
    ExplicitWidth = 50
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 0
    Width = 448
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitWidth = 735
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 166
    Width = 448
    Height = 3
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 88
    ExplicitTop = 216
    ExplicitWidth = 50
  end
  object tlbOpcoes: TToolBar
    Left = 0
    Top = 473
    Width = 448
    Height = 22
    Align = alBottom
    AutoSize = True
    ButtonWidth = 89
    DrawingStyle = dsGradient
    Images = ilOpcoes
    List = True
    ShowCaptions = True
    TabOrder = 0
    ExplicitWidth = 479
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnBaixar: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F7 Download'
      Enabled = False
      ImageIndex = 0
      OnClick = btnBaixarClick
    end
    object btnVisualizar: TToolButton
      Left = 101
      Top = 0
      AutoSize = True
      Caption = 'F8 Visualizar'
      Enabled = False
      ImageIndex = 1
      OnClick = btnVisualizarClick
    end
    object btnSep2: TToolButton
      Left = 191
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 199
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 2
      OnClick = btnFecharClick
    end
    object btnSep3: TToolButton
      Left = 288
      Top = 0
      Width = 8
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 3
    Width = 448
    Height = 163
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    ExplicitWidth = 479
    object gbProva: TGroupBox
      Left = 3
      Top = 3
      Width = 442
      Height = 157
      Align = alClient
      Caption = 'Informa'#231#245'es da prova'
      TabOrder = 0
      ExplicitWidth = 473
      object lblTitulo: TLabel
        Left = 63
        Top = 40
        Width = 30
        Height = 13
        Caption = 'T'#237'tulo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lblAnoSem: TLabel
        Left = 22
        Top = 59
        Width = 71
        Height = 13
        Caption = 'Ano/semestre:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lblInicio: TLabel
        Left = 64
        Top = 78
        Width = 29
        Height = 13
        Caption = 'In'#237'cio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lblFim: TLabel
        Left = 73
        Top = 97
        Width = 20
        Height = 13
        Caption = 'Fim:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lblDisc: TLabel
        Left = 46
        Top = 116
        Width = 47
        Height = 13
        Caption = 'Disciplina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lblResp: TLabel
        Left = 28
        Top = 135
        Width = 65
        Height = 13
        Caption = 'Respons'#225'vel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lblCodigo: TLabel
        Left = 56
        Top = 21
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object dbtCodigo: TDBText
        Left = 99
        Top = 21
        Width = 49
        Height = 13
        AutoSize = True
        DataField = 'CD_PROVA'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtTitulo: TDBText
        Left = 99
        Top = 40
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'DS_DISCIPLINA'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtAnoSem: TDBText
        Left = 99
        Top = 59
        Width = 55
        Height = 13
        AutoSize = True
        DataField = 'NR_ANOSEMESTRE'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtInicio: TDBText
        Left = 99
        Top = 78
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'DT_INICIO'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtFim: TDBText
        Left = 99
        Top = 97
        Width = 32
        Height = 13
        AutoSize = True
        DataField = 'DT_FIM'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtDisc: TDBText
        Left = 99
        Top = 116
        Width = 35
        Height = 13
        AutoSize = True
        DataField = 'DS_DISCIPLINA'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtResp: TDBText
        Left = 99
        Top = 135
        Width = 40
        Height = 13
        AutoSize = True
        DataField = 'NM_RESPONSAVEL'
        DataSource = dsProva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlLista: TPanel
    Left = 0
    Top = 169
    Width = 448
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 232
    ExplicitHeight = 295
    object lblListaTit: TLabel
      Left = 3
      Top = 3
      Width = 442
      Height = 13
      Align = alTop
      Caption = 'Arquivos da prova'
      ExplicitWidth = 88
    end
    object bvlSep4: TBevel
      Left = 3
      Top = 16
      Width = 442
      Height = 5
      Align = alTop
      Shape = bsBottomLine
      ExplicitLeft = 0
      ExplicitTop = 13
      ExplicitWidth = 262
    end
    object dbgArquivos: TDBGrid
      Left = 3
      Top = 21
      Width = 442
      Height = 277
      Align = alClient
      DataSource = dsArquivos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_TURMA'
          Title.Caption = 'Turma'
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_CURSO'
          Title.Caption = 'Curso'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TAMANHO'
          Title.Caption = 'Tamanho'
          Width = 90
          Visible = True
        end>
    end
  end
  object ilOpcoes: TImageList
    Left = 392
    Top = 112
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000B8683400B7683400B667
      3400B4673400B3663300B1653300AF643200AD633200AB623100A9613100A860
      3100A75F3000A65F3000A55F3000A7603000FFFFFFFFFFFFFFFFE2E2E2FFCACA
      CAFFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFCCCCCCFFE2E2E2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9693400EBC5AC00EAC4AC00FEFB
      F800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
      F800FEFBF800C8997B00C7977800A65F3000FFFFFFFFFFFFFFFFCACACAFFF9F9
      F9FFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFF9F9F9FFCCCCCCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B96A3600EDCAB200E0A17900FEFA
      F70061BF870061BF870061BF870061BF870061BF870061BF870061BF870061BF
      8700FDF9F600CA8C6400C99A7B00A65F30006C70DEFF5055D8FF8487C9FFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFC8C8C8FF0000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA6B3700EECCB500E1A17900FEFA
      F700BEDCC100BEDCC100BEDCC100BEDCC100BEDCC100BEDCC100BEDCC100BEDC
      C100FDF9F600CD8F6700CC9D8000A7603100C4C5F2FF8184E4FF3C41CBFFC9CB
      F2FFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFCFCFCFFC8C8C8FF0052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA6A3700EFCEB700E1A17800FEFA
      F70061BF870061BF870061BF870061BF870061BF870061BF870061BF870061BF
      8700FDF9F600CF926900CEA28300A9603100FFFFFFFFEFEFFBFF8689CCFF4F55
      DBFFEDEEF9FFFCFCFCFFFCFCFCFFFBFBFBFFFBFBFBFFFAFAFAFFFAFAFAFFE8E9
      F7FFF3F3F9FFFAFAFAFFFCFCFCFFC8C8C8FF00526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFD0BA00E2A17900FEFB
      F800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
      F800FEFBF800D3956C00D2A68900AA613100FFFFFFFFFFFFFFFFC8C8C8FF777D
      E4FF7A81E5FFB4B8EFFF9FA3EBFFC0C3F1FFD3D5F4FF8187E6FF656CE1FF767C
      E4FF9BA0E9FFF8F8F8FFFCFCFCFFC8C8C8FF00526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA693500F0D2BD00E2A27900E2A2
      7900E1A27900E2A27A00E1A27A00E0A07700DE9E7600DD9E7500DC9C7300D99A
      7100D8987000D6986F00D5AA8D00AC623200FFFFFFFFFFFFFFFFC8C8C8FFE7E9
      F9FF4C55DFFFE4E5F8FFD8DAF6FF666EE4FF2D38DAFF4650DFFF5D65E2FF7279
      E5FFA7ABEDFFF8F8F8FFFCFCFCFFC8C8C8FF005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA693500F2D5C100E3A27900E3A2
      7900E2A27A00E2A27A00E2A37A00E1A17800E0A07700DE9F7600DE9D7400DC9C
      7300DA9A7200D99A7200DAAF9400AE633200FFFFFFFFFFFFFFFFC8C8C8FFFCFC
      FCFF6D75E7FF979CEDFFDBDDF7FF6069E5FFDADCF7FFFCFCFCFFFAFAFAFFF9F9
      F9FFF6F6F6FFF6F6F6FFFCFCFCFFC8C8C8FF00526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA693500F2D8C400E3A37A00E3A2
      7900E3A37900E2A37A00E2A27A00E1A27A00E1A17800DF9F7600DE9E7500DD9D
      7300DB9B7100DC9C7300DDB49900B0643300FFFFFFFFFFFFFFFFC8C8C8FFFCFC
      FCFFDCDEF8FF535EE6FF606AE8FFD4D6F7FFFCFCFCFFFBFBFBFFF8F8F8FFF6F6
      F6FFF3F3F3FFF2F2F2FFFCFCFCFFC8C8C8FF005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA6A3500F4D9C700E6A57C00C88B
      6300C98C6400C98D6600CB916B00CB916C00CA8F6800C88B6400C88B6300C88B
      6300C88B6300DA9B7300E1B99E00B2653300FFFFFFFFFFFFFFFFC8C8C8FFFCFC
      FCFFFCFCFCFF5D68EAFF6C76ECFFFCFCFCFFFBFBFBFFF8F8F8FFF5F5F5FFF2F2
      F2FFEFEFEFFFEDEDEDFFFCFCFCFFC8C8C8FF00526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA6A3500F4DCC900E7A67C00F9EC
      E100F9ECE100F9EDE300FCF4EE00FDFAF700FDF7F300FAEDE500F7E7DB00F7E5
      D900F6E5D800DE9F7600E4BDA300B3663300FFFFFFFFFFFFFFFFC8C8C8FFFCFC
      FCFFFBFBFBFF747FEEFFA6ADF3FFFBFBFBFFF8F8F8FFF5F5F5FFF1F1F1FFECEC
      ECFFEAEAEAFFE6E6E6FFFCFCFCFFC8C8C8FF005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB6A3500F5DDCC00E7A77D00FAF0
      E800FAF0E800C98C6500FAF0E900FDF8F300FEFAF800FCF4EF00F9E9DF00F7E7
      DB00F7E5D900E0A17700E7C1A800B5673400FFFFFFFFFFFFFFFFC8C8C8FFFCFC
      FCFFF9F9F9FF6976EEFF9EA6F2FFF7F7F7FFF6F6F6FFF2F2F2FFEBEBEBFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFC8C8C8FF005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB6A3500F6DFD000E8A77D00FCF6
      F100FCF6F100C88B6300FAF1E900FBF4EE00FDFAF700FDF9F600FAF0E800F8E8
      DD00F7E6DB00E1A27900EFD5C200B6683400FFFFFFFFFFFFFFFFC8C8C8FFFCFC
      FCFFF2F3F7FF737FF1FFCCD0F5FFF7F7F7FFF3F3F3FFF0F0F0FFEAEAEAFFFCFC
      FCFFF6F6F6FFF4F4F4FFC5C5C5FFDEDEDEFF00526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB6A3500F6DFD100E9A97F00FEFA
      F600FDFAF600C88B6300FBF3EE00FBF1EA00FCF6F200FEFBF800FCF6F100F9EC
      E200F8E7DB00EED0B900ECD0BC00BA6F3D00FFFFFFFFFFFFFFFFC8C8C8FFFBFB
      FBFFF1F1F4FF7884F1FFB9BFF3FFF5F5F5FFF1F1F1FFEFEFEFFFE9E9E9FFFCFC
      FCFFE7E7E7FFC2C2C2FFDEDEDEFFFCFCFCFF00526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB6A3500F6E0D100F7E0D100FEFB
      F800FEFBF700FDF9F600FCF5F000FAF0EA00FBF2ED00FDF9F600FDFAF700FBF1
      EB00F8E9DF00ECD0BC00C9885D00B4683400FFFFFFFFFFFFFFFFCCCCCCFFF8F8
      F8FFFBFBFBFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF8F8
      F8FFC2C2C2FFDEDEDEFFFCFCFCFFFFFFFFFF000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB6A3500BB6A3500BB6A3500BB6A
      3500BB6A3500BA6A3500BA6A3500BA693500BA693500BB6B3800BC6D3A00BA6C
      3900BA6A3700BA6F3D00B5683400FFFFFF00FFFFFFFFFFFFFFFFE2E2E2FFCCCC
      CCFFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFDEDEDEFFFCFCFCFFFFFFFFFFFFFFFFFF0000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080000000FFFF000000000000E3FF0000
      0000000083FF000000000000000F000000000000003F000080000000002F0000
      00000000000F000000000000000F000000000000000100000000000000010000
      000000000001000000000000000F000000000000000F000000000000002F0000
      00000000803F000000000000E3FF000000000000000000000000000000000000
      000000000000}
  end
  object qryProva: TUMZReadOnlyQuery
    Connection = DM.conn
    SQL.Strings = (
      'SELECT'
      '   P.CD_PROVA,'
      '   P.DS_PROVA,'
      '   P.NR_ANOSEMESTRE,'
      '   P.DT_INICIO,'
      '   P.DT_FIM,'
      '   D.DS_DISCIPLINA,'
      '   R.NM_PESSOA NM_RESPONSAVEL'
      'FROM'
      '   POL_PROVAS P'
      '      JOIN DISCIPLINAS_MESTRE D ON'
      '         (P.CD_DISCIPLINA_PAI = D.CD_DISCIPLINA_PAI)'
      '      JOIN PESSOAS R ON'
      '         (P.CD_RESPONSAVEL = R.CD_PESSOA)'
      'WHERE'
      '   P.CD_PROVA = :CD_PROVA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    object qryProvaCD_PROVA: TIntegerField
      FieldName = 'CD_PROVA'
      Required = True
    end
    object qryProvaDS_PROVA: TStringField
      FieldName = 'DS_PROVA'
      Size = 255
    end
    object qryProvaNR_ANOSEMESTRE: TSmallintField
      FieldName = 'NR_ANOSEMESTRE'
      DisplayFormat = '0000/0'
    end
    object qryProvaDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
    end
    object qryProvaDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
    object qryProvaDS_DISCIPLINA: TStringField
      FieldName = 'DS_DISCIPLINA'
      Size = 255
    end
    object qryProvaNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 60
    end
  end
  object dsProva: TDataSource
    AutoEdit = False
    DataSet = qryProva
    Left = 248
    Top = 104
  end
  object qryArquivos: TUMZReadOnlyQuery
    Connection = DM.conn
    AfterOpen = qryArquivosAfterOpen
    OnCalcFields = qryArquivosCalcFields
    SQL.Strings = (
      'SELECT'
      '   T.CD_TURMA,'
      '   T.CD_CURSO,'
      '   A.ME_ARQUIVO,'
      '   MD5(NOW()) FILENAME'
      'FROM'
      '   POL_PROVAS_PRESENCIAL_PDF A'
      '      JOIN POL_PROVAS_TURMAS T ON'
      '         (A.CD_PROVA_TURMA = T.CD_PROVA_TURMA)'
      'WHERE'
      '   T.CD_PROVA = :CD_PROVA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    DataSource = dsProva
    Left = 304
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PROVA'
        ParamType = ptUnknown
      end>
    object qryArquivosCD_TURMA: TStringField
      FieldName = 'CD_TURMA'
      Required = True
      Size = 50
    end
    object qryArquivosCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Size = 15
    end
    object qryArquivosME_ARQUIVO: TBlobField
      FieldName = 'ME_ARQUIVO'
    end
    object qryArquivosFILENAME: TStringField
      FieldName = 'FILENAME'
      ReadOnly = True
      Size = 32
    end
    object qryArquivosDS_TAMANHO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_TAMANHO'
      Calculated = True
    end
  end
  object dsArquivos: TDataSource
    AutoEdit = False
    DataSet = qryArquivos
    Left = 248
    Top = 56
  end
  object sdlgPdf: TSaveDialog
    DefaultExt = '.pdf'
    Filter = 'Portable Document Format (*.pdf)|*.pdf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 144
    Top = 296
  end
end
