unit U_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls;

type
  TF_Main = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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

end;

end.
