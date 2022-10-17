unit U_Class;

interface

uses Forms, Windows, Classes, Grids, Dialogs;

////////////////////////////////////////////////////////////////////////////////
// Grid 관련
  type TCGrid = class(TObject)
    private
      {지역}
      DefaultDrawing : Boolean;
      procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
        AState: TGridDrawState);
    public
      {전역}
      constructor Create(pOwner:TComponent);
      destructor Destroy;
  end;

  // Grid 위치
  TGridLoc = record
    X: Longint;
    Y: Longint;
  end;

  // Grid 면적
  TGridArea = record
    case Integer of
      0: (Left, Top, Right, Bottom: Longint);
      1: (TopLeft, BottomRight: TGridCoord);
  end;
////////////////////////////////////////////////////////////////////////////////
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

{ TCGrid }

constructor TCGrid.Create(pOwner:TComponent);
begin
//
  Create(pOwner);

  DefaultDrawing := False;
end;

destructor TCGrid.Destroy;
begin
//
  inherited Destroy;
end;


procedure TCGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
// 사용자 정의 함수나 이벤트를 호출한 이후 진행
end;


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

end.
