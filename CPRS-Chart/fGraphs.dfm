object frmGraphs: TfrmGraphs
  Left = 524
  Top = 105
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'CPRS Graphing - CPRSpatient,One'
  ClientHeight = 412
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = mnuPopGraphStuff
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTemp: TPanel
      Left = 416
      Top = 0
      Width = 73
      Height = 17
      TabOrder = 1
      Visible = False
    end
    object pnlInfo: TORAutoPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 21
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Select multiple items using Ctrl-click or Shift-click.'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object chartBase: TChart
      Left = 145
      Top = 0
      Width = 105
      Height = 17
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = clPurple
      Gradient.Visible = True
      Title.Text.Strings = (
        'fsdfs dfs fsd')
      Title.Visible = False
      OnClickLegend = chartBaseClickLegend
      OnClickSeries = chartBaseClickSeries
      OnUndoZoom = ChartOnUndoZoom
      OnZoom = ChartOnZoom
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Increment = 0.000694444444444444
      BottomAxis.Maximum = 25
      BottomAxis.Visible = False
      Legend.Alignment = laTop
      Legend.LegendStyle = lsSeries
      Legend.ResizeChart = False
      TopAxis.LabelsOnAxis = False
      View3D = False
      Color = clRed
      TabOrder = 0
      Visible = False
      OnDblClick = mnuPopGraphDetailsClick
      OnMouseDown = chartBaseMouseDown
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 383
    Width = 592
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lblDateRange: TLabel
      Left = 3
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Date Range:'
    end
    object btnClose: TButton
      Left = 510
      Top = 4
      Width = 70
      Height = 21
      Caption = 'Close'
      TabOrder = 4
      OnClick = btnCloseClick
    end
    object btnChangeSettings: TButton
      Left = 380
      Top = 4
      Width = 85
      Height = 21
      Caption = 'Settings...'
      TabOrder = 3
      OnClick = btnChangeSettingsClick
    end
    object cboDateRange: TORComboBox
      Left = 68
      Top = 4
      Width = 121
      Height = 21
      Style = orcsDropDown
      AutoSelect = True
      Color = clWindow
      DropDownCount = 9
      Items.Strings = (
        'S^Date Range...'
        '1^Today'
        '2^One Week'
        '3^Two Weeks'
        '4^One Month'
        '5^Six Months'
        '6^One Year'
        '7^Two Years'
        '8^All Results')
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
      LongList = False
      LookupPiece = 0
      MaxLength = 0
      Pieces = '2'
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
      TabStop = True
      OnChange = cboDateRangeChange
      OnDropDown = cboDateRangeDropDown
      CharsNeedMatch = 1
    end
    object chkDualViews: TCheckBox
      Left = 197
      Top = 7
      Width = 85
      Height = 17
      Caption = 'Split Views'
      TabOrder = 1
      OnClick = chkDualViewsClick
    end
    object btnGraphSelections: TButton
      Left = 284
      Top = 4
      Width = 85
      Height = 21
      Caption = 'Select/Define...'
      TabOrder = 2
      OnClick = btnGraphSelectionsClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 21
    Width = 592
    Height = 362
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object splGraphs: TSplitter
      Left = 0
      Top = 261
      Width = 592
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = clBtnShadow
      ParentColor = False
      OnMoved = splGraphsMoved
    end
    object pnlTop: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 592
      Height = 261
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object splItemsTop: TSplitter
        Left = 148
        Top = 0
        Width = 2
        Height = 261
        Cursor = crHSplit
        AutoSnap = False
        Beveled = True
        MinSize = 15
        OnMoved = splItemsTopMoved
      end
      object pnlItemsTop: TPanel
        Left = 0
        Top = 0
        Width = 148
        Height = 261
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object pnlItemsTopInfo: TPanel
          Left = 0
          Top = 0
          Width = 148
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            148
            25)
          object bvlBottomLeft: TBevel
            Left = 0
            Top = 0
            Width = 2
            Height = 25
            Align = alLeft
          end
          object bvlBottomRight: TBevel
            Left = 146
            Top = 0
            Width = 2
            Height = 25
            Align = alRight
            Visible = False
          end
          object lblViewsTop: TOROffsetLabel
            Left = 2
            Top = 0
            Width = 28
            Height = 25
            Align = alLeft
            Caption = 'View:'
            HorzOffset = 2
            Transparent = False
            VertOffset = 8
            WordWrap = False
          end
          object chkItemsTop: TCheckBox
            Left = 40
            Top = 5
            Width = 105
            Height = 20
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Individual Graphs'
            TabOrder = 0
            OnClick = chkItemsTopClick
          end
        end
        object lvwItemsTop: TListView
          Left = 0
          Top = 46
          Width = 148
          Height = 215
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = <
            item
              Caption = 'Item'
              Width = 100
            end
            item
              Caption = 'Type'
              Width = 60
            end
            item
              Caption = 'View'
              Width = 40
            end
            item
              Caption = 'Classification'
            end>
          HideSelection = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          ViewStyle = vsReport
          OnChange = lvwItemsTopChange
          OnClick = lvwItemsTopClick
          OnColumnClick = lvwItemsTopColumnClick
          OnCompare = lvwItemsTopCompare
          OnEnter = lvwItemsTopEnter
          OnKeyDown = lvwItemsTopKeyDown
        end
        object pnlViewsTopSpacer: TPanel
          Left = 0
          Top = 25
          Width = 148
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object cboViewsTop: TORComboBox
            Left = 0
            Top = 0
            Width = 140
            Height = 21
            Style = orcsDropDown
            Align = alClient
            AutoSelect = True
            Color = clWindow
            DropDownCount = 12
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = False
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 0
            TabStop = True
            OnChange = cboViewsTopChange
            OnDropDown = cboViewsTopDropDown
            OnDropDownClose = cboViewsTopDropDownClose
            CharsNeedMatch = 1
          end
          object pnlViewsTopSpacerRight: TPanel
            Left = 140
            Top = 0
            Width = 8
            Height = 21
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
      object pnlTopRightPad: TPanel
        Tag = 50
        Left = 577
        Top = 0
        Width = 15
        Height = 261
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
      object pnlScrollTopBase: TPanel
        Left = 150
        Top = 0
        Width = 427
        Height = 261
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        OnResize = pnlScrollTopBaseResize
        object pnlBlankTop: TPanel
          Left = 0
          Top = 233
          Width = 427
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          Visible = False
        end
        object scrlTop: TScrollBox
          Tag = 5
          Left = 0
          Top = 233
          Width = 427
          Height = 20
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
        end
        object pnlDatelineTop: TPanel
          Left = 0
          Top = 231
          Width = 427
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object chartDatelineTop: TChart
            Left = 20
            Top = 0
            Width = 407
            Height = 30
            AllowPanning = pmNone
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            BackWall.Pen.Visible = False
            Gradient.EndColor = clWhite
            Gradient.StartColor = 8421631
            Title.Text.Strings = (
              '')
            Title.Visible = False
            OnClickLegend = chartBaseClickLegend
            OnClickSeries = chartBaseClickSeries
            OnUndoZoom = ChartOnUndoZoom
            OnZoom = ChartOnZoom
            BottomAxis.Automatic = False
            BottomAxis.AutomaticMaximum = False
            BottomAxis.AutomaticMinimum = False
            BottomAxis.DateTimeFormat = 'M/d/yyyy'
            BottomAxis.Increment = 0.000694444444444444
            BottomAxis.Maximum = 25
            Frame.Visible = False
            LeftAxis.Automatic = False
            LeftAxis.AutomaticMaximum = False
            LeftAxis.AutomaticMinimum = False
            LeftAxis.Axis.Visible = False
            LeftAxis.Grid.Visible = False
            LeftAxis.Labels = False
            LeftAxis.LabelsOnAxis = False
            LeftAxis.Maximum = 9
            LeftAxis.MinorGrid.Visible = True
            LeftAxis.RoundFirstLabel = False
            LeftAxis.Title.Caption = ' '
            LeftAxis.Visible = False
            Legend.Alignment = laBottom
            Legend.Color = clCream
            Legend.LegendStyle = lsSeries
            Legend.ShadowSize = 1
            Legend.Visible = False
            RightAxis.Automatic = False
            RightAxis.AutomaticMaximum = False
            RightAxis.AutomaticMinimum = False
            RightAxis.Axis.Visible = False
            RightAxis.Labels = False
            RightAxis.LabelsOnAxis = False
            RightAxis.RoundFirstLabel = False
            RightAxis.Visible = False
            TopAxis.LabelsOnAxis = False
            View3D = False
            View3DWalls = False
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            OnDblClick = mnuPopGraphDetailsClick
            OnMouseDown = chartBaseMouseDown
            object serDatelineTop: TGanttSeries
              ColorEachPoint = True
              Marks.ArrowLength = 0
              Marks.Visible = False
              SeriesColor = clRed
              ShowInLegend = False
              OnGetMarkText = serDatelineTopGetMarkText
              Pointer.InflateMargins = False
              Pointer.Style = psRectangle
              Pointer.Visible = True
              XValues.DateTime = True
              XValues.Name = 'Start'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
              StartValues.DateTime = True
              StartValues.Name = 'Start'
              StartValues.Multiplier = 1
              StartValues.Order = loAscending
              EndValues.DateTime = True
              EndValues.Name = 'End'
              EndValues.Multiplier = 1
              EndValues.Order = loNone
              NextTask.DateTime = False
              NextTask.Name = 'NextTask'
              NextTask.Multiplier = 1
              NextTask.Order = loNone
            end
          end
          object pnlDatelineTopSpacer: TORAutoPanel
            Left = 0
            Top = 0
            Width = 20
            Height = 30
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object pnlData: TPanel
          Left = 0
          Top = 0
          Width = 427
          Height = 233
          Align = alTop
          Caption = 'pnlData'
          TabOrder = 2
          Visible = False
          DesignSize = (
            427
            233)
          object lstZoomHistory: TListBox
            Left = 336
            Top = 4
            Width = 82
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 22
          end
          object lstTypes: TListBox
            Left = 8
            Top = 119
            Width = 413
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
          end
          object lstItemsTemp: TListBox
            Left = 8
            Top = 4
            Width = 73
            Height = 33
            ItemHeight = 13
            TabOrder = 1
          end
          object lstAllTypes: TListBox
            Left = 254
            Top = 4
            Width = 82
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 2
          end
          object lstItems: TListBox
            Left = 8
            Top = 158
            Width = 413
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 3
          end
          object lstData: TListBox
            Left = 8
            Top = 81
            Width = 413
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 4
          end
          object lstSpec2: TListBox
            Left = 188
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 5
          end
          object lstSpec1: TListBox
            Left = 143
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 6
          end
          object lstSpec3: TListBox
            Left = 233
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 7
          end
          object lstSpec4: TListBox
            Left = 278
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 8
          end
          object lstMultiSpec: TListBox
            Left = 320
            Top = 43
            Width = 45
            Height = 33
            ItemHeight = 13
            TabOrder = 10
          end
          object lstTestSpec: TListBox
            Left = 368
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 11
          end
          object lstSelCopyBottom: TListBox
            Left = 283
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            TabOrder = 15
          end
          object lstTempCheck: TListBox
            Left = 53
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 18
          end
          object lstViews: TListBox
            Left = 191
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 19
          end
          object lstScratchTemp: TListBox
            Left = 53
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 20
          end
          object lstScratchLab: TListBox
            Left = 98
            Top = 43
            Width = 42
            Height = 33
            ItemHeight = 13
            TabOrder = 21
          end
          object lstCheck: TListBox
            Left = 172
            Top = 5
            Width = 73
            Height = 33
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 13
          end
          object lstSelCopyTop: TListBox
            Left = 237
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            TabOrder = 16
          end
          object lstScratchSwap: TListBox
            Left = 8
            Top = 43
            Width = 41
            Height = 33
            ItemHeight = 13
            TabOrder = 9
          end
          object lstNonNumeric: TListBox
            Left = 90
            Top = 4
            Width = 79
            Height = 33
            ItemHeight = 13
            TabOrder = 12
          end
          object lstDrugClass: TListBox
            Left = 8
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            TabOrder = 14
          end
          object lstSelPrevTop: TListBox
            Left = 329
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            TabOrder = 23
          end
          object lstSelPrevBottom: TListBox
            Left = 375
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            TabOrder = 24
          end
          object lstTemp: TListBox
            Left = 99
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 17
          end
          object lstComp: TListBox
            Left = 145
            Top = 195
            Width = 41
            Height = 33
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 25
          end
        end
      end
    end
    object pnlBottom: TPanel
      Tag = 1
      Left = 0
      Top = 264
      Width = 592
      Height = 98
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object splItemsBottom: TSplitter
        Left = 148
        Top = 0
        Width = 2
        Height = 98
        Cursor = crHSplit
        AutoSnap = False
        Beveled = True
        MinSize = 15
        OnMoved = splItemsBottomMoved
      end
      object pnlItemsBottom: TPanel
        Left = 0
        Top = 0
        Width = 148
        Height = 98
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object pnlItemsBottomInfo: TPanel
          Left = 0
          Top = 0
          Width = 148
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            148
            25)
          object bvlTopLeft: TBevel
            Left = 0
            Top = 0
            Width = 2
            Height = 25
            Align = alLeft
          end
          object bvlTopRight: TBevel
            Left = 146
            Top = 0
            Width = 2
            Height = 25
            Align = alRight
            Visible = False
          end
          object lblViewsBottom: TOROffsetLabel
            Left = 2
            Top = 0
            Width = 28
            Height = 25
            Align = alLeft
            Caption = 'View:'
            HorzOffset = 2
            Transparent = False
            VertOffset = 8
            WordWrap = False
          end
          object chkItemsBottom: TCheckBox
            Left = 40
            Top = 5
            Width = 105
            Height = 20
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Individual Graphs'
            TabOrder = 0
            OnClick = chkItemsBottomClick
            OnEnter = chkItemsBottomEnter
          end
        end
        object lvwItemsBottom: TListView
          Left = 0
          Top = 46
          Width = 148
          Height = 52
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = <
            item
              Caption = 'Item'
              Width = 100
            end
            item
              Caption = 'Type'
              Width = 60
            end
            item
              Caption = 'View'
              Width = 40
            end
            item
              Caption = 'Classification'
            end>
          HideSelection = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          ViewStyle = vsReport
          OnChange = lvwItemsBottomChange
          OnClick = lvwItemsBottomClick
          OnColumnClick = lvwItemsBottomColumnClick
          OnCompare = lvwItemsBottomCompare
          OnEnter = lvwItemsBottomEnter
          OnKeyDown = lvwItemsTopKeyDown
        end
        object pnlViewsBottomSpacer: TPanel
          Left = 0
          Top = 25
          Width = 148
          Height = 21
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object cboViewsBottom: TORComboBox
            Left = 0
            Top = 0
            Width = 140
            Height = 21
            Style = orcsDropDown
            Align = alClient
            AutoSelect = True
            Color = clWindow
            DropDownCount = 12
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = False
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 0
            TabStop = True
            OnChange = cboViewsBottomChange
            OnDropDown = cboViewsBottomDropDown
            OnDropDownClose = cboViewsBottomDropDownClose
            OnEnter = cboViewsBottomEnter
            CharsNeedMatch = 1
          end
          object pnlViewsBottomSpacerRight: TPanel
            Left = 140
            Top = 0
            Width = 8
            Height = 21
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
      object pnlBottomRightPad: TPanel
        Tag = 50
        Left = 577
        Top = 0
        Width = 15
        Height = 98
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
      object pnlScrollBottomBase: TPanel
        Left = 150
        Top = 0
        Width = 427
        Height = 98
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object pnlBlankBottom: TPanel
          Left = 0
          Top = 0
          Width = 427
          Height = 68
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
        end
        object pnlDatelineBottom: TPanel
          Left = 0
          Top = 68
          Width = 427
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object chartDatelineBottom: TChart
            Left = 20
            Top = 0
            Width = 407
            Height = 30
            AllowPanning = pmNone
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            BackWall.Pen.Visible = False
            Gradient.EndColor = clGradientActiveCaption
            Title.Text.Strings = (
              '')
            Title.Visible = False
            OnClickLegend = chartBaseClickLegend
            OnClickSeries = chartBaseClickSeries
            OnUndoZoom = ChartOnUndoZoom
            OnZoom = ChartOnZoom
            BottomAxis.Automatic = False
            BottomAxis.AutomaticMaximum = False
            BottomAxis.AutomaticMinimum = False
            BottomAxis.DateTimeFormat = 'M/d/yyyy'
            BottomAxis.Increment = 0.000694444444444444
            BottomAxis.Maximum = 25
            Frame.Visible = False
            LeftAxis.Automatic = False
            LeftAxis.AutomaticMaximum = False
            LeftAxis.AutomaticMinimum = False
            LeftAxis.Axis.Visible = False
            LeftAxis.ExactDateTime = False
            LeftAxis.Labels = False
            LeftAxis.LabelsOnAxis = False
            LeftAxis.Maximum = 9
            LeftAxis.MinorGrid.Visible = True
            LeftAxis.RoundFirstLabel = False
            LeftAxis.Title.Caption = ' '
            Legend.Alignment = laBottom
            Legend.Color = clCream
            Legend.LegendStyle = lsSeries
            Legend.ShadowSize = 1
            Legend.Visible = False
            RightAxis.Automatic = False
            RightAxis.AutomaticMaximum = False
            RightAxis.AutomaticMinimum = False
            RightAxis.Axis.Visible = False
            RightAxis.Labels = False
            RightAxis.LabelsOnAxis = False
            RightAxis.RoundFirstLabel = False
            RightAxis.Visible = False
            TopAxis.LabelsOnAxis = False
            View3D = False
            View3DWalls = False
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            OnDblClick = mnuPopGraphDetailsClick
            OnMouseDown = chartBaseMouseDown
            object serDatelineBottom: TGanttSeries
              ColorEachPoint = True
              Marks.ArrowLength = 0
              Marks.Visible = False
              SeriesColor = clRed
              ShowInLegend = False
              OnGetMarkText = serDatelineTopGetMarkText
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = True
              XValues.DateTime = True
              XValues.Name = 'Start'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
              StartValues.DateTime = True
              StartValues.Name = 'Start'
              StartValues.Multiplier = 1
              StartValues.Order = loAscending
              EndValues.DateTime = True
              EndValues.Name = 'End'
              EndValues.Multiplier = 1
              EndValues.Order = loNone
              NextTask.DateTime = False
              NextTask.Name = 'NextTask'
              NextTask.Multiplier = 1
              NextTask.Order = loNone
            end
          end
          object pnlDatelineBottomSpacer: TORAutoPanel
            Left = 0
            Top = 0
            Width = 20
            Height = 30
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object scrlBottom: TScrollBox
          Tag = 5
          Left = 0
          Top = 0
          Width = 427
          Height = 68
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
        end
      end
    end
  end
  object mnuPopGraphStuff: TPopupMenu
    OnPopup = mnuPopGraphStuffPopup
    Left = 4
    object mnuPopGraphDetails: TMenuItem
      Caption = 'Details...'
      Enabled = False
      OnClick = mnuPopGraphDetailsClick
    end
    object mnuPopGraphDefineViews: TMenuItem
      Caption = 'Select/Define...'
      OnClick = btnGraphSelectionsClick
    end
    object mnuPopGraphChangeViews: TMenuItem
      Caption = 'Settings...'
      OnClick = btnChangeSettingsClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnuPopGraphReset: TMenuItem
      Caption = 'Reset Display'
      ShortCut = 45
      OnClick = mnuPopGraphResetClick
    end
    object mnuPopGraphZoomBack: TMenuItem
      Caption = 'Zoom Back'
      Enabled = False
      ShortCut = 46
      OnClick = mnuPopGraphZoomBackClick
    end
    object mnuPopGraphSplit: TMenuItem
      Caption = 'Split Numerics/Events'
      OnClick = mnuPopGraphSplitClick
    end
    object mnuPopGraphSwap: TMenuItem
      Caption = 'Swap'
      OnClick = mnuPopGraphSwapClick
    end
    object mnuPopGraphIsolate: TMenuItem
      Caption = 'Move'
      Enabled = False
      OnClick = mnuPopGraphIsolateClick
    end
    object mnuPopGraphRemove: TMenuItem
      Caption = 'Remove'
      Enabled = False
      OnClick = mnuPopGraphRemoveClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuPopGraphStayOnTop: TMenuItem
      Caption = 'Stay on Top'
      OnClick = mnuPopGraphStayOnTopClick
    end
    object mnuPopGraphDualViews: TMenuItem
      Caption = 'Dual Views'
      Visible = False
      OnClick = mnuPopGraphDualViewsClick
    end
    object mnuPopGraphSeparate1: TMenuItem
      Caption = 'Individual Graphs'
      Visible = False
      OnClick = mnuPopGraphSeparate1Click
    end
    object mnuPopGraph3D: TMenuItem
      Caption = '3D'
      OnClick = mnuPopGraph3DClick
    end
    object mnuPopGraphLegend: TMenuItem
      Caption = 'Legend'
      Visible = False
      OnClick = mnuPopGraphLegendClick
    end
    object mnuPopGraphValues: TMenuItem
      Caption = 'Values'
      OnClick = mnuPopGraphValuesClick
    end
    object mnuPopGraphFixed: TMenuItem
      Caption = 'Fixed Date Range'
      Visible = False
      OnClick = mnuPopGraphFixedClick
    end
    object mnuPopGraphVertical: TMenuItem
      Caption = 'Vertical Zoom'
      OnClick = mnuPopGraphVerticalClick
    end
    object mnuPopGraphHorizontal: TMenuItem
      Caption = 'Horizontal Zoom'
      Visible = False
      OnClick = mnuPopGraphHorizontalClick
    end
    object mnuPopGraphLines: TMenuItem
      Caption = 'Lines'
      Visible = False
      OnClick = mnuPopGraphLinesClick
    end
    object mnuPopGraphDates: TMenuItem
      Caption = 'Dates'
      Visible = False
      OnClick = mnuPopGraphDatesClick
    end
    object mnuPopGraphSort: TMenuItem
      Caption = 'Sort by Type'
      Visible = False
      OnClick = mnuPopGraphSortClick
    end
    object mnuPopGraphClear: TMenuItem
      Caption = 'Clear Background'
      Visible = False
      OnClick = mnuPopGraphClearClick
    end
    object mnuPopGraphGradient: TMenuItem
      Caption = 'Gradient'
      Visible = False
      OnClick = mnuPopGraphGradientClick
    end
    object mnuPopGraphHints: TMenuItem
      Caption = 'Hints'
      Visible = False
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuPopGraphCopy: TMenuItem
      Caption = 'Copy'
      ShortCut = 16451
      OnClick = mnuPopGraphCopyClick
    end
    object mnuPopGraphPrint: TMenuItem
      Caption = 'Print...'
      OnClick = mnuPopGraphPrintClick
    end
    object N3: TMenuItem
      Caption = '-'
      Visible = False
    end
    object mnumedsasgantt: TMenuItem
      Caption = 'meds as gantt'
      Checked = True
      RadioItem = True
      Visible = False
      OnClick = mnumedsasganttClick
    end
    object mnumedsasganttvertheight: TMenuItem
      Caption = 'meds as gantt + vert + height change'
      RadioItem = True
      Visible = False
      OnClick = mnumedsasganttClick
    end
    object mnuPopGraphToday: TMenuItem
      Caption = 'Reset Today...'
      Visible = False
      OnClick = mnuPopGraphTodayClick
    end
    object testcount1: TMenuItem
      Caption = 'test count'
      Visible = False
      OnClick = testcount1Click
    end
  end
  object calDateRange: TORDateRangeDlg
    DateOnly = False
    Instruction = 'Enter a date range -'
    LabelStart = 'Begin Date'
    LabelStop = 'End Date'
    RequireTime = False
    Format = 'mmm d,yy@hh:nn'
    Left = 32
  end
  object dlgDate: TORDateTimeDlg
    FMDateTime = 3040806
    DateOnly = True
    RequireTime = False
    Left = 57
  end
  object timHintPause: TTimer
    Enabled = False
    Interval = 100
    OnTimer = timHintPauseTimer
    Left = 83
  end
end
