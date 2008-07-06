inherited frmODRad: TfrmODRad
  Tag = 160
  Left = 282
  Top = 225
  Width = 576
  Height = 361
  Caption = 'Order an Imaging Procedure'
  Constraints.MinHeight = 344
  Constraints.MinWidth = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited memOrder: TCaptionMemo
    Left = 0
    Top = 283
    Width = 480
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 6
  end
  object FRadCommonCombo: TORListBox [1]
    Left = 443
    Top = 346
    Width = 121
    Height = 11
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = False
    ItemTipColor = clWindow
    LongList = False
  end
  object pnlLeft: TORAutoPanel [2]
    Left = 0
    Top = 0
    Width = 215
    Height = 281
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    object lblDrug: TLabel
      Left = 0
      Top = 38
      Width = 89
      Height = 13
      Caption = 'Imaging Procedure'
    end
    object lblAvailMod: TLabel
      Left = 0
      Top = 170
      Width = 88
      Height = 13
      Caption = 'Available Modifiers'
    end
    object lblImType: TLabel
      Left = 1
      Top = 1
      Width = 64
      Height = 13
      Caption = 'Imaging Type'
    end
    object lblSelectMod: TLabel
      Left = 109
      Top = 170
      Width = 87
      Height = 13
      Caption = 'Selected Modifiers'
    end
    object cboImType: TORComboBox
      Left = 0
      Top = 15
      Width = 212
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Imaging Type'
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
      TabOrder = 0
      OnChange = cboImTypeChange
      OnDropDownClose = cboImTypeDropDownClose
      OnExit = cboImTypeExit
      CharsNeedMatch = 1
    end
    object lstSelectMod: TORListBox
      Left = 109
      Top = 184
      Width = 102
      Height = 68
      ExtendedSelect = False
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Caption = 'Selected Modifiers'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object cboProcedure: TORComboBox
      Left = 0
      Top = 53
      Width = 212
      Height = 114
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Imaging Procedure'
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
      TabOrder = 1
      OnClick = cboProcedureSelect
      OnExit = cboProcedureExit
      OnNeedData = cboProcedureNeedData
      CharsNeedMatch = 1
    end
    object cboAvailMod: TORComboBox
      Left = 0
      Top = 184
      Width = 102
      Height = 94
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Available Modifiers'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
      LongList = False
      LookupPiece = 0
      MaxLength = 0
      ParentShowHint = False
      Pieces = '2'
      ShowHint = True
      Sorted = True
      SynonymChars = '<>'
      TabOrder = 2
      OnKeyDown = cboAvailModKeyDown
      OnMouseClick = cboAvailModMouseClick
      CharsNeedMatch = 1
    end
    object cmdRemove: TButton
      Left = 110
      Top = 255
      Width = 102
      Height = 18
      Caption = 'Remove'
      TabOrder = 4
      OnClick = cmdRemoveClick
    end
  end
  object pnlRight: TORAutoPanel [3]
    Left = 214
    Top = 85
    Width = 355
    Height = 195
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 3
    object lblRequestDate: TLabel
      Left = 4
      Top = 5
      Width = 78
      Height = 13
      Caption = 'Requested Date'
    end
    object lblUrgency: TLabel
      Left = 104
      Top = 5
      Width = 40
      Height = 13
      Caption = 'Urgency'
    end
    object lblTransport: TLabel
      Left = 204
      Top = 5
      Width = 45
      Height = 13
      Caption = 'Transport'
    end
    object lblCategory: TLabel
      Left = 4
      Top = 42
      Width = 42
      Height = 13
      Caption = 'Category'
    end
    object lblSubmit: TLabel
      Left = 154
      Top = 42
      Width = 48
      Height = 13
      Caption = 'Submit To'
    end
    object lblLastExam: TLabel
      Left = 4
      Top = 82
      Width = 134
      Height = 13
      Caption = 'Exams Over the Last 7 Days'
    end
    object lblAskSubmit: TLabel
      Left = 446
      Top = 103
      Width = 3
      Height = 13
      Visible = False
    end
    object lblPreOp: TLabel
      Left = 198
      Top = 156
      Width = 84
      Height = 13
      Caption = 'PreOp Scheduled'
    end
    object calPreOp: TORDateBox
      Left = 198
      Top = 170
      Width = 96
      Height = 21
      TabOrder = 8
      OnChange = calPreOpChange
      OnExit = calPreOpExit
      DateOnly = False
      RequireTime = False
      Caption = 'PreOp Scheduled'
    end
    object chkIsolation: TCheckBox
      Left = 198
      Top = 94
      Width = 97
      Height = 17
      Hint = 'Is patient on isolation procedures?'
      Caption = 'Isolation'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ControlChange
      OnExit = chkIsolationExit
    end
    object calRequestDate: TORDateBox
      Left = 4
      Top = 18
      Width = 92
      Height = 21
      TabOrder = 0
      Text = 'TODAY'
      OnChange = ControlChange
      DateOnly = False
      RequireTime = False
      Caption = 'Requested Date'
    end
    object cboUrgency: TORComboBox
      Left = 104
      Top = 18
      Width = 92
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
      TabOrder = 1
      OnChange = ControlChange
      CharsNeedMatch = 1
    end
    object cboTransport: TORComboBox
      Left = 204
      Top = 18
      Width = 92
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Transport'
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
      TabOrder = 2
      OnChange = ControlChange
      CharsNeedMatch = 1
    end
    object cboCategory: TORComboBox
      Left = 4
      Top = 57
      Width = 140
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Category'
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
      OnChange = cboCategoryChange
      CharsNeedMatch = 1
    end
    object chkPreOp: TCheckBox
      Left = 146
      Top = 233
      Width = 61
      Height = 17
      Caption = 'Pre-Op'
      TabOrder = 9
      Visible = False
      OnClick = ControlChange
    end
    object cboSubmit: TORComboBox
      Left = 154
      Top = 57
      Width = 142
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Submit To'
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
      TabOrder = 4
      OnChange = ControlChange
      CharsNeedMatch = 1
    end
    object lstLastExam: TORListBox
      Left = 4
      Top = 95
      Width = 187
      Height = 98
      Color = clBtnFace
      ExtendedSelect = False
      ItemHeight = 13
      MultiSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Caption = 'Exams Over the Last 7 Days'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object grpPregnant: TGroupBox
      Left = 196
      Top = 112
      Width = 158
      Height = 41
      Caption = 'Pregnant'
      TabOrder = 7
      object radPregnant: TRadioButton
        Left = 2
        Top = 17
        Width = 39
        Height = 17
        Caption = 'Yes'
        TabOrder = 0
        OnClick = ControlChange
      end
      object radPregnantNo: TRadioButton
        Left = 47
        Top = 17
        Width = 35
        Height = 17
        Caption = 'No'
        TabOrder = 1
        OnClick = ControlChange
      end
      object radPregnantUnknown: TRadioButton
        Left = 87
        Top = 16
        Width = 66
        Height = 17
        Caption = 'Unknown'
        TabOrder = 2
        OnClick = ControlChange
      end
    end
  end
  object pnlHandR: TPanel [4]
    Left = 215
    Top = 0
    Width = 353
    Height = 84
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      353
      84)
    object lblReason: TLabel
      Left = 3
      Top = 0
      Width = 125
      Height = 13
      Caption = 'History && Reason for Exam'
    end
    object memReason: TCaptionMemo
      Left = 3
      Top = 15
      Width = 346
      Height = 68
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = ControlChange
      OnExit = memReasonExit
      Caption = 'History && Reason for Exam'
    end
  end
  inherited cmdAccept: TButton
    Left = 487
    Top = 283
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  inherited cmdQuit: TButton
    Left = 488
    Top = 310
    Anchors = [akRight, akBottom]
    TabOrder = 5
  end
  inherited pnlMessage: TPanel
    Left = 13
    Top = 262
    Width = 408
    Height = 55
    TabOrder = 1
    inherited imgMessage: TImage
      Left = 10
      Top = 9
    end
    inherited memMessage: TRichEdit
      Left = 55
      Width = 344
      Height = 43
    end
  end
end
