inherited frmOCAccept: TfrmOCAccept
  Left = 305
  Top = 257
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Order Checking'
  ClientHeight = 169
  ClientWidth = 472
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object memChecks: TRichEdit
    Left = 0
    Top = 0
    Width = 472
    Height = 136
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 136
    Width = 472
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cmdAccept: TButton
      Left = 148
      Top = 7
      Width = 80
      Height = 21
      Caption = 'Accept Order'
      Default = True
      ModalResult = 6
      TabOrder = 0
    end
    object cmdCancel: TButton
      Left = 244
      Top = 7
      Width = 80
      Height = 21
      Cancel = True
      Caption = 'Cancel Order'
      ModalResult = 7
      TabOrder = 1
    end
  end
end
