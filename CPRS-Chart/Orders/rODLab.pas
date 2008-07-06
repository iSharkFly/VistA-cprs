unit rODLab;

interface

uses SysUtils, Classes, ORNet, ORFn, rCore, uCore, TRPCB, dialogs ;

     { Laboratory Ordering Calls }
function  ODForLab(Location: integer; Division: integer = 0): TStrings;
procedure LoadLabTestData(LoadData: TStringList; LabTestIEN: string) ;
procedure LoadSamples(LoadList: TStringList) ;
procedure LoadSpecimens(SpecimenList: TStringList) ;
function  SubsetOfSpecimens(const StartFrom: string; Direction: Integer): TStrings;
function  CalcStopDate(Text: string): string ;
function  MaxDays(Location, Schedule: integer): integer;
function  IsLabCollectTime(ADateTime: TFMDateTime; Location: integer): boolean;
function  ImmediateCollectTimes: TStrings;
function  LabCollectFutureDays(Location: integer; Division: integer = 0): integer;
function  GetDefaultImmCollTime: TFMDateTime;
function  ValidImmCollTime(CollTime: TFMDateTime): string;
function  GetOneCollSamp(LRFSAMP: integer): TStrings;
function  GetOneSpecimen(LRFSPEC: integer): string;
procedure GetLabTimesForDate(Dest: TStrings; LabDate: TFMDateTime; Location: integer);
function  GetLastCollectionTime: string;
procedure GetPatientBBInfo(Dest: TStrings; PatientID: string; Loc: integer);
procedure GetPatientBloodResults(Dest: TStrings; PatientID: string; ATests: TStringList);
procedure GetPatientBloodResultsRaw(Dest: TStrings; PatientID: string; ATests: TStringList);
function  StatAllowed(PatientID: string): boolean;
procedure GetBloodComponents(Dest: TStrings);

implementation

uses  rODBase;
(*    fODBase, rODBase, fODLab;*)

procedure GetBloodComponents(Dest: TStrings);
begin
  tCallV(Dest, 'ORWDXVB COMPORD', []);
end;

function  StatAllowed(PatientID: string): boolean;
begin
  Result := (StrToInt(sCallV('ORWDXVB STATALOW',[PatientID])) > 0);
end;

procedure GetPatientBloodResultsRaw(Dest: TStrings; PatientID: string; ATests: TStringList);
begin
  tCallV(Dest, 'ORWDXVB RAW', [PatientID, ATests]);
end;

procedure GetPatientBloodResults(Dest: TStrings; PatientID: string; ATests: TStringList);
begin
  tCallV(Dest, 'ORWDXVB RESULTS', [PatientID, ATests]);
end;

procedure GetPatientBBInfo(Dest: TStrings; PatientID: string; Loc: integer);
begin
  tCallV(Dest, 'ORWDXVB GETALL', [PatientID, Loc]);
end;

function ODForLab(Location, Division: integer): TStrings;
{ Returns init values for laboratory dialog.  The results must be used immediately. }
begin
  CallV('ORWDLR32 DEF', [Location,Division]);
  Result := RPCBrokerV.Results;
end;

procedure LoadLabTestData(LoadData: TStringList; LabTestIEN: string) ;
begin
    tCallV(LoadData, 'ORWDLR32 LOAD', [LabTestIEN]);
end ;

procedure LoadSamples(LoadList: TStringList) ;
begin
    tCallV(LoadList, 'ORWDLR32 ALLSAMP', [nil]);
end ;

function SubsetOfSpecimens(const StartFrom: string; Direction: Integer): TStrings;
begin
  Callv('ORWDLR32 ALLSPEC',[StartFrom, Direction]);
  Result := RPCBrokerV.Results;
end ;

procedure LoadSpecimens(SpecimenList: TStringList) ;
begin
  tCallV(SpecimenList, 'ORWDLR32 ABBSPEC', [nil]);
end ;

function CalcStopDate(Text: string): string ;
begin
  Result := sCallV('ORWDLR32 STOP', [Text]);
end ;

function MaxDays(Location, Schedule: integer): integer;
begin
  Result := StrToInt(sCallV('ORWDLR32 MAXDAYS',[Location, Schedule]));
end;

function IsLabCollectTime(ADateTime: TFMDateTime; Location: integer): boolean;
begin
  Result := (StrToInt(sCallV('ORWDLR32 LAB COLL TIME',[ADateTime,Location])) > 0);
end;

function  LabCollectFutureDays(Location: integer; Division: integer): integer;
begin
  Result := StrToInt(sCallV('ORWDLR33 FUTURE LAB COLLECTS',[Location, Division]));
end;

function  ImmediateCollectTimes: TStrings;
begin
  CallV('ORWDLR32 IMMED COLLECT',[nil]);
  Result := RPCBrokerV.Results;
end;

function  GetDefaultImmCollTime: TFMDateTime;
begin
  CallV('ORWDLR32 IC DEFAULT',[nil]);
  Result := StrToFloat(Piece(RPCBrokerV.Results[0], U, 1));
end;

function  ValidImmCollTime(CollTime: TFMDateTime): string;
begin
  CallV('ORWDLR32 IC VALID',[CollTime]);
  Result := RPCBrokerV.Results[0];
end;

function  GetOneCollSamp(LRFSAMP: integer): TStrings;
begin
  CallV('ORWDLR32 ONE SAMPLE', [LRFSAMP]);
  Result := RPCBrokerV.Results;
end;

function  GetOneSpecimen(LRFSPEC: integer): string;
begin
  Result := sCallV('ORWDLR32 ONE SPECIMEN', [LRFSPEC]);
end;

function  GetLastCollectionTime: string;
begin
  Result := sCallV('ORWDLR33 LASTTIME', [nil]);
end
;
procedure GetLabTimesForDate(Dest: TStrings; LabDate: TFMDateTime; Location: integer);
var
  Prefix: string;
  i: integer;
begin
  CallV('ORWDLR32 GET LAB TIMES', [LabDate, Location]);
  with Dest do
    begin
      Assign(RPCBrokerV.Results);
      if (Count > 0) and (Piece(Strings[0], U, 1) <> '-1') then
        for i := 0 to Count - 1 do
          begin
            if Strings[i] > '1159' then Prefix := 'PM Collection:  ' else Prefix := 'AM Collection:  ';
            Strings[i] := Strings[i] + U + Prefix + Copy(Strings[i], 1, 2) + ':' + Copy(Strings[i], 3, 2);
          end;
    end;
end;

end.
