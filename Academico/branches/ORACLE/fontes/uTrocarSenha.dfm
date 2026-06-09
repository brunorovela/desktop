object frmTrocarSenha: TfrmTrocarSenha
  Left = 382
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Trocar Senha'
  ClientHeight = 185
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 5
    Top = 144
    Width = 290
    Height = 5
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 72
    Top = 16
    Width = 60
    Height = 14
    Caption = 'Senha atual:'
  end
  object Label2: TLabel
    Left = 71
    Top = 64
    Width = 61
    Height = 14
    Caption = 'Nova senha:'
  end
  object Label3: TLabel
    Left = 30
    Top = 112
    Width = 102
    Height = 14
    Caption = 'Repita a nova senha:'
  end
  object edNovaSenha2: TEdit
    Left = 136
    Top = 109
    Width = 129
    Height = 22
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = edNovaSenha2KeyPress
  end
  object edNovaSenha1: TEdit
    Left = 136
    Top = 61
    Width = 129
    Height = 22
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edNovaSenha1KeyPress
  end
  object edSenhaAtual: TEdit
    Left = 136
    Top = 13
    Width = 129
    Height = 22
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = edSenhaAtualKeyPress
  end
  object bbtnConfirmar: TBitBtn
    Left = 211
    Top = 155
    Width = 83
    Height = 25
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 4
    OnClick = bbtnConfirmarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbtnCancelar: TBitBtn
    Left = 122
    Top = 155
    Width = 83
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = bbtnCancelarClick
    Kind = bkCancel
  end
  object qySenha: TUMZQuery
    Connection = DM.db
    Filtered = True
    SQL.Strings = (
      'SELECT'
      #9'ds_senha'
      'FROM'
      '             pessoas'
      'WHERE'
      #9'ds_login= :nome AND'
      #9'ds_senha = :senha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        ParamType = ptUnknown
      end>
    object qySenhads_senha: TStringField
      FieldName = 'ds_senha'
      Size = 32
    end
  end
end
