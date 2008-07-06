inherited frmODMedIV: TfrmODMedIV
  Left = 587
  Top = 331
  Width = 610
  Height = 341
  Caption = 'Infusion Order'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblInfusionRate: TLabel [0]
    Left = 6
    Top = 196
    Width = 96
    Height = 13
    Caption = 'Infusion Rate (ml/hr)'
  end
  object lblPriority: TLabel [1]
    Left = 134
    Top = 196
    Width = 31
    Height = 13
    Caption = 'Priority'
  end
  object lblComponent: TLabel [2]
    Left = 214
    Top = 6
    Width = 81
    Height = 13
    Caption = 'Solution/Additive'
  end
  object lblAmount: TLabel [3]
    Left = 328
    Top = 6
    Width = 80
    Height = 13
    Caption = 'Volume/Strength'
    WordWrap = True
  end
  object lblComments: TLabel [4]
    Left = 214
    Top = 106
    Width = 49
    Height = 13
    Caption = 'Comments'
  end
  object lblLimit: TLabel [5]
    Left = 230
    Top = 196
    Width = 117
    Height = 13
    Caption = 'Duration or Total Volume'
  end
  object txtRate: TCaptionEdit [6]
    Left = 6
    Top = 210
    Width = 91
    Height = 21
    AutoSelect = False
    TabOrder = 5
    OnChange = ControlChange
    OnExit = txtRateExit
    Caption = 'Infusion Rate'
  end
  object cboPriority: TORComboBox [7]
    Left = 134
    Top = 210
    Width = 72
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Priority'
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
    TabOrder = 6
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object grdSelected: TCaptionStringGrid [8]
    Left = 214
    Top = 20
    Width = 384
    Height = 76
    ColCount = 3
    DefaultColWidth = 100
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
    ScrollBars = ssVertical
    TabOrder = 2
    OnDrawCell = grdSelectedDrawCell
    OnKeyPress = grdSelectedKeyPress
    OnMouseDown = grdSelectedMouseDown
    Caption = 'Selected Solution and Additives'
  end
  object cmdRemove: TButton [9]
    Left = 443
    Top = 99
    Width = 72
    Height = 18
    Caption = 'Remove'
    TabOrder = 3
    OnClick = cmdRemoveClick
  end
  object memComments: TCaptionMemo [10]
    Left = 214
    Top = 120
    Width = 384
    Height = 66
    Lines.Strings = (
      'memComments')
    ScrollBars = ssVertical
    TabOrder = 4
    OnChange = ControlChange
    Caption = 'Comments'
  end
  object txtSelected: TCaptionEdit [11]
    Tag = -1
    Left = 416
    Top = 44
    Width = 45
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Text = 'meq.'
    Visible = False
    OnChange = txtSelectedChange
    OnExit = txtSelectedExit
    Caption = 'Volume'
  end
  object cboSelected: TCaptionComboBox [12]
    Tag = -1
    Left = 460
    Top = 44
    Width = 53
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 1
    Visible = False
    OnChange = cboSelectedChange
    OnExit = cboSelectedExit
    Caption = 'Volume/Strength'
  end
  inherited memOrder: TCaptionMemo
    Top = 255
    Width = 475
    TabOrder = 10
  end
  inherited cmdAccept: TButton
    Left = 495
    Top = 255
    TabOrder = 8
  end
  inherited cmdQuit: TButton
    Left = 495
    Top = 282
    TabOrder = 9
  end
  inherited pnlMessage: TPanel
    Top = 237
    TabOrder = 11
  end
  object pnlXDuration: TPanel
    Left = 229
    Top = 210
    Width = 121
    Height = 21
    BevelOuter = bvNone
    TabOrder = 7
    OnEnter = pnlXDurationEnter
    DesignSize = (
      121
      21)
    object btnXDuration: TBitBtn
      Left = 69
      Top = 1
      Width = 50
      Height = 20
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'days'
      TabOrder = 1
      OnClick = btnXDurationClick
      Glyph.Data = {
        AE000000424DAE0000000000000076000000280000000E000000070000000100
        0400000000003800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        330033333333333333003330333333733300330003333F87330030000033FFFF
        F30033333333333333003333333333333300}
      Layout = blGlyphRight
      NumGlyphs = 2
      Spacing = 0
    end
    object txtXDuration: TCaptionEdit
      Left = 0
      Top = 0
      Width = 68
      Height = 21
      TabOrder = 0
      OnChange = txtXDurationChange
      OnExit = txtXDurationExit
      Caption = 'Duration'
    end
  end
  object pnlCombo: TPanel
    Left = 8
    Top = 1
    Width = 200
    Height = 185
    BevelOuter = bvNone
    TabOrder = 17
    object cboAdditive: TORComboBox
      Left = 0
      Top = 20
      Width = 200
      Height = 165
      Style = orcsSimple
      Align = alClient
      AutoSelect = True
      Caption = 'Additives'
      Color = clWindow
      DropDownCount = 11
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
      TabPositions = '20'
      TabOrder = 0
      OnExit = cboAdditiveExit
      OnMouseClick = cboAdditiveMouseClick
      OnNeedData = cboAdditiveNeedData
      CharsNeedMatch = 1
    end
    object tabFluid: TTabControl
      Left = 0
      Top = 0
      Width = 200
      Height = 20
      Align = alTop
      TabHeight = 15
      TabOrder = 1
      Tabs.Strings = (
        '   Solutions   '
        '   Additives   ')
      TabIndex = 0
      TabStop = False
      OnChange = tabFluidChange
    end
    object cboSolution: TORComboBox
      Left = 0
      Top = 20
      Width = 200
      Height = 165
      Style = orcsSimple
      Align = alClient
      AutoSelect = True
      Caption = 'Solutions'
      Color = clWindow
      DropDownCount = 11
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
      TabPositions = '20'
      TabOrder = 2
      OnExit = cboSolutionExit
      OnMouseClick = cboSolutionMouseClick
      OnNeedData = cboSolutionNeedData
      CharsNeedMatch = 1
    end
  end
  object popDuration: TPopupMenu
    AutoHotkeys = maManual
    Left = 387
    Top = 91
    object popL: TMenuItem
      Tag = 1
      Caption = 'L'
      OnClick = popDurationClick
    end
    object popML: TMenuItem
      Tag = 2
      Caption = 'ml'
      OnClick = popDurationClick
    end
    object popDays: TMenuItem
      Tag = 3
      Caption = 'days'
      OnClick = popDurationClick
    end
    object popHours: TMenuItem
      Tag = 4
      Caption = 'hours'
      OnClick = popDurationClick
    end
  end
end
