inherited frmDCSumm: TfrmDCSumm
  Left = 1291
  Top = 197
  HelpContext = 7000
  Caption = 'Discharge Summary Page'
  ClientHeight = 382
  ClientWidth = 679
  HelpFile = 'overvw'
  Menu = mnuSumms
  OnDestroy = FormDestroy
  ExplicitWidth = 687
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited shpPageBottom: TShape
    Top = 377
    Width = 679
    ExplicitTop = 358
    ExplicitWidth = 679
  end
  inherited sptHorz: TSplitter
    Left = 64
    Width = 3
    Height = 377
    OnCanResize = sptHorzCanResize
    ExplicitLeft = 64
    ExplicitWidth = 3
    ExplicitHeight = 358
  end
  inherited pnlLeft: TPanel
    Width = 64
    Height = 377
    ExplicitWidth = 64
    ExplicitHeight = 377
    object lblSumms: TOROffsetLabel
      Left = 0
      Top = 0
      Width = 64
      Height = 19
      Align = alTop
      Caption = 'Last 100 Summaries'
      HorzOffset = 2
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      VertOffset = 6
      WordWrap = False
    end
    object lblSpace1: TLabel
      Left = 0
      Top = 353
      Width = 64
      Height = 3
      Align = alBottom
      AutoSize = False
      Caption = ' '
      ExplicitTop = 334
    end
    object cmdNewSumm: TORAlignButton
      Left = 0
      Top = 332
      Width = 64
      Height = 21
      Align = alBottom
      Caption = 'New Summary'
      TabOrder = 1
      OnClick = cmdNewSummClick
    end
    object cmdPCE: TORAlignButton
      Left = 0
      Top = 356
      Width = 64
      Height = 21
      Align = alBottom
      Caption = 'Encounter'
      TabOrder = 2
      Visible = False
      OnClick = cmdPCEClick
    end
    object pnlDrawers: TPanel
      Left = 0
      Top = 19
      Width = 64
      Height = 313
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object splDrawers: TSplitter
        Left = 0
        Top = 310
        Width = 64
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 291
      end
      object lstSumms: TORListBox
        Left = 0
        Top = 0
        Width = 64
        Height = 33
        TabStop = False
        Ctl3D = True
        ItemHeight = 13
        ParentCtl3D = False
        ParentShowHint = False
        PopupMenu = popSummList
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnClick = lstSummsClick
        ItemTipColor = clWindow
        LongList = False
        Pieces = '2,3'
        TabPositions = '10,20'
      end
      object tvSumms: TORTreeView
        Left = 0
        Top = 0
        Width = 64
        Height = 310
        Align = alClient
        Constraints.MinWidth = 30
        HideSelection = False
        Images = dmodShared.imgNotes
        Indent = 19
        PopupMenu = popSummList
        ReadOnly = True
        StateImages = dmodShared.imgImages
        TabOrder = 1
        OnChange = tvSummsChange
        OnClick = tvSummsClick
        OnCollapsed = tvSummsCollapsed
        OnDragDrop = tvSummsDragDrop
        OnDragOver = tvSummsDragOver
        OnExpanded = tvSummsExpanded
        OnStartDrag = tvSummsStartDrag
        Caption = 'Last 100 Summaries'
        NodePiece = 0
        ShortNodeCaptions = True
      end
    end
  end
  inherited pnlRight: TPanel
    Left = 67
    Width = 612
    Height = 377
    ExplicitLeft = 67
    ExplicitWidth = 612
    ExplicitHeight = 377
    object sptVert: TSplitter
      Left = 0
      Top = 328
      Width = 612
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 309
    end
    object memPCEShow: TRichEdit
      Left = 0
      Top = 332
      Width = 612
      Height = 45
      Align = alBottom
      Color = clCream
      Lines.Strings = (
        '<No encounter information entered>')
      PlainText = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
      WantReturns = False
      WordWrap = False
    end
    object pnlWrite: TPanel
      Left = 0
      Top = 0
      Width = 612
      Height = 328
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      OnResize = pnlWriteResize
      object memNewSumm: TRichEdit
        Left = 0
        Top = 52
        Width = 612
        Height = 276
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        MaxLength = 2147483645
        ParentFont = False
        PlainText = True
        PopupMenu = popSummMemo
        ScrollBars = ssVertical
        TabOrder = 1
        WantTabs = True
        OnChange = memNewSummChange
        OnKeyUp = memNewSummKeyUp
      end
      object pnlFields: TORAutoPanel
        Left = 0
        Top = 0
        Width = 612
        Height = 52
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          612
          52)
        object bvlNewTitle: TBevel
          Left = 5
          Top = 5
          Width = 102
          Height = 15
        end
        object lblNewTitle: TStaticText
          Left = 6
          Top = 6
          Width = 104
          Height = 17
          Hint = 'Press "Change..." to select a different title.'
          Caption = ' Discharge Summary '
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = True
          TabOrder = 1
        end
        object lblVisit: TStaticText
          Left = 6
          Top = 21
          Width = 123
          Height = 17
          Caption = 'Adm: 10/20/99   2BMED'
          ShowAccelChar = False
          TabOrder = 2
        end
        object lblRefDate: TStaticText
          Left = 237
          Top = 6
          Width = 101
          Height = 17
          Hint = 'Press "Change..." to change date/time of summary.'
          Alignment = taCenter
          Caption = 'Oct 20,1999@15:30'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = True
          TabOrder = 3
        end
        object lblCosigner: TStaticText
          Left = 307
          Top = 21
          Width = 199
          Height = 13
          Hint = 'Press "Change..." to select a different attending.'
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'Attending: Winchester,Charles Emerson III'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = True
          TabOrder = 4
        end
        object lblDictator: TStaticText
          Left = 402
          Top = 6
          Width = 152
          Height = 17
          Hint = 'Press "Change..." to select a different author.'
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Winchester,Charles Emerson III'
          ParentShowHint = False
          ShowAccelChar = False
          ShowHint = True
          TabOrder = 5
        end
        object lblDischarge: TStaticText
          Left = 6
          Top = 34
          Width = 71
          Height = 17
          Caption = 'Dis: 03/20/00'
          ShowAccelChar = False
          TabOrder = 6
        end
        object cmdChange: TButton
          Left = 554
          Top = 10
          Width = 58
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Change...'
          TabOrder = 0
          OnClick = cmdChangeClick
        end
      end
    end
    object pnlRead: TPanel
      Left = 0
      Top = 0
      Width = 612
      Height = 328
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lblTitle: TOROffsetLabel
        Left = 0
        Top = 0
        Width = 612
        Height = 19
        Hint = 'No Discharge Summaries Found'
        Align = alTop
        Caption = 'No Discharge Summaries Found'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HorzOffset = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        VertOffset = 6
        WordWrap = False
      end
      object sptList: TSplitter
        Left = 0
        Top = 113
        Width = 612
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object memSumm: TRichEdit
        Left = 0
        Top = 116
        Width = 612
        Height = 212
        Align = alClient
        Color = clCream
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          
            'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRUSTVWXYZabcdefghijkl' +
            'mnopqrstuvwxyz12')
        ParentCtl3D = False
        ParentFont = False
        PlainText = True
        PopupMenu = popSummMemo
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
      object lvSumms: TCaptionListView
        Left = 0
        Top = 19
        Width = 612
        Height = 94
        Align = alTop
        Columns = <
          item
            Caption = 'Date'
            Width = 100
          end
          item
            AutoSize = True
            Caption = 'Title'
          end
          item
            AutoSize = True
            Caption = 'Subject'
          end
          item
            AutoSize = True
            Caption = 'Author'
          end
          item
            AutoSize = True
            Caption = 'Location'
          end
          item
            Caption = 'fmdate'
            Width = 0
          end
          item
            Caption = 'TIUDA'
            Width = 0
          end>
        Constraints.MinHeight = 50
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = dmodShared.imgNotes
        StateImages = dmodShared.imgImages
        TabOrder = 1
        ViewStyle = vsReport
        Visible = False
        OnColumnClick = lvSummsColumnClick
        OnCompare = lvSummsCompare
        OnResize = lvSummsResize
        OnSelectItem = lvSummsSelectItem
        Caption = 'No Discharge Summaries Found'
      end
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = cmdNewSumm'
        'Status = stsDefault')
      (
        'Component = cmdPCE'
        'Status = stsDefault')
      (
        'Component = pnlDrawers'
        'Status = stsDefault')
      (
        'Component = lstSumms'
        'Status = stsDefault')
      (
        'Component = tvSumms'
        'Status = stsDefault')
      (
        'Component = memPCEShow'
        'Status = stsDefault')
      (
        'Component = pnlWrite'
        'Status = stsDefault')
      (
        'Component = memNewSumm'
        'Status = stsDefault')
      (
        'Component = pnlFields'
        'Status = stsDefault')
      (
        'Component = lblNewTitle'
        'Status = stsDefault')
      (
        'Component = lblVisit'
        'Status = stsDefault')
      (
        'Component = lblRefDate'
        'Status = stsDefault')
      (
        'Component = lblCosigner'
        'Status = stsDefault')
      (
        'Component = lblDictator'
        'Status = stsDefault')
      (
        'Component = lblDischarge'
        'Status = stsDefault')
      (
        'Component = cmdChange'
        'Status = stsDefault')
      (
        'Component = pnlRead'
        'Status = stsDefault')
      (
        'Component = memSumm'
        'Status = stsDefault')
      (
        'Component = lvSumms'
        'Status = stsDefault')
      (
        'Component = pnlLeft'
        'Status = stsDefault')
      (
        'Component = pnlRight'
        'Status = stsDefault')
      (
        'Component = frmDCSumm'
        'Status = stsDefault'))
  end
  object mnuSumms: TMainMenu
    Left = 596
    Top = 305
    object mnuView: TMenuItem
      Caption = '&View'
      GroupIndex = 3
      object mnuViewChart: TMenuItem
        Caption = 'Chart &Tab'
        object mnuChartCover: TMenuItem
          Tag = 1
          Caption = 'Cover &Sheet'
          ShortCut = 16467
          OnClick = mnuChartTabClick
        end
        object mnuChartProbs: TMenuItem
          Tag = 2
          Caption = '&Problem List'
          ShortCut = 16464
          OnClick = mnuChartTabClick
        end
        object mnuChartMeds: TMenuItem
          Tag = 3
          Caption = '&Medications'
          ShortCut = 16461
          OnClick = mnuChartTabClick
        end
        object mnuChartOrders: TMenuItem
          Tag = 4
          Caption = '&Orders'
          ShortCut = 16463
          OnClick = mnuChartTabClick
        end
        object mnuChartSumms: TMenuItem
          Tag = 6
          Caption = 'Progress &Notes'
          ShortCut = 16462
          OnClick = mnuChartTabClick
        end
        object mnuChartCslts: TMenuItem
          Tag = 7
          Caption = 'Consul&ts'
          ShortCut = 16468
          OnClick = mnuChartTabClick
        end
        object mnuChartSurgery: TMenuItem
          Tag = 11
          Caption = 'S&urgery'
          ShortCut = 16469
          OnClick = mnuChartTabClick
        end
        object mnuChartDCSumm: TMenuItem
          Tag = 8
          Caption = '&Discharge Summaries'
          ShortCut = 16452
          OnClick = mnuChartTabClick
        end
        object mnuChartLabs: TMenuItem
          Tag = 9
          Caption = '&Laboratory'
          ShortCut = 16460
          OnClick = mnuChartTabClick
        end
        object mnuChartReports: TMenuItem
          Tag = 10
          Caption = '&Reports'
          ShortCut = 16466
          OnClick = mnuChartTabClick
        end
      end
      object mnuViewInformation: TMenuItem
        Caption = 'Information'
        OnClick = mnuViewInformationClick
        object mnuViewDemo: TMenuItem
          Tag = 1
          Caption = 'De&mographics...'
          OnClick = ViewInfo
        end
        object mnuViewVisits: TMenuItem
          Tag = 2
          Caption = 'Visits/Pr&ovider...'
          OnClick = ViewInfo
        end
        object mnuViewPrimaryCare: TMenuItem
          Tag = 3
          Caption = 'Primary &Care...'
          OnClick = ViewInfo
        end
        object mnuViewMyHealtheVet: TMenuItem
          Tag = 4
          Caption = 'MyHealthe&Vet...'
          OnClick = ViewInfo
        end
        object mnuInsurance: TMenuItem
          Tag = 5
          Caption = '&Insurance...'
          OnClick = ViewInfo
        end
        object mnuViewFlags: TMenuItem
          Tag = 6
          Caption = '&Flags...'
          OnClick = ViewInfo
        end
        object mnuViewRemoteData: TMenuItem
          Tag = 7
          Caption = 'Remote &Data...'
          OnClick = ViewInfo
        end
        object mnuViewReminders: TMenuItem
          Tag = 8
          Caption = '&Reminders...'
          Enabled = False
          OnClick = ViewInfo
        end
        object mnuViewPostings: TMenuItem
          Tag = 9
          Caption = '&Postings...'
          OnClick = ViewInfo
        end
      end
      object Z3: TMenuItem
        Caption = '-'
      end
      object mnuViewAll: TMenuItem
        Tag = 1
        Caption = '&Signed Summaries (All)'
        OnClick = mnuViewClick
      end
      object mnuViewByAuthor: TMenuItem
        Tag = 4
        Caption = 'Signed Summaries by &Author'
        OnClick = mnuViewClick
      end
      object mnuViewByDate: TMenuItem
        Tag = 5
        Caption = 'Signed Summaries by Date &Range'
        OnClick = mnuViewClick
      end
      object mnuViewUncosigned: TMenuItem
        Tag = 3
        Caption = 'Un&cosigned Summaries'
        OnClick = mnuViewClick
      end
      object mnuViewUnsigned: TMenuItem
        Tag = 2
        Caption = '&Unsigned Summaries'
        OnClick = mnuViewClick
      end
      object mnuViewCustom: TMenuItem
        Tag = 6
        Caption = 'Custo&m View'
        OnClick = mnuViewClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuViewSaveAsDefault: TMenuItem
        Caption = 'Sa&ve as Default View'
        OnClick = mnuViewSaveAsDefaultClick
      end
      object mnuViewReturnToDefault: TMenuItem
        Caption = 'Return to De&fault View'
        OnClick = mnuViewReturntoDefaultClick
      end
      object Z1: TMenuItem
        Caption = '-'
      end
      object mnuViewDetail: TMenuItem
        Caption = '&Details'
        OnClick = mnuViewDetailClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuIconLegend: TMenuItem
        Caption = 'Icon Legend'
        OnClick = mnuIconLegendClick
      end
    end
    object mnuAct: TMenuItem
      Caption = '&Action'
      GroupIndex = 4
      object mnuActNew: TMenuItem
        Caption = '&New Discharge Summary...'
        Hint = 'Creates a new Discharge Summary'
        ShortCut = 24654
        OnClick = mnuActNewClick
      end
      object mnuActAddend: TMenuItem
        Caption = '&Make Addendum...'
        Hint = 'Makes an addendum for the currently selected Discharge Summary'
        ShortCut = 24653
        OnClick = mnuActAddendClick
      end
      object mnuActAddIDEntry: TMenuItem
        Caption = 'Add Ne&w Entry to Interdisciplinary Note'
        OnClick = mnuActAddIDEntryClick
      end
      object mnuActAttachtoIDParent: TMenuItem
        Caption = 'A&ttach to Interdisciplinary Note'
        OnClick = mnuActAttachtoIDParentClick
      end
      object mnuActDetachFromIDParent: TMenuItem
        Caption = 'Detac&h from Interdisciplinary Note'
        OnClick = mnuActDetachFromIDParentClick
      end
      object Z2: TMenuItem
        Caption = '-'
      end
      object mnuActChange: TMenuItem
        Caption = '&Change Title...'
        ShortCut = 24643
        OnClick = mnuActChangeClick
      end
      object mnuActLoadBoiler: TMenuItem
        Caption = 'Reload &Boilerplate Text'
        OnClick = mnuActLoadBoilerClick
      end
      object Z4: TMenuItem
        Caption = '-'
      end
      object mnuActSignList: TMenuItem
        Caption = 'Add to Signature &List'
        Hint = 
          'Adds the currently displayed Discharge Summary to list of things' +
          ' to be signed'
        OnClick = mnuActSignListClick
      end
      object mnuActDelete: TMenuItem
        Caption = '&Delete Discharge Summary...'
        ShortCut = 24644
        OnClick = mnuActDeleteClick
      end
      object mnuActEdit: TMenuItem
        Caption = '&Edit Discharge Summary...'
        ShortCut = 24645
        OnClick = mnuActEditClick
      end
      object mnuActSave: TMenuItem
        Caption = 'S&ave without Signature'
        Hint = 'Saves the Discharge Summary that is being edited'
        ShortCut = 24641
        OnClick = mnuActSaveClick
      end
      object mnuActSign: TMenuItem
        Caption = 'Si&gn Discharge Summary Now...'
        ShortCut = 24647
        OnClick = mnuActSignClick
      end
      object mnuActIdentifyAddlSigners: TMenuItem
        Caption = '&Identify Additional Signers'
        OnClick = mnuActIdentifyAddlSignersClick
      end
    end
    object mnuOptions: TMenuItem
      Caption = '&Options'
      GroupIndex = 4
      OnClick = mnuOptionsClick
      object mnuEditTemplates: TMenuItem
        Caption = 'Edit &Templates...'
        OnClick = mnuEditTemplatesClick
      end
      object mnuNewTemplate: TMenuItem
        Caption = 'Create &New Template...'
        OnClick = mnuNewTemplateClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuEditSharedTemplates: TMenuItem
        Caption = 'Edit &Shared Templates...'
        OnClick = mnuEditSharedTemplatesClick
      end
      object mnuNewSharedTemplate: TMenuItem
        Caption = '&Create New Shared Template...'
        OnClick = mnuNewSharedTemplateClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuEditDialgFields: TMenuItem
        Caption = 'Edit Template &Fields'
        OnClick = mnuEditDialgFieldsClick
      end
    end
  end
  object popSummMemo: TPopupMenu
    OnPopup = popSummMemoPopup
    Left = 539
    Top = 304
    object popSummMemoCut: TMenuItem
      Caption = 'Cu&t'
      ShortCut = 16472
      OnClick = popSummMemoCutClick
    end
    object popSummMemoCopy: TMenuItem
      Caption = '&Copy'
      ShortCut = 16451
      OnClick = popSummMemoCopyClick
    end
    object popSummMemoPaste: TMenuItem
      Caption = '&Paste'
      ShortCut = 16470
      OnClick = popSummMemoPasteClick
    end
    object popSummMemoPaste2: TMenuItem
      Caption = 'Paste2'
      ShortCut = 8237
      Visible = False
      OnClick = popSummMemoPasteClick
    end
    object popSummMemoReformat: TMenuItem
      Caption = 'Re&format Paragraph'
      ShortCut = 24658
      OnClick = popSummMemoReformatClick
    end
    object popSummMemoSaveContinue: TMenuItem
      Caption = 'Save && Continue Editing'
      ShortCut = 24659
      Visible = False
      OnClick = popSummMemoSaveContinueClick
    end
    object Z11: TMenuItem
      Caption = '-'
    end
    object popSummMemoFind: TMenuItem
      Caption = '&Find in Selected Summary'
      OnClick = popSummMemoFindClick
    end
    object popSummMemoReplace: TMenuItem
      Caption = '&Replace Text'
      OnClick = popSummMemoReplaceClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object popSummMemoGrammar: TMenuItem
      Caption = 'Check &Grammar'
      OnClick = popSummMemoGrammarClick
    end
    object popSummMemoSpell: TMenuItem
      Caption = 'C&heck Spelling'
      OnClick = popSummMemoSpellClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popSummMemoTemplate: TMenuItem
      Caption = 'Copy Into New &Template'
      OnClick = popSummMemoTemplateClick
    end
    object Z10: TMenuItem
      Caption = '-'
    end
    object popSummMemoSignList: TMenuItem
      Caption = 'Add to Signature &List'
      OnClick = mnuActSignListClick
    end
    object popSummMemoDelete: TMenuItem
      Caption = '&Delete Discharge Summary...'
      OnClick = mnuActDeleteClick
    end
    object popSummMemoEdit: TMenuItem
      Caption = '&Edit Discharge Summary...'
      OnClick = mnuActEditClick
    end
    object popSummMemoAddend: TMenuItem
      Caption = '&Make Addendum...'
      OnClick = mnuActAddendClick
    end
    object popSummMemoSave: TMenuItem
      Caption = 'S&ave without Signature'
      OnClick = mnuActSaveClick
    end
    object popSummMemoSign: TMenuItem
      Caption = '&Sign Discharge Summary Now...'
      OnClick = mnuActSignClick
    end
    object popSummMemoAddlSign: TMenuItem
      Caption = '&Identify Additional Signers'
      OnClick = popSummMemoAddlSignClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object popSummMemoPreview: TMenuItem
      Caption = 'Previe&w/Print Current Template'
      ShortCut = 16471
      OnClick = popSummMemoPreviewClick
    end
    object popSummMemoInsTemplate: TMenuItem
      Caption = 'Insert Current Template'
      ShortCut = 16429
      OnClick = popSummMemoInsTemplateClick
    end
    object popSummMemoEncounter: TMenuItem
      Caption = 'Edit Encounter Information'
      ShortCut = 16453
      OnClick = cmdPCEClick
    end
  end
  object popSummList: TPopupMenu
    OnPopup = popSummListPopup
    Left = 500
    Top = 304
    object popSummListAll: TMenuItem
      Tag = 1
      Caption = '&Signed Discharge Summaries (All)'
      OnClick = mnuViewClick
    end
    object popSummListByAuthor: TMenuItem
      Tag = 4
      Caption = 'Signed Discharge Summaries by &Author'
      OnClick = mnuViewClick
    end
    object popSummListByDate: TMenuItem
      Tag = 5
      Caption = 'Signed Discharge Summaries by Date &Range'
      OnClick = mnuViewClick
    end
    object popSummListUncosigned: TMenuItem
      Tag = 3
      Caption = 'Un&cosigned Discharge Summaries'
      OnClick = mnuViewClick
    end
    object popSummListUnsigned: TMenuItem
      Tag = 2
      Caption = '&Unsigned Discharge Summaries'
      OnClick = mnuViewClick
    end
    object popSummListCustom: TMenuItem
      Tag = 6
      Caption = 'Cus&tom View'
      OnClick = mnuViewClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object popSummListExpandSelected: TMenuItem
      Caption = '&Expand Selected'
      OnClick = popSummListExpandSelectedClick
    end
    object popSummListExpandAll: TMenuItem
      Caption = 'E&xpand All'
      OnClick = popSummListExpandAllClick
    end
    object popSummListCollapseSelected: TMenuItem
      Caption = 'C&ollapse Selected'
      OnClick = popSummListCollapseSelectedClick
    end
    object popSummListCollapseAll: TMenuItem
      Caption = 'Co&llapse All'
      OnClick = popSummListCollapseAllClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object popSummListAddIDEntry: TMenuItem
      Caption = 'Add Ne&w Entry to Interdisciplinary Note'
      OnClick = mnuActAddIDEntryClick
    end
    object popSummListAttachtoIDParent: TMenuItem
      Caption = 'A&ttach to Interdisciplinary Note'
      OnClick = mnuActAttachtoIDParentClick
    end
    object popSummListDetachFromIDParent: TMenuItem
      Caption = 'Detac&h from Interdisciplinary Note'
      OnClick = mnuActDetachFromIDParentClick
    end
  end
  object timAutoSave: TTimer
    Enabled = False
    Interval = 300000
    OnTimer = timAutoSaveTimer
    Left = 560
    Top = 61
  end
  object dlgFindText: TFindDialog
    Options = [frDown, frHideUpDown]
    OnFind = dlgFindTextFind
    Left = 452
    Top = 312
  end
  object dlgReplaceText: TReplaceDialog
    OnFind = dlgReplaceTextFind
    OnReplace = dlgReplaceTextReplace
    Left = 409
    Top = 313
  end
  object imgLblNotes: TVA508ImageListLabeler
    Components = <
      item
        Component = lvSumms
      end
      item
        Component = tvSumms
      end>
    Labels = <>
    RemoteLabeler = dmodShared.imgLblNotes
    Left = 16
    Top = 171
  end
  object imgLblImages: TVA508ImageListLabeler
    Components = <
      item
        Component = lvSumms
      end
      item
        Component = tvSumms
      end>
    Labels = <>
    RemoteLabeler = dmodShared.imgLblImages
    Left = 16
    Top = 203
  end
end
