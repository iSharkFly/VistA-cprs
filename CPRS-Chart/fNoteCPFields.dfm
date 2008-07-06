object frmNoteCPFields: TfrmNoteCPFields
  Left = 508
  Top = 307
  Width = 257
  Height = 178
  Caption = 'Enter Required Fields'
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
  object lblAuthor: TLabel
    Left = 7
    Top = 5
    Width = 94
    Height = 13
    AutoSize = False
    Caption = 'Author:'
  end
  object lblProcSummCode: TOROffsetLabel
    Left = 4
    Top = 50
    Width = 125
    Height = 15
    Caption = 'Procedure Summary Code'
    HorzOffset = 2
    Transparent = False
    VertOffset = 2
    WordWrap = False
  end
  object lblProcDateTime: TOROffsetLabel
    Left = 4
    Top = 96
    Width = 105
    Height = 15
    Caption = 'Procedure Date/Time'
    HorzOffset = 2
    Transparent = False
    VertOffset = 2
    WordWrap = False
  end
  object cboAuthor: TORComboBox
    Left = 4
    Top = 17
    Width = 239
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Author'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = True
    LookupPiece = 2
    MaxLength = 0
    ParentShowHint = False
    Pieces = '2,3'
    ShowHint = True
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnNeedData = cboAuthorNeedData
  end
  object cboProcSummCode: TORComboBox
    Left = 4
    Top = 66
    Width = 142
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Procedure Summary Code'
    Color = clWindow
    DropDownCount = 8
    Items.Strings = (
      '1^Normal'
      '2^Abnormal'
      '3^Borderline'
      '4^Incomplete')
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    LookupPiece = 0
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
  end
  object calProcDateTime: TORDateBox
    Left = 4
    Top = 112
    Width = 142
    Height = 21
    TabOrder = 2
    DateOnly = False
    RequireTime = True
    Caption = 'Procedure Date/Time'
  end
  object cmdOK: TButton
    Left = 166
    Top = 78
    Width = 72
    Height = 21
    Hint = 
      'Save these items, and continue to enter text interpretation of r' +
      'esults.'
    Caption = 'Save'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 166
    Top = 105
    Width = 72
    Height = 21
    Hint = 
      'Enter text interpretation of results now, and enter these items ' +
      'later.'
    Cancel = True
    Caption = 'Enter Later'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = cmdCancelClick
  end
end
