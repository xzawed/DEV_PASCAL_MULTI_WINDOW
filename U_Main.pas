unit U_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, U_Class;

type
  TF_Main = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure prcSetChidForm( MFormCnt: Integer );
  public
    { Public declarations }
  end;

var
  F_Main: TF_Main;

implementation

{$R *.dfm}

procedure TF_Main.FormCreate(Sender: TObject);
begin
//
// 동적으로 Form객체를 생성하여 다중으로 띄워볼 예정.
// 개요 : 서로 각기다른 MDIChild 속성의 화면을 생성한 이후
//        DB에서 조회 또는 각기 다른 화면의 Grid에서 이벤트가 발생시 모든화면에 동기화 처리.
//

// 동적생성 함수 호출
  prcSetChidForm(2);
end;

procedure TF_Main.prcSetChidForm(MFormCnt: Integer);
var
  AChildForm: TCustForm;
  ACnt: Integer;
begin
// 생성할 화면갯수가 없으면 Exit
  if MFormCnt = 0 then Exit;

  try
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
