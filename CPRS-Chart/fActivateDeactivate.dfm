object frmActivateDeactive: TfrmActivateDeactive
  Left = 491
  Top = 376
  AutoScroll = False
  BorderIcons = []
  Caption = 'Renew Order'
  ClientHeight = 185
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    353
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object TActivate: TButton
    Left = 143
    Top = 160
    Width = 56
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'No'
    TabOrder = 2
    OnClick = TActivateClick
  end
  object TDeactive: TButton
    Left = 63
    Top = 160
    Width = 56
    Height = 25
    Caption = 'Yes'
    TabOrder = 1
    OnClick = TDeactiveClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 345
    Height = 145
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object TCancel: TButton
    Left = 225
    Top = 160
    Width = 56
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = TCancelClick
  end
end
