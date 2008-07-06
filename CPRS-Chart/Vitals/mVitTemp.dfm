inherited fraVitTemp: TfraVitTemp
  Width = 299
  inherited lblVitalType: TLabel
    Width = 30
    Caption = 'Temp:'
  end
  object lblF: TLabel [1]
    Left = 67
    Top = 0
    Width = 6
    Height = 21
    AutoSize = False
    Caption = 'F'
    Layout = tlCenter
  end
  object lblC: TLabel [2]
    Left = 129
    Top = 0
    Width = 7
    Height = 21
    AutoSize = False
    Caption = 'C'
    Layout = tlCenter
  end
  inherited btnQuals: TBitBtn
    Left = 140
  end
  object edtTempF: TEdit
    Left = 32
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 1
  end
  object udTemp: TUpDown
    Left = 77
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object edtTempC: TEdit
    Left = 94
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 3
  end
end
