object frmNotesByDate: TfrmNotesByDate
  Left = 590
  Top = 294
  Width = 259
  Height = 178
  BorderIcons = []
  Caption = 'List Signed Notes by Date Range'
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
    Width = 251
    Height = 151
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblBeginDate: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Beginning Date'
    end
    object lblEndDate: TLabel
      Left = 8
      Top = 51
      Width = 59
      Height = 13
      Caption = 'Ending Date'
    end
    object calBeginDate: TORDateBox
      Left = 8
      Top = 22
      Width = 155
      Height = 21
      TabOrder = 0
      OnKeyPress = calBeginDateKeyPress
      DateOnly = False
      RequireTime = False
      Caption = 'Beginning Date'
    end
    object calEndDate: TORDateBox
      Left = 8
      Top = 65
      Width = 155
      Height = 21
      TabOrder = 1
      OnKeyPress = calEndDateKeyPress
      DateOnly = False
      RequireTime = False
      Caption = 'Ending Date'
    end
    object radSort: TRadioGroup
      Left = 8
      Top = 94
      Width = 155
      Height = 49
      Caption = 'Sort Order'
      Items.Strings = (
        '&Ascending (oldest first)'
        '&Descending (newest first)')
      TabOrder = 2
    end
    object cmdOK: TButton
      Left = 171
      Top = 22
      Width = 72
      Height = 21
      Caption = 'OK'
      Default = True
      TabOrder = 3
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 171
      Top = 49
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 4
      OnClick = cmdCancelClick
    end
  end
end
