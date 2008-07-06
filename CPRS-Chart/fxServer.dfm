object frmDbgServer: TfrmDbgServer
  Left = 206
  Top = 168
  Width = 508
  Height = 328
  Caption = 'Server Information'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 101
    Height = 13
    Caption = 'Current Symbol Table'
  end
  object memSymbols: TRichEdit
    Left = 6
    Top = 20
    Width = 488
    Height = 248
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'memSymbols')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 276
    Width = 125
    Height = 17
    Caption = 'Current Symbol Table'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 156
    Top = 276
    Width = 105
    Height = 17
    Caption = 'Global Reference'
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 264
    Top = 274
    Width = 229
    Height = 21
    Enabled = False
    TabOrder = 3
  end
end
