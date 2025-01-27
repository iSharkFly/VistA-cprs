inherited frmODBBank: TfrmODBBank
  Left = 409
  Top = 244
  Width = 700
  Height = 626
  AutoScroll = True
  Caption = 'Blood Component and Diagnostic Test Order Form'
  OnShow = FormShow
  ExplicitWidth = 700
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 0
    Width = 692
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object pnlComments: TPanel [1]
    Left = 12
    Top = 25
    Width = 534
    Height = 368
    TabOrder = 5
    Visible = False
    object lblOrdComment: TLabel
      Left = 25
      Top = 3
      Width = 87
      Height = 13
      Caption = 'Order Comment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnUpdateComments: TButton
      Left = 372
      Top = 174
      Width = 115
      Height = 25
      Caption = 'Update Comments'
      TabOrder = 0
      OnClick = btnUpdateCommentsClick
    end
    object btnCancelComment: TButton
      Left = 279
      Top = 174
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelCommentClick
    end
  end
  inherited memOrder: TCaptionMemo
    Left = 4
    Top = 503
    Width = 449
    Height = 59
    Visible = False
    ExplicitLeft = 4
    ExplicitTop = 503
    ExplicitWidth = 449
    ExplicitHeight = 59
  end
  object pgeProduct: TPageControl [3]
    Left = 0
    Top = 2
    Width = 692
    Height = 497
    ActivePage = TabDiag
    Align = alTop
    TabOrder = 4
    OnChange = pgeProductChange
    object TabInfo: TTabSheet
      Caption = 'Patient Information'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object edtInfo: TCaptionRichEdit
        Left = 0
        Top = 0
        Width = 684
        Height = 469
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        Caption = 'Patient Info'
      end
    end
    object TabDiag: TTabSheet
      Caption = 'Blood Bank Orders'
      ImageIndex = 2
      object lblReqComment: TOROffsetLabel
        Left = 300
        Top = 25
        Width = 108
        Height = 37
        HorzOffset = 2
        Transparent = False
        VertOffset = 2
        WordWrap = False
      end
      object pnlFields: TPanel
        Left = 0
        Top = 145
        Width = 684
        Height = 210
        Hint = 'Data entered into these fields apply to the entire order.'
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object lblDiagComment: TOROffsetLabel
          Left = 0
          Top = 128
          Width = 62
          Height = 15
          Caption = 'Comment'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HorzOffset = 2
          ParentFont = False
          Transparent = False
          VertOffset = 2
          WordWrap = True
        end
        object lblUrgency: TLabel
          Left = 0
          Top = -1
          Width = 44
          Height = 13
          Caption = 'Urgency*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblReason: TLabel
          Left = 0
          Top = 40
          Width = 95
          Height = 13
          Caption = 'Reason for Request'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblSurgery: TLabel
          Left = 117
          Top = 0
          Width = 36
          Height = 13
          Hint = 
            'Enter the name of the surgical procedure that this request is fo' +
            'r.'
          Caption = 'Surgery'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblRequiredField: TLabel
          Left = 398
          Top = 38
          Width = 122
          Height = 13
          Caption = '* Indicates a required field'
        end
        object lblTNS: TLabel
          Left = 270
          Top = 0
          Width = 14
          Height = 13
          Caption = 'tns'
          Color = clActiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object lblNoBloodReq: TLabel
          Left = 341
          Top = 21
          Width = 176
          Height = 13
          Caption = 'No Blood Required for this Procedure'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object cboUrgency: TORComboBox
          Left = 4
          Top = 14
          Width = 98
          Height = 21
          Style = orcsDropDown
          AutoSelect = True
          Caption = 'Urgency'
          Color = clWindow
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = True
          LongList = False
          LookupPiece = 0
          MaxLength = 0
          ParentFont = False
          Pieces = '2'
          Sorted = False
          SynonymChars = '<>'
          TabOrder = 0
          OnChange = cboUrgencyChange
          OnExit = cboUrgencyExit
          CharsNeedMatch = 1
        end
        object chkConsent: TCheckBox
          Left = 529
          Top = 92
          Width = 112
          Height = 17
          Hint = 'Informed Consent Signed On Chart?'
          Alignment = taLeftJustify
          Caption = 'Informed Consent?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Visible = False
          OnClick = chkConsentClick
        end
        object cboSurgery: TORComboBox
          Left = 117
          Top = 14
          Width = 218
          Height = 21
          Style = orcsDropDown
          AutoSelect = True
          Caption = 'Surgery'
          Color = clWindow
          DropDownCount = 8
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = False
          LongList = False
          LookupPiece = 0
          MaxLength = 0
          ParentFont = False
          Pieces = '2'
          Sorted = False
          SynonymChars = '<>'
          TabOrder = 1
          OnChange = cboSurgeryChange
          OnClick = cboSurgeryClick
          CharsNeedMatch = 1
        end
        object cboReasons: TORComboBox
          Left = 4
          Top = 55
          Width = 525
          Height = 74
          Style = orcsSimple
          AutoSelect = True
          Color = clWindow
          DropDownCount = 8
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = False
          LongList = False
          LookupPiece = 0
          MaxLength = 0
          Sorted = False
          SynonymChars = '<>'
          TabOrder = 2
          OnChange = cboReasonsChange
          OnEnter = cboReasonsEnter
          OnExit = cboReasonsExit
          CharsNeedMatch = 1
        end
        object memDiagComment: TRichEdit
          Left = 4
          Top = 144
          Width = 525
          Height = 60
          TabOrder = 4
          OnChange = memDiagCommentChange
        end
      end
      object pnlSelect: TPanel
        Left = 0
        Top = 35
        Width = 684
        Height = 110
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        TabOrder = 1
        object pnlDiagnosticTests: TGroupBox
          Left = 266
          Top = 0
          Width = 256
          Height = 110
          Caption = 'Diagnostic Tests'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = pnlDiagnosticTestsClick
          OnEnter = pnlDiagnosticTestsEnter
          OnExit = pnlDiagnosticTestsExit
          object lblCollType: TLabel
            Left = 13
            Top = 33
            Width = 77
            Height = 13
            Caption = 'Collection Type*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblCollTime: TLabel
            Left = 12
            Top = 70
            Width = 100
            Height = 13
            Caption = 'Collection Date/Time'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object pnlCollTimeButton: TKeyClickPanel
            Left = 178
            Top = 82
            Width = 21
            Height = 21
            BevelOuter = bvNone
            Caption = 'Select collection time'
            TabOrder = 5
            TabStop = True
            object cmdImmedColl: TSpeedButton
              Left = 0
              Top = 0
              Width = 21
              Height = 21
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                D6000000424DD60000000000000076000000280000000C0000000C0000000100
                0400000000006000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                0000333333333333000033333333333300003333333333330000300330033003
                0000300330033003000033333333333300003333333333330000333333333333
                0000333333333333000033333333333300003333333333330000}
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              OnClick = cmdImmedCollClick
            end
          end
          object calCollTime: TORDateBox
            Left = 12
            Top = 82
            Width = 165
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = calCollTimeChange
            OnEnter = calCollTimeEnter
            DateOnly = False
            RequireTime = False
          end
          object cboAvailTest: TORComboBox
            Left = 13
            Top = 13
            Width = 234
            Height = 21
            Style = orcsDropDown
            AutoSelect = True
            Caption = 'Diagnostic Tests'
            Color = clWindow
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = False
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            ParentFont = False
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 0
            TabStop = True
            OnClick = cboAvailTestSelect
            OnEnter = cboAvailTestEnter
            OnExit = cboAvailTestExit
            OnNeedData = cboAvailTestNeedData
            CharsNeedMatch = 1
          end
          object cboCollType: TORComboBox
            Left = 12
            Top = 46
            Width = 197
            Height = 21
            Style = orcsDropDown
            AutoSelect = True
            Caption = 'Collection Type'
            Color = clWindow
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = True
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            ParentFont = False
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 1
            OnChange = cboCollTypeChange
            OnClick = cboCollTypeClick
            OnEnter = cboCollTypeEnter
            CharsNeedMatch = 1
          end
          object cboCollTime: TORComboBox
            Left = 12
            Top = 82
            Width = 165
            Height = 21
            Style = orcsDropDown
            AutoSelect = True
            Caption = 'Collection Date/Time'
            Color = clWindow
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = False
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            ParentFont = False
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 2
            OnChange = cboCollTimeChange
            OnEnter = cboCollTimeEnter
            CharsNeedMatch = 1
          end
          object txtImmedColl: TCaptionEdit
            Left = 12
            Top = 82
            Width = 165
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
            OnEnter = txtImmedCollEnter
          end
        end
        object pnlBloodComponents: TGroupBox
          Left = 4
          Top = 0
          Width = 256
          Height = 110
          Caption = 'Blood Components'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnClick = pnlBloodComponentsClick
          OnEnter = pnlBloodComponentsEnter
          OnExit = pnlBloodComponentsExit
          object lblQuantity: TLabel
            Left = 198
            Top = 0
            Width = 39
            Height = 13
            Caption = 'Quantity'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblModifiers: TLabel
            Left = 7
            Top = 33
            Width = 42
            Height = 13
            Caption = 'Modifiers'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblWanted: TLabel
            Left = 7
            Top = 70
            Width = 92
            Height = 13
            Caption = 'Date/Time Wanted'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cboAvailComp: TORComboBox
            Left = 11
            Top = 13
            Width = 181
            Height = 21
            Style = orcsDropDown
            AutoSelect = True
            Caption = 'Blood Components'
            Color = clWindow
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = False
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            ParentFont = False
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 0
            TabStop = True
            OnEnter = cboAvailCompEnter
            OnExit = cboAvailCompExit
            OnMouseClick = cboAvailCompSelect
            OnNeedData = cboAvailCompNeedData
            CharsNeedMatch = 1
          end
          object tQuantity: TEdit
            Left = 198
            Top = 13
            Width = 25
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = tQuantityChange
            OnClick = tQuantityClick
            OnEnter = tQuantityEnter
          end
          object cboModifiers: TORComboBox
            Left = 11
            Top = 46
            Width = 181
            Height = 21
            Style = orcsDropDown
            AutoSelect = True
            Caption = 'Modifier'
            Color = clWindow
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemTipColor = clWindow
            ItemTipEnable = True
            ListItemsOnly = True
            LongList = False
            LookupPiece = 0
            MaxLength = 0
            ParentFont = False
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 2
            OnChange = cboModifiersChange
            OnEnter = cboModifiersEnter
            CharsNeedMatch = 1
          end
          object calWantTime: TORDateBox
            Left = 11
            Top = 82
            Width = 181
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = calWantTimeChange
            OnEnter = calWantTimeEnter
            DateOnly = False
            RequireTime = False
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 684
        Height = 35
        Align = alTop
        Caption = ' Personal Quick Orders'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cboQuick: TORComboBox
          Left = 15
          Top = 11
          Width = 508
          Height = 21
          Style = orcsDropDown
          AutoSelect = True
          Color = clWindow
          DropDownCount = 8
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = False
          LongList = True
          LookupPiece = 0
          MaxLength = 0
          Pieces = '2'
          Sorted = False
          SynonymChars = '<>'
          TabOrder = 0
          OnClick = cboQuickClick
          CharsNeedMatch = 1
        end
      end
      object pnlSelectedTests: TGroupBox
        Left = 0
        Top = 355
        Width = 684
        Height = 109
        Align = alTop
        Caption = 'Selected Components and Tests'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        object lvSelectionList: TCaptionListView
          Left = 5
          Top = 15
          Width = 430
          Height = 91
          Columns = <
            item
              AutoSize = True
              Caption = 'Test/Component'
            end
            item
              AutoSize = True
              Caption = 'Qty'
            end
            item
              AutoSize = True
              Caption = 'Modifiers'
            end
            item
              Caption = 'ModifierItemIndex'
              Width = 0
            end
            item
              Caption = 'TestIEN'
              Width = 0
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          TabStop = False
          ViewStyle = vsReport
          OnClick = lvSelectionListClick
          Caption = 'lvSelectionList'
        end
        object btnRemove: TButton
          Left = 450
          Top = 37
          Width = 75
          Height = 21
          Caption = 'Remove'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnRemoveClick
        end
        object btnRemoveAll: TButton
          Left = 450
          Top = 64
          Width = 75
          Height = 21
          Caption = 'Remove All'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnRemoveAllClick
        end
      end
    end
    object TabResults: TTabSheet
      Caption = 'Lab Results'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object edtResults: TCaptionRichEdit
        Left = 0
        Top = 0
        Width = 684
        Height = 469
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited cmdAccept: TButton
    Left = 455
    Top = 503
    Width = 75
    TabOrder = 2
    Visible = False
    ExplicitLeft = 455
    ExplicitTop = 503
    ExplicitWidth = 75
  end
  inherited cmdQuit: TButton
    Left = 455
    Top = 541
    Width = 52
    TabOrder = 3
    ExplicitLeft = 455
    ExplicitTop = 541
    ExplicitWidth = 52
  end
  inherited pnlMessage: TPanel
    Left = 8
    Top = 513
    Width = 409
    Height = 49
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 513
    ExplicitWidth = 409
    ExplicitHeight = 49
    inherited memMessage: TRichEdit
      Left = 42
      Top = 5
      Width = 360
      ExplicitLeft = 42
      ExplicitTop = 5
      ExplicitWidth = 360
    end
  end
  inherited amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = memOrder'
        'Status = stsDefault')
      (
        'Component = cmdAccept'
        'Status = stsDefault')
      (
        'Component = cmdQuit'
        'Status = stsDefault')
      (
        'Component = pnlMessage'
        'Status = stsDefault')
      (
        'Component = memMessage'
        'Status = stsDefault')
      (
        'Component = frmODBBank'
        'Status = stsDefault')
      (
        'Component = pnlComments'
        'Status = stsDefault')
      (
        'Component = btnUpdateComments'
        'Status = stsDefault')
      (
        'Component = btnCancelComment'
        'Status = stsDefault')
      (
        'Component = pgeProduct'
        'Status = stsDefault')
      (
        'Component = TabInfo'
        'Status = stsDefault')
      (
        'Component = edtInfo'
        'Status = stsDefault')
      (
        'Component = TabDiag'
        'Status = stsDefault')
      (
        'Component = TabResults'
        'Status = stsDefault')
      (
        'Component = edtResults'
        'Status = stsDefault')
      (
        'Component = pnlFields'
        'Status = stsDefault')
      (
        'Component = cboUrgency'
        'Status = stsDefault')
      (
        'Component = chkConsent'
        'Status = stsDefault')
      (
        'Component = cboSurgery'
        'Status = stsDefault')
      (
        'Component = pnlSelect'
        'Status = stsDefault')
      (
        'Component = pnlDiagnosticTests'
        'Status = stsDefault')
      (
        'Component = cboAvailTest'
        'Status = stsDefault')
      (
        'Component = pnlBloodComponents'
        'Status = stsDefault')
      (
        'Component = cboAvailComp'
        'Status = stsDefault')
      (
        'Component = tQuantity'
        'Status = stsDefault')
      (
        'Component = cboModifiers'
        'Status = stsDefault')
      (
        'Component = GroupBox1'
        'Status = stsDefault')
      (
        'Component = cboQuick'
        'Status = stsDefault')
      (
        'Component = pnlSelectedTests'
        'Status = stsDefault')
      (
        'Component = lvSelectionList'
        'Status = stsDefault')
      (
        'Component = btnRemove'
        'Status = stsDefault')
      (
        'Component = btnRemoveAll'
        'Status = stsDefault')
      (
        'Component = cboReasons'
        'Status = stsDefault')
      (
        'Component = memDiagComment'
        'Status = stsDefault')
      (
        'Component = cboCollType'
        'Status = stsDefault')
      (
        'Component = cboCollTime'
        'Status = stsDefault')
      (
        'Component = txtImmedColl'
        'Status = stsDefault')
      (
        'Component = calCollTime'
        'Status = stsDefault')
      (
        'Component = pnlCollTimeButton'
        'Status = stsDefault')
      (
        'Component = calWantTime'
        'Status = stsDefault'))
  end
  object dlgLabCollTime: TORDateTimeDlg
    FMDateTime = 2980923.000000000000000000
    DateOnly = False
    RequireTime = True
    Left = 435
    Top = 72
  end
  object ORWanted: TORDateTimeDlg
    FMDateTime = 2980923.000000000000000000
    DateOnly = False
    RequireTime = True
    Left = 343
    Top = 72
  end
end
