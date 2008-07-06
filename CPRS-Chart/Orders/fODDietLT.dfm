inherited frmODDietLT: TfrmODDietLT
  Left = 398
  Top = 254
  Width = 304
  Height = 188
  Caption = 'Late Tray?'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 66
    Width = 296
    Height = 2
  end
  object lblMealCutoff: TStaticText
    Left = 8
    Top = 16
    Width = 186
    Height = 17
    Caption = 'You have missed the breakfast cut-off.'
    TabOrder = 4
  end
  object Label2: TStaticText
    Left = 8
    Top = 34
    Width = 156
    Height = 17
    Caption = 'Do you wish to order a late tray?'
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 109
    Top = 76
    Width = 77
    Height = 78
    Caption = 'Meal Time'
    TabOrder = 0
    object radLT1: TRadioButton
      Left = 9
      Top = 16
      Width = 56
      Height = 17
      TabOrder = 0
    end
    object radLT2: TRadioButton
      Left = 9
      Top = 36
      Width = 56
      Height = 17
      TabOrder = 1
    end
    object radLT3: TRadioButton
      Left = 9
      Top = 56
      Width = 56
      Height = 17
      TabOrder = 2
    end
  end
  object cmdYes: TButton
    Left = 216
    Top = 8
    Width = 72
    Height = 21
    Caption = 'Yes'
    Default = True
    TabOrder = 1
    OnClick = cmdYesClick
  end
  object cmdNo: TButton
    Left = 216
    Top = 37
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'No'
    TabOrder = 2
    OnClick = cmdNoClick
  end
  object chkBagged: TCheckBox
    Left = 8
    Top = 76
    Width = 85
    Height = 17
    Caption = 'Bagged Meal'
    TabOrder = 3
  end
end
