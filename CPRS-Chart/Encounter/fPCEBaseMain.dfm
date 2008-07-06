inherited frmPCEBaseMain: TfrmPCEBaseMain
  Left = 302
  Top = 166
  Caption = 'frmPCEBaseMain'
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblSection: TLabel [0]
    Left = 6
    Top = 6
    Width = 46
    Height = 13
    Caption = 'lblSection'
  end
  object lblList: TLabel [1]
    Left = 213
    Top = 6
    Width = 67
    Height = 13
    Caption = 'Section Name'
  end
  object lblComment: TLabel [2]
    Left = 6
    Top = 328
    Width = 49
    Height = 13
    Caption = 'Comments'
  end
  object bvlMain: TBevel [3]
    Left = 0
    Top = 230
    Width = 619
    Height = 140
  end
  inherited btnOK: TBitBtn
    Left = 464
    TabOrder = 1
  end
  inherited btnCancel: TBitBtn
    Left = 544
    TabOrder = 2
  end
  inherited pnlGrid: TPanel
    Width = 475
    TabOrder = 0
    inherited lbGrid: TORListBox
      Width = 475
      MultiSelect = True
      OnClick = lbGridSelect
      OnChange = lbGridSelect
      CheckEntireLine = True
    end
    inherited hcGrid: THeaderControl
      Width = 475
    end
  end
  object edtComment: TCaptionEdit
    Left = 6
    Top = 343
    Width = 523
    Height = 21
    TabOrder = 5
    OnChange = edtCommentChange
    OnExit = edtCommentExit
    OnKeyPress = edtCommentKeyPress
    Caption = 'Comments'
  end
  object btnRemove: TButton
    Left = 536
    Top = 343
    Width = 75
    Height = 21
    Caption = 'Remove'
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object btnSelectAll: TButton
    Left = 406
    Top = 326
    Width = 75
    Height = 17
    Caption = 'Select All'
    TabOrder = 3
    TabStop = False
    OnClick = btnSelectAllClick
  end
  object pnlMain: TPanel
    Left = 6
    Top = 20
    Width = 612
    Height = 204
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 6
    object splLeft: TSplitter
      Left = 204
      Top = 0
      Width = 3
      Height = 204
      Cursor = crHSplit
      OnMoved = splLeftMoved
    end
    object lbxSection: TORListBox
      Left = 207
      Top = 0
      Width = 405
      Height = 204
      Style = lbOwnerDrawFixed
      Align = alClient
      ExtendedSelect = False
      ItemHeight = 16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = clbListClick
      OnMouseDown = clbListMouseDown
      Caption = 'Section Name'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
      TabPosInPixels = True
      CheckBoxes = True
      CheckEntireLine = True
      OnClickCheck = lbxSectionClickCheck
    end
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 204
      Height = 204
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        204
        204)
      object lbSection: TORListBox
        Left = 0
        Top = 0
        Width = 204
        Height = 174
        Align = alTop
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = lbSectionClick
        Caption = 'Section'
        ItemTipColor = clWindow
        LongList = False
        Pieces = '3'
        CheckEntireLine = True
      end
      object btnOther: TButton
        Left = 65
        Top = 178
        Width = 139
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Other'
        TabOrder = 0
        OnClick = btnOtherClick
      end
    end
  end
end
