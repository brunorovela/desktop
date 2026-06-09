object frm_cursos_turmas_adicional: Tfrm_cursos_turmas_adicional
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Cursos/Turmas (dados adicionais)'
  ClientHeight = 407
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = formShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 293
    Top = 377
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
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Cadastro de Cursos/Turmas (dados adicionais)'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object sxDados: TScrollBox
    Left = 8
    Top = 31
    Width = 649
    Height = 343
    TabOrder = 1
  end
  object btCancelar: TBitBtn
    Left = 519
    Top = 380
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btCancelarClick
    Kind = bkCancel
  end
  object btConfirmar: TBitBtn
    Left = 416
    Top = 380
    Width = 97
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 3
    OnClick = btConfirmarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object qyCampos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_CAMPO,'
      '   DS_CAMPO,'
      '   DS_CAMPO_DESCRICAO,'
      '   DS_TIPO,'
      '   NR_ORDEM,'
      '   SN_CURSO,'
      '   CD_OPCAO'
      'FROM'
      '   CURSOS_TURMAS_EXTRAS'
      'WHERE'
      '   SN_CURSO= :SN_CURSO'
      'ORDER BY'
      '   NR_ORDEM')
    Params = <
      item
        DataType = ftUnknown
        Name = 'SN_CURSO'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SN_CURSO'
        ParamType = ptUnknown
      end>
    object qyCamposCD_CAMPO: TIntegerField
      FieldName = 'CD_CAMPO'
      Required = True
    end
    object qyCamposDS_CAMPO: TStringField
      DisplayWidth = 100
      FieldName = 'DS_CAMPO'
      Size = 100
    end
    object qyCamposDS_CAMPO_DESCRICAO: TStringField
      FieldName = 'DS_CAMPO_DESCRICAO'
      Size = 255
    end
    object qyCamposDS_TIPO: TStringField
      FieldName = 'DS_TIPO'
      Size = 1
    end
    object qyCamposNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
    end
    object qyCamposCD_OPCAO: TSmallintField
      FieldName = 'CD_OPCAO'
    end
    object qyCamposSN_CURSO: TSmallintField
      FieldName = 'SN_CURSO'
    end
  end
  object qyCadastroCampos_Opcoes: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  ctu.*,'
      '  ctc.DS_CONTEUDO'
      'FROM'
      '  CURSOS_TURMAS_CAMPOS_OPCOES ctu'
      
        '  INNER JOIN CURSOS_TURMAS_EXTRAS ctca on(ctu.CD_OPCAO = ctca.CD' +
        '_OPCAO)'
      
        '  LEFT JOIN CURSOS_TURMAS_CADASTRO ctc on (ctc.CD_CAMPO = ctca.C' +
        'D_CAMPO)'
      'WHERE'
      '  ctu.CD_OPCAO = :cd_opcao'
      '  and ctca.CD_CAMPO = :cd_campo'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_opcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_campo'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_opcao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cd_campo'
        ParamType = ptUnknown
      end>
    object qyCadastroCampos_OpcoesCD_OPCAO: TLargeintField
      FieldName = 'CD_OPCAO'
      Required = True
    end
    object qyCadastroCampos_Opcoesds_opcao: TStringField
      DisplayWidth = 500
      FieldName = 'ds_opcao'
      Size = 500
    end
    object qyCadastroCampos_Opcoesme_sql: TMemoField
      FieldName = 'me_sql'
      BlobType = ftMemo
      Size = 1
    end
    object qyCadastroCampos_Opcoesme_opcoes: TMemoField
      FieldName = 'me_opcoes'
      BlobType = ftMemo
      Size = 1
    end
    object qyCadastroCampos_Opcoesds_conteudo: TStringField
      FieldName = 'ds_conteudo'
      Size = 100
    end
  end
  object qyArquivo: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'cursos_turmas_cadastro_arq')
    Params = <>
    Left = 328
    Top = 208
    object qyArquivocd_curso: TStringField
      FieldName = 'cd_curso'
      Required = True
      Size = 255
    end
    object qyArquivocd_turma: TStringField
      FieldName = 'cd_turma'
      Required = True
      Size = 255
    end
    object qyArquivocd_campo: TIntegerField
      FieldName = 'cd_campo'
      Required = True
    end
    object qyArquivonm_arquivo: TStringField
      FieldName = 'nm_arquivo'
      Size = 50
    end
    object qyArquivome_arquivo: TBlobField
      FieldName = 'me_arquivo'
    end
    object qyArquivotipo_arquivo: TStringField
      FieldName = 'tipo_arquivo'
      Size = 255
    end
    object qyArquivonr_anosemestre: TIntegerField
      FieldName = 'nr_anosemestre'
    end
    object qyArquivocd_coligada: TSmallintField
      FieldName = 'cd_coligada'
    end
  end
end
