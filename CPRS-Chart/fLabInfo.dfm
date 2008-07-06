object frmLabInfo: TfrmLabInfo
  Left = 276
  Top = 256
  Width = 591
  Height = 304
  Caption = 'Lab Test Description'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 244
    Width = 583
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      583
      33)
    object btnOK: TButton
      Left = 487
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object memInfo: TCaptionMemo
    Left = 160
    Top = 0
    Width = 423
    Height = 244
    Hint = 'Laboratory Test Descriptions'
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    Caption = 'Laboratory Test Descriptions'
  end
  object cboTests: TORComboBox
    Left = 0
    Top = 0
    Width = 160
    Height = 244
    Hint = 'Select a test to view information'
    Style = orcsSimple
    Align = alLeft
    AutoSelect = True
    Caption = 'Lab Tests'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    MaxLength = 0
    ParentShowHint = False
    Pieces = '2'
    ShowHint = True
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnClick = cboTestsClick
    OnNeedData = cboTestsNeedData
  end
end
