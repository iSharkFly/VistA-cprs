object frmAddlSigners: TfrmAddlSigners
  Left = 275
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Identify Additional Signers'
  ClientHeight = 362
  ClientWidth = 403
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
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 362
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlButtons: TORAutoPanel
      Left = 0
      Top = 309
      Width = 403
      Height = 53
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object cmdOK: TButton
        Left = 125
        Top = 14
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        OnClick = cmdOKClick
      end
      object cmdCancel: TButton
        Left = 215
        Top = 14
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = cmdCancelClick
      end
    end
    object pnlAdditional: TORAutoPanel
      Left = 0
      Top = 70
      Width = 403
      Height = 239
      Align = alClient
      TabOrder = 1
      object SrcLabel: TLabel
        Left = 11
        Top = 15
        Width = 175
        Height = 16
        AutoSize = False
        Caption = 'Select or enter additional signers'
      end
      object DstLabel: TLabel
        Left = 214
        Top = 16
        Width = 145
        Height = 16
        AutoSize = False
        Caption = 'Current additional signers'
      end
      object cboSrcList: TORComboBox
        Left = 11
        Top = 33
        Width = 174
        Height = 185
        Style = orcsSimple
        AutoSelect = True
        Caption = 'Select or enter additional signers'
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
        OnClick = cboSrcListClick
        OnKeyDown = cboSrcListKeyDown
        OnMouseClick = cboSrcListMouseClick
        OnNeedData = NewPersonNeedData
        CharsNeedMatch = 1
      end
      object DstList: TORListBox
        Left = 213
        Top = 33
        Width = 174
        Height = 185
        ItemHeight = 13
        MultiSelect = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = DstListClick
        Caption = 'Current additional signers'
        ItemTipColor = clWindow
        LongList = False
        Pieces = '2'
      end
      object cmdRemove: TButton
        Left = 264
        Top = 221
        Width = 75
        Height = 25
        Caption = 'Remove'
        TabOrder = 2
        Visible = False
        OnClick = cmdRemoveClick
      end
    end
    object pnlTop: TORAutoPanel
      Left = 0
      Top = 0
      Width = 403
      Height = 70
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblAuthor: TOROffsetLabel
        Left = 12
        Top = 9
        Width = 97
        Height = 15
        Caption = 'Author (not editable)'
        HorzOffset = 2
        Transparent = False
        VertOffset = 2
        WordWrap = False
      end
      object lblCosigner: TOROffsetLabel
        Left = 213
        Top = 10
        Width = 155
        Height = 15
        Caption = 'Expected Cosigner (not editable)'
        HorzOffset = 2
        Transparent = False
        VertOffset = 2
        WordWrap = False
      end
      object cboCosigner: TORComboBox
        Left = 214
        Top = 26
        Width = 174
        Height = 21
        Style = orcsDropDown
        AutoSelect = True
        Caption = 'object lblCosigner: TOROffsetLabel'
        Color = clCream
        DropDownCount = 8
        Enabled = False
        ItemHeight = 13
        ItemTipColor = clWindow
        ItemTipEnable = True
        ListItemsOnly = True
        LongList = True
        LookupPiece = 0
        MaxLength = 0
        Pieces = '2,3'
        Sorted = False
        SynonymChars = '<>'
        TabOrder = 1
        TabStop = True
        OnChange = cboCosignerChange
        OnExit = cboCosignerExit
        OnNeedData = cboCosignerNeedData
        CharsNeedMatch = 1
      end
      object txtAuthor: TCaptionEdit
        Left = 14
        Top = 27
        Width = 178
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clCream
        ReadOnly = True
        TabOrder = 0
        Caption = 'Author (not editable)'
      end
    end
  end
end
