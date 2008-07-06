object fraTemplateFieldButton: TfraTemplateFieldButton
  Left = 0
  Top = 0
  Width = 109
  Height = 14
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  OnEnter = pnlBtnEnter
  OnExit = pnlBtnExit
  object pnlBtn: TPanel
    Left = 0
    Top = 0
    Width = 109
    Height = 14
    Align = alClient
    TabOrder = 0
    OnMouseDown = pnlBtnMouseDown
    OnMouseUp = pnlBtnMouseUp
    object lblText: TLabel
      Left = 2
      Top = -1
      Width = 105
      Height = 14
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Transparent = True
      Layout = tlCenter
      OnMouseDown = pnlBtnMouseDown
      OnMouseUp = pnlBtnMouseUp
    end
    object pbFocus: TPaintBox
      Left = 1
      Top = 1
      Width = 107
      Height = 12
      Align = alClient
      OnMouseDown = pnlBtnMouseDown
      OnMouseUp = pnlBtnMouseUp
      OnPaint = pbFocusPaint
    end
  end
end
