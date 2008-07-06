inherited frmOMVerify: TfrmOMVerify
  Left = 328
  Top = 243
  Width = 587
  Height = 208
  BorderIcons = []
  Caption = 'New Order'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cmdAccept: TButton
    Left = 165
    Top = 154
    Width = 72
    Height = 21
    Caption = 'Accept'
    Default = True
    TabOrder = 0
    OnClick = cmdAcceptClick
  end
  object cmdEdit: TButton
    Left = 253
    Top = 154
    Width = 72
    Height = 21
    Caption = 'Edit'
    TabOrder = 1
    OnClick = cmdEditClick
  end
  object cmdCancel: TButton
    Left = 341
    Top = 154
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object memText: TRichEdit
    Left = 6
    Top = 6
    Width = 567
    Height = 132
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      
        '1234567890123456789012345678901234567890123456789012345678901234' +
        '5678901234567890'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    WantTabs = True
    WordWrap = False
    OnKeyUp = memTextKeyUp
  end
end
