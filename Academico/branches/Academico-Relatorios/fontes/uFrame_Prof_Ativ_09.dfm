object frm_Professores_Ativ_09: Tfrm_Professores_Ativ_09
  Left = 0
  Top = 0
  Width = 754
  Height = 127
  TabOrder = 0
  OnEnter = FrameEnter
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Atividade'
    FocusControl = dbAtividade
  end
  object Label3: TLabel
    Left = 232
    Top = 8
    Width = 28
    Height = 13
    Caption = 'T'#237'tulo'
    FocusControl = dbTitulo
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Autoria'
    FocusControl = dbAutoria
  end
  object Label8: TLabel
    Left = 8
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = dbLocal
  end
  object Label6: TLabel
    Left = 525
    Top = 88
    Width = 75
    Height = 13
    Caption = 'Ano Publica'#231#227'o'
    FocusControl = dbAno
  end
  object Label4: TLabel
    Left = 376
    Top = 88
    Width = 130
    Height = 13
    Caption = 'Volume/Fasc'#237'culo/P'#225'ginas'
    FocusControl = dbFolhas
  end
  object Label5: TLabel
    Left = 320
    Top = 48
    Width = 90
    Height = 13
    Caption = 'T'#237'tulo da Peri'#243'dico'
    FocusControl = DBEdit1
  end
  object Label7: TLabel
    Left = 627
    Top = 88
    Width = 76
    Height = 13
    Caption = 'M'#234's Publica'#231#227'o'
    FocusControl = DBEdit2
  end
  object Label10: TLabel
    Left = 176
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = DBLookupComboBox4
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
    Left = 232
    Top = 24
    Width = 485
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_atividade'
    TabOrder = 1
  end
  object dbAutoria: TDBEdit
    Left = 8
    Top = 64
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_autoria'
    TabOrder = 2
  end
  object dbLocal: TDBEdit
    Left = 8
    Top = 104
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 4
  end
  object dbAno: TDBEdit
    Left = 525
    Top = 104
    Width = 92
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 7
  end
  object dbFolhas: TDBEdit
    Left = 376
    Top = 104
    Width = 137
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_paginas'
    TabOrder = 6
  end
  object DBEdit1: TDBEdit
    Left = 320
    Top = 64
    Width = 396
    Height = 21
    DataField = 'ds_titulo_obra'
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 627
    Top = 104
    Width = 89
    Height = 21
    DataField = 'vl_mes'
    TabOrder = 8
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 176
    Top = 104
    Width = 193
    Height = 21
    DataField = 'descEstado'
    TabOrder = 5
  end
end

