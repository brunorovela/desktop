object frmFinanceiro: TfrmFinanceiro
  Left = 173
  Top = 137
  Caption = 'D'#233'bitos...'
  ClientHeight = 266
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 266
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
    object btnSituacao: TButton
      Left = 41
      Top = 233
      Width = 121
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 1
      Visible = False
      OnClick = btnSituacaoClick
    end
    object btnObservacoes: TButton
      Left = 168
      Top = 233
      Width = 102
      Height = 25
      Caption = '&Observa'#231#245'es'
      TabOrder = 2
      OnClick = btnObservacoesClick
    end
  end
end
