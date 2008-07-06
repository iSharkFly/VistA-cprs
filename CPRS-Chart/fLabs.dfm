inherited frmLabs: TfrmLabs
  Left = 376
  Top = 237
  Height = 387
  HelpContext = 8000
  Caption = 'Laboratory Results Page'
  HelpFile = 'qnoback'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited shpPageBottom: TShape
    Top = 348
  end
  inherited sptHorz: TSplitter
    Height = 348
  end
  inherited pnlLeft: TPanel
    Height = 348
    object lblReports: TOROffsetLabel
      Left = 0
      Top = 0
      Width = 97
      Height = 19
      Align = alTop
      Caption = 'Lab Results'
      HorzOffset = 2
      Transparent = False
      VertOffset = 6
      WordWrap = False
    end
    object lblDates: TOROffsetLabel
      Left = 0
      Top = 225
      Width = 97
      Height = 15
      Align = alBottom
      Caption = 'Date Range'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = False
    end
    object lblHeaders: TOROffsetLabel
      Left = 0
      Top = 125
      Width = 97
      Height = 15
      Align = alBottom
      Caption = 'Headings'
      HorzOffset = 2
      Transparent = False
      VertOffset = 2
      WordWrap = False
    end
    object lstReports: TORListBox
      Left = 0
      Top = 19
      Width = 97
      Height = 106
      Align = alClient
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = lstReportsClick
      Caption = 'Lab Results'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object lstHeaders: TORListBox
      Left = 0
      Top = 140
      Width = 97
      Height = 52
      Align = alBottom
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = lstHeadersClick
      Caption = 'Headings'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object lstDates: TORListBox
      Left = 0
      Top = 240
      Width = 97
      Height = 108
      Align = alBottom
      ItemHeight = 13
      Items.Strings = (
        'S^Date Range...'
        '1^Today'
        '8^One Week'
        '15^Two Weeks'
        '31^One Month'
        '183^Six Months'
        '366^One Year'
        '732^Two Years'
        '66666^All Results')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = lstDatesClick
      Caption = 'Date Range'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '2'
    end
    object pnlOtherTests: TORAutoPanel
      Left = 0
      Top = 192
      Width = 97
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object bvlOtherTests: TBevel
        Left = 3
        Top = 31
        Width = 90
        Height = 2
      end
      object cmdOtherTests: TButton
        Left = 11
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Other Tests'
        TabOrder = 0
        OnClick = cmdOtherTestsClick
      end
    end
  end
  inherited pnlRight: TPanel
    Height = 348
    OnResize = pnlRightResize
    object lblHeading: TOROffsetLabel
      Left = 0
      Top = 0
      Width = 539
      Height = 19
      Align = alTop
      Caption = 'Laboratory Results'
      HorzOffset = 2
      Transparent = False
      VertOffset = 6
      WordWrap = False
    end
    object pnlHeader: TORAutoPanel
      Left = 0
      Top = 19
      Width = 539
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object bvlHeader: TBevel
        Left = 0
        Top = 0
        Width = 539
        Height = 2
        Align = alTop
      end
      object lblDateFloat: TLabel
        Left = 396
        Top = 4
        Width = 56
        Height = 13
        Caption = 'lblDateFloat'
        Visible = False
      end
      object pnlWorksheet: TORAutoPanel
        Left = 0
        Top = 2
        Width = 539
        Height = 58
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object chkValues: TCheckBox
          Left = 404
          Top = 39
          Width = 93
          Height = 17
          Caption = 'Values'
          Enabled = False
          TabOrder = 5
          OnClick = chkValuesClick
        end
        object chk3D: TCheckBox
          Left = 329
          Top = 39
          Width = 56
          Height = 17
          Caption = '3D'
          Enabled = False
          TabOrder = 4
          OnClick = chk3DClick
        end
        object ragHorV: TRadioGroup
          Left = 12
          Top = 0
          Width = 213
          Height = 36
          Caption = 'Table Format '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '&Horizontal'
            '&Vertical')
          TabOrder = 0
          OnClick = ragHorVClick
        end
        object chkAbnormals: TCheckBox
          Left = 12
          Top = 39
          Width = 221
          Height = 17
          Caption = 'Abnormal Results Only'
          TabOrder = 2
          OnClick = ragHorVClick
        end
        object ragCorG: TRadioGroup
          Left = 252
          Top = 0
          Width = 213
          Height = 36
          Caption = 'Other Formats '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            '&Comments'
            '&Graph')
          TabOrder = 1
          OnClick = ragCorGClick
        end
        object chkZoom: TCheckBox
          Left = 253
          Top = 39
          Width = 68
          Height = 17
          Caption = 'Zoom'
          Enabled = False
          TabOrder = 3
          OnClick = chkZoomClick
        end
      end
      object pnlGraph: TORAutoPanel
        Left = 0
        Top = 2
        Width = 539
        Height = 58
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object lblGraphInfo: TLabel
          Left = 0
          Top = 45
          Width = 539
          Height = 13
          Align = alBottom
          Caption = 
            'To Zoom, hold down the mouse button while dragging an area to be' +
            ' enlarged.'
        end
        object chkGraph3D: TCheckBox
          Left = 162
          Top = 13
          Width = 61
          Height = 17
          Caption = '3D'
          TabOrder = 1
          OnClick = chkGraph3DClick
        end
        object chkGraphValues: TCheckBox
          Left = 276
          Top = 13
          Width = 101
          Height = 17
          Caption = 'Values'
          TabOrder = 2
          OnClick = chkGraphValuesClick
        end
        object chkGraphZoom: TCheckBox
          Left = 48
          Top = 13
          Width = 97
          Height = 17
          Caption = 'Zoom'
          TabOrder = 0
          OnClick = chkGraphZoomClick
        end
      end
      object pnlButtons: TORAutoPanel
        Left = 0
        Top = 2
        Width = 539
        Height = 58
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblOld: TOROffsetLabel
          Left = 4
          Top = 6
          Width = 41
          Height = 15
          Caption = 'Oldest'
          HorzOffset = 2
          Transparent = False
          VertOffset = 2
          WordWrap = False
        end
        object lblPrev: TOROffsetLabel
          Left = 48
          Top = 6
          Width = 49
          Height = 15
          Caption = 'Previous'
          HorzOffset = 2
          Transparent = False
          VertOffset = 2
          WordWrap = False
        end
        object lblNext: TOROffsetLabel
          Left = 246
          Top = 6
          Width = 31
          Height = 15
          Caption = 'Next'
          HorzOffset = 2
          Transparent = False
          VertOffset = 2
          WordWrap = False
        end
        object lblRecent: TOROffsetLabel
          Left = 287
          Top = 6
          Width = 46
          Height = 15
          Caption = 'Newest'
          HorzOffset = 2
          Transparent = False
          VertOffset = 2
          WordWrap = False
        end
        object lblMostRecent: TLabel
          Left = 368
          Top = 29
          Width = 144
          Height = 13
          Caption = 'Most Recent Lab Results'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDate: TLabel
          Left = 95
          Top = 29
          Width = 5
          Height = 13
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCollection: TLabel
          Left = 95
          Top = 8
          Width = 44
          Height = 13
          Alignment = taCenter
          Caption = 'Collected'
        end
        object cmdNext: TButton
          Left = 238
          Top = 23
          Width = 45
          Height = 25
          Caption = '>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = cmdNextClick
        end
        object cmdPrev: TButton
          Left = 49
          Top = 23
          Width = 45
          Height = 25
          Caption = '<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = cmdPrevClick
        end
        object cmdRecent: TButton
          Left = 283
          Top = 23
          Width = 45
          Height = 25
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = cmdRecentClick
        end
        object cmdOld: TButton
          Left = 4
          Top = 23
          Width = 45
          Height = 25
          Caption = '<<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = cmdOldClick
        end
      end
    end
    object pnlFooter: TORAutoPanel
      Left = 0
      Top = 328
      Width = 539
      Height = 20
      Align = alBottom
      TabOrder = 7
      object lblSpecimen: TLabel
        Left = 4
        Top = 28
        Width = 57
        Height = 13
        Caption = 'lblSpecimen'
        Visible = False
      end
      object lblSingleTest: TLabel
        Left = 88
        Top = 28
        Width = 60
        Height = 13
        Caption = 'lblSingleTest'
        Visible = False
      end
      object lblFooter: TOROffsetLabel
        Left = 1
        Top = 1
        Width = 537
        Height = 25
        Align = alTop
        Caption = 
          '  KEY: "L" = Abnormal Low, "H" = Abnormal High, "*" = Critical V' +
          'alue'
        HorzOffset = 2
        Transparent = False
        VertOffset = 2
        WordWrap = False
      end
      object lstTests: TORListBox
        Left = 24
        Top = 27
        Width = 89
        Height = 17
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        ItemTipColor = clWindow
        LongList = False
      end
    end
    object grdLab: TCaptionStringGrid
      Left = 0
      Top = 95
      Width = 539
      Height = 122
      Align = alTop
      Color = clCream
      DefaultRowHeight = 15
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
      ParentFont = False
      TabOrder = 2
      Visible = False
      Caption = 'Laboratory Results'
      ColWidths = (
        64
        64
        64
        64
        64)
      RowHeights = (
        15
        15)
    end
    object pnlChart: TPanel
      Left = 0
      Top = 217
      Width = 539
      Height = 85
      Align = alTop
      BevelOuter = bvNone
      Caption = 'no results to graph'
      TabOrder = 3
      Visible = False
      object lblGraph: TLabel
        Left = 0
        Top = 72
        Width = 370
        Height = 13
        Alignment = taCenter
        Caption = 
          'Results may be available, but cannot be graphed. Please try an a' +
          'lternate view.'
      end
      object lstTestGraph: TORListBox
        Left = 0
        Top = 0
        Width = 97
        Height = 85
        Align = alLeft
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = lstTestGraphClick
        Caption = 'Tests Graphed'
        ItemTipColor = clWindow
        LongList = False
        Pieces = '2'
      end
      object chtChart: TChart
        Left = 97
        Top = 0
        Width = 442
        Height = 85
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'test name')
        Title.Visible = False
        OnClickLegend = chtChartClickLegend
        OnClickSeries = chtChartClickSeries
        OnUndoZoom = chtChartUndoZoom
        LeftAxis.Title.Caption = 'units'
        Legend.Alignment = laTop
        Legend.Inverted = True
        Legend.ShadowSize = 2
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        Color = clSilver
        PopupMenu = popChart
        TabOrder = 1
        OnMouseDown = chtChartMouseDown
        object serHigh: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ref High'
          LinePen.Style = psDash
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object serLow: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ref Low'
          LinePen.Style = psDash
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object serTest: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Lab Test'
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.Visible = True
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object memLab: TRichEdit
      Left = 0
      Top = 321
      Width = 539
      Height = 7
      Align = alClient
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 5
      Visible = False
      WantReturns = False
      WordWrap = False
    end
    object Memo1: TMemo
      Left = 0
      Top = 302
      Width = 539
      Height = 19
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 4
      Visible = False
      WantTabs = True
      WordWrap = False
      OnKeyUp = Memo1KeyUp
    end
    object TabControl1: TTabControl
      Left = 0
      Top = 79
      Width = 539
      Height = 16
      Align = alTop
      HotTrack = True
      Style = tsButtons
      TabHeight = 16
      TabOrder = 1
      Visible = False
      OnChange = TabControl1Change
    end
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 321
      Width = 539
      Height = 7
      TabStop = False
      Align = alClient
      TabOrder = 6
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C000000B5370000B90000000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 5
    Top = 320
    object GotoTop1: TMenuItem
      Caption = 'Go to Top'
      Enabled = False
      OnClick = GotoTop1Click
    end
    object GotoBottom1: TMenuItem
      Caption = 'Go to Bottom'
      Enabled = False
      OnClick = GotoBottom1Click
    end
    object FreezeText1: TMenuItem
      Caption = 'Freeze Text'
      Enabled = False
      OnClick = FreezeText1Click
    end
    object UnfreezeText1: TMenuItem
      Caption = 'Un-freeze Text'
      Enabled = False
      OnClick = UnfreezeText1Click
    end
  end
  object popChart: TPopupMenu
    OnPopup = popChartPopup
    Left = 37
    Top = 317
    object popValues: TMenuItem
      Caption = 'Values'
      OnClick = popValuesClick
    end
    object pop3D: TMenuItem
      Caption = '3D'
      OnClick = pop3DClick
    end
    object popZoom: TMenuItem
      Caption = 'Zoom Enabled'
      OnClick = popZoomClick
    end
    object popZoomBack: TMenuItem
      Caption = 'Zoom Back'
      OnClick = popZoomBackClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popCopy: TMenuItem
      Caption = 'Copy'
      OnClick = popCopyClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popDetails: TMenuItem
      Caption = 'Details'
      OnClick = popDetailsClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object popPrint: TMenuItem
      Caption = 'Print'
      OnClick = popPrintClick
    end
  end
  object calLabRange: TORDateRangeDlg
    DateOnly = True
    Instruction = 'Enter a date range -'
    LabelStart = 'Begin Date'
    LabelStop = 'End Date'
    RequireTime = False
    Format = 'mmm d,yy'
    Left = 66
    Top = 320
  end
  object dlgWinPrint: TPrintDialog
    Left = 610
    Top = 23
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 253
    Top = 45
  end
end
