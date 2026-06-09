object frm_Professores_Ativ_05: Tfrm_Professores_Ativ_05
  Left = 0
  Top = 0
  Width = 759
  Height = 126
  TabOrder = 0
  OnEnter = FrameEnter
  object Label2: TLabel
    Left = 232
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Curso'
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
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 48
    Height = 13
    Caption = 'Institui'#231#227'o'
    FocusControl = DBLookupComboBox3
  end
  object Label5: TLabel
    Left = 320
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = DBEdit2
  end
  object Label6: TLabel
    Left = 528
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = DBLookupComboBox4
  end
  object Label7: TLabel
    Left = 80
    Top = 88
    Width = 49
    Height = 13
    Caption = 'Ano In'#237'cio'
    FocusControl = DBEdit3
  end
  object Label8: TLabel
    Left = 176
    Top = 88
    Width = 38
    Height = 13
    Caption = 'Ano Fim'
    FocusControl = DBEdit4
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 51
    Height = 13
    Caption = 'Horas aula'
    FocusControl = DBEdit5
  end
  object DBEdit1: TDBEdit
    Left = 232
    Top = 24
    Width = 497
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
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 8
    Top = 64
    Width = 305
    Height = 21
    DataField = 'descInstituicao'
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 320
    Top = 64
    Width = 201
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 3
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 528
    Top = 64
    Width = 201
    Height = 21
    DataField = 'descEstado'
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 80
    Top = 104
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 176
    Top = 104
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_fim'
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 104
    Width = 64
    Height = 21
    DataField = 'vl_horas'
    TabOrder = 5
  end
end

