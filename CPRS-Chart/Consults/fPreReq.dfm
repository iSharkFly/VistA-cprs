object frmPrerequisites: TfrmPrerequisites
  Left = 337
  Top = 219
  Width = 377
  Height = 348
  BorderIcons = [biSystemMenu]
  Caption = 'frmPrerequisites'
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
  OnShow = FormShow
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
    Top = 33
    Width = 369
    Height = 288
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
    Top = 0
    Width = 369
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      369
      33)
    object cmdContinue: TButton
      Left = 209
      Top = 6
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Continue'
      TabOrder = 0
      OnClick = cmdContinueClick
    end
    object cmdCancel: TButton
      Left = 292
      Top = 6
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel Order'
      TabOrder = 1
      OnClick = cmdCancelClick
    end
  end
  object cmdPrint: TButton
    Left = 2
    Top = 6
    Width = 75
    Height = 21
    Caption = 'Print'
    TabOrder = 1
    OnClick = cmdPrintClick
  end
  object dlgPrintReport: TPrintDialog
    Left = 113
    Top = 3
  end
end
