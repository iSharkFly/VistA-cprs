object frmProbCmt: TfrmProbCmt
  Left = 205
  Top = 220
  Width = 411
  Height = 128
  Caption = 'Annotate a problem'
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
  object lblComment: TOROffsetLabel
    Left = 9
    Top = 10
    Width = 209
    Height = 15
    Caption = 'Enter a new comment (up to 60 characters):'
    HorzOffset = 2
    Transparent = False
    VertOffset = 2
    WordWrap = False
  end
  object edComment: TCaptionEdit
    Left = 11
    Top = 30
    Width = 386
    Height = 21
    MaxLength = 60
    TabOrder = 0
    Caption = 'Enter a new comment (up to 60 characters)'
  end
  object bbOK: TBitBtn
    Left = 115
    Top = 60
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = bbOKClick
  end
  object bbCancel: TBitBtn
    Left = 200
    Top = 60
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = bbCancelClick
    NumGlyphs = 2
  end
end
