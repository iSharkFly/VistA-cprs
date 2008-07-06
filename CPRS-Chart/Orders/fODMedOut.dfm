inherited frmODMedOut: TfrmODMedOut
  Left = 427
  Top = 145
  Height = 316
  Caption = 'Outpatient Medication Order'
  PixelsPerInch = 96
  TextHeight = 13
  object lblMedication: TLabel [0]
    Left = 6
    Top = 4
    Width = 52
    Height = 13
    Caption = 'Medication'
  end
  object lblDosage: TLabel [1]
    Left = 202
    Top = 45
    Width = 28
    Height = 13
    Caption = 'TAKE'
  end
  object lblRoute: TLabel [2]
    Left = 314
    Top = 45
    Width = 29
    Height = 13
    Caption = 'Route'
  end
  object lblSchedule: TLabel [3]
    Left = 392
    Top = 45
    Width = 45
    Height = 13
    Caption = 'Schedule'
  end
  object lblDispense: TLabel [4]
    Left = 6
    Top = 45
    Width = 70
    Height = 13
    Caption = 'Dispense Drug'
  end
  object Bevel1: TBevel [5]
    Left = 192
    Top = 0
    Width = 4
    Height = 227
  end
  object lblQuantity: TLabel [6]
    Left = 470
    Top = 45
    Width = 39
    Height = 13
    Caption = 'Quantity'
  end
  object lblPickup: TLabel [7]
    Left = 202
    Top = 142
    Width = 38
    Height = 13
    Caption = 'Pick Up'
  end
  object lblSC: TLabel [8]
    Left = 314
    Top = 142
    Width = 43
    Height = 13
    Caption = 'SC? Y/N'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblRefills: TLabel [9]
    Left = 470
    Top = 91
    Width = 28
    Height = 13
    Caption = 'Refills'
  end
  object lblComment: TLabel [10]
    Left = 202
    Top = 183
    Width = 49
    Height = 13
    Caption = 'Comments'
  end
  object lblPriority: TLabel [11]
    Left = 392
    Top = 142
    Width = 31
    Height = 13
    Caption = 'Priority'
  end
  object btnUnits: TSpeedButton [12]
    Left = 248
    Top = 61
    Width = 63
    Height = 15
    Caption = 'TABLET(S)'
    Flat = True
    Glyph.Data = {
      AE000000424DAE0000000000000076000000280000000E000000070000000100
      0400000000003800000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      330033333333333333003330333333733300330003333F87330030000033FFFF
      F30033333333333333003333333333333300}
    Layout = blGlyphRight
    NumGlyphs = 2
    Spacing = 0
    OnClick = btnUnitsClick
  end
  object lblSIG: TLabel [13]
    Left = 314
    Top = 4
    Width = 18
    Height = 13
    Caption = 'SIG'
    Visible = False
  end
  object memComplex: TMemo [14]
    Left = 202
    Top = 45
    Width = 262
    Height = 91
    Color = clBtnFace
    TabOrder = 19
    Visible = False
  end
  object txtSIG: TCaptionEdit [15]
    Left = 314
    Top = 18
    Width = 200
    Height = 21
    Color = clInfoBk
    TabOrder = 18
    Visible = False
    Caption = 'SIG'
  end
  object cboDispense: TORComboBox [16]
    Left = 6
    Top = 59
    Width = 180
    Height = 168
    Style = orcsSimple
    AutoSelect = True
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
    Pieces = '2,4,3'
    ShowHint = True
    Sorted = False
    SynonymChars = '<>'
    TabPositions = '30,33'
    TabOrder = 2
    OnChange = ControlChange
    OnExit = cboDispenseExit
    OnMouseClick = cboDispenseMouseClick
    CharsNeedMatch = 1
  end
  object cboMedication: TORComboBox [17]
    Left = 6
    Top = 18
    Width = 180
    Height = 208
    Style = orcsSimple
    AutoSelect = True
    Color = clWindow
    DropDownCount = 11
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnChange = ControlChange
    OnExit = cboMedicationSelect
    OnMouseClick = cboMedicationSelect
    OnNeedData = cboMedicationNeedData
    CharsNeedMatch = 1
  end
  inherited memOrder: TCaptionMemo
    Top = 235
    TabOrder = 15
  end
  inherited cmdAccept: TButton
    Top = 235
    TabOrder = 13
  end
  object cboRoute: TORComboBox [20]
    Left = 314
    Top = 59
    Width = 72
    Height = 77
    Style = orcsSimple
    AutoSelect = True
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
    TabOrder = 4
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object cboSchedule: TORComboBox [21]
    Left = 392
    Top = 59
    Width = 72
    Height = 77
    Style = orcsSimple
    AutoSelect = True
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 5
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object memComments: TMemo [22]
    Left = 202
    Top = 197
    Width = 311
    Height = 32
    ScrollBars = ssVertical
    TabOrder = 12
    OnChange = ControlChange
    OnEnter = memCommentsEnter
  end
  object cboPriority: TORComboBox [23]
    Left = 392
    Top = 156
    Width = 72
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
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
    TabOrder = 11
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object cboMedAlt: TORComboBox [24]
    Left = 6
    Top = 18
    Width = 180
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Color = clWindow
    DropDownCount = 11
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    Visible = False
    OnChange = ControlChange
    OnExit = cboMedicationSelect
    OnMouseClick = cboMedicationSelect
    OnNeedData = cboMedicationNeedData
    CharsNeedMatch = 1
  end
  object cboInstructions: TORComboBox [25]
    Left = 203
    Top = 59
    Width = 45
    Height = 77
    Style = orcsSimple
    AutoSelect = True
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 0
    MaxLength = 80
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 3
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object cboPickup: TORComboBox [26]
    Left = 202
    Top = 156
    Width = 106
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
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
    TabOrder = 9
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object cboSC: TORComboBox [27]
    Left = 314
    Top = 156
    Width = 72
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
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
    TabOrder = 10
    OnChange = ControlChange
    OnEnter = cboSCEnter
    CharsNeedMatch = 1
  end
  object txtQuantity: TCaptionEdit [28]
    Left = 470
    Top = 59
    Width = 44
    Height = 21
    TabOrder = 6
    OnChange = ControlChange
    OnEnter = txtQuantityEnter
    Caption = 'Quantity'
  end
  object txtRefills: TCaptionEdit [29]
    Left = 470
    Top = 105
    Width = 31
    Height = 21
    TabOrder = 7
    Text = '0'
    OnChange = ControlChange
    Caption = 'Refills'
  end
  object spnRefills: TUpDown [30]
    Left = 501
    Top = 105
    Width = 15
    Height = 21
    Associate = txtRefills
    Min = 0
    Max = 11
    Position = 0
    TabOrder = 8
    Wrap = False
  end
  object cmdComplex: TButton [31]
    Left = 202
    Top = 18
    Width = 106
    Height = 21
    Caption = 'Complex Dose...'
    TabOrder = 17
    OnClick = cmdComplexClick
  end
  inherited cmdQuit: TButton
    Top = 262
    TabOrder = 14
  end
  inherited pnlMessage: TPanel
    Left = 6
    Top = 190
    TabOrder = 16
  end
  object popUnits: TPopupMenu
    AutoHotkeys = maManual
    AutoPopup = False
    Left = 271
    Top = 76
  end
end
