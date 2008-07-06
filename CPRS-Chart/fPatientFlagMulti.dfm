object frmFlags: TfrmFlags
  Left = 210
  Top = 169
  Width = 505
  Height = 498
  VertScrollBar.Range = 116
  AutoScroll = False
  Caption = 'Patient Record Flags'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 80
    Width = 497
    Height = 5
    Cursor = crHSplit
    Align = alNone
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 308
    Width = 497
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    MinSize = 45
  end
  object pnlTop: TORAutoPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 80
    Align = alTop
    Constraints.MinHeight = 40
    Constraints.MinWidth = 300
    TabOrder = 0
    object lblFlags: TLabel
      Left = 1
      Top = 1
      Width = 495
      Height = 13
      Align = alTop
      Caption = 'Active Flag'
      Layout = tlCenter
    end
    object lstFlags: TORListBox
      Left = 1
      Top = 14
      Width = 495
      Height = 65
      Align = alClient
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = lstFlagsClick
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
      OnChange = lstFlagsClick
    end
  end
  object memFlags: TRichEdit
    Left = 0
    Top = 80
    Width = 497
    Height = 228
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    WantReturns = False
    WordWrap = False
  end
  object pnlNotes: TPanel
    Left = 0
    Top = 312
    Width = 497
    Height = 152
    Align = alBottom
    TabOrder = 2
    object lblNoteTitle: TLabel
      Left = 1
      Top = 1
      Width = 495
      Height = 13
      Align = alTop
      Caption = 'lblNoteTitle'
    end
    object lvPRF: TCaptionListView
      Left = 1
      Top = 14
      Width = 495
      Height = 106
      Align = alClient
      Columns = <
        item
          Caption = 'Used For Screen Readers'
          Width = 1
        end
        item
          AutoSize = True
          Caption = 'Date'
        end
        item
          AutoSize = True
          Caption = 'Action'
        end
        item
          AutoSize = True
          Caption = 'Author'
        end>
      Constraints.MinHeight = 50
      HideSelection = False
      Items.Data = {
        6C0000000100000000000000FFFFFFFFFFFFFFFF03000000000000000857414E
        44455245521C4F63746F6265722032302C20323030334031303A31353A32333A
        3233115245414C4C59204C4F4E47205354554646115069636B6572696E672C20
        4D6F726F6E69FFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = lvPRFClick
      OnKeyDown = lvPRFKeyDown
    end
    object pnlBottom: TORAutoPanel
      Left = 1
      Top = 120
      Width = 495
      Height = 31
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        495
        31)
      object btnClose: TButton
        Left = 410
        Top = 5
        Width = 77
        Height = 21
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Close'
        ModalResult = 2
        TabOrder = 0
      end
    end
  end
end
