inherited frmExams: TfrmExams
  Left = 509
  Top = 223
  Caption = 'Encounter Examinations'
  PixelsPerInch = 96
  TextHeight = 13
  object lblExamResults: TLabel [0]
    Left = 490
    Top = 264
    Width = 35
    Height = 13
    Caption = 'Results'
  end
  inherited lblSection: TLabel
    Width = 65
    Caption = 'Exam Section'
  end
  inherited btnOK: TBitBtn
    TabOrder = 6
  end
  inherited btnCancel: TBitBtn
    TabOrder = 7
  end
  inherited pnlGrid: TPanel
    TabOrder = 1
    inherited lbGrid: TORListBox
      Caption = 'Exams'
      Pieces = '1,2'
    end
    inherited hcGrid: THeaderControl
      Sections = <
        item
          ImageIndex = -1
          MinWidth = 60
          Text = 'Results'
          Width = 60
        end
        item
          ImageIndex = -1
          MinWidth = 90
          Text = 'Selected Exams'
          Width = 90
        end>
    end
  end
  inherited edtComment: TCaptionEdit
    TabOrder = 3
  end
  inherited btnRemove: TButton
    TabOrder = 5
  end
  inherited btnSelectAll: TButton
    TabOrder = 2
    TabStop = True
  end
  inherited pnlMain: TPanel
    TabOrder = 0
    inherited lbxSection: TORListBox
      Tag = 80
    end
    inherited pnlLeft: TPanel
      inherited lbSection: TORListBox
        TabOrder = 0
        Caption = 'Exam Section'
      end
      inherited btnOther: TButton
        Tag = 24
        Caption = 'Other Exam...'
        TabOrder = 1
      end
    end
  end
  object cboExamResults: TORComboBox
    Tag = 60
    Left = 490
    Top = 280
    Width = 121
    Height = 21
    Style = orcsDropDown
    AutoSelect = True
    Caption = 'Results'
    Color = clWindow
    DropDownCount = 8
    Enabled = False
    ItemHeight = 13
    ItemTipColor = clWindow
    ItemTipEnable = True
    ListItemsOnly = False
    LongList = False
    MaxLength = 0
    Pieces = '2'
    Sorted = False
    SynonymChars = '<>'
    TabOrder = 4
    OnChange = cboExamResultsChange
  end
end
