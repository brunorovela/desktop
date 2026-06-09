object frmObservacoesHist: TfrmObservacoesHist
  Left = 152
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Observações Histórico...'
  ClientHeight = 312
  ClientWidth = 493
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object btnFechar: TSpeedButton
    Left = 402
    Top = 284
    Width = 87
    Height = 25
    Hint = 'Imprimir'
    Caption = 'F12 Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = btnFecharClick
  end
  object mem: TDBMemo
    Left = 2
    Top = 2
    Width = 487
    Height = 279
    DataField = 'Observacoes'
    DataSource = DM.dtcObservacoesHist
    ScrollBars = ssVertical
    TabOrder = 0
  end
end

