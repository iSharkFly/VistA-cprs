object frmTemplateFields: TfrmTemplateFields
  Left = 212
  Top = 155
  Width = 418
  Height = 300
  Caption = 'Insert Template Field'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 246
    Width = 410
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      410
      27)
    object lblReq: TStaticText
      Left = 21
      Top = 8
      Width = 134
      Height = 17
      Caption = '* Indicates a Required Field'
      TabOrder = 3
    end
    object btnCancel: TButton
      Left = 335
      Top = 4
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Done'
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnInsert: TButton
      Left = 255
      Top = 4
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '&Insert Field'
      Default = True
      ModalResult = 4
      TabOrder = 1
      OnClick = btnInsertClick
    end
    object btnPreview: TButton
      Left = 175
      Top = 4
      Width = 75
      Height = 21
      Caption = '&Preview'
      Enabled = False
      TabOrder = 0
      OnClick = btnPreviewClick
    end
  end
  object cboObjects: TORComboBox
    Left = 0
    Top = 0
    Width = 410
    Height = 246
    Style = orcsSimple
    Align = alClient
    AutoSelect = True
    Caption = 'Template Field'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    MaxLength = 0
    Pieces = '2,3'
    HideSynonyms = True
    Sorted = False
    SynonymChars = '<Inactive>'
    TabPositions = '50,60,70,80,90'
    TabOrder = 1
    OnChange = cboObjectsChange
    OnDblClick = cboObjectsDblClick
    OnNeedData = cboObjectsNeedData
  end
end
