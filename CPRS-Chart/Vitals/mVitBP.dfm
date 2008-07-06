inherited fraVitPB: TfraVitPB
  Width = 288
  inherited lblVitalType: TLabel
    Width = 17
    Caption = 'BP:'
  end
  object lblSlash: TLabel [1]
    Left = 70
    Top = 0
    Width = 5
    Height = 21
    AutoSize = False
    Caption = '/'
    Layout = tlCenter
  end
  inherited btnQuals: TBitBtn
    Left = 129
  end
  object udSystolic: TUpDown
    Left = 50
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 1
    Wrap = False
  end
  object edtSystolic: TEdit
    Left = 19
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 2
  end
  object udDiastolic: TUpDown
    Left = 111
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 3
    Wrap = False
  end
  object edtDiastolic: TEdit
    Left = 80
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 4
  end
end
