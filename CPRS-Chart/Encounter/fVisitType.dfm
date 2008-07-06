inherited frmVisitType: TfrmVisitType
  Left = 255
  Top = 186
  Caption = 'Encounter VisitType'
  ClientWidth = 620
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblVType: TLabel [0]
    Left = 150
    Top = 6
    Width = 67
    Height = 13
    Caption = 'Section Name'
  end
  object lblSCDisplay: TLabel [1]
    Left = 6
    Top = 123
    Width = 186
    Height = 13
    Caption = 'Service Connection && Rated Disabilities'
  end
  object lblVTypeSection: TLabel [2]
    Left = 6
    Top = 6
    Width = 58
    Height = 13
    Caption = 'Type of Visit'
  end
  object lblCurrentProv: TLabel [3]
    Left = 277
    Top = 249
    Width = 165
    Height = 13
    Caption = 'Current providers for this encounter'
  end
  object lblProvider: TLabel [4]
    Left = 6
    Top = 249
    Width = 89
    Height = 13
    Caption = 'Available providers'
  end
  object lblMod: TLabel [5]
    Left = 358
    Top = 6
    Width = 42
    Height = 13
    Hint = 'Modifiers'
    Caption = 'Modifiers'
    ParentShowHint = False
    ShowHint = True
  end
  inherited btnOK: TBitBtn
    Left = 463
    Top = 377
    TabOrder = 8
  end
  inherited btnCancel: TBitBtn
    Left = 543
    Top = 377
    TabOrder = 9
  end
  object pnlMain: TPanel
    Left = 2
    Top = 19
    Width = 615
    Height = 92
    BevelOuter = bvNone
    TabOrder = 0
    object splLeft: TSplitter
      Left = 145
      Top = 0
      Width = 3
      Height = 92
      Cursor = crHSplit
      OnMoved = splLeftMoved
    end
    object splRight: TSplitter
      Left = 352
      Top = 0
      Width = 3
      Height = 92
      Cursor = crHSplit
      Align = alRight
      OnMoved = splRightMoved
    end
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 145
      Height = 92
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lstVTypeSection: TORListBox
        Tag = 10
        Left = 0
        Top = 0
        Width = 145
        Height = 92
        Align = alTop
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = lstVTypeSectionClick
        Caption = 'Type of Visit'
        ItemTipColor = clWindow
        LongList = False
        Pieces = '3'
        CheckEntireLine = True
      end
    end
    object lbxVisits: TORListBox
      Tag = 10
      Left = 148
      Top = 0
      Width = 204
      Height = 92
      Style = lbOwnerDrawFixed
      Align = alClient
      ItemHeight = 16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = lbxVisitsClick
      Caption = 'Section Name'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '3,4,5'
      TabPosInPixels = True
      CheckBoxes = True
      CheckEntireLine = True
      OnClickCheck = lbxVisitsClickCheck
    end
    object lbMods: TORListBox
      Left = 355
      Top = 0
      Width = 260
      Height = 92
      Style = lbOwnerDrawFixed
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Caption = 'Modifiers'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2,3'
      TabPosInPixels = True
      CheckBoxes = True
      CheckEntireLine = True
      OnClickCheck = lbModsClickCheck
    end
  end
  object memSCDisplay: TCaptionMemo
    Left = 6
    Top = 137
    Width = 411
    Height = 107
    Color = clBtnFace
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 1
    Caption = 'Service Connection && Rated Disabilities'
  end
  object lbProviders: TORListBox
    Left = 277
    Top = 265
    Width = 183
    Height = 126
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnDblClick = lbProvidersDblClick
    Caption = 'Current providers for this encounter'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    OnChange = lbProvidersChange
    CheckEntireLine = True
  end
  object cboPtProvider: TORComboBox
    Left = 6
    Top = 265
    Width = 183
    Height = 126
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Available providers'
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
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 3
    TabStop = True
    CheckEntireLine = True
    OnChange = cboPtProviderChange
    OnDblClick = cboPtProviderDblClick
    OnNeedData = cboPtProviderNeedData
  end
  object btnAdd: TButton
    Left = 196
    Top = 275
    Width = 75
    Height = 21
    Caption = 'Add'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 196
    Top = 307
    Width = 75
    Height = 21
    Caption = 'Remove'
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object btnPrimary: TButton
    Left = 196
    Top = 355
    Width = 75
    Height = 21
    Caption = 'Primary'
    TabOrder = 6
    OnClick = btnPrimaryClick
  end
  inline fraVisitRelated: TfraVisitRelated
    Left = 426
    Top = 112
    Width = 192
    Height = 137
    TabOrder = 2
  end
end
