object frmRetornoTitulos: TfrmRetornoTitulos
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'T'#237'tulos'
  ClientHeight = 154
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'T'#237'tulos relacionados ao Nosso N'#250'mero'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 585
    DesignSize = (
      583
      25)
    object sbSelecionarColuna: TSpeedButton
      Left = 560
      Top = 1
      Width = 25
      Height = 20
      Hint = 'Selecionar Colunas'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
        DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
        0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
        808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
        90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
        6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
        9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
        50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
        3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
        A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
        9F806000402000808080808020202000600000804000804020FF7F00BF000000
        00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
        2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
        702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
        0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
        A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
        9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
        8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
        707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
        DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
        DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
        AFAFAF303030000000000000000000000000000000000000000000303030AFAF
        AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSelecionarColunaClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 583
    Height = 129
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsTitulos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_mensalidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parcela'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datavencimento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_tipo_titulo'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_desc_calc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorpago'
        Visible = True
      end>
  end
  object dsTitulos: TDataSource
    AutoEdit = False
    DataSet = frmRetornoBanco.qryTitulos
    Left = 72
    Top = 168
  end
end
