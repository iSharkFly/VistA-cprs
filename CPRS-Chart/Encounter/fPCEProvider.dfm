object frmPCEProvider: TfrmPCEProvider
  Left = 192
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Primary Encounter Provider'
  ClientHeight = 254
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Spacer1: TLabel
    Left = 0
    Top = 0
    Width = 317
    Height = 13
    Align = alTop
  end
  object lblMsg: TMemo
    Left = 0
    Top = 13
    Width = 317
    Height = 29
    TabStop = False
    Align = alTop
    Alignment = taCenter
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Primary Provider for this Encounter')
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object cboPrimary: TORComboBox
    Left = 6
    Top = 69
    Width = 307
    Height = 180
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Primary Provider for this Encounter'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 2
    MaxLength = 0
    Pieces = '2,3'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    TabStop = True
    Visible = False
    OnChange = cboPrimaryChange
    OnNeedData = cboPrimaryNeedData
    CharsNeedMatch = 1
  end
  object btnYes: TButton
    Left = 158
    Top = 40
    Width = 75
    Height = 21
    Caption = '&Yes'
    Default = True
    ModalResult = 6
    TabOrder = 1
  end
  object btnNo: TButton
    Left = 238
    Top = 40
    Width = 75
    Height = 21
    Cancel = True
    Caption = '&No'
    ModalResult = 7
    TabOrder = 2
  end
  object btnSelect: TButton
    Left = 6
    Top = 40
    Width = 90
    Height = 21
    Caption = '&Select Primary'
    TabOrder = 3
    OnClick = btnSelectClick
  end
end
