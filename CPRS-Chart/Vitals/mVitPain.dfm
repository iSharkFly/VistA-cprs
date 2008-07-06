inherited fraVitPain: TfraVitPain
  Width = 288
  inherited lblVitalType: TLabel
    Width = 24
    Caption = 'Pain:'
  end
  inherited btnQuals: TBitBtn
    Left = 129
  end
  object cbxPain: TORComboBox
    Left = 26
    Top = 0
    Width = 102
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
  end
end
