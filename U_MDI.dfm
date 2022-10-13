object F_MDI: TF_MDI
  Left = 0
  Top = 0
  Caption = 'F_MDI'
  ClientHeight = 401
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_TOP: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 81
    Align = alTop
    TabOrder = 0
    object cxLbl_TIP: TcxLabel
      Left = 48
      Top = 32
      Caption = '* '#54616#45800#51032' Grid'#45716' '#44033#44033#51032' '#51060#48292#53944' '#54648#46308#47084' '#45236#51648' '#54532#47196#49884#51200' '#54840#52636' '#53580#49828#53944' '#50857#46020#51077#45768#45796'.'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object cxSplit_TOP: TcxSplitter
    Left = 0
    Top = 81
    Width = 488
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salTop
  end
  object Pnl_CLIENT: TPanel
    Left = 0
    Top = 89
    Width = 488
    Height = 312
    Align = alClient
    TabOrder = 2
    object Pnl_C_LEFT: TPanel
      Left = 1
      Top = 1
      Width = 240
      Height = 310
      Align = alLeft
      TabOrder = 0
      object Pnl_C_L_TOP: TPanel
        Left = 1
        Top = 1
        Width = 238
        Height = 144
        Align = alTop
        Caption = 'Pnl_C_L_TOP'
        TabOrder = 0
        object Str_L_Grid: TStringGrid
          Left = 1
          Top = 1
          Width = 236
          Height = 142
          Align = alClient
          TabOrder = 0
          OnDrawCell = Str_L_GridDrawCell
        end
      end
      object cxSplit_C_L: TcxSplitter
        Left = 1
        Top = 145
        Width = 238
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salTop
      end
      object Pnl_C_L_BOT: TPanel
        Left = 1
        Top = 153
        Width = 238
        Height = 156
        Align = alClient
        TabOrder = 2
        object Drw_L_Grid: TDrawGrid
          Left = 1
          Top = 1
          Width = 236
          Height = 154
          Align = alClient
          ColCount = 3
          TabOrder = 0
          OnDrawCell = Drw_L_GridDrawCell
        end
      end
    end
    object cxSplit_LEFT: TcxSplitter
      Left = 241
      Top = 1
      Width = 8
      Height = 310
      HotZoneClassName = 'TcxMediaPlayer9Style'
    end
    object Pnl_C_Client: TPanel
      Left = 249
      Top = 1
      Width = 238
      Height = 310
      Align = alClient
      TabOrder = 2
      object Pnl_C_R_TOP: TPanel
        Left = 1
        Top = 1
        Width = 236
        Height = 143
        Align = alTop
        TabOrder = 0
        object Str_R_Grid: TStringGrid
          Left = 1
          Top = 1
          Width = 234
          Height = 141
          Align = alClient
          ColCount = 3
          TabOrder = 0
          OnDrawCell = Str_R_GridDrawCell
          ExplicitLeft = -3
          ExplicitTop = 4
        end
      end
      object cxSplit_C_R: TcxSplitter
        Left = 1
        Top = 144
        Width = 236
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salTop
      end
      object Pnl_C_R_BOT: TPanel
        Left = 1
        Top = 152
        Width = 236
        Height = 157
        Align = alClient
        TabOrder = 2
        object Drw_R_Grid: TDrawGrid
          Left = 1
          Top = 1
          Width = 234
          Height = 155
          Align = alClient
          ColCount = 3
          TabOrder = 0
          OnDrawCell = Drw_R_GridDrawCell
        end
      end
    end
  end
end
