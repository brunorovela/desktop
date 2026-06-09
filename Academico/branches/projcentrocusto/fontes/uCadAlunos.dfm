object formCadAluno: TformCadAluno
  Left = 265
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Cadastro de Aluno'
  ClientHeight = 241
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 16
    Top = 85
    Width = 73
    Height = 13
    Caption = 'Nome do Aluno'
    FocusControl = DBEdit1
  end
  object Label5: TLabel
    Left = 16
    Top = 37
    Width = 52
    Height = 13
    Caption = 'Cod. Aluno'
    FocusControl = DBEdit2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 2
    object Label1: TLabel
      Left = 120
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Turma:'
    end
    object DBText1: TDBText
      Left = 160
      Top = 8
      Width = 65
      Height = 17
      DataField = 'TURMA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 224
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Disciplina:'
    end
    object DBText2: TDBText
      Left = 280
      Top = 8
      Width = 81
      Height = 17
      DataField = 'DISCIPLINA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Novo Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 101
    Width = 345
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DMDiario.dsAlunos
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 53
    Width = 64
    Height = 21
    DataField = 'CODALUNO'
    DataSource = DMDiario.dsAlunos
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 208
    Width = 113
    Height = 25
    Caption = '&Confirmar Aluno'
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = BitBtn2Click
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
  object DBRadioGroup1: TDBRadioGroup
    Left = 16
    Top = 136
    Width = 345
    Height = 57
    Caption = 'Situa'#231#227'o'
    Columns = 3
    DataField = 'SITUACAO'
    DataSource = DMDiario.dsAlunos
    Items.Strings = (
      'Aprovado'
      'Cursando'
      'M.Trancada'
      'M.Cancelada'
      'Reserva')
    TabOrder = 5
    Values.Strings = (
      '0'
      '1'
      '3'
      '4'
      '10')
  end
end

