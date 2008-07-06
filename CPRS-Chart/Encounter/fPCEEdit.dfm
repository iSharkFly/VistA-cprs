object frmPCEEdit: TfrmPCEEdit
  Left = 214
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Edit Encounter'
  ClientHeight = 128
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    543
    128)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TStaticText
    Left = 0
    Top = 0
    Width = 543
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Select Encounter to Edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object lblNew: TMemo
    Left = 136
    Top = 32
    Width = 401
    Height = 26
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'New')
    TabOrder = 3
  end
  object lblNote: TMemo
    Left = 136
    Top = 73
    Width = 401
    Height = 26
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Lines.Strings = (
      'Note')
    TabOrder = 4
  end
  object btnNew: TButton
    Left = 8
    Top = 28
    Width = 121
    Height = 21
    Caption = 'Edit Current Encounter'
    ModalResult = 6
    TabOrder = 0
  end
  object btnNote: TButton
    Left = 8
    Top = 69
    Width = 121
    Height = 21
    Caption = 'Edit Note Encounter'
    ModalResult = 7
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 465
    Top = 104
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
