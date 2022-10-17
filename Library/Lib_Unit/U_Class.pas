unit U_Class;

interface

uses Forms, Windows, Classes, Grids, Dialogs;

////////////////////////////////////////////////////////////////////////////////
// Grid ����
  type TCGrid = class(TObject)
    private
      {����}
      DefaultDrawing : Boolean;
      procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
        AState: TGridDrawState);
    public
      {����}
      constructor Create(pOwner:TComponent);
      destructor Destroy;
  end;

  // Grid ��ġ
  TGridLoc = record
    X: Longint;
    Y: Longint;
  end;

  // Grid ����
  TGridArea = record
    case Integer of
      0: (Left, Top, Right, Bottom: Longint);
      1: (TopLeft, BottomRight: TGridCoord);
  end;
////////////////////////////////////////////////////////////////////////////////
(*
    0 : begin
          Result := '�������� �Է³����Դϴ�.';
          ModalResult := mrOk;
        end;
    10: Result := '10�� �̻� �Է����ּ���.';
    20: Result := 'Ư������ ������ �����ϴ�.';
    21: Result := '�빮�ڰ� �����ϴ�.';
    22: Result := '�ҹ��ڰ� �����ϴ�.';
    23: Result := '���ڰ� �����ϴ�.';
    30: Result := '���ӵ� ���ڰ� �ֽ��ϴ�.';
    40: Result := 'Script������ ��� �� �� �����ϴ�.';
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
// ����� ���� �Լ��� �̺�Ʈ�� ȣ���� ���� ����
end;


function func_GetErrMessage(pErrType : TErr): string;
begin
  case pErrType of
    tpNormal    : Result := '�������� �Է³����Դϴ�.';
    tpErrLength : Result := '10�� �̻� �Է����ּ���.';
    tpErrSpcChar: Result := 'Ư������ ������ �����ϴ�.';
    tpErrUpChar : Result := '�빮�ڰ� �����ϴ�.';
    tpErrLowChar: Result := '�ҹ��ڰ� �����ϴ�.';
    tpErrNum    : Result := '���ڰ� �����ϴ�.';
    tpErrConNum : Result := '���ӵ� ���ڰ� �ֽ��ϴ�.';
    tpErrScript : Result := 'Script������ ��� �� �� �����ϴ�.';
    else
                  Result := '�����ϴ� �����߿� ������ �߻��߽��ϴ�.';
  end;
end;

end.
