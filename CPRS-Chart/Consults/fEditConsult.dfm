object frmEditCslt: TfrmEditCslt
  Tag = 110
  Left = 409
  Top = 225
  Width = 569
  Height = 367
  HorzScrollBar.Range = 561
  VertScrollBar.Range = 340
  AutoScroll = False
  Caption = 'Edit/Resubmit a Cancelled Consult'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  DesignSize = (
    561
    340)
  PixelsPerInch = 96
  TextHeight = 13
  object lblService: TLabel
    Left = 4
    Top = 4
    Width = 134
    Height = 13
    Caption = 'Consult to Service/Specialty'
  end
  object lblReason: TLabel
    Left = 4
    Top = 166
    Width = 90
    Height = 13
    Caption = 'Reason for Consult'
  end
  object lblComment: TLabel
    Left = 4
    Top = 105
    Width = 77
    Height = 13
    Caption = 'New Comments:'
  end
  object lblComments: TLabel
    Left = 4
    Top = 51
    Width = 89
    Height = 13
    Caption = 'Display Comments:'
  end
  object lblUrgency: TStaticText
    Left = 196
    Top = 4
    Width = 44
    Height = 17
    Caption = 'Urgency'
    TabOrder = 16
  end
  object lblPlace: TStaticText
    Left = 376
    Top = 41
    Width = 104
    Height = 17
    Caption = 'Place of Consultation'
    TabOrder = 17
  end
  object lblAttn: TStaticText
    Left = 376
    Top = 4
    Width = 46
    Height = 17
    Caption = 'Attention'
    TabOrder = 18
  end
  object lblProvDiag: TStaticText
    Left = 195
    Top = 82
    Width = 104
    Height = 17
    Caption = 'Provisional Diagnosis'
    TabOrder = 19
  end
  object lblInpOutp: TStaticText
    Left = 197
    Top = 47
    Width = 127
    Height = 17
    Caption = 'Patient will be seen as an:'
    TabOrder = 20
  end
  object memReason: TRichEdit
    Left = 4
    Top = 179
    Width = 552
    Height = 129
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    PopupMenu = popReason
    ScrollBars = ssBoth
    TabOrder = 11
    WantTabs = True
    OnChange = ControlChange
    OnExit = memReasonExit
    OnKeyDown = memCommentKeyDown
    OnKeyPress = memCommentKeyPress
    OnKeyUp = memCommentKeyUp
  end
  object pnlMessage: TPanel
    Left = 21
    Top = 292
    Width = 381
    Height = 44
    Anchors = [akLeft, akRight, akBottom]
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Caption = 'pnlMessage'
    TabOrder = 15
    Visible = False
    object imgMessage: TImage
      Left = 4
      Top = 4
      Width = 32
      Height = 32
    end
    object memMessage: TRichEdit
      Left = 37
      Top = 4
      Width = 332
      Height = 32
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      WantReturns = False
    end
  end
  object cboService: TORComboBox
    Left = 4
    Top = 19
    Width = 180
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Consult to Service/Specialty'
    Color = clWindow
    DropDownCount = 8
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    ParentFont = False
    Pieces = '2'
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 0
    CharsNeedMatch = 1
  end
  object cboUrgency: TORComboBox
    Left = 196
    Top = 19
    Width = 170
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Urgency'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object radInpatient: TRadioButton
    Left = 197
    Top = 61
    Width = 61
    Height = 17
    Caption = '&Inpatient'
    TabOrder = 5
    OnClick = radInpatientClick
  end
  object radOutpatient: TRadioButton
    Left = 269
    Top = 61
    Width = 73
    Height = 17
    Caption = '&Outpatient'
    TabOrder = 6
    OnClick = radOutpatientClick
  end
  object cboPlace: TORComboBox
    Left = 376
    Top = 54
    Width = 179
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Place of Consultation'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 7
    OnChange = ControlChange
    CharsNeedMatch = 1
  end
  object txtProvDiag: TCaptionEdit
    Left = 195
    Top = 95
    Width = 309
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 180
    ParentShowHint = False
    PopupMenu = mnuPopProvDx
    ShowHint = True
    TabOrder = 8
    OnChange = ControlChange
    Caption = 'Provisional Diagnosis'
  end
  object txtAttn: TORComboBox
    Left = 376
    Top = 19
    Width = 181
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Attention'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 2
    MaxLength = 0
    Pieces = '2,3'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 2
    OnChange = ControlChange
    OnNeedData = txtAttnNeedData
    CharsNeedMatch = 1
  end
  object cboCategory: TORComboBox
    Left = 561
    Top = 103
    Width = 10
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 14
    Visible = False
    CharsNeedMatch = 1
  end
  object cmdAccept: TButton
    Left = 407
    Top = 313
    Width = 72
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Resubmit'
    TabOrder = 12
    OnClick = cmdAcceptClick
  end
  object cmdQuit: TButton
    Left = 484
    Top = 313
    Width = 72
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 13
    OnClick = cmdQuitClick
  end
  object memComment: TRichEdit
    Left = 4
    Top = 121
    Width = 550
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    PopupMenu = popReason
    TabOrder = 10
    WantTabs = True
    OnChange = ControlChange
    OnKeyDown = memCommentKeyDown
    OnKeyPress = memCommentKeyPress
    OnKeyUp = memCommentKeyUp
  end
  object btnCmtCancel: TButton
    Left = 110
    Top = 49
    Width = 75
    Height = 21
    Caption = 'Cancellation'
    TabOrder = 3
    OnClick = btnCmtCancelClick
  end
  object btnCmtOther: TButton
    Left = 110
    Top = 75
    Width = 75
    Height = 21
    Caption = 'Other'
    TabOrder = 4
    OnClick = btnCmtOtherClick
  end
  object cmdLexSearch: TButton
    Left = 508
    Top = 95
    Width = 46
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'Lexicon'
    TabOrder = 9
    OnClick = cmdLexSearchClick
  end
  object mnuPopProvDx: TPopupMenu
    Left = 353
    Top = 77
    object mnuPopProvDxDelete: TMenuItem
      Caption = 'Delete diagnosis'
      OnClick = mnuPopProvDxDeleteClick
    end
  end
  object popReason: TPopupMenu
    OnPopup = popReasonPopup
    Left = 411
    Top = 169
    object popReasonCut: TMenuItem
      Caption = 'Cu&t'
      ShortCut = 16472
      OnClick = popReasonCutClick
    end
    object popReasonCopy: TMenuItem
      Caption = '&Copy'
      ShortCut = 16451
      OnClick = popReasonCopyClick
    end
    object popReasonPaste: TMenuItem
      Caption = '&Paste'
      ShortCut = 16470
      OnClick = popReasonPasteClick
    end
    object popReasonPaste2: TMenuItem
      Caption = 'Paste2'
      ShortCut = 8237
      Visible = False
      OnClick = popReasonPasteClick
    end
    object popReasonReformat: TMenuItem
      Caption = 'Reformat Paragraph'
      ShortCut = 16466
      OnClick = popReasonReformatClick
    end
  end
end
