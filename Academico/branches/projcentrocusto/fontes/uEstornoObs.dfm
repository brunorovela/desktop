object frmTesourariaEstorno: TfrmTesourariaEstorno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 254
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'ESTORNO'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 33
    Width = 441
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 7
      Top = 83
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object lblUsuario: TLabel
      Left = 7
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label3: TLabel
      Left = 7
      Top = 45
      Width = 74
      Height = 13
      Caption = 'Nome do caixa:'
    end
    object Label2: TLabel
      Left = 7
      Top = 26
      Width = 82
      Height = 13
      Caption = 'Data de estorno:'
    end
    object Label1: TLabel
      Left = 7
      Top = 6
      Width = 71
      Height = 13
      Caption = 'Data de baixa:'
    end
    object dtBaixa: TDBText
      Left = 95
      Top = 6
      Width = 306
      Height = 17
      DataField = 'dt_baixa'
      DataSource = dsEstorno
    end
    object dtEstorno: TDBText
      Left = 95
      Top = 26
      Width = 215
      Height = 17
      DataField = 'dt_estorno'
      DataSource = dsEstorno
    end
    object nmUsuario: TDBText
      Left = 95
      Top = 64
      Width = 215
      Height = 17
      DataField = 'nm_pessoa'
      DataSource = dsEstorno
    end
    object nmCaixa: TLabel
      Left = 95
      Top = 45
      Width = 41
      Height = 13
      Caption = 'nmCaixa'
    end
    object lblDescricao: TLabel
      Left = 95
      Top = 83
      Width = 338
      Height = 118
      Caption = 'lblDescricao'
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
    Left = 48
    Top = 184
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
    Left = 80
    Top = 184
  end
end
