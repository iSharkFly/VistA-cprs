object frmReportPrt: TfrmReportPrt
  Left = 507
  Top = 114
  Width = 434
  Height = 343
  Caption = 'Report Print Device Selection'
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
    Left = 8
    Top = 271
    Width = 3
    Height = 13
  end
  object lblReportsTitle: TMemo
    Left = 8
    Top = 8
    Width = 301
    Height = 53
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Report Title, Date/Time, Location')
    ReadOnly = True
    TabOrder = 4
  end
  object grpDevice: TGroupBox
    Left = 8
    Top = 69
    Width = 411
    Height = 192
    Caption = 'Device'
    TabOrder = 0
    object lblMargin: TLabel
      Left = 8
      Top = 166
      Width = 60
      Height = 13
      AutoSize = False
      Caption = 'Right Margin'
    end
    object lblLength: TLabel
      Left = 120
      Top = 166
      Width = 61
      Height = 13
      AutoSize = False
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
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
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
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 347
    Top = 272
    Width = 72
    Height = 22
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = cmdCancelClick
  end
  object chkDefault: TCheckBox
    Left = 8
    Top = 294
    Width = 171
    Height = 17
    Caption = 'Save as user'#39's default printer'
    TabOrder = 1
  end
  object dlgWinPrinter: TPrintDialog
    Left = 334
    Top = 18
  end
end
