object fGerarMens: TfGerarMens
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsDialog
  BorderWidth = 2
  Caption = 'Gerar mensalidades'
  ClientHeight = 256
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblSelecionar: TLabel
    Left = 0
    Top = 0
    Width = 390
    Height = 16
    Align = alTop
    Caption = 'Selecione a data de vencimento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 187
  end
  object bvlSep1: TBevel
    Left = 0
    Top = 16
    Width = 390
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 671
  end
  object bvlSep2: TBevel
    Left = 0
    Top = 225
    Width = 390
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 230
    ExplicitWidth = 451
  end
  object bvlSep3: TBevel
    Left = 0
    Top = 253
    Width = 390
    Height = 3
    Align = alTop
    Shape = bsSpacer
    ExplicitLeft = -8
    ExplicitTop = 292
  end
  object bvlSep4: TBevel
    Left = 0
    Top = 202
    Width = 390
    Height = 6
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 451
  end
  object mcalDataVencto: TMonthCalendar
    Left = 0
    Top = 19
    Width = 390
    Height = 183
    Align = alTop
    Date = 40940.713066585650000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object tlbOpcoes: TToolBar
    Left = 0
    Top = 231
    Width = 390
    Height = 22
    AutoSize = True
    ButtonWidth = 89
    Caption = 'tlbOpcoes'
    Images = ilOpcoes
    List = True
    ShowCaptions = True
    TabOrder = 1
    object btnSep1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object btnConfirmar: TToolButton
      Left = 8
      Top = 0
      Caption = 'F5 Confirmar'
      ImageIndex = 0
      OnClick = btnConfirmarClick
    end
    object btnSep2: TToolButton
      Left = 97
      Top = 0
      Width = 8
      Caption = 'btnSep2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnCancelar: TToolButton
      Left = 105
      Top = 0
      Caption = 'F6 Cancelar'
      ImageIndex = 1
      OnClick = btnCancelarClick
    end
    object btnSep3: TToolButton
      Left = 194
      Top = 0
      Width = 8
      ImageIndex = 1
      Style = tbsSeparator
    end
  end
  object pnlProgresso: TPanel
    Left = 0
    Top = 208
    Width = 390
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object aniCarregnd: TAnimate
      Left = 0
      Top = 0
      Width = 390
      Height = 17
      Align = alClient
      StopFrame = 14
      Visible = False
    end
  end
  object qryMensalidades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   CD_MENSALIDADE,'
      '   CODIGOALUNO,'
      '   PARCELA,'
      '   DATAVENCIMENTO,'
      '   DT_COMPETENCIA,'
      '   TURMA,'
      '   DATAEMISSAO,'
      '   NOSSONUMERO,'
      '   VALORBRUTO,'
      '   CD_TIPO_TITULO,'
      '   VALORDESCONTO,'
      '   DESCONTOEXTRA,'
      '   VALOREXTRA,'
      '   VALORTOTAL,'
      '   VALORJUROS,'
      '   VALORPAGO,'
      '   DATAPAGAMENTO,'
      '   SITUACAO,'
      '   USUARIO,'
      '   CD_USUARIO,'
      '   BLOQUETO,'
      '   ANOSEMESTRE,'
      '   DATABASECORRECAO,'
      '   INDICECORRECAO,'
      '   CURSO,'
      '   DEPTO,'
      '   TIPOPARCELA,'
      '   SN_CREDITO_PARCELA,'
      '   CD_MENSALIDADE_ORIGEM,'
      '   CD_COLIGADA,'
      '   CD_CENTRO_CUSTO,'
      '   CD_PLANO_CONTA,'
      '   DS_HISTORICO,'
      '   CD_RESP'
      'FROM'
      '   MENSALIDADES'
      'WHERE'
      '   CD_MENSALIDADE = :CD_MENSALIDADE AND'
      '   SITUACAO = 2')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
    object qryMensalidadesCD_MENSALIDADE: TIntegerField
      FieldName = 'CD_MENSALIDADE'
    end
    object qryMensalidadesCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
    object qryMensalidadesPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object qryMensalidadesDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryMensalidadesDT_COMPETENCIA: TDateTimeField
      FieldName = 'DT_COMPETENCIA'
    end
    object qryMensalidadesTURMA: TStringField
      FieldName = 'TURMA'
      Size = 15
    end
    object qryMensalidadesDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryMensalidadesNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
    object qryMensalidadesVALORBRUTO: TFloatField
      FieldName = 'VALORBRUTO'
    end
    object qryMensalidadesCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryMensalidadesVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object qryMensalidadesDESCONTOEXTRA: TFloatField
      FieldName = 'DESCONTOEXTRA'
    end
    object qryMensalidadesVALOREXTRA: TFloatField
      FieldName = 'VALOREXTRA'
    end
    object qryMensalidadesVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object qryMensalidadesVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object qryMensalidadesVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
    end
    object qryMensalidadesDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryMensalidadesSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
    end
    object qryMensalidadesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object qryMensalidadesCD_USUARIO: TLargeintField
      FieldName = 'CD_USUARIO'
    end
    object qryMensalidadesBLOQUETO: TStringField
      FieldName = 'BLOQUETO'
      Size = 1
    end
    object qryMensalidadesANOSEMESTRE: TIntegerField
      FieldName = 'ANOSEMESTRE'
    end
    object qryMensalidadesDATABASECORRECAO: TDateTimeField
      FieldName = 'DATABASECORRECAO'
    end
    object qryMensalidadesINDICECORRECAO: TFloatField
      FieldName = 'INDICECORRECAO'
    end
    object qryMensalidadesCURSO: TStringField
      FieldName = 'CURSO'
      Size = 15
    end
    object qryMensalidadesDEPTO: TIntegerField
      FieldName = 'DEPTO'
    end
    object qryMensalidadesTIPOPARCELA: TIntegerField
      FieldName = 'TIPOPARCELA'
    end
    object qryMensalidadesSN_CREDITO_PARCELA: TStringField
      FieldName = 'SN_CREDITO_PARCELA'
      Size = 1
    end
    object qryMensalidadesCD_MENSALIDADE_ORIGEM: TIntegerField
      FieldName = 'CD_MENSALIDADE_ORIGEM'
    end
    object qryMensalidadesCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryMensalidadesCD_CENTRO_CUSTO: TLargeintField
      FieldName = 'CD_CENTRO_CUSTO'
      Required = True
    end
    object qryMensalidadesCD_PLANO_CONTA: TLargeintField
      FieldName = 'CD_PLANO_CONTA'
      Required = True
    end
    object qryMensalidadesDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Size = 150
    end
    object qryMensalidadesCD_RESP: TIntegerField
      FieldName = 'CD_RESP'
    end
  end
  object ilOpcoes: TImageList
    Left = 32
    Top = 56
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000848400000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C001F83F00000000
      8031E00F000000008031CFC700000000803187E3000000008001A3F300000000
      800131F900000000800138F9000000008FF13C79000000008FF13E3900000000
      8FF13F19000000008FF19F8B000000008FF18FC3000000008FF5C7E700000000
      8001E00F00000000FFFFF83F0000000000000000000000000000000000000000
      000000000000}
  end
  object qryMensExcluir: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   M.CD_MENSALIDADE, M.CODIGOALUNO, M.ANOSEMESTRE, M.TURMA,'
      '   M.PARCELA, M.DATAVENCIMENTO, M.CD_COLIGADA, M.NOSSONUMERO'
      'FROM'
      '  EXTRA_ATIVIDADES A'
      '  INNER JOIN EXTRA_MATRICULAS_ATIVIDADES MA ON ('
      
        '    A.CD_ATIVIDADE = MA.CD_ATIVIDADE AND A.NR_ANOSEMESTRE = MA.N' +
        'R_ANOSEMESTRE'
      '  )'
      '  INNER JOIN MENSALIDADES M ON ('
      '    M.CD_MENSALIDADE = MA.CD_MENSALIDADE AND'
      '    ('
      '      M.CD_TIPO_TITULO <> A.CD_TIPO_TITULO OR'
      '      M.CD_CENTRO_CUSTO <> A.CD_CENTRO OR'
      '      M.CD_COLIGADA <> A.CD_COLIGADA'
      '    )'
      '  )'
      'WHERE'
      '  MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '  MA.CD_PESSOA = :CD_PESSOA AND'
      '  MA.NR_MES = :NR_MES AND M.CD_MENSALIDADE NOT IN ('
      '    SELECT'
      '      M.CD_MENSALIDADE'
      '    FROM'
      '      EXTRA_ATIVIDADES A'
      '      INNER JOIN EXTRA_MATRICULAS_ATIVIDADES MA ON ('
      '        A.CD_ATIVIDADE = MA.CD_ATIVIDADE AND'
      '        A.NR_ANOSEMESTRE = MA.NR_ANOSEMESTRE'
      '      )'
      '    WHERE'
      '      M.CD_MENSALIDADE = MA.CD_MENSALIDADE AND'
      '      M.CD_TIPO_TITULO = A.CD_TIPO_TITULO AND'
      '      M.CD_CENTRO_CUSTO = A.CD_CENTRO AND'
      '      M.CD_COLIGADA = A.CD_COLIGADA AND'
      '      MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '      MA.CD_PESSOA = :CD_PESSOA AND'
      '      MA.NR_MES = :NR_MES'
      #9')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    object qryMensExcluirCD_MENSALIDADE: TIntegerField
      FieldName = 'CD_MENSALIDADE'
      Required = True
    end
    object qryMensExcluirCODIGOALUNO: TIntegerField
      FieldName = 'CODIGOALUNO'
    end
    object qryMensExcluirANOSEMESTRE: TIntegerField
      FieldName = 'ANOSEMESTRE'
    end
    object qryMensExcluirTURMA: TStringField
      FieldName = 'TURMA'
      Size = 15
    end
    object qryMensExcluirPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object qryMensExcluirDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryMensExcluirCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryMensExcluirNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Size = 30
    end
  end
  object qryMensIncluir: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   A.CD_TIPO_TITULO,'
      '   A.CD_CENTRO,'
      '   A.CD_COLIGADA,'
      '   TT.NR_PARCELA,'
      '   TT.CD_CONTA,'
      '   SUM(VP.VL_ATIVIDADE) VL_BRUTO,'
      '   TT.ds_tipo_titulo'
      'FROM'
      '   EXTRA_ATIVIDADES A'
      '      JOIN FIN_TIPOS_TITULO TT ON'
      '         (A.CD_TIPO_TITULO = TT.CD_TIPO_TITULO)'
      '      JOIN EXTRA_MATRICULAS_ATIVIDADES MA ON'
      '         (A.CD_ATIVIDADE = MA.CD_ATIVIDADE) AND            '
      '         (A.NR_ANOSEMESTRE = MA.NR_ANOSEMESTRE)'
      '         LEFT JOIN MENSALIDADES ME ON'
      '            (MA.CD_MENSALIDADE = ME.CD_MENSALIDADE) AND'
      '            ('
      '            (A.CD_TIPO_TITULO <> ME.CD_TIPO_TITULO) OR'
      '            (A.CD_CENTRO <> ME.CD_CENTRO_CUSTO) OR'
      '            (A.CD_COLIGADA <> ME.CD_COLIGADA)'
      '            )'
      '         JOIN EXTRA_MATRICULAS M ON'
      '            (MA.NR_ANOSEMESTRE = M.NR_ANOSEMESTRE) AND'
      '            (MA.CD_PESSOA = M.CD_PESSOA) AND'
      '            (MA.NR_MES = M.NR_MES)'
      '            JOIN EXTRA_VALORES_PESSOAS VP ON'
      '               (MA.CD_ATIVIDADE = VP.CD_ATIVIDADE) AND'
      '               (MA.NR_ANOSEMESTRE = VP.NR_ANOSEMESTRE) AND'
      '               (M.CD_TIPO_PESSOA = VP.CD_TIPO_PESSOA)'
      'WHERE'
      '   ('
      '      (ME.CD_MENSALIDADE IS NOT NULL AND ME.SITUACAO = 2) OR'
      '       MA.CD_MENSALIDADE IS NULL'
      '   )'
      '   AND'
      '   MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   MA.CD_PESSOA = :CD_PESSOA AND'
      '   MA.NR_MES = :NR_MES'
      'GROUP BY'
      '   A.CD_TIPO_TITULO,'
      '   A.CD_CENTRO,'
      '   A.CD_COLIGADA,'
      '   TT.NR_PARCELA,'
      '   TT.CD_CONTA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    object qryMensIncluirCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryMensIncluirCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object qryMensIncluirCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
    object qryMensIncluirNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object qryMensIncluirCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object qryMensIncluirVL_BRUTO: TFloatField
      FieldName = 'VL_BRUTO'
      ReadOnly = True
    end
    object qryMensIncluirds_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
  end
  object qryMensAlterar: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   A.CD_TIPO_TITULO,'
      '   A.CD_CENTRO,'
      '   A.CD_COLIGADA,'
      '   TT.NR_PARCELA,'
      '   TT.CD_CONTA,'
      '   MA.CD_MENSALIDADE,'
      '   SUM(VP.VL_ATIVIDADE) VL_BRUTO,'
      '   TT.ds_tipo_titulo'
      'FROM'
      '   EXTRA_ATIVIDADES A'
      '      JOIN EXTRA_MATRICULAS_ATIVIDADES MA ON'
      '         (A.CD_ATIVIDADE = MA.CD_ATIVIDADE) AND'
      '         (A.NR_ANOSEMESTRE = MA.NR_ANOSEMESTRE)'
      '         JOIN MENSALIDADES ME ON'
      '            (MA.CD_MENSALIDADE = ME.CD_MENSALIDADE) AND'
      '            (A.CD_TIPO_TITULO = ME.CD_TIPO_TITULO) AND'
      '            (A.CD_CENTRO = ME.CD_CENTRO_CUSTO) AND'
      '            (A.CD_COLIGADA = ME.CD_COLIGADA)'
      '         JOIN EXTRA_MATRICULAS M ON'
      '            (MA.NR_ANOSEMESTRE = M.NR_ANOSEMESTRE) AND'
      '            (MA.CD_PESSOA = M.CD_PESSOA) AND'
      '            (MA.NR_MES = M.NR_MES)'
      '            JOIN EXTRA_VALORES_PESSOAS VP ON'
      '               (MA.CD_ATIVIDADE = VP.CD_ATIVIDADE) AND'
      '               (MA.NR_ANOSEMESTRE = VP.NR_ANOSEMESTRE) AND'
      '               (M.CD_TIPO_PESSOA = VP.CD_TIPO_PESSOA)'
      '      JOIN FIN_TIPOS_TITULO TT ON'
      '         (A.CD_TIPO_TITULO = TT.CD_TIPO_TITULO)'
      'WHERE'
      '   MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   MA.CD_PESSOA = :CD_PESSOA AND'
      '   MA.NR_MES = :NR_MES AND'
      '   ME.SITUACAO = 2'
      'GROUP BY'
      '   A.CD_TIPO_TITULO,'
      '   A.CD_CENTRO,'
      '   A.CD_COLIGADA,'
      '   TT.NR_PARCELA,'
      '   TT.CD_CONTA,'
      '   MA.CD_MENSALIDADE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    object qryMensAlterarCD_TIPO_TITULO: TIntegerField
      FieldName = 'CD_TIPO_TITULO'
    end
    object qryMensAlterarCD_CENTRO: TLargeintField
      FieldName = 'CD_CENTRO'
    end
    object qryMensAlterarCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
    end
    object qryMensAlterarNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object qryMensAlterarCD_CONTA: TLargeintField
      FieldName = 'CD_CONTA'
    end
    object qryMensAlterarCD_MENSALIDADE: TIntegerField
      FieldName = 'CD_MENSALIDADE'
    end
    object qryMensAlterarVL_BRUTO: TFloatField
      FieldName = 'VL_BRUTO'
      ReadOnly = True
    end
    object qryMensAlterards_tipo_titulo: TStringField
      FieldName = 'ds_tipo_titulo'
      Size = 255
    end
  end
  object qryPlanosDescontos: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '   QT_ATIVIDADES,'
      '   VL_PERCENTUAL,'
      '   VL_DESCONTO,'
      '   VL_DESCONTO_FIXO'
      'FROM'
      '   EXTRA_PLANO_DESCONTOS'
      'WHERE'
      '   NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   CD_TIPO_PESSOA = :CD_TIPO_PESSOA AND'
      '   QT_ATIVIDADES <='
      '   ('
      '      SELECT'
      '         COUNT(CD_ATIVIDADE)'
      '      FROM'
      '         EXTRA_MATRICULAS_ATIVIDADES'
      '      WHERE'
      '         NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '         CD_PESSOA = :CD_PESSOA AND'
      '         NR_MES = :NR_MES'
      '      GROUP BY'
      '         CD_PESSOA,'
      '         NR_ANOSEMESTRE,'
      '         NR_MES'
      '   )')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_TIPO_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    object qryPlanosDescontosQT_ATIVIDADES: TIntegerField
      FieldName = 'QT_ATIVIDADES'
    end
    object qryPlanosDescontosVL_PERCENTUAL: TFloatField
      FieldName = 'VL_PERCENTUAL'
    end
    object qryPlanosDescontosVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryPlanosDescontosVL_DESCONTO_FIXO: TFloatField
      FieldName = 'VL_DESCONTO_FIXO'
    end
  end
  object qryRespFinan: TUMZReadOnlyQuery
    Connection = DM.db
    OnCalcFields = qryRespFinanCalcFields
    SQL.Strings = (
      'SELECT'
      '   CD_RESP_FINAN,'
      '   CD_PESSOA'
      'FROM'
      '   PESSOAS'
      'WHERE'
      '   CD_PESSOA = :CD_PESSOA')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryRespFinanCD_RESP_FINAN: TIntegerField
      FieldName = 'CD_RESP_FINAN'
    end
    object qryRespFinanCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Required = True
    end
    object qryRespFinanCD_RESP: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CD_RESP'
      Calculated = True
    end
  end
  object qryVinculaMens: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE EXTRA_MATRICULAS_ATIVIDADES MA'
      'SET'
      '   MA.CD_MENSALIDADE = :CD_MENSALIDADE'
      'WHERE'
      '   EXISTS'
      '   ('
      '   SELECT'
      '      A.CD_ATIVIDADE'
      '   FROM'
      '      EXTRA_ATIVIDADES A,'
      '      MENSALIDADES M'
      '   WHERE'
      '      MA.CD_ATIVIDADE = A.CD_ATIVIDADE AND'
      '      MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'
      '      MA.CD_MENSALIDADE = M.CD_MENSALIDADE AND'
      '      ((A.CD_TIPO_TITULO <> M.CD_TIPO_TITULO) OR'
      '       (A.CD_CENTRO <> M.CD_CENTRO_CUSTO) OR'
      '       (A.CD_COLIGADA <> M.CD_COLIGADA))'
      '   )'
      '   OR'
      '   NOT EXISTS'
      '   ('
      '   SELECT'
      '      A.CD_ATIVIDADE'
      '   FROM'
      '      EXTRA_ATIVIDADES A,'
      '      MENSALIDADES M'
      '   WHERE'
      '      MA.CD_ATIVIDADE = A.CD_ATIVIDADE AND'
      '      MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'
      '      MA.CD_MENSALIDADE = M.CD_MENSALIDADE AND'
      '      A.CD_TIPO_TITULO = M.CD_TIPO_TITULO AND'
      '      A.CD_CENTRO = M.CD_CENTRO_CUSTO AND'
      '      A.CD_COLIGADA = M.CD_COLIGADA'
      '   )'
      '   AND'
      '   MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   MA.CD_PESSOA = :CD_PESSOA AND'
      '   MA.NR_MES = :NR_MES')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
  end
  object qryCriaMovCR: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO FIN_MOV_CR'
      
        '   (CD_MENSALIDADE, CD_COLIGADA, NR_SEQUENCIA, CD_ACAO, DT_MOVIM' +
        'ENTO, VL_ENTRADA, DS_OBSERVACAO, CD_USUARIO)'
      'SELECT'
      '   CD_MENSALIDADE,'
      '   CD_COLIGADA,'
      '   1,'
      '   :CD_ACAO,'
      '   NOW(),'
      '   :VL_ENTRADA,'
      '   '#39#39','
      '   :CD_USUARIO'
      'FROM'
      '   MENSALIDADES'
      'WHERE'
      '   CD_MENSALIDADE = :CD_MENSALIDADE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_ACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_ENTRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MENSALIDADE'
        ParamType = ptUnknown
      end>
  end
  object qryGeraLog: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO LOGS'
      '   (CD_TIPO, DT_LOG, DS_LOG, CD_USUARIO, CD_CHAVE)'
      'VALUES'
      '   (2, NOW(), :DS_LOG, :CD_USUARIO, :CD_CHAVE)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_LOG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CHAVE'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DS_LOG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CHAVE'
        ParamType = ptUnknown
      end>
  end
  object qryGeraLogGeral: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO LOG_GERAL'
      
        '   (CD_USUARIO, DT_LOG, CD_MODULO, CD_OPERACAO, CD_CHAVE, CD_COL' +
        'IGADA, DS_OBSERVACOES)'
      'VALUES'
      
        '   (:CD_USUARIO, NOW(), 2013, (SELECT CD_OPERACAO FROM LOG_OPERA' +
        'COES WHERE CD_CHAVE = '#39'Exclusao'#39'), :CD_CHAVE, :CD_COLIGADA, :DS_' +
        'OBSERVACOES)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_OBSERVACOES'
        ParamType = ptUnknown
      end>
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CHAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_OBSERVACOES'
        ParamType = ptUnknown
      end>
  end
  object qryMovCRExcluir: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  CR.CD_MENSALIDADE,'
      '  CR.CD_COLIGADA,'
      '  CR.NR_SEQUENCIA'
      'FROM'
      '  EXTRA_ATIVIDADES A'
      '  INNER JOIN EXTRA_MATRICULAS_ATIVIDADES MA ON ('
      
        '    A.CD_ATIVIDADE = MA.CD_ATIVIDADE AND A.NR_ANOSEMESTRE = MA.N' +
        'R_ANOSEMESTRE'
      '  )'
      '  INNER JOIN MENSALIDADES M ON ('
      '    MA.CD_MENSALIDADE = M.CD_MENSALIDADE AND'
      '    ('
      '      A.CD_TIPO_TITULO <> M.CD_TIPO_TITULO OR'
      '      A.CD_CENTRO <> M.CD_CENTRO_CUSTO OR'
      '      A.CD_COLIGADA <> M.CD_COLIGADA'
      '    )'
      #9')'
      
        '  INNER JOIN FIN_MOV_CR CR ON ( CR.CD_MENSALIDADE = M.CD_MENSALI' +
        'DADE )'
      'WHERE'
      '  MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '  MA.CD_PESSOA = :CD_PESSOA AND'
      '  MA.NR_MES = :NR_MES')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    object qryMovCRExcluirCD_MENSALIDADE: TIntegerField
      FieldName = 'CD_MENSALIDADE'
      Required = True
    end
    object qryMovCRExcluirCD_COLIGADA: TIntegerField
      FieldName = 'CD_COLIGADA'
      Required = True
    end
    object qryMovCRExcluirNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Required = True
    end
  end
  object qryVinculaInscricao: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'UPDATE EXTRA_MATRICULAS_ATIVIDADES MA'
      'SET'
      '   MA.CD_MENSALIDADE ='
      '      ('
      '         SELECT'
      '            MA2.CD_MENSALIDADE'
      '         FROM'
      '            EXTRA_ATIVIDADES A'
      '            JOIN EXTRA_ATIVIDADES A2 ON'
      '               (A.NR_ANOSEMESTRE = A2.NR_ANOSEMESTRE) AND'
      '               (A.CD_TIPO_TITULO = A2.CD_TIPO_TITULO) AND'
      '               (A.CD_CENTRO = A2.CD_CENTRO) AND'
      '               (A.CD_COLIGADA = A2.CD_COLIGADA) AND'
      '               (A.CD_ATIVIDADE <> A2.CD_ATIVIDADE)'
      '               JOIN EXTRA_MATRICULAS_ATIVIDADES MA2 ON'
      '                  (MA2.CD_ATIVIDADE = A2.CD_ATIVIDADE) AND'
      '                  (MA2.NR_ANOSEMESTRE = A2.NR_ANOSEMESTRE)'
      '                  JOIN MENSALIDADES ME ON'
      
        '                     (MA2.CD_MENSALIDADE = ME.CD_MENSALIDADE) AN' +
        'D'
      '                     (A2.CD_TIPO_TITULO = ME.CD_TIPO_TITULO) AND'
      '                     (A2.CD_CENTRO = ME.CD_CENTRO_CUSTO) AND'
      '                     (A2.CD_COLIGADA = ME.CD_COLIGADA)'
      '         WHERE'
      '            MA.CD_ATIVIDADE = A.CD_ATIVIDADE AND'
      '            MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'
      '            MA.NR_ANOSEMESTRE = MA2.NR_ANOSEMESTRE AND'
      '            MA.CD_PESSOA = MA2.CD_PESSOA AND'
      '            MA.NR_MES = MA2.NR_MES AND'
      '            MA.CD_ATIVIDADE <> MA2.CD_ATIVIDADE AND'
      '            ME.SITUACAO = 2'
      '         GROUP BY'
      '            MA2.CD_MENSALIDADE'
      '      )'
      'WHERE'
      '   EXISTS'
      '   ('
      '      SELECT'
      '         A.CD_ATIVIDADE'
      '      FROM'
      '         EXTRA_ATIVIDADES A'
      '            JOIN EXTRA_ATIVIDADES A2 ON'
      '               (A.NR_ANOSEMESTRE = A2.NR_ANOSEMESTRE) AND'
      '               (A.CD_TIPO_TITULO = A2.CD_TIPO_TITULO) AND'
      '               (A.CD_CENTRO = A2.CD_CENTRO) AND'
      '               (A.CD_COLIGADA = A2.CD_COLIGADA) AND'
      '               (A.CD_ATIVIDADE <> A2.CD_ATIVIDADE)'
      '               JOIN EXTRA_MATRICULAS_ATIVIDADES MA2 ON'
      '                  (MA2.CD_ATIVIDADE = A2.CD_ATIVIDADE) AND'
      '                  (MA2.NR_ANOSEMESTRE = A2.NR_ANOSEMESTRE)'
      '                  JOIN MENSALIDADES ME ON'
      
        '                     (MA2.CD_MENSALIDADE = ME.CD_MENSALIDADE) AN' +
        'D'
      '                     (A2.CD_TIPO_TITULO = ME.CD_TIPO_TITULO) AND'
      '                     (A2.CD_CENTRO = ME.CD_CENTRO_CUSTO) AND'
      '                     (A2.CD_COLIGADA = ME.CD_COLIGADA)'
      '      WHERE'
      '         MA.CD_ATIVIDADE = A.CD_ATIVIDADE AND'
      '         MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'
      '         MA.NR_ANOSEMESTRE = MA2.NR_ANOSEMESTRE AND'
      '         MA.CD_PESSOA = MA2.CD_PESSOA AND'
      '         MA.NR_MES = MA2.NR_MES AND'
      '         MA.CD_ATIVIDADE <> MA2.CD_ATIVIDADE AND'
      '         ME.SITUACAO = 2'
      '   )'
      '   AND'
      '   NOT EXISTS'
      '   ('
      '      SELECT'
      '         A.CD_ATIVIDADE'
      '      FROM'
      '         EXTRA_ATIVIDADES A'
      '            JOIN MENSALIDADES ME ON'
      '               (A.CD_TIPO_TITULO = ME.CD_TIPO_TITULO) AND'
      '               (A.CD_CENTRO = ME.CD_CENTRO_CUSTO) AND'
      '               (A.CD_COLIGADA = ME.CD_COLIGADA)'
      '      WHERE'
      '         MA.CD_ATIVIDADE = A.CD_ATIVIDADE AND'
      '         MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'
      '         MA.CD_MENSALIDADE = ME.CD_MENSALIDADE AND'
      '         ME.SITUACAO <> 2'
      '   )'
      '   AND'
      '   MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'
      '   MA.CD_PESSOA = :CD_PESSOA AND'
      '   MA.NR_MES = :NR_MES')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
    SQLList.Strings = (
      
        'oracle=UPDATE EXTRA_MATRICULAS_ATIVIDADES MA'#13#10'SET'#13#10'   MA.CD_MENS' +
        'ALIDADE ='#13#10'      ('#13#10'         SELECT'#13#10'            MA2.CD_MENSALID' +
        'ADE'#13#10'         FROM'#13#10'            EXTRA_ATIVIDADES A'#13#10'            ' +
        'JOIN EXTRA_ATIVIDADES A2 ON'#13#10'               (A.NR_ANOSEMESTRE = ' +
        'A2.NR_ANOSEMESTRE) AND'#13#10'               (A.CD_TIPO_TITULO = A2.CD' +
        '_TIPO_TITULO) AND'#13#10'               (A.CD_CENTRO = A2.CD_CENTRO) A' +
        'ND'#13#10'               (A.CD_COLIGADA = A2.CD_COLIGADA) AND'#13#10'       ' +
        '        (A.CD_ATIVIDADE <> A2.CD_ATIVIDADE)'#13#10'               JOIN' +
        ' EXTRA_MATRICULAS_ATIVIDADES MA2 ON'#13#10'                  (MA2.CD_A' +
        'TIVIDADE = A2.CD_ATIVIDADE) AND'#13#10'                  (MA2.NR_ANOSE' +
        'MESTRE = A2.NR_ANOSEMESTRE)'#13#10'                  JOIN MENSALIDADES' +
        ' ME ON'#13#10'                     (MA2.CD_MENSALIDADE = ME.CD_MENSALI' +
        'DADE) AND'#13#10'                     (A2.CD_TIPO_TITULO = ME.CD_TIPO_' +
        'TITULO) AND'#13#10'                     (A2.CD_CENTRO = ME.CD_CENTRO_C' +
        'USTO) AND'#13#10'                     (A2.CD_COLIGADA = ME.CD_COLIGADA' +
        ')'#13#10'         WHERE'#13#10'            MA.CD_ATIVIDADE = A.CD_ATIVIDADE ' +
        'AND'#13#10'            MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'#13#10'     ' +
        '       MA.NR_ANOSEMESTRE = MA2.NR_ANOSEMESTRE AND'#13#10'            M' +
        'A.CD_PESSOA = MA2.CD_PESSOA AND'#13#10'            MA.NR_MES = MA2.NR_' +
        'MES AND'#13#10'            MA.CD_ATIVIDADE <> MA2.CD_ATIVIDADE AND'#13#10'  ' +
        '          ME.SITUACAO = 2'#13#10'         GROUP BY'#13#10'            MA2.CD' +
        '_MENSALIDADE'#13#10'      )'#13#10'WHERE'#13#10'   EXISTS'#13#10'   ('#13#10'      SELECT'#13#10'   ' +
        '      A.CD_ATIVIDADE'#13#10'      FROM'#13#10'         EXTRA_ATIVIDADES A'#13#10' ' +
        '           JOIN EXTRA_ATIVIDADES A2 ON'#13#10'               (A.NR_ANO' +
        'SEMESTRE = A2.NR_ANOSEMESTRE) AND'#13#10'               (A.CD_TIPO_TIT' +
        'ULO = A2.CD_TIPO_TITULO) AND'#13#10'               (A.CD_CENTRO = A2.C' +
        'D_CENTRO) AND'#13#10'               (A.CD_COLIGADA = A2.CD_COLIGADA) A' +
        'ND'#13#10'               (A.CD_ATIVIDADE <> A2.CD_ATIVIDADE)'#13#10'        ' +
        '       JOIN EXTRA_MATRICULAS_ATIVIDADES MA2 ON'#13#10'                ' +
        '  (MA2.CD_ATIVIDADE = A2.CD_ATIVIDADE) AND'#13#10'                  (M' +
        'A2.NR_ANOSEMESTRE = A2.NR_ANOSEMESTRE)'#13#10'                  JOIN M' +
        'ENSALIDADES ME ON'#13#10'                     (MA2.CD_MENSALIDADE = ME' +
        '.CD_MENSALIDADE) AND'#13#10'                     (A2.CD_TIPO_TITULO = ' +
        'ME.CD_TIPO_TITULO) AND'#13#10'                     (A2.CD_CENTRO = ME.' +
        'CD_CENTRO_CUSTO) AND'#13#10'                     (A2.CD_COLIGADA = ME.' +
        'CD_COLIGADA)'#13#10'      WHERE'#13#10'         MA.CD_ATIVIDADE = A.CD_ATIVI' +
        'DADE AND'#13#10'         MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'#13#10'   ' +
        '      MA.NR_ANOSEMESTRE = MA2.NR_ANOSEMESTRE AND'#13#10'         MA.CD' +
        '_PESSOA = MA2.CD_PESSOA AND'#13#10'         MA.NR_MES = MA2.NR_MES AND' +
        #13#10'         MA.CD_ATIVIDADE <> MA2.CD_ATIVIDADE AND'#13#10'         ME.' +
        'SITUACAO = 2'#13#10'   )'#13#10'   AND'#13#10'   NOT EXISTS'#13#10'   ('#13#10'      SELECT'#13#10' ' +
        '        A.CD_ATIVIDADE'#13#10'      FROM'#13#10'         EXTRA_ATIVIDADES A'#13 +
        #10'            JOIN MENSALIDADES ME ON'#13#10'               (A.CD_TIPO_' +
        'TITULO = ME.CD_TIPO_TITULO) AND'#13#10'               (A.CD_CENTRO = M' +
        'E.CD_CENTRO_CUSTO) AND'#13#10'               (A.CD_COLIGADA = ME.CD_CO' +
        'LIGADA)'#13#10'      WHERE'#13#10'         MA.CD_ATIVIDADE = A.CD_ATIVIDADE ' +
        'AND'#13#10'         MA.NR_ANOSEMESTRE = A.NR_ANOSEMESTRE AND'#13#10'        ' +
        ' MA.CD_MENSALIDADE = ME.CD_MENSALIDADE AND'#13#10'         ME.SITUACAO' +
        ' <> 2'#13#10'   )'#13#10'   AND'#13#10'   MA.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND'#13 +
        #10'   MA.CD_PESSOA = :CD_PESSOA AND'#13#10'   MA.NR_MES = :NR_MES'
      
        'mysql-5=UPDATE'#13#10'   EXTRA_MATRICULAS_ATIVIDADES M1'#13#10'      JOIN EX' +
        'TRA_ATIVIDADES A1 ON'#13#10'         (M1.CD_ATIVIDADE = A1.CD_ATIVIDAD' +
        'E) AND'#13#10'         (M1.NR_ANOSEMESTRE = A1.NR_ANOSEMESTRE)'#13#10'      ' +
        'JOIN EXTRA_MATRICULAS_ATIVIDADES M2 ON'#13#10'         (M1.NR_ANOSEMES' +
        'TRE = M2.NR_ANOSEMESTRE) AND'#13#10'         (M1.CD_PESSOA = M2.CD_PES' +
        'SOA) AND'#13#10'         (M1.NR_MES = M2.NR_MES) AND'#13#10'         (M1.CD_' +
        'ATIVIDADE <> M2.CD_ATIVIDADE) AND'#13#10'         (COALESCE(M1.CD_MENS' +
        'ALIDADE, 0) <> COALESCE(M2.CD_MENSALIDADE, 0))'#13#10'         JOIN EX' +
        'TRA_ATIVIDADES A2 ON'#13#10'            (M2.CD_ATIVIDADE = A2.CD_ATIVI' +
        'DADE) AND'#13#10'            (M2.NR_ANOSEMESTRE = A2.NR_ANOSEMESTRE) A' +
        'ND'#13#10'            (A1.CD_TIPO_TITULO = A2.CD_TIPO_TITULO) AND'#13#10'   ' +
        '         (A1.CD_CENTRO = A2.CD_CENTRO) AND'#13#10'            (A1.CD_C' +
        'OLIGADA = A2.CD_COLIGADA)'#13#10'            JOIN MENSALIDADES E2 ON'#13#10 +
        '               (M2.CD_MENSALIDADE = E2.CD_MENSALIDADE) AND'#13#10'    ' +
        '           (A2.CD_TIPO_TITULO = E2.CD_TIPO_TITULO) AND'#13#10'        ' +
        '       (A2.CD_CENTRO = E2.CD_CENTRO_CUSTO) AND'#13#10'               (' +
        'A2.CD_COLIGADA = E2.CD_COLIGADA)'#13#10'         LEFT JOIN MENSALIDADE' +
        'S E1 ON'#13#10'            (M1.CD_MENSALIDADE = E1.CD_MENSALIDADE) AND' +
        #13#10'            (E1.SITUACAO = 2) AND'#13#10'            ('#13#10'            ' +
        '(E1.CD_TIPO_TITULO <> A1.CD_TIPO_TITULO) OR'#13#10'            (E1.CD_' +
        'CENTRO_CUSTO <> A1.CD_CENTRO) OR'#13#10'            (E1.CD_COLIGADA <>' +
        ' A1.CD_COLIGADA)'#13#10'            )'#13#10'SET'#13#10'   M1.CD_MENSALIDADE = M2.' +
        'CD_MENSALIDADE'#13#10'WHERE'#13#10'   M1.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AN' +
        'D'#13#10'   M1.CD_PESSOA = :CD_PESSOA AND'#13#10'   M1.NR_MES = :NR_MES AND'#13 +
        #10'   E2.SITUACAO = 2')
    Left = 128
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_ANOSEMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_MES'
        ParamType = ptUnknown
      end>
  end
end
