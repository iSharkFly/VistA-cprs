inherited frmODBase: TfrmODBase
  Left = 277
  Top = 179
  Width = 528
  Height = 275
  HorzScrollBar.Range = 500
  HorzScrollBar.Tracking = True
  HorzScrollBar.Visible = True
  VertScrollBar.Range = 225
  VertScrollBar.Visible = True
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = ''
  FormStyle = fsStayOnTop
  KeyPreview = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object memOrder: TCaptionMemo
    Left = 6
    Top = 194
    Width = 430
    Height = 48
    TabStop = False
    Color = clCream
    Ctl3D = True
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    Caption = 'Order'
  end
  object cmdAccept: TButton
    Left = 442
    Top = 194
    Width = 72
    Height = 21
    Caption = 'Accept Order'
    TabOrder = 1
    OnClick = cmdAcceptClick
  end
  object cmdQuit: TButton
    Left = 442
    Top = 221
    Width = 39
    Height = 21
    Cancel = True
    Caption = 'Quit'
    TabOrder = 2
    OnClick = cmdQuitClick
  end
  object pnlMessage: TPanel
    Left = 24
    Top = 176
    Width = 381
    Height = 44
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 3
    Visible = False
    OnExit = pnlMessageExit
    OnMouseDown = pnlMessageMouseDown
    OnMouseMove = pnlMessageMouseMove
    object imgMessage: TImage
      Left = 4
      Top = 4
      Width = 32
      Height = 32
      OnMouseUp = memMessageMouseUp
    end
    object memMessage: TRichEdit
      Left = 40
      Top = 4
      Width = 332
      Height = 32
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      WantReturns = False
      OnMouseDown = pnlMessageMouseDown
      OnMouseMove = pnlMessageMouseMove
    end
  end
end
