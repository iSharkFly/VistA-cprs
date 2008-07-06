inherited fraVitCVP: TfraVitCVP
  Width = 414
  inherited lblVitalType: TLabel
    Width = 24
    Caption = 'CVP:'
  end
  object lblMm: TLabel [1]
    Left = 154
    Top = 0
    Width = 30
    Height = 21
    AutoSize = False
    Caption = 'mmHg'
    Layout = tlCenter
  end
  object lblCm: TLabel [2]
    Left = 61
    Top = 0
    Width = 36
    Height = 21
    AutoSize = False
    Caption = 'cmH2O'
    Layout = tlCenter
  end
  inherited btnQuals: TBitBtn
    Left = 255
  end
  object edtCVPcm: TEdit
    Left = 26
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 1
  end
  object UpDown1: TUpDown
    Left = 101
    Top = 0
    Width = 16
    Height = 21
    Min = 0
    Position = 0
    TabOrder = 2
    Wrap = False
  end
  object edtCVPmm: TEdit
    Left = 118
    Top = 0
    Width = 31
    Height = 21
    TabOrder = 3
  end
  object cbcmH2O: TORCheckBox
    Left = 196
    Top = 3
    Width = 55
    Height = 16
    Caption = 'cmH2O'
    TabOrder = 4
    OnClick = cbcmH2OClick
  end
end
