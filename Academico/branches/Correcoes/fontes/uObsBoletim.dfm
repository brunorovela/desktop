object FrmObsBoletim: TFrmObsBoletim
  Left = 92
  Top = 130
  Width = 681
  Height = 354
  Caption = 'Observação - Boletim'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'OBSERVAÇÃO INDIVIDUAL PARA O BOLETIM'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 673
    Height = 43
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Código:'
    end
    object Label3: TLabel
      Left = 352
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Turma:'
    end
    object Label4: TLabel
      Left = 314
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Ano/Semestre:'
    end
    object DBText1: TDBText
      Left = 56
      Top = 8
      Width = 225
      Height = 17
      DataField = 'CodigoAluno'
      DataSource = frmFichaIndividual.dtcFicha
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 56
      Top = 24
      Width = 249
      Height = 17
      DataField = 'Nome'
      DataSource = frmFichaIndividual.dtcFicha
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 392
      Top = 8
      Width = 257
      Height = 17
      DataField = 'Turma'
      DataSource = frmFichaIndividual.dtcFicha
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 392
      Top = 24
      Width = 185
      Height = 17
      DataField = 'AnoSemestre'
      DataSource = frmFichaIndividual.dtcFicha
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 68
    Width = 673
    Height = 259
    Align = alClient
    Caption = ' Observações '
    TabOrder = 2
    object DBMemo1: TDBMemo
      Left = 2
      Top = 15
      Width = 669
      Height = 212
      Align = alClient
      DataField = 'OBS'
      DataSource = dsObs
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 2
      Top = 227
      Width = 669
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 487
        Top = 3
        Width = 94
        Height = 25
        Caption = '&Salvar'
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkAll
      end
      object BitBtn2: TBitBtn
        Left = 580
        Top = 3
        Width = 87
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = BitBtn2Click
        Kind = bkCancel
      end
    end
  end
  object tblObs: TUMZQuery
    Connection = db
    
    DataSource = frmFichaIndividual.dtcFicha
    
    SQL.Strings = (
      'Select * From ObsBoletim Where CodigoAluno = :CodigoAluno'
      'and Turma = :Turma and AnoSemestre = :AnoSemestre')
    Left = 632
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblObsCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
      Origin = 'WMESTRE12.OBSBoletim.CODIGOALUNO'
    end
    object tblObsTURMA: TStringField
      FieldName = 'TURMA'
      Origin = 'WMESTRE12.OBSBoletim.TURMA'
      Size = 10
    end
    object tblObsANOSEMESTRE: TSmallintField
      FieldName = 'ANOSEMESTRE'
      Origin = 'WMESTRE12.OBSBoletim.ANOSEMESTRE'
    end
    object tblObsOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'WMESTRE12.OBSBoletim.OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsObs: TDataSource
    DataSet = tblObs
    Left = 600
    Top = 33
  end
end

