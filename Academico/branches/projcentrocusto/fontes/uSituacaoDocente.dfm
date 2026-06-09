object frm_SituacaoDocente: Tfrm_SituacaoDocente
  Left = 0
  Top = 0
  Caption = 'Situa'#231#227'o do docente'
  ClientHeight = 257
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 9
    Top = 34
    Width = 375
    Height = 26
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 50
    Height = 13
    Caption = 'Professor:'
  end
  object lbProfessor: TLabel
    Left = 68
    Top = 40
    Width = 312
    Height = 14
    AutoSize = False
    Caption = 'lbProfessor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 102
    Height = 13
    Caption = 'Situa'#231#227'o do docente:'
  end
  object Bevel2: TBevel
    Left = 24
    Top = 121
    Width = 345
    Height = 101
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'SITUA'#199#195'O DO DOCENTE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 16
    Top = 91
    Width = 364
    Height = 21
    DataField = 'cd_situacao_doc'
    DataSource = dsProfessor
    KeyField = 'cd_situacao'
    ListField = 'ds_valor'
    ListFieldIndex = 1
    ListSource = dsSituacoes
    TabOrder = 1
  end
  object dbcbSequencial: TDBCheckBox
    Left = 32
    Top = 131
    Width = 97
    Height = 17
    Caption = 'Sequencial'
    DataField = 'sn_sequencial'
    DataSource = dsProfessor
    TabOrder = 2
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbGraduacaoPresencial: TDBCheckBox
    Left = 32
    Top = 154
    Width = 129
    Height = 17
    Caption = 'Gradua'#231#227'o Presencial'
    DataField = 'sn_graduacao_presencial'
    DataSource = dsProfessor
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbGraduacaoDistancia: TDBCheckBox
    Left = 32
    Top = 177
    Width = 129
    Height = 17
    Caption = 'Gradua'#231#227'o '#224' Dist'#226'ncia'
    DataField = 'sn_graduacao_distancia'
    DataSource = dsProfessor
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbPosPresencial: TDBCheckBox
    Left = 32
    Top = 200
    Width = 97
    Height = 17
    Caption = 'P'#243's Presencial'
    DataField = 'sn_pos_presencial'
    DataSource = dsProfessor
    TabOrder = 5
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbPosDistancia: TDBCheckBox
    Left = 192
    Top = 131
    Width = 153
    Height = 17
    Caption = 'P'#243's '#224' Dist'#226'ncia'
    DataField = 'sn_pos_distancia'
    DataSource = dsProfessor
    TabOrder = 6
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbPesquisa: TDBCheckBox
    Left = 192
    Top = 154
    Width = 153
    Height = 17
    Caption = 'Pesquisa'
    DataField = 'sn_pesquisa'
    DataSource = dsProfessor
    TabOrder = 7
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbExtensao: TDBCheckBox
    Left = 192
    Top = 177
    Width = 153
    Height = 17
    Caption = 'Extens'#227'o'
    DataField = 'sn_extensao'
    DataSource = dsProfessor
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbcbGestao: TDBCheckBox
    Left = 192
    Top = 200
    Width = 153
    Height = 17
    Caption = 'Gest'#227'o'
    DataField = 'sn_gestao'
    DataSource = dsProfessor
    TabOrder = 9
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object btSalvar: TBitBtn
    Left = 238
    Top = 228
    Width = 107
    Height = 25
    Caption = 'Salvar'
    TabOrder = 10
    OnClick = btSalvarClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      0000008484000084840000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000000000FF00FF00FF00FF000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000084840000000000FF00FF00FF00FF000000
      0000008484000084840000000000000000000000000000000000000000000000
      00000000000000000000008484000084840000000000FF00FF00FF00FF000000
      00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00FF000000
      00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF000000
      00000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object btCancelar: TBitBtn
    Left = 54
    Top = 228
    Width = 107
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 11
    OnClick = btCancelarClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
      FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000FF000000
      FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
      FF000000FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF000000
      FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      FF000000FF000000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF000000
      FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF000000
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object tblProfessor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  professores'
      'WHERE'
      '  cd_pessoa = :professor')
    Params = <
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end>
    object tblProfessorcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.professores.cd_pessoa'
    end
    object tblProfessorcd_situacao_doc: TIntegerField
      FieldName = 'cd_situacao_doc'
      Origin = 'WMESTRE12.professores.cd_situacao_doc'
    end
    object tblProfessorsn_sequencial: TSmallintField
      FieldName = 'sn_sequencial'
      Origin = 'WMESTRE12.professores.sn_sequencial'
    end
    object tblProfessorsn_graduacao_presencial: TSmallintField
      FieldName = 'sn_graduacao_presencial'
      Origin = 'WMESTRE12.professores.sn_graduacao_presencial'
    end
    object tblProfessorsn_graduacao_distancia: TSmallintField
      FieldName = 'sn_graduacao_distancia'
      Origin = 'WMESTRE12.professores.sn_graduacao_distancia'
    end
    object tblProfessorsn_pos_presencial: TSmallintField
      FieldName = 'sn_pos_presencial'
      Origin = 'WMESTRE12.professores.sn_pos_presencial'
    end
    object tblProfessorsn_pos_distancia: TSmallintField
      FieldName = 'sn_pos_distancia'
      Origin = 'WMESTRE12.professores.sn_pos_distancia'
    end
    object tblProfessorsn_pesquisa: TSmallintField
      FieldName = 'sn_pesquisa'
      Origin = 'WMESTRE12.professores.sn_pesquisa'
    end
    object tblProfessorsn_extensao: TSmallintField
      FieldName = 'sn_extensao'
      Origin = 'WMESTRE12.professores.sn_extensao'
    end
    object tblProfessorsn_gestao: TSmallintField
      FieldName = 'sn_gestao'
      Origin = 'WMESTRE12.professores.sn_gestao'
    end
  end
  object dsProfessor: TDataSource
    DataSet = tblProfessor
    OnDataChange = dsProfessorDataChange
    Left = 352
    Top = 64
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
  object tblSituacoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   situacoes'
      'WHERE'
      '   cd_modulo = 1057')
    Params = <>
    Left = 352
    Top = 160
    object tblSituacoescd_situacao: TIntegerField
      FieldName = 'cd_situacao'
      Origin = 'WMESTRE12.situacoes.cd_situacao'
    end
    object tblSituacoesds_valor: TStringField
      FieldName = 'ds_valor'
      Origin = 'WMESTRE12.situacoes.ds_valor'
      Size = 255
    end
  end
  object dsSituacoes: TDataSource
    DataSet = tblSituacoes
    Left = 352
    Top = 192
  end
end
