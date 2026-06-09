object frmEscolas: TfrmEscolas
  Left = 177
  Top = 148
  Caption = 'Cadastro de Institui'#231#245'es de Ensino'
  ClientHeight = 837
  ClientWidth = 1061
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1061
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'INSTITUI'#199#213'ES DE ENSINO'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnCadastro: TScrollBox
    Left = 0
    Top = 22
    Width = 505
    Height = 790
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 6
      Top = 44
      Width = 93
      Height = 14
      Caption = 'Nome da Institui'#231#227'o'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 173
      Top = 239
      Width = 56
      Height = 14
      Caption = 'Logradouro'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 6
      Top = 278
      Width = 64
      Height = 14
      Caption = 'Complemento'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 6
      Top = 239
      Width = 29
      Height = 14
      Caption = 'Bairro'
      FocusControl = DBEdit5
    end
    object Label42: TLabel
      Left = 131
      Top = 200
      Width = 33
      Height = 14
      Caption = 'Estado'
      FocusControl = dblEstado
    end
    object Label7: TLabel
      Left = 368
      Top = 161
      Width = 19
      Height = 14
      Caption = 'CEP'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 237
      Top = 278
      Width = 41
      Height = 14
      Caption = 'Telefone'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 348
      Top = 278
      Width = 50
      Height = 14
      Caption = 'Telefone 2'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 6
      Top = 316
      Width = 28
      Height = 14
      Caption = 'E-Mail'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 221
      Top = 316
      Width = 18
      Height = 14
      Caption = 'Site'
      FocusControl = DBEdit11
    end
    object Label1: TLabel
      Left = 6
      Top = 161
      Width = 32
      Height = 14
      Caption = 'Diretor'
    end
    object Label12: TLabel
      Left = 6
      Top = 83
      Width = 71
      Height = 14
      Caption = 'Nome Fantasia'
      FocusControl = DBEdit2
    end
    object Label13: TLabel
      Left = 6
      Top = 122
      Width = 78
      Height = 14
      Caption = 'Credenciamento'
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 282
      Top = 200
      Width = 33
      Height = 14
      Caption = 'Cidade'
    end
    object lblPais: TLabel
      Left = 6
      Top = 200
      Width = 21
      Height = 14
      Caption = 'Pa'#237's'
    end
    object Label14: TLabel
      Left = 6
      Top = 397
      Width = 157
      Height = 14
      Caption = 'Observa'#231#245'es sobre a institui'#231#227'o'
      FocusControl = DBMemo1
    end
    object Label15: TLabel
      Left = 79
      Top = 354
      Width = 107
      Height = 14
      Caption = 'Data de Inicio Irregular'
      FocusControl = DbInicioIrregular
    end
    object Label16: TLabel
      Left = 221
      Top = 354
      Width = 99
      Height = 14
      Caption = 'Data de Fim Irregular'
      FocusControl = DbFimIrregular
    end
    object DBEdit2: TDBEdit
      Left = 6
      Top = 58
      Width = 461
      Height = 22
      DataField = 'nm_instituicao'
      DataSource = dtcEscolas
      TabOrder = 1
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit3: TDBEdit
      Left = 173
      Top = 253
      Width = 294
      Height = 22
      DataField = 'ds_endereco'
      DataSource = dtcEscolas
      TabOrder = 10
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit4: TDBEdit
      Left = 6
      Top = 291
      Width = 225
      Height = 22
      DataField = 'ds_complemento'
      DataSource = dtcEscolas
      TabOrder = 11
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit5: TDBEdit
      Left = 6
      Top = 253
      Width = 161
      Height = 22
      DataField = 'ds_bairro'
      DataSource = dtcEscolas
      TabOrder = 9
      OnKeyPress = DBEdit1KeyPress
    end
    object dblEstado: TDBLookupComboBox
      Left = 131
      Top = 214
      Width = 145
      Height = 22
      DataField = 'descEstado'
      DataSource = dtcEscolas
      TabOrder = 7
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 368
      Top = 175
      Width = 99
      Height = 22
      DataField = 'ds_cep'
      DataSource = dtcEscolas
      TabOrder = 5
      OnKeyPress = DBEdit1KeyPress
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 6
      Top = 3
      Width = 461
      Height = 38
      Caption = ' Categoria '
      Columns = 4
      DataField = 'ds_tipo'
      DataSource = dtcEscolas
      Items.Strings = (
        'Federal'
        'Estadual'
        'Municipal'
        'Particular')
      ParentBackground = True
      TabOrder = 0
      Values.Strings = (
        'F'
        'E'
        'M'
        'P')
    end
    object DBEdit8: TDBEdit
      Left = 237
      Top = 291
      Width = 105
      Height = 22
      DataField = 'ds_telefone1'
      DataSource = dtcEscolas
      TabOrder = 12
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit9: TDBEdit
      Left = 348
      Top = 291
      Width = 119
      Height = 22
      DataField = 'ds_telefone2'
      DataSource = dtcEscolas
      TabOrder = 13
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit10: TDBEdit
      Left = 6
      Top = 330
      Width = 209
      Height = 22
      DataField = 'ds_email'
      DataSource = dtcEscolas
      TabOrder = 14
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit11: TDBEdit
      Left = 221
      Top = 330
      Width = 246
      Height = 22
      DataField = 'ds_site'
      DataSource = dtcEscolas
      TabOrder = 15
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox1: TDBCheckBox
      Left = 6
      Top = 515
      Width = 105
      Height = 17
      Caption = 'Educa'#231#227'o Infantil'
      DataField = 'sn_educacao_infantil'
      DataSource = dtcEscolas
      TabOrder = 19
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox2: TDBCheckBox
      Left = 117
      Top = 515
      Width = 121
      Height = 17
      Caption = 'Ensino Fundamental'
      DataField = 'sn_ensino_fundamental'
      DataSource = dtcEscolas
      TabOrder = 20
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox3: TDBCheckBox
      Left = 284
      Top = 515
      Width = 97
      Height = 17
      Caption = 'Ensino M'#233'dio'
      DataField = 'sn_ensino_medio'
      DataSource = dtcEscolas
      TabOrder = 21
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox4: TDBCheckBox
      Left = 6
      Top = 535
      Width = 97
      Height = 17
      Caption = 'Ensino Superior'
      DataField = 'sn_ensino_superior'
      DataSource = dtcEscolas
      TabOrder = 22
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox5: TDBCheckBox
      Left = 117
      Top = 535
      Width = 161
      Height = 17
      Caption = 'Cursos Profissionalizantes'
      DataField = 'sn_cursos_profissionalizantes'
      DataSource = dtcEscolas
      TabOrder = 23
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox6: TDBCheckBox
      Left = 284
      Top = 535
      Width = 137
      Height = 17
      Caption = 'Ensino Especial'
      DataField = 'sn_ensino_especial'
      DataSource = dtcEscolas
      TabOrder = 24
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox7: TDBCheckBox
      Left = 117
      Top = 555
      Width = 137
      Height = 17
      Caption = 'Unidade Certificadora'
      DataField = 'sn_unidade_certificadora'
      DataSource = dtcEscolas
      TabOrder = 26
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = DBEdit1KeyPress
    end
    object DBCheckBox8: TDBCheckBox
      Left = 6
      Top = 555
      Width = 107
      Height = 17
      Caption = 'Conv'#234'nio'
      DataField = 'sn_convenio'
      DataSource = dtcEscolas
      TabOrder = 25
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = DBEdit1KeyPress
    end
    object Panel1: TPanel
      Left = 117
      Top = 580
      Width = 180
      Height = 179
      Caption = 'FOTO'
      PopupMenu = pmFoto
      TabOrder = 27
      OnDblClick = imageFotoDblClick
      object imageFoto: TImage
        Left = 1
        Top = 1
        Width = 178
        Height = 177
        Hint = 'Duplo clique para procurar a foto.'
        Align = alClient
        PopupMenu = pmFoto
        Proportional = True
        Stretch = True
        OnDblClick = imageFotoDblClick
        ExplicitTop = 2
      end
    end
    object dbeDiretor: TDBEdit
      Left = 6
      Top = 175
      Width = 356
      Height = 22
      DataField = 'ds_diretor'
      DataSource = dtcEscolas
      TabOrder = 4
    end
    object dbeNmFantasia: TDBEdit
      Left = 6
      Top = 97
      Width = 461
      Height = 22
      DataField = 'nm_fantasia'
      DataSource = dtcEscolas
      TabOrder = 2
    end
    object dbeCredenciamento: TDBEdit
      Left = 6
      Top = 136
      Width = 461
      Height = 22
      DataField = 'ds_credenciamento'
      DataSource = dtcEscolas
      TabOrder = 3
    end
    object cmbPais: TComboBox
      Left = 6
      Top = 214
      Width = 119
      Height = 22
      ItemHeight = 14
      TabOrder = 6
      OnChange = cmbPaisChange
      OnSelect = cmbPaisSelect
    end
    object DBMemo1: TDBMemo
      Left = 6
      Top = 412
      Width = 461
      Height = 97
      DataField = 'DS_OBSERVACAO'
      DataSource = dtcEscolas
      ScrollBars = ssBoth
      TabOrder = 18
    end
    object cbMunicipio: TComboBox
      Left = 282
      Top = 214
      Width = 185
      Height = 22
      ItemHeight = 14
      TabOrder = 8
      OnChange = cbMunicipioChange
    end
    object DbInicioIrregular: TDBEdit
      Left = 79
      Top = 369
      Width = 136
      Height = 22
      DataField = 'dt_inicio_irregular'
      DataSource = dtcEscolas
      TabOrder = 16
      OnKeyPress = DBEdit1KeyPress
    end
    object DbFimIrregular: TDBEdit
      Left = 221
      Top = 369
      Width = 140
      Height = 22
      DataField = 'dt_fim_irregular'
      DataSource = dtcEscolas
      TabOrder = 17
      OnEnter = DbFimIrregularEnter
      OnKeyPress = DBEdit1KeyPress
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 812
    Width = 1061
    Height = 25
    Align = alBottom
    ButtonWidth = 85
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnIncluir: TToolButton
      Left = 8
      Top = 0
      Caption = 'F2 Incluir'
      ImageIndex = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TToolButton
      Left = 93
      Top = 0
      Caption = 'F3 Alterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 178
      Top = 0
      Caption = 'F9 Excluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 263
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 271
      Top = 0
      Caption = 'F5 Salvar'
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 356
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object ToolButton9: TToolButton
      Left = 441
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 449
      Top = 0
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnFecharClick
    end
    object ToolButton2: TToolButton
      Left = 534
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object pnlDireita: TPanel
    Left = 505
    Top = 22
    Width = 556
    Height = 790
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 3
    object pnlFiltro: TPanel
      Left = 3
      Top = 3
      Width = 550
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblTotal: TLabel
        Left = 102
        Top = 5
        Width = 3
        Height = 14
      end
      object spLocalizar: TSpeedButton
        Left = 211
        Top = 22
        Width = 23
        Height = 22
        Hint = 'Localizar Disciplina'
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
        OnClick = spLocalizarClick
      end
      object sbLimpar: TSpeedButton
        Left = 241
        Top = 22
        Width = 23
        Height = 22
        Hint = 'Limpar Localizador'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
          AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
          A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
          1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
          8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
          4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
          EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
          9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
          4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
          6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
          7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
          4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
          FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
          83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
          2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
          FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
          9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
          7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
          CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
          9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
          FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
          EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
          85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
          B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
          B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
          DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = sbLimparClick
      end
      object ledInstitucao: TLabeledEdit
        Left = 0
        Top = 22
        Width = 205
        Height = 22
        EditLabel.Width = 96
        EditLabel.Height = 14
        EditLabel.Caption = 'Nome da institui'#231#227'o:'
        TabOrder = 0
        OnKeyPress = ledInstitucaoKeyPress
      end
    end
    object Panel2: TPanel
      Left = 3
      Top = 55
      Width = 550
      Height = 732
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlGrid'
      TabOrder = 1
      object grd: TDBGrid
        Left = 0
        Top = 0
        Width = 550
        Height = 732
        Align = alClient
        DataSource = dtcEscolas
        DefaultDrawing = False
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmQtd
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDrawColumnCell = grdDrawColumnCell
        OnTitleClick = grdTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nm_instituicao'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_diretor'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_telefone1'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_telefone2'
            Width = 150
            Visible = True
          end>
      end
    end
  end
  object DBCheckBox9: TDBCheckBox
    Left = 8
    Top = 396
    Width = 65
    Height = 17
    Caption = 'Irregular'
    DataField = 'sn_irregular'
    DataSource = dtcEscolas
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object tblEscolas: TUMZQuery
    Connection = DM.db
    AfterEdit = tblEscolasAfterEdit
    BeforePost = tblEscolasBeforePost
    AfterPost = tblEscolasAfterPost
    BeforeDelete = tblEscolasBeforeDelete
    OnNewRecord = tblEscolasNewRecord
    SQL.Strings = (
      'select'
      '  nm_instituicao,'
      '  ds_endereco,'
      '  ds_complemento,'
      '  ds_bairro,'
      '  ds_cidade,'
      '  ds_estado,'
      '  ds_cep,'
      '  ds_diretor,'
      '  ds_tipo,'
      '  ds_telefone1,'
      '  ds_telefone2,'
      '  ds_email,'
      '  ds_site,'
      '  sn_educacao_infantil,'
      '  sn_ensino_fundamental,'
      '  sn_ensino_medio,'
      '  sn_ensino_superior,'
      '  sn_unidade_certificadora,'
      '  sn_convenio,'
      '  cd_instituicao,'
      '  ds_credenciamento,'
      '  nm_fantasia,'
      '  sn_cursos_profissionalizantes,'
      '  sn_ensino_especial,'
      '  DS_OBSERVACAO,'
      '  cd_municipio,'
      '  sn_irregular,'
      '  dt_inicio_irregular,'
      '  dt_fim_irregular'
      'from'
      '  instituicoes_ensino'
      'order by nm_instituicao')
    Params = <>
    Left = 640
    Top = 408
    object tblEscolasnm_instituicao: TStringField
      DisplayLabel = 'Nome da Institui'#231#227'o'
      FieldName = 'nm_instituicao'
      Origin = 'WMESTRE12.Instituicoes.nm_instituicao'
      Size = 80
    end
    object tblEscolasds_endereco: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'ds_endereco'
      Origin = 'WMESTRE12.Instituicoes.ds_endereco'
      Size = 80
    end
    object tblEscolasds_complemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ds_complemento'
      Origin = 'WMESTRE12.Instituicoes.ds_complemento'
      Size = 50
    end
    object tblEscolasds_bairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'ds_bairro'
      Origin = 'WMESTRE12.Instituicoes.ds_bairro'
      Size = 50
    end
    object tblEscolasds_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'ds_cidade'
      Origin = 'WMESTRE12.Instituicoes.ds_cidade'
      Size = 50
    end
    object tblEscolasds_estado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ds_estado'
      Origin = 'WMESTRE12.Instituicoes.ds_estado'
      Size = 3
    end
    object tblEscolasds_cep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'ds_cep'
      Origin = 'WMESTRE12.Instituicoes.ds_cep'
      Size = 8
    end
    object tblEscolasds_diretor: TStringField
      DisplayLabel = 'Diretor'
      FieldName = 'ds_diretor'
      Origin = 'WMESTRE12.Instituicoes.ds_diretor'
      Size = 80
    end
    object tblEscolasds_tipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ds_tipo'
      Origin = 'WMESTRE12.Instituicoes.ds_tipo'
      Size = 1
    end
    object tblEscolasds_telefone1: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'ds_telefone1'
      Origin = 'WMESTRE12.Instituicoes.ds_telefone1'
      Size = 25
    end
    object tblEscolasds_telefone2: TStringField
      DisplayLabel = 'Telefone 2'
      FieldName = 'ds_telefone2'
      Origin = 'WMESTRE12.Instituicoes.ds_telefone2'
      Size = 25
    end
    object tblEscolasds_email: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'ds_email'
      Origin = 'WMESTRE12.Instituicoes.ds_email'
      Size = 100
    end
    object tblEscolasds_site: TStringField
      DisplayLabel = 'Site'
      FieldName = 'ds_site'
      Origin = 'WMESTRE12.Instituicoes.ds_site'
      Size = 100
    end
    object tblEscolassn_educacao_infantil: TStringField
      DisplayLabel = 'Educa'#231#227'o Infantil'
      FieldName = 'sn_educacao_infantil'
      Origin = 'WMESTRE12.Instituicoes.sn_educacao_infantil'
      Size = 1
    end
    object tblEscolassn_ensino_fundamental: TStringField
      DisplayLabel = 'Ensino Fundamental'
      FieldName = 'sn_ensino_fundamental'
      Origin = 'WMESTRE12.Instituicoes.sn_ensino_fundamental'
      Size = 1
    end
    object tblEscolassn_ensino_medio: TStringField
      DisplayLabel = 'Ensino M'#233'dio'
      FieldName = 'sn_ensino_medio'
      Origin = 'WMESTRE12.Instituicoes.sn_ensino_medio'
      Size = 1
    end
    object tblEscolassn_ensino_superior: TStringField
      DisplayLabel = 'Ensino Superior'
      FieldName = 'sn_ensino_superior'
      Origin = 'WMESTRE12.Instituicoes.sn_ensino_superior'
      Size = 1
    end
    object tblEscolassn_cursos_profissionalizantes: TStringField
      DisplayLabel = 'Ensino Profissionalizante'
      FieldName = 'sn_cursos_profissionalizantes'
      Origin = 'WMESTRE12.Instituicoes.sn_cursos_profissionalizantes'
      Size = 1
    end
    object tblEscolasdescEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'descEstado'
      LookupDataSet = qryEstado
      LookupKeyFields = 'ds_uf'
      LookupResultField = 'ds_estado'
      KeyFields = 'ds_estado'
      Size = 50
      Lookup = True
    end
    object tblEscolassn_ensino_especial: TStringField
      DisplayLabel = 'Ensino Especial'
      FieldName = 'sn_ensino_especial'
      Origin = 'WMESTRE12.Instituicoes.sn_ensino_especial'
      Size = 1
    end
    object tblEscolassn_unidade_certificadora: TSmallintField
      FieldName = 'sn_unidade_certificadora'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_unidade_certificadora'
    end
    object tblEscolassn_convenio: TSmallintField
      FieldName = 'sn_convenio'
      Origin = 'WMESTRE12.instituicoes_ensino.sn_convenio'
    end
    object tblEscolascd_instituicao: TIntegerField
      DisplayLabel = 'C'#243'd. Instui'#231#227'o'
      FieldName = 'cd_instituicao'
      Required = True
    end
    object tblEscolasds_credenciamento: TStringField
      FieldName = 'ds_credenciamento'
      Size = 150
    end
    object tblEscolasnm_fantasia: TStringField
      FieldName = 'nm_fantasia'
      Size = 80
    end
    object tblEscolasDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      BlobType = ftMemo
    end
    object tblEscolascd_municipio: TIntegerField
      FieldName = 'cd_municipio'
    end
    object tblEscolassn_irregular: TSmallintField
      FieldName = 'sn_irregular'
    end
    object tblEscolasdt_inicio_irregular: TDateField
      FieldName = 'dt_inicio_irregular'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;'
    end
    object tblEscolasdt_fim_irregular: TDateField
      FieldName = 'dt_fim_irregular'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;'
    end
  end
  object dtcEscolas: TDataSource
    DataSet = tblEscolas
    OnStateChange = dtcEscolasStateChange
    OnDataChange = dtcEscolasDataChange
    Left = 672
    Top = 408
  end
  object ImageList1: TImageList
    Left = 528
    Top = 384
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
      E00FF870F21F83FFCFC7F800E40F000F87E3FA10C203003FA3F3FA108603002F
      31F9F8008C01000F38F980019001000F3C798013802100013E39801380010001
      3F198013C06300019F8B801FF18F000F8FC3801FFE01000FC7E7801FFF07002F
      E00F801FFF8F803FF83FFFFFFFFFE3FFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pmQtd: TPopupMenu
    OnPopup = pmQtdPopup
    Left = 664
    Top = 264
  end
  object AbrirFoto: TSavePictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg'
    FilterIndex = 0
    Title = 'Selecionar foto da pessoa'
    Left = 520
    Top = 456
  end
  object pmFoto: TPopupMenu
    Left = 320
    Top = 628
    object mIAlterar: TMenuItem
      Caption = 'Alterar Foto'
      OnClick = imageFotoDblClick
    end
    object mIExcluir: TMenuItem
      Caption = 'Excluir Foto'
      OnClick = mIExcluirClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object mICancelar: TMenuItem
      Caption = 'Cancelar'
      OnClick = mICancelarClick
    end
  end
  object qryImagem: TUMZQuery
    Connection = DM.db
    AfterEdit = tblEscolasAfterEdit
    BeforePost = tblEscolasBeforePost
    AfterPost = tblEscolasAfterPost
    BeforeDelete = tblEscolasBeforeDelete
    OnNewRecord = tblEscolasNewRecord
    SQL.Strings = (
      'select'
      '  cd_instituicao,im_logo'
      'from'
      '  instituicoes_ensino'
      'where'
      '  cd_instituicao =:cd_instituicao  '
      'order by nm_instituicao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_instituicao'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_instituicao'
        ParamType = ptUnknown
      end>
    object qryImagemim_logo: TBlobField
      FieldName = 'im_logo'
      Size = 1
    end
    object qryImagemcd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
  end
  object qryPaises: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   cd_pais,'
      '   ds_pais'
      'FROM'
      '   paises'
      'ORDER BY'
      '   ds_pais')
    Params = <>
    Left = 640
    Top = 440
    object qryPaisescd_pais: TLargeintField
      FieldName = 'cd_pais'
      Required = True
    end
    object qryPaisesds_pais: TStringField
      FieldName = 'ds_pais'
      Size = 50
    end
  end
  object qryEstado: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   * '
      'FROM '
      '   estados '
      'WHERE'
      '    cd_pais =:cd_pais'
      'ORDER BY'
      '   ds_estado')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pais'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pais'
        ParamType = ptUnknown
      end>
    object qryEstadocd_mec: TLargeintField
      FieldName = 'cd_mec'
    end
    object qryEstadods_uf: TStringField
      FieldName = 'ds_uf'
      Required = True
      Size = 3
    end
    object qryEstadods_estado: TStringField
      FieldName = 'ds_estado'
      Size = 50
    end
    object qryEstadocd_pais: TIntegerField
      FieldName = 'cd_pais'
    end
  end
  object qryFiltros: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      '   cd_instituicao,  '
      '   nm_instituicao'
      'from'
      '   instituicoes_ensino'
      'WHERE'
      '   nm_instituicao like :nm_instituicao'
      'order by'
      '   nm_instituicao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nm_instituicao'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nm_instituicao'
        ParamType = ptUnknown
      end>
    object qryFiltroscd_instituicao: TIntegerField
      FieldName = 'cd_instituicao'
      Required = True
    end
    object qryFiltrosnm_instituicao: TStringField
      FieldName = 'nm_instituicao'
      Size = 80
    end
  end
  object qryMunicipios: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  municipios'
      'WHERE'
      '  uf = :ds_uf'
      'ORDER BY'
      '  ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_uf'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_uf'
        ParamType = ptUnknown
      end>
    object qryMunicipioscd_municipio: TLargeintField
      FieldName = 'cd_municipio'
    end
    object qryMunicipiosds_municipio: TStringField
      DisplayWidth = 120
      FieldName = 'ds_municipio'
      Size = 120
    end
  end
end
