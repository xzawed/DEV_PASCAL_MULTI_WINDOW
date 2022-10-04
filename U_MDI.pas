unit U_MDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxSplitter, ExtCtrls, Grids, cxContainer, cxEdit, cxLabel;

type
  TF_MDI = class(TForm)
    Pnl_TOP: TPanel;
    cxSplit_TOP: TcxSplitter;
    Pnl_CLIENT: TPanel;
    Pnl_C_LEFT: TPanel;
    cxSplit_LEFT: TcxSplitter;
    Pnl_C_Client: TPanel;
    Pnl_C_L_TOP: TPanel;
    Str_L_Grid: TStringGrid;
    cxSplit_C_L: TcxSplitter;
    Pnl_C_L_BOT: TPanel;
    Drw_L_Grid: TDrawGrid;
    Pnl_C_R_TOP: TPanel;
    cxSplit_C_R: TcxSplitter;
    Pnl_C_R_BOT: TPanel;
    Str_R_Grid: TStringGrid;
    Drw_R_Grid: TDrawGrid;
    cxLbl_TIP: TcxLabel;
    procedure Str_L_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Drw_L_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    procedure prc_SetForm;
    { Public declarations }
  end;

var
  F_MDI: TF_MDI;

implementation

{$R *.dfm}

{ TF_MDI }

procedure TF_MDI.Str_L_GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lValWidth : Integer;
begin
// ACol�� Ȧ���϶� clYellow ¦���϶� clBlue
  if ACol mod 2 = 0 then
    Str_L_Grid.Canvas.Brush.Color := clYellow
  else
    Str_L_Grid.Canvas.Brush.Color := clBlue;
// ä��� �Ӽ�
  Str_L_Grid.Canvas.FillRect(Rect);
  lValWidth := Str_L_Grid.Canvas.TextWidth('������');
  Str_L_Grid.Canvas.TextOut( (Rect.Left+Rect.Right-lValWidth) div 2, Rect.Top+5, '������');
end;

procedure TF_MDI.Drw_L_GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lValWidth : Integer;
  lGrdAlign : Word;
begin
// ACol�� Ȧ���϶� clYellow ¦���϶� clBlue
  if ACol mod 2 = 0 then
    Drw_L_Grid.Canvas.Brush.Color := clYellow
  else
    Drw_L_Grid.Canvas.Brush.Color := clBlue;
// ä��� �Ӽ�
  Drw_L_Grid.Canvas.FillRect(Rect);
// ��� ����
  lGrdAlign := SetTextAlign(Drw_L_Grid.Canvas.Handle, TA_CENTER);
  lValWidth := Drw_L_Grid.Canvas.TextWidth('�󸶹�');
// Drw_L_Grid ������� ó��
// CASE1) ���ڿ� ���̸�ŭ ���� 2�� ���� ��� ����ó��(�� ���ڿ��� �ش�.)
  //Drw_L_Grid.Canvas.TextOut( (Rect.Left+Rect.Right-lValWidth) div 2, Rect.Top+5, '�󸶹�');
// CASE2) Rect.left + (Rect.Right - Rect.Left)
  Drw_L_Grid.Canvas.TextOut( (Rect.Left + (Rect.Right - Rect.Left)) div 2, Rect.Top+5, '�󸶹�');
// ��� ����
  SetTextAlign(Drw_L_Grid.Canvas.Handle, lGrdAlign);
end;

procedure TF_MDI.prc_SetForm;
var
  lICol : Integer;
  lIRow : Integer;
  lValWidth : Integer;
  lRect : TRect;
begin
//
  Drw_L_Grid.ColCount := 3;
  Drw_L_Grid.RowCount := 5;

  Str_L_Grid.ColCount := 3;
  Str_L_Grid.RowCount := 5;

  Drw_R_Grid.ColCount := 3;
  Drw_R_Grid.RowCount := 5;

  Str_R_Grid.ColCount := 3;
  Str_R_Grid.RowCount := 5;

// 2���� ����� ������ �غ��� ��.
// CASE 1) Public ���ν��� ���ο� ���Ǵ� ������ �����ϴ� ó���� ȣ��
// CASE 2) OnDrawCell �̺�Ʈ �ڵ鷯 ���ο� ���Ǵ� ������ �����ϴ� ó���� ȣ��

  for lIRow := 0 to 4 do
  begin
    for lICol := 0 to 2 do
    begin
      // StringGrid
      if lICol mod 2 = 0 then
        Str_R_Grid.Canvas.Brush.Color := clBlue
      else
        Str_R_Grid.Canvas.Brush.Color := clYellow;
      lRect := Str_R_Grid.CellRect(lICol, lIRow);
      Str_R_Grid.Canvas.FillRect(lRect);
      
      lValWidth := Str_R_Grid.Canvas.TextWidth('������');
      Str_R_Grid.Canvas.TextOut( (lRect.Left+lRect.Right-lValWidth) div 2, lRect.Top+5, '������');

      // DrawGrid
      if lICol mod 2 = 0 then
        Drw_R_Grid.Canvas.Brush.Color := clBlue
      else
        Drw_R_Grid.Canvas.Brush.Color := clYellow;
      lRect := Drw_R_Grid.CellRect(lICol, lIRow);
      Drw_R_Grid.Canvas.FillRect(lRect);

      lValWidth := Drw_R_Grid.Canvas.TextWidth('�󸶹�');
      Drw_R_Grid.Canvas.TextOut( (lRect.Left+lRect.Right-lValWidth) div 2, lRect.Top+5, '�󸶹�');

    end;
  end;

end;

end.
