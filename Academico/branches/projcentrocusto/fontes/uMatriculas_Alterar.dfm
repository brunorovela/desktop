object FrmMatriculasAlterar: TFrmMatriculasAlterar
  Left = 303
  Top = 277
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o de Matr'#237'culas'
  ClientHeight = 253
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 118
    Width = 99
    Height = 13
    Caption = 'Institui'#231#227'o de Origem'
    FocusControl = DBLookupComboBox2
  end
  object Label6: TLabel
    Left = 8
    Top = 74
    Width = 87
    Height = 13
    Caption = 'Forma de Ingresso'
    FocusControl = DBLookupComboBox1
  end
  object Label1: TLabel
    Left = 305
    Top = 74
    Width = 74
    Height = 13
    Caption = 'Data Matr'#237'cula:'
  end
  object Bevel9: TBevel
    Left = 0
    Top = 33
    Width = 423
    Height = 7
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 426
  end
  object Bevel7: TBevel
    Left = 0
    Top = 0
    Width = 423
    Height = 7
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 426
  end
  object DBText2: TDBText
    Left = 52
    Top = 40
    Width = 153
    Height = 17
    DataField = 'turma'
    DataSource = dsMatriculas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 40
    Height = 13
    Caption = 'Turma:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 216
    Top = 40
    Width = 85
    Height = 13
    Caption = 'Ano/Semestre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 306
    Top = 40
    Width = 113
    Height = 17
    DataField = 'anosemestre'
    DataSource = dsMatriculas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 168
    Width = 60
    Height = 13
    Caption = 'N'#186' Chamada'
    FocusControl = DBEdit1
  end
  object Label8: TLabel
    Left = 87
    Top = 168
    Width = 60
    Height = 13
    Caption = 'N'#186' Matr'#237'cula'
    FocusControl = DBEdit2
  end
  object Label9: TLabel
    Left = 283
    Top = 168
    Width = 44
    Height = 13
    Caption = 'Dia Pgto.'
    FocusControl = DBEdit3
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 8
    Top = 134
    Width = 410
    Height = 21
    DataField = 'descInstituicao'
    DataSource = dsMatriculas
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 90
    Width = 289
    Height = 21
    DataField = 'cd_ingresso'
    DataSource = dsMatriculas
    KeyField = 'cd_ingresso'
    ListField = 'ds_ingresso'
    ListSource = dsIngressos
    TabOrder = 0
  end
  object EditDataMatricula: TDBEdit
    Left = 306
    Top = 90
    Width = 111
    Height = 21
    DataField = 'dataemissao'
    DataSource = dsMatriculas
    TabOrder = 1
    OnExit = EditDataMatriculaExit
  end
  object Panel1: TPanel
    Left = 0
    Top = 7
    Width = 423
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object Label2: TLabel
      Left = 6
      Top = 5
      Width = 37
      Height = 13
      Caption = 'Aluno:'
    end
    object DBText1: TDBText
      Left = 48
      Top = 6
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'nm_pessoa'
      DataSource = dsMatriculas
    end
  end
  object BitBtn1: TBitBtn
    Left = 194
    Top = 217
    Width = 107
    Height = 25
    Caption = '&Confirmar'
    TabOrder = 8
    OnClick = BitBtn3Click
    Kind = bkAll
  end
  object BitBtn2: TBitBtn
    Left = 314
    Top = 217
    Width = 99
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 187
    Width = 66
    Height = 21
    DataField = 'nr_aluno'
    DataSource = dsMatriculas
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 187
    Width = 181
    Height = 21
    DataField = 'cd_matricula'
    DataSource = dsMatriculas
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 283
    Top = 187
    Width = 134
    Height = 21
    DataField = 'nr_dia_pgto'
    DataSource = dsMatriculas
    TabOrder = 5
  end
  object tblMatriculas: TUMZQuery
    Connection = DM.db
    AfterOpen = tblMatriculasAfterOpen
    OnCalcFields = tblMatriculasCalcFields
    SQL.Strings = (
      'select * from matriculas '
      'where  codigoaluno = :codigoaluno '
      '    and  turma = :turma'
      '    and  anosemestre = :anosemestre')
    Params = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoaluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object tblMatriculasanosemestre: TSmallintField
      FieldName = 'anosemestre'
      Origin = 'WMESTRE12.matriculas.anosemestre'
      DisplayFormat = '0000/0'
    end
    object tblMatriculasturma: TStringField
      FieldName = 'turma'
      Origin = 'WMESTRE12.matriculas.turma'
      Size = 50
    end
    object tblMatriculascodigoaluno: TIntegerField
      FieldName = 'codigoaluno'
      Origin = 'WMESTRE12.matriculas.codigoaluno'
    end
    object tblMatriculascurso: TStringField
      FieldName = 'curso'
      Origin = 'WMESTRE12.matriculas.curso'
      Size = 15
    end
    object tblMatriculasdataemissao: TDateTimeField
      FieldName = 'dataemissao'
      Origin = 'WMESTRE12.matriculas.dataemissao'
    end
    object tblMatriculasusuario: TStringField
      FieldName = 'usuario'
      Origin = 'WMESTRE12.matriculas.usuario'
      Size = 30
    end
    object tblMatriculasplanopagamento: TIntegerField
      FieldName = 'planopagamento'
      Origin = 'WMESTRE12.matriculas.planopagamento'
    end
    object tblMatriculassituacao: TSmallintField
      FieldName = 'situacao'
      Origin = 'WMESTRE12.matriculas.situacao'
    end
    object tblMatriculassituacaoescolar: TSmallintField
      FieldName = 'situacaoescolar'
      Origin = 'WMESTRE12.matriculas.situacaoescolar'
    end
    object tblMatriculasimpresso: TStringField
      FieldName = 'impresso'
      Origin = 'WMESTRE12.matriculas.impresso'
      FixedChar = True
      Size = 1
    end
    object tblMatriculasdatasaida: TDateTimeField
      FieldName = 'datasaida'
      Origin = 'WMESTRE12.matriculas.datasaida'
    end
    object tblMatriculasdataentrada: TDateTimeField
      FieldName = 'dataentrada'
      Origin = 'WMESTRE12.matriculas.dataentrada'
    end
    object tblMatriculasplanodesconto: TIntegerField
      FieldName = 'planodesconto'
      Origin = 'WMESTRE12.matriculas.planodesconto'
    end
    object tblMatriculasdiploma: TStringField
      FieldName = 'diploma'
      Origin = 'WMESTRE12.matriculas.diploma'
      FixedChar = True
      Size = 1
    end
    object tblMatriculascd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
      Origin = 'WMESTRE12.matriculas.cd_ingresso'
    end
    object tblMatriculascd_instituicao_origem: TIntegerField
      FieldName = 'cd_instituicao_origem'
      Origin = 'WMESTRE12.matriculas.cd_instituicao_origem'
    end
    object tblMatriculasturmadependencia: TStringField
      FieldName = 'turmadependencia'
      Origin = 'WMESTRE12.matriculas.turmadependencia'
      Size = 15
    end
    object tblMatriculasdescInstituicao: TStringField
      FieldKind = fkLookup
      FieldName = 'descInstituicao'
      LookupDataSet = DM.tblInstituicoes
      LookupKeyFields = 'cd_instituicao'
      LookupResultField = 'nm_instituicao'
      KeyFields = 'cd_instituicao_origem'
      Size = 100
      Lookup = True
    end
    object tblMatriculasdescIngresso: TStringField
      FieldKind = fkLookup
      FieldName = 'descIngresso'
      LookupDataSet = DM.tblIngressos
      LookupKeyFields = 'cd_ingresso'
      LookupResultField = 'ds_ingresso'
      KeyFields = 'cd_ingresso'
      Size = 100
      Lookup = True
    end
    object tblMatriculasnr_aluno: TSmallintField
      FieldName = 'nr_aluno'
      Origin = 'WMESTRE12.matriculas.nr_aluno'
    end
    object tblMatriculascd_matricula: TStringField
      FieldName = 'cd_matricula'
      Origin = 'WMESTRE12.matriculas.cd_matricula'
    end
    object tblMatriculasNR_DIA_PGTO: TLargeintField
      FieldName = 'NR_DIA_PGTO'
    end
    object tblMatriculasnm_pessoa: TStringField
      FieldKind = fkCalculated
      FieldName = 'nm_pessoa'
      Size = 255
      Calculated = True
    end
  end
  object dsMatriculas: TDataSource
    DataSet = tblMatriculas
    Left = 392
    Top = 8
  end
  object qryNmPessoa: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   nm_pessoa'
      'FROM'
      '   pessoas'
      'WHERE'
      '   cd_pessoa =:cd_pessoa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
  object qryIngressos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'cd_ingresso,'
      '                ds_ingresso'
      'FROM'
      #9'matriculas_ingresso'
      'WHERE'
      #9'sn_ativo = 1'
      'OR cd_ingresso = :cd_ingresso')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_ingresso'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_ingresso'
        ParamType = ptUnknown
      end>
    object qryIngressoscd_ingresso: TIntegerField
      FieldName = 'cd_ingresso'
      Required = True
    end
    object qryIngressosds_ingresso: TStringField
      FieldName = 'ds_ingresso'
      Size = 50
    end
  end
  object dsIngressos: TDataSource
    DataSet = qryIngressos
    Left = 240
    Top = 8
  end
end
