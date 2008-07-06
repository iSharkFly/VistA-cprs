inherited frmODLab: TfrmODLab
  Tag = 120
  Left = 245
  Top = 263
  Width = 523
  Height = 271
  Caption = 'Order a Lab Test'
  PixelsPerInch = 96
  TextHeight = 13
  object lblAvailTests: TLabel [0]
    Left = 6
    Top = 4
    Width = 93
    Height = 13
    Caption = 'Available Lab Tests'
  end
  object lblCollTime: TLabel [1]
    Left = 148
    Top = 152
    Width = 100
    Height = 13
    Caption = 'Collection Date/Time'
  end
  object lblTestName: TLabel [2]
    Left = 180
    Top = 4
    Width = 3
    Height = 13
    ShowAccelChar = False
  end
  object lblCollSamp: TLabel [3]
    Left = 187
    Top = 31
    Width = 70
    Height = 13
    Caption = 'Collect Sample'
  end
  object lblSpecimen: TLabel [4]
    Left = 210
    Top = 58
    Width = 47
    Height = 13
    Caption = 'Specimen'
  end
  object lblUrgency: TLabel [5]
    Left = 217
    Top = 85
    Width = 40
    Height = 13
    Caption = 'Urgency'
  end
  object lblAddlComment: TLabel [6]
    Left = 187
    Top = 107
    Width = 93
    Height = 13
    Caption = 'Additional Comment'
    Visible = False
  end
  object bvlTestName: TBevel [7]
    Left = 180
    Top = 18
    Width = 338
    Height = 130
    Style = bsRaised
  end
  object lblFrequency: TLabel [8]
    Left = 326
    Top = 152
    Width = 57
    Height = 13
    Caption = 'How Often?'
  end
  object lblReqComment: TOROffsetLabel [9]
    Left = 386
    Top = 0
    Width = 96
    Height = 19
    HorzOffset = 2
    Transparent = False
    VertOffset = 2
    WordWrap = False
  end
  object lblHowManyDays: TLabel [10]
    Left = 431
    Top = 152
    Width = 55
    Height = 13
    Caption = 'How Long?'
  end
  object lblCollType: TLabel [11]
    Left = 7
    Top = 152
    Width = 73
    Height = 13
    Caption = 'Collection Type'
  end
  inherited memOrder: TCaptionMemo
    TabOrder = 20
  end
  object txtImmedColl: TCaptionEdit [13]
    Left = 149
    Top = 166
    Width = 141
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
    Text = 'txtImmedColl'
  end
  object calCollTime: TORDateBox [14]
    Left = 149
    Top = 166
    Width = 165
    Height = 21
    TabOrder = 13
    OnChange = ControlChange
    DateOnly = False
    RequireTime = False
  end
  object pnlUrineVolume: TORAutoPanel [15]
    Left = 378
    Top = 25
    Width = 133
    Height = 118
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 8
    object lblUrineVolume: TOROffsetLabel
      Left = 6
      Top = 29
      Width = 111
      Height = 15
      Caption = 'Enter the urine volume:'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = False
    end
    object txtUrineVolume: TCaptionEdit
      Left = 5
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = txtUrineVolumeExit
    end
  end
  object pnlAntiCoagulation: TORAutoPanel [16]
    Left = 378
    Top = 25
    Width = 133
    Height = 118
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 7
    object lblAntiCoagulant: TOROffsetLabel
      Left = 6
      Top = 8
      Width = 97
      Height = 41
      Caption = 'What kind of anticoagulant is the patient on?'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = True
    end
    object txtAntiCoagulant: TCaptionEdit
      Left = 6
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = txtAntiCoagulantExit
    end
  end
  object pnlOrderComment: TORAutoPanel [17]
    Left = 378
    Top = 25
    Width = 133
    Height = 118
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object lblOrderComment: TOROffsetLabel
      Left = 6
      Top = 37
      Width = 103
      Height = 15
      Caption = 'Enter order comment:'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = True
    end
    object txtOrderComment: TCaptionEdit
      Left = 6
      Top = 57
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = txtOrderCommentExit
    end
  end
  object pnlHide: TORAutoPanel [18]
    Left = 378
    Top = 25
    Width = 133
    Height = 118
    BevelOuter = bvNone
    TabOrder = 5
  end
  object pnlDoseDraw: TORAutoPanel [19]
    Left = 378
    Top = 25
    Width = 133
    Height = 118
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 10
    object lblDose: TOROffsetLabel
      Left = 10
      Top = 15
      Width = 115
      Height = 15
      Caption = 'Enter the last dose time:'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = False
    end
    object lblDraw: TOROffsetLabel
      Left = 10
      Top = 68
      Width = 78
      Height = 15
      Caption = 'Enter draw time:'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = False
    end
    object txtDoseTime: TCaptionEdit
      Left = 10
      Top = 31
      Width = 112
      Height = 21
      TabOrder = 0
      OnExit = txtDoseTimeExit
    end
    object txtDrawTime: TCaptionEdit
      Left = 10
      Top = 85
      Width = 112
      Height = 21
      TabOrder = 1
      OnExit = txtDrawTimeExit
    end
  end
  object pnlPeakTrough: TORAutoPanel [20]
    Left = 378
    Top = 25
    Width = 133
    Height = 118
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 9
    object lblPeakTrough: TOROffsetLabel
      Left = 6
      Top = 7
      Width = 82
      Height = 13
      Caption = 'Sample drawn at:'
      HorzOffset = 0
      Transparent = False
      VertOffset = 0
      WordWrap = True
    end
    object grpPeakTrough: TRadioGroup
      Left = 6
      Top = 20
      Width = 120
      Height = 89
      Items.Strings = (
        '&Peak'
        '&Trough'
        '&Mid'
        '&Unknown')
      TabOrder = 0
      OnClick = grpPeakTroughClick
    end
  end
  inherited cmdAccept: TButton
    Left = 443
    TabOrder = 18
  end
  inherited cmdQuit: TButton
    TabOrder = 19
  end
  inherited pnlMessage: TPanel
    Left = 18
    Top = 192
    Height = 56
    TabOrder = 21
    inherited imgMessage: TImage
      Top = 11
    end
    inherited memMessage: TRichEdit
      Left = 41
      Top = 5
      Height = 43
      PopupMenu = MessagePopup
    end
  end
  object pnlCollTimeButton: TKeyClickPanel
    Left = 288
    Top = 167
    Width = 20
    Height = 19
    BevelOuter = bvNone
    Caption = 'Select collection time'
    TabOrder = 15
    TabStop = True
    OnClick = cmdImmedCollClick
    OnEnter = pnlCollTimeButtonEnter
    OnExit = pnlCollTimeButtonExit
    object cmdImmedColl: TSpeedButton
      Left = 1
      Top = 1
      Width = 18
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        0000333333333333000033333333333300003333333333330000300330033003
        0000300330033003000033333333333300003333333333330000333333333333
        0000333333333333000033333333333300003333333333330000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = cmdImmedCollClick
    end
  end
  object cboAvailTest: TORComboBox
    Left = 6
    Top = 18
    Width = 168
    Height = 130
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Available Lab Tests'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnClick = cboAvailTestSelect
    OnExit = cboAvailTestExit
    OnNeedData = cboAvailTestNeedData
    CharsNeedMatch = 1
  end
  object cboFrequency: TORComboBox
    Left = 326
    Top = 166
    Width = 97
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'How Often?'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 16
    OnChange = cboFrequencyChange
    CharsNeedMatch = 1
  end
  object cboCollSamp: TORComboBox
    Left = 269
    Top = 28
    Width = 100
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Collect Sample'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    OnChange = cboCollSampChange
    OnEnter = cboCollSampMouseClick
    OnKeyPause = cboCollSampKeyPause
    OnMouseClick = cboCollSampMouseClick
    CharsNeedMatch = 1
  end
  object cboSpecimen: TORComboBox
    Left = 269
    Top = 55
    Width = 100
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Specimen'
    Color = clWindow
    DropDownCount = 10
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    ParentShowHint = False
    Pieces = '2'
    ShowHint = True
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 2
    OnChange = cboSpecimenChange
    OnEnter = cboSpecimenMouseClick
    OnKeyPause = cboSpecimenKeyPause
    OnMouseClick = cboSpecimenMouseClick
    CharsNeedMatch = 1
  end
  object cboUrgency: TORComboBox
    Left = 269
    Top = 82
    Width = 100
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Urgency'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 3
    OnChange = cboUrgencyChange
    CharsNeedMatch = 1
  end
  object txtAddlComment: TCaptionEdit
    Left = 187
    Top = 122
    Width = 180
    Height = 21
    TabOrder = 4
    Visible = False
    OnExit = txtAddlCommentExit
    Caption = 'Additional Comment'
  end
  object txtDays: TCaptionEdit
    Left = 430
    Top = 166
    Width = 84
    Height = 21
    Hint = 'Enter a number of days, or an "X" followed by a number of times.'
    Enabled = False
    TabOrder = 17
    OnChange = ControlChange
    Caption = 'How Long?'
  end
  object FLabCommonCombo: TORListBox
    Left = 440
    Top = 247
    Width = 121
    Height = 97
    TabStop = False
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
    Visible = False
    ItemTipColor = clWindow
    LongList = False
  end
  object cboCollTime: TORComboBox
    Left = 149
    Top = 166
    Width = 168
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Collection Date/Time'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 12
    OnChange = cboCollTimeChange
    OnExit = cboCollTimeExit
    CharsNeedMatch = 1
  end
  object cboCollType: TORComboBox
    Left = 6
    Top = 166
    Width = 136
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Collection Type'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 11
    OnChange = cboCollTypeChange
    CharsNeedMatch = 1
  end
  object dlgLabCollTime: TORDateTimeDlg
    FMDateTime = 2980923
    DateOnly = False
    RequireTime = True
    Left = 219
    Top = 4
  end
  object MessagePopup: TPopupMenu
    Left = 340
    Top = 218
    object ViewinReportWindow1: TMenuItem
      Caption = '&View in Report Window'
      OnClick = ViewinReportWindow1Click
    end
  end
end
