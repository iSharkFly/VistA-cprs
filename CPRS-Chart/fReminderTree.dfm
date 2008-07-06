object frmReminderTree: TfrmReminderTree
  Left = 256
  Top = 220
  Width = 480
  Height = 255
  HelpContext = 11200
  BorderIcons = [biSystemMenu]
  Caption = 'Available Reminders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Menu = mmMain
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlTop'
    Constraints.MinHeight = 120
    Constraints.MinWidth = 300
    TabOrder = 0
    OnResize = pnlTopResize
    object tvRem: TORTreeView
      Tag = 999
      Left = 0
      Top = 17
      Width = 265
      Height = 192
      HideSelection = False
      Images = dmodShared.imgReminders
      Indent = 23
      ReadOnly = True
      RightClickSelect = True
      RowSelect = True
      StateImages = dmodShared.imgReminders
      TabOrder = 0
      OnAddition = tvRemAddition
      OnChange = tvRemChange
      OnClick = tvRemClick
      OnCollapsed = tvRemCollapsed
      OnDeletion = tvRemDeletion
      OnEnter = tvRemEnter
      OnExit = tvRemExit
      OnExpanded = tvRemExpanded
      OnMouseDown = tvRemMouseDown
      Caption = 'Available Reminders'
      NodePiece = 0
      OnNodeCaptioning = tvRemNodeCaptioning
    end
    object hcRem: THeaderControl
      Left = 0
      Top = 0
      Width = 472
      Height = 17
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          MaxWidth = 267
          MinWidth = 267
          Text = 'Available Reminders'
          Width = 267
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          MaxWidth = 68
          MinWidth = 68
          Text = 'Due Date'
          Width = 68
        end
        item
          ImageIndex = -1
          MaxWidth = 91
          MinWidth = 91
          Text = 'Last Occurrence'
          Width = 91
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          MaxWidth = 43
          MinWidth = 43
          Text = 'Priority'
          Width = 43
        end>
      OnSectionClick = hcRemSectionClick
    end
    object pnlTopRight: TPanel
      Left = 266
      Top = 17
      Width = 206
      Height = 192
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlTopRight'
      TabOrder = 2
      object bvlGap: TBevel
        Left = 0
        Top = 175
        Width = 206
        Height = 17
        Align = alBottom
        Shape = bsSpacer
        Visible = False
      end
      object lbRem: TORListBox
        Left = 0
        Top = 0
        Width = 206
        Height = 175
        TabStop = False
        Style = lbOwnerDrawFixed
        Align = alClient
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = lbRemClick
        OnDblClick = lbRemClick
        OnDrawItem = lbRemDrawItem
        Caption = 'Due Date, last occurance, and priority'
        ItemTipColor = clWindow
        ItemTipEnable = False
        LongList = False
        OnChange = lbRemChange
      end
    end
  end
  object mmMain: TMainMenu
    Images = dmodShared.imgReminders2
    Left = 48
    Top = 24
    object memAction: TMenuItem
      Caption = '&Action'
      OnClick = memActionClick
      object memEval: TMenuItem
        Caption = '&Evaluate Reminder'
        OnClick = memEvalClick
      end
      object memEvalCat: TMenuItem
        Caption = 'Evaluate &Category Reminders'
        OnClick = memEvalCatClick
      end
      object memEvalAll: TMenuItem
        Caption = 'Evaluate Processed &Reminders'
        OnClick = memEvalAllClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object memRefresh: TMenuItem
        Caption = 'Re&fresh Reminder Dialogs'
        OnClick = memRefreshClick
      end
      object mnuCoverSheet: TMenuItem
        Caption = 'Edit Cover Sheet Reminder &List'
        OnClick = mnuCoverSheetClick
      end
      object mnuExit: TMenuItem
        Caption = 'E&xit Available Reminders'
        ShortCut = 27
        OnClick = mnuExitClick
      end
    end
  end
end
