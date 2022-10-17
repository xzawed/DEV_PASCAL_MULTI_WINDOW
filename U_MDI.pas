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
    procedure prc_ExecMethod( pObject: TObject; pMethod : String); // 프로시저 호출로 해당 함수 실행 (단. 인수가 있는 프로시저는 처리할수 없음)
    { Public declarations }
  end;

var
  F_MDI: TF_MDI;

type
  TExec = procedure of object; // 프로시저 형식의 오브젝트 생성


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
  Action := caFree;  // Action := caFree 를 하는순간 Close와 함께 Destroy도 같이 발생
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
  Exec: TExec;  // procedure 실행
begin

  Routine.Data := Pointer(pObject) ;
  Routine.Code := pObject.MethodAddress(pMethod) ;
  
  if NOT Assigned(Routine.Code) then
    Exit;

  Exec := TExec(Routine) ;
  Exec;
end;

end.
