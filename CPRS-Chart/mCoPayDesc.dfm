object fraCoPayDesc: TfraCoPayDesc
  Left = 0
  Top = 0
  Width = 598
  Height = 132
  Anchors = [akLeft, akTop, akRight]
  AutoScroll = False
  AutoSize = True
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object pnlRight: TPanel
    Left = 388
    Top = 0
    Width = 210
    Height = 132
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Spacer2: TLabel
      Left = 0
      Top = 0
      Width = 210
      Height = 3
      Align = alTop
      AutoSize = False
    end
    object lblCaption: TStaticText
      Left = 0
      Top = 3
      Width = 210
      Height = 14
      Align = alTop
      AutoSize = False
      Caption = 'Outpatient Medications Related To:'
      TabOrder = 0
    end
    object pnlMain: TPanel
      Left = 0
      Top = 17
      Width = 210
      Height = 115
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object spacer1: TLabel
        Left = 2
        Top = 2
        Width = 206
        Height = 3
        Align = alTop
        AutoSize = False
      end
      object Panel7: TPanel
        Left = 2
        Top = 95
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 6
        object lblHNC2: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = '&Head and/or Neck Cancer'
          TabOrder = 1
          TabStop = True
        end
        object lblHNC: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '  HNC -  '
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 80
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 5
        object Label12: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = '&MST'
          TabOrder = 1
          TabStop = True
        end
        object Label11: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '  MST -  '
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 65
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 4
        object Label14: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = '&Environmental Contaminants'
          TabOrder = 1
          TabStop = True
        end
        object Label13: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '    EC -  '
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 50
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 3
        object Label16: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = 'Ionizing &Radiation Exposure'
          TabOrder = 1
          TabStop = True
        end
        object Label15: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '     IR -  '
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 35
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 2
        object Label18: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = 'Agent &Orange Exposure'
          TabOrder = 1
          TabStop = True
        end
        object Label17: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '    AO -  '
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel12: TPanel
        Left = 2
        Top = 5
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 0
        object Label24: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = 'Service &Connected Condition'
          TabOrder = 1
          TabStop = True
        end
        object Label23: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Caption = '    SC -  '
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 20
        Width = 206
        Height = 15
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 1
        object StaticText4: TORStaticText
          Left = 50
          Top = 0
          Width = 150
          Height = 15
          AutoSize = False
          Caption = 'Combat &Vet (Combat Related)'
          TabOrder = 1
          TabStop = True
        end
        object StaticText1: TORStaticText
          Left = 0
          Top = 0
          Width = 50
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = '    CV -  '
          TabOrder = 0
          TabStop = True
        end
      end
    end
  end
  object pnlSC: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 132
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lblSCDisplay: TLabel
      Left = 0
      Top = 0
      Width = 388
      Height = 17
      Align = alTop
      AutoSize = False
      Caption = 'Service Connection && Rated Disabilities'
      Layout = tlCenter
    end
    object memSCDisplay: TCaptionMemo
      Left = 0
      Top = 17
      Width = 388
      Height = 115
      Align = alClient
      Color = clBtnFace
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      Caption = 'Service Connection and Rated Disabilities'
    end
  end
end
