inherited frmPCELex: TfrmPCELex
  Left = 639
  Top = 480
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Lookup Other Diagnosis'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSearch: TLabel
    Left = 6
    Top = 16
    Width = 98
    Height = 13
    Caption = 'Search for Diagnosis'
  end
  object lblSelect: TLabel
    Left = 6
    Top = 67
    Width = 175
    Height = 13
    Caption = 'Select from one of the following items'
    Visible = False
  end
  object txtSearch: TCaptionEdit
    Left = 6
    Top = 30
    Width = 331
    Height = 21
    TabOrder = 0
    OnChange = txtSearchChange
    Caption = 'Search for Diagnosis'
  end
  object cmdSearch: TButton
    Left = 346
    Top = 30
    Width = 75
    Height = 21
    Caption = 'Search'
    Default = True
    TabOrder = 1
    OnClick = cmdSearchClick
  end
  object cmdOK: TButton
    Left = 263
    Top = 245
    Width = 75
    Height = 22
    Caption = 'OK'
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 346
    Top = 245
    Width = 75
    Height = 22
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = cmdCancelClick
  end
  object lstSelect: TORListBox
    Left = 6
    Top = 81
    Width = 415
    Height = 156
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = lstSelectClick
    OnDblClick = lstSelectDblClick
    Caption = 'Select from one of the following items'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
  end
end
