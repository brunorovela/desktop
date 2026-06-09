object frmCadEquiv: TfrmCadEquiv
  Left = 120
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Registrar Eq'#252'ival'#234'ncia'
  ClientHeight = 534
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 591
    Top = 69
    Width = 48
    Height = 13
    Caption = 'Institui'#231#227'o'
  end
  object Label2: TLabel
    Left = 591
    Top = 114
    Width = 30
    Height = 13
    Caption = 'Curso:'
  end
  object Label3: TLabel
    Left = 591
    Top = 154
    Width = 45
    Height = 13
    Caption = 'Disciplina'
  end
  object Label4: TLabel
    Left = 591
    Top = 237
    Width = 68
    Height = 13
    Caption = 'Ano/Semestre'
  end
  object Label5: TLabel
    Left = 727
    Top = 237
    Width = 21
    Height = 13
    Caption = 'C.H.'
  end
  object Label6: TLabel
    Left = 593
    Top = 276
    Width = 23
    Height = 13
    Caption = 'Nota'
  end
  object Label8: TLabel
    Left = 591
    Top = 194
    Width = 44
    Height = 13
    Caption = 'Professor'
  end
  object SpeedButton1: TSpeedButton
    Left = 744
    Top = 202
    Width = 144
    Height = 30
    Caption = 'Busca Professor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000000000000000007B7B7B00FF00
      FF00FF00FF00FF00FF007B7B7B00000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
      000000000000FF00FF0000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
      000000000000FF00FF0000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000000000000000000000000000FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
      FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
      00007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
      00007B000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label9: TLabel
    Left = 727
    Top = 276
    Width = 42
    Height = 13
    Caption = 'Conceito'
  end
  object Label10: TLabel
    Left = 593
    Top = 315
    Width = 64
    Height = 13
    Caption = '% Frequ'#234'ncia'
  end
  object Label11: TLabel
    Left = 727
    Top = 315
    Width = 131
    Height = 13
    Caption = '% de Conte'#250'do Equivalente'
  end
  object Label31: TLabel
    Left = 593
    Top = 356
    Width = 42
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object SpeedButton2: TSpeedButton
    Left = 863
    Top = 88
    Width = 23
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
    OnClick = SpeedButton2Click
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'EQUIVAL'#202'NCIA EM OUTRAS INSTITUI'#199#213'ES/CURSO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 65
    Width = 577
    Height = 457
    DataSource = dsGrade
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmQtd
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 351
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_curso'
        Title.Caption = 'Curso'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Serie'
        Width = 30
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 8
    Top = 35
    Width = 577
    Height = 25
    BevelOuter = bvLowered
    Caption = 'Grade do Curso'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object Panel3: TPanel
    Left = 591
    Top = 35
    Width = 297
    Height = 25
    BevelOuter = bvLowered
    Caption = 'Eq'#252'ival'#234'ncia'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
  end
  object eCurso: TEdit
    Left = 591
    Top = 128
    Width = 297
    Height = 21
    TabOrder = 1
    OnKeyPress = eInstituicaoKeyPress
  end
  object eDisciplina: TEdit
    Left = 591
    Top = 168
    Width = 297
    Height = 21
    TabOrder = 2
    OnKeyPress = eInstituicaoKeyPress
  end
  object eAnoSemestre: TMaskEdit
    Left = 591
    Top = 252
    Width = 97
    Height = 21
    EditMask = '9999/9;0;_'
    MaxLength = 6
    TabOrder = 4
    OnKeyPress = eInstituicaoKeyPress
  end
  object eCH: TEdit
    Left = 727
    Top = 252
    Width = 97
    Height = 21
    TabOrder = 5
    OnKeyPress = eInstituicaoKeyPress
  end
  object eNota: TEdit
    Left = 593
    Top = 291
    Width = 97
    Height = 21
    TabOrder = 6
    OnKeyPress = eInstituicaoKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 618
    Top = 494
    Width = 169
    Height = 28
    Caption = '&Registrar Eq'#252'ival'#234'ncia'
    TabOrder = 11
    OnClick = BitBtn1Click
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 799
    Top = 494
    Width = 89
    Height = 28
    Caption = 'Cancelar'
    TabOrder = 12
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 593
    Top = 435
    Width = 295
    Height = 49
    Caption = ' Observa'#231#245'es: '
    TabOrder = 13
    object Label7: TLabel
      Left = 18
      Top = 15
      Width = 265
      Height = 31
      AutoSize = False
      Caption = 
        'Selecione uma disciplina na grade ao lado e preencha as informa'#231 +
        #245'es acima sobre a eq'#252'ival'#234'ncia da mesma.'
      WordWrap = True
    end
  end
  object eInstituicao: TEdit
    Left = 591
    Top = 88
    Width = 266
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object eProfessor: TEdit
    Left = 591
    Top = 211
    Width = 127
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object eConceito: TEdit
    Left = 727
    Top = 291
    Width = 97
    Height = 21
    MaxLength = 10
    TabOrder = 7
  end
  object ckbHistorico: TCheckBox
    Left = 591
    Top = 410
    Width = 128
    Height = 17
    Caption = 'Registrar no Hist'#243'rico'
    TabOrder = 10
    OnClick = ckbHistoricoClick
  end
  object eFrequencia: TEdit
    Left = 593
    Top = 330
    Width = 97
    Height = 21
    TabOrder = 8
    OnKeyPress = eFrequenciaKeyPress
  end
  object eConteudoEquivalente: TEdit
    Left = 727
    Top = 329
    Width = 97
    Height = 21
    TabOrder = 9
    OnKeyPress = eFrequenciaKeyPress
  end
  object dbSituacao: TUMComboBox
    Left = 591
    Top = 375
    Width = 233
    Height = 21
    ItemHeight = 13
    TabOrder = 18
    Text = 'dbSituacao'
    TamanhoMaximo = 0
  end
  object tblGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'Select DISTINCT cursos_mestre.ds_curso, GradeCurricular.Discipli' +
        'na, GradeCurricular.Serie, Disciplinas.Descricao'
      'From'
      '  GradeCurricular, Disciplinas, cursos_mestre'
      'WHERE'
      'GradeCurricular.Disciplina = Disciplinas.Codigo AND'
      'GradeCurricular.Curso = Disciplinas.Curso AND'
      'cursos_mestre.CD_CURSO = disciplinas.curso AND'
      'GradeCurricular.Curso = :CURSO'
      'ORDER BY Serie')
    Params = <
      item
        DataType = ftString
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    object tblGradeSerie: TSmallintField
      FieldName = 'Serie'
      Origin = 'WMESTRE12.GradeCurricular.Serie'
    end
    object tblGradeDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'WMESTRE12.Disciplinas.Descricao'
      Size = 150
    end
    object tblGradeDisciplina: TIntegerField
      FieldName = 'Disciplina'
    end
    object tblGradecurso: TStringField
      FieldName = 'curso'
      Size = 50
    end
    object tblGradeds_curso: TStringField
      FieldName = 'ds_curso'
      Size = 255
    end
  end
  object dsGrade: TDataSource
    AutoEdit = False
    DataSet = tblGrade
    OnDataChange = dsGradeDataChange
    Left = 184
    Top = 216
  end
  object qRegistraEquiv: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'Insert Into Equivalencias (CodigoAluno, Disciplina, Curso, Serie' +
        ')'
      'VALUES (:CodigoAluno, :Disciplina, :Curso, :Serie)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serie'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serie'
        ParamType = ptUnknown
      end>
  end
  object qRegistraDisc: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'Insert Into EquivalenciasDisciplinas (CodigoAluno, Disciplina, C' +
        'urso, Eq_Instituicao, '
      'Eq_Curso, Eq_Disciplina, Eq_AnoSemestre, Eq_CH, Eq_Nota)'
      'VALUES (:CodigoAluno, :Disciplina, :Curso, :Eq_Instituicao, '
      ':Eq_Curso, :Eq_Disciplina, :Eq_AnoSemestre, :Eq_CH, :Eq_Nota)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Instituicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_CH'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Nota'
        ParamType = ptUnknown
      end>
    Left = 184
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Instituicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_AnoSemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_CH'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Eq_Nota'
        ParamType = ptUnknown
      end>
  end
  object qVerificaEquiv: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'Select CodigoAluno From Equivalencias'
      'WHERE CodigoAluno = :CodigoAluno AND'
      'Disciplina = :Disciplina AND Curso = :CURSO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
    Left = 232
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoAluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURSO'
        ParamType = ptUnknown
      end>
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 848
    Top = 392
  end
end
