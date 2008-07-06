object frmGraphSettings: TfrmGraphSettings
  Left = 109
  Top = 60
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Graph Settings'
  ClientHeight = 304
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    438
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object lblMinGraphHeight: TLabel
    Left = 311
    Top = 60
    Width = 110
    Height = 13
    Caption = 'Minimum Graph Height:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblMaxGraphs: TLabel
    Left = 311
    Top = 4
    Width = 108
    Height = 13
    Caption = 'Max Graphs in Display:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblOptions: TLabel
    Left = 179
    Top = 4
    Width = 39
    Height = 13
    Caption = 'Options:'
    ParentShowHint = False
    ShowHint = False
  end
  object bvlBase: TBevel
    Left = 13
    Top = 271
    Width = 412
    Height = 2
  end
  object lblSources: TLabel
    Left = 16
    Top = 4
    Width = 91
    Height = 13
    Caption = 'Sources Displayed:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblConversions: TLabel
    Left = 311
    Top = 162
    Width = 46
    Height = 13
    Caption = 'Functions'
    ParentShowHint = False
    ShowHint = False
  end
  object lblMaxSelect: TLabel
    Left = 311
    Top = 115
    Width = 96
    Height = 13
    Caption = 'Max Items to Select:'
    ParentShowHint = False
    ShowHint = False
    WordWrap = True
  end
  object lblShow: TLabel
    Left = 196
    Top = 217
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = 'Show Defaults:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblSave: TLabel
    Left = 189
    Top = 249
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'Save as Default:'
    ParentShowHint = False
    ShowHint = False
  end
  object bvlDefaults: TBevel
    Left = 176
    Top = 205
    Width = 248
    Height = 2
  end
  object lblOptionsInfo: TLabel
    Left = 13
    Top = 281
    Width = 275
    Height = 13
    Caption = 'Settings saved as your defaults are applied to new graphs.'
    ParentShowHint = False
    ShowHint = False
    WordWrap = True
  end
  object lblMaxGraphsRef: TLabel
    Left = 374
    Top = 20
    Width = 57
    Height = 17
    AutoSize = False
    ParentShowHint = False
    ShowHint = False
  end
  object lblMinGraphHeightRef: TLabel
    Left = 374
    Top = 80
    Width = 57
    Height = 17
    AutoSize = False
    ParentShowHint = False
    ShowHint = False
  end
  object lblMaxSelectRef: TLabel
    Left = 374
    Top = 133
    Width = 57
    Height = 17
    AutoSize = False
    ParentShowHint = False
    ShowHint = False
  end
  object bvlMid: TBevel
    Left = 176
    Top = 239
    Width = 248
    Height = 2
  end
  object lstATypes: TListBox
    Left = 253
    Top = 3
    Width = 45
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 17
    Visible = False
  end
  object lstSourcesCopy: TListBox
    Left = 123
    Top = 4
    Width = 45
    Height = 16
    ItemHeight = 13
    Sorted = True
    TabOrder = 16
    Visible = False
  end
  object chklstOptions: TCheckListBox
    Left = 179
    Top = 20
    Width = 120
    Height = 179
    OnClickCheck = chklstOptionsClickCheck
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    Sorted = True
    TabOrder = 1
  end
  object txtMinGraphHeight: TEdit
    Left = 311
    Top = 78
    Width = 41
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    Text = '90'
    OnChange = txtMinGraphHeightChange
    OnExit = txtMinGraphHeightExit
    OnKeyPress = txtMinGraphHeightKeyPress
  end
  object txtMaxGraphs: TEdit
    Left = 311
    Top = 20
    Width = 41
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Text = '5'
    OnChange = txtMaxGraphsChange
    OnExit = txtMaxGraphsExit
    OnKeyPress = txtMaxGraphsKeyPress
  end
  object spnMinGraphHeight: TUpDown
    Left = 352
    Top = 78
    Width = 15
    Height = 21
    Associate = txtMinGraphHeight
    Min = 10
    Max = 1000
    ParentShowHint = False
    Position = 90
    ShowHint = False
    TabOrder = 5
    Wrap = False
    OnClick = spnMinGraphHeightClick
  end
  object spnMaxGraphs: TUpDown
    Left = 352
    Top = 20
    Width = 15
    Height = 21
    Associate = txtMaxGraphs
    Min = 1
    Max = 20
    ParentShowHint = False
    Position = 5
    ShowHint = False
    TabOrder = 3
    Wrap = False
    OnClick = spnMaxGraphsClick
  end
  object btnClose: TButton
    Left = 350
    Top = 279
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    OnClick = btnCloseClick
  end
  object lstSources: TCheckListBox
    Left = 16
    Top = 20
    Width = 153
    Height = 216
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    Sorted = True
    TabOrder = 0
  end
  object btnAll: TButton
    Left = 18
    Top = 245
    Width = 65
    Height = 21
    Caption = 'All'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnClick = btnAllClick
  end
  object brnClear: TButton
    Left = 103
    Top = 245
    Width = 65
    Height = 21
    Cancel = True
    Caption = 'Clear'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
    OnClick = btnAllClick
  end
  object btnPersonal: TButton
    Left = 277
    Top = 213
    Width = 65
    Height = 21
    Cancel = True
    Caption = 'Personal'
    TabOrder = 11
    OnClick = btnPublicClick
  end
  object cboConversions: TORComboBox
    Left = 311
    Top = 178
    Width = 116
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Color = clWindow
    DropDownCount = 8
    Items.Strings = (
      '<none>'
      'Standard Deviations'
      'Inverse Values')
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    ParentShowHint = False
    ShowHint = False
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 8
    CharsNeedMatch = 1
  end
  object txtMaxSelect: TEdit
    Left = 311
    Top = 131
    Width = 41
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    Text = '100'
    OnChange = txtMaxSelectChange
    OnExit = txtMaxSelectExit
    OnKeyPress = txtMaxSelectKeyPress
  end
  object spnMaxSelect: TUpDown
    Left = 352
    Top = 131
    Width = 15
    Height = 21
    Associate = txtMaxSelect
    Min = 1
    Max = 1000
    ParentShowHint = False
    Position = 100
    ShowHint = False
    TabOrder = 7
    Wrap = False
    OnClick = spnMaxSelectClick
  end
  object btnPublic: TButton
    Left = 360
    Top = 213
    Width = 65
    Height = 21
    Cancel = True
    Caption = 'Public'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 12
    OnClick = btnPublicClick
  end
  object btnPersonalSave: TButton
    Left = 277
    Top = 245
    Width = 65
    Height = 21
    Cancel = True
    Caption = 'Personal'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 13
    OnClick = SaveClick
  end
  object btnPublicSave: TButton
    Left = 360
    Top = 245
    Width = 65
    Height = 21
    Cancel = True
    Caption = 'Public'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 14
    OnClick = SaveClick
  end
  object lstOptions: TListBox
    Left = 368
    Top = 160
    Width = 57
    Height = 17
    ItemHeight = 13
    Items.Strings = (
      '3D^A'
      'Clear Background^B'
      'Dates^C'
      'Fixed Date Range^M'
      'Gradient^D'
      'Hints^E'
      'Legend^F'
      'Lines^G'
      'Sort by Type^H'
      'Stay on Top^I'
      'Values^J'
      'Zoom, Horizontal^K'
      'Zoom, Vertical^L')
    Sorted = True
    TabOrder = 18
    Visible = False
  end
end
