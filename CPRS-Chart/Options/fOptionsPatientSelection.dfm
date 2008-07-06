object frmOptionsPatientSelection: TfrmOptionsPatientSelection
  Left = 345
  Top = 133
  HelpContext = 9060
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Patient Selection Defaults'
  ClientHeight = 413
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'CPRSWT.HLP'
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblClinicDays: TLabel
    Left = 179
    Top = 162
    Width = 101
    Height = 13
    Caption = 'Clinic for day of week'
  end
  object lblMonday: TLabel
    Left = 179
    Top = 184
    Width = 41
    Height = 13
    Caption = 'Monday:'
  end
  object lblTuesday: TLabel
    Left = 179
    Top = 213
    Width = 44
    Height = 13
    Caption = 'Tuesday:'
  end
  object lblWednesday: TLabel
    Left = 179
    Top = 241
    Width = 60
    Height = 13
    Caption = 'Wednesday:'
  end
  object lblThursday: TLabel
    Left = 179
    Top = 270
    Width = 47
    Height = 13
    Caption = 'Thursday:'
  end
  object lblFriday: TLabel
    Left = 179
    Top = 298
    Width = 31
    Height = 13
    Caption = 'Friday:'
  end
  object lblSaturday: TLabel
    Left = 179
    Top = 327
    Width = 45
    Height = 13
    Caption = 'Saturday:'
  end
  object lblSunday: TLabel
    Left = 179
    Top = 355
    Width = 39
    Height = 13
    Caption = 'Sunday:'
  end
  object lblVisitStart: TLabel
    Left = 20
    Top = 321
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Caption = 'Start:'
  end
  object lblVisitStop: TLabel
    Left = 20
    Top = 352
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Caption = 'Stop:'
  end
  object lbWard: TLabel
    Left = 179
    Top = 136
    Width = 29
    Height = 13
    Caption = 'Ward:'
  end
  object lblTeam: TLabel
    Left = 179
    Top = 107
    Width = 51
    Height = 13
    Caption = 'Team/List:'
  end
  object lblTreating: TLabel
    Left = 179
    Top = 77
    Width = 88
    Height = 13
    Caption = 'Treating Specialty:'
  end
  object lblProvider: TLabel
    Left = 179
    Top = 50
    Width = 79
    Height = 13
    Caption = 'Primary Provider:'
  end
  object lblVisitDateRange: TMemo
    Left = 20
    Top = 255
    Width = 133
    Height = 61
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Display patients that have '
      'clinic appointments within '
      'this date range.')
    ReadOnly = True
    TabOrder = 18
  end
  object lblInfo: TMemo
    Left = 8
    Top = 6
    Width = 393
    Height = 27
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      
        'The values on the right will be defaults for selecting patients ' +
        'depending on the list '
      
        'source selected. Combination uses the criteria defined using Sou' +
        'rce Combinations.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 19
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 380
    Width = 414
    Height = 33
    HelpContext = 9060
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 17
    object bvlBottom: TBevel
      Left = 0
      Top = 0
      Width = 414
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 251
      Top = 8
      Width = 75
      Height = 22
      HelpContext = 9996
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 331
      Top = 8
      Width = 75
      Height = 22
      HelpContext = 9997
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cboProvider: TORComboBox
    Left = 285
    Top = 48
    Width = 121
    Height = 21
    HelpContext = 9063
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Primary Provider'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 2
    MaxLength = 0
    Pieces = '2,3'
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 6
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboProviderNeedData
  end
  object cboTreating: TORComboBox
    Left = 285
    Top = 75
    Width = 121
    Height = 21
    HelpContext = 9064
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Treating Specialty'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 7
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
  end
  object cboTeam: TORComboBox
    Left = 285
    Top = 104
    Width = 121
    Height = 21
    HelpContext = 9065
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Team/List'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 8
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
  end
  object cboWard: TORComboBox
    Left = 285
    Top = 132
    Width = 121
    Height = 21
    HelpContext = 9066
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Ward'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 9
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
  end
  object cboMonday: TORComboBox
    Left = 285
    Top = 181
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Monday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 10
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboMondayNeedData
  end
  object cboTuesday: TORComboBox
    Left = 285
    Top = 210
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Tuesday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 11
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboTuesdayNeedData
  end
  object cboWednesday: TORComboBox
    Left = 285
    Top = 238
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Wednesday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 12
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboWednesdayNeedData
  end
  object cboThursday: TORComboBox
    Left = 285
    Top = 267
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Thursday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 13
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboThursdayNeedData
  end
  object cboFriday: TORComboBox
    Left = 285
    Top = 295
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Friday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 14
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboFridayNeedData
  end
  object cboSaturday: TORComboBox
    Left = 285
    Top = 324
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Saturday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 15
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboSaturdayNeedData
  end
  object cboSunday: TORComboBox
    Left = 285
    Top = 352
    Width = 121
    Height = 21
    HelpContext = 9067
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Sunday'
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
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 16
    OnExit = cboProviderExit
    OnKeyUp = cboProviderKeyUp
    OnNeedData = cboSundayNeedData
  end
  object txtVisitStart: TCaptionEdit
    Tag = -180
    Left = 49
    Top = 319
    Width = 79
    Height = 21
    HelpContext = 9068
    TabOrder = 2
    Text = '0'
    OnExit = txtVisitStartExit
    OnKeyPress = txtVisitStartKeyPress
    OnKeyUp = txtVisitStartKeyUp
    Caption = 'Start'
  end
  object txtVisitStop: TCaptionEdit
    Tag = 30
    Left = 48
    Top = 348
    Width = 79
    Height = 21
    HelpContext = 9069
    TabOrder = 4
    Text = '0'
    OnExit = txtVisitStopExit
    OnKeyPress = txtVisitStopKeyPress
    OnKeyUp = txtVisitStopKeyUp
    Caption = 'Stop'
  end
  object spnVisitStart: TUpDown
    Tag = -180
    Left = 128
    Top = 319
    Width = 16
    Height = 21
    HelpContext = 9068
    Associate = txtVisitStart
    Min = -999
    Max = 999
    Position = 0
    TabOrder = 3
    Thousands = False
    Wrap = False
    OnClick = spnVisitStartClick
  end
  object spnVisitStop: TUpDown
    Tag = 30
    Left = 127
    Top = 348
    Width = 16
    Height = 21
    HelpContext = 9069
    Associate = txtVisitStop
    Min = -999
    Max = 999
    Position = 0
    TabOrder = 5
    Thousands = False
    Wrap = False
    OnClick = spnVisitStopClick
  end
  object radListSource: TRadioGroup
    Left = 16
    Top = 38
    Width = 145
    Height = 105
    HelpContext = 9061
    Caption = 'List Source '
    ItemIndex = 0
    Items.Strings = (
      'Primary &Provider'
      'Treating &Specialty'
      'Team/&List'
      '&Ward'
      '&Clinic'
      'C&ombination')
    TabOrder = 0
    OnClick = radListSourceClick
  end
  object grpSortOrder: TGroupBox
    Left = 16
    Top = 152
    Width = 145
    Height = 94
    HelpContext = 9062
    Caption = 'Sort Order '
    TabOrder = 1
    object radAlphabetical: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      HelpContext = 9062
      Caption = '&Alphabetical'
      TabOrder = 0
    end
    object radRoomBed: TRadioButton
      Left = 8
      Top = 31
      Width = 113
      Height = 17
      HelpContext = 9062
      Caption = '&Room/Bed'
      TabOrder = 1
    end
    object radAppointmentDate: TRadioButton
      Left = 8
      Top = 46
      Width = 113
      Height = 17
      HelpContext = 9062
      Caption = 'Appointment &Date'
      TabOrder = 2
    end
    object radTerminalDigit: TRadioButton
      Left = 8
      Top = 60
      Width = 113
      Height = 17
      HelpContext = 9062
      Caption = '&Terminal Digit'
      TabOrder = 3
    end
    object radSource: TRadioButton
      Left = 8
      Top = 75
      Width = 113
      Height = 17
      HelpContext = 9062
      Caption = 'So&urce'
      TabOrder = 4
    end
  end
end
