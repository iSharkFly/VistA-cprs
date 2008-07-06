object frmSearchStop: TfrmSearchStop
  Left = 477
  Top = 351
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Scanning Notes....'
  ClientHeight = 95
  ClientWidth = 163
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSearchStop: TButton
    Left = 45
    Top = 64
    Width = 73
    Height = 25
    Caption = 'Stop Scan'
    TabOrder = 1
    OnClick = btnSearchStopClick
  end
  object lblSearchStatus: TStaticText
    Left = 8
    Top = 32
    Width = 78
    Height = 17
    Caption = 'lblSearchStatus'
    TabOrder = 0
    TabStop = True
  end
end
