object frmLabTestGroups: TfrmLabTestGroups
  Left = 337
  Top = 202
  Width = 465
  Height = 461
  Caption = 'Select Lab Tests'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLabTestGroups: TORAutoPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 434
    Align = alClient
    Caption = 'Specimen'
    TabOrder = 0
    object bvlTestGroups: TBevel
      Left = 1
      Top = 1
      Width = 455
      Height = 120
      Align = alTop
    end
    object lblTests: TLabel
      Left = 10
      Top = 124
      Width = 79
      Height = 13
      Caption = 'Laboratory Tests'
    end
    object lblList: TLabel
      Left = 284
      Top = 144
      Width = 100
      Height = 13
      Caption = 'Tests to be displayed'
    end
    object lblSpecimen: TLabel
      Left = 12
      Top = 383
      Width = 47
      Height = 13
      Caption = 'Specimen'
    end
    object lblTestGroups: TLabel
      Left = 10
      Top = 38
      Width = 58
      Height = 13
      Caption = 'Test Groups'
    end
    object lblUsers: TLabel
      Left = 164
      Top = 4
      Width = 159
      Height = 13
      Caption = 'Persons with defined Test Groups'
    end
    object lblOrder: TLabel
      Left = 182
      Top = 304
      Width = 40
      Height = 52
      Caption = 'Arrange order of tests for display.'
      WordWrap = True
    end
    object lblDefine: TLabel
      Left = 356
      Top = 4
      Width = 92
      Height = 13
      Caption = 'Define Test Groups'
    end
    object lblTestGroup: TLabel
      Left = 181
      Top = 198
      Width = 91
      Height = 39
      Caption = 'To create a New Test Group, limit selection to 7 tests.'
      WordWrap = True
    end
    object pnlUpButton: TKeyClickPanel
      Left = 235
      Top = 299
      Width = 27
      Height = 27
      BevelOuter = bvNone
      Caption = 'Display selected test earlier'
      Constraints.MaxHeight = 27
      Constraints.MaxWidth = 27
      TabOrder = 5
      TabStop = True
      OnClick = cmdUpClick
      OnEnter = pnlUpButtonEnter
      OnExit = pnlUpButtonExit
      OnResize = pnlUpButtonResize
      object cmdUp: TSpeedButton
        Left = 0
        Top = 1
        Width = 27
        Height = 25
        Caption = '^'
        Enabled = False
        OnClick = cmdUpClick
      end
    end
    object pnlDownButton: TKeyClickPanel
      Left = 235
      Top = 331
      Width = 27
      Height = 27
      BevelOuter = bvNone
      Caption = 'Display selected test later'
      Constraints.MaxHeight = 27
      Constraints.MaxWidth = 27
      TabOrder = 6
      TabStop = True
      OnClick = cmdDownClick
      OnEnter = pnlDownButtonEnter
      OnExit = pnlDownButtonExit
      OnResize = pnlDownButtonResize
      object cmdDown: TSpeedButton
        Left = 0
        Top = 1
        Width = 27
        Height = 25
        Caption = 'v'
        Enabled = False
        OnClick = cmdDownClick
      end
    end
    object cmdOK: TButton
      Left = 277
      Top = 398
      Width = 72
      Height = 21
      Caption = 'OK'
      TabOrder = 8
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 368
      Top = 398
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 9
    end
    object cmdClear: TButton
      Left = 189
      Top = 244
      Width = 72
      Height = 21
      Caption = 'Remove All'
      Enabled = False
      TabOrder = 3
      OnClick = cmdClearClick
    end
    object cmdRemove: TButton
      Left = 189
      Top = 268
      Width = 72
      Height = 21
      Caption = 'Remove One'
      Enabled = False
      TabOrder = 4
      OnClick = cmdRemoveClick
    end
    object lstList: TORListBox
      Left = 280
      Top = 166
      Width = 160
      Height = 211
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = lstListClick
      Caption = 'Tests to be displayed'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object cboTests: TORComboBox
      Left = 10
      Top = 144
      Width = 160
      Height = 233
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Laboratory Tests'
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
      TabStop = True
      OnChange = cboTestsChange
      OnDblClick = cmdAddTestClick
      OnEnter = cboTestsEnter
      OnExit = cboTestsExit
      OnNeedData = cboTestsNeedData
    end
    object cboUsers: TORComboBox
      Left = 164
      Top = 26
      Width = 160
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Persons with defined Test Groups'
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
      TabOrder = 10
      OnClick = cboUsersClick
      OnNeedData = cboUsersNeedData
    end
    object lstTestGroups: TORListBox
      Left = 10
      Top = 56
      Width = 319
      Height = 57
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = lstTestGroupsClick
      Caption = 'Test Groups'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object cmdReplace: TButton
      Left = 368
      Top = 60
      Width = 72
      Height = 21
      Caption = 'Replace'
      Enabled = False
      TabOrder = 13
      OnClick = cmdReplaceClick
    end
    object cboSpecimen: TORComboBox
      Left = 12
      Top = 402
      Width = 160
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Specimen'
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
      TabOrder = 1
      OnNeedData = cboSpecimenNeedData
    end
    object cmdDelete: TButton
      Left = 368
      Top = 88
      Width = 72
      Height = 21
      Caption = 'Delete'
      Enabled = False
      TabOrder = 14
      OnClick = cmdDeleteClick
    end
    object cmdAdd: TButton
      Left = 368
      Top = 32
      Width = 72
      Height = 21
      Caption = 'New'
      Enabled = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      OnClick = cmdAddClick
    end
    object cmdAddTest: TButton
      Left = 189
      Top = 144
      Width = 72
      Height = 21
      Caption = 'Add'
      Enabled = False
      TabOrder = 2
      OnClick = cmdAddTestClick
    end
  end
end
