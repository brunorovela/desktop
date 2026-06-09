object FrmSelContasPagar: TFrmSelContasPagar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selecionar Compromissos'
  ClientHeight = 395
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'd. Ref. do T'#237'tulo:'
  end
  object Label2: TLabel
    Left = 65
    Top = 42
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel
    Left = 34
    Top = 70
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero do Doc.'
  end
  object Bevel1: TBevel
    Left = 11
    Top = 96
    Width = 518
    Height = 5
    Style = bsRaised
  end
  object btnSelecionar: TSpeedButton
    Left = 368
    Top = 357
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
    OnClick = btnSelecionarClick
  end
  object btnFechar: TSpeedButton
    Left = 457
    Top = 357
    Width = 87
    Height = 25
    Hint = 'Sair'
    Caption = 'F12 Sai&r'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777744447777777777444444447777777444777744
      4777777447777774477777447777777744777744777777774477774477777777
      4477774477777777447777744777747447777774477774444777777777777444
      7777777777777444477777777777777777777777777777777777}
    OnClick = btnFecharClick
  end
  object Label4: TLabel
    Left = 278
    Top = 70
    Width = 100
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor do Documento:'
  end
  object txtCodigo: TEdit
    Left = 120
    Top = 11
    Width = 121
    Height = 21
    TabOrder = 0
    OnEnter = txtCodigoEnter
    OnKeyPress = txtCodigoKeyPress
  end
  object txtDescricao: TEdit
    Left = 120
    Top = 39
    Width = 385
    Height = 21
    TabOrder = 1
    OnEnter = txtDescricaoEnter
    OnKeyPress = txtDescricaoKeyPress
  end
  object txtDocumento: TEdit
    Left = 120
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    OnEnter = txtDocumentoEnter
    OnKeyPress = txtDocumentoKeyPress
  end
  object grdProfessor: TDBGrid
    Left = 13
    Top = 112
    Width = 534
    Height = 233
    BorderStyle = bsNone
    DataSource = dtcCompromissos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grdProfessorDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_TITULO'
        Title.Caption = 'Ref.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_pessoa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_despesa'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_documento'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_vencimento'
        Width = 60
        Visible = True
      end>
  end
  object txtValor: TEdit
    Left = 384
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 4
    OnKeyPress = txtValorKeyPress
  end
  object qryCompromissos: TUMZQuery
    Connection = DM.db
    CachedUpdates = True
    SQL.Strings = (
      
        'SELECT cp.cd_titulo, p.nm_pessoa, cp.ds_despesa, cp.nr_documento' +
        ', cp.dt_vencimento'
      'FROM fin_contas_pagar cp, pessoas p'
      'WHERE cp.cd_pessoa = p.cd_pessoa'
      '  ')
    Params = <>
    Left = 8
    Top = 360
    object qryCompromissosCD_TITULO: TLargeintField
      DisplayLabel = 'C'#243'd. T'#237'tulo'
      FieldName = 'CD_TITULO'
    end
    object qryCompromissosnm_pessoa: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'nm_pessoa'
      Origin = 'WMESTRE12.pessoas.nm_pessoa'
      Size = 60
    end
    object qryCompromissosds_despesa: TStringField
      DisplayLabel = 'Despesa'
      FieldName = 'ds_despesa'
      Origin = 'WMESTRE12.fin_contas_pagar.ds_despesa'
      Size = 255
    end
    object qryCompromissosnr_documento: TStringField
      DisplayLabel = 'N'#250'm. Doc. '
      FieldName = 'nr_documento'
      Origin = 'WMESTRE12.fin_contas_pagar.nr_documento'
      Size = 50
    end
    object qryCompromissosdt_vencimento: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'dt_vencimento'
      Origin = 'WMESTRE12.fin_contas_pagar.dt_vencimento'
    end
  end
  object dtcCompromissos: TDataSource
    DataSet = qryCompromissos
    Left = 40
    Top = 360
  end
end
