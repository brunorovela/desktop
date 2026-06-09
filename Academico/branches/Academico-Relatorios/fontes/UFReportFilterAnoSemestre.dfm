inherited frmReportFilterAnoSemestre: TfrmReportFilterAnoSemestre
  inherited pnlContent: TPanel
    inherited pnlLabel: TPanel
      Width = 74
      ExplicitWidth = 74
      inherited lblLabel: TLabel
        Left = 3
        Width = 68
        Height = 18
        Caption = 'Ano/Semestre'
        ExplicitLeft = 3
        ExplicitWidth = 68
      end
    end
    object pnlFilter: TPanel
      Left = 74
      Top = 0
      Width = 377
      Height = 24
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object meAnoSemestre: TMaskEdit
        Left = 3
        Top = 3
        Width = 48
        Height = 21
        EditMask = '9999/9;0;_'
        MaxLength = 6
        TabOrder = 0
      end
      object udAnoSemestre: TUpDown
        Left = 54
        Top = 3
        Width = 17
        Height = 21
        Min = -100
        TabOrder = 1
        OnClick = udAnoSemestreClick
      end
    end
  end
end
