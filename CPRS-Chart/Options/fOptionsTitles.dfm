object frmOptionsTitles: TfrmOptionsTitles
  Left = 271
  Top = 271
  HelpContext = 9230
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Document Titles'
  ClientHeight = 237
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'CPRSWT.HLP'
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDocumentClass: TLabel
    Left = 8
    Top = 17
    Width = 79
    Height = 13
    Caption = 'Document class:'
  end
  object lblDocumentTitles: TLabel
    Left = 8
    Top = 57
    Width = 76
    Height = 13
    Caption = 'Document titles:'
  end
  object lblYourTitles: TLabel
    Left = 299
    Top = 78
    Width = 76
    Height = 13
    Caption = 'Your list of titles:'
  end
  object lblDefaultTitle: TStaticText
    Left = 299
    Top = 43
    Width = 41
    Height = 17
    Caption = 'Default:'
    TabOrder = 10
  end
  object lblDefault: TStaticText
    Left = 299
    Top = 59
    Width = 108
    Height = 17
    Caption = '<no default specified>'
    ShowAccelChar = False
    TabOrder = 11
  end
  object lblDocumentPreference: TStaticText
    Left = 199
    Top = 6
    Width = 132
    Height = 17
    Caption = 'Document List Preferences'
    TabOrder = 12
  end
  object cboDocumentClass: TORComboBox
    Left = 8
    Top = 31
    Width = 200
    Height = 21
    HelpContext = 9231
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Document class'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Pieces = '2'
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 0
    OnClick = cboDocumentClassClick
  end
  object lstYourTitles: TORListBox
    Left = 299
    Top = 93
    Width = 200
    Height = 108
    HelpContext = 9237
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = lstYourTitlesClick
    OnDblClick = btnRemoveClick
    Caption = 'Your list of titles'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    OnChange = lstYourTitlesChange
  end
  object btnAdd: TButton
    Left = 211
    Top = 93
    Width = 85
    Height = 22
    HelpContext = 9233
    Caption = 'Add'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 211
    Top = 121
    Width = 85
    Height = 22
    HelpContext = 9234
    Caption = 'Remove'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnRemoveClick
  end
  object btnDefault: TButton
    Left = 211
    Top = 178
    Width = 85
    Height = 22
    HelpContext = 9236
    Caption = 'Set as Default'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnDefaultClick
  end
  object btnSaveChanges: TButton
    Left = 211
    Top = 150
    Width = 85
    Height = 22
    HelpContext = 9235
    Caption = 'Save Changes'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSaveChangesClick
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 204
    Width = 527
    Height = 33
    HelpContext = 9110
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 9
    object bvlBottom: TBevel
      Left = 0
      Top = 0
      Width = 527
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 367
      Top = 7
      Width = 75
      Height = 22
      HelpContext = 9996
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 448
      Top = 7
      Width = 75
      Height = 22
      HelpContext = 9997
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cboDocumentTitles: TORComboBox
    Left = 8
    Top = 72
    Width = 200
    Height = 129
    HelpContext = 9232
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Document titles'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    MaxLength = 0
    Pieces = '2'
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 1
    OnChange = cboDocumentTitlesChange
    OnDblClick = btnAddClick
    OnNeedData = cboDocumentTitlesNeedData
  end
  object btnUp: TButton
    Left = 504
    Top = 110
    Width = 22
    Height = 22
    HelpContext = 9021
    Caption = '^'
    TabOrder = 7
    OnClick = btnUpClick
  end
  object btnDown: TButton
    Left = 504
    Top = 150
    Width = 22
    Height = 22
    HelpContext = 9022
    Caption = 'v'
    TabOrder = 8
    OnClick = btnDownClick
  end
end
