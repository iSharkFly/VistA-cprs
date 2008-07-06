object frmConsultsByStatus: TfrmConsultsByStatus
  Left = 286
  Top = 202
  Width = 316
  Height = 232
  BorderIcons = []
  Caption = 'List Consults by Status'
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
    Width = 308
    Height = 205
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblStatus: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object radSort: TRadioGroup
      Left = 8
      Top = 148
      Width = 212
      Height = 49
      Caption = 'Sort Order'
      Items.Strings = (
        '&Ascending (A-Z)'
        '&Descending (Z-A)')
      TabOrder = 1
    end
    object lstStatus: TORListBox
      Left = 8
      Top = 22
      Width = 212
      Height = 118
      ItemHeight = 13
      MultiSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Caption = 'Status'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object cmdOK: TButton
      Left = 228
      Top = 149
      Width = 72
      Height = 21
      Caption = 'OK'
      Default = True
      TabOrder = 2
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 228
      Top = 176
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = cmdCancelClick
    end
  end
end
