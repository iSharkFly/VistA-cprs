object frmODChild: TfrmODChild
  Left = 433
  Top = 271
  Width = 512
  Height = 453
  Caption = 'Associated Complex Orders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblWarning: TLabel
    Left = 0
    Top = 0
    Width = 504
    Height = 59
    Align = alTop
    AutoSize = False
    Caption = 
      'You have requested to discontinue a medication order which was e' +
      'ntered as part of a complex order. The following are the orders ' +
      'associated with the same complex order. Do you want to dicsconti' +
      'nue all of these orders?'
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 59
    Width = 504
    Height = 325
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    BorderStyle = bsSingle
    TabOrder = 0
    object lstODComplex: TListBox
      Left = 3
      Top = 3
      Width = 494
      Height = 315
      Style = lbOwnerDrawVariable
      Align = alClient
      ItemHeight = 16
      TabOrder = 0
      OnDrawItem = lstODComplexDrawItem
      OnMeasureItem = lstODComplexMeasureItem
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 504
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      504
      41)
    object btnOK: TButton
      Left = 332
      Top = 12
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 416
      Top = 12
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
