object frmLabTest: TfrmLabTest
  Left = 776
  Top = 338
  Width = 285
  Height = 308
  Caption = 'Select Lab Test for Graph'
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
  object pnlLabTest: TORAutoPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 281
    Align = alClient
    TabOrder = 0
    object lblTest: TLabel
      Left = 8
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Laboratory Test'
    end
    object lblSpecimen: TLabel
      Left = 8
      Top = 238
      Width = 47
      Height = 13
      Caption = 'Specimen'
    end
    object lblSpecInfo: TLabel
      Left = 180
      Top = 222
      Width = 89
      Height = 55
      AutoSize = False
      Caption = 
        'A specimen can be selected to restrict values only for that spec' +
        'imen.'
      WordWrap = True
    end
    object cmdOK: TButton
      Left = 197
      Top = 22
      Width = 72
      Height = 21
      Caption = 'OK'
      TabOrder = 2
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 197
      Top = 49
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
    end
    object cboList: TORComboBox
      Left = 8
      Top = 22
      Width = 160
      Height = 200
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Laboratory Test'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = True
      LongList = True
      MaxLength = 0
      ParentShowHint = False
      Pieces = '2'
      ShowHint = True
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
      OnDblClick = cmdOKClick
      OnEnter = cboListEnter
      OnExit = cboListExit
      OnNeedData = cboListNeedData
    end
    object cboSpecimen: TORComboBox
      Left = 8
      Top = 252
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
      ListItemsOnly = True
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
  end
end
