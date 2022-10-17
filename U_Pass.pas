unit U_Pass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel,
  StdCtrls, cxButtons, U_Class;

type
  TF_Pass = class(TForm)
    cxBtn_Valid_Check: TcxButton;
    cxLbl_Caption: TcxLabel;
    cxTextEdt_Input: TcxTextEdit;
    cxLbl_Result_Message: TcxLabel;
    procedure cxBtn_Valid_CheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    gRslt_Code : TErr;
    { Public declarations }
  end;

var
  F_Pass: TF_Pass;

implementation

{$R *.dfm}

procedure TF_Pass.cxBtn_Valid_CheckClick(Sender: TObject);
type
  TFunc = function(pStr : String; var vRslt : TErr):Boolean; stdcall;
var
  H              : THandle;
  Func_DLL_Valid : TFunc;
begin
   (*
   DLL ���ο� �ִ� function or procedure�� ȣ���Ͽ� �����ϴ� ���
   *)

   // DLL�� ȣ���Ѵ�.
   H := LoadLibrary('Lib_Valid.dll');

   if H < 32 then
   begin
     cxLbl_Result_Message.Caption := 'Lib_Valid.dll�� ã�� �� �����ϴ�.';
     Exit;
   end
   else
   begin
     cxLbl_Result_Message.Caption := 'Lib_Valid.dll�� �ε��Ͽ����ϴ�.';
   end;

   @Func_DLL_Valid := GetProcAddress(H, 'func_Valid_Password');

   // DLL���ο� �ش� �Լ��� �����ϴ��� Ȯ��.
   if not (@Func_DLL_Valid = nil) then
   begin
     // DLL���ο� �ִ� �Լ��� ȣ���Ѵ�.
     Func_DLL_Valid(cxTextEdt_Input.Text, gRslt_Code);
     cxLbl_Result_Message.Caption := func_GetErrMessage(gRslt_Code);
   end
   else
   begin
     cxTextEdt_Input.Clear;
     cxLbl_Result_Message.Caption := 'Function �ε忡 �����Ͽ����ϴ�.';
     Exit;
   end;

   FreeLibrary(H);
end;

end.
