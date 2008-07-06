object fraVisitRelated: TfraVisitRelated
  Left = 0
  Top = 0
  Width = 192
  Height = 136
  TabOrder = 0
  object bvlSCFrame: TBevel
    Left = 0
    Top = 14
    Width = 191
    Height = 119
    Shape = bsFrame
  end
  object lblSCYes: TStaticText
    Left = 3
    Top = 0
    Width = 22
    Height = 13
    AutoSize = False
    Caption = 'Yes'
    TabOrder = 14
  end
  object lblSCNo: TStaticText
    Left = 26
    Top = 0
    Width = 18
    Height = 13
    AutoSize = False
    Caption = 'No'
    TabOrder = 15
  end
  object lblSCSelect: TStaticText
    Left = 44
    Top = 0
    Width = 131
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Visit Related To'
    TabOrder = 16
  end
  object chkSCYes: TCheckBox
    Tag = 1
    Left = 6
    Top = 17
    Width = 16
    Height = 17
    TabOrder = 0
    OnClick = chkClick
  end
  object chkAOYes: TCheckBox
    Tag = 2
    Left = 6
    Top = 49
    Width = 16
    Height = 17
    TabOrder = 4
    OnClick = chkClick
  end
  object chkIRYes: TCheckBox
    Tag = 3
    Left = 6
    Top = 65
    Width = 16
    Height = 17
    TabOrder = 6
    OnClick = chkClick
  end
  object chkECYes: TCheckBox
    Tag = 4
    Left = 6
    Top = 81
    Width = 16
    Height = 17
    TabOrder = 8
    OnClick = chkClick
  end
  object chkMSTYes: TCheckBox
    Tag = 5
    Left = 6
    Top = 97
    Width = 16
    Height = 17
    TabOrder = 10
    OnClick = chkClick
  end
  object chkMSTNo: TCheckBox
    Tag = 15
    Left = 26
    Top = 97
    Width = 160
    Height = 17
    Caption = 'MST'
    TabOrder = 11
    OnClick = chkClick
  end
  object chkECNo: TCheckBox
    Tag = 14
    Left = 26
    Top = 81
    Width = 160
    Height = 17
    Caption = 'Environmental Contaminants'
    TabOrder = 9
    OnClick = chkClick
  end
  object chkIRNo: TCheckBox
    Tag = 13
    Left = 26
    Top = 65
    Width = 160
    Height = 17
    Caption = 'Ionizing Radiation Exposure'
    TabOrder = 7
    OnClick = chkClick
  end
  object chkAONo: TCheckBox
    Tag = 12
    Left = 26
    Top = 49
    Width = 160
    Height = 17
    Caption = 'Agent Orange Exposure'
    TabOrder = 5
    OnClick = chkClick
  end
  object chkSCNo: TCheckBox
    Tag = 11
    Left = 26
    Top = 17
    Width = 160
    Height = 17
    Caption = 'Service Connected Condition'
    TabOrder = 1
    OnClick = chkClick
  end
  object chkHNCYes: TCheckBox
    Tag = 6
    Left = 6
    Top = 113
    Width = 16
    Height = 17
    TabOrder = 12
    OnClick = chkClick
  end
  object chkHNCNo: TCheckBox
    Tag = 16
    Left = 26
    Top = 113
    Width = 160
    Height = 17
    Caption = 'Head and/or Neck Cancer'
    TabOrder = 13
    OnClick = chkClick
  end
  object chkCVYes: TCheckBox
    Tag = 7
    Left = 6
    Top = 33
    Width = 16
    Height = 17
    TabOrder = 2
    OnClick = chkClick
  end
  object chkCVNo: TCheckBox
    Tag = 17
    Left = 26
    Top = 33
    Width = 160
    Height = 17
    Caption = 'Combat Vet (Combat Related)'
    TabOrder = 3
    OnClick = chkClick
  end
end
