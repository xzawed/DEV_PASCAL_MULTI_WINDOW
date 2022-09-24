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
  StdCtrls, cxButtons;

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
    gRslt_Code : Integer;
    function func_GetMessage : String; // 결과 코드값에 따른 상태 메세지 Return
    { Public declarations }
  end;

var
  F_Pass: TF_Pass;

implementation

{$R *.dfm}

procedure TF_Pass.cxBtn_Valid_CheckClick(Sender: TObject);
type
  TFunc = function(pStr : String; var vRslt : Integer):Boolean; stdcall;
var
  H              : THandle;
  Func_DLL_Valid : TFunc;
begin
   (*
   DLL 내부에 있는 function or procedure를 호출하여 검증하는 방법
   *)

   // DLL을 호출한다.
   H := LoadLibrary('Lib_Valid.dll');

   if H < 32 then
   begin
     cxLbl_Result_Message.Caption := 'Lib_Valid.dll을 찾을 수 없습니다.';
     Exit;
   end
   else
   begin
     cxLbl_Result_Message.Caption := 'Lib_Valid.dll을 로드하였습니다.';
   end;

   @Func_DLL_Valid := GetProcAddress(H, 'func_Valid_Password');

   // DLL내부에 해당 함수가 존재하는지 확인.
   if not (@Func_DLL_Valid = nil) then
   begin
     // DLL내부에 있는 함수를 호출한다.
     Func_DLL_Valid(cxTextEdt_Input.Text, gRslt_Code);
     cxLbl_Result_Message.Caption := func_GetMessage;
   end
   else
   begin
     cxTextEdt_Input.Clear;
     cxLbl_Result_Message.Caption := 'Function 로드에 실패하였습니다.';
     Exit;
   end;

   FreeLibrary(H);
end;

function TF_Pass.func_GetMessage: String;
begin
  try
    case gRslt_Code of
    0 : begin
          Result := '정상적인 입력내용입니다.';
          ModalResult := mrOk;
        end;
    10: Result := '10자 이상 입력해주세요.';
    20: Result := '특수문자 내용이 없습니다.';
    21: Result := '대문자가 없습니다.';
    22: Result := '소문자가 없습니다.';
    23: Result := '숫자가 없습니다.';
    30: Result := '연속된 숫자가 있습니다.';
    else
      Result := '검증하는 과정중에 에러가 발생했습니다.';
    end;
  except on e:Exception do
    begin
      Result := '[ERR]' + e.Message;
    end;
  end;
end;

end.
