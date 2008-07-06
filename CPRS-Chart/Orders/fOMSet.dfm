object frmOMSet: TfrmOMSet
  Left = 209
  Top = 191
  Width = 113
  Height = 229
  BorderIcons = []
  Caption = 'Selected Orders'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    105
    202)
  PixelsPerInch = 96
  TextHeight = 13
  object lstSet: TCheckListBox
    Left = 0
    Top = 0
    Width = 104
    Height = 165
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    Enabled = False
    ItemHeight = 13
    TabOrder = 0
  end
  object cmdInterupt: TButton
    Left = 4
    Top = 172
    Width = 96
    Height = 26
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Stop Order Set'
    TabOrder = 1
    OnClick = cmdInteruptClick
  end
end
