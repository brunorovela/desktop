object frm_ContasPagar_Apropriacoes: Tfrm_ContasPagar_Apropriacoes
  Left = 219
  Top = 266
  BorderStyle = bsSingle
  Caption = 'Planos de Contas e Centros de Custos'
  ClientHeight = 221
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 592
    Height = 10
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 10
    Width = 10
    Height = 174
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 184
    Width = 592
    Height = 37
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel4: TBevel
    Left = 582
    Top = 10
    Width = 10
    Height = 174
    Align = alRight
    Shape = bsSpacer
  end
  object sbFechar: TSpeedButton
    Left = 494
    Top = 191
    Width = 89
    Height = 22
    Caption = 'F12 Fechar'
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
    OnClick = sbFecharClick
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 10
    Width = 572
    Height = 174
    Align = alClient
    DataSource = srcApropriacoes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ds_conta'
        Title.Caption = 'Plano de Contas'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_centro'
        Title.Caption = 'Centro de Custos'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_movimento'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  object qyApropriacoes: TUMZQuery
    Connection = db
    Filtered = True
    
    SQL.Strings = (
      'SELECT'
      '   pc.ds_conta,'
      '   pcc.ds_centro,'
      '   a.vl_movimento'
      'FROM'
      '   fin_apropria_cp a,'
      '   fin_centro_custos pcc,'
      '   fin_plano_contas pc'
      'WHERE'
      '   pc.cd_conta = a.cd_conta AND'
      '   pcc.cd_centro = a.cd_centro AND'
      '   a.cd_titulo = :cd_titulo ')
    Left = 40
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_titulo'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qyApropriacoesds_conta: TStringField
      FieldName = 'ds_conta'
      Origin = 'WMESTRE12.plano_contas.ds_conta'
      Size = 255
    end
    object qyApropriacoesds_centro: TStringField
      FieldName = 'ds_centro'
      Origin = 'WMESTRE12.plano_centro_custos.ds_centro'
      Size = 255
    end
    object qyApropriacoesvl_movimento: TFloatField
      FieldName = 'vl_movimento'
      Origin = 'WMESTRE12.apropriacao_cp.vl_movimento'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object srcApropriacoes: TDataSource
    DataSet = qyApropriacoes
    Left = 8
    Top = 184
  end
  object pmQtd: TPopupMenu
    Left = 664
    Top = 264
  end
end

