object frmODActive: TfrmODActive
  Left = 267
  Top = 216
  Width = 547
  Height = 350
  Caption = 'Copy active orders for selected event'
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
  object lblCaption: TLabel
    Left = 0
    Top = 0
    Width = 539
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = '  Highlight orders to be copied to delayed release event'
    Layout = tlCenter
    WordWrap = True
  end
  object pnlClient: TPanel
    Left = 0
    Top = 29
    Width = 539
    Height = 293
    Align = alClient
    BevelOuter = bvNone
    Locked = True
    TabOrder = 0
    DesignSize = (
      539
      293)
    object btnOK: TButton
      Left = 386
      Top = 270
      Width = 57
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 458
      Top = 270
      Width = 57
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object lstActiveOrders: TCaptionListBox
      Left = 0
      Top = 21
      Width = 539
      Height = 242
      Style = lbOwnerDrawVariable
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 16
      MultiSelect = True
      TabOrder = 1
      OnDblClick = btnOKClick
      OnDrawItem = lstActiveOrdersDrawItem
      OnMeasureItem = lstActiveOrdersMeasureItem
      Caption = '  Copy selected active orders to the release event'
    end
    object hdControl: THeaderControl
      Left = 0
      Top = 0
      Width = 539
      Height = 21
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          MinWidth = 50
          Text = 'Service'
          Width = 100
        end
        item
          ImageIndex = -1
          MinWidth = 200
          Text = 'Orders'
          Width = 280
        end
        item
          ImageIndex = -1
          MinWidth = 50
          Text = 'Start / Stop'
          Width = 112
        end
        item
          ImageIndex = -1
          MinWidth = 50
          Text = 'Status'
          Width = 80
        end>
      OnSectionResize = hdControlSectionResize
    end
  end
end
