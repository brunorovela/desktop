object frmSistema: TfrmSistema
  Left = 371
  Top = 142
  Width = 530
  Height = 380
  Caption = 'Sistema'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 346
    Align = alClient
    TabOrder = 0
    object btnFechar: TSpeedButton
      Left = 431
      Top = 318
      Width = 81
      Height = 25
      Hint = 'Imprimir'
      Caption = 'F12 Fechar'
      OnClick = btnFecharClick
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 8
      Width = 505
      Height = 305
      ActivePage = TabSheet2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Par'#226'metros'
        object Panel2: TPanel
          Left = 8
          Top = 9
          Width = 481
          Height = 224
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object chkMatricula: TCheckBox
            Left = 16
            Top = 16
            Width = 129
            Height = 17
            Caption = 'Per'#237'odo de Matr'#237'culas'
            TabOrder = 0
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Bloquetos'
        object Panel3: TPanel
          Left = 8
          Top = 9
          Width = 481
          Height = 256
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object btnMensagem: TSpeedButton
            Left = 360
            Top = 223
            Width = 105
            Height = 25
            Hint = 'Imprimir'
            Caption = 'Editar Mensagens'
            Layout = blGlyphBottom
            OnClick = btnMensagemClick
          end
          object Label2: TLabel
            Left = 21
            Top = 9
            Width = 33
            Height = 14
            Caption = 'Turma:'
          end
          object Label1: TLabel
            Left = 144
            Top = 9
            Width = 23
            Height = 14
            Caption = 'M'#234's:'
          end
          object grd: TDBGrid
            Left = 16
            Top = 32
            Width = 449
            Height = 185
            DataSource = dtcMensagensTurma
            PopupMenu = pmQtd
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Turma'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Mes'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Titulo'
                Width = 295
                Visible = True
              end>
          end
          object Navigator: TDBNavigator
            Left = 17
            Top = 223
            Width = 315
            Height = 25
            DataSource = dtcMensagensTurma
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
            Flat = True
            Hints.Strings = (
              'Primeito'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo'
              'Novo'
              'Excluir'
              'Editar'
              'Salvar'
              'Cancelar')
            ParentShowHint = False
            ConfirmDelete = False
            ShowHint = True
            TabOrder = 1
          end
          object txtTurma: TEdit
            Left = 61
            Top = 5
            Width = 67
            Height = 22
            TabOrder = 2
            OnKeyPress = txtTurmaKeyPress
          end
          object txtMes: TEdit
            Left = 172
            Top = 5
            Width = 49
            Height = 22
            TabOrder = 3
            OnKeyPress = txtTurmaKeyPress
          end
        end
      end
    end
  end
  object tblMensagensTurma: TZTable
    BeforeDelete = tblMensagensTurmaBeforeDelete
    Connection = db
    Filtered = True
    
    IndexFieldNames = 'Turma'
    TableName = 'MensagemPorTurma'
    Left = 448
    Top = 160
    object tblMensagensTurmaTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblMensagensTurmaMes: TSmallintField
      DisplayLabel = 'M'#234's'
      FieldName = 'Mes'
    end
    object tblMensagensTurmaCodigoMensagem: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CodigoMensagem'
    end
    object tblMensagensTurmaTitulo: TStringField
      FieldKind = fkLookup
      FieldName = 'Titulo'
      LookupDataSet = tblMensagens
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Titulo'
      KeyFields = 'CodigoMensagem'
      LookupCache = True
      Size = 50
      Lookup = True
    end
  end
  object dtcMensagensTurma: TDataSource
    DataSet = tblMensagensTurma
    Left = 448
    Top = 192
  end
  object tblMensagens: TZTable
    Connection = db
    
    TableName = 'Mensagens'
    Left = 416
    Top = 160
    object tblMensagensCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tblMensagensTitulo: TStringField
      FieldName = 'Titulo'
      Size = 50
    end
    object tblMensagensMensagem: TBlobField
      FieldName = 'Mensagem'
      Size = 1
    end
  end
  object dtcMensagens: TDataSource
    DataSet = tblMensagens
    Left = 416
    Top = 192
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 448
    Top = 224
  end
end

