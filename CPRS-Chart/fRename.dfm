inherited frmRename: TfrmRename
  Left = 376
  Top = 317
  Width = 324
  Height = 136
  Caption = 'Rename'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblRename: TLabel
    Left = 8
    Top = 20
    Width = 63
    Height = 13
    Caption = 'Rename Item'
  end
  object txtName: TCaptionEdit
    Left = 8
    Top = 34
    Width = 300
    Height = 21
    TabOrder = 0
    Caption = 'Rename Item'
  end
  object cmdOK: TButton
    Left = 156
    Top = 80
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 236
    Top = 80
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
end
