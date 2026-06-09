object frmMensagens: TfrmMensagens
  Left = 266
  Top = 154
  Width = 564
  Height = 320
  Caption = 'Mensagens...'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 286
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 554
      Height = 227
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 2
      TabOrder = 0
      object Panel3: TPanel
        Left = 4
        Top = 4
        Width = 546
        Height = 25
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'MENSAGENS PARA BLOQUETOS'
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
        Left = 9
        Top = 33
        Width = 535
        Height = 193
        DataSource = dtcMensagens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        PopupMenu = pmQtd
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Titulo'
            Width = 516
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 228
      Width = 554
      Height = 57
      Align = alBottom
      BevelInner = bvLowered
      BorderWidth = 2
      TabOrder = 1
      object btnSair2: TSpeedButton
        Left = 487
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Sair'
        Caption = 'Sai&r'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
        NumGlyphs = 2
      end
      object btnMensagem2: TSpeedButton
        Left = 430
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Pesquisar'
        Caption = 'Mens.'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
      end
      object btnImprimir2: TSpeedButton
        Left = 373
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Imprimir'
        Caption = 'Im&primir'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
      end
      object btnCancelar2: TSpeedButton
        Left = 316
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Cancelar'
        Caption = '&Cancelar'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
      end
      object btnExcluir2: TSpeedButton
        Left = 259
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Excluir'
        Caption = 'E&xcluir'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
      end
      object btnSalvar2: TSpeedButton
        Left = 202
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Salvar'
        Caption = '&Salvar'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
      end
      object btnAlterar2: TSpeedButton
        Left = 145
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Alterar'
        Caption = '&Alterar'
        Flat = True
        Layout = blGlyphTop
        Margin = 20
      end
      object btnNovo2: TSpeedButton
        Left = 88
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Novo'
        Caption = '&Novo'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Layout = blGlyphTop
        Margin = 20
        ParentFont = False
      end
      object btnMensagem: TSpeedButton
        Left = 430
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Pesquisar'
        Caption = 'F8'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        OnClick = btnMensagemClick
      end
      object btnSair: TSpeedButton
        Left = 487
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Sair'
        Caption = 'F12'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        NumGlyphs = 2
        OnClick = btnSairClick
      end
      object btnImprimir: TSpeedButton
        Left = 373
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Imprimir'
        Caption = 'F7'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
      end
      object btnCancelar: TSpeedButton
        Left = 316
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Cancelar'
        Caption = 'F6'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        OnClick = btnCancelarClick
      end
      object btnExcluir: TSpeedButton
        Left = 259
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Excluir'
        Caption = 'F5'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        OnClick = btnExcluirClick
      end
      object btnSalvar: TSpeedButton
        Left = 202
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Salvar'
        Caption = 'F4'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        OnClick = btnSalvarClick
      end
      object btnAlterar: TSpeedButton
        Left = 145
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Alterar'
        Caption = 'F3'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        OnClick = btnAlterarClick
      end
      object btnNovo: TSpeedButton
        Left = 88
        Top = 8
        Width = 57
        Height = 41
        Hint = 'Novo'
        Caption = 'F2'
        Flat = True
        Layout = blGlyphTop
        Margin = 5
        OnClick = btnNovoClick
      end
      object Navigator: TDBNavigator
        Left = 8
        Top = 8
        Width = 80
        Height = 41
        DataSource = dtcMensagens
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeiro'
          'Anterior'
          'Pr'#243'ximo'
          #218'ltimo')
        TabOrder = 0
      end
    end
  end
  object dtcMensagens: TDataSource
    DataSet = tblMensagens
    OnStateChange = dtcMensagensStateChange
    Left = 24
    Top = 184
  end
  object tblMensagensRead: TZTable
    Connection = db
    
    IndexFieldNames = 'Codigo'
    TableName = 'Mensagens'
    Left = 56
    Top = 152
    object tblMensagensReadCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object tblMensagens: TUMZQuery
    Connection = db
    
    
    SQL.Strings = (
      'select * from Mensagens')
    Left = 25
    Top = 153
    object tblMensagensCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'Mensagens.Codigo'
    end
    object tblMensagensTitulo: TStringField
      FieldName = 'Titulo'
      Origin = 'Mensagens.Titulo'
      Size = 50
    end
    object tblMensagensMensagem: TBlobField
      FieldName = 'Mensagem'
      Origin = 'Mensagens.Mensagem'
      Size = 1
    end
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
end

