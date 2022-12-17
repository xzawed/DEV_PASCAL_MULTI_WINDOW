unit U_Class;

interface

uses Forms, Windows, Classes, Grids, Dialogs, SysUtils, DateUtils;

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
    public
      { public declarations }
      constructor Create(AOwner: TComponent); override;
      constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;
      destructor destroy; override;
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

constructor TCustForm.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TCustForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
end;

destructor TCustForm.destroy;
begin
  inherited;
end;

procedure TCustForm.prcSetForm(FormType: TFormType; pFormScreen: TFormScreen);
begin
// 추후에 이것저것 넣어가면서 내용을 채워넣을 예정
//
end;


end.
