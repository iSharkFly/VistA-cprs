unit rWVEHR;

interface

uses SysUtils, Classes, ORNet, ORFn, ORClasses;

{ record types used to return data from the RPC's.  Generally, the delimited strings returned
  by the RPC are mapped into the records defined below. }

function GetPatientLongAge(ADFN: string): string;
function GetPatientBriefAge(ADFN: string): string;

const
  PERIOD:  array[1..7] of string[1] = ('y','m','w','d','h','m','s');

implementation

function GetPatientLongAge(ADFN: string): string;
begin
  Result :=  sCallv('VWTIME LONG AGE', [ADFN]);
end;

function GetPatientBriefAge(ADFN: string): string;
var
  AgePieces, BriefAge: string;
  i: integer;
begin
  AgePieces := sCallv('VWTIME BRIEF AGE', [ADFN]);
  for i := 1 to 7 do
    if Piece(AgePieces, U, i) <> '' then
      BriefAge := BriefAge + Piece(AgePieces, U, i) + PERIOD[i]
    else
      begin
        Result := BriefAge;
        exit;
      end;
end;

end.
