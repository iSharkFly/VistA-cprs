object frmRemDlg: TfrmRemDlg
  Left = 357
  Top = 260
  Width = 545
  Height = 407
  HelpContext = 11100
  VertScrollBar.Range = 162
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Reminder Dialog'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splTxtData: TSplitter
    Left = 0
    Top = 218
    Width = 537
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Label1: TLabel
    Left = 176
    Top = 368
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object sb1: TScrollBox
    Left = 0
    Top = 0
    Width = 537
    Height = 218
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnResize = sbResize
  end
  object sb2: TScrollBox
    Left = 0
    Top = 0
    Width = 537
    Height = 218
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnResize = sbResize
  end
  object pnlFrmBottom: TPanel
    Left = 0
    Top = 221
    Width = 537
    Height = 159
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object pnlBottom: TPanel
      Left = 0
      Top = 0
      Width = 537
      Height = 144
      Align = alClient
      TabOrder = 0
      object splText: TSplitter
        Left = 1
        Top = 94
        Width = 535
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object reData: TRichEdit
        Left = 1
        Top = 97
        Width = 535
        Height = 46
        Align = alBottom
        Color = clCream
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
        WantReturns = False
      end
      object reText: TRichEdit
        Left = 1
        Top = 25
        Width = 535
        Height = 69
        Align = alClient
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        WantReturns = False
        WordWrap = False
      end
      object pnlButtons: TORAutoPanel
        Left = 1
        Top = 1
        Width = 535
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object btnClear: TButton
          Left = 2
          Top = 2
          Width = 66
          Height = 21
          Hint = 'Clear Reminder Resolutions for this Reminder'
          Caption = 'Clear'
          TabOrder = 0
          OnClick = btnClearClick
        end
        object btnBack: TButton
          Left = 263
          Top = 2
          Width = 66
          Height = 21
          Hint = 'Go back to the Previous Reminder Dialog'
          Caption = '<  Back'
          TabOrder = 3
          OnClick = btnBackClick
        end
        object btnCancel: TButton
          Left = 467
          Top = 2
          Width = 66
          Height = 21
          Hint = 'Cancel All Reminder Dialog Processing'
          Cancel = True
          Caption = 'Cancel'
          TabOrder = 6
          OnClick = btnCancelClick
        end
        object btnNext: TButton
          Left = 331
          Top = 2
          Width = 66
          Height = 21
          Hint = 'Go on to the Next Reminder Dialog'
          Caption = 'Next  >'
          TabOrder = 4
          OnClick = btnNextClick
        end
        object btnFinish: TButton
          Left = 399
          Top = 2
          Width = 66
          Height = 21
          Hint = 'Finish Processing'
          Caption = 'Finish'
          TabOrder = 5
          OnClick = btnFinishClick
        end
        object btnClinMaint: TButton
          Left = 70
          Top = 2
          Width = 105
          Height = 21
          Hint = 'View the Clinical Maintenance Component'
          Caption = 'Clinical &Maint'
          TabOrder = 1
          OnClick = btnClinMaintClick
        end
        object btnVisit: TButton
          Left = 177
          Top = 2
          Width = 84
          Height = 21
          Caption = '&Visit Info'
          TabOrder = 2
          OnClick = btnVisitClick
        end
      end
    end
    object lblFootnotes: TStaticText
      Left = 0
      Top = 144
      Width = 537
      Height = 15
      Align = alBottom
      AutoSize = False
      Caption = ' * Indicates a Required Field'
      TabOrder = 1
    end
  end
end
