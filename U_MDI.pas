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
  dxSkinXmas2008Blue, cxSplitter, ExtCtrls, Grids, cxContainer, cxEdit, cxLabel, U_Class;

type
  TF_MDI = class(TForm)
    Pnl_TOP: TPanel;
    cxSplit_TOP: TcxSplitter;
    Pnl_CLIENT: TPanel;
    Pnl_C_LEFT: TPanel;
    cxSplit_LEFT: TcxSplitter;
    Pnl_C_Client: TPanel;
    Pnl_C_L_TOP: TPanel;
    cxSplit_C_L: TcxSplitter;
    Pnl_C_L_BOT: TPanel;
    Pnl_C_R_TOP: TPanel;
    cxSplit_C_R: TcxSplitter;
    Pnl_C_R_BOT: TPanel;
    cxLbl_TIP: TcxLabel;
    ////////////////////////////////////////////////////////////////////////////
    Str_L_Grid: TStringGrid;
    Drw_L_Grid: TDrawGrid;
    Str_R_Grid: TStringGrid;
    Drw_R_Grid: TDrawGrid;
    ////////////////////////////////////////////////////////////////////////////
    procedure Str_L_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Drw_L_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Str_R_GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Drw_R_GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    procedure prc_ExecMethod( pObject: TObject; pMethod : String); // ���ν��� ȣ��� �ش� �Լ� ���� (��. �μ��� �ִ� ���ν����� ó���Ҽ� ����)
    { Public declarations }
  end;

var
  F_MDI: TF_MDI;

type
  TExec = procedure of object; // ���ν��� ������ ������Ʈ ����


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
// ��� ���� ���( �ؽ�Ʈ ���̸�ŭ Width������� ���� )  
  Str_L_Grid.Canvas.TextOut( (Rect.Left+Rect.Right-lValWidth) div 2, Rect.Top+5, '������');
end;

procedure TF_MDI.Str_R_GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//
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
  Drw_L_Grid.Canvas.TextOut( ((Rect.Left + Rect.Right) - Rect.Left) div 2, Rect.Top+5, '�󸶹�');
end;

procedure TF_MDI.Drw_R_GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//
end;

procedure TF_MDI.FormActivate(Sender: TObject);
begin
  ShowMessage('Form Activate');
end;

procedure TF_MDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('Form Close');
  Action := caFree;  // Action := caFree �� �ϴ¼��� Close�� �Բ� Destroy�� ���� �߻�
end;

procedure TF_MDI.FormCreate(Sender: TObject);
begin
  ShowMessage('Form Create');
end;

procedure TF_MDI.FormDestroy(Sender: TObject);
begin
  ShowMessage('Form Destroy');
end;

procedure TF_MDI.FormShow(Sender: TObject);
begin
  ShowMessage('Form Show');
end;

procedure TF_MDI.prc_ExecMethod( pObject: TObject; pMethod : String);
var
  Routine : TMethod;
  Exec: TExec;  // procedure ����
begin

  Routine.Data := Pointer(pObject) ;
  Routine.Code := pObject.MethodAddress(pMethod) ;
  
  if NOT Assigned(Routine.Code) then
    Exit;

  Exec := TExec(Routine) ;
  Exec;
end;

end.
