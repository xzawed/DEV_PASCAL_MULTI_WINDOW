
unit Valid;

interface

uses
  SysUtils, Classes, PerlRegEx;
  //============================================================================
  // Password
  function func_Sub_Special_Bool( pStr : String ):Boolean;            // 특수문자가 포함되있는지 체크
  function func_Sub_Upper_Bool( pStr : String ):Boolean;              // 대문자가 있는지 체크
  function func_Sub_Lower_Bool( pStr : String ):Boolean;              // 소문자가 있는지 체크
  function func_Sub_Number_Bool( pStr : String ):Boolean;             // 숫자가 있는지 체크
  function func_Sub_Number_Consecutive_Bool( pStr : String ):Boolean; // 연속된 숫자가 있는지 체크

  // Password가 유효한지 확인
  function func_Valid_Password(pPassword : String; var vResultcd: Integer):Boolean; stdcall;
  //============================================================================

implementation

// 특수문자가 포함되있는지 체크
function func_Sub_Special_Bool( pStr : String ):Boolean;
var
  i : Integer;
begin
  Result := False;

  // 0 to 문자열 총길이
  for i := 0 to Length(pStr) do
  begin
    case pStr[i] of
      '0'..'9' : begin end;
      'A'..'Z' : begin end;
      'a'..'z' : begin end;
      else
      begin
        case Ord(pStr[i]) of
          8,33..126 :
          begin
            Result := True;
            break;
          end;
        end;
      end;
    end;
  end; { for i := 0 to Length(pStr) do }

end;

// 대문자가 있는지 체크
function func_Sub_Upper_Bool( pStr : String ):Boolean;
var
  regEx : TPerlRegEx;
begin
  regEx := TPerlRegEx.Create();

  try
    regEx.Options := [preSingleLine];
    regEx.Subject := UTF8String(pStr);
    regEx.RegEx := '[A-Z]';
    Result := regEx.Match();

  finally
    regEx.Free();
  end;
end;

// 소문자가 있는지 체크
function func_Sub_Lower_Bool( pStr : String ):Boolean;
var
  regEx : TPerlRegEx;
begin
  regEx := TPerlRegEx.Create();

  try
    regEx.Options := [preSingleLine];
    regEx.Subject := UTF8String(pStr);
    regEx.RegEx := '[a-z]';
    Result := regEx.Match();

  finally
    regEx.Free();
  end;
end;

// 숫자가 있는지 체크
function func_Sub_Number_Bool( pStr : String ):Boolean;
var
  regEx : TPerlRegEx;
begin
  regEx := TPerlRegEx.Create();

  try
    regEx.Options := [preSingleLine];
    regEx.Subject := UTF8String(pStr);
    regEx.RegEx := '[0-9]';
    Result := regEx.Match();

  finally
    regEx.Free();
  end;
end;

// 연속된 숫자가 있는지 체크
function func_Sub_Number_Consecutive_Bool( pStr : String ):Boolean;
var
  regEx : TPerlRegEx; // 정규식관련 Component
  i : Integer;
  iFind : string;
begin

  Result := False;
  regEx := TPerlRegEx.Create();
  try
    regEx.Options := [preSingleLine];
    regEx.Subject := UTF8String(pStr);
    regEx.RegEx := '[0-9]{3,}'; // 정규식

    if not regEx.Match() then
      Exit;

    while regEx.Match() do
    begin
      iFind := regEx.MatchedText;

      for i := 1 to (Length(regEx.MatchedText) - 2) do
      begin
        if      (StrToInt(regEx.MatchedText[i]  ) = StrToInt(regEx.MatchedText[i+1]) - 1) and
                (StrToInt(regEx.MatchedText[i+1]) = StrToInt(regEx.MatchedText[i+2]) - 1) then
        begin
          Result := True;
          Break;
        end
        else if (StrToInt(regEx.MatchedText[i]  ) - 1 = StrToInt(regEx.MatchedText[i+1])) and
                (StrToInt(regEx.MatchedText[i+1]) - 1 = StrToInt(regEx.MatchedText[i+2])) then
        begin
          Result := True;
          Break;
        end;
      end;

      regEx.Subject := UTF8String(Copy(regEx.Subject, Pos(iFind,regEx.Subject) + Length(iFind), 100));

      if (Result) or
         (regEx.Subject = '') then
        Break;
    end;

  finally
    regEx.Free();
  end;
end;

function func_Valid_Password(pPassword : String; var vResultcd: Integer):Boolean;
begin
  try
    vResultcd := 0;
    Result    := True;

    // 10자리 이하의 Password는 Ban처리
    if Length(pPassword) < 10 then
    begin
      vResultcd := 10;
      Result    := False;
    end
    else
    begin
      (*
      // 비밀번호의 생성규칙
      // 1. 문자, 숫자, 특수문자 조합 무조건 있어야함
      // 2. 연속된 숫자가 없어야함.
      // 3. 문자는 반드시 영문만 가능.
      *)
      if func_Sub_Special_Bool(pPassword) = False then
      begin
        // 특수문자 없음
        vResultcd := 20;
        Result    := False;
      end;

      if func_Sub_Upper_Bool(pPassword) = False then
      begin
        // 대문자 없음
        vResultcd := 21;
        Result    := False;
      end;

      if func_Sub_Lower_Bool(pPassword) = False then
      begin
        // 소문자 없음
        vResultcd := 22;
        Result    := False;
      end;

      if func_Sub_Number_Bool(pPassword) = False then
      begin
        // 숫자 없음
        vResultcd := 23;
        Result    := False;
      end;

      if func_Sub_Number_Consecutive_Bool(pPassword) then
      begin
        // 연속된 문자 있음
        vResultcd := 30;
        Result    := False;
      end;

    end;

  except on E:Exception do
    begin
      vResultcd := 99;
      Result    := False;
    end;
  end;
end;

end.
