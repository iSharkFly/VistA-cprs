object frmAlertForward: TfrmAlertForward
  Left = 297
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Forward Alert'
  ClientHeight = 381
  ClientWidth = 354
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
  object pnlBase: TORAutoPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object SrcLabel: TLabel
      Left = 12
      Top = 120
      Width = 133
      Height = 30
      AutoSize = False
      Caption = 'Select one or more names to receive forwarded alert'
      WordWrap = True
    end
    object DstLabel: TLabel
      Left = 196
      Top = 134
      Width = 145
      Height = 16
      AutoSize = False
      Caption = 'Currently selected recipients'
    end
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 44
      Height = 13
      Caption = 'Comment'
    end
    object cmdOK: TButton
      Left = 185
      Top = 346
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 4
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 265
      Top = 346
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 5
      OnClick = cmdCancelClick
    end
    object cboSrcList: TORComboBox
      Left = 12
      Top = 150
      Width = 144
      Height = 185
      Style = orcsSimple
      AutoSelect = True
      Caption = 'Select or enter name'
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = True
      LongList = True
      MaxLength = 0
      Pieces = '2,3'
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 2
      OnKeyDown = cboSrcListKeyDown
      OnMouseClick = cboSrcListMouseClick
      OnNeedData = cboSrcListNeedData
    end
    object DstList: TORListBox
      Left = 196
      Top = 150
      Width = 144
      Height = 185
      ItemHeight = 13
      MultiSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = DstListClick
      OnKeyDown = DstListKeyDown
      Caption = 'Currently selected recipients'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object memAlert: TMemo
      Left = 8
      Top = 16
      Width = 337
      Height = 25
      TabStop = False
      Color = clBtnFace
      Lines.Strings = (
        'memAlert')
      ReadOnly = True
      TabOrder = 1
      WantReturns = False
    end
    object memComment: TMemo
      Left = 8
      Top = 64
      Width = 337
      Height = 49
      MaxLength = 180
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
