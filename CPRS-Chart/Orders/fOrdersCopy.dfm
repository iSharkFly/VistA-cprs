object frmCopyOrders: TfrmCopyOrders
  Left = 319
  Top = 139
  AutoScroll = False
  Caption = 'Copy Orders'
  ClientHeight = 419
  ClientWidth = 441
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 330
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInfo: TPanel
    Left = 0
    Top = 41
    Width = 441
    Height = 50
    Align = alTop
    TabOrder = 1
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 24
      Height = 22
      AutoSize = True
      Enabled = False
      Picture.Data = {
        07544269746D61707E010000424D7E0100000000000076000000280000001800
        000016000000010004000000000008010000C40E0000C40E0000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF008000000000000000000000080777777777777777777777700F7777777777
        7777777777700F88888888888888888887700F88888888888888888887700F88
        888808888888888887700F88888800888888888887700F8888880B0888888888
        87700F8888880BB00008888887700F888800BBCCBBB0088887700F8880BBBCCC
        CBBBB08887700F880BBBBBBBBBBBBB0887700F880BBBBBCCBBBBBB0887700F88
        0BBBBBCCBBBBBB0887700F880BBBBBCCBBBBBB0887700F8880BBBBCCBBBBB088
        87700F888800BBBBBBB0088887700F88888800000008888887700F8888888888
        8888888887700F88888888888888888887700FFFFFFFFFFFFFFFFFFFFF708000
        00000000000000000008}
      Transparent = True
    end
    object Label2: TStaticText
      Left = 31
      Top = 30
      Width = 365
      Height = 17
      Caption = 
        'Use Transfer: if inpatient will move from one ward or treating t' +
        'eam to another.'
      TabOrder = 1
      TabStop = True
    end
    object Label1: TStaticText
      Left = 31
      Top = 4
      Width = 331
      Height = 17
      Caption = 
        'Use Admit: if patient is newly admitted to the hospital or nursi' +
        'ng home.'
      TabOrder = 0
      TabStop = True
    end
  end
  inline fraEvntDelayList: TfraEvntDelayList
    Left = 0
    Top = 154
    Width = 441
    Height = 265
    Align = alClient
    TabOrder = 3
    Visible = False
    inherited pnlDate: TPanel
      Left = 336
      Height = 265
      inherited lblEffective: TLabel
        Left = 451
      end
      inherited orDateBox: TORDateBox
        Left = 451
      end
    end
    inherited pnlList: TPanel
      Width = 336
      Height = 265
      inherited lblEvntDelayList: TLabel
        Width = 334
      end
      inherited mlstEvents: TORListBox
        Width = 334
        Height = 229
        OnDblClick = cmdOKClick
        OnChange = fraEvntDelayListmlstEventsChange
      end
      inherited edtSearch: TCaptionEdit
        Width = 334
      end
    end
  end
  object pnlRadio: TPanel
    Left = 0
    Top = 91
    Width = 441
    Height = 63
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 439
      Height = 61
      Align = alClient
      Constraints.MinHeight = 50
      DragMode = dmAutomatic
      TabOrder = 0
      object radRelease: TRadioButton
        Left = 12
        Top = 15
        Width = 318
        Height = 20
        Caption = '&Release copied orders immediately'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = radReleaseClick
      end
      object radEvtDelay: TRadioButton
        Left = 12
        Top = 37
        Width = 320
        Height = 20
        Caption = '&Delay release of copied orders'
        TabOrder = 1
        OnClick = radEvtDelayClick
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblPtInfo: TStaticText
      Left = 0
      Top = 0
      Width = 441
      Height = 41
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Constraints.MinHeight = 40
      TabOrder = 0
      TabStop = True
    end
  end
  object pnlBtns: TPanel
    Left = 334
    Top = 91
    Width = 107
    Height = 63
    Align = alCustom
    Anchors = [akTop, akRight]
    TabOrder = 4
    object gbBtns: TGroupBox
      Left = 1
      Top = 1
      Width = 105
      Height = 61
      Align = alClient
      TabOrder = 0
      DesignSize = (
        105
        61)
      object cmdOK: TButton
        Left = 17
        Top = 13
        Width = 72
        Height = 19
        Anchors = [akTop, akRight]
        Caption = 'OK'
        Constraints.MaxWidth = 73
        Default = True
        TabOrder = 0
        OnClick = cmdOKClick
      end
      object cmdCancel: TButton
        Left = 17
        Top = 34
        Width = 72
        Height = 18
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Cancel'
        Constraints.MaxWidth = 73
        TabOrder = 1
        OnClick = cmdCancelClick
      end
    end
  end
end
