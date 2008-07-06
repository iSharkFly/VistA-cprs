object frmConsultAlertsTo: TfrmConsultAlertsTo
  Left = 297
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Send Alert'
  ClientHeight = 262
  ClientWidth = 358
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
    Width = 358
    Height = 262
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object SrcLabel: TLabel
      Left = 12
      Top = 14
      Width = 98
      Height = 13
      Caption = 'Select or enter name'
    end
    object DstLabel: TLabel
      Left = 196
      Top = 14
      Width = 132
      Height = 13
      Caption = 'Currently selected recipients'
    end
    object cmdOK: TButton
      Left = 105
      Top = 226
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 2
      OnClick = cmdOKClick
    end
    object cmdCancel: TButton
      Left = 185
      Top = 226
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
      OnClick = cmdCancelClick
    end
    object cboSrcList: TORComboBox
      Left = 12
      Top = 30
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
      LookupPiece = 2
      MaxLength = 0
      Pieces = '2,3'
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
      OnKeyDown = cboSrcListKeyDown
      OnMouseClick = cboSrcListMouseClick
      OnNeedData = cboSrcListNeedData
    end
    object DstList: TORListBox
      Left = 196
      Top = 30
      Width = 144
      Height = 185
      ItemHeight = 13
      MultiSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = DstListClick
      Caption = 'Currently selected recipients'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
  end
end
