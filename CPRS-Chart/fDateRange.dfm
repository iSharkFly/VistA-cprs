inherited frmDateRange: TfrmDateRange
  Left = 460
  Top = 262
  Width = 282
  Height = 159
  Caption = 'Date Range'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblStart: TLabel
    Left = 8
    Top = 44
    Width = 53
    Height = 13
    Caption = 'Begin Date'
  end
  object lblStop: TLabel
    Left = 145
    Top = 44
    Width = 45
    Height = 13
    Caption = 'End Date'
  end
  object lblInstruct: TOROffsetLabel
    Left = 0
    Top = 0
    Width = 274
    Height = 37
    Align = alTop
    Caption = 'Select a date range -'
    HorzOffset = 8
    Transparent = False
    VertOffset = 8
    WordWrap = True
  end
  object txtStart: TORDateBox
    Left = 8
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 0
    DateOnly = False
    RequireTime = False
    Caption = 'Begin Date'
  end
  object txtStop: TORDateBox
    Left = 145
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 1
    DateOnly = False
    RequireTime = False
    Caption = 'End Date'
  end
  object cmdOK: TButton
    Left = 114
    Top = 103
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 194
    Top = 103
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = cmdCancelClick
  end
end
