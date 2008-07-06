object frmODMedOIFA: TfrmODMedOIFA
  Left = 0
  Top = 0
  Width = 313
  Height = 205
  Caption = 'Formulary Alternatives'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 305
    Height = 13
    Align = alTop
    Caption = 'The selected drug is not in the formulary.  Alternatives are:'
  end
  object Label2: TStaticText
    Left = 0
    Top = 134
    Width = 305
    Height = 17
    Align = alBottom
    Caption = 'Do you wish to use the selected alternative instead?'
    TabOrder = 1
  end
  object lstFormAlt: TORListBox
    Left = 0
    Top = 13
    Width = 305
    Height = 121
    Align = alClient
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = lstFormAltClick
    Caption = 'The selected drug is not in the formulary.  Alternatives are:'
    ItemTipColor = clWindow
    LongList = False
    Pieces = '2'
  end
  object btnPanel: TPanel
    Left = 0
    Top = 151
    Width = 305
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object cmdYes: TButton
      Left = 74
      Top = 3
      Width = 72
      Height = 21
      Caption = 'Yes'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = cmdYesClick
    end
    object cmdNo: TButton
      Left = 162
      Top = 3
      Width = 72
      Height = 21
      Cancel = True
      Caption = 'No'
      TabOrder = 1
      OnClick = cmdNoClick
    end
  end
end
