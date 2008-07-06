inherited frmTimeout: TfrmTimeout
  Left = 418
  Top = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'CPRS Timeout'
  ClientHeight = 102
  ClientWidth = 247
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TStaticText
    Left = 8
    Top = 60
    Width = 30
    Height = 33
    Alignment = taRightJustify
    Caption = '10'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Label1: TStaticText
    Left = 8
    Top = 8
    Width = 234
    Height = 17
    Caption = 'Vista CPRS has been idle and will close!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Label2: TStaticText
    Left = 8
    Top = 32
    Width = 234
    Height = 17
    Caption = 'Press the button to continue working with CPRS.'
    TabOrder = 2
  end
  object cmdContinue: TButton
    Left = 134
    Top = 64
    Width = 105
    Height = 25
    Cancel = True
    Caption = 'Don'#39't Close CPRS'
    TabOrder = 0
    OnClick = cmdContinueClick
  end
  object timCountDown: TTimer
    Interval = 5000
    OnTimer = timCountDownTimer
    Left = 68
    Top = 60
  end
end
