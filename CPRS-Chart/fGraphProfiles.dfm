object frmGraphProfiles: TfrmGraphProfiles
  Left = 721
  Top = 528
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Select Items and Define Views'
  ClientHeight = 379
  ClientWidth = 477
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
  PixelsPerInch = 96
  TextHeight = 13
  object lblSource: TLabel
    Left = 8
    Top = 29
    Width = 37
    Height = 13
    Hint = 'These are the different types of data for graphing.'
    Caption = 'Source:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblSelection: TLabel
    Left = 142
    Top = 29
    Width = 28
    Height = 13
    Hint = 'Make selections move them to the right.'
    Caption = 'Items:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblDisplay: TLabel
    Left = 312
    Top = 29
    Width = 89
    Height = 13
    Hint = 
      'These items can be saved as a View and/or displayed on the graph' +
      '.'
    Caption = 'Items for Graphing:'
    ParentShowHint = False
    ShowHint = False
  end
  object bvlBase: TBevel
    Left = 8
    Top = 339
    Width = 457
    Height = 2
  end
  object lblEditInfo: TLabel
    Left = 132
    Top = 278
    Width = 202
    Height = 13
    Caption = 'Items for Graphing can be saved as Views.'
  end
  object lblSelectionInfo: TLabel
    Left = 42
    Top = 8
    Width = 89
    Height = 13
    Caption = 'Select Items using:'
    ParentShowHint = False
    ShowHint = False
  end
  object lblSelectandDefine: TLabel
    Left = 8
    Top = 350
    Width = 359
    Height = 13
    Caption = 
      'Use Select/Define button or Right-click on graphs to select item' +
      's for display.'
    WordWrap = True
  end
  object lblEditInfo1: TLabel
    Left = 132
    Top = 294
    Width = 187
    Height = 13
    Caption = 'Edit Views by saving to the same name.'
  end
  object btnClear: TButton
    Left = 8
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Clear Selections'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    OnClick = btnClearClick
  end
  object btnSave: TButton
    Left = 286
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Save Personal...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object btnDelete: TButton
    Left = 100
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Delete...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnClick = btnDeleteClick
  end
  object btnRemoveOne: TButton
    Left = 280
    Top = 173
    Width = 21
    Height = 21
    Caption = '<'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnClick = btnRemoveOneClick
  end
  object btnRemoveAll: TButton
    Left = 280
    Top = 205
    Width = 21
    Height = 21
    Caption = '<<'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnClick = btnRemoveAllClick
  end
  object lstSource: TORListBox
    Left = 8
    Top = 44
    Width = 120
    Height = 225
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnDblClick = lstSourceDblClick
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    OnChange = lstSourceChange
  end
  object lstItemsDisplayed: TORListBox
    Left = 312
    Top = 44
    Width = 150
    Height = 225
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    Sorted = True
    TabOrder = 3
    OnDblClick = lstItemsDisplayedDblClick
    ItemTipColor = clWindow
    LongList = False
    Pieces = '3'
    OnChange = lstItemsDisplayedChange
  end
  object pnlSource: TPanel
    Left = 147
    Top = 1
    Width = 190
    Height = 25
    BevelOuter = bvNone
    TabOrder = 11
    object radSourcePat: TRadioButton
      Left = 87
      Top = 6
      Width = 82
      Height = 17
      Hint = 
        'Use this for selecting patient items. Note: this form is used pr' +
        'imarily for defining views, #13 not selecting data.'
      Caption = 'Patient Items'
      TabOrder = 1
      OnClick = radSourceAllClick
    end
    object radSourceAll: TRadioButton
      Left = 0
      Top = 6
      Width = 60
      Height = 17
      Hint = 'Use this for defining views. It shows every possible item.'
      Caption = 'All Items'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = radSourceAllClick
    end
  end
  object lstItemsTopSelection: TORListBox
    Left = 142
    Top = 44
    Width = 120
    Height = 225
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = False
    Sorted = True
    TabOrder = 2
    Visible = False
    OnDblClick = cboAllItemsClick
    ItemTipColor = clWindow
    LongList = False
    Pieces = '3'
    OnChange = cboAllItemsChange
  end
  object pnlTempData: TPanel
    Left = 16
    Top = 230
    Width = 425
    Height = 49
    TabOrder = 14
    Visible = False
    object lblSave: TLabel
      Left = 184
      Top = 16
      Width = 3
      Height = 13
      Visible = False
    end
    object lblClose: TLabel
      Left = 192
      Top = 0
      Width = 3
      Height = 13
      Visible = False
    end
    object lstActualItems: TORListBox
      Left = 8
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ItemTipColor = clWindow
      LongList = False
    end
    object lstDrugClass: TListBox
      Left = 112
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      TabOrder = 1
    end
    object lstScratch: TListBox
      Left = 216
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      TabOrder = 2
    end
    object lstTests: TListBox
      Left = 320
      Top = 5
      Width = 97
      Height = 41
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object pnlApply: TPanel
    Left = 0
    Top = 344
    Width = 377
    Height = 36
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = False
    TabOrder = 15
    object lblApply: TLabel
      Left = 8
      Top = 2
      Width = 138
      Height = 13
      Caption = 'Display Items for Graphing to:'
    end
    object radTop: TRadioButton
      Left = 8
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Top'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object radBottom: TRadioButton
      Left = 74
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Bottom'
      TabOrder = 1
    end
    object radBoth: TRadioButton
      Left = 141
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Both'
      TabOrder = 2
    end
    object radNeither: TRadioButton
      Left = 208
      Top = 17
      Width = 81
      Height = 17
      Caption = 'No Change'
      TabOrder = 3
    end
  end
  object btnAdd: TButton
    Left = 280
    Top = 125
    Width = 21
    Height = 21
    Caption = '>'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    OnClick = cboAllItemsClick
  end
  object btnAddAll: TButton
    Left = 280
    Top = 93
    Width = 21
    Height = 21
    Caption = '>>'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnClick = cboAllItemsClick
  end
  object btnRename: TButton
    Left = 193
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Rename...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
    OnClick = btnRenameClick
  end
  object btnSavePublic: TButton
    Left = 379
    Top = 312
    Width = 85
    Height = 21
    Caption = 'Save Public...'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 13
    OnClick = btnSaveClick
  end
  object cboAllItems: TORComboBox
    Left = 142
    Top = 44
    Width = 123
    Height = 225
    Style = orcsSimple
    AutoSelect = True
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 0
    MaxLength = 0
    ParentShowHint = False
    Pieces = '3'
    ShowHint = False
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    OnChange = cboAllItemsChange
    OnDblClick = cboAllItemsClick
    OnNeedData = cboAllItemsNeedData
    CharsNeedMatch = 1
  end
  object btnClose: TButton
    Left = 371
    Top = 353
    Width = 97
    Height = 21
    Cancel = True
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 16
    OnClick = btnCloseClick
  end
end
