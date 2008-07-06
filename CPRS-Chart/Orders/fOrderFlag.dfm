inherited frmFlagOrder: TfrmFlagOrder
  Left = 334
  Top = 234
  Height = 191
  Caption = 'Flag Order'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 75
    Height = 13
    Caption = 'Reason for Flag'
  end
  object lblAlertRecipient: TLabel
    Left = 8
    Top = 123
    Width = 69
    Height = 13
    Caption = 'Alert Recipient'
  end
  object txtReason: TCaptionEdit
    Left = 8
    Top = 94
    Width = 411
    Height = 21
    MaxLength = 80
    TabOrder = 0
    Caption = 'Reason for Flag'
  end
  object cmdOK: TButton
    Left = 267
    Top = 139
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 347
    Top = 139
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = cmdCancelClick
  end
  object memOrder: TMemo
    Left = 8
    Top = 8
    Width = 411
    Height = 56
    Color = clBtnFace
    Lines.Strings = (
      'memOrder')
    ReadOnly = True
    TabOrder = 4
    WantReturns = False
  end
  object cboAlertRecipient: TORComboBox
    Left = 7
    Top = 139
    Width = 226
    Height = 21
    HelpContext = 9102
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Alert Recipient'
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
    TabOrder = 1
    OnExit = cboOnExit
    OnNeedData = cboAlertRecipientNeedData
    CharsNeedMatch = 1
  end
end
