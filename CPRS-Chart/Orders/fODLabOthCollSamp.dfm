object frmODLabOthCollSamp: TfrmODLabOthCollSamp
  Left = 321
  Top = 136
  Width = 236
  Height = 359
  BorderIcons = []
  Caption = 'Select Collection Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBase: TORAutoPanel
    Left = 0
    Top = 0
    Width = 228
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cboOtherCollSamp: TORComboBox
      Left = 9
      Top = 22
      Width = 212
      Height = 270
      Style = orcsSimple
      AutoSelect = True
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = True
      LongList = False
      MaxLength = 0
      Pieces = '2'
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
      OnDblClick = cboOtherCollSampDblClick
    end
    object cmdOK: TButton
      Left = 39
      Top = 303
      Width = 72
      Height = 21
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 123
      Top = 303
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = cmdCancelClick
    end
  end
end
