inherited frmNotesBP: TfrmNotesBP
  Left = 230
  Top = 376
  Width = 318
  Height = 182
  BorderIcons = []
  Caption = 'Boilerplate Text'
  KeyPreview = True
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TStaticText
    Left = 0
    Top = 0
    Width = 310
    Height = 17
    Align = alTop
    AutoSize = False
    Caption = 'The selected title has associated boilerplate text.'
    TabOrder = 1
  end
  object radOptions: TRadioGroup
    Left = 0
    Top = 17
    Width = 310
    Height = 103
    Align = alClient
    Caption = ' Choose from: '
    ItemIndex = 0
    Items.Strings = (
      '&Ignore the boilerplate text (text of note will not change).'
      '&Append the boilerplate text to the text in the note.'
      '&Replace the text in the note with the boilerplate text.')
    TabOrder = 0
  end
  object btnPanel: TPanel
    Left = 0
    Top = 120
    Width = 310
    Height = 28
    Align = alBottom
    TabOrder = 2
    object cmdPreview: TButton
      Left = 6
      Top = 4
      Width = 79
      Height = 21
      Caption = 'Preview Text'
      TabOrder = 0
      OnClick = cmdPreviewClick
    end
    object cmdClose: TButton
      Left = 230
      Top = 4
      Width = 72
      Height = 21
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = cmdCloseClick
    end
  end
end
