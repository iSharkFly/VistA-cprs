object frmRemVisitInfo: TfrmRemVisitInfo
  Left = 192
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Other Visit Information'
  ClientHeight = 187
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    303
    187)
  PixelsPerInch = 96
  TextHeight = 13
  object lblVital: TLabel
    Left = 3
    Top = 6
    Width = 111
    Height = 13
    Caption = 'Vital Entry Date && Time:'
  end
  inline fraVisitRelated: TfraVisitRelated
    Left = 109
    Top = 27
    Width = 192
    Height = 136
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 145
    Top = 164
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 225
    Top = 164
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object dteVitals: TORDateBox
    Tag = 11
    Left = 119
    Top = 2
    Width = 133
    Height = 21
    TabOrder = 0
    DateOnly = False
    RequireTime = True
    Caption = 'Vital Entry Date && Time:'
  end
  object btnNow: TButton
    Left = 256
    Top = 2
    Width = 43
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'NOW'
    TabOrder = 1
    OnClick = btnNowClick
  end
end
