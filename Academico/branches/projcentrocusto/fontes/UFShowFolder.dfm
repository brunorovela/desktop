object fShowFolder: TfShowFolder
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Folder'
  ClientHeight = 566
  ClientWidth = 409
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
  object imFolder: TImage
    Left = 0
    Top = 0
    Width = 409
    Height = 566
    Align = alClient
    AutoSize = True
    Center = True
    PopupMenu = pmOpcoes
    ExplicitLeft = 8
    ExplicitTop = -8
  end
  object opdFolder: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Title = 'Selecione a imagem do folder'
    Left = 200
    Top = 392
  end
  object pmOpcoes: TPopupMenu
    OnPopup = pmOpcoesPopup
    Left = 272
    Top = 328
    object miSelecionar: TMenuItem
      Caption = 'Selecionar imagem'
      OnClick = miSelecionarClick
    end
    object miApagar: TMenuItem
      Caption = 'Apagar imagem'
      OnClick = miApagarClick
    end
  end
end
