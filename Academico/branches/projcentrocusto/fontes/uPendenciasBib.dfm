object frmPendenciaFinanceiras: TfrmPendenciaFinanceiras
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Pendencias Biblioteca'
  ClientHeight = 281
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 281
    Align = alClient
    TabOrder = 0
    object btnFechar: TSpeedButton
      Left = 277
      Top = 233
      Width = 81
      Height = 25
      Hint = 'Imprimir'
      Caption = 'F12 Fechar'
      OnClick = btnFecharClick
    end
    object lst: TCheckListBox
      Left = 8
      Top = 8
      Width = 353
      Height = 216
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 0
    end
  end
  object qryPendenciasBib: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      
        '  cd_multa,dt_multa,db_valor,db_valor_pago,be.dt_emprestimo,bm.c' +
        'd_situacao'
      'FROM'
      '  bib_multas bm'
      
        '  INNER JOIN bib_emprestimos be ON (be.cd_emprestimo = bm.cd_emp' +
        'restimo)   '
      'WHERE'
      '  be.cd_pessoa = :cd_pessoa AND'
      '  bm.cd_situacao = 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
  end
end
