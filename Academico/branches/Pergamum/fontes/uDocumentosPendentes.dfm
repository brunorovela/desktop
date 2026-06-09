object frmDocumentosPendentes: TfrmDocumentosPendentes
  Left = 6
  Top = 117
  Width = 788
  Height = 441
  Caption = 'frmDocumentosPendentes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = tblAluno
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100
      2970
      100
      2100
      70
      70
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 26
      Top = 38
      Width = 741
      Height = 75
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageHeaderBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.4375
        1960.5625)
      BandType = rbPageHeader
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          0
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DM.tblParametros
        DataField = 'NomeFantasia'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 0
        Top = 16
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          42.3333333333333
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCursos
        DataField = 'Descricao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 0
        Top = 32
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          84.6666666666667
          304.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCursos
        DataField = 'ParecerAutorizacao'
        OnPrint = QRDBText3Print
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 0
        Top = 48
        Width = 143
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          127
          378.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCursos
        DataField = 'ParecerReconhecimento'
        OnPrint = QRDBText4Print
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 488
        Top = 24
        Width = 245
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666667
          1291.16666666667
          63.5
          648.229166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DOCUMENTOS A SEREM PROVIDENCIADOS COM URGÊNCIA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 26
      Top = 113
      Width = 741
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        105.833333333333
        1960.5625)
      BandType = rbDetail
      object QRSysData1: TQRSysData
        Left = 656
        Top = 0
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1735.66666666667
          0
          219.604166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'EMISSÃO: '
        Transparent = False
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 264
        Top = 0
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          698.5
          0
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblAluno
        DataField = 'AnoSemestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0000/0'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 152
        Top = 0
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          0
          256.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ANO/SEMESTRE:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText8: TQRDBText
        Left = 152
        Top = 16
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          402.166666666667
          42.3333333333333
          100.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblAluno
        DataField = 'Aluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 72
        Top = 16
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          190.5
          42.3333333333333
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblAluno
        DataField = 'CodigoAluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 72
        Top = 0
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          190.5
          0
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblAluno
        DataField = 'Turma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 0
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          0
          127)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TURMA: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 16
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          42.3333333333333
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ALUNO(A):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object ChildBand1: TQRChildBand
      Left = 26
      Top = 153
      Width = 741
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1960.5625)
      ParentBand = DetailBand1
      object lbDoc: TQRLabel
        Left = 0
        Top = 2
        Width = 337
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          0
          5.29166666666667
          891.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FAVOR PROVIDENCIAR OS SEGUINTES DOCUMENTOS:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrDoc: TQRMemo
        Left = 24
        Top = 21
        Width = 321
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          63.5
          55.5625
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrOBS: TQRMemo
        Left = 392
        Top = 21
        Width = 291
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1037.16666666667
          55.5625
          769.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lbOBS: TQRLabel
        Left = 376
        Top = 2
        Width = 313
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          994.833333333333
          5.29166666666667
          828.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'OBSERVAÇÃO:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object tblAluno: TUMZQuery
    CachedUpdates = True
    Connection = db
    
    SQL.Strings = (
      
        'Select T.Serie, M.*, A.Nome As Aluno, A.Sexo From Alunos A, Matr' +
        'iculas M, Turmas T'
      'Where M.CodigoAluno = A.Codigo AND '
      'T.Codigo = M.Turma AND T.AnoSemestre = M.AnoSemestre AND'
      'M.Situacao not in (5,6,7)  AND'
      'M.AnoSemestre = :AnoSemestre'
      'Order By A.Nome, A.Codigo')
    Left = 112
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
        Value = 20021
      end>
    object tblAlunoCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
    end
    object tblAlunoCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object tblAlunoAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
    end
    object tblAlunoSituacao: TSmallintField
      FieldName = 'Situacao'
    end
    object tblAlunoTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object tblAlunoAluno: TStringField
      FieldName = 'Aluno'
      Size = 60
    end
    object tblAlunoSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tblAlunoSerie: TSmallintField
      FieldName = 'Serie'
    end
  end
  object tblCursos: TUMZQuery
    Connection = db
    
    DataSource = dsAlunos
    SQL.Strings = (
      'Select * From Cursos '
      'Where Codigo = :CURSO AND ANOSEMESTRE = :ANOSEMESTRE')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblCursosAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'WMESTRE12.Cursos.AnoSemestre'
    end
    object tblCursosCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.Cursos.Codigo'
      Size = 15
    end
    object tblCursosApelido: TStringField
      FieldName = 'Apelido'
      Origin = 'WMESTRE12.Cursos.Apelido'
    end
    object tblCursosDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'WMESTRE12.Cursos.Descricao'
      Size = 50
    end
    object tblCursosGrau: TSmallintField
      FieldName = 'Grau'
      Origin = 'WMESTRE12.Cursos.Grau'
    end
    object tblCursosParecerAutorizacao: TStringField
      FieldName = 'ParecerAutorizacao'
      Origin = 'WMESTRE12.Cursos.ParecerAutorizacao'
      Size = 50
    end
    object tblCursosDataCEE: TDateTimeField
      FieldName = 'DataCEE'
      Origin = 'WMESTRE12.Cursos.DataCEE'
    end
    object tblCursosCargaHorariaTotal: TFloatField
      FieldName = 'CargaHorariaTotal'
      Origin = 'WMESTRE12.Cursos.CargaHorariaTotal'
    end
    object tblCursosDiasLetivos: TFloatField
      FieldName = 'DiasLetivos'
      Origin = 'WMESTRE12.Cursos.DiasLetivos'
    end
    object tblCursosSemanasLetivas: TFloatField
      FieldName = 'SemanasLetivas'
      Origin = 'WMESTRE12.Cursos.SemanasLetivas'
    end
    object tblCursosDiasSemanasLetivas: TStringField
      FieldName = 'DiasSemanasLetivas'
      Origin = 'WMESTRE12.Cursos.DiasSemanasLetivas'
      Size = 50
    end
    object tblCursosHorarioLetivo: TStringField
      FieldName = 'HorarioLetivo'
      Origin = 'WMESTRE12.Cursos.HorarioLetivo'
      Size = 50
    end
    object tblCursosDuracaoHoraAula: TFloatField
      FieldName = 'DuracaoHoraAula'
      Origin = 'WMESTRE12.Cursos.DuracaoHoraAula'
    end
    object tblCursosDiasLetivosSemanais: TFloatField
      FieldName = 'DiasLetivosSemanais'
      Origin = 'WMESTRE12.Cursos.DiasLetivosSemanais'
    end
    object tblCursosNumerodeSeries: TSmallintField
      FieldName = 'NumerodeSeries'
      Origin = 'WMESTRE12.Cursos.NumerodeSeries'
    end
    object tblCursosObservacoes: TMemoField
      FieldName = 'Observacoes'
      Origin = 'WMESTRE12.Cursos.Observacoes'
      BlobType = ftMemo
      Size = 1
    end
    object tblCursosContrato: TStringField
      FieldName = 'Contrato'
      Origin = 'WMESTRE12.Cursos.Contrato'
      Size = 30
    end
    object tblCursosDepto: TSmallintField
      FieldName = 'Depto'
      Origin = 'WMESTRE12.Cursos.Depto'
    end
    object tblCursosQtadeBimestres: TSmallintField
      FieldName = 'QtadeBimestres'
      Origin = 'WMESTRE12.Cursos.QtadeBimestres'
    end
    object tblCursosMedia_Direto: TFloatField
      FieldName = 'Media_Direto'
      Origin = 'WMESTRE12.Cursos.Media_Direto'
    end
    object tblCursosMedia_Exame: TFloatField
      FieldName = 'Media_Exame'
      Origin = 'WMESTRE12.Cursos.Media_Exame'
    end
    object tblCursosGradePadrao: TBooleanField
      FieldName = 'GradePadrao'
      Origin = 'WMESTRE12.Cursos.GradePadrao'
    end
    object tblCursosSemanasLetivasV: TFloatField
      FieldName = 'SemanasLetivasV'
      Origin = 'WMESTRE12.Cursos.SemanasLetivasV'
    end
    object tblCursosSemanasLetivasN: TFloatField
      FieldName = 'SemanasLetivasN'
      Origin = 'WMESTRE12.Cursos.SemanasLetivasN'
    end
    object tblCursosFrequenciaGlobal: TBooleanField
      FieldName = 'FrequenciaGlobal'
      Origin = 'WMESTRE12.Cursos.FrequenciaGlobal'
    end
    object tblCursosPesoProvaInstitucional: TFloatField
      FieldName = 'PesoProvaInstitucional'
      Origin = 'WMESTRE12.Cursos.PesoProvaInstitucional'
    end
    object tblCursosParecerReconhecimento: TStringField
      FieldName = 'ParecerReconhecimento'
      Origin = 'WMESTRE12.Cursos.ParecerReconhecimento'
      Size = 50
    end
  end
  object dsAlunos: TDataSource
    DataSet = tblAluno
    Left = 8
    Top = 40
  end
  object tblMatriculas: TUMZQuery
    Connection = db
    
    DataSource = dsAlunos
    SQL.Strings = (
      
        'Select CodigoAluno, Curso, Turma, AnoSemestre, TurmaDependencia,' +
        ' '
      '           Situacao From Matriculas'
      'Where Matriculas.CodigoAluno = :CodigoAluno AND'
      'AnoSemestre = :AnoSemestre AND Turma = :Turma')
    Left = 80
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end>
  end
  object tblDocumentos: TUMZQuery
    Connection = db
    
    SQL.Strings = (
      'SELECT Documentos.Documento, Documentos_Necessarios.*'
      'FROM Documentos INNER JOIN Documentos_Necessarios '
      'ON Documentos.Codigo = Documentos_Necessarios.Cod_Documento'
      'WHERE (Documentos_Necessarios.Cod_Documento '
      '    Not In (SELECT COD_DOCUMENTO '
      '                   FROM DOCUMENTOS_ALUNOS '
      '                      WHERE APRESENTOU = TRUE '
      
        '                         AND CODIGOALUNO = :CODIGOALUNO )) AND C' +
        'URSO = :CURSO')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    object tblDocumentosDocumento: TStringField
      FieldName = 'Documento'
      Size = 50
    end
    object tblDocumentosCod_Documento: TIntegerField
      FieldName = 'Cod_Documento'
    end
    object tblDocumentosCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
  end
  object tblObsBoletim: TUMZQuery
    Connection = db
    
    DataSource = dsAlunos
    SQL.Strings = (
      'Select * From ObsBoletim'
      'Where CodigoAluno = :CodigoAluno and Turma = :Turma'
      'and AnoSemestre = :AnoSemestre')
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
  end
end

