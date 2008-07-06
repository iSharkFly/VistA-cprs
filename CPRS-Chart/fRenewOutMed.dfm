inherited frmRenewOutMed: TfrmRenewOutMed
  Left = 334
  Top = 436
  Width = 364
  Height = 227
  Caption = 'Change Refills for Outpatient Medication'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memOrder: TCaptionMemo
    Left = 0
    Top = 0
    Width = 356
    Height = 88
    Align = alClient
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    Caption = 'Order'
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 152
    Width = 356
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      356
      41)
    object cmdOK: TButton
      Left = 173
      Top = 7
      Width = 72
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 248
      Top = 7
      Width = 103
      Height = 27
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = cmdCancelClick
    end
  end
  object pnlMiddle: TPanel
    Left = 0
    Top = 88
    Width = 356
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object lblPickup: TLabel
      Left = 100
      Top = 7
      Width = 38
      Height = 13
      Caption = 'Pick Up'
    end
    object lblRefills: TLabel
      Left = 8
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Refills'
    end
    object cboPickup: TORComboBox
      Left = 100
      Top = 31
      Width = 125
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Pick Up'
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
      CharsNeedMatch = 1
    end
    object txtRefills: TCaptionEdit
      Left = 8
      Top = 31
      Width = 49
      Height = 21
      TabOrder = 1
      Caption = 'Refills'
    end
  end
end
