inherited frmODMedComplex: TfrmODMedComplex
  Left = 291
  Top = 307
  Width = 453
  Height = 254
  BorderIcons = []
  Caption = 'Complex Dose'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 174
    Width = 433
    Height = 2
  end
  object grdDoses: TStringGrid
    Left = 6
    Top = 6
    Width = 433
    Height = 135
    DefaultColWidth = 78
    DefaultRowHeight = 21
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goTabs]
    ScrollBars = ssVertical
    TabOrder = 4
    OnDrawCell = grdDosesDrawCell
    OnKeyPress = grdDosesKeyPress
    OnMouseDown = grdDosesMouseDown
    OnMouseUp = grdDosesMouseUp
    RowHeights = (
      21
      21
      21
      21
      21
      21)
  end
  object cmdOK: TButton
    Left = 290
    Top = 184
    Width = 72
    Height = 21
    Caption = 'OK'
    TabOrder = 5
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 368
    Top = 184
    Width = 72
    Height = 21
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = cmdCancelClick
  end
  object cboRoute: TORComboBox
    Left = 170
    Top = 200
    Width = 72
    Height = 21
    Style = orcsDropDown
    AutoSelect = False
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    Visible = False
    OnClick = cboRouteClick
    OnExit = cboRouteExit
  end
  object cboSchedule: TORComboBox
    Left = 169
    Top = 176
    Width = 72
    Height = 21
    Style = orcsDropDown
    AutoSelect = False
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 2
    Visible = False
    OnExit = cboScheduleExit
  end
  object pnlInstruct: TPanel
    Left = 6
    Top = 177
    Width = 150
    Height = 21
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    OnEnter = pnlInstructEnter
    OnExit = pnlInstructExit
    object btnUnits: TSpeedButton
      Left = 86
      Top = 1
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
    object cboInstruct: TORComboBox
      Left = -1
      Top = -1
      Width = 86
      Height = 21
      Style = orcsDropDown
      AutoSelect = False
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
      LongList = False
      MaxLength = 80
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
    end
  end
  object pnlDays: TPanel
    Left = 6
    Top = 201
    Width = 67
    Height = 21
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    OnEnter = pnlDaysEnter
    OnExit = pnlDaysExit
    object Label1: TLabel
      Left = 43
      Top = 4
      Width = 22
      Height = 13
      Caption = 'days'
    end
    object txtDays: TCaptionEdit
      Left = 0
      Top = 0
      Width = 25
      Height = 21
      AutoSelect = False
      TabOrder = 0
      Text = '0'
      OnChange = txtDaysChange
      Caption = 'days'
    end
    object UpDown2: TUpDown
      Left = 25
      Top = 0
      Width = 15
      Height = 21
      Associate = txtDays
      Min = 0
      Max = 999
      Position = 0
      TabOrder = 1
      Wrap = False
    end
  end
  object cmdInsert: TButton
    Left = 6
    Top = 149
    Width = 79
    Height = 17
    Caption = 'Insert Row'
    TabOrder = 7
    OnClick = cmdInsertClick
  end
  object cmdRemove: TButton
    Left = 92
    Top = 149
    Width = 91
    Height = 17
    Caption = 'Remove Row'
    TabOrder = 8
    OnClick = cmdRemoveClick
  end
  object popUnits: TPopupMenu
    AutoPopup = False
    Left = 109
    Top = 193
  end
end
