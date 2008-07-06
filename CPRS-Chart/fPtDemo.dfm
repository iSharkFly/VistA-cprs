object frmPtDemo: TfrmPtDemo
  Left = 248
  Top = 283
  Width = 590
  Height = 300
  BorderIcons = [biSystemMenu]
  Caption = 'Patient Inquiry'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFontTest: TLabel
    Left = 264
    Top = 148
    Width = 77
    Height = 14
    Caption = 'lblFontTest'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object memPtDemo: TRichEdit
    Left = 0
    Top = 0
    Width = 582
    Height = 236
    Align = alClient
    Color = clCream
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123ABCDEFGHIJKLMNOPQRSTUVWXYZ0123abcd' +
        'efghijklmnopqrs')
    ParentFont = False
    PlainText = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object pnlTop: TORAutoPanel
    Left = 0
    Top = 236
    Width = 582
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cmdNewPt: TButton
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Caption = 'Select New Patient'
      TabOrder = 0
      OnClick = cmdNewPtClick
    end
    object cmdClose: TButton
      Left = 501
      Top = 8
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'Close'
      Default = True
      TabOrder = 2
      OnClick = cmdCloseClick
    end
    object cmdPrint: TButton
      Left = 411
      Top = 8
      Width = 75
      Height = 21
      Caption = 'Print'
      TabOrder = 1
      OnClick = cmdPrintClick
    end
  end
  object dlgPrintReport: TPrintDialog
    Left = 265
    Top = 245
  end
end
