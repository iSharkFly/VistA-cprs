object frmTemplateView: TfrmTemplateView
  Left = 257
  Top = 105
  Width = 578
  Height = 372
  Caption = 'View Template'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 315
    Width = 570
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      570
      30)
    object btnClose: TButton
      Left = 494
      Top = 6
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Close'
      Default = True
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object cbStayOnTop: TCheckBox
      Left = 0
      Top = 8
      Width = 77
      Height = 17
      Caption = 'Stay on Top'
      TabOrder = 0
      OnClick = cbStayOnTopClick
    end
    object btnPrint: TButton
      Left = 414
      Top = 6
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Print'
      TabOrder = 1
      OnClick = btnPrintClick
    end
  end
  object reMain: TRichEdit
    Left = 0
    Top = 0
    Width = 570
    Height = 315
    Align = alClient
    Color = clCream
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    HideSelection = False
    ParentFont = False
    PopupMenu = popView
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object popView: TPopupMenu
    OnPopup = popViewPopup
    Left = 24
    Top = 24
    object Copy1: TMenuItem
      Caption = '&Copy'
      ShortCut = 16451
      OnClick = Copy1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelectAll1: TMenuItem
      Caption = 'Select &All'
      ShortCut = 16449
      OnClick = SelectAll1Click
    end
  end
end
