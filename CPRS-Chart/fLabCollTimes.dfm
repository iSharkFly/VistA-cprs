object frmLabCollectTimes: TfrmLabCollectTimes
  Left = 332
  Top = 310
  Width = 447
  Height = 197
  BorderIcons = []
  Caption = 'Future Lab Collect Times'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFutureTimes: TMemo
    Left = 211
    Top = 113
    Width = 129
    Height = 46
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Select a date and a routine '
      'lab collect time for that '
      'date.')
    ReadOnly = True
    TabOrder = 5
  end
  object calLabCollect: TORDateBox
    Left = 241
    Top = 22
    Width = 158
    Height = 21
    TabOrder = 0
    Visible = False
    OnChange = calLabCollectChange
    DateOnly = True
    RequireTime = False
  end
  object lstLabCollTimes: TORListBox
    Left = 210
    Top = 6
    Width = 218
    Height = 98
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
  end
  object cmdOK: TButton
    Left = 353
    Top = 112
    Width = 75
    Height = 21
    Caption = 'OK'
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 353
    Top = 139
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = cmdCancelClick
  end
  object calMonth: TMonthCalendar
    Left = 8
    Top = 5
    Width = 190
    Height = 153
    CalColors.TitleBackColor = clBtnFace
    CalColors.TitleTextColor = clBtnText
    CalColors.MonthBackColor = clWindow
    CalColors.TrailingTextColor = clGrayText
    Date = 36507.6194967361
    ShowTodayCircle = False
    TabOrder = 4
    TabStop = True
    OnClick = calMonthClick
    OnKeyDown = calMonthKeyDown
  end
end
