inherited frmWardComments: TfrmWardComments
  Left = 334
  Top = 234
  Height = 289
  Caption = 'Comments for Order'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 52
    Height = 13
    Caption = 'Comments:'
  end
  object cmdOK: TButton
    Left = 267
    Top = 233
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 347
    Top = 233
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object memOrder: TMemo
    Left = 8
    Top = 8
    Width = 411
    Height = 56
    TabStop = False
    Color = clBtnFace
    Lines.Strings = (
      'memOrder')
    ReadOnly = True
    TabOrder = 3
    WantReturns = False
  end
  object memComments: TRichEdit
    Left = 8
    Top = 94
    Width = 411
    Height = 123
    ScrollBars = ssVertical
    TabOrder = 0
    WantTabs = True
    OnKeyUp = memCommentsKeyUp
  end
end
