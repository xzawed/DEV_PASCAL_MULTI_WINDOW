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

end.
