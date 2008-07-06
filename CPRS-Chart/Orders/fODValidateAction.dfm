object frmInvalidActionList: TfrmInvalidActionList
  Left = 445
  Top = 142
  Width = 534
  Height = 553
  Caption = 'Invalidated action orders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 229
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 524
      Height = 24
      Align = alTop
      AutoSize = False
      Caption = 'You can'#39't take this action on the following orders'
    end
    object lstActDeniedOrders: TCaptionListBox
      Left = 1
      Top = 52
      Width = 524
      Height = 176
      Align = alClient
      ItemHeight = 16
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnDrawItem = lstActDeniedOrdersDrawItem
      OnMeasureItem = lstActDeniedOrdersMeasureItem
      Caption = 'You can'#39't take this action on the following orders'
    end
    object hdrAction: THeaderControl
      Left = 1
      Top = 25
      Width = 524
      Height = 27
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          MinWidth = 300
          Text = 'Order'
          Width = 350
        end
        item
          ImageIndex = -1
          MinWidth = 150
          Text = 'Reason'
          Width = 150
        end>
      OnSectionResize = hdrActionSectionResize
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 229
    Width = 526
    Height = 256
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 524
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = 'The following orders will be taken action:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lstValidOrders: TCaptionListBox
      Left = 1
      Top = 41
      Width = 524
      Height = 214
      Align = alClient
      ItemHeight = 16
      Style = lbOwnerDrawVariable
      TabOrder = 0
      OnDrawItem = lstValidOrdersDrawItem
      OnMeasureItem = lstValidOrdersMeasureItem
      Caption = 'The following orders will be taken action'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 485
    Width = 526
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOK: TButton
      Left = 440
      Top = 12
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
end
