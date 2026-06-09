object frmAtosOficiais: TfrmAtosOficiais
  Left = 257
  Top = 199
  Caption = 'Atos Oficiais'
  ClientHeight = 383
  ClientWidth = 1110
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 66
    Width = 58
    Height = 14
    Caption = 'Data do ato:'
  end
  object Label2: TLabel
    Left = 8
    Top = 110
    Width = 29
    Height = 14
    Caption = 'T'#237'tulo:'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 195
    Width = 20
    Height = 14
    Caption = 'Ato:'
  end
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 14
    Caption = 'Curso:'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 240
    Top = 8
    Width = 72
    Height = 14
    Caption = 'Ano/Semestre:'
    FocusControl = DBEdit6
  end
  object Bevel1: TBevel
    Left = 8
    Top = 56
    Width = 1094
    Height = 5
    Style = bsRaised
  end
  object Label4: TLabel
    Left = 8
    Top = 153
    Width = 92
    Height = 14
    Caption = 'Unidade de Ensino:'
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 126
    Width = 1094
    Height = 22
    DataField = 'ds_titulo_ato'
    DataSource = frmCursos.srcAtosOficiais
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 24
    Width = 217
    Height = 22
    DataField = 'cd_curso'
    DataSource = frmCursos.srcAtosOficiais
    Enabled = False
    TabOrder = 0
  end
  object DBEdit6: TDBEdit
    Left = 240
    Top = 24
    Width = 81
    Height = 22
    DataField = 'nr_anosemestre'
    DataSource = frmCursos.srcAtosOficiais
    TabOrder = 1
    OnEnter = DBEdit6Enter
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 358
    Width = 1110
    Height = 25
    Align = alBottom
    ButtonWidth = 85
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmCursos.ImageList2
    List = True
    ShowCaptions = True
    TabOrder = 7
    ExplicitTop = 356
    ExplicitWidth = 625
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 8
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 93
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton11: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
  end
  object DBCheckBox1: TDBCheckBox
    Left = 8
    Top = 332
    Width = 209
    Height = 17
    Caption = 'Imprimir nos Documentos Oficiais'
    DataField = 'sn_impressao'
    DataSource = frmCursos.srcAtosOficiais
    TabOrder = 8
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 211
    Width = 1094
    Height = 115
    DataField = 'ds_ato'
    DataSource = frmCursos.srcAtosOficiais
    MaxLength = 10000
    TabOrder = 6
  end
  object dtpAto: TDateTimePicker
    Left = 8
    Top = 82
    Width = 1094
    Height = 22
    Date = 38210.404654583330000000
    Format = 'dd/MM/yyyy'
    Time = 38210.404654583330000000
    TabOrder = 3
  end
  object UpDownCursos: TUpDown
    Left = 318
    Top = 24
    Width = 15
    Height = 22
    Min = -100
    TabOrder = 2
    OnClick = UpDownCursosClick
  end
  object cbUnidades: TComboBox
    Left = 8
    Top = 170
    Width = 1094
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 5
  end
end
