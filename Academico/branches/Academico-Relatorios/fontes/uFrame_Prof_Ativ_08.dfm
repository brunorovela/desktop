object frm_Professores_Ativ_08: Tfrm_Professores_Ativ_08
  Left = 0
  Top = 0
  Width = 755
  Height = 128
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
    Left = 224
    Top = 88
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = dbLocal
  end
  object Label6: TLabel
    Left = 565
    Top = 88
    Width = 19
    Height = 13
    Caption = 'Ano'
    FocusControl = dbAno
  end
  object Label4: TLabel
    Left = 624
    Top = 88
    Width = 86
    Height = 13
    Caption = 'N'#250'mero de Folhas'
    FocusControl = dbFolhas
  end
  object Label5: TLabel
    Left = 317
    Top = 48
    Width = 48
    Height = 13
    Caption = 'Institui'#231#227'o'
    FocusControl = dbInstituicao
  end
  object Label7: TLabel
    Left = 8
    Top = 88
    Width = 94
    Height = 13
    Caption = 'Tipo do Documento'
  end
  object Label10: TLabel
    Left = 408
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
    Left = 224
    Top = 104
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ds_local'
    TabOrder = 5
  end
  object dbAno: TDBEdit
    Left = 565
    Top = 104
    Width = 52
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_ano_inicio'
    TabOrder = 7
  end
  object dbFolhas: TDBEdit
    Left = 624
    Top = 104
    Width = 92
    Height = 21
    CharCase = ecUpperCase
    DataField = 'vl_paginas'
    TabOrder = 8
  end
  object dbInstituicao: TDBLookupComboBox
    Left = 317
    Top = 64
    Width = 401
    Height = 21
    DataField = 'descInstituicao'
    TabOrder = 3
  end
  object dbTipoDoc: TDBComboBox
    Left = 8
    Top = 104
    Width = 209
    Height = 21
    DataField = 'ds_tipo_tcc'
    ItemHeight = 13
    Items.Strings = (
      'Tese'
      'Disserta'#231#227'o'
      'Monografia')
    TabOrder = 4
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 408
    Top = 104
    Width = 151
    Height = 21
    DataField = 'descEstado'
    TabOrder = 6
  end
end

