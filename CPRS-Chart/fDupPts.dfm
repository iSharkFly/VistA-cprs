object frmDupPts: TfrmDupPts
  Left = 160
  Top = 190
  Width = 471
  Height = 214
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Similar Patients'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDupPts: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 184
    Align = alClient
    TabOrder = 0
    DesignSize = (
      463
      184)
    object lblSelDupPts: TLabel
      Left = 6
      Top = 3
      Width = 155
      Height = 13
      Caption = 'Please select the correct patient:'
    end
    object btnOK: TButton
      Left = 296
      Top = 150
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      Default = True
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 381
      Top = 150
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object pnlSelDupPt: TPanel
      Left = 2
      Top = 19
      Width = 461
      Height = 120
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object lblDupPts: TLabel
        Left = 4
        Top = 2
        Width = 364
        Height = 13
        Caption = 
          ' Name                                                        DOB' +
          '                                        SSN'
      end
      object lboSelPt: TORListBox
        Left = 1
        Top = 16
        Width = 459
        Height = 103
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = lboSelPtDblClick
        Caption = 'Please select the correct patient'
        ItemTipColor = clWindow
        LongList = False
        Pieces = '2,3,4'
        TabPositions = '33,57'
      end
    end
  end
end
