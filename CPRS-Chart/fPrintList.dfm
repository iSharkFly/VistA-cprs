inherited frmPrintList: TfrmPrintList
  Left = 364
  Top = 191
  Width = 463
  Height = 388
  Caption = 'Print Selected Items'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblListName: TLabel
    Left = 16
    Top = 8
    Width = 54
    Height = 13
    Caption = 'lblListName'
  end
  object lbIDParents: TORListBox
    Left = 9
    Top = 22
    Width = 434
    Height = 267
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabWidth = 8
    Caption = 'Select a list of notes for printing'
    ItemTipColor = clWindow
    LongList = False
    TabPositions = '30'
  end
  object cmdOK: TButton
    Left = 131
    Top = 312
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 237
    Top = 312
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = cmdCancelClick
  end
end
