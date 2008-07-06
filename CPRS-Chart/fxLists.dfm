object frmDbgList: TfrmDbgList
  Left = 313
  Top = 248
  Width = 480
  Height = 280
  BorderIcons = [biSystemMenu]
  Caption = 'Show ListBox Data'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object memData: TMemo
    Left = 0
    Top = 0
    Width = 472
    Height = 253
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    WantReturns = False
  end
end
