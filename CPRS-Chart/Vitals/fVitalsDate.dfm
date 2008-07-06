object frmVitalsDate: TfrmVitalsDate
  Left = 193
  Top = 381
  Width = 363
  Height = 87
  Caption = 'Vitals Date & Time'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 151
    Height = 13
    Caption = 'Enter Vital Entry Date and Time:'
  end
  object dteVitals: TORDateBox
    Tag = 11
    Left = 167
    Top = 8
    Width = 133
    Height = 21
    TabOrder = 0
    DateOnly = False
    RequireTime = True
    Caption = 'Enter Vital Entry Date and Time:'
  end
  object btnOK: TButton
    Left = 195
    Top = 36
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 275
    Top = 36
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object btnNow: TButton
    Left = 307
    Top = 8
    Width = 43
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'NOW'
    TabOrder = 1
    OnClick = btnNowClick
  end
end
