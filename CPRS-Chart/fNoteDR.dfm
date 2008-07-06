inherited frmNoteDelReason: TfrmNoteDelReason
  Left = 354
  Top = 218
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Reason for Deletion'
  ClientHeight = 122
  ClientWidth = 246
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInstruction: TStaticText
    Left = 12
    Top = 12
    Width = 226
    Height = 17
    Caption = 'Select the reason for deletion of this document.'
    TabOrder = 4
  end
  object cmdOK: TButton
    Left = 42
    Top = 89
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 132
    Top = 89
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = cmdCancelClick
  end
  object radPrivacy: TRadioButton
    Left = 20
    Top = 37
    Width = 77
    Height = 17
    Caption = '&Privacy Act'
    TabOrder = 1
    TabStop = True
  end
  object radAdmin: TRadioButton
    Left = 20
    Top = 60
    Width = 129
    Height = 17
    Caption = '&Administrative Action'
    TabOrder = 2
  end
end
