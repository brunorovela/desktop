object frmDocumentos: TfrmDocumentos
  Left = 241
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Documentos'
  ClientHeight = 427
  ClientWidth = 448
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
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 9
    Top = 34
    Width = 431
    Height = 26
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 31
    Height = 14
    Caption = 'Aluno:'
  end
  object lbAluno: TLabel
    Left = 50
    Top = 40
    Width = 390
    Height = 14
    AutoSize = False
    Caption = 'lbAluno'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 403
    Width = 328
    Height = 14
    Caption = 
      '* Marque os Documentos que o Aluno Apresentou para a Institui'#231#227'o' +
      '.'
  end
  object SpeedButton1: TSpeedButton
    Left = 359
    Top = 399
    Width = 81
    Height = 22
    Caption = 'Observa'#231#245'es'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'DOCUMENTOS'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object tabFiltro: TTabControl
    Left = 8
    Top = 66
    Width = 432
    Height = 330
    Style = tsFlatButtons
    TabOrder = 1
    Tabs.Strings = (
      'Documentos do Curso'
      'Todos os documentos')
    TabIndex = 0
    OnChange = tabFiltroChange
    object grdDocumentos: TDBGrid
      Left = 4
      Top = 28
      Width = 424
      Height = 298
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtcDoc
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmQtd
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDblClick = grdDocumentosDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Apresentou'
          Title.Alignment = taCenter
          Title.Caption = '?'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Documento'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Observacao'
          Title.Caption = 'Observa'#231#227'o'
          Width = 160
          Visible = True
        end>
    end
  end
  object tblDoc: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblDocCalcFields
    SQL.Strings = (
      
        'SELECT Documentos.Codigo, Documentos.Documento, Documentos.Sigla' +
        ', Documentos.cd_siga'
      'FROM Documentos'
      'WHERE'
      'cd_tipo_pessoa IN (1,2)'
      'ORDER BY Documentos.Codigo')
    Params = <>
    Left = 344
    Top = 240
    object tblDocCodigo: TSmallintField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.Documentos_Cursos.Codigo'
    end
    object tblDocDocumento: TStringField
      FieldName = 'Documento'
      Origin = 'WMESTRE12.Documentos_Cursos.Documento'
      Size = 50
    end
    object tblDocObservacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Observacao'
      Size = 100
      Calculated = True
    end
    object tblDocExiste: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Existe'
      Calculated = True
    end
    object tblDocSigla: TStringField
      FieldName = 'Sigla'
      Size = 8
    end
    object tblDocApresentou: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Apresentou'
      DisplayValues = 'X; '
      Calculated = True
    end
    object tblDoccd_siga: TIntegerField
      FieldName = 'cd_siga'
    end
  end
  object dtcDoc: TDataSource
    DataSet = tblDoc
    Left = 344
    Top = 272
  end
  object qAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 296
    Top = 240
  end
  object qProcDoc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From Documentos_Alunos Where CodigoAluno = :CodigoAluno'
      'AND Cod_Documento = :DOC')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC'
        ParamType = ptUnknown
      end>
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
  object qryUpdateDoc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO DOCUMENTOS_ALUNOS'
      '   (CODIGOALUNO, COD_DOCUMENTO, APRESENTOU, DT_ENTREGA)'
      'VALUES'
      '   (:CODIGOALUNO, :COD_DOCUMENTO, :APRESENTOU, :DT_ENTREGA )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APRESENTOU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_ENTREGA'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=MERGE INTO DOCUMENTOS_ALUNOS DA USING'#13#10'('#13#10'   SELECT'#13#10'    ' +
        '  :CODIGOALUNO CODIGOALUNO,'#13#10'      :COD_DOCUMENTO COD_DOCUMENTO,' +
        #13#10'      :APRESENTOU APRESENTOU'#13#10'   FROM'#13#10'      DUAL'#13#10') UP ON'#13#10'  ' +
        ' (DA.CODIGOALUNO = UP.CODIGOALUNO AND'#13#10'    DA.COD_DOCUMENTO = UP' +
        '.COD_DOCUMENTO)'#13#10'WHEN MATCHED THEN'#13#10'   UPDATE SET DA.APRESENTOU ' +
        '= UP.APRESENTOU'#13#10'WHEN NOT MATCHED THEN'#13#10'   INSERT (DA.CODIGOALUN' +
        'O, DA.COD_DOCUMENTO, DA.APRESENTOU)'#13#10'   VALUES (UP.CODIGOALUNO, ' +
        'UP.COD_DOCUMENTO, UP.APRESENTOU)'
      
        'mysql-5=REPLACE INTO DOCUMENTOS_ALUNOS'#13#10'   (CODIGOALUNO, COD_DOC' +
        'UMENTO, APRESENTOU, DT_ENTREGA)'#13#10'VALUES'#13#10'   (:CODIGOALUNO, :COD_' +
        'DOCUMENTO, :APRESENTOU, :DT_ENTREGA)')
    Left = 264
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOALUNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APRESENTOU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_ENTREGA'
        ParamType = ptUnknown
      end>
  end
end
