object frmOptionsCombinations: TfrmOptionsCombinations
  Left = 366
  Top = 189
  HelpContext = 9120
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Source Combinations'
  ClientHeight = 306
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblAddby: TLabel
    Left = 7
    Top = 97
    Width = 29
    Height = 13
    Caption = 'Ward:'
  end
  object lblCombinations: TLabel
    Left = 224
    Top = 97
    Width = 66
    Height = 13
    Caption = 'Combinations:'
  end
  object lblInfo: TMemo
    Left = 183
    Top = 16
    Width = 218
    Height = 81
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'You can change your combinations by adding '
      'or removing  specific wards, clinics, providers, '
      'specialties, or lists. Patients meeting this '
      'criteria can be used for patient selection.')
    ReadOnly = True
    TabOrder = 6
  end
  object radAddByType: TRadioGroup
    Left = 7
    Top = 8
    Width = 153
    Height = 86
    HelpContext = 9121
    Caption = 'Select source by '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '&Ward'
      '&Clinic'
      '&Provider'
      '&Specialty'
      '&List')
    TabOrder = 0
    OnClick = radAddByTypeClick
  end
  object lstAddBy: TORComboBox
    Left = 7
    Top = 112
    Width = 153
    Height = 153
    HelpContext = 9122
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Ward'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Pieces = '2'
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 1
    OnChange = lstAddByChange
    OnDblClick = btnAddClick
    OnEnter = lstAddByEnter
    OnExit = lstAddByExit
    OnKeyUp = lstAddByKeyUp
    OnNeedData = lstAddByNeedData
  end
  object btnAdd: TButton
    Left = 166
    Top = 145
    Width = 50
    Height = 22
    HelpContext = 9124
    Caption = 'Add'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 165
    Top = 218
    Width = 50
    Height = 22
    HelpContext = 9125
    Caption = 'Remove'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnRemoveClick
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 273
    Width = 407
    Height = 33
    HelpContext = 9120
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 5
    object bvlBottom: TBevel
      Left = 0
      Top = 0
      Width = 407
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 245
      Top = 8
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
      Left = 325
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
  object lvwCombinations: TCaptionListView
    Left = 224
    Top = 112
    Width = 177
    Height = 150
    HelpContext = 9123
    Columns = <
      item
        Caption = 'Entry'
        Width = 100
      end
      item
        Caption = 'Source'
        Width = 72
      end>
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    SortType = stBoth
    TabOrder = 4
    ViewStyle = vsReport
    OnChange = lvwCombinationsChange
    OnColumnClick = lvwCombinationsColumnClick
    OnCompare = lvwCombinationsCompare
    OnDblClick = btnRemoveClick
    Caption = 'Combinations'
  end
end
