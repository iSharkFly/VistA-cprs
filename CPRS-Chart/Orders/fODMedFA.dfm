inherited frmODMedFA: TfrmODMedFA
  Left = 333
  Top = 258
  Width = 316
  Height = 205
  Caption = 'Formulary Alternatives'
  FormStyle = fsStayOnTop
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 273
    Height = 13
    Caption = 'The selected drug is not in the formulary.  Alternatives are:'
  end
  object Label2: TStaticText
    Left = 8
    Top = 127
    Width = 250
    Height = 17
    Caption = 'Do you wish to use the selected alternative instead?'
    TabOrder = 3
  end
  object lstFormAlt: TORListBox
    Left = 8
    Top = 22
    Width = 292
    Height = 97
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
  object cmdYes: TButton
    Left = 74
    Top = 148
    Width = 72
    Height = 21
    Caption = 'Yes'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = cmdYesClick
  end
  object cmdNo: TButton
    Left = 162
    Top = 148
    Width = 72
    Height = 21
    Cancel = True
    Caption = 'No'
    TabOrder = 2
    OnClick = cmdNoClick
  end
end
