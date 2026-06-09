object FrmMultaEmprestimoLivros: TFrmMultaEmprestimoLivros
  Left = 224
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Multa de Empr'#233'stimo'
  ClientHeight = 255
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 29
    Align = alTop
    Caption = 'Empr'#233'stimos'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 211
    Width = 524
    Height = 44
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object SpeedButton3: TSpeedButton
      Left = 408
      Top = 11
      Width = 108
      Height = 24
      Caption = 'Fechar'
      Flat = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C00000000864D864D00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C4031864D864D864D864D00004031403140314031403140311F7C
        1F7C1F7C1F7C4031A64DA64D864D864D0000207F207F207F00001F7C1F7C1F7C
        1F7C1F7C1F7C4031A551A551A54DA54D0000207F207F207F00001F7C1F001F7C
        1F7C1F7C1F7C4031C455C451C451C5510000227F207F207F00001F001F001F7C
        1F7C1F7C1F7C4031E355E355FF7FC4550000467F457F437F1F001F001F001F7C
        1F7C1F7C1F7C4031025A035A035AE35900006C7F6A7F1F001F001F001F001F00
        1F001F001F7C4031215E225E025E025A0000917F1F001F001F001F001F001F00
        1F001F001F7C4031416221622162215E0000B67FB47F1F001F001F001F001F00
        1F001F001F7C403140664066406240620000DB7FD97FB87F1F001F001F001F7C
        1F7C1F7C1F7C403160666066606640660000FF7FDE7FDC7F00001F001F001F7C
        1F7C1F7C1F7C403160666066606660660000FF7FFF7FFF7F00001F7C1F001F7C
        1F7C1F7C1F7C1F7C4031403160666066000040314031403140311F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C4031403140311F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      OnClick = SpeedButton3Click
    end
  end
  object dgMultas: TDBGrid
    Left = 0
    Top = 29
    Width = 524
    Height = 182
    Align = alClient
    DataSource = dsMultas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'registro'
        Title.Caption = 'C'#243'd. Registro'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'titulo'
        Title.Caption = 'T'#237'tulo'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataretirada'
        Title.Caption = 'Data Retirada'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datadevolucao'
        Title.Caption = 'Data Devolu'#231#227'o'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataentrega'
        Title.Caption = 'Data Entrega'
        Width = 90
        Visible = True
      end>
  end
  object dsMultas: TDataSource
    DataSet = tblMultas
    Left = 88
    Top = 112
  end
  object tblMultas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT '
      #9'BE.registro,'
      #9'BE.dataretirada,'
      #9'BE.dataentrega,'
      #9'BE.datadevolucao,'
      #9'BL.titulo'
      'FROM'
      #9'bibliotecaemprestimos BE,'
      #9'bibliotecaregistro BR,'
      #9'bibliotecalivros BL'
      'WHERE'
      #9'BR.registro = BE.registro AND'
      #9'BL.codigolivro = BR.codigolivro AND'
      #9'BE.cd_multa = :cd_multa'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'cd_multa'
        ParamType = ptUnknown
        Value = '1'
      end>
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_multa'
        ParamType = ptUnknown
        Value = '1'
      end>
    object tblMultasregistro: TIntegerField
      FieldName = 'registro'
      Origin = 'DBACADEMICO.bibliotecaemprestimos.registro'
    end
    object tblMultasdataretirada: TDateTimeField
      FieldName = 'dataretirada'
      Origin = 'DBACADEMICO.bibliotecaemprestimos.dataretirada'
    end
    object tblMultasdataentrega: TDateTimeField
      FieldName = 'dataentrega'
      Origin = 'DBACADEMICO.bibliotecaemprestimos.dataentrega'
    end
    object tblMultasdatadevolucao: TDateTimeField
      FieldName = 'datadevolucao'
      Origin = 'DBACADEMICO.bibliotecaemprestimos.datadevolucao'
    end
    object tblMultastitulo: TStringField
      FieldName = 'titulo'
      Origin = 'DBACADEMICO.bibliotecalivros.titulo'
      Size = 100
    end
  end
end
