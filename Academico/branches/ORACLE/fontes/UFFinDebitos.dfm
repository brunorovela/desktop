object frmFinDebitos: TfrmFinDebitos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Rela'#231#227'o de d'#233'bitos'
  ClientHeight = 355
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 8
  Padding.Top = 3
  Padding.Right = 8
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 8
    Top = 3
    Width = 746
    Height = 318
    Align = alTop
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    object dbgMensalidades: TZSortedGrid
      Left = 4
      Top = 4
      Width = 738
      Height = 310
      Align = alClient
      DataSource = dsMensalidades
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NM_ALUNO'
          Title.Caption = 'Aluno'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_RESPONSAVEL'
          Title.Caption = 'Respons'#225'vel'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELA'
          Title.Caption = 'Parcela'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTAL'
          Title.Caption = 'Valor Total'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCTO'
          Title.Caption = 'Vencimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TIPO_TITULO'
          Title.Caption = 'Tipo T'#237'tulo'
          Width = 128
          Visible = True
        end>
    end
  end
  object bbtnObservacoes: TBitBtn
    Left = 598
    Top = 327
    Width = 75
    Height = 25
    Caption = '&Observacoes'
    TabOrder = 1
    OnClick = bbtnObservacoesClick
  end
  object bbtnFechar: TBitBtn
    Left = 679
    Top = 327
    Width = 75
    Height = 25
    Caption = 'F12 Fechar'
    TabOrder = 2
    OnClick = bbtnFecharClick
  end
  object qryMensalidades: TUMZReadOnlyQuery
    Connection = DM.db
    SortedFields = 'NM_ALUNO;DT_VENCTO'
    SQL.Strings = (
      'SELECT'
      #9'M.VALORBRUTO'
      #9#9'+ COALESCE(M.VALORJUROS, 0)'
      #9#9'+ COALESCE(M.VALOREXTRA, 0)'
      #9#9'- COALESCE(M.DESCONTOEXTRA, 0)'
      #9#9'- GET_DESCONTOS(M.CD_MENSALIDADE, CURRENT_DATE)'
      #9#9'+ GET_ACRESCIMOS(M.CD_MENSALIDADE, CURRENT_DATE) VL_TOTAL,'
      #9'M.DATAVENCIMENTO DT_VENCTO,'
      #9'M.PARCELA NR_PARCELA,'
      
        '  (SELECT T.DS_TIPO_TITULO FROM FIN_CONFIG_TIPOS_TITULO T JOIN C' +
        'OLIGADAS C ON (T.CD_COLIGADA_MATRIZ = C.CD_COLIGADA_MATRIZ) WHER' +
        'E T.CD_TIPO_TITULO = M.CD_TIPO_TITULO AND C.CD_COLIGADA = M.CD_C' +
        'OLIGADA LIMIT 1) DS_TIPO_TITULO,'
      
        '  (SELECT A.NM_PESSOA FROM PESSOAS A WHERE A.CD_PESSOA = M.CODIG' +
        'OALUNO LIMIT 1) NM_ALUNO,'
      
        '  (SELECT R.NM_PESSOA FROM PESSOAS R WHERE R.CD_PESSOA = M.CD_RE' +
        'SP LIMIT 1) NM_RESPONSAVEL'
      'FROM'
      #9'MENSALIDADES M'
      'WHERE'
      #9'M.SITUACAO = 2'
      'LIMIT 1')
    Params = <>
    IndexFieldNames = 'NM_ALUNO Asc;DT_VENCTO Asc'
    Left = 472
    Top = 168
    object qryMensalidadesVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      ReadOnly = True
    end
    object qryMensalidadesDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
    end
    object qryMensalidadesNR_PARCELA: TSmallintField
      FieldName = 'NR_PARCELA'
    end
    object qryMensalidadesDS_TIPO_TITULO: TStringField
      FieldName = 'DS_TIPO_TITULO'
      ReadOnly = True
      Size = 255
    end
    object qryMensalidadesNM_ALUNO: TStringField
      FieldName = 'NM_ALUNO'
      ReadOnly = True
      Size = 60
    end
    object qryMensalidadesNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      ReadOnly = True
      Size = 60
    end
  end
  object dsMensalidades: TDataSource
    DataSet = qryMensalidades
    Left = 504
    Top = 168
  end
end
