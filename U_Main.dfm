object F_Main: TF_Main
  Left = 0
  Top = 0
  Caption = #47700#51064#54868#47732
  ClientHeight = 558
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_TOP: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 105
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object cxSplit_TOP: TcxSplitter
    Left = 0
    Top = 105
    Width = 778
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salTop
  end
  object Pnl_Client: TPanel
    Left = 0
    Top = 113
    Width = 778
    Height = 445
    Align = alClient
    TabOrder = 2
    object Pnl_LEFT: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 443
      Align = alLeft
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object cxSplit_LEFT: TcxSplitter
      Left = 186
      Top = 1
      Width = 8
      Height = 443
      HotZoneClassName = 'TcxSimpleStyle'
    end
    object Pnl_SUB_CLIENT: TPanel
      Left = 194
      Top = 1
      Width = 583
      Height = 443
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
  end
end
