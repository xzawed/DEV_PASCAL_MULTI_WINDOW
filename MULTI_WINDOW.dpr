program MULTI_WINDOW;

uses
  Forms,
  Windows,
  Controls,
  U_Main in 'U_Main.pas' {F_Main},
  U_Pass in 'U_Pass.pas' {F_Pass},
  U_MDI in 'U_MDI.pas' {F_MDI},
  U_Class in 'Library\Lib_Unit\U_Class.pas';

{$R *.res}

procedure proc_Set_MainForm(AForm: TForm);
var
  LForm: Pointer;
begin
  LForm := @Application.MainForm;

  Pointer(LForm^) := AForm;
end;

var
  PassForm: TF_Pass;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TF_Pass, F_Pass);
  //F_Pass.Show;

  // TEST를 위해 임시 주석처리.
  (*
  PassForm := TF_Pass.Create(nil);
  try
    if PassForm.ShowModal <> mrOk then
    begin
      Exit;
    end;
  finally
    PassForm.Free();
  end;
  *)

  // Main화면을 BackGround에서 실행
  Application.CreateForm(TF_Main, F_Main);
  proc_Set_MainForm(F_Main);

  // POPUP내용
  //Application.CreateForm(TF_MDI, F_MDI);
  //F_MDI.ShowModal;
  Application.Run;
end.
