object frmOptionsNotes: TfrmOptionsNotes
  Left = 360
  Top = 264
  HelpContext = 9210
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Notes'
  ClientHeight = 150
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'CPRSWT.HLP'
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblAutoSave1: TLabel
    Left = 9
    Top = 14
    Width = 97
    Height = 13
    Caption = 'Interval for autosave'
  end
  object lblCosigner: TLabel
    Left = 9
    Top = 75
    Width = 80
    Height = 13
    Caption = 'Default cosigner:'
  end
  object lblAutoSave2: TLabel
    Left = 9
    Top = 28
    Width = 67
    Height = 13
    Caption = 'of notes (sec):'
  end
  object txtAutoSave: TCaptionEdit
    Left = 9
    Top = 42
    Width = 42
    Height = 21
    HelpContext = 9213
    TabOrder = 0
    Text = '5'
    OnChange = txtAutoSaveChange
    OnExit = txtAutoSaveExit
    OnKeyPress = txtAutoSaveKeyPress
  end
  object spnAutoSave: TUpDown
    Left = 51
    Top = 42
    Width = 15
    Height = 21
    HelpContext = 9213
    Associate = txtAutoSave
    Min = 0
    Max = 10000
    Increment = 5
    Position = 5
    TabOrder = 1
    Thousands = False
    Wrap = False
    OnClick = spnAutoSaveClick
  end
  object chkVerifyNote: TCheckBox
    Left = 177
    Top = 59
    Width = 169
    Height = 17
    HelpContext = 9214
    Caption = 'Verify note title'
    TabOrder = 3
  end
  object chkAskSubject: TCheckBox
    Left = 177
    Top = 30
    Width = 217
    Height = 17
    HelpContext = 9215
    Caption = 'Ask subject for progress notes'
    TabOrder = 2
  end
  object cboCosigner: TORComboBox
    Left = 9
    Top = 88
    Width = 297
    Height = 21
    HelpContext = 9216
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Default cosigner'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    LookupPiece = 2
    MaxLength = 0
    Pieces = '2,3'
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 4
    OnExit = cboCosignerExit
    OnNeedData = cboCosignerNeedData
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 117
    Width = 399
    Height = 33
    HelpContext = 9110
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 5
    object bvlBottom: TBevel
      Left = 0
      Top = 0
      Width = 399
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 240
      Top = 7
      Width = 75
      Height = 22
      HelpContext = 9996
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 321
      Top = 7
      Width = 75
      Height = 22
      HelpContext = 9997
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
