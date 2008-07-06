object frmBALocalDiagnoses: TfrmBALocalDiagnoses
  Left = 192
  Top = 61
  Width = 620
  Height = 544
  Caption = 'Assign Diagnoses to Order(s)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 96
    Align = alTop
    Caption = 'pnlTop'
    TabOrder = 0
    DesignSize = (
      612
      96)
    object lbOrders: TListBox
      Left = 7
      Top = 25
      Width = 599
      Height = 69
      Anchors = [akLeft, akTop, akRight, akBottom]
      IntegralHeight = True
      ItemHeight = 13
      TabOrder = 2
      OnMouseMove = lbOrdersMouseMove
    end
    object ORStaticText1: TORStaticText
      Left = 216
      Top = 8
      Width = 169
      Height = 14
      AutoSize = False
      Caption = 'Selected Orders'
      TabOrder = 1
      TabStop = True
      OnEnter = ORStaticText1Enter
      OnExit = ORStaticText1Exit
    end
    object lblPatientName: TStaticText
      Left = 11
      Top = 9
      Width = 76
      Height = 17
      Caption = 'PatientName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 96
    Width = 612
    Height = 259
    Align = alClient
    TabOrder = 1
    object lbSections: TORListBox
      Left = 9
      Top = 16
      Width = 238
      Height = 201
      Style = lbOwnerDrawVariable
      IntegralHeight = True
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = lbSectionsClick
      OnDrawItem = lbSectionsDrawItem
      Caption = 'Diagnosis Section'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '3'
      CheckEntireLine = True
    end
    object btnOther: TButton
      Left = 155
      Top = 219
      Width = 92
      Height = 20
      Caption = 'Other &Diagnosis'
      TabOrder = 2
      OnClick = btnOtherClick
    end
    object lbDiagnosis: TORListBox
      Left = 248
      Top = 16
      Width = 353
      Height = 225
      IntegralHeight = True
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = lbDiagnosisClick
      Caption = 'Diagnosis Section'
      ItemTipColor = clWindow
      LongList = False
      Pieces = '1,2,3'
    end
    object ORStaticText2: TORStaticText
      Left = 8
      Top = 1
      Width = 241
      Height = 17
      AutoSize = False
      BevelKind = bkFlat
      Caption = 'Diagnosis Section'
      TabOrder = 0
      TabStop = True
      OnEnter = ORStaticText1Enter
      OnExit = ORStaticText1Exit
    end
    object ORStaticText3: TORStaticText
      Left = 248
      Top = 1
      Width = 353
      Height = 17
      AutoSize = False
      BevelKind = bkFlat
      Caption = 'Diagnosis Codes'
      TabOrder = 3
      TabStop = True
      OnEnter = ORStaticText1Enter
      OnExit = ORStaticText1Exit
    end
  end
  object pnlBottom: TORAutoPanel
    Left = 0
    Top = 355
    Width = 612
    Height = 162
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      612
      162)
    object lvDxGrid: TListView
      Left = 12
      Top = 19
      Width = 445
      Height = 85
      Color = clInfoBk
      Columns = <
        item
          Caption = 'Add To PL/PD'
          Width = 85
        end
        item
          Caption = 'Primary'
          MinWidth = 65
          Width = 65
        end
        item
          Caption = 'Diagnosis for Selected Orders'
          MinWidth = 275
          Width = 290
        end>
      Ctl3D = False
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      OnClick = lvDxGridClick
      OnKeyDown = lvDxGridKeyDown
      OnKeyUp = lvDxGridKeyUp
    end
    object cbAddToPDList: TCheckBox
      Left = 459
      Top = 33
      Width = 129
      Height = 17
      Caption = 'Add to Personal Dx List'
      TabOrder = 3
      OnClick = cbAddToPDListClick
    end
    object cbAddToPL: TCheckBox
      Left = 459
      Top = 17
      Width = 149
      Height = 16
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Add To Problem List'
      TabOrder = 2
      OnClick = cbAddToPLClick
    end
    object btnPrimary: TButton
      Left = 480
      Top = 57
      Width = 72
      Height = 19
      Caption = '&Primary'
      TabOrder = 4
      OnClick = btnPrimaryClick
    end
    object btnRemove: TButton
      Left = 480
      Top = 81
      Width = 72
      Height = 19
      Caption = '&Remove'
      TabOrder = 5
      OnClick = btnRemoveClick
    end
    object btnSelectAll: TButton
      Left = 385
      Top = 108
      Width = 72
      Height = 18
      Caption = '&Select All'
      TabOrder = 6
      OnClick = btnSelectAllClick
    end
    object buOK: TButton
      Left = 384
      Top = 136
      Width = 72
      Height = 21
      Caption = '&OK'
      TabOrder = 7
      OnClick = buOKClick
    end
    object buCancel: TButton
      Left = 482
      Top = 136
      Width = 72
      Height = 21
      Caption = '&Cancel'
      TabOrder = 8
      OnClick = buCancelClick
    end
    object ORStaticText4: TORStaticText
      Left = 14
      Top = 3
      Width = 219
      Height = 14
      AutoSize = False
      Caption = 'Provisional Diagnosis'
      TabOrder = 0
      TabStop = True
      OnEnter = ORStaticText1Enter
      OnExit = ORStaticText1Exit
    end
  end
end
