object frmPCEOther: TfrmPCEOther
  Left = 451
  Top = 201
  Width = 279
  Height = 340
  ActiveControl = cboOther
  Caption = 'OtherItems'
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
  object cmdCancel: TButton
    Left = 190
    Top = 287
    Width = 75
    Height = 22
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object cmdOK: TButton
    Left = 110
    Top = 287
    Width = 75
    Height = 22
    Caption = 'OK'
    Enabled = False
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cboOther: TORComboBox
    Left = 8
    Top = 8
    Width = 257
    Height = 273
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Other Items'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnChange = cboOtherChange
    OnDblClick = cboOtherDblClick
  end
end
