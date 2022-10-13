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

end.
