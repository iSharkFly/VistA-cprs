inherited frmHSplit: TfrmHSplit
  Left = 276
  Top = 228
  Caption = 'Basic Splitter Page'
  PixelsPerInch = 96
  TextHeight = 13
  object sptHorz: TSplitter
    Left = 97
    Top = 0
    Width = 4
    Height = 349
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 97
    Height = 349
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 30
    TabOrder = 0
  end
  object pnlRight: TPanel
    Left = 101
    Top = 0
    Width = 539
    Height = 349
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 24
    TabOrder = 1
  end
end
