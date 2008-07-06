inherited frmUnflagOrder: TfrmUnflagOrder
  Left = 365
  Top = 389
  Height = 230
  Caption = 'Unflag Order'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 123
    Width = 90
    Height = 13
    Caption = 'Comment (optional)'
  end
  object txtComment: TCaptionEdit
    Left = 8
    Top = 137
    Width = 411
    Height = 21
    MaxLength = 80
    TabOrder = 0
    Caption = 'Comment (optional)'
  end
  object cmdOK: TButton
    Left = 267
    Top = 174
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 347
    Top = 174
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object memReason: TMemo
    Left = 8
    Top = 80
    Width = 411
    Height = 35
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
    WantReturns = False
  end
  object memOrder: TMemo
    Left = 8
    Top = 8
    Width = 411
    Height = 56
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
    WantReturns = False
  end
end
