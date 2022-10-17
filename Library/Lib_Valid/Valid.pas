
unit Valid;

interface

uses
  SysUtils, Classes, U_Class, PerlRegEx;
  //============================================================================
  // Password
  function func_Sub_Special_Bool( pStr : String ):Boolean;            // Ư�����ڰ� ���Ե��ִ��� üũ
  function func_Sub_Upper_Bool( pStr : String ):Boolean;              // �빮�ڰ� �ִ��� üũ
  function func_Sub_Lower_Bool( pStr : String ):Boolean;              // �ҹ��ڰ� �ִ��� üũ
  function func_Sub_Number_Bool( pStr : String ):Boolean;             // ���ڰ� �ִ��� üũ
  function func_Sub_Number_Consecutive_Bool( pStr : String ):Boolean; // ���ӵ� ���ڰ� �ִ��� üũ
  function func_Sub_Script_Lang_Bool( pStr : String ):Boolean;        // Script ������ �ִ��� üũ

  // Password�� ��ȿ���� Ȯ��
  function func_Valid_Password(pPassword : String; var vResultcd: TErr):Boolean; stdcall;
  //============================================================================

implementation

// Ư�����ڰ� ���Ե��ִ��� üũ
function func_Sub_Special_Bool( pStr : String ):Boolean;
var
  i : Integer;
begin
  Result := False;

  // 0 to ���ڿ� �ѱ���
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

// �빮�ڰ� �ִ��� üũ
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

// �ҹ��ڰ� �ִ��� üũ
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

// ���ڰ� �ִ��� üũ
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

// ���ӵ� ���ڰ� �ִ��� üũ
function func_Sub_Number_Consecutive_Bool( pStr : String ):Boolean;
var
  regEx : TPerlRegEx; // ���Խİ��� Component
  i : Integer;
  iFind : string;
begin

  Result := False;
  regEx := TPerlRegEx.Create();
  try
    regEx.Options := [preSingleLine];
    regEx.Subject := UTF8String(pStr);
    regEx.RegEx := '[0-9]{3,}'; // ���Խ�

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

// Script ������ �ִ��� üũ
function func_Sub_Script_Lang_Bool( pStr : String ):Boolean;
begin
  // ������� �ش系�뿡 ���� ���� Guide�� ���� ����..
  Result := False;
end;

function func_Valid_Password(pPassword : String; var vResultcd: TErr):Boolean;
begin
  try
    vResultcd := tpNormal;
    Result    := True;

    // 10�ڸ� ������ Password�� Banó��
    if Length(pPassword) < 10 then
    begin
      vResultcd := tpErrLength;
      Result    := False;
    end
    else
    begin
      (*
      // ��й�ȣ�� ������Ģ
      // 1. ����, ����, Ư������ ���� ������ �־����
      // 2. ���ӵ� ���ڰ� �������.
      // 3. ���ڴ� �ݵ�� ������ ����.
      // 4. Script ������ �ش�Ǵ� ������ �Ұ���.
      *)
      if func_Sub_Special_Bool(pPassword) = False then
      begin
        // Ư������ ����
        vResultcd := tpErrSpcChar;
        Result    := False;
      end;

      if func_Sub_Upper_Bool(pPassword) = False then
      begin
        // �빮�� ����
        vResultcd := tpErrUpChar;
        Result    := False;
      end;

      if func_Sub_Lower_Bool(pPassword) = False then
      begin
        // �ҹ��� ����
        vResultcd := tpErrLowChar;
        Result    := False;
      end;

      if func_Sub_Number_Bool(pPassword) = False then
      begin
        // ���� ����
        vResultcd := tpErrNum;
        Result    := False;
      end;

      if func_Sub_Number_Consecutive_Bool(pPassword) then
      begin
        // ���ӵ� ���� ����
        vResultcd := tpErrConNum;
        Result    := False;
      end;

      if func_Sub_Script_Lang_Bool(pPassword) then
      begin
        // Script ������ ����
        vResultcd := tpErrScript;
        Result    := False;
      end;
    end;

  except on E:Exception do
    begin
      vResultcd := tpErrExcept;
      Result    := False;
    end;
  end;
end;

end.
