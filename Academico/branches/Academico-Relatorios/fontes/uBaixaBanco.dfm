object frmBaixarBanco: TfrmBaixarBanco
  Left = 216
  Top = 210
  Caption = 'Baixa manual de t'#237'tulos'
  ClientHeight = 316
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object DBGrid1: TDBGrid
    Left = 0
    Top = 66
    Width = 639
    Height = 217
    Align = alClient
    BorderStyle = bsNone
    DataSource = dtcMensalidades
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Parcela'
        Title.Caption = 'Parc.'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataVencimento'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_historico'
        Title.Caption = 'Hist'#243'rico'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turma'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotalCalc'
        Title.Caption = 'Valor Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NossoNumero'
        Title.Alignment = taCenter
        Title.Caption = 'Nosso N'#250'mero'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 50
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 639
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'BAIXA MANUAL'
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
    Top = 0
    Width = 639
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 316
      Top = 7
      Width = 76
      Height = 14
      Caption = 'C'#243'd. Estudante:'
    end
    object lbCodigo: TLabel
      Left = 418
      Top = 7
      Width = 25
      Height = 14
      Caption = 'C'#243'd.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 316
      Top = 22
      Width = 96
      Height = 14
      Caption = 'Nome do Estudante:'
    end
    object lbNome: TLabel
      Left = 418
      Top = 22
      Width = 107
      Height = 14
      Caption = 'Nome do Estudante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCodigoAluno: TSpeedButton
      Left = 277
      Top = 12
      Width = 33
      Height = 23
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
      OnClick = btnCodigoAlunoClick
    end
    object Label3: TLabel
      Left = 8
      Top = 7
      Width = 74
      Height = 14
      Caption = 'Nosso N'#250'mero:'
    end
    object Label4: TLabel
      Left = 8
      Top = 22
      Width = 87
      Height = 14
      Caption = 'Valor para Baixar:'
    end
    object DBText1: TDBText
      Left = 102
      Top = 7
      Width = 43
      Height = 14
      AutoSize = True
      DataField = 'NossoNumero'
      DataSource = frm_Retorno_Banco.dtcItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 102
      Top = 22
      Width = 43
      Height = 14
      AutoSize = True
      DataField = 'ValorPago'
      DataSource = frm_Retorno_Banco.dtcItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 283
    Width = 639
    Height = 33
    Align = alBottom
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 229
      Height = 14
      Caption = 'Selecione a parcela e clique no bot'#227'o Baixar >>'
    end
    object btBaixar: TBitBtn
      Left = 441
      Top = 4
      Width = 97
      Height = 25
      Caption = 'Baixar'
      TabOrder = 0
      OnClick = btBaixarClick
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
    object btFechar: TBitBtn
      Left = 544
      Top = 4
      Width = 83
      Height = 25
      Cancel = True
      Caption = 'Fechar'
      ModalResult = 2
      TabOrder = 1
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
  object dtcMensalidades: TDataSource
    DataSet = DM.tblMensalidades
    Left = 8
    Top = 168
  end
end
