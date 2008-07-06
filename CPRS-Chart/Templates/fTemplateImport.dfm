object frmTemplateImport: TfrmTemplateImport
  Left = 273
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Importing Word Document'
  ClientHeight = 132
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gaugeImport: TGauge
    Left = 8
    Top = 82
    Width = 272
    Height = 21
    ForeColor = clNavy
    Progress = 0
  end
  object lblImporting: TStaticText
    Left = 8
    Top = 4
    Width = 272
    Height = 13
    AutoSize = False
    Caption = 'Importing '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object animImport: TAnimate
    Left = 8
    Top = 20
    Width = 272
    Height = 60
    Active = True
    CommonAVI = aviCopyFile
    StopFrame = 26
  end
  object btnCancel: TButton
    Left = 106
    Top = 106
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    Default = True
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
