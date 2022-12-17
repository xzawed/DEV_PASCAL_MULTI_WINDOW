unit U_Class;

interface

uses Forms, Windows, Classes, Grids, Dialogs, SysUtils, DateUtils;

  // Form�� �뵵�� ���� ���� ��Ȳ�� �´� ���� ������ ó��.
  type
    TFormType = (fmNormal, fmPop); // �Ϲ�, �˾�
    TFormScreen = (fscCustom, fscFullScreen, fscMinimalize, fscHidden); // ���������, ��üȭ��, �ּ�ȭ, Hidden

  type
    TCustForm = class(TForm)

    private
      { private declarations }
    protected
      { protected declarations }
    public
      { public declarations }
      constructor Create(AOwner: TComponent); override;
      constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;
      destructor destroy; override;
      procedure prcSetForm( FormType:TFormType; pFormScreen:TFormScreen);
    published
      { published declarations }
  end;
////////////////////////////////////////////////////////////////////////////////
///
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
  type
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

{ TCustForm }

constructor TCustForm.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TCustForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
end;

destructor TCustForm.destroy;
begin
  inherited;
end;

procedure TCustForm.prcSetForm(FormType: TFormType; pFormScreen: TFormScreen);
begin
// ���Ŀ� �̰����� �־�鼭 ������ ä������ ����
//
end;


end.
