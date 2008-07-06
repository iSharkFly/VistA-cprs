unit rGraphs;

interface

uses SysUtils, Classes, Controls, Forms, ORNet, ORFn, Graphics;

function rpcPublicEdit: Boolean;
function rpcReportParams(ien: integer): String;

procedure FastAdd(source: TStrings; destination: TStrings);  // not used
procedure FastAssign(source: TStrings; destination: TStrings);
  // example: FastAssign(rpcDrugClass, lstDrugClass.Items)

function rpcClass(itemtype: string): TStrings;
function rpcTaxonomy(alltax: boolean; taxonomies: TStrings): TStrings;
procedure rpcDetailDay(Dest: TStrings; const PatientDFN: string; ADate1, ADate2: TFMDateTime;
  ATypeItem: string; complete: boolean);  //*DFN*
function rpcDetailSelected(const PatientDFN: string; ADate1, ADate2: TFMDateTime;
  tests: TStrings; complete: boolean): TStrings;  //*DFN*
function rpcGetAllItems(const PatientDFN: string): TStrings;
function rpcGetItems(typeitem: string; const PatientDFN: string): TStrings;
function rpcGetItemData(itemdata, timestamp: string; const PatientDFN: string): TStrings;
function rpcGetTypes(const PatientDFN: string; subtypes: boolean): TStrings;
function rpcGetTestSpec: TStrings;

function rpcGetGraphDateRange(reportid: string): TStrings;
function rpcGetGraphSettings: TStrings;
procedure rpcSetGraphSettings(paramsetting, permission: string);
function rpcGetGraphSizing: TStrings;
procedure rpcSetGraphSizing(values: TStrings);

function rpcGetGraphProfiles(profiles, permission: string; ext: integer): TStrings;
procedure rpcSetGraphProfile(paramname, permission: string; paramvalues: TStrings);
procedure rpcDeleteGraphProfile(paramname, permission: string);

function rpcLookupItems(const filename, startfrom: string; direction: integer): TStrings;
function rpcDateItem(oldestdate, newestdate: double; filenum: string; const PatientDFN: string): TStrings;
procedure onoff(x: integer);

implementation

function rpcPublicEdit: Boolean;
begin
  onoff(1);
  Result := sCallV('ORWGRPC PUBLIC', [nil]) = '1';
  //Result := false;  //************* for testing turn on
  onoff(0);
end;

function rpcReportParams(ien: integer): String;
begin
  onoff(1);
  Result := sCallV('ORWGRPC RPTPARAM', [ien]);
  onoff(0);
end;

procedure FastAssign(source: TStrings; destination: TStrings);
var
  ms: TMemoryStream;
begin
  destination.Clear;
  ms := TMemoryStream.Create;
  try
    source.SaveToStream(ms);
    ms.Seek(0, soFromBeginning);
    destination.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

procedure FastAdd(source: TStrings; destination: TStrings);
var
  ms: TMemoryStream;
begin
  destination.Clear;
  ms := TMemoryStream.Create;
  try
    destination.SaveToStream(ms);
    ms.Seek(soFromEnd, 0);
    source.SaveToStream(ms);
    ms.Seek(0, soFromBeginning);
    destination.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

procedure rpcDetailDay(Dest: TStrings; const PatientDFN: string; ADate1, ADate2: TFMDateTime;
  ATypeItem: string; complete: boolean);  //*DFN*
var
  includecomplete: string;
begin
  if complete then includecomplete := '1' else includecomplete := '0';
  onoff(1);
  CallV('ORWGRPC DETAILS', [PatientDFN, ADate1, ADate2, ATypeItem, includecomplete]);
  onoff(0);
  QuickCopy(RPCBrokerV.Results, Dest);
end;

function rpcDetailSelected(const PatientDFN: string; ADate1, ADate2: TFMDateTime;
  tests: TStrings; complete: boolean): TStrings;  //*DFN*
var
  includecomplete: string;
begin
  if complete then includecomplete := '1' else includecomplete := '0';
  onoff(1);
  CallV('ORWGRPC DETAIL', [PatientDFN, ADate1, ADate2, tests, includecomplete]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

function rpcGetAllItems(const PatientDFN: string): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC ALLITEMS', [PatientDFN]);
  onoff(0);
  MixedCaseList(RPCBrokerV.Results);
  Result := RPCBrokerV.Results;
end;

function rpcGetTypes(const PatientDFN: string; subtypes: boolean): TStrings;
var
  includesubtypes: string;
begin
  if subtypes then includesubtypes := '1' else includesubtypes := '0';
  onoff(1);
  CallV('ORWGRPC TYPES', [PatientDFN, includesubtypes]);
  onoff(0);
  MixedCaseList(RPCBrokerV.Results);
  Result := RPCBrokerV.Results;
end;

function rpcGetItems(typeitem: string; const PatientDFN: string): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC ITEMS', [PatientDFN, typeitem]);
  onoff(0);
  MixedCaseList(RPCBrokerV.Results);
  Result := RPCBrokerV.Results;
end;

function rpcClass(itemtype: string): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC CLASS', [itemtype]);
  onoff(0);
  MixedCaseList(RPCBrokerV.Results);
  Result := RPCBrokerV.Results;
end;

function rpcTaxonomy(alltax: boolean; taxonomies: TStrings): TStrings;
var
  getall: string;
begin
  if alltax then getall := '1' else getall := '0';
  onoff(1);
  CallV('ORWGRPC TAX', [getall, taxonomies]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

function rpcGetItemData(itemdata, timestamp: string; const PatientDFN: string): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC ITEMDATA', [itemdata, timestamp, PatientDFN]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

function rpcGetGraphDateRange(reportid: string): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC GETDATES', [reportid]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

function rpcGetGraphSettings: TStrings;
begin
  onoff(1);
  CallV('ORWGRPC GETPREF', [nil]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

procedure rpcSetGraphSettings(paramsetting, permission: string);
begin
  onoff(1);
  CallV('ORWGRPC SETPREF', [paramsetting, permission]);
  onoff(0);
end;

function rpcGetGraphSizing: TStrings;
begin
  onoff(1);
  CallV('ORWGRPC GETSIZE', [nil]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

procedure rpcSetGraphSizing(values: TStrings);
begin
  onoff(1);
  CallV('ORWGRPC SETSIZE', [values]);
  onoff(0);
end;

function rpcGetGraphProfiles(profiles, permission: string; ext: integer): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC GETVIEWS', [profiles, permission, ext]);
  onoff(0);
  if (profiles = '1') or (ext = 1) then MixedCaseList(RPCBrokerV.Results);
  Result := RPCBrokerV.Results;
end;

procedure rpcSetGraphProfile(paramname, permission: string; paramvalues: TStrings);
begin
  onoff(1);
  CallV('ORWGRPC SETVIEWS', [paramname, permission, paramvalues]);
  onoff(0);
end;

procedure rpcDeleteGraphProfile(paramname, permission: string);
begin
  onoff(1);
  CallV('ORWGRPC DELVIEWS', [paramname, permission]);
  onoff(0);
end;

function rpcGetTestSpec: TStrings;
begin
  onoff(1);
  CallV('ORWGRPC TESTSPEC', []);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

function rpcLookupItems(const filename, StartFrom: string; Direction: integer): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC LOOKUP', [filename, StartFrom, Direction]);
  onoff(0);
  MixedCaseList(RPCBrokerV.Results);
  Result := RPCBrokerV.Results;
end;

function rpcDateItem(oldestdate, newestdate: double; filenum: string; const PatientDFN: string): TStrings;
begin
  onoff(1);
  CallV('ORWGRPC DATEITEM', [oldestdate, newestdate, filenum, PatientDFN]);
  onoff(0);
  Result := RPCBrokerV.Results;
end;

procedure onoff(x: integer);
begin
  if x = 1 then
  begin
    //Screen.Cursor := crHourGlass;
  end
  else
  begin
    //Screen.Cursor := crDefault;
  end;
end;

end.
