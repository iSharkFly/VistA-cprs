object fraVitMetric: TfraVitMetric
  Left = 0
  Top = 0
  Width = 161
  Height = 40
  TabOrder = 0
  object rgMetric: TRadioGroup
    Left = 0
    Top = 0
    Width = 161
    Height = 40
    Align = alClient
    Caption = 'Measurements'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Standard'
      'Metric')
    TabOrder = 0
    OnClick = rgMetricClick
  end
end
