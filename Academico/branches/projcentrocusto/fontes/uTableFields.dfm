object frmTableFields: TfrmTableFields
  Left = 541
  Top = 111
  BorderStyle = bsSizeToolWin
  Caption = 'Sele'#231#227'o'
  ClientHeight = 351
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltraDisc: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 97
    Align = alTop
    TabOrder = 0
    Visible = False
    ExplicitWidth = 563
    object Label1: TLabel
      Left = 29
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Unidade: '
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 73
      Height = 13
      Caption = 'Departamento: '
    end
    object Label3: TLabel
      Left = 283
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Curso:  '
    end
    object Label4: TLabel
      Left = 264
      Top = 40
      Width = 54
      Height = 13
      Caption = 'Descri'#231#227'o: '
    end
    object edDescricao: TEdit
      Left = 319
      Top = 36
      Width = 202
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 226
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object CbUnidade: TUMComboBox
      Left = 88
      Top = 4
      Width = 165
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnCloseUp = CbUnidadeCloseUp
      TamanhoMaximo = 0
    end
    object cbCurso: TUMComboBox
      Left = 319
      Top = 6
      Width = 202
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      TamanhoMaximo = 0
    end
    object cbDepartamento: TUMComboBox
      Left = 88
      Top = 36
      Width = 165
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      OnChange = cbDepartamentoChange
      TamanhoMaximo = 0
    end
  end
  object pnlRegistros: TPanel
    Left = 0
    Top = 97
    Width = 539
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlRegistros'
    TabOrder = 1
    ExplicitWidth = 563
    object Tree: TTreeView
      Left = 0
      Top = 0
      Width = 539
      Height = 254
      Align = alClient
      DragMode = dmAutomatic
      Indent = 19
      MultiSelect = True
      MultiSelectStyle = [msControlSelect, msShiftSelect, msVisibleOnly]
      TabOrder = 0
      OnDragDrop = TreeDragDrop
      ExplicitWidth = 563
    end
  end
  object qry: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 136
    Top = 168
  end
  object tblDisciplinas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'd.CURSO AS curso,'
      #9'd.SIGLA AS sigla,'
      #9'd.DESCRICAO AS descricao,'
      #9'd.codigo AS codigo'
      'FROM'
      
        #9'DISCIPLINAS d INNER JOIN cursos_coligada cc ON (cc.cd_curso = d' +
        '.curso)'
      'WHERE'
      #9'd.curso like :Curso AND cc.cd_coligada IN ( [cd_coligada_in] )'
      'ORDER BY'
      '  d.CURSO, d.DESCRICAO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end>
    object tblDisciplinasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'Disciplinas.Curso'
      Size = 15
    end
    object tblDisciplinasSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'Disciplinas.Sigla'
      Size = 10
    end
    object tblDisciplinasDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 100
    end
    object tblDisciplinascodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'WMESTRE12.disciplinas.codigo'
      DisplayFormat = '00000000000'
    end
  end
  object qyMatriculas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '  T.CURSO,'
      '  T.CODIGO AS TURMA,'
      '  D.CODIGO AS DISCIPLINA,'
      '  D.DESCRICAO'
      'FROM '
      '   TURMAS T '
      '   JOIN GRADES_DISCIPLINAS GR ON '
      '      (T.CURSO = GR.CD_CURSO) AND '
      '      (T.CD_GRADE = GR.CD_GRADE) AND'
      '      (T.SERIE = GR.NR_SERIE)'
      '   JOIN DISCIPLINAS D ON '
      '      (D.CURSO = T.CURSO) AND'
      '      (D.CODIGO = GR.CD_DISCIPLINA)'
      'WHERE'
      '  T.ANOSEMESTRE = :ANOSEMESTRE'
      'ORDER BY'
      '  T.CURSO,'
      '  T.CODIGO,'
      '  D.DESCRICAO')
    Params = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end>
    object qyMatriculasCurso: TStringField
      FieldName = 'Curso'
      FixedChar = True
      Size = 15
    end
    object qyMatriculasTurma: TStringField
      FieldName = 'Turma'
      FixedChar = True
      Size = 15
    end
    object qyMatriculasDisciplina: TIntegerField
      DisplayWidth = 10
      FieldName = 'Disciplina'
      DisplayFormat = '00000000000'
    end
    object qyMatriculasDescricao: TStringField
      FieldName = 'Descricao'
      FixedChar = True
      Size = 100
    end
  end
  object qyProcSelAreas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   proc_sel_areas'
      'ORDER BY'
      '   cd_area')
    Params = <>
    Left = 40
    Top = 264
    object qyProcSelAreascd_area: TStringField
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.proc_sel_areas.cd_area'
      Size = 15
    end
    object qyProcSelAreasds_area: TStringField
      FieldName = 'ds_area'
      Origin = 'WMESTRE12.proc_sel_areas.ds_area'
      Size = 100
    end
  end
  object qyProcSelDisc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   psad.*,'
      '   d.sigla, '
      '   d.descricao'
      'FROM'
      '   proc_sel_areas_disc psad'
      
        '      INNER JOIN disciplinas d ON (d.codigo = psad.cd_disc AND d' +
        '.curso = psad.cd_curso)'
      'WHERE'
      '   psad.cd_area = :cd_area'
      'ORDER BY'
      '   d.descricao')
    Params = <
      item
        DataType = ftString
        Name = 'cd_area'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_area'
        ParamType = ptUnknown
      end>
    object qyProcSelDisccd_area: TStringField
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.proc_sel_areas_disc.cd_area'
      Size = 15
    end
    object qyProcSelDisccd_disc: TIntegerField
      FieldName = 'cd_disc'
      Origin = 'WMESTRE12.proc_sel_areas_disc.cd_disc'
      DisplayFormat = '0000000'
    end
    object qyProcSelDisccd_curso: TStringField
      FieldName = 'cd_curso'
      Origin = 'WMESTRE12.proc_sel_areas_disc.cd_curso'
      Size = 15
    end
    object qyProcSelDiscsigla: TStringField
      FieldName = 'sigla'
      Origin = 'WMESTRE12.disciplinas.sigla'
      Size = 5
    end
    object qyProcSelDiscdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'WMESTRE12.disciplinas.descricao'
      Size = 100
    end
  end
  object qyGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        #9't.Curso, t.Codigo AS Turma, d.Codigo AS Disciplina, d.Descricao' +
        ', pd.Professor'
      'FROM'
      '   professoresdisciplinas pd'
      
        '  INNER JOIN cursos c ON (pd.curso = c.codigo) AND (gd.anosemest' +
        're = c.anosemestre)'
      
        '  INNER JOIN turmas t ON (c.anosemestre = t.anosemestre) AND (pd' +
        '.curso = t.curso)'
      
        '  INNER JOIN gradecurricular gd ON  (t.serie = gd.serie) AND (t.' +
        'turno = gd.turno) AND (pd.curso = gd.curso)'
      
        '  INNER JOIN disciplinas d ON (gd.disciplina = d.codigo) AND (pd' +
        '.curso = d.curso) AND (d.codigo = pd.disciplina)'
      'WHERE'
      '  (t.anosemestre = :AnoSemestre) AND (pd.professor = :Professor)')
    Params = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Professor'
        ParamType = ptUnknown
        Value = 1
      end>
    Left = 280
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Professor'
        ParamType = ptUnknown
        Value = 1
      end>
    object qyGradeCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object qyGradeTurma: TStringField
      FieldName = 'Turma'
      Size = 15
    end
    object qyGradeDisciplina: TIntegerField
      FieldName = 'Disciplina'
      DisplayFormat = '00000000000'
    end
    object qyGradeDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qyGradeProfessor: TIntegerField
      FieldName = 'Professor'
    end
  end
  object tblCursos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select codigo, apelido from cursos'
      'GROUP BY codigo'
      'order by apelido')
    Params = <>
    Left = 248
    Top = 168
    object tblCursoscodigo: TStringField
      FieldName = 'codigo'
      Origin = 'WMESTRE12.cursos.codigo'
      Size = 15
    end
    object tblCursosapelido: TStringField
      FieldName = 'apelido'
      Origin = 'WMESTRE12.cursos.apelido'
      Size = 50
    end
  end
  object qryDepartamento: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From departamentos;')
    Params = <>
    Left = 488
    Top = 264
    object qryDepartamentocodigo: TSmallintField
      FieldName = 'codigo'
    end
    object qryDepartamentodescricao: TStringField
      FieldName = 'descricao'
      Size = 255
    end
    object qryDepartamentorazaosocial: TStringField
      FieldName = 'razaosocial'
      Size = 255
    end
    object qryDepartamentosn_online: TStringField
      FieldName = 'sn_online'
      Size = 1
    end
    object qryDepartamentocd_caixa: TIntegerField
      FieldName = 'cd_caixa'
    end
    object qryDepartamentocd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qryDepartamentocd_boleto_padrao: TIntegerField
      FieldName = 'cd_boleto_padrao'
    end
    object qryDepartamentosn_alterar_boleto: TSmallintField
      FieldName = 'sn_alterar_boleto'
    end
    object qryDepartamentods_cnpj: TStringField
      FieldName = 'ds_cnpj'
      Size = 30
    end
    object qryDepartamentocd_boleto_online: TIntegerField
      FieldName = 'cd_boleto_online'
    end
    object qryDepartamentods_mascara_matricula: TStringField
      FieldName = 'ds_mascara_matricula'
    end
    object qryDepartamentods_endereco: TStringField
      FieldName = 'ds_endereco'
      Size = 100
    end
    object qryDepartamentods_bairro: TStringField
      FieldName = 'ds_bairro'
      Size = 100
    end
    object qryDepartamentods_cidade: TStringField
      FieldName = 'ds_cidade'
      Size = 100
    end
    object qryDepartamentods_estado: TStringField
      FieldName = 'ds_estado'
      Size = 3
    end
    object qryDepartamentods_cep: TStringField
      FieldName = 'ds_cep'
      Size = 9
    end
    object qryDepartamentocd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
    end
  end
  object qryCurso: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From cursos_mestre;')
    Params = <>
    Left = 456
    Top = 264
    object qryCursoCD_CURSO: TStringField
      FieldName = 'CD_CURSO'
      Required = True
      Size = 15
    end
    object qryCursoDS_CURSO: TStringField
      FieldName = 'DS_CURSO'
      Size = 255
    end
  end
  object qryUnidade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select * From coligadas;')
    Params = <>
    Left = 424
    Top = 264
    object qryUnidadecd_coligada: TIntegerField
      FieldName = 'cd_coligada'
      Required = True
    end
    object qryUnidadenm_coligada: TStringField
      FieldName = 'nm_coligada'
      Size = 255
    end
    object qryUnidadenm_razao_social: TStringField
      FieldName = 'nm_razao_social'
      Size = 100
    end
    object qryUnidadeds_cnpj: TStringField
      FieldName = 'ds_cnpj'
    end
    object qryUnidadecd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object qryUnidadecd_escola: TLargeintField
      FieldName = 'cd_escola'
    end
    object qryUnidadecd_unidade_rede: TLargeintField
      FieldName = 'cd_unidade_rede'
    end
    object qryUnidadesn_academico: TIntegerField
      FieldName = 'sn_academico'
    end
    object qryUnidadesn_financeiro: TIntegerField
      FieldName = 'sn_financeiro'
    end
    object qryUnidadeds_codcliente: TStringField
      FieldName = 'ds_codcliente'
      Size = 30
    end
    object qryUnidadenm_diretor_geral: TStringField
      FieldName = 'nm_diretor_geral'
      Size = 100
    end
    object qryUnidadenm_diretor_acad: TStringField
      FieldName = 'nm_diretor_acad'
      Size = 100
    end
    object qryUnidadenm_diretor_finan: TStringField
      FieldName = 'nm_diretor_finan'
      Size = 100
    end
    object qryUnidadenm_testemunha1: TStringField
      FieldName = 'nm_testemunha1'
      Size = 100
    end
    object qryUnidadenm_testemunha2: TStringField
      FieldName = 'nm_testemunha2'
      Size = 100
    end
    object qryUnidadeds_cpf_geral: TStringField
      FieldName = 'ds_cpf_geral'
    end
    object qryUnidadeds_cpf_acad: TStringField
      FieldName = 'ds_cpf_acad'
    end
    object qryUnidadeds_cpf_finan: TStringField
      FieldName = 'ds_cpf_finan'
    end
    object qryUnidadeds_cpf_test1: TStringField
      FieldName = 'ds_cpf_test1'
    end
    object qryUnidadeds_cpf_test2: TStringField
      FieldName = 'ds_cpf_test2'
    end
    object qryUnidademe_instituicao: TStringField
      FieldName = 'me_instituicao'
      Size = 240
    end
    object qryUnidademe_diretor: TStringField
      FieldName = 'me_diretor'
      Size = 240
    end
    object qryUnidadeds_cidade: TStringField
      FieldName = 'ds_cidade'
      Size = 50
    end
    object qryUnidadeSN_MATRIZ: TSmallintField
      FieldName = 'SN_MATRIZ'
    end
    object qryUnidadeCD_COLIGADA_MATRIZ: TIntegerField
      FieldName = 'CD_COLIGADA_MATRIZ'
    end
    object qryUnidadeds_estado: TStringField
      FieldName = 'ds_estado'
      Size = 255
    end
    object qryUnidadecd_instituicao_mec: TIntegerField
      FieldName = 'cd_instituicao_mec'
    end
    object qryUnidadeds_endereco: TStringField
      FieldName = 'ds_endereco'
      Size = 255
    end
    object qryUnidadeds_numero: TStringField
      FieldName = 'ds_numero'
      Size = 255
    end
    object qryUnidadeds_complemento: TStringField
      FieldName = 'ds_complemento'
      Size = 255
    end
    object qryUnidadeds_bairro: TStringField
      FieldName = 'ds_bairro'
      Size = 255
    end
    object qryUnidadeds_cep: TStringField
      FieldName = 'ds_cep'
      Size = 8
    end
    object qryUnidadeds_email_geral: TStringField
      FieldName = 'ds_email_geral'
      Size = 255
    end
    object qryUnidadeds_latitude: TStringField
      FieldName = 'ds_latitude'
      Size = 255
    end
    object qryUnidadeds_longitude: TStringField
      FieldName = 'ds_longitude'
      Size = 255
    end
    object qryUnidadeds_nre: TStringField
      FieldName = 'ds_nre'
      Size = 50
    end
    object qryUnidadeds_ato_direto: TStringField
      FieldName = 'ds_ato_direto'
      Size = 240
    end
    object qryUnidademe_secretaria: TStringField
      FieldName = 'me_secretaria'
      Size = 240
    end
    object qryUnidadeds_ato_secretaria: TStringField
      FieldName = 'ds_ato_secretaria'
      Size = 240
    end
    object qryUnidadeds_ato_ofic_estab: TStringField
      FieldName = 'ds_ato_ofic_estab'
      Size = 240
    end
  end
  object dsUnidade: TDataSource
    DataSet = qryUnidade
    Left = 424
    Top = 296
  end
  object dsDepartamento: TDataSource
    DataSet = qryDepartamento
    Left = 488
    Top = 296
  end
  object dsCurso: TDataSource
    DataSet = qryCurso
    Left = 456
    Top = 296
  end
end
