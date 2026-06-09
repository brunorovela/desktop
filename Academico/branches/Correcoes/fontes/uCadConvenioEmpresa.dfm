object frmCadConvenioEmpresa: TfrmCadConvenioEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Conv'#234'nio  de Empresas'
  ClientHeight = 254
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbPessoa: TLabel
    Left = 8
    Top = 31
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object lbDataInicio: TLabel
    Left = 8
    Top = 74
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
    FocusControl = dbDataInicial
  end
  object lbDataFinal: TLabel
    Left = 8
    Top = 118
    Width = 48
    Height = 13
    Caption = 'Data Final'
    FocusControl = dbDatafinal
  end
  object lbContrato: TLabel
    Left = 8
    Top = 161
    Width = 65
    Height = 13
    Caption = 'Contrato PDF'
  end
  object sbSelecionarPessoa: TSpeedButton
    Left = 311
    Top = 46
    Width = 24
    Height = 22
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
    OnClick = sbSelecionarPessoaClick
  end
  object sbSelecionePDF: TSpeedButton
    Left = 259
    Top = 177
    Width = 18
    Height = 22
    Hint = 'Selecionar Contrato'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
      0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
      B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
      FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
      FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
      FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
      0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
      0555555555777777755555555555555555555555555555555555}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbSelecionePDFClick
  end
  object sbExportar: TSpeedButton
    Left = 281
    Top = 177
    Width = 22
    Height = 22
    Hint = 'Exportar Contrato'
    Enabled = False
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
    ParentShowHint = False
    ShowHint = True
    OnClick = sbExportarClick
  end
  object sbLimpar: TSpeedButton
    Left = 303
    Top = 177
    Width = 23
    Height = 22
    Hint = 'Apagar Contrato'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbLimparClick
  end
  object sbConvenioLog: TSpeedButton
    Left = 336
    Top = 202
    Width = 22
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
      0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
      005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
      0555557575757575755555505050505055555557575757575555}
    NumGlyphs = 2
    OnClick = sbConvenioLogClick
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 25
    Align = alTop
    Caption = 'CADASTRAR EMPRESA'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object dbDataInicial: TDBEdit
    Left = 8
    Top = 91
    Width = 111
    Height = 21
    DataField = 'dt_inicial'
    DataSource = frmCadConvenioPgto.dsNfeConveniosEmpresas
    TabOrder = 1
  end
  object dbDatafinal: TDBEdit
    Left = 8
    Top = 134
    Width = 111
    Height = 21
    DataField = 'dt_final'
    DataSource = frmCadConvenioPgto.dsNfeConveniosEmpresas
    TabOrder = 2
  end
  object dbAtivo: TDBCheckBox
    Left = 8
    Top = 202
    Width = 53
    Height = 17
    Caption = 'Ativo'
    DataField = 'sn_ativo'
    DataSource = frmCadConvenioPgto.dsNfeConveniosEmpresas
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 229
    Width = 362
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'tbBotoesAcao'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmCadConvenioPgto.imgBotoes
    List = True
    ShowCaptions = True
    TabOrder = 6
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tpSeparador1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 84
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton14: TToolButton
      Left = 172
      Top = 0
      Width = 8
      Caption = 'tpSeparador2'
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object txtNomeEmpresa: TEdit
    Left = 8
    Top = 47
    Width = 297
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnClick = txtNomeEmpresaClick
  end
  object txtPDF: TEdit
    Left = 8
    Top = 177
    Width = 245
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object odAbrirPDF: TOpenDialog
    DefaultExt = 'pdf'
    Filter = 
      'Arquivo PDF|*.pdf|Arquivo Word (97-2003)|*.doc|Arquivo Word (doc' +
      'x)|*.docx'
    Left = 264
    Top = 128
  end
  object sdSalvarPDF: TSaveDialog
    DefaultExt = 'pdf'
    FileName = 'NFSe - Convenio Contrato'
    Filter = 
      'Arquivo PDF|*.pdf|Arquivo Word (97-2003)|*.doc|Arquivo Word (doc' +
      'x)|*.docx'
    Left = 304
    Top = 128
  end
end
