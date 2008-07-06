inherited frmNoteIDParents: TfrmNoteIDParents
  Left = 387
  Top = 203
  Width = 454
  Height = 365
  Caption = 'Attach to Interdisciplinary Note'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSelectParent: TLabel
    Left = 5
    Top = 12
    Width = 123
    Height = 13
    Caption = 'Select a note to attach to:'
  end
  object cmdOK: TButton
    Left = 147
    Top = 306
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 237
    Top = 306
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object lstIDParents: TORListBox
    Left = 5
    Top = 31
    Width = 434
    Height = 267
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabWidth = 8
    Caption = 'Select a note to attach to:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    TabPositions = '30'
  end
end
