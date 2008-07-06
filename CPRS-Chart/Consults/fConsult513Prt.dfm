object frm513Print: Tfrm513Print
  Left = 116
  Top = 375
  AutoScroll = False
  Caption = 'Print SF 513'
  ClientHeight = 308
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrintTo: TLabel
    Left = 7
    Top = 265
    Width = 3
    Height = 13
  end
  object lblConsultTitle: TMemo
    Left = 10
    Top = 8
    Width = 301
    Height = 53
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Consult Title, Date/Time of Consult, Location')
    ReadOnly = True
    TabOrder = 0
  end
  object grpChooseCopy: TGroupBox
    Left = 321
    Top = 4
    Width = 98
    Height = 61
    Caption = 'Print'
    TabOrder = 1
    object radChartCopy: TRadioButton
      Left = 8
      Top = 16
      Width = 81
      Height = 17
      Caption = '&Chart Copy'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = radChartCopyClick
    end
    object radWorkCopy: TRadioButton
      Left = 8
      Top = 36
      Width = 81
      Height = 17
      Caption = '&Work Copy'
      TabOrder = 1
      OnClick = radWorkCopyClick
    end
  end
  object grpDevice: TGroupBox
    Left = 8
    Top = 69
    Width = 411
    Height = 192
    Caption = 'Device'
    TabOrder = 2
    object lblMargin: TLabel
      Left = 8
      Top = 166
      Width = 60
      Height = 13
      Caption = 'Right Margin'
    end
    object lblLength: TLabel
      Left = 120
      Top = 166
      Width = 61
      Height = 13
      Caption = 'Page Length'
    end
    object txtRightMargin: TMaskEdit
      Left = 72
      Top = 164
      Width = 34
      Height = 19
      AutoSize = False
      EditMask = '99999;0; '
      MaxLength = 5
      TabOrder = 1
    end
    object txtPageLength: TMaskEdit
      Left = 184
      Top = 164
      Width = 34
      Height = 19
      AutoSize = False
      EditMask = '99999;0; '
      MaxLength = 5
      TabOrder = 2
    end
    object cboDevice: TORComboBox
      Left = 8
      Top = 16
      Width = 395
      Height = 140
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Device'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = True
      LongList = True
      LookupPiece = 0
      MaxLength = 0
      ParentShowHint = False
      Pieces = '2,4'
      ShowHint = True
      Sorted = False
      SynonymChars = '<>'
      TabPositions = '30'
      TabOrder = 0
      OnChange = cboDeviceChange
      OnNeedData = cboDeviceNeedData
    end
  end
  object cmdOK: TButton
    Left = 267
    Top = 272
    Width = 72
    Height = 22
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 347
    Top = 272
    Width = 72
    Height = 22
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = cmdCancelClick
  end
  object chkDefault: TCheckBox
    Left = 7
    Top = 288
    Width = 166
    Height = 17
    Caption = 'Save as user'#39's default printer'
    TabOrder = 3
  end
  object dlgWinPrinter: TPrintDialog
    Left = 268
    Top = 26
  end
end
