object frmCadDeficiencias: TfrmCadDeficiencias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Necessidades Especiais'
  ClientHeight = 329
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvInfoPessoa: TBevel
    Left = 9
    Top = 34
    Width = 373
    Height = 26
  end
  object lbInfoPessoa: TLabel
    Left = 16
    Top = 40
    Width = 38
    Height = 13
    Caption = 'Pessoa:'
  end
  object lbPessoa: TLabel
    Left = 60
    Top = 40
    Width = 321
    Height = 14
    AutoSize = False
    Caption = 'lbPessoa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbAjuda: TLabel
    Left = 8
    Top = 305
    Width = 328
    Height = 13
    Caption = 
      '* Marque as op'#231#245'es referente as necessidades especiais da pessoa' +
      '.'
  end
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Cadastro de Necessidades Especiais'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object grdDeficiencias: TDBGrid
    Left = 8
    Top = 69
    Width = 372
    Height = 230
    BorderStyle = bsNone
    DataSource = dtcDeficiencias
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmQtd
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = grdDeficienciasCellClick
    OnDrawColumnCell = grdDeficienciasDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'sn_portador'
        Title.Caption = '?'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_valor'
        Title.Caption = 'Descri'#231#227'o'
        Width = 330
        Visible = True
      end>
  end
  object tblDeficiencias: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      '   pd.cd_pessoa_deficiencia,'
      '   si.cd_situacao, '
      '   si.ds_valor,'
      
        '   CASE WHEN pd.cd_deficiencia is null THEN '#39'0'#39' ELSE '#39'1'#39'  end sn' +
        '_portador'#9#9#9#9
      'FROM '
      '   situacoes  si'
      
        '   LEFT JOIN pessoas_deficiencias  pd ON (pd.cd_deficiencia = si' +
        '.cd_situacao AND cd_pessoa = :cd_pessoa)'
      'WHERE '
      '     si.cd_modulo = 1056'
      'ORDER BY '
      '     si.ds_valor')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object tblDeficienciascd_pessoa_deficiencia: TIntegerField
      FieldName = 'cd_pessoa_deficiencia'
    end
    object tblDeficienciascd_situacao: TIntegerField
      FieldName = 'cd_situacao'
    end
    object tblDeficienciasds_valor: TStringField
      FieldName = 'ds_valor'
      Size = 255
    end
    object tblDeficienciassn_portador: TStringField
      FieldName = 'sn_portador'
      Size = 1
    end
  end
  object dtcDeficiencias: TDataSource
    DataSet = tblDeficiencias
    Left = 328
    Top = 248
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
end
