object frmTemplateAutoGen: TfrmTemplateAutoGen
  Left = 361
  Top = 230
  ActiveControl = rgSource
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Generate Template'
  ClientHeight = 213
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTop: TMemo
    Left = 256
    Top = 8
    Width = 147
    Height = 65
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Template generation creates a '
      'new template, automatically '
      'copying the template'#39's '
      'boilerplate from an existing '
      'source.')
    TabOrder = 5
  end
  object lblSelect: TStaticText
    Left = 0
    Top = 0
    Width = 241
    Height = 213
    Align = alLeft
    Alignment = taCenter
    AutoSize = False
    Caption = 'Select Source of Template Generation ...'
    TabOrder = 6
  end
  object rgSource: TKeyClickRadioGroup
    Left = 256
    Top = 88
    Width = 153
    Height = 81
    Caption = ' Template Generate Source '
    Items.Strings = (
      '&Boilerplated Note Title'
      '&Patient Data (Object)')
    TabOrder = 2
    TabStop = True
    OnClick = rgSourceClick
  end
  object cbxObjects: TORComboBox
    Left = 0
    Top = 0
    Width = 249
    Height = 213
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Patient Data'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Pieces = '1'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 1
    Visible = False
    OnDblClick = cbxObjectsDblClick
  end
  object btnOK: TButton
    Left = 257
    Top = 190
    Width = 75
    Height = 21
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 337
    Top = 190
    Width = 75
    Height = 21
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object cbxTitles: TORComboBox
    Left = 0
    Top = 0
    Width = 249
    Height = 213
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Choose Existing Template'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    Visible = False
    OnDblClick = cbxTitlesDblClick
    OnNeedData = cbxTitlesNeedData
  end
end
