inherited fraVitHeight: TfraVitHeight
  Width = 313
  inherited lblVitalType: TLabel
    Width = 34
    Caption = 'Height:'
  end
  object lblIn: TLabel [1]
    Left = 71
    Top = 0
    Width = 8
    Height = 21
    AutoSize = False
    Caption = 'in'
    Layout = tlCenter
  end
  object Label1: TLabel [2]
    Left = 135
    Top = 0
    Width = 14
    Height = 21
    AutoSize = False
    Caption = 'cm'
    Layout = tlCenter
  end
  inherited btnQuals: TBitBtn
    Left = 154
  end
  object edtHtIn: TEdit
    Left = 36
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 1
  end
  object udHeight: TUpDown
    Left = 83
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object edtHtCm: TEdit
    Left = 100
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 3
  end
end
