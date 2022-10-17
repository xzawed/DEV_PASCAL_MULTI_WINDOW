library Lib_Valid;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Valid in 'Valid.pas',
  pcre in 'pcre.pas',
  PerlRegEx in 'PerlRegEx.pas',
  U_Class in '..\Lib_Unit\U_Class.pas';

{$R *.res}

exports
  func_Valid_Password index 1;


begin
end.
