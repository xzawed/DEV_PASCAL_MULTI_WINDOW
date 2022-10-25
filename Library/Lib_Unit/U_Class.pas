unit U_Class;

interface

uses Forms, Windows, Classes, Grids, Dialogs;

  // Form의 용도에 따라 각각 상황에 맞는 동적 셋팅을 처리.
  type
    TFormType = (fmNormal, fmPop); // 일반, 팝업
    TFormScreen = (fscCustom, fscFullScreen, fscMinimalize, fscHidden); // 사용자지정, 전체화면, 최소화, Hidden

  type
    TCustForm = class(TForm)

    private
      { private declarations }
    protected
      { protected declarations }
      function Getxpos : integer;
      function Setxpos( pXpos : integer) : integer;
      function Getypos : integer;
      function Setypos( pYpos : integer) : integer;
    public
      { public declarations }
      property xpos : Left read Getxpos write Setxpos; // Left를 상속
      property ypos : Top read Getypos write Setypos;  // Top을 상속
      procedure prcSetForm( FormType:TFormType; pFormScreen:TFormScreen);
    published
      { published declarations }
  end;
////////////////////////////////////////////////////////////////////////////////
///
(*
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
    40: Result := 'Script내용은 사용 할 수 없습니다.';
*)
  type
    TErr = (
           tpNormal     = 0
         , tpErrLength  = 10
         , tpErrSpcChar = 20
         , tpErrUpChar  = 21
         , tpErrLowChar = 22
         , tpErrNum     = 23
         , tpErrConNum  = 30
         , tpErrScript  = 40
         , tpErrExcept  = 99
           );

  function func_GetErrMessage(pErrType : TErr): string;

implementation

function func_GetErrMessage(pErrType : TErr): string;
begin
  case pErrType of
    tpNormal    : Result := '정상적인 입력내용입니다.';
    tpErrLength : Result := '10자 이상 입력해주세요.';
    tpErrSpcChar: Result := '특수문자 내용이 없습니다.';
    tpErrUpChar : Result := '대문자가 없습니다.';
    tpErrLowChar: Result := '소문자가 없습니다.';
    tpErrNum    : Result := '숫자가 없습니다.';
    tpErrConNum : Result := '연속된 숫자가 있습니다.';
    tpErrScript : Result := 'Script내용은 사용 할 수 없습니다.';
    else
                  Result := '검증하는 과정중에 에러가 발생했습니다.';
  end;
end;

{ TCustForm }

function TCustForm.Setxpos( pXpos : integer): integer;
begin
//
  Result := pXpos;
end;

function TCustForm.Setypos( pYpos : integer): integer;
begin
//
  Result := pYpos;
end;

function TCustForm.Getxpos: integer;
begin
//
  Result := xpos;
end;

function TCustForm.Getypos: integer;
begin
//
  Result := ypos;
end;

procedure TCustForm.prcSetForm(FormType: TFormType; pFormScreen: TFormScreen);
begin
// Param Value를 토대로 Form의 화면을 셋팅한다.
end;


end.
