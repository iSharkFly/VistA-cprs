inherited frmDiagnoses: TfrmDiagnoses
  Left = 304
  Top = 169
  Caption = 'Encounter Diagnoses'
  PixelsPerInch = 96
  TextHeight = 13
  object lblAdd2PL: TLabel [0]
    Left = 555
    Top = 255
    Width = 53
    Height = 26
    Caption = 'Add to Problem list'
    WordWrap = True
  end
  inherited lblSection: TLabel
    Width = 89
    Caption = 'Diagnoses Section'
  end
  inherited btnOK: TBitBtn
    TabOrder = 7
  end
  inherited btnCancel: TBitBtn
    TabOrder = 8
  end
  inherited pnlGrid: TPanel
    Width = 523
    TabOrder = 1
    inherited lbGrid: TORListBox
      Tag = 20
      Width = 523
      Pieces = '1,2,3'
    end
    inherited hcGrid: THeaderControl
      Width = 523
      Sections = <
        item
          ImageIndex = -1
          MinWidth = 60
          Text = 'Add to PL'
          Width = 60
        end
        item
          ImageIndex = -1
          MinWidth = 65
          Text = 'Primary'
          Width = 65
        end
        item
          ImageIndex = -1
          MinWidth = 110
          Text = 'Selected Diagnoses'
          Width = 110
        end>
    end
  end
  inherited edtComment: TCaptionEdit
    TabOrder = 3
  end
  inherited btnRemove: TButton
    TabOrder = 6
  end
  inherited btnSelectAll: TButton
    Left = 454
    TabOrder = 2
    TabStop = True
  end
  inherited pnlMain: TPanel
    TabOrder = 0
    inherited lbxSection: TORListBox
      Tag = 20
      Height = 196
      IntegralHeight = True
      Pieces = '2,3,4,5'
    end
    inherited pnlLeft: TPanel
      inherited lbSection: TORListBox
        Tag = 20
        TabOrder = 0
      end
      inherited btnOther: TButton
        Tag = 12
        Caption = 'Other Diagnosis...'
        TabOrder = 1
      end
    end
  end
  object cmdDiagPrimary: TButton
    Left = 536
    Top = 306
    Width = 75
    Height = 21
    Caption = 'Primary'
    Enabled = False
    TabOrder = 5
    OnClick = cmdDiagPrimaryClick
  end
  object ckbDiagProb: TCheckBox
    Left = 536
    Top = 262
    Width = 13
    Height = 13
    Caption = 'Add to Problem list'
    TabOrder = 4
    OnClick = ckbDiagProbClicked
  end
end
