object frmODRadConShRes: TfrmODRadConShRes
  Left = 308
  Top = 206
  ActiveControl = txtResearch
  BorderStyle = bsDialog
  Caption = 'Contract/Sharing/Research Source'
  ClientHeight = 121
  ClientWidth = 288
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
    Width = 288
    Height = 121
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object SrcLabel: TLabel
      Left = 12
      Top = 14
      Width = 107
      Height = 13
      Caption = 'Select or enter source:'
    end
    object cmdOK: TButton
      Left = 58
      Top = 74
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 139
      Top = 74
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
      OnClick = cmdCancelClick
    end
    object cboSource: TORComboBox
      Left = 14
      Top = 31
      Width = 262
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Caption = 'Select or enter source:'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = True
      LongList = False
      MaxLength = 0
      Pieces = '2'
      Sorted = True
      SynonymChars = '<>'
      TabOrder = 0
    end
    object txtResearch: TCaptionEdit
      Left = 12
      Top = 31
      Width = 261
      Height = 21
      MaxLength = 40
      TabOrder = 1
      Caption = 'Select or enter source:'
    end
  end
end
