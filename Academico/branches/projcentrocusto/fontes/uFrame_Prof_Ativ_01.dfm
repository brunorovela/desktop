object frm_Professores_Ativ_01: Tfrm_Professores_Ativ_01
  Left = 0
  Top = 0
  Width = 763
  Height = 127
  TabOrder = 0
  OnEnter = FrameEnter
  object Label2: TLabel
    Left = 232
    Top = 8
    Width = 110
    Height = 13
    Caption = 'Descri'#231#227'o da Atividade'
    FocusControl = DBEdit1
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Atividade'
    FocusControl = dbAtividade
  end
  object Label3: TLabel
    Left = 544
    Top = 8
    Width = 108
    Height = 13
    Caption = #193'rea do Conhecimento'
    FocusControl = DBLookupComboBox2
  end
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 48
    Height = 13
    Caption = 'Institui'#231#227'o'
    FocusControl = DBLookupComboBox3
  end
  object Label5: TLabel
    Left = 328
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = DBEdit2
  end
  object Label6: TLabel
    Left = 544
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = DBLookupComboBox4
  end
  object Label7: TLabel
    Left = 8
    Top = 88
    Width = 49
    Height = 13
    Caption = 'Ano In'#237'cio'
    FocusControl = DBEdit3
  end
  object Label8: TLabel
    Left = 104
    Top = 88
    Width = 38
    Height = 13
    Caption = 'Ano Fim'
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 232
    Top = 24
    Width = 305
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_atividade'
    TabOrder = 1
  end
  object dbAtividade: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 217
    Height = 21
    DataField = 'descAtividade'
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 544
    Top = 24
    Width = 201
    Height = 21
    DataField = 'descAreaConhecimento'
    TabOrder = 2
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 8
    Top = 64
    Width = 314
    Height = 21
    DataField = 'descInstituicao'
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 328
    Top = 64
    Width = 209
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 4
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 544
    Top = 64
    Width = 201
    Height = 21
    DataField = 'descEstado'
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 104
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 104
    Top = 104
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_fim'
    TabOrder = 7
  end
end

