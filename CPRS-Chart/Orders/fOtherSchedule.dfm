object frmOtherSchedule: TfrmOtherSchedule
  Left = 544
  Top = 262
  AutoScroll = False
  Caption = 'Order with schedule '#39'OTHER'#39
  ClientHeight = 362
  ClientWidth = 369
  Color = clBtnFace
  Constraints.MinHeight = 70
  Constraints.MinWidth = 280
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 82
    Width = 369
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    MinSize = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 82
    Align = alTop
    BorderWidth = 3
    TabOrder = 0
    object Image1: TImage
      Left = 4
      Top = 4
      Width = 48
      Height = 74
      Align = alLeft
      AutoSize = True
      Transparent = True
    end
    object memMessage: TMemo
      Left = 52
      Top = 4
      Width = 313
      Height = 74
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnFace
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 90
    Width = 369
    Height = 272
    Align = alClient
    AutoSize = True
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 176
      Height = 202
      Align = alLeft
      Caption = 'Select Days of Week'
      TabOrder = 0
      object cbo7: TCheckBox
        Tag = 1
        Left = 86
        Top = 21
        Width = 60
        Height = 12
        Caption = 'SUN'
        TabOrder = 0
        OnClick = cbo7Click
      end
      object cbo1: TCheckBox
        Tag = 2
        Left = 85
        Top = 48
        Width = 60
        Height = 12
        Caption = 'MON'
        TabOrder = 1
        OnClick = cbo1Click
      end
      object cbo2: TCheckBox
        Tag = 3
        Left = 85
        Top = 75
        Width = 60
        Height = 12
        Caption = 'TUE'
        TabOrder = 2
        OnClick = cbo2Click
      end
      object cbo3: TCheckBox
        Tag = 4
        Left = 85
        Top = 102
        Width = 60
        Height = 12
        Caption = 'WED'
        TabOrder = 3
        OnClick = cbo3Click
      end
      object cbo4: TCheckBox
        Tag = 5
        Left = 85
        Top = 129
        Width = 60
        Height = 12
        Caption = 'THU'
        TabOrder = 4
        OnClick = cbo4Click
      end
      object cbo5: TCheckBox
        Tag = 6
        Left = 85
        Top = 156
        Width = 60
        Height = 12
        Caption = 'FRI'
        TabOrder = 5
        OnClick = cbo5Click
      end
      object cbo6: TCheckBox
        Tag = 7
        Left = 85
        Top = 183
        Width = 60
        Height = 12
        Caption = 'SAT'
        TabOrder = 6
        OnClick = cbo6Click
      end
      object Button1: TButton
        Left = 8
        Top = 64
        Width = 60
        Height = 19
        Caption = 'Everyday'
        TabOrder = 7
        OnClick = Button1Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 180
      Top = 1
      Width = 188
      Height = 202
      Align = alRight
      Caption = 'Set Administration Time'
      TabOrder = 1
      object lstHour: TListBox
        Left = 8
        Top = 16
        Width = 49
        Height = 182
        ItemHeight = 13
        Items.Strings = (
          '  0'
          '  1'
          '  2'
          '  3'
          '  4'
          '  5'
          '  6'
          '  7'
          '  8'
          '  9'
          '10'
          '11'
          '12 --'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23')
        TabOrder = 0
        OnClick = lstHourClick
      end
      object lstMinute: TListBox
        Left = 60
        Top = 16
        Width = 49
        Height = 182
        ItemHeight = 13
        Items.Strings = (
          ':00'
          ':05'
          ':10'
          ':15'
          ':20'
          ':25'
          ':30'
          ':35'
          ':40'
          ':45'
          ':50'
          ':55')
        TabOrder = 1
        OnKeyDown = lstMinuteKeyDown
        OnMouseUp = lstMinuteMouseUp
      end
      object btnRemove: TButton
        Left = 118
        Top = 94
        Width = 60
        Height = 19
        Hint = 'Remove the selected time from the Day-of-Week schedule.'
        Caption = 'Remove'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnRemoveClick
      end
      object btnAdd: TButton
        Left = 118
        Top = 64
        Width = 60
        Height = 19
        Hint = 'Add the selected time to the Day-of-Week schedule'
        Caption = 'Add'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnAddClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 203
      Width = 367
      Height = 68
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        367
        68)
      object Label1: TLabel
        Left = 6
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Schedule :'
      end
      object btn0k1: TButton
        Left = 204
        Top = 43
        Width = 75
        Height = 20
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        TabOrder = 1
        OnClick = btn0k1Click
      end
      object btnCancel: TButton
        Left = 285
        Top = 42
        Width = 75
        Height = 20
        Anchors = [akRight, akBottom]
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnCancelClick
      end
      object txtSchedule: TEdit
        Left = 64
        Top = 8
        Width = 296
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = txtScheduleChange
      end
      object btnReset: TButton
        Left = 8
        Top = 43
        Width = 75
        Height = 20
        Caption = 'Reset'
        TabOrder = 3
        OnClick = btnResetClick
      end
    end
  end
end
