object frmReview: TfrmReview
  Left = 287
  Top = 136
  AutoScroll = False
  BorderIcons = [biMaximize]
  Caption = 'Review / Sign Changes'
  ClientHeight = 497
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  DesignSize = (
    602
    497)
  PixelsPerInch = 96
  TextHeight = 13
  object laDiagnosis: TLabel
    Left = 256
    Top = 135
    Width = 46
    Height = 13
    Caption = 'Diagnosis'
    Visible = False
  end
  object pnlSignature: TPanel
    Left = 8
    Top = 423
    Width = 373
    Height = 65
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    object lblESCode: TLabel
      Left = 0
      Top = 0
      Width = 123
      Height = 13
      Caption = 'Electronic Signature Code'
    end
    object txtESCode: TCaptionEdit
      Left = 0
      Top = 14
      Width = 137
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      OnChange = txtESCodeChange
      Caption = 'Electronic Signature Code'
    end
  end
  object pnlOrderAction: TPanel
    Left = 8
    Top = 423
    Width = 373
    Height = 65
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label1: TStaticText
      Left = 0
      Top = 0
      Width = 111
      Height = 17
      Caption = 'For orders, select from:'
      TabOrder = 4
    end
    object radSignChart: TRadioButton
      Left = 0
      Top = 16
      Width = 101
      Height = 17
      Caption = '&Signed on Chart'
      TabOrder = 0
      OnClick = radReleaseClick
    end
    object radHoldSign: TRadioButton
      Left = 0
      Top = 36
      Width = 101
      Height = 17
      Caption = '&Hold until Signed'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = radReleaseClick
    end
    object grpRelease: TGroupBox
      Left = 120
      Top = 16
      Width = 241
      Height = 42
      TabOrder = 3
      Visible = False
      object radVerbal: TRadioButton
        Left = 8
        Top = 19
        Width = 53
        Height = 17
        Caption = '&Verbal'
        Enabled = False
        TabOrder = 0
      end
      object radPhone: TRadioButton
        Left = 80
        Top = 19
        Width = 77
        Height = 17
        Caption = '&Telephone'
        Enabled = False
        TabOrder = 1
      end
      object radPolicy: TRadioButton
        Left = 168
        Top = 19
        Width = 49
        Height = 17
        Caption = '&Policy'
        Enabled = False
        TabOrder = 2
      end
    end
    object radRelease: TRadioButton
      Left = 128
      Top = 16
      Width = 113
      Height = 17
      Caption = '&Release to Service'
      TabOrder = 2
      Visible = False
      OnClick = radReleaseClick
    end
  end
  object cmdOK: TButton
    Left = 442
    Top = 471
    Width = 72
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 522
    Top = 471
    Width = 72
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = cmdCancelClick
  end
  object lstReview: TCaptionCheckListBox
    Left = 8
    Top = 154
    Width = 587
    Height = 264
    OnClickCheck = lstReviewClickCheck
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 15
    ParentShowHint = False
    PopupMenu = poBACopyPaste
    ShowHint = True
    Style = lbOwnerDrawVariable
    TabOrder = 6
    OnClick = lstReviewClick
    OnDrawItem = lstReviewDrawItem
    OnKeyUp = lstReviewKeyUp
    OnMeasureItem = lstReviewMeasureItem
    OnMouseDown = lstReviewMouseDown
    OnMouseMove = lstReviewMouseMove
    Caption = 'Signature will be Applied to Checked Items'
  end
  inline fraCoPay: TfraCoPayDesc
    Left = 0
    Top = 0
    Width = 602
    Height = 129
    Align = alTop
    AutoScroll = False
    AutoSize = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    inherited pnlRight: TPanel
      Left = 392
      Height = 129
      inherited lblCaption: TStaticText
        Caption = 'Patient Orders Related To:'
      end
      inherited pnlMain: TPanel
        Height = 112
        inherited Panel7: TPanel
          inherited lblHNC2: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited lblHNC: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
        inherited Panel8: TPanel
          inherited Label12: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited Label11: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
        inherited Panel9: TPanel
          inherited Label14: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited Label13: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
        inherited Panel10: TPanel
          inherited Label16: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited Label15: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
        inherited Panel11: TPanel
          inherited Label18: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited Label17: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
        inherited Panel12: TPanel
          inherited Label24: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited Label23: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
        inherited Panel1: TPanel
          inherited StaticText4: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
          inherited StaticText1: TORStaticText
            OnEnter = fraCoPayLabel23Enter
            OnExit = fraCoPayLabel23Exit
          end
        end
      end
    end
    inherited pnlSC: TPanel
      Width = 392
      Height = 129
      inherited lblSCDisplay: TLabel
        Width = 392
      end
      inherited memSCDisplay: TCaptionMemo
        Width = 392
        Height = 112
      end
    end
  end
  object lblSig: TStaticText
    Left = 8
    Top = 136
    Width = 205
    Height = 17
    Caption = 'Signature will be Applied to Checked Items'
    TabOrder = 5
    TabStop = True
  end
  object gbxDxLookup: TGroupBox
    Left = 8
    Top = 136
    Width = 101
    Height = 48
    Caption = 'Lookup Diagnosis'
    TabOrder = 8
    TabStop = True
    Visible = False
    object buDiagnosis: TButton
      Left = 7
      Top = 21
      Width = 88
      Height = 21
      Caption = '&Diagnosis'
      Enabled = False
      TabOrder = 0
      OnClick = buDiagnosisClick
    end
  end
  object poBACopyPaste: TPopupMenu
    Left = 384
    Top = 280
    object Copy1: TMenuItem
      Caption = '&Copy'
      ShortCut = 16451
      OnClick = Copy1Click
    end
    object Paste1: TMenuItem
      Caption = '&Paste'
      Enabled = False
      ShortCut = 16470
      OnClick = Paste1Click
    end
    object Diagnosis1: TMenuItem
      Caption = '&Diagnosis...'
      ShortCut = 32836
      OnClick = buDiagnosisClick
    end
    object Exit1: TMenuItem
      Caption = '&Exit'
      ShortCut = 16453
      OnClick = Exit1Click
    end
  end
end
