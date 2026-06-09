object frm_Professores_Ativ_11: Tfrm_Professores_Ativ_11
  Left = 0
  Top = 0
  Width = 753
  Height = 124
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
    Width = 110
    Height = 13
    Caption = 'Descri'#231#227'o da Atividade'
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
  object DBMemo1: TDBMemo
    Left = 8
    Top = 64
    Width = 708
    Height = 56
    DataField = 'ds_outras_publicacoes'
    TabOrder = 2
  end
end

