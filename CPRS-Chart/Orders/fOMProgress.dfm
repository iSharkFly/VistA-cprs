inherited frmOMProgress: TfrmOMProgress
  Left = 221
  Top = 542
  Width = 167
  Height = 215
  BorderIcons = []
  Caption = 'Order Set Progress'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lstItems: TCheckListBox
    Left = 0
    Top = 0
    Width = 159
    Height = 167
    Align = alClient
    Color = 15793151
    ItemHeight = 13
    TabOrder = 0
  end
  object cmdStop: TORAlignButton
    Left = 0
    Top = 167
    Width = 159
    Height = 21
    Caption = 'Stop Order Set'
    TabOrder = 1
    Align = alBottom
  end
end
