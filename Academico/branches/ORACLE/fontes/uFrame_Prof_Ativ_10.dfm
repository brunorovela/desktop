object frm_Professores_Ativ_10: Tfrm_Professores_Ativ_10
  Left = 0
  Top = 0
  Width = 753
  Height = 125
  TabOrder = 0
  TabStop = True
  OnEnter = FrameEnter
  object Label8: TLabel
    Left = 8
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = dbLocal
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 35
    Height = 13
    Caption = 'Autoria'
    FocusControl = dbAutoria
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Atividade'
    FocusControl = dbAtividade
  end
  object Label3: TLabel
    Left = 236
    Top = 8
    Width = 86
    Height = 13
    Caption = 'T'#237'tulo do Trabalho'
    FocusControl = dbTitulo
  end
  object Label5: TLabel
    Left = 236
    Top = 48
    Width = 59
    Height = 13
    Caption = 'T'#237'tulo: Anais'
    FocusControl = dbAnais
  end
  object Label4: TLabel
    Left = 659
    Top = 88
    Width = 37
    Height = 13
    Caption = 'P'#225'ginas'
    FocusControl = dbFolhas
  end
  object Label6: TLabel
    Left = 569
    Top = 88
    Width = 72
    Height = 13
    Caption = 'Ano Publica'#231#227'o'
    FocusControl = dbAno
  end
  object Label9: TLabel
    Left = 464
    Top = 48
    Width = 79
    Height = 13
    Caption = 'Nome do Evento'
    FocusControl = dbEventos
  end
  object Label10: TLabel
    Left = 176
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = DBLookupComboBox4
  end
  object dbLocal: TDBEdit
    Left = 8
    Top = 104
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 5
  end
  object dbAutoria: TDBEdit
    Left = 8
    Top = 64
    Width = 217
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_autoria'
    TabOrder = 2
  end
  object dbAtividade: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 217
    Height = 21
    DataField = 'descAtividade'
    TabOrder = 0
  end
  object dbTitulo: TDBEdit
    Left = 236
    Top = 24
    Width = 481
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_atividade'
    TabOrder = 1
  end
  object dbAnais: TDBEdit
    Left = 236
    Top = 64
    Width = 219
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_titulo_obra'
    TabOrder = 3
  end
  object dbFolhas: TDBEdit
    Left = 656
    Top = 104
    Width = 60
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_paginas'
    TabOrder = 8
  end
  object dbAno: TDBEdit
    Left = 569
    Top = 104
    Width = 80
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 7
  end
  object dbEventos: TDBEdit
    Left = 464
    Top = 64
    Width = 253
    Height = 21
    CharCase = ecUpperCase
    DataField = 'nm_evento'
    TabOrder = 4
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 176
    Top = 104
    Width = 193
    Height = 21
    DataField = 'descEstado'
    TabOrder = 6
  end
end
