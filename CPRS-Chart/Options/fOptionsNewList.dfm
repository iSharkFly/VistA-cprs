object frmOptionsNewList: TfrmOptionsNewList
  Left = 863
  Top = 101
  HelpContext = 9085
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'New Personal List'
  ClientHeight = 115
  ClientWidth = 175
  Color = clBtnFace
  ParentFont = True
  HelpFile = 'CPRSWT.HLP'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnter: TLabel
    Left = 10
    Top = 8
    Width = 93
    Height = 13
    Caption = 'Enter the name of a'
  end
  object lblNew: TLabel
    Left = 10
    Top = 24
    Width = 81
    Height = 13
    Caption = 'new personal list.'
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 81
    Width = 175
    Height = 34
    HelpContext = 9085
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object btnOK: TButton
      Left = 11
      Top = 7
      Width = 75
      Height = 22
      HelpContext = 9997
      Caption = 'OK'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 91
      Top = 7
      Width = 75
      Height = 22
      HelpContext = 9996
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object txtNewList: TCaptionEdit
    Left = 10
    Top = 45
    Width = 153
    Height = 21
    HelpContext = 9086
    MaxLength = 30
    TabOrder = 0
    OnChange = txtNewListChange
    OnKeyPress = txtNewListKeyPress
    Caption = 'Enter the name of a new personal list'
  end
end
