unit U_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, U_Class;

type
  TF_Main = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    procedure prcSetChidForm( MFormCnt: Integer );
  public
    { Public declarations }
    FNewDefWndProc: Pointer;
    FOldDefWndProc: Pointer;
    // MainForm ��ü�� Scroll Bar�� ���ֱ�
    procedure prcClinetWndProc(var Message: TMessage);
  end;

var
  F_Main: TF_Main;

implementation

{$R *.dfm}

procedure TF_Main.FormCreate(Sender: TObject);
begin
//
// �������� Form��ü�� �����Ͽ� �������� ����� ����.
// ���� : ���� ����ٸ� MDIChild �Ӽ��� ȭ���� ������ ����
//        DB���� ��ȸ �Ǵ� ���� �ٸ� ȭ���� Grid���� �̺�Ʈ�� �߻��� ���ȭ�鿡 ����ȭ ó��.
//
  FNewDefWndProc:= MakeObjectInstance(prcClinetWndProc);
  FOldDefWndProc:= Pointer(SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FNewDefWndProc)));
// �������� �Լ� ȣ��
  prcSetChidForm(2);
end;

procedure TF_Main.FormDestroy(Sender: TObject);
begin
  SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FOldDefWndProc));
  FreeObjectInstance(FNewDefWndProc);
end;

procedure TF_Main.prcClinetWndProc(var Message: TMessage);
var
  ABoolean: Boolean;
begin
//
  ABoolean := True;
  case Message.Msg of
    WN_SCROLLBAR : ABoolean := False;
  end;

  if ABoolean then
    with Message do
      Result := CallWindowProc( FOldDefWndProc, ClientHandle, Msg, WParam, LParam);

end;

procedure TF_Main.prcSetChidForm(MFormCnt: Integer);
var
  AChildForm: TCustForm;
  ACnt: Integer;
begin
// ������ ȭ�鰹���� ������ Exit
  if MFormCnt = 0 then Exit;

  try
    // Form�� ���������� ������ �ƴ� �ѹ��� ����â�� ����â ����ȭ�鿡 ��� ����� �ʿ�
    for ACnt := 1 to MFormCnt do
    begin
      AChildForm := TCustForm.CreateNew(nil);
      AChildForm.ShowModal;
    end;
  finally
    AChildForm.Free;
  end;

end;

end.
