unit uInit;

interface

uses
  Forms, Windows, Messages, SysUtils, ExtCtrls, ORSystem;

type
{$IFDEF GroupEncounter}
  TCPRSTimeoutTimerCondition = function: boolean;
  TCPRSTimeoutTimerAction = procedure;
{$ELSE}
  TCPRSTimeoutTimerCondition = function: boolean of object;
  TCPRSTimeoutTimerAction = procedure of object;
{$ENDIF}

procedure AutoUpdateCheck;

procedure InitTimeOut(AUserCondition: TCPRSTimeoutTimerCondition;
                      AUserAction: TCPRSTimeoutTimerAction);
procedure UpdateTimeOutInterval(NewTime: Cardinal);
function TimedOut: boolean;
procedure ShutDownTimeOut;
procedure SuspendTimeout;
procedure ResumeTimeout;

implementation

uses
  fTimeout;
  
type
  TCPRSTimeoutTimer = class(TTimer)
  private
    FHooked: boolean;
    FUserCondition: TCPRSTimeoutTimerCondition;
    FUserAction: TCPRSTimeoutTimerAction;
    uTimeoutInterval: Cardinal;
    uTimeoutKeyHandle, uTimeoutMouseHandle: HHOOK;
  protected
    procedure ResetTimeout;
    procedure timTimeoutTimer(Sender: TObject);
  end;

var
  timTimeout: TCPRSTimeoutTimer = nil;
  FTimedOut: boolean = FALSE;
  uSuspended: boolean = False;

function TimeoutKeyHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; StdCall; forward;
function TimeoutMouseHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; StdCall; forward;
  
procedure AutoUpdateCheck;
const
{$IFDEF GroupEncounter}
  AppHelpFile = 'CPRSGE';
{$ELSE}
  AppHelpFile = 'CPRS';
  WhatsThisHelpFile = 'CPRSWT';
{$ENDIF}
var
  x, CPRSUpdate :string;

begin
  CPRSUpdate := RegReadStr(CPRS_REG_GOLD) + 'CPRSUpdate.exe';
  if not FileExists(CPRSUpdate) then CPRSUpdate := 'CPRSUpdate.exe';
  x := FullToPathPart(Application.ExeName) + AppHelpFile + '.HLP';
  if AppOutOfDate(x) and FileExists(CPRSUpdate) then RunProgram(CPRSUpdate + ' XFER="' + x + '"');
  x := FullToPathPart(Application.ExeName) + AppHelpFile + '.CNT';
  if AppOutOfDate(x) and FileExists(CPRSUpdate) then RunProgram(CPRSUpdate + ' XFER="' + x + '"');
  x := FullToPathPart(Application.ExeName) + WhatsThisHelpFile + '.HLP';
  if AppOutOfDate(x) and FileExists(CPRSUpdate) then RunProgram(CPRSUpdate + ' XFER="' + x + '"');
  x := FullToPathPart(Application.ExeName) + WhatsThisHelpFile + '.CNT';
  if AppOutOfDate(x) and FileExists(CPRSUpdate) then RunProgram(CPRSUpdate + ' XFER="' + x + '"');
  // Moved to CPRSUpdate.EXE in early test version of v27.  This code removed for CPRS v27.27.
  //x := FullToPathPart(Application.ExeName) + 'BORLNDMM.DLL';
  //if AppOutOfDate(x) and FileExists(CPRSUpdate) then RunProgram(CPRSUpdate + ' XFER="' + x + '"');
end;

{** Timeout Functions **}

function TimeoutKeyHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT;
{ this is called for every keyboard event that occurs while running CPRS }
begin
  if lParam shr 31 = 1 then timTimeout.ResetTimeout;                          // on KeyUp only
  Result := CallNextHookEx(timTimeout.uTimeoutKeyHandle, Code, wParam, lParam);
end;

function TimeoutMouseHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT;
{ this is called for every mouse event that occurs while running CPRS }
begin
  if (Code >= 0) and (wParam > WM_MOUSEFIRST) and (wParam <= WM_MOUSELAST)
    then timTimeout.ResetTimeout;                                             // all click events
  Result := CallNextHookEx(timTimeout.uTimeoutMouseHandle, Code, wParam, lParam);
end;

procedure InitTimeOut(AUserCondition: TCPRSTimeoutTimerCondition;
                      AUserAction: TCPRSTimeoutTimerAction);
begin
  if(not assigned(timTimeout)) then
  begin
    timTimeOut := TCPRSTimeoutTimer.Create(Application);
    with timTimeOut do
    begin
      OnTimer := timTimeoutTimer;
      FUserCondition := AUserCondition;
      FUserAction := AUserAction;
      uTimeoutInterval    := 120000;  // initially 2 minutes, will get DTIME after signon
      uTimeoutKeyHandle   := SetWindowsHookEx(WH_KEYBOARD, TimeoutKeyHook,   0, GetCurrentThreadID);
      uTimeoutMouseHandle := SetWindowsHookEx(WH_MOUSE,    TimeoutMouseHook, 0, GetCurrentThreadID);
      FHooked := TRUE;
      Interval := uTimeoutInterval;
      Enabled  := True;
    end;
  end;
end;

procedure UpdateTimeOutInterval(NewTime: Cardinal);
begin
  if(assigned(timTimeout)) then
  begin
    with timTimeout do
    begin
      uTimeoutInterval := NewTime;
      Interval := uTimeoutInterval;
      Enabled  := True;
    end;
  end;
end;

function TimedOut: boolean;
begin
  Result := FTimedOut;
end;

procedure ShutDownTimeOut;
begin
  if(assigned(timTimeout)) then
  begin
    with timTimeout do
    begin
      Enabled := False;
      if(FHooked) then
      begin
        UnhookWindowsHookEx(uTimeoutKeyHandle);
        UnhookWindowsHookEx(uTimeoutMouseHandle);
        FHooked := FALSE;
      end;
    end;
    timTimeout.Free;
    timTimeout := nil;
  end;
end;

{ TCPRSTimeoutTime }

procedure TCPRSTimeoutTimer.ResetTimeout;
{ this restarts the timer whenever there is a keyboard or mouse event }
begin
  Enabled  := False;
  Interval := uTimeoutInterval;
  Enabled  := True;
end;

procedure TCPRSTimeoutTimer.timTimeoutTimer(Sender: TObject);
{ when the timer expires, the application is closed after warning the user }
begin
  if uSuspended then
  begin
    ResetTimeout;
    exit;
  end;
  Enabled := False;
  if(assigned(FUserCondition)) then
    FTimedOut := FUserCondition or AllowTimeout
  else
    FTimedOut := AllowTimeout;
  if FTimedOut then
  begin
    if(assigned(FUserAction)) then FUserAction;
  end
  else
    Enabled := True;
end;

procedure SuspendTimeout;
begin
  uSuspended := True;
end;

procedure ResumeTimeout;
begin
  if assigned(timTimeout) then
    timTimeout.ResetTimeout;
  uSuspended := False;
end;

initialization

finalization
  ShutDownTimeOut;

end.
