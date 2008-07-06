object frmRemCoverPreview: TfrmRemCoverPreview
  Left = 214
  Top = 107
  Width = 263
  Height = 410
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Cover Sheet Reminders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtns: TPanel
    Left = 0
    Top = 354
    Width = 255
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOK: TButton
      Left = 179
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object lvMain: TListView
    Left = 0
    Top = 0
    Width = 255
    Height = 354
    Align = alClient
    Columns = <
      item
        Caption = 'Reminder'
        Tag = 1
        Width = 200
      end
      item
        Caption = 'Seq'
        Tag = 2
        Width = 35
      end>
    ReadOnly = True
    SortType = stData
    TabOrder = 1
    ViewStyle = vsReport
    OnColumnClick = lvMainColumnClick
    OnCompare = lvMainCompare
  end
end
