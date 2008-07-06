object frmSignItem: TfrmSignItem
  Left = 320
  Top = 440
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Electronic Signature'
  ClientHeight = 124
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblESCode: TLabel
    Left = 8
    Top = 81
    Width = 73
    Height = 13
    Caption = 'Signature Code'
  end
  object lblText: TMemo
    Left = 8
    Top = 8
    Width = 389
    Height = 65
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789')
    ReadOnly = True
    TabOrder = 3
  end
  object txtESCode: TCaptionEdit
    Left = 8
    Top = 95
    Width = 141
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    Caption = 'Signature Code'
  end
  object cmdOK: TButton
    Left = 239
    Top = 95
    Width = 72
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 325
    Top = 95
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
end
