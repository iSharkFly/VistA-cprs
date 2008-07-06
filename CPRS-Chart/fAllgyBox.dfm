inherited frmAllgyBox: TfrmAllgyBox
  Left = 487
  Top = 242
  Width = 457
  Caption = 'frmAllgyBox'
  Constraints.MinWidth = 457
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited memReport: TRichEdit
    Width = 449
  end
  inherited pnlButton: TPanel
    Width = 449
    inherited cmdPrint: TButton
      Left = 293
      Top = 3
      TabOrder = 3
    end
    inherited cmdClose: TButton
      Left = 373
      Top = 3
      TabOrder = 4
    end
    object cmdEdit: TButton
      Left = 98
      Top = 3
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Edit'
      TabOrder = 1
      Visible = False
      OnClick = cmdEditClick
    end
    object cmdAdd: TButton
      Left = 2
      Top = 3
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Add New'
      TabOrder = 0
      OnClick = cmdAddClick
    end
    object cmdInError: TButton
      Left = 195
      Top = 3
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Entered in Error'
      TabOrder = 2
      OnClick = cmdInErrorClick
    end
  end
end
