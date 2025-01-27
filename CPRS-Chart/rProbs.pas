unit rProbs;

interface

uses SysUtils, Classes, ORNet, ORFn, uCore;

function AddSave(PatientInfo: string; ProviderID: int64; ptVAMC: string;
           ProbFile: TStringList): TStrings ;
function AuditHistory(ProblemIFN: string): TStrings ;
function ClinicFilterList(LocList: TStringList): TStrings ;
function ClinicSearch(DummyArg:string): TStrings ;
function ProblemDelete(ProblemIFN: string; ProviderID: int64; ptVAMC, Comment: string): TStrings ;
{function ProblemDetail}
function EditLoad(ProblemIFN: string; ProviderID: int64; ptVAMC: string): TStrings ;
function EditSave(ProblemIFN: string; ProviderID: int64; ptVAMC, PrimUser: string;
           ProbFile: TStringList): TStrings ;
function InitPt(const PatientDFN: string): TStrings ;  //*DFN*
function InitUser(ProviderID: int64): TStrings ;
function PatientProviders(const PatientDFN: string): TStrings ;  //*DFN*
function ProblemList(const PatientDFN: string; Status:string): TStrings ;  //*DFN*
function OldProblemLexiconSearch(SearchFor: string; Matches: integer; ADate: TFMDateTime = 0): TStrings ;
function ProblemLexiconCodeSearch(LexIEN: string; CodeType: string; ADate: TFMDateTime = 0): string ;
function ProblemLexiconSearch(SearchFor: string; View: string; ADate: TFMDateTime = 0): TStrings ;
function ProviderFilterList(ProvList: TStringList): TStrings ;
function ProviderList(Flag:string; Number:integer; From,Part: string): TStrings ;
function ProblemReplace(ProblemIFN: string): TStrings ;
function ServiceFilterList(LocList: TStringList): TStrings ;
function ServiceSearch(const StartFrom: string; Direction: Integer; All: boolean = FALSE): TStrings;
function ProblemUpdate(AltProbFile: TStringList): TStrings ;
function UserProblemCategories(Provider: int64; Location: integer): TStrings ;
function UserProblemList(CategoryIEN: string): TStrings ;
function ProblemVerify(ProblemIFN: string): TStrings ;
function GetProblemComments(ProblemIFN: string): TStrings;
procedure SaveViewPreferences(ViewPref: string);
function CheckForDuplicateProblem(TermIEN, TermText: string): string;

implementation

function AddSave(PatientInfo: string; ProviderID: int64; ptVAMC: string;
           ProbFile: TStringList): TStrings ;
begin
   CallV('ORQQPL ADD SAVE',[PatientInfo, ProviderID, ptVAMC, ProbFile]);
   Result := RPCBrokerV.Results ;
end ;

function AuditHistory(ProblemIFN: string): TStrings ;
begin
   CallV('ORQQPL AUDIT HIST',[ProblemIFN]);
   Result := RPCBrokerV.Results ;
end ;

function ClinicFilterList(LocList: TStringList): TStrings ;
begin
   CallV('ORQQPL CLIN FILTER LIST',[LocList]);
   MixedCaseList(RPCBrokerV.Results) ;
   Result := RPCBrokerV.Results;
end ;

function ClinicSearch(DummyArg:string): TStrings ;
begin
   CallV('ORQQPL CLIN SRCH',[DummyArg]);
   Result := RPCBrokerV.Results ;
end ;

function ProblemDelete(ProblemIFN: string; ProviderID: int64; ptVAMC, Comment: string): TStrings ;
begin
   CallV('ORQQPL DELETE',[ProblemIFN, ProviderID, ptVAMC, Comment]);
   Result := RPCBrokerV.Results ;
end ;

function EditLoad(ProblemIFN: string; ProviderID: int64; ptVAMC: string): TStrings ;
begin
   CallV('ORQQPL EDIT LOAD',[ProblemIFN, ProviderID, ptVAMC]);
   Result := RPCBrokerV.Results ;
end ;

function EditSave(ProblemIFN: string; ProviderID: int64; ptVAMC, PrimUser: string;
           ProbFile: TStringList): TStrings ;
begin
   CallV('ORQQPL EDIT SAVE',[ProblemIFN, ProviderID, ptVAMC, PrimUser, ProbFile]);
   Result := RPCBrokerV.Results ;
end ;

function InitPt(const PatientDFN: string): TStrings ;  //*DFN*
begin
   CallV('ORQQPL INIT PT',[PatientDFN]);
   Result := RPCBrokerV.Results ;
end ;

function InitUser(ProviderID: int64): TStrings ;
begin
   CallV('ORQQPL INIT USER',[ProviderID]);
   Result := RPCBrokerV.Results ;
end ;

function PatientProviders(const PatientDFN: string): TStrings ;  //*DFN*
begin
   CallV('ORQPT PATIENT TEAM PROVIDERS',[PatientDFN]);
   Result := RPCBrokerV.Results ;
end ;

function ProblemLexiconSearch(SearchFor: string; View: string; ADate: TFMDateTime = 0): TStrings ;
begin
   CallV('ORWPCE LEX',[SearchFor,View, ADate]);
   Result := RPCBrokerV.Results ;
end ;

function ProblemLexiconCodeSearch(LexIEN: string; CodeType: string; ADate: TFMDateTime = 0): string ;
begin
   CallV('ORWPCE LEXCODE',[LexIEN, CodeType, ADate]);
   Result := RPCBrokerV.Results[0] ;
end ;

function OldProblemLexiconSearch(SearchFor: string; Matches: integer; ADate: TFMDateTime = 0): TStrings ;
const
  VIEW = '';
begin
   CallV('ORQQPL PROBLEM LEX SEARCH',[SearchFor, Matches, VIEW, ADate]);
   Result := RPCBrokerV.Results ;
end ;

function ProblemList(const PatientDFN: string; Status:string): TStrings ;  //*DFN*
begin
   CallV('ORQQPL PROBLEM LIST',[PatientDFN, status]);
   Result := RPCBrokerV.Results ;
end ;

function ProviderFilterList(ProvList: TStringList): TStrings ;
begin
   CallV('ORQQPL PROV FILTER LIST',[ProvList]);
   Result := RPCBrokerV.Results ;
end ;

function ProviderList(Flag:string; Number:integer; From,Part: string): TStrings ;
begin
   CallV('ORQQPL PROVIDER LIST',[Flag,Number,From,Part]);
   Result := RPCBrokerV.Results ;
end ;

function ProblemReplace(ProblemIFN: string): TStrings ;
begin
   CallV('ORQQPL REPLACE',[ProblemIFN]);
   Result := RPCBrokerV.Results ;
end ;

function ServiceFilterList(LocList: TStringList): TStrings ;
begin
   CallV('ORQQPL SERV FILTER LIST',[LocList]);
   MixedCaseList(RPCBrokerV.Results) ;
   Result := RPCBrokerV.Results;
end ;

function ServiceSearch(const StartFrom: string; Direction: Integer; All: boolean = FALSE): TStrings;
begin
   CallV('ORQQPL SRVC SRCH',[StartFrom, Direction, BoolChar[All]]);
   MixedCaseList(RPCBrokerV.Results) ;
   Result := RPCBrokerV.Results ;
end ;

function ProblemUpdate(AltProbFile: TStringList): TStrings ;
begin
   CallV('ORQQPL UPDATE',[AltProbFile]);
   Result := RPCBrokerV.Results ;
end ;

function ProblemVerify(ProblemIFN: string): TStrings ;
begin
   CallV('ORQQPL VERIFY',[ProblemIFN]);
   Result := RPCBrokerV.Results ;
end ;

function UserProblemCategories(Provider: int64; Location: integer): TStrings ;
begin
   CallV('ORQQPL USER PROB CATS',[Provider, Location]);
   Result := RPCBrokerV.Results ;
end ;

function UserProblemList(CategoryIEN: string): TStrings ;
begin
   CallV('ORQQPL USER PROB LIST',[CategoryIEN]);
   Result := RPCBrokerV.Results ;
end ;

function GetProblemComments(ProblemIFN: string): TStrings;
begin
   CallV('ORQQPL PROB COMMENTS',[ProblemIFN]);
   Result := RPCBrokerV.Results ;
end;

procedure SaveViewPreferences(ViewPref: string);
begin
  CallV('ORQQPL SAVEVIEW',[ViewPref]);
end;

function CheckForDuplicateProblem(TermIEN, TermText: string): string;
begin
  CallV('ORQQPL CHECK DUP',[Patient.DFN, TermIEN, TermText]);
  Result := RPCBrokerV.Results[0];
end;

end.
