object frm_Professores_Ativ_06: Tfrm_Professores_Ativ_06
  Left = 0
  Top = 0
  Width = 758
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
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 35
    Height = 13
    Caption = 'Autoria'
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 317
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Edi'#231#227'o'
    FocusControl = DBEdit2
  end
  object Label6: TLabel
    Left = 413
    Top = 88
    Width = 19
    Height = 13
    Caption = 'Ano'
    FocusControl = DBEdit3
  end
  object Label3: TLabel
    Left = 232
    Top = 8
    Width = 26
    Height = 13
    Caption = 'T'#237'tulo'
    FocusControl = DBEdit4
  end
  object Label10: TLabel
    Left = 8
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = DBLookupComboBox4
  end
  object Label7: TLabel
    Left = 448
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = DBEdit5
  end
  object dbAtividade: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 217
    Height = 21
    DataField = 'descAtividade'
    TabOrder = 0
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
  object DBEdit2: TDBEdit
    Left = 317
    Top = 64
    Width = 124
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_edicao'
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 413
    Top = 104
    Width = 64
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 232
    Top = 24
    Width = 486
    Height = 21
    DataField = 'ds_atividade'
    TabOrder = 1
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 8
    Top = 104
    Width = 193
    Height = 21
    DataField = 'descEstado'
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 448
    Top = 64
    Width = 270
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 4
  end
end
