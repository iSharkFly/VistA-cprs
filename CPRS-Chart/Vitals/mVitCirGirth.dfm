inherited fraVitCircum: TfraVitCircum
  Width = 297
  inherited lblVitalType: TLabel
    Width = 18
    Caption = 'CG:'
  end
  object lblIn: TLabel [1]
    Left = 55
    Top = 0
    Width = 8
    Height = 21
    AutoSize = False
    Caption = 'in'
    Layout = tlCenter
  end
  object lblCm: TLabel [2]
    Left = 119
    Top = 0
    Width = 14
    Height = 21
    AutoSize = False
    Caption = 'cm'
    Layout = tlCenter
  end
  inherited btnQuals: TBitBtn
    Left = 138
  end
  object edtCirIn: TEdit
    Left = 20
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 1
  end
  object udCir: TUpDown
    Left = 67
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object edtCirCm: TEdit
    Left = 84
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 3
  end
end
