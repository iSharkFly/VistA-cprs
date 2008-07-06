inherited frmOrdersTS: TfrmOrdersTS
  Left = 84
  Top = 77
  Width = 464
  Height = 385
  Caption = 'Release Orders'
  Constraints.MinHeight = 365
  Constraints.MinWidth = 310
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMiddle: TPanel
    Left = 0
    Top = 78
    Width = 456
    Height = 56
    Align = alTop
    Constraints.MinHeight = 45
    TabOrder = 0
    object grpChoice: TGroupBox
      Left = 1
      Top = 1
      Width = 454
      Height = 54
      Align = alClient
      Constraints.MinHeight = 45
      TabOrder = 0
      DesignSize = (
        454
        54)
      object radReleaseNow: TRadioButton
        Left = 20
        Top = 13
        Width = 333
        Height = 17
        BiDiMode = bdRightToLeft
        Caption = '  &Release new orders immediately'
        Enabled = False
        ParentBiDiMode = False
        TabOrder = 0
        OnClick = radReleaseNowClick
      end
      object radDelayed: TRadioButton
        Left = 20
        Top = 29
        Width = 329
        Height = 21
        Caption = '  &Delay release of new order(s) until'
        TabOrder = 1
        OnClick = radDelayedClick
      end
      object cmdOK: TButton
        Left = 355
        Top = 9
        Width = 75
        Height = 20
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
        TabOrder = 2
        OnClick = cmdOKClick
      end
      object cmdCancel: TButton
        Left = 355
        Top = 31
        Width = 75
        Height = 20
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = cmdCancelClick
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 78
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = True
    BorderStyle = bsSingle
    TabOrder = 1
    object lblPtInfo: TLabel
      Left = 1
      Top = 1
      Width = 450
      Height = 34
      Align = alTop
      Color = clBtnFace
      Constraints.MinHeight = 34
      ParentColor = False
      Layout = tlCenter
    end
    object pnldif: TPanel
      Left = 1
      Top = 35
      Width = 450
      Height = 38
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 24
        Height = 36
        Align = alLeft
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
      object Label1: TLabel
        Left = 34
        Top = 4
        Width = 327
        Height = 13
        Caption = 
          'Use Admit: if patient is newly admitted to the hospital or nursi' +
          'ng home.'
      end
      object Label2: TLabel
        Left = 34
        Top = 21
        Width = 361
        Height = 13
        Caption = 
          'Use Transfer: if inpatient will move from one ward or treating t' +
          'eam to another.'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 134
    Width = 456
    Height = 224
    Align = alClient
    TabOrder = 2
    inline fraEvntDelayList: TfraEvntDelayList
      Left = 1
      Top = 1
      Width = 454
      Height = 222
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      Visible = False
      inherited pnlDate: TPanel
        Left = 349
        Height = 222
        inherited lblEffective: TLabel
          Left = 453
        end
        inherited orDateBox: TORDateBox
          Left = 453
        end
      end
      inherited pnlList: TPanel
        Width = 349
        Height = 222
        inherited lblEvntDelayList: TLabel
          Width = 347
        end
        inherited mlstEvents: TORListBox
          Width = 347
          Height = 186
          OnDblClick = cmdOKClick
        end
        inherited edtSearch: TCaptionEdit
          Width = 347
        end
      end
    end
  end
end
