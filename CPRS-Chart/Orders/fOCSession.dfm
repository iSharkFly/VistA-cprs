inherited frmOCSession: TfrmOCSession
  Left = 365
  Top = 221
  Width = 504
  Height = 298
  BorderIcons = []
  Caption = 'Order Checks'
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lstChecks: TCaptionListBox
    Left = 0
    Top = 0
    Width = 496
    Height = 160
    Style = lbOwnerDrawVariable
    Align = alClient
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDrawItem = lstChecksDrawItem
    OnMeasureItem = lstChecksMeasureItem
    HintOnItem = True
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 160
    Width = 496
    Height = 111
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      496
      111)
    object lblJustify: TLabel
      Left = 8
      Top = 34
      Width = 248
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Enter justification for overriding critical order checks -'
    end
    object txtJustify: TCaptionEdit
      Left = 8
      Top = 50
      Width = 480
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 80
      TabOrder = 0
      OnKeyDown = txtJustifyKeyDown
      Caption = 'Enter justification for overriding critical order checks -'
    end
    object cmdCancelOrder: TButton
      Left = 356
      Top = 5
      Width = 133
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cancel Selected Order(s)'
      TabOrder = 2
      OnClick = cmdCancelOrderClick
    end
    object cmdContinue: TButton
      Left = 212
      Top = 82
      Width = 72
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Continue'
      TabOrder = 3
      OnClick = cmdContinueClick
    end
  end
end
