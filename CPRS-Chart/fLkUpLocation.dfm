inherited frmLkUpLocation: TfrmLkUpLocation
  Left = 377
  Top = 314
  Width = 364
  Height = 239
  Caption = 'Select Location'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblLocation: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Location'
  end
  object lblInfo: TLabel
    Left = 8
    Top = 176
    Width = 341
    Height = 28
    AutoSize = False
    WordWrap = True
  end
  object cboLocation: TORComboBox
    Left = 8
    Top = 22
    Width = 193
    Height = 143
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Location'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnNeedData = cboLocationNeedData
  end
  object cmdOK: TButton
    Left = 276
    Top = 22
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 276
    Top = 51
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
end
