unit U_MDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, U_Class;

type
  TF_MDI = class(TForm)
    ////////////////////////////////////////////////////////////////////////////
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure prc_ExecMethod( pObject: TObject; pMethod : String); // ���ν��� ȣ��� �ش� �Լ� ���� (��. �μ��� �ִ� ���ν����� ó���Ҽ� ����)
    { Public declarations }
  end;

var
  F_MDI: TF_MDI;

type
  TExec = procedure of object; // ���ν��� ������ ������Ʈ ����


implementation

{$R *.dfm}

{ TF_MDI }

procedure TF_MDI.FormActivate(Sender: TObject);
begin
  ShowMessage('Form Activate');
end;

procedure TF_MDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('Form Close');
  Action := caFree;  // Action := caFree �� �ϴ¼��� Close�� �Բ� Destroy�� ���� �߻�
end;

procedure TF_MDI.FormCreate(Sender: TObject);
begin
  ShowMessage('Form Create');
end;

procedure TF_MDI.FormDestroy(Sender: TObject);
begin
  ShowMessage('Form Destroy');
end;

procedure TF_MDI.FormShow(Sender: TObject);
begin
  ShowMessage('Form Show');
end;

procedure TF_MDI.prc_ExecMethod( pObject: TObject; pMethod : String);
var
  Routine : TMethod;
  Exec: TExec;  // procedure ����
begin

  Routine.Data := Pointer(pObject) ;
  Routine.Code := pObject.MethodAddress(pMethod) ;
  
  if NOT Assigned(Routine.Code) then
    Exit;

  Exec := TExec(Routine) ;
  Exec;
end;

end.
