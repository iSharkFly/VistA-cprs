object frmODMessage: TfrmODMessage
  Left = 271
  Top = 515
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  ClientHeight = 39
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object imgMessage: TImage
    Left = 4
    Top = 4
    Width = 32
    Height = 32
  end
  object memMessage: TRichEdit
    Left = 40
    Top = 4
    Width = 332
    Height = 32
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
