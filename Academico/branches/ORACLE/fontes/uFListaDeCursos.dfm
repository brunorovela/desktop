object formListagemDeCursos: TformListagemDeCursos
  Left = 0
  Top = 0
  Caption = 'Selecione os Cursos'
  ClientHeight = 308
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 247
    Height = 308
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 209
      Height = 13
      Caption = 'Selecione nesta tela, quais os cursos que o '
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 55
      Height = 13
      Caption = 'professor '#233
    end
    object lbPersonalizavel: TLabel
      Left = 77
      Top = 35
      Width = 65
      Height = 13
      Caption = 'coordenador:'
    end
    object btnCancelar: TBitBtn
      Left = 135
      Top = 267
      Width = 103
      Height = 29
      Hint = 'Cancelar Negocia'#231#227'o'
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnConfirmar: TBitBtn
      Left = 3
      Top = 267
      Width = 126
      Height = 29
      Hint = 'Confirmar Negocia'#231#227'o'
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btnConfirmarClick
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
    object lstAtuais: TCheckListBox
      Left = 2
      Top = 83
      Width = 238
      Height = 184
      Margins.Left = 25
      Margins.Top = 22
      Margins.Right = 10
      Align = alCustom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 2
    end
    object cbMarcar: TCheckBox
      Left = 11
      Top = 58
      Width = 153
      Height = 17
      Caption = 'Marcar\Desmarcar Todos'
      TabOrder = 3
      OnClick = cbMarcarClick
    end
  end
  object dsCursosNde: TDataSource
    Left = 208
    Top = 96
  end
  object qryCursosNde: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_admissao,'
      '  cd_curso,'
      '  sn_membro_nde,'
      '  sn_coordenacao_nde'
      'FROM'
      '  funcionarios_cursos_nde'
      'WHERE'
      '  cd_admissao = :admissao'
      'AND'
      ' cd_curso = :curso')
    Params = <
      item
        DataType = ftUnknown
        Name = 'admissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'admissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end>
    object qryCursosNdecd_admissao: TIntegerField
      FieldName = 'cd_admissao'
    end
    object qryCursosNdecd_curso: TStringField
      FieldName = 'cd_curso'
      Size = 0
    end
    object qryCursosNdesn_membro_nde: TSmallintField
      FieldName = 'sn_membro_nde'
    end
    object qryCursosNdesn_coordenacao_nde: TSmallintField
      FieldName = 'sn_coordenacao_nde'
    end
  end
end
