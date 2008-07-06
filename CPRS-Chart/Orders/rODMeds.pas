unit rODMeds;

interface

uses SysUtils, Classes, ORNet, ORFn, uCore, uConst;

function DEACheckFailed(AnOI: Integer; ForInpatient: Boolean): Boolean;
function DEACheckFailedForIVOnOutPatient(AnOI: Integer; AnOIType: Char): boolean;
procedure ListForOrderable(var AListIEN, ACount: Integer; const DGrpNm: string);
procedure SubsetOfOrderable(Dest: TStringList; Append: Boolean; ListIEN, First, Last: Integer);
function IndexOfOrderable(ListIEN: Integer; From: string): Integer;
procedure IsActivateOI(var AMsg: string; theOI: integer);
procedure ListForQuickOrders(var AListIEN, ACount: Integer; const DGrpNm: string);
procedure SubsetOfQuickOrders(Dest: TStringList; AListIEN, First, Last: Integer);
function IndexOfQuickOrder(AListIEN: Integer; From: string): Integer;
procedure LoadFormularyAltOI(AList: TStringList; AnIEN: Integer; ForInpatient: Boolean);
procedure LoadFormularyAltDose(AList: TStringList; DispDrug, OI: Integer; ForInpatient: Boolean);
procedure LoadAdminInfo(const Schedule: string; OrdItem: Integer; var StartText: string;
  var AdminTime: TFMDateTime; var Duration: string);
function GetAdminTime(const StartText, Schedule: string; OrdItem: Integer): TFMDateTime;
procedure LoadSchedules(Dest: TStrings; IsInptDlg: boolean = False);
function QtyToDays(Quantity: Double;   const UnitsPerDose, Schedule, Duration, Drug: string): Integer;
function DaysToQty(DaysSupply: Integer; const UnitsPerDose, Schedule, Duration, Drug: string): Integer;
function DurToQty(DaysSupply: Integer; const UnitStr, SchedStr: string): Integer;
function DefaultDays(const ADrug, UnitStr, SchedStr: string): Integer;
function CalcMaxRefills(const Drug: string; Days, OrdItem: Integer; Discharge: Boolean): Integer;
function ScheduleRequired(OrdItem: Integer; const ARoute, ADrug: string): Boolean;
function ODForMedsIn: TStrings;
function ODForMedsOut: TStrings;
function OIForMed(AnIEN: Integer; ForInpatient: Boolean; HavePI: boolean = True; PKIActive: Boolean = False): TStrings;
function GetPickupForLocation(const Loc: string): string;
function QOHasRouteDefined(AQOID: integer): boolean;
procedure CheckExistingPI(AOrderId: string; var APtI: string);

implementation

function DEACheckFailed(AnOI: Integer; ForInpatient: Boolean): Boolean;
var
  PtType: Char;
begin
  if ForInpatient then PtType := 'I' else PtType := 'O';
  Result := sCallV('ORWDPS1 FAILDEA', [AnOI, Encounter.Provider, PtType]) = '1';
end;

function DEACheckFailedForIVOnOutPatient(AnOI: Integer; AnOIType: Char): boolean;
begin
  Result := sCallV('ORWDPS1 IVDEA',[AnOI,AnOIType,Encounter.Provider]) = '1';
end;

procedure ListForOrderable(var AListIEN, ACount: Integer; const DGrpNm: string);
begin
  CallV('ORWUL FV4DG', [DGrpNm]);
  AListIEN := StrToIntDef(Piece(RPCBrokerV.Results[0], U, 1), 0);
  ACount   := StrToIntDef(Piece(RPCBrokerV.Results[0], U, 2), 0);
end;

procedure SubsetOfOrderable(Dest: TStringList; Append: Boolean; ListIEN, First, Last: Integer);
var
  i: Integer;
begin
  CallV('ORWUL FVSUB', [ListIEN, First+1, Last+1]);  // M side not 0-based
  if Append then Dest.AddStrings(RPCBrokerV.Results) else
  begin
    for i := Pred(RPCBrokerV.Results.Count) downto 0 do Dest.Insert(0, RPCBrokerV.Results[i]);
  end;
end;

function IndexOfOrderable(ListIEN: Integer; From: string): Integer;
var
  x: string;
begin
  Result := -1;
  if From = '' then Exit;
  // decrement last char & concat '~' for $ORDER on M side, limit string length
  x := UpperCase(Copy(From, 1, 220));
  x := Copy(x, 1, Length(x) - 1) + Pred(x[Length(x)]) + '~';
  x := sCallV('ORWUL FVIDX', [ListIEN, x]);
  // use Pred to make the index 0-based (first value = 1 on M side)
  if CompareText(Copy(Piece(x, U, 2), 1, Length(From)), From) = 0
    then Result := Pred(StrToIntDef(Piece(x, U, 1), 0));
end;

procedure IsActivateOI(var AMsg: string; theOI: integer);
begin
  AMsg := SCallV('ORWDXA ISACTOI', [theOI]);
end;

procedure ListForQuickOrders(var AListIEN, ACount: Integer; const DGrpNm: string);
begin
  CallV('ORWUL QV4DG', [DGrpNm]);
  AListIEN := StrToIntDef(Piece(RPCBrokerV.Results[0], U, 1), 0);
  ACount   := StrToIntDef(Piece(RPCBrokerV.Results[0], U, 2), 0);
end;

procedure SubsetOfQuickOrders(Dest: TStringList; AListIEN, First, Last: Integer);
var
  i: Integer;
begin
 CallV('ORWUL QVSUB', [AListIEN,'','']);
 for i := 0 to RPCBrokerV.Results.Count -1 do
   Dest.Add(RPCBrokerV.Results[i]);
end;

function IndexOfQuickOrder(AListIEN: Integer; From: string): Integer;
var
  x: string;
begin
  Result := -1;
  if From = '' then Exit;
  // decrement last char & concat '~' for $ORDER on M side, limit string length
  x := UpperCase(Copy(From, 1, 220));
  x := Copy(x, 1, Length(x) - 1) + Pred(x[Length(x)]) + '~';
  x := sCallV('ORWUL QVIDX', [AListIEN, x]);
  // use Pred to made the index 0-based (first value = 1 on M side)
  if CompareText(Copy(Piece(x, U, 2), 1, Length(From)), From) = 0
    then Result := Pred(StrToIntDef(Piece(x, U, 1), 0));
end;

procedure LoadFormularyAltOI(AList: TStringList; AnIEN: Integer; ForInpatient: Boolean);
var
  PtType: Char;
begin
  if ForInpatient then PtType := 'I' else PtType := 'O';
  CallV('ORWDPS1 FORMALT', [AnIEN, PtType]);
  AList.Assign(RPCBrokerV.Results);
end;

procedure LoadFormularyAltDose(AList: TStringList; DispDrug, OI: Integer; ForInpatient: Boolean);
var
  PtType: Char;
begin
  if ForInpatient then PtType := 'I' else PtType := 'O';
  CallV('ORWDPS1 DOSEALT', [DispDrug, OI, PtType]);
  AList.Assign(RPCBrokerV.Results);
end;

procedure LoadAdminInfo(const Schedule: string; OrdItem: Integer; var StartText: string;
  var AdminTime: TFMDateTime; var Duration: string);
var
  x: string;
begin
  x := sCallV('ORWDPS2 ADMIN', [Patient.DFN, Schedule, OrdItem, Encounter.Location]);
  StartText := Piece(x, U, 1);
  AdminTime := MakeFMDateTime(Piece(x, U, 4));
  Duration  := Piece(x, U, 3);
end;

function GetAdminTime(const StartText, Schedule: string; OrdItem: Integer): TFMDateTime;
var
  x: string;
begin
  x := sCallV('ORWDPS2 REQST', [Patient.DFN, Schedule, OrdItem, Encounter.Location, StartText]);
  Result := MakeFMDateTime(x);
end;

procedure LoadSchedules(Dest: TStrings; IsInptDlg: boolean);
begin
  // if uMedSchedules = nil then CallV('ORWDPS ALLSCHD', [nil]); uMedSchedules.Assign(...);
  CallV('ORWDPS1 SCHALL', [nil]);
  Dest.Assign(RPCBrokerV.Results);
  If (Dest.IndexOfName('OTHER') < 0) and IsInptDlg then
    Dest.Add('OTHER');
end;

function QtyToDays(Quantity: Double;   const UnitsPerDose, Schedule, Duration, Drug: string): Integer;
begin
  Result := StrToIntDef(sCallV('ORWDPS2 QTY2DAY',
    [Quantity,   UnitsPerDose, Schedule, Duration, Patient.DFN, Drug]), 0);
end;

function DaysToQty(DaysSupply: Integer; const UnitsPerDose, Schedule, Duration, Drug: string): Integer;
begin
  Result := StrToIntDef(sCallV('ORWDPS2 DAY2QTY',
    [DaysSupply, UnitsPerDose, Schedule, Duration, Patient.DFN, Drug]), 0);
end;

function DurToQty(DaysSupply: Integer; const UnitStr, SchedStr: string): Integer;
begin
  Result := StrToIntDef(sCallV('ORWDPS2 DAY2QTY', [DaysSupply, UnitStr, SchedStr]), 0);
end;

function DefaultDays(const ADrug, UnitStr, SchedStr: string): Integer;
begin
  Result := StrToIntDef(sCallV('ORWDPS1 DFLTSPLY', [UnitStr, SchedStr, Patient.DFN, ADrug]), 0);
end;

function CalcMaxRefills(const Drug: string; Days, OrdItem: Integer; Discharge: Boolean): Integer;
begin
  Result := StrToIntDef(sCallV('ORWDPS2 MAXREF', [Patient.DFN, Drug, Days, OrdItem, Discharge]), 0);
end;

function ScheduleRequired(OrdItem: Integer; const ARoute, ADrug: string): Boolean;
begin
  Result := sCallV('ORWDPS2 SCHREQ', [OrdItem, ARoute, ADrug]) = '1';
end;

function ODForMedsIn: TStrings;
{ Returns init values for inpatient meds dialog.  The results must be used immediately. }
begin
  CallV('ORWDPS1 ODSLCT', [PST_UNIT_DOSE, Patient.DFN, Encounter.Location]);
  Result := RPCBrokerV.Results;
end;

function ODForMedsOut: TStrings;
{ Returns init values for outpatient meds dialog.  The results must be used immediately. }
begin
  CallV('ORWDPS1 ODSLCT', [PST_OUTPATIENT, Patient.DFN, Encounter.Location]);
  Result := RPCBrokerV.Results;
end;

function OIForMed(AnIEN: Integer; ForInpatient: Boolean; HavePI: Boolean; PKIActive: Boolean): TStrings;
var
  PtType: Char;
  NeedPI: Char;
  IsPKIActive: Char;
begin
  if HavePI then NeedPI := 'Y' else NeedPI := 'N';
  if ForInpatient then PtType := 'U' else PtType := 'O';
  if PKIActive then IsPKIActive := 'Y' else IsPKIActive := 'N';
  CallV('ORWDPS2 OISLCT', [AnIEN, PtType, Patient.DFN, NeedPI, IsPKIActive]);
  Result := RPCBrokerV.Results;
end;

function GetPickupForLocation(const Loc: string): string;
begin
  Result := sCallV('ORWDPS1 LOCPICK',[Loc]);
end;

function QOHasRouteDefined(AQOID: integer): boolean;
begin
  Result := False;
  if ( sCallV('ORWDPS1 HASROUTE',[AQOID])='1' ) then
    Result := True;
end;

procedure CheckExistingPI(AOrderId: string; var APtI: string);
begin
  APtI := sCallV('ORWDPS2 CHKPI', [AOrderId]);
end;

end.
