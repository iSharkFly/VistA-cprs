inherited frmUnholdOrders: TfrmUnholdOrders
  Left = 269
  Top = 192
  Height = 270
  Caption = 'Release Orders from Hold'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 222
    Height = 13
    Caption = 'The following orders will be released from hold -'
  end
  object lstOrders: TCaptionListBox
    Left = 8
    Top = 22
    Width = 411
    Height = 176
    ItemHeight = 13
    TabOrder = 0
    Caption = 'The following orders will be released from hold '
  end
  object cmdOK: TButton
    Left = 267
    Top = 214
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 347
    Top = 214
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
end
