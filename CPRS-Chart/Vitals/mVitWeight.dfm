inherited fraVitWeight: TfraVitWeight
  inherited lblVitalType: TLabel
    Width = 37
    Caption = 'Weight:'
  end
  object lblLbs: TLabel [1]
    Left = 74
    Top = 0
    Width = 13
    Height = 21
    AutoSize = False
    Caption = 'lbs'
    Layout = tlCenter
  end
  object Label1: TLabel [2]
    Left = 143
    Top = 0
    Width = 12
    Height = 21
    AutoSize = False
    Caption = 'kg'
    Layout = tlCenter
  end
  object edtWtLbs: TEdit
    Left = 39
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 1
  end
  object udWeight: TUpDown
    Left = 91
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object edtWtKg: TEdit
    Left = 108
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 3
  end
end
