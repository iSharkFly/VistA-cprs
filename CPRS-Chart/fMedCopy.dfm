object frmMedCopy: TfrmMedCopy
  Left = 157
  Top = 62
  Width = 493
  Height = 428
  Caption = 'Copy Medication Orders'
  Color = clBtnFace
  Constraints.MinHeight = 150
  Constraints.MinWidth = 240
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 75
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object lblPtInfo: TLabel
      Left = 1
      Top = 1
      Width = 483
      Height = 40
      Align = alTop
      Constraints.MinHeight = 40
      Layout = tlCenter
    end
    object Panel2: TPanel
      Left = 1
      Top = 41
      Width = 483
      Height = 33
      Align = alTop
      AutoSize = True
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 24
        Height = 31
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
      object lblInstruction: TStaticText
        Left = 30
        Top = 1
        Width = 441
        Height = 17
        Caption = 
          '  Use Admit: if patient is newly admitted to the hospital or nur' +
          'sing home.'
        TabOrder = 0
      end
      object Label1: TStaticText
        Left = 30
        Top = 15
        Width = 455
        Height = 17
        Caption = 
          '  Use Transfer: if inpatient will move from one ward or treating' +
          ' team to another.'
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 75
    Width = 485
    Height = 65
    Align = alTop
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 483
      Height = 63
      Align = alClient
      TabOrder = 0
      DesignSize = (
        483
        63)
      object radDelayed: TRadioButton
        Left = 20
        Top = 37
        Width = 321
        Height = 17
        Caption = '&Delay release of copied orders until'
        TabOrder = 1
        OnClick = radDelayedClick
      end
      object radRelease: TRadioButton
        Left = 20
        Top = 16
        Width = 319
        Height = 17
        Caption = '&Release copied orders immediately'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = radReleaseClick
      end
      object cmdOK: TButton
        Left = 365
        Top = 15
        Width = 72
        Height = 19
        Anchors = [akTop, akRight]
        Caption = 'OK'
        Constraints.MaxWidth = 73
        Default = True
        TabOrder = 2
        OnClick = cmdOKClick
      end
      object cmdCancel: TButton
        Left = 365
        Top = 37
        Width = 72
        Height = 19
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = 'Cancel'
        Constraints.MaxWidth = 73
        TabOrder = 3
        OnClick = cmdCancelClick
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 140
    Width = 485
    Height = 261
    Align = alClient
    TabOrder = 2
    inline fraEvntDelayList: TfraEvntDelayList
      Left = 1
      Top = 1
      Width = 483
      Height = 259
      Align = alClient
      TabOrder = 0
      Visible = False
      inherited pnlDate: TPanel
        Left = 378
        Height = 259
        inherited lblEffective: TLabel
          Left = 446
        end
        inherited orDateBox: TORDateBox
          Left = 446
        end
      end
      inherited pnlList: TPanel
        Width = 378
        Height = 259
        inherited mlstEvents: TORListBox
          Width = 376
          Height = 236
          OnDblClick = cmdOKClick
        end
        inherited edtSearch: TCaptionEdit
          Width = 376
        end
      end
    end
  end
end
