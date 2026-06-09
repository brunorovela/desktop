object frm_Professores_Ativ_07: Tfrm_Professores_Ativ_07
  Left = 0
  Top = 0
  Width = 757
  Height = 127
  TabOrder = 0
  TabStop = True
  OnEnter = FrameEnter
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Atividade'
    FocusControl = dbAtividade
  end
  object Label3: TLabel
    Left = 232
    Top = 8
    Width = 70
    Height = 13
    Caption = 'T'#237'tulo da Parte'
    FocusControl = DBEdit4
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 35
    Height = 13
    Caption = 'Autoria'
    FocusControl = DBEdit1
  end
  object Label7: TLabel
    Left = 316
    Top = 50
    Width = 68
    Height = 13
    Caption = 'T'#237'tulo da Obra'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 570
    Top = 88
    Width = 19
    Height = 13
    Caption = 'Ano'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 632
    Top = 88
    Width = 37
    Height = 13
    Caption = 'P'#225'ginas'
    FocusControl = DBEdit2
  end
  object Label8: TLabel
    Left = 8
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = DBEdit6
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
  object DBEdit4: TDBEdit
    Left = 232
    Top = 24
    Width = 485
    Height = 21
    DataField = 'ds_atividade'
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 64
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_autoria'
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 316
    Top = 64
    Width = 401
    Height = 21
    DataField = 'ds_titulo_obra'
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 568
    Top = 104
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 632
    Top = 104
    Width = 84
    Height = 21
    DataField = 'vl_paginas'
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 104
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 4
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 176
    Top = 104
    Width = 193
    Height = 21
    DataField = 'descEstado'
    TabOrder = 7
  end
end
