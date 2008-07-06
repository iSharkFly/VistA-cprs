object frmOrdersReleaseEvent: TfrmOrdersReleaseEvent
  Left = 410
  Top = 145
  Width = 494
  Height = 488
  Caption = 'Release to Service'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblRelease: TLabel
    Left = 0
    Top = 0
    Width = 486
    Height = 13
    Align = alTop
    Layout = tlCenter
    WordWrap = True
  end
  object pnlMiddle: TPanel
    Left = 0
    Top = 13
    Width = 486
    Height = 413
    Align = alClient
    TabOrder = 0
    object cklstOrders: TCaptionCheckListBox
      Left = 1
      Top = 1
      Width = 484
      Height = 411
      Align = alClient
      ItemHeight = 16
      ParentShowHint = False
      ShowHint = True
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnDrawItem = cklstOrdersDrawItem
      OnMeasureItem = cklstOrdersMeasureItem
      OnMouseMove = cklstOrdersMouseMove
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 426
    Width = 486
    Height = 35
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      486
      35)
    object btnOK: TButton
      Left = 324
      Top = 8
      Width = 69
      Height = 20
      Anchors = [akTop, akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 404
      Top = 8
      Width = 69
      Height = 20
      Anchors = [akTop, akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
