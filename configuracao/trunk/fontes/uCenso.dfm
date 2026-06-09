object frmCenso: TfrmCenso
  Left = 217
  Top = 121
  Caption = 'Censo Escolar'
  ClientHeight = 506
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'CENSO ESCOLAR'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel7: TPanel
    Left = 0
    Top = 333
    Width = 697
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 242
      Top = 8
      Width = 23
      Height = 25
      Caption = 'R'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 584
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Gerar Arquivo'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object DBNavigator2: TDBNavigator
      Left = 8
      Top = 8
      Width = 234
      Height = 25
      DataSource = DM.dsCenso_Campos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Flat = True
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 464
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Testar Resultado'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 697
    Height = 160
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 40
      Width = 35
      Height = 13
      Caption = 'Quadro'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 152
      Top = 40
      Width = 101
      Height = 13
      Caption = 'Descri'#231#227'o do Quadro'
      FocusControl = DBMemo1
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 158
      Height = 16
      Caption = 'QUADROS DO CENSO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 56
      Width = 134
      Height = 21
      DataField = 'cd_quadro'
      DataSource = DM.dsCenso_Quadros
      TabOrder = 0
    end
    object DBMemo1: TDBMemo
      Left = 152
      Top = 56
      Width = 545
      Height = 89
      DataField = 'ds_quadro'
      DataSource = DM.dsCenso_Quadros
      TabOrder = 1
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Institui'#231#227'o'
      DataField = 'sn_instituicao'
      DataSource = DM.dsCenso_Quadros
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Curso'
      DataField = 'sn_curso'
      DataSource = DM.dsCenso_Quadros
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 8
      Top = 112
      Width = 97
      Height = 17
      Caption = 'Habilita'#231#227'o'
      DataField = 'sn_habilitacao'
      DataSource = DM.dsCenso_Quadros
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 8
      Top = 128
      Width = 97
      Height = 17
      Caption = 'Grau'
      DataField = 'sn_grau'
      DataSource = DM.dsCenso_Quadros
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBNavigator1: TDBNavigator
      Left = 450
      Top = 23
      Width = 240
      Height = 25
      DataSource = DM.dsCenso_Quadros
      Flat = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 185
    Width = 697
    Height = 148
    Align = alClient
    TabOrder = 3
    object Panel4: TPanel
      Left = 399
      Top = 1
      Width = 297
      Height = 146
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object DBMemo2: TDBMemo
        Left = 0
        Top = 0
        Width = 297
        Height = 146
        Align = alClient
        DataField = 'ds_sql'
        DataSource = DM.dsCenso_Campos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 398
      Height = 146
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 398
        Height = 146
        Align = alClient
        DataSource = DM.dsCenso_Campos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_campo'
            Title.Caption = 'Campo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cd_quadro'
            Title.Caption = 'Quadro'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_campo'
            Title.Caption = 'Descri'#231#227'o'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_semestre'
            Title.Caption = 'Sem.'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sn_num_registros'
            Title.Caption = 'R'
            Width = 17
            Visible = True
          end>
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 375
    Width = 697
    Height = 131
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Arquivo'
      object meCenso: TMemo
        Left = 0
        Top = 0
        Width = 689
        Height = 103
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 689
        Height = 103
        Align = alClient
        DataSource = DM.dsCenso_Resultado
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
end
