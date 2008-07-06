object frmEncounter: TfrmEncounter
  Left = 481
  Top = 242
  Width = 470
  Height = 450
  Anchors = [akTop]
  BorderIcons = [biSystemMenu]
  Caption = 'Provider & Location for Current Activities'
  Color = clBtnFace
  Constraints.MinWidth = 470
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    462
    416)
  PixelsPerInch = 96
  TextHeight = 13
  object lblInstruct: TLabel
    Left = 6
    Top = 6
    Width = 253
    Height = 31
    AutoSize = False
    Caption = 
      'Select the appointment or visit that should be associated with t' +
      'he note or orders .'
    Visible = False
    WordWrap = True
  end
  object lblLocation: TLabel
    Tag = 9
    Left = 6
    Top = 140
    Width = 93
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Encounter Location'
    Constraints.MinHeight = 12
  end
  object lblProvider: TLabel
    Left = 6
    Top = 6
    Width = 91
    Height = 13
    Caption = 'Encounter Provider'
  end
  object cboPtProvider: TORComboBox
    Left = 6
    Top = 20
    Width = 331
    Height = 117
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = orcsSimple
    AutoSelect = True
    Caption = 'Encounter Provider'
    Color = clWindow
    DropDownCount = 8
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = True
    LongList = True
    LookupPiece = 2
    MaxLength = 0
    Pieces = '2,3'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 0
    OnDblClick = cmdOKClick
    OnNeedData = cboPtProviderNeedData
    CharsNeedMatch = 1
  end
  object cmdDateRange: TButton
    Tag = 9
    Left = 266
    Top = 153
    Width = 84
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Date Range...'
    Constraints.MinHeight = 21
    Constraints.MinWidth = 21
    TabOrder = 2
    OnClick = cmdDateRangeClick
  end
  object txtLocation: TCaptionEdit
    Tag = 9
    Left = 6
    Top = 154
    Width = 258
    Height = 21
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Color = clBtnFace
    Constraints.MinHeight = 21
    ReadOnly = True
    TabOrder = 1
    Text = '< Select a location from the tabs below.... >'
    Caption = 'Encounter Location'
  end
  object cmdCancel: TButton
    Left = 341
    Top = 45
    Width = 84
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    Constraints.MinHeight = 21
    Constraints.MinWidth = 21
    TabOrder = 4
    OnClick = cmdCancelClick
  end
  object cmdOK: TButton
    Left = 340
    Top = 20
    Width = 84
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Constraints.MinHeight = 21
    Constraints.MinWidth = 21
    Default = True
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 179
    Width = 460
    Height = 243
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 6
    DesignSize = (
      460
      243)
    object pgeVisit: TPageControl
      Tag = 9
      Left = 4
      Top = 5
      Width = 452
      Height = 232
      ActivePage = tabNewVisit
      Anchors = [akLeft, akTop, akRight, akBottom]
      Constraints.MinHeight = 150
      RaggedRight = True
      TabOrder = 0
      OnChange = pgeVisitChange
      object tabClinic: TTabSheet
        Caption = 'Clinic Appointments'
        object lstClinic: TORListBox
          Left = 0
          Top = 20
          Width = 444
          Height = 184
          Align = alClient
          Constraints.MinHeight = 21
          ItemHeight = 13
          ParentShowHint = False
          ScrollWidth = 353
          ShowHint = True
          TabOrder = 0
          OnDblClick = cmdOKClick
          Caption = 'Clinic Appointments / Visits (T-30 thru T+1)'
          ItemTipColor = clWindow
          LongList = False
          Pieces = '3,2,4'
          TabPositions = '30,50'
          OnChange = lstClinicChange
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 444
          Height = 20
          Align = alTop
          TabOrder = 2
          object lblDateRange: TLabel
            Left = 138
            Top = 4
            Width = 71
            Height = 13
            Caption = '(T-30 thru T+1)'
          end
          object lblClinic: TLabel
            Left = 4
            Top = 4
            Width = 127
            Height = 13
            Caption = 'Clinic Appointments / Visits'
          end
        end
      end
      object tabAdmit: TTabSheet
        Caption = 'Hospital Admissions'
        object lstAdmit: TORListBox
          Left = 0
          Top = 17
          Width = 444
          Height = 187
          Align = alClient
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnDblClick = cmdOKClick
          Caption = 'Hospital Admissions'
          ItemTipColor = clWindow
          LongList = False
          Pieces = '3,5,4'
          TabPositions = '20'
          OnChange = lstAdmitChange
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 444
          Height = 17
          Align = alTop
          TabOrder = 2
          object lblAdmit: TLabel
            Left = 4
            Top = 1
            Width = 93
            Height = 13
            Caption = 'Hospital Admissions'
          end
        end
      end
      object tabNewVisit: TTabSheet
        Caption = 'New Visit'
        object lblVisitDate: TLabel
          Left = 220
          Top = 4
          Width = 85
          Height = 13
          Caption = 'Date/Time of Visit'
          Visible = False
        end
        object lblNewVisit: TLabel
          Left = 4
          Top = 4
          Width = 63
          Height = 13
          Caption = 'Visit Location'
        end
        object calVisitDate: TORDateBox
          Left = 220
          Top = 18
          Width = 140
          Height = 21
          TabOrder = 1
          Text = 'NOW'
          OnChange = calVisitDateChange
          OnExit = calVisitDateExit
          DateOnly = False
          RequireTime = True
        end
        object ckbHistorical: TORCheckBox
          Left = 220
          Top = 50
          Width = 140
          Height = 81
          Caption = 
            'Historical Visit: a visit that occurred at some time in the past' +
            ' or at some other location (possibly non-VA) but is not used for' +
            ' workload credit.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          WordWrap = True
          OnClick = ckbHistoricalClick
          AutoSize = True
        end
        object cboNewVisit: TORComboBox
          Left = 4
          Top = 18
          Width = 208
          Height = 117
          Style = orcsSimple
          AutoSelect = True
          Caption = 'Visit Location'
          Color = clWindow
          DropDownCount = 8
          ItemHeight = 13
          ItemTipColor = clWindow
          ItemTipEnable = True
          ListItemsOnly = True
          LongList = True
          LookupPiece = 0
          MaxLength = 0
          Pieces = '2'
          Sorted = False
          SynonymChars = '<>'
          TabOrder = 0
          OnChange = cboNewVisitChange
          OnDblClick = cmdOKClick
          OnNeedData = cboNewVisitNeedData
          CharsNeedMatch = 1
        end
      end
    end
  end
  object dlgDateRange: TORDateRangeDlg
    DateOnly = True
    Instruction = 'Show appointments / visits in the date range:'
    LabelStart = 'From'
    LabelStop = 'Through'
    RequireTime = False
    Format = 'mmm d,yyyy'
    Left = 264
    Top = 4
  end
end
