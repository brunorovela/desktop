object frmAMensagem: TfrmAMensagem
  Left = 141
  Top = 109
  Width = 546
  Height = 369
  Caption = 'Mensagem do Bloqueto...'
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 335
    Align = alClient
    TabOrder = 0
    object btnFechar: TSpeedButton
      Left = 447
      Top = 310
      Width = 81
      Height = 25
      Hint = 'Imprimir'
      Caption = 'F12 Fechar'
      OnClick = btnFecharClick
    end
    object RichEdit: TDBRichEdit
      Left = 8
      Top = 8
      Width = 521
      Height = 297
      DataField = 'Mensagem'
      DataSource = frmMensagens.dtcMensagens
      TabOrder = 0
    end
  end
end

