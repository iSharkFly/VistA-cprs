object frmOptionsSubscribe: TfrmOptionsSubscribe
  Left = 309
  Top = 103
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Subscribe to a Team'
  ClientHeight = 216
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'CPRSWT.HLP'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 184
    Width = 302
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object bvlBottom: TBevel
      Left = 0
      Top = 0
      Width = 302
      Height = 2
      Align = alTop
    end
    object btnOK: TButton
      Left = 109
      Top = 2
      Width = 75
      Height = 22
      HelpContext = 9003
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 205
      Top = 2
      Width = 75
      Height = 22
      HelpContext = 9004
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
