inherited frmDCOrders: TfrmDCOrders
  Left = 316
  Top = 226
  Width = 433
  Height = 316
  Caption = 'Discontinue / Cancel Orders'
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 425
    Height = 13
    Align = alTop
    Caption = 'The following orders will be discontinued -'
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 13
    Width = 425
    Height = 188
    Align = alClient
    TabOrder = 0
    object lstOrders: TCaptionListBox
      Left = 1
      Top = 1
      Width = 423
      Height = 186
      Style = lbOwnerDrawVariable
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnDrawItem = lstOrdersDrawItem
      OnMeasureItem = lstOrdersMeasureItem
      Caption = 'The following orders will be discontinued '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 425
    Height = 88
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      425
      88)
    object lblReason: TLabel
      Left = 1
      Top = 1
      Width = 423
      Height = 13
      Align = alTop
      Caption = 'Reason for Discontinue (select one)'
    end
    object lstReason: TORListBox
      Left = 3
      Top = 19
      Width = 218
      Height = 60
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Caption = 'Reason for Discontinue (select one)'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object cmdOK: TButton
      Left = 267
      Top = 54
      Width = 72
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 2
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 347
      Top = 54
      Width = 72
      Height = 21
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = cmdCancelClick
    end
  end
end
