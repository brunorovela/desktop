object frmTrocarSenha: TfrmTrocarSenha
  Left = 382
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Trocar Senha'
  ClientHeight = 185
  ClientWidth = 301
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
