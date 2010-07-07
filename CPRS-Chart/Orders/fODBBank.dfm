inherited frmODBBank: TfrmODBBank
  Left = 409
  Top = 244
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  Caption = 'Blood Component and Diagnostic Test Order Form'
  ClientHeight = 600
  ClientWidth = 709
  ExplicitWidth = 717
  ExplicitHeight = 634
  PixelsPerInch = 96
  TextHeight = 13
  object pnlComments: TPanel [0]
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
    Left = 0
    Top = 399
    Width = 449
    Height = 59
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 399
    ExplicitWidth = 449
    ExplicitHeight = 59
  end
  object pgeProduct: TPageControl [2]
    Left = 0
    Top = 0
    Width = 709
    Height = 393
    ActivePage = TabDiag
    Align = alTop
    TabOrder = 6
    TabStop = False
    OnChange = pgeProductChange
    object TabInfo: TTabSheet
      Caption = 'Patient Information'
      ImageIndex = 3
      object edtInfo: TCaptionRichEdit
        Left = 0
        Top = 8
        Width = 556
        Height = 337
        TabStop = False
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
        Caption = 'Patient Info'
      end
    end
    object TabDiag: TTabSheet
      Caption = 'Blood Bank Orders'
      ImageIndex = 2
      object lblReqComment: TOROffsetLabel
        Left = 298
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
        Top = 163
        Width = 701
        Height = 99
        Hint = 'Data entered into these fields apply to the entire order.'
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object lblDiagComment: TOROffsetLabel
          Left = 257
          Top = 35
          Width = 46
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
          Left = 8
          Top = -2
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
          Left = 10
          Top = 35
          Width = 99
          Height = 13
          Caption = 'Reason for Request*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblSurgery: TLabel
          Left = 115
          Top = -2
          Width = 36
          Height = 13
          Hint = 
            'Enter the name of the surgical procedure that this request is fo' +
            'r.'
          Caption = 'Surgery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblRequiredField: TLabel
          Left = 10
          Top = 75
          Width = 122
          Height = 13
          Caption = '* Indicates a required field'
        end
        object cboUrgency: TORComboBox
          Left = 12
          Top = 12
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
          Left = 351
          Top = 10
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
          Left = 115
          Top = 12
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
          Left = 12
          Top = 51
          Width = 239
          Height = 21
          Style = orcsDropDown
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
          Left = 257
          Top = 51
          Width = 250
          Height = 48
          TabOrder = 4
          OnChange = memDiagCommentChange
        end
      end
      object pnlSelect: TPanel
        Left = 0
        Top = 35
        Width = 701
        Height = 128
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        TabOrder = 1
        object lblTNS: TLabel
          Left = 298
          Top = 109
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
        object pnlDiagnosticTests: TGroupBox
          Left = 256
          Top = 0
          Width = 267
          Height = 110
          Caption = 'Diagnostic Tests'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
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
            Width = 104
            Height = 13
            Caption = 'Collection Date/Time*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cmdImmedColl: TSpeedButton
            Left = 148
            Top = 89
            Width = 21
            Height = 11
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
          object pnlCollTimeButton: TKeyClickPanel
            Left = 85
            Top = 89
            Width = 20
            Height = 13
            BevelOuter = bvNone
            Caption = 'Select collection time'
            TabOrder = 5
            TabStop = True
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
            LongList = True
            LookupPiece = 0
            MaxLength = 0
            ParentFont = False
            Pieces = '2'
            Sorted = False
            SynonymChars = '<>'
            TabOrder = 0
            TabStop = True
            OnExit = cboAvailTestExit
            OnMouseClick = cboAvailTestSelect
            OnNeedData = cboAvailTestNeedData
            CharsNeedMatch = 1
          end
          object cboCollType: TORComboBox
            Left = 12
            Top = 46
            Width = 165
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
            CharsNeedMatch = 1
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
            TabOrder = 3
            OnChange = calCollTimeChange
            DateOnly = False
            RequireTime = False
          end
          object txtImmedColl: TCaptionEdit
            Left = 12
            Top = 82
            Width = 165
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 4
            Text = 'txtImmedColl'
          end
        end
        object pnlBloodComponents: TGroupBox
          Left = 4
          Top = 0
          Width = 246
          Height = 110
          Caption = 'Blood Components'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblQuantity: TLabel
            Left = 198
            Top = 0
            Width = 43
            Height = 13
            Caption = 'Quantity*'
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
            Width = 96
            Height = 13
            Caption = 'Date/Time Wanted*'
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
            OnChange = cboAvailCompChange
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
            Width = 133
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
            CharsNeedMatch = 1
          end
          object calWantTime: TORDateBox
            Left = 11
            Top = 82
            Width = 149
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = calWantTimeChange
            DateOnly = False
            RequireTime = False
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 701
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
          Width = 488
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
        Top = 262
        Width = 701
        Height = 112
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
          Top = 12
          Width = 417
          Height = 91
          Color = clBtnFace
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
          Font.Style = [fsBold]
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
          Left = 428
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
          Left = 428
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
      object edtResults: TCaptionRichEdit
        Left = -4
        Top = 57
        Width = 517
        Height = 290
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
    Top = 399
    TabOrder = 2
    Visible = False
    ExplicitLeft = 455
    ExplicitTop = 399
  end
  inherited cmdQuit: TButton
    Left = 455
    Top = 426
    Width = 52
    TabOrder = 3
    ExplicitLeft = 455
    ExplicitTop = 426
    ExplicitWidth = 52
  end
  inherited pnlMessage: TPanel
    Left = 8
    Top = 409
    Width = 409
    Height = 49
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 409
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
        'Text = Applies to entire order'
        'Status = stsOK')
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
        'Component = calWantTime'
        'Status = stsDefault')
      (
        'Component = calCollTime'
        'Status = stsDefault')
      (
        'Component = txtImmedColl'
        'Status = stsDefault')
      (
        'Component = pnlCollTimeButton'
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
