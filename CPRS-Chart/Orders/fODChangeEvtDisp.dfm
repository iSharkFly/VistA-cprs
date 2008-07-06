object frmChangeEventDisp: TfrmChangeEventDisp
  Left = 344
  Top = 230
  Width = 408
  Height = 444
  Caption = 'Change release event'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblTop: TMemo
    Left = 0
    Top = 0
    Width = 400
    Height = 37
    TabStop = False
    Align = alTop
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 37
    Width = 400
    Height = 339
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 0
    object lstCVOrders: TCaptionListBox
      Left = 1
      Top = 1
      Width = 394
      Height = 333
      Align = alClient
      ItemHeight = 13
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnDrawItem = lstCVOrdersDrawItem
      OnMeasureItem = lstCVOrdersMeasureItem
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 376
    Width = 400
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cmdOK: TButton
      Left = 230
      Top = 12
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 314
      Top = 12
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = cmdCancelClick
    end
  end
end
