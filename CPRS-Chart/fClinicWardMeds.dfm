inherited frmClinicWardMeds: TfrmClinicWardMeds
  Left = 523
  Top = 389
  Width = 306
  Height = 122
  BorderIcons = []
  Caption = 'Patient Location'
  PixelsPerInch = 96
  TextHeight = 13
  object stxtLine3: TStaticText
    Left = 16
    Top = 35
    Width = 29
    Height = 17
    Caption = 'line 3'
    TabOrder = 0
  end
  object stxtLine2: TStaticText
    Left = 16
    Top = 20
    Width = 29
    Height = 17
    Caption = 'line 2'
    TabOrder = 1
  end
  object stxtLine1: TStaticText
    Left = 16
    Top = 5
    Width = 29
    Height = 17
    Caption = 'line 1'
    TabOrder = 2
  end
  object btnClinic: TButton
    Left = 31
    Top = 62
    Width = 58
    Height = 24
    Anchors = [akLeft, akBottom]
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 3
    OnClick = btnClinicClick
  end
  object btnWard: TButton
    Left = 159
    Top = 62
    Width = 58
    Height = 24
    Anchors = [akLeft, akBottom]
    TabOrder = 4
    OnClick = btnWardClick
  end
end
