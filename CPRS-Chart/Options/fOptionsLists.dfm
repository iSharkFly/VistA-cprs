object frmOptionsLists: TfrmOptionsLists
  Left = 354
  Top = 178
  HelpContext = 9070
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Personal Lists'
  ClientHeight = 387
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
    Width = 42
    Height = 13
    Caption = 'Provider:'
  end
  object lblPatientsAdd: TLabel
    Left = 7
    Top = 200
    Width = 74
    Height = 13
    Caption = 'Patients to add:'
  end
  object lblPersonalPatientList: TLabel
    Left = 248
    Top = 200
    Width = 114
    Height = 13
    Caption = 'Patients on personal list:'
  end
  object lblPersonalLists: TLabel
    Left = 248
    Top = 97
    Width = 68
    Height = 13
    Caption = 'Personal Lists:'
  end
  object lblInfo: TMemo
    Left = 199
    Top = 24
    Width = 186
    Height = 65
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'You can change your personal lists by '
      'adding or removing patients.')
    ReadOnly = True
    TabOrder = 13
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 354
    Width = 407
    Height = 33
    HelpContext = 9070
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 12
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
  object lstAddBy: TORComboBox
    Left = 7
    Top = 112
    Width = 153
    Height = 81
    HelpContext = 9072
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Provider:'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    OnClick = lstAddByClick
    OnKeyPress = lstAddByKeyPress
    OnNeedData = lstAddByNeedData
  end
  object btnPersonalPatientRA: TButton
    Left = 166
    Top = 296
    Width = 75
    Height = 22
    HelpContext = 9079
    Caption = 'Remove All'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnPersonalPatientRAClick
  end
  object btnPersonalPatientR: TButton
    Left = 166
    Top = 271
    Width = 75
    Height = 22
    HelpContext = 9078
    Caption = 'Remove'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnPersonalPatientRClick
  end
  object lstListPats: TORListBox
    Left = 7
    Top = 215
    Width = 153
    Height = 134
    HelpContext = 9073
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    PopupMenu = mnuPopPatient
    ShowHint = True
    Sorted = True
    TabOrder = 5
    OnClick = lstListPatsChange
    OnDblClick = btnListAddClick
    OnMouseDown = lstListPatsMouseDown
    Caption = 'Patients to add:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    OnChange = lstListPatsChange
  end
  object lstPersonalPatients: TORListBox
    Left = 248
    Top = 215
    Width = 153
    Height = 134
    HelpContext = 9075
    ItemHeight = 13
    MultiSelect = True
    ParentShowHint = False
    PopupMenu = mnuPopPatient
    ShowHint = True
    Sorted = True
    TabOrder = 11
    OnClick = lstPersonalPatientsChange
    OnDblClick = btnPersonalPatientRClick
    OnMouseDown = lstPersonalPatientsMouseDown
    Caption = 'Patients on personal list:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    OnChange = lstPersonalPatientsChange
  end
  object btnListAddAll: TButton
    Left = 166
    Top = 241
    Width = 75
    Height = 22
    HelpContext = 9077
    Caption = 'Add All'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnListAddAllClick
  end
  object btnNewList: TButton
    Left = 166
    Top = 113
    Width = 75
    Height = 22
    HelpContext = 9081
    Caption = 'New List...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnNewListClick
  end
  object btnDeleteList: TButton
    Left = 165
    Top = 171
    Width = 75
    Height = 22
    HelpContext = 9082
    Caption = 'Delete List'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnDeleteListClick
  end
  object lstPersonalLists: TORListBox
    Left = 248
    Top = 112
    Width = 153
    Height = 81
    HelpContext = 9074
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 4
    Caption = 'Personal Lists:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
    OnChange = lstPersonalListsChange
  end
  object radAddByType: TRadioGroup
    Left = 7
    Top = 8
    Width = 153
    Height = 86
    HelpContext = 9071
    Caption = 'Select patients by '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'P&atient'
      '&Ward'
      '&Clinic'
      '&Provider'
      '&Specialty'
      '&List')
    TabOrder = 0
    OnClick = radAddByTypeClick
  end
  object btnListSaveChanges: TButton
    Left = 166
    Top = 328
    Width = 75
    Height = 22
    HelpContext = 9080
    Caption = 'Save Changes'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnListSaveChangesClick
  end
  object btnListAdd: TButton
    Left = 166
    Top = 216
    Width = 75
    Height = 22
    HelpContext = 9076
    Caption = 'Add'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnListAddClick
  end
  object mnuPopPatient: TPopupMenu
    Left = 8
    Top = 352
    object mnuPatientID: TMenuItem
      Caption = 'Patient ID...'
      OnClick = mnuPatientIDClick
    end
  end
end
