object frmChgEvent: TfrmChgEvent
  Left = 256
  Top = 148
  Width = 562
  Height = 428
  Caption = 'Change Release Event'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 38
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object lblPtInfo: TLabel
      Left = 1
      Top = 1
      Width = 552
      Height = 36
      Align = alTop
      Color = clBtnFace
      Constraints.MinHeight = 36
      ParentColor = False
      Layout = tlCenter
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 38
    Width = 554
    Height = 362
    Align = alClient
    TabOrder = 1
    DesignSize = (
      554
      362)
    object cboSpecialty: TORComboBox
      Left = 12
      Top = 8
      Width = 443
      Height = 344
      Anchors = [akLeft, akTop, akRight, akBottom]
      Style = orcsSimple
      AutoSelect = True
      Color = clWindow
      DropDownCount = 8
      ItemHeight = 13
      ItemTipColor = clWindow
      ItemTipEnable = True
      ListItemsOnly = False
      LongList = False
      LookupPiece = 0
      MaxLength = 0
      Pieces = '9'
      Sorted = False
      SynonymChars = '<>'
      TabOrder = 0
      OnChange = cboSpecialtyChange
      OnDblClick = cboSpecialtyDblClick
    end
    object btnCancel: TButton
      Left = 466
      Top = 331
      Width = 75
      Height = 20
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnAction: TButton
      Left = 466
      Top = 303
      Width = 75
      Height = 20
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Visible = False
      OnClick = btnActionClick
    end
  end
end
