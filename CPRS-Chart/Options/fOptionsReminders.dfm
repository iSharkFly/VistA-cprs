object frmOptionsReminders: TfrmOptionsReminders
  Left = 693
  Top = 17
  HelpContext = 9020
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Clinical Reminders on Cover Sheet'
  ClientHeight = 323
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'CPRSWT.HLP'
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDisplayed: TLabel
    Left = 209
    Top = 8
    Width = 129
    Height = 13
    Caption = 'Reminders being displayed:'
  end
  object lblNotDisplayed: TLabel
    Left = 8
    Top = 8
    Width = 147
    Height = 13
    Caption = 'Reminders not being displayed:'
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 290
    Width = 407
    Height = 33
    HelpContext = 9020
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 7
    object bvlBottom: TBevel
      Left = 0
      Top = 0
      Width = 407
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 247
      Top = 8
      Width = 75
      Height = 22
      HelpContext = 9996
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 327
      Top = 8
      Width = 75
      Height = 22
      HelpContext = 9997
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object lstDisplayed: TORListBox
    Left = 209
    Top = 25
    Width = 160
    Height = 217
    HelpContext = 9025
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = lstDisplayedChange
    OnDblClick = btnDeleteClick
    Caption = 'Reminders being displayed:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '3'
    OnChange = lstDisplayedChange
  end
  object lstNotDisplayed: TORListBox
    Left = 8
    Top = 25
    Width = 160
    Height = 217
    HelpContext = 9026
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 0
    OnClick = lstNotDisplayedChange
    OnDblClick = btnAddClick
    Caption = 'Reminders not being displayed:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '3'
    OnChange = lstNotDisplayedChange
  end
  object btnUp: TButton
    Left = 378
    Top = 94
    Width = 22
    Height = 22
    HelpContext = 9021
    Caption = '^'
    TabOrder = 4
    OnClick = btnUpClick
  end
  object btnDown: TButton
    Left = 378
    Top = 142
    Width = 22
    Height = 22
    HelpContext = 9022
    Caption = 'v'
    TabOrder = 6
    OnClick = btnDownClick
  end
  object btnDelete: TButton
    Left = 178
    Top = 181
    Width = 22
    Height = 22
    HelpContext = 9023
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object btnAdd: TButton
    Left = 178
    Top = 70
    Width = 22
    Height = 22
    HelpContext = 9024
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAddClick
  end
  object radSort: TRadioGroup
    Left = 209
    Top = 246
    Width = 192
    Height = 37
    Caption = 'Sort by '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      '&Display Order'
      '&Alphabetical')
    ParentFont = False
    TabOrder = 5
    OnClick = radSortClick
  end
end
