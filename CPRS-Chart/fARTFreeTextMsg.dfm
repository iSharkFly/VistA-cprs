inherited frmARTFreeTextMsg: TfrmARTFreeTextMsg
  Left = 426
  Top = 266
  Width = 394
  Height = 359
  Caption = 'Enter Optional Comments'
  Constraints.MinHeight = 180
  Constraints.MinWidth = 394
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlText: TORAutoPanel
    Left = 0
    Top = 0
    Width = 386
    Height = 133
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 133
    TabOrder = 0
    object lblText: TLabel
      Left = 17
      Top = 7
      Width = 3
      Height = 13
    end
    object lblComments: TOROffsetLabel
      Left = 2
      Top = 118
      Width = 100
      Height = 15
      Caption = 'Comments (optional):'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = False
    end
  end
  object pnlButton: TORAutoPanel
    Left = 0
    Top = 294
    Width = 386
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Constraints.MinHeight = 38
    TabOrder = 2
    object cmdContinue: TButton
      Left = 155
      Top = 9
      Width = 75
      Height = 21
      Caption = 'Continue'
      Constraints.MinHeight = 21
      TabOrder = 0
      OnClick = cmdContinueClick
    end
  end
  object memFreeText: TCaptionRichEdit
    Left = 0
    Top = 133
    Width = 386
    Height = 161
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    PlainText = True
    TabOrder = 1
    Caption = 'Additional comments:'
  end
end
