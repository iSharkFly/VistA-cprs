object frmDeviceSelect: TfrmDeviceSelect
  Left = 378
  Top = 340
  AutoScroll = False
  Caption = 'Orders Print Device Selection'
  ClientHeight = 235
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPrintTo: TLabel
    Left = 8
    Top = 276
    Width = 3
    Height = 13
  end
  object grpDevice: TGroupBox
    Left = 0
    Top = 0
    Width = 415
    Height = 194
    Align = alClient
    Caption = 'Device'
    TabOrder = 0
    object cboDevice: TORComboBox
      Left = 2
      Top = 15
      Width = 411
      Height = 145
      Style = orcsSimple
      Align = alClient
      AutoSelect = True
      Caption = 'Device'
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
    object pnlGBBottom: TPanel
      Left = 2
      Top = 160
      Width = 411
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lblMargin: TLabel
        Left = 8
        Top = 12
        Width = 60
        Height = 13
        Caption = 'Right Margin'
      end
      object lblLength: TLabel
        Left = 120
        Top = 12
        Width = 61
        Height = 13
        Caption = 'Page Length'
      end
      object txtRightMargin: TMaskEdit
        Left = 72
        Top = 6
        Width = 33
        Height = 19
        AutoSize = False
        EditMask = '99999;0; '
        MaxLength = 5
        TabOrder = 0
      end
      object txtPageLength: TMaskEdit
        Left = 184
        Top = 6
        Width = 34
        Height = 19
        AutoSize = False
        EditMask = '99999;0; '
        MaxLength = 5
        TabOrder = 1
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 194
    Width = 415
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cmdOK: TButton
      Left = 257
      Top = 11
      Width = 72
      Height = 22
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 337
      Top = 11
      Width = 72
      Height = 22
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = cmdCancelClick
    end
    object chkDefault: TCheckBox
      Left = 12
      Top = 16
      Width = 163
      Height = 17
      Caption = 'Save as user'#39's default printer'
      TabOrder = 2
    end
  end
end
