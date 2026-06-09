object frmEmissaoEtiquetas: TfrmEmissaoEtiquetas
  Left = 247
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Emiss'#227'o de Etiquetas'
  ClientHeight = 348
  ClientWidth = 682
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
  object Panel2: TPanel
    Left = 0
    Top = 291
    Width = 682
    Height = 57
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 0
    object btnSair2: TSpeedButton
      Left = 552
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Sair'
      Caption = 'Sai&r'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
      NumGlyphs = 2
    end
    object btnPesquisar2: TSpeedButton
      Left = 495
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Pesquisar'
      Caption = 'P&esquisar'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
    end
    object btnImprimir2: TSpeedButton
      Left = 438
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Imprimir'
      Caption = 'Im&primir'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
    end
    object btnCancelar2: TSpeedButton
      Left = 381
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Cancelar'
      Caption = '&Cancelar'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
    end
    object btnExcluir2: TSpeedButton
      Left = 324
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Excluir'
      Caption = 'E&xcluir'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
    end
    object btnSalvar2: TSpeedButton
      Left = 267
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Salvar'
      Caption = '&Salvar'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
    end
    object btnAlterar2: TSpeedButton
      Left = 210
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Alterar'
      Caption = '&Alterar'
      Flat = True
      Layout = blGlyphTop
      Margin = 20
    end
    object btnNovo2: TSpeedButton
      Left = 153
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Novo'
      Caption = '&Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      Margin = 20
      ParentFont = False
    end
    object btnPesquisar: TSpeedButton
      Left = 495
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Pesquisar'
      Caption = 'F8'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
    end
    object btnSair: TSpeedButton
      Left = 552
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Sair'
      Caption = 'F12'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      NumGlyphs = 2
      OnClick = btnSairClick
    end
    object btnImprimir: TSpeedButton
      Left = 438
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Imprimir'
      Caption = 'F7'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      OnClick = btnImprimirClick
    end
    object btnCancelar: TSpeedButton
      Left = 381
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Cancelar'
      Caption = 'F6'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      OnClick = btnCancelarClick
    end
    object btnExcluir: TSpeedButton
      Left = 324
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Excluir'
      Caption = 'F5'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      OnClick = btnExcluirClick
    end
    object btnSalvar: TSpeedButton
      Left = 267
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Salvar'
      Caption = 'F4'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      OnClick = btnSalvarClick
    end
    object btnAlterar: TSpeedButton
      Left = 210
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Alterar'
      Caption = 'F3'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      OnClick = btnAlterarClick
    end
    object btnNovo: TSpeedButton
      Left = 153
      Top = 8
      Width = 57
      Height = 41
      Hint = 'Novo'
      Caption = 'F2'
      Flat = True
      Layout = blGlyphTop
      Margin = 5
      OnClick = btnNovoClick
    end
    object Navigator: TDBNavigator
      Left = 73
      Top = 8
      Width = 80
      Height = 41
      DataSource = dtcControle
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 291
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 674
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'EMISS'#195'O DE ETIQUETAS'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object grd: TDBGrid
      Left = 15
      Top = 48
      Width = 313
      Height = 231
      DataSource = dtcControle
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PopupMenu = pmQtdControle
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 171
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataEmissao'
          Visible = True
        end>
    end
    object grd2: TDBGrid
      Left = 335
      Top = 48
      Width = 202
      Height = 231
      DataSource = dtcEtiquetas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PopupMenu = pmQtdEtiquetas
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnKeyDown = grd2KeyDown
      OnKeyPress = grd2KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'CodigoAluno'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AnoSemestre'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Turma'
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 549
      Top = 48
      Width = 97
      Height = 25
      Caption = 'Sele'#231#227'o Turmas'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 549
      Top = 80
      Width = 97
      Height = 25
      Caption = 'Sele'#231#227'o B'#244'nus'
      TabOrder = 4
      OnClick = Button2Click
    end
    object grp: TRadioGroup
      Left = 549
      Top = 112
      Width = 121
      Height = 161
      Caption = 'Imprimir:'
      ItemIndex = 0
      Items.Strings = (
        'Etiquetas'
        'Seed Advogado'
        'Carta Lobe'
        'Vencidos'
        'Crach'#225
        'Carta Cobran'#231'a'
        'Seed Universit'#225'rio')
      TabOrder = 5
    end
  end
  object tblControle: TUMZQuery
    OnNewRecord = tblControleNewRecord
    SQL.Strings = (
      'select * from ControleEtiquetas')
    Params = <>
    Left = 488
    Top = 216
    object tblControleCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object tblControleDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 50
    end
    object tblControleDataEmissao: TDateTimeField
      DisplayLabel = 'Dt.Emiss'#227'o'
      FieldName = 'DataEmissao'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object dtcControle: TDataSource
    DataSet = tblControle
    OnStateChange = dtcControleStateChange
    OnDataChange = dtcControleDataChange
    Left = 488
    Top = 248
  end
  object tblEtiquetas: TUMZQuery
    BeforeInsert = tblEtiquetasBeforeInsert
    AfterPost = tblEtiquetasAfterPost
    OnNewRecord = tblEtiquetasNewRecord
    SQL.Strings = (
      'select * from Etiquetas'
      'where CodigoControle = :CodigoControle')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoControle'
        ParamType = ptUnknown
      end>
    Left = 520
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoControle'
        ParamType = ptUnknown
      end>
    object tblEtiquetasCodigoAluno: TIntegerField
      DisplayLabel = 'Cod.Aluno'
      FieldName = 'CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblEtiquetasCodigoControle: TIntegerField
      FieldName = 'CodigoControle'
    end
    object tblEtiquetasTurma: TStringField
      DisplayWidth = 7
      FieldName = 'Turma'
      Size = 15
    end
    object tblEtiquetasAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      DisplayFormat = '0000/0'
    end
  end
  object dtcEtiquetas: TDataSource
    DataSet = tblEtiquetas
    Left = 520
    Top = 248
  end
  object qryMax: TUMZQuery
    Params = <>
    Left = 456
    Top = 216
  end
  object qryMatriculas: TUMZQuery
    SQL.Strings = (
      'select CodigoAluno, Turma, AnoSemestre from Matriculas'
      'where Turma = :Turma and AnoSemestre = :AnoSemestre')
    Params = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 424
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'Turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object qryMatriculasCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Matriculas.CodigoAluno'
    end
    object qryMatriculasTurma: TStringField
      FieldName = 'Turma'
      Origin = 'Matriculas.Turma'
      Size = 15
    end
    object qryMatriculasAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Matriculas.CodigoAluno'
    end
  end
  object qryBonus: TUMZQuery
    SQL.Strings = (
      'select AlunoBeneficiado, AnoSemestre from Bonus '
      'where '
      'AnoSemestre = :AnoSemestre '
      'group by AlunoBeneficiado, AnoSemestre'
      'order by AlunoBeneficiado')
    Params = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object qryBonusAlunoBeneficiado: TIntegerField
      FieldName = 'AlunoBeneficiado'
      Origin = 'Bonus.AlunoBeneficiado'
    end
    object qryBonusAnoSemestre: TIntegerField
      FieldName = 'AnoSemestre'
      Origin = 'Bonus.AnoSemestre'
    end
  end
  object qryDelete: TUMZQuery
    SQL.Strings = (
      'delete from Etiquetas where CodigoControle = :CodigoControle')
    Params = <
      item
        DataType = ftInteger
        Name = 'CodigoControle'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodigoControle'
        ParamType = ptUnknown
      end>
  end
  object pmQtdControle: TPopupMenu
    OnPopup = pmQtdControlePopup
    Left = 488
    Top = 184
  end
  object pmQtdEtiquetas: TPopupMenu
    OnPopup = pmQtdEtiquetasPopup
    Left = 520
    Top = 184
  end
end
