inherited frmReportWizardStepSelection: TfrmReportWizardStepSelection
  object dbgRecords: TDBGrid
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DataSource = dsSelection
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FieldName'
        Title.Caption = 'Campo'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PropertyName'
        Title.Caption = 'Filtro'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Default'
        Title.Caption = 'Padr'#227'o'
        Width = 96
        Visible = True
      end>
  end
  object dsSelection: TDataSource
    DataSet = cdsSelection
    Left = 32
    Top = 112
  end
  object cdsSelection: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 112
    object cdsSelectionField: TStringField
      FieldName = 'Field'
      Size = 255
    end
    object cdsSelectionFieldName: TStringField
      FieldKind = fkLookup
      FieldName = 'FieldName'
      LookupDataSet = cdsFields
      LookupKeyFields = 'FieldName'
      LookupResultField = 'FieldName'
      KeyFields = 'Field'
      Size = 255
      Lookup = True
    end
    object cdsSelectionProperty: TStringField
      FieldName = 'Property'
      Size = 32
    end
    object cdsSelectionPropertyName: TStringField
      FieldKind = fkLookup
      FieldName = 'PropertyName'
      LookupDataSet = cdsProperties
      LookupKeyFields = 'Kind'
      LookupResultField = 'Name'
      KeyFields = 'Property'
      Size = 128
      Lookup = True
    end
    object cdsSelectionDefault: TStringField
      FieldName = 'Default'
      Size = 255
    end
  end
  object cdsProperties: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 112
    Data = {
      920200009619E0BD0100000018000000020017000000030000004C00044E616D
      65020049001200010005574944544802000200FF00044B696E64010049001000
      0100055749445448020002002000000000000C00416E6F2F53656D6573747265
      0B416E6F53656D657374726500000F0043656E74726F20646520437573746F0B
      43656E74726F437573746F00001900436C6173736520646F2043656E74726F20
      646520437573746F11436C6173736543656E74726F437573746F00001900436C
      6173736520646F20506C616E6F20646520436F6E74617310436C61737365506C
      616E6F436F6E746100000B00436F6C61626F7261646F720B436F6C61626F7261
      646F7200000800436F6C696761646108436F6C696761646100000B00436F6E74
      612F436169786105436F6E746100000500437572736F05437572736F00000400
      44617461044461746100000500446570746F0C446570617274616D656E746F00
      000A004469736369706C696E610A4469736369706C696E610000090045737475
      64616E7465094573747564616E74650000050045746170610545746170610000
      1200466F726D6120646520506167616D656E746F09466F726D615067746F0000
      0A00466F726E656365646F720A466F726E656365646F7200001200496E746572
      76616C6F206465204461746173094461746152616E676500000A004F7269656E
      7461646F720A4F7269656E7461646F720000080050617263656C617307506172
      63656C6100000600506573736F6106506573736F6100000F00506C616E6F2064
      6520436F6E7461730A506C616E6F436F6E74610000090050726F666573736F72
      0950726F666573736F7200000E005469706F2064652054ED74756C6F0A546970
      6F546974756C6F000005005475726D61055475726D61}
    object cdsPropertiesName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsPropertiesKind: TStringField
      FieldName = 'Kind'
      Size = 32
    end
  end
  object cdsFields: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 112
    object cdsFieldsFieldName: TStringField
      FieldName = 'FieldName'
      Size = 255
    end
  end
end
