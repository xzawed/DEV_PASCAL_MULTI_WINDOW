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
// �������� Form��ü�� �����Ͽ� �������� ����� ����.
// ���� : ���� ����ٸ� MDIChild �Ӽ��� ȭ���� ������ ����
//        DB���� ��ȸ �Ǵ� ���� �ٸ� ȭ���� Grid���� �̺�Ʈ�� �߻��� ���ȭ�鿡 ����ȭ ó��.
//

// �������� �Լ� ȣ��
  prcSetChidForm(2);
end;

procedure TF_Main.prcSetChidForm(MFormCnt: Integer);
var
  AChildForm: TCustForm;
  ACnt: Integer;
begin
// ������ ȭ�鰹���� ������ Exit
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
