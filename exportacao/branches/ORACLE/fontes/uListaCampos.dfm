object fListaCampos: TfListaCampos
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Lista de Campos'
  ClientHeight = 390
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 22
    Width = 7
    Height = 360
    Align = alLeft
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 302
    Top = 22
    Width = 8
    Height = 360
    Align = alRight
    Shape = bsSpacer
  end
  object Bevel4: TBevel
    Left = 0
    Top = 382
    Width = 310
    Height = 8
    Align = alBottom
    Shape = bsSpacer
  end
  object twListaCampos: TTreeView
    Left = 7
    Top = 22
    Width = 295
    Height = 360
    Align = alClient
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnDblClick = twListaCamposDblClick
  end
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 22
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Selecione o Campo'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object qyListaCampos: TUMZQuery
    Connection = DM.ZConn
    SQL.Strings = (
      'SELECT'
      
        #9'CONCAT(ect.nm_tabela, "." ,ec.nm_campo) as nome, ect.nm_tabela,' +
        ' ec.nm_campo, et.ds_descricao, ec.ds_campo'
      'FROM'
      #9'expo_consulta_tabelas ect'
      
        #9'INNER JOIN expo_campos ec ON (ec.nm_tabela = ect.nm_tabela_real' +
        ')'
      
        #9'INNER JOIN expo_tabelas et ON (et.nm_tabela = ect.nm_tabela_rea' +
        'l)'
      'WHERE'
      #9'ect.nm_consulta = :nm_consulta'
      ' '#9'AND  ec.sn_ativo = 1 AND et.sn_ativo = 1'
      '  AND ec.sn_apagado = 0 AND et.sn_apagada = 0'
      'ORDER BY'
      #9'ect.nm_tabela, ec.ds_campo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nm_consulta'
        ParamType = ptUnknown
      end>
    Left = 152
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nm_consulta'
        ParamType = ptUnknown
      end>
  end
end
