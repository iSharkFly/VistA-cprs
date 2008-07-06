object frmReportBox: TfrmReportBox
  Left = 512
  Top = 214
  Anchors = []
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'frmReportBox'
  ClientHeight = 321
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFontTest: TLabel
    Left = 148
    Top = 208
    Width = 77
    Height = 14
    Caption = 'lblFontTest'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object memReport: TRichEdit
    Left = 0
    Top = 0
    Width = 350
    Height = 300
    Align = alClient
    Color = clCream
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'memReport')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object pnlButton: TPanel
    Left = 0
    Top = 300
    Width = 350
    Height = 21
    Align = alBottom
    Anchors = []
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      350
      21)
    object cmdPrint: TButton
      Left = 191
      Top = 0
      Width = 75
      Height = 21
      Anchors = [akRight]
      Caption = 'Print'
      TabOrder = 0
      OnClick = cmdPrintClick
    end
    object cmdClose: TButton
      Left = 274
      Top = 0
      Width = 75
      Height = 21
      Anchors = [akRight]
      Cancel = True
      Caption = 'Close'
      Default = True
      TabOrder = 1
      OnClick = cmdCloseClick
    end
  end
  object dlgPrintReport: TPrintDialog
    Left = 318
    Top = 41
  end
end
