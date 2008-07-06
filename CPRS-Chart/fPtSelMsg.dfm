object frmPtSelMsg: TfrmPtSelMsg
  Left = 375
  Top = 421
  Width = 375
  Height = 174
  Caption = 'Patient Lookup Messages'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    367
    140)
  PixelsPerInch = 96
  TextHeight = 13
  object cmdClose: TButton
    Left = 158
    Top = 114
    Width = 60
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    Default = True
    TabOrder = 0
    OnClick = cmdCloseClick
  end
  object memMessages: TRichEdit
    Left = 0
    Top = 0
    Width = 367
    Height = 107
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clCream
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    WantReturns = False
  end
  object timClose: TTimer
    OnTimer = timCloseTimer
    Left = 6
    Top = 126
  end
end
