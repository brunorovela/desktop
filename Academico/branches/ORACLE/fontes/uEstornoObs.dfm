object frmTesourariaEstorno: TfrmTesourariaEstorno
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informa'#231#245'es do estorno'
  ClientHeight = 316
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 8
    Top = 8
    Width = 477
    Height = 300
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 48
      Top = 81
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      FocusControl = dbeUsuario
    end
    object lblDataBaixa: TLabel
      Left = 17
      Top = 9
      Width = 67
      Height = 13
      Caption = 'Data da baixa'
      FocusControl = dbeDataBaixa
    end
    object lblDataEstorno: TLabel
      Left = 6
      Top = 33
      Width = 78
      Height = 13
      Caption = 'Data do estorno'
      FocusControl = dbeDataEstorno
    end
    object lblObservacoes: TLabel
      Left = 21
      Top = 105
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
      FocusControl = dbmObservacoes
    end
    object lblCaixa: TLabel
      Left = 57
      Top = 57
      Width = 27
      Height = 13
      Caption = 'Caixa'
      FocusControl = dbeCaixa
    end
    object dbeUsuario: TDBEdit
      Left = 87
      Top = 78
      Width = 384
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'nm_pessoa'
      DataSource = dsEstorno
      ReadOnly = True
      TabOrder = 3
    end
    object dbeDataBaixa: TDBEdit
      Left = 87
      Top = 6
      Width = 128
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'dt_baixa'
      DataSource = dsEstorno
      ReadOnly = True
      TabOrder = 0
    end
    object dbeDataEstorno: TDBEdit
      Left = 87
      Top = 30
      Width = 128
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'dt_estorno'
      DataSource = dsEstorno
      ReadOnly = True
      TabOrder = 1
    end
    object dbmObservacoes: TDBMemo
      Left = 87
      Top = 102
      Width = 384
      Height = 192
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'ds_estorno'
      DataSource = dsEstorno
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 4
    end
    object dbeCaixa: TDBEdit
      Left = 87
      Top = 54
      Width = 384
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'ds_caixa'
      DataSource = dsEstorno
      ReadOnly = True
      TabOrder = 2
    end
  end
  object qryEstorno: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '    p.nm_pessoa, fe.dt_baixa, fe.dt_estorno,CASE WHEN fe.ds_esto' +
        'rno <> '#39#39' THEN fe.ds_estorno ELSE '#39'Motivo de estorno n'#227'o registr' +
        'ado'#39'END ds_estorno, fcc.ds_caixa'
      'FROM'
      '    fin_estornos fe'
      '    LEFT JOIN pessoas p ON ( p.cd_pessoa = fe.cd_usuario )'
      
        '    LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = fe.cd_c' +
        'aixa )'
      'WHERE'
      '   fe.cd_movimento_te = :cd_movimento_te'
      'ORDER BY'
      '   fe.dt_estorno desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_movimento_te'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_movimento_te'
        ParamType = ptUnknown
      end>
    object qryEstornonm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object qryEstornodt_baixa: TDateTimeField
      FieldName = 'dt_baixa'
    end
    object qryEstornodt_estorno: TDateTimeField
      FieldName = 'dt_estorno'
    end
    object qryEstornods_estorno: TMemoField
      FieldName = 'ds_estorno'
      BlobType = ftMemo
    end
    object qryEstornods_caixa: TStringField
      FieldName = 'ds_caixa'
      Size = 255
    end
  end
  object dsEstorno: TDataSource
    DataSet = qryEstorno
    Left = 72
    Top = 160
  end
end
