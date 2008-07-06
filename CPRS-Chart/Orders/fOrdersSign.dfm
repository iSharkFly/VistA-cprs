object frmSignOrders: TfrmSignOrders
  Left = 400
  Top = 159
  Width = 585
  Height = 511
  Caption = 'Sign Orders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnMouseDown = clstOrdersMouseDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  DesignSize = (
    577
    484)
  PixelsPerInch = 96
  TextHeight = 13
  object lblESCode: TLabel
    Left = 8
    Top = 441
    Width = 123
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Electronic Signature Code'
  end
  object laDiagnosis: TLabel
    Left = 184
    Top = 185
    Width = 46
    Height = 13
    Caption = 'Diagnosis'
    Visible = False
  end
  object Label2: TStaticText
    Left = 8
    Top = 147
    Width = 171
    Height = 17
    Caption = 'The following orders will be signed -'
    TabOrder = 3
    TabStop = True
  end
  object cmdOK: TButton
    Left = 417
    Top = 455
    Width = 72
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 497
    Top = 455
    Width = 72
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object txtESCode: TCaptionEdit
    Left = 8
    Top = 455
    Width = 137
    Height = 21
    Anchors = [akLeft, akBottom]
    PasswordChar = '*'
    TabOrder = 0
    Caption = 'Electronic Signature Code'
  end
  inline fraCoPay: TfraCoPayDesc
    Left = 0
    Top = 0
    Width = 577
    Height = 132
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
    inherited pnlRight: TPanel
      Left = 328
      inherited lblCaption: TStaticText
        Caption = 'Patient Orders Related To:'
      end
      inherited pnlMain: TPanel
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
      Width = 328
      inherited lblSCDisplay: TLabel
        Width = 328
      end
      inherited memSCDisplay: TCaptionMemo
        Width = 328
      end
    end
  end
  object clstOrders: TCaptionCheckListBox
    Left = 8
    Top = 162
    Width = 564
    Height = 277
    OnClickCheck = clstOrdersClickCheck
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 16
    ParentShowHint = False
    PopupMenu = poBACopyPaste
    ShowHint = True
    Style = lbOwnerDrawVariable
    TabOrder = 4
    OnClick = clstOrdersClick
    OnDrawItem = clstOrdersDrawItem
    OnKeyUp = clstOrdersKeyUp
    OnMeasureItem = clstOrdersMeasureItem
    OnMouseDown = clstOrdersMouseDown
    OnMouseMove = clstOrdersMouseMove
    Caption = 'The following orders will be signed -'
  end
  object gbdxLookup: TGroupBox
    Left = 7
    Top = 139
    Width = 99
    Height = 43
    Caption = 'Lookup Diagnosis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    TabStop = True
    Visible = False
    object buOrdersDiagnosis: TButton
      Left = 7
      Top = 16
      Width = 86
      Height = 21
      Caption = '&Diagnosis'
      Enabled = False
      TabOrder = 0
      OnClick = buOrdersDiagnosisClick
    end
  end
  object poBACopyPaste: TPopupMenu
    Left = 344
    Top = 296
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
      OnClick = buOrdersDiagnosisClick
    end
    object Exit1: TMenuItem
      Caption = '&Exit'
      ShortCut = 16453
      OnClick = Exit1Click
    end
  end
end
