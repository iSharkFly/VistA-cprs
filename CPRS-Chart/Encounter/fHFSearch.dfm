inherited frmHFSearch: TfrmHFSearch
  Left = 286
  Top = 248
  Width = 363
  Height = 417
  Caption = 'Other Health Factors'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splMain: TSplitter
    Left = 0
    Top = 131
    Width = 355
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object lblCat: TLabel
    Left = 0
    Top = 0
    Width = 355
    Height = 13
    Align = alTop
    Caption = 'Category:'
  end
  object cbxSearch: TORComboBox
    Left = 0
    Top = 13
    Width = 355
    Height = 118
    Style = orcsSimple
    Align = alTop
    AutoSelect = True
    Caption = 'Category'
    Color = clWindow
    DropDownCount = 7
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    TabStop = True
    OnChange = cbxSearchChange
    OnDblClick = tvSearchDblClick
  end
  object tvSearch: TORTreeView
    Left = 0
    Top = 134
    Width = 355
    Height = 229
    Align = alClient
    HideSelection = False
    Indent = 23
    ReadOnly = True
    StateImages = dmodShared.imgTemplates
    TabOrder = 1
    OnChange = tvSearchChange
    OnCollapsed = tvSearchGetImageIndex
    OnDblClick = tvSearchDblClick
    OnExpanded = tvSearchGetImageIndex
    OnGetImageIndex = tvSearchGetImageIndex
    OnGetSelectedIndex = tvSearchGetImageIndex
    Caption = 'Other Health Factors'
    NodePiece = 2
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 363
    Width = 355
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnOK: TButton
      Left = 196
      Top = 4
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '&OK'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 276
      Top = 4
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
