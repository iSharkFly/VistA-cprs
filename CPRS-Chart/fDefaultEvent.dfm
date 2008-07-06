object frmDefaultEvent: TfrmDefaultEvent
  Left = 311
  Top = 193
  BorderStyle = bsSingle
  Caption = 'Set/Change Default Release Event'
  ClientHeight = 317
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 25
    Align = alTop
    TabOrder = 0
    object lblCaption: TLabel
      Left = 1
      Top = 1
      Width = 392
      Height = 23
      Align = alClient
      Caption = 
        ' Select an event from the following list as your personal defaul' +
        't release event:'
      WordWrap = True
    end
  end
  object cboEvents: TORComboBox
    Left = 0
    Top = 25
    Width = 394
    Height = 261
    Style = orcsSimple
    Align = alClient
    AutoSelect = False
    Caption = 
      ' Select an event from the following list as your personal defaul' +
      't release event:'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = False
    MaxLength = 0
    ParentShowHint = False
    Pieces = '9'
    ShowHint = True
    Sorted = True
    SynonymChars = '<>'
    TabOrder = 1
    CheckEntireLine = True
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 286
    Width = 394
    Height = 31
    Align = alBottom
    TabOrder = 2
    object btnOK: TButton
      Left = 212
      Top = 6
      Width = 75
      Height = 20
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 296
      Top = 6
      Width = 75
      Height = 20
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
