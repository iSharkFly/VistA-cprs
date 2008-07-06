inherited fraVitPO2: TfraVitPO2
  Width = 250
  inherited lblVitalType: TLabel
    Width = 24
    Caption = 'PO2:'
  end
  object lblPercent: TLabel [1]
    Left = 61
    Top = 0
    Width = 8
    Height = 21
    AutoSize = False
    Caption = '%'
    Layout = tlCenter
  end
  inherited btnQuals: TBitBtn
    Left = 91
  end
  object UpDown1: TUpDown
    Left = 73
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 1
    Wrap = False
  end
  object edtPO2: TEdit
    Left = 26
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 2
  end
end
