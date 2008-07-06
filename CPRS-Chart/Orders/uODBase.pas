unit uODBase;

interface

uses
  Classes, ORFn, uConst;

{ Order Checking }
function AddFillerAppID(const AnID: string): Boolean;
procedure ClearFillerAppList;

{ Ordering Environment }
procedure SetOrderFormIDOnCreate(AFormID: Integer);
function OrderFormIDOnCreate: Integer;
procedure SetOrderEventTypeOnCreate(AType: Char);
function OrderEventTypeOnCreate: Char;
procedure SetOrderEventIDOnCreate(AnEvtID: integer);
function OrderEventIDOnCreate: integer;
procedure SetOrderEventNameOnCreate(AnEvtNm: string);
function OrderEventNameOnCreate: string;
function GetKeyVars: string;
procedure PopKeyVars(NumLevels: Integer = 1);
procedure PushKeyVars(const NewVals: string);
procedure ExpandOrderObjects(var Txt: string; var ContainsObjects: boolean; msg: string = '');

implementation

uses
  dShared, Windows, rTemplates;

var
  uOrderEventType: Char;
  uOrderEventID: Integer;
  uOrderEventName: string;
  uOrderFormID: Integer;
  uFillerAppID: TStringList;
  uKeyVarList:  TStringList;

{ Order Checking }

function AddFillerAppID(const AnID: string): Boolean;
begin
  Result := False;
  if uFillerAppID.IndexOf(AnID) < 0 then
  begin
    Result := True;
    uFillerAppID.Add(AnID);
  end;
end;

procedure ClearFillerAppList;
begin
  uFillerAppID.Clear;
end;

{ Ordering Environment }

procedure SetOrderFormIDOnCreate(AFormID: Integer);
begin
  uOrderFormID := AFormID;
end;

function OrderFormIDOnCreate: Integer;
begin
  Result := uOrderFormID;
end;

procedure SetOrderEventTypeOnCreate(AType: Char);
begin
  uOrderEventType := AType;
end;

function OrderEventTypeOnCreate: Char;
begin
  Result := uOrderEventType;
end;

procedure SetOrderEventIDOnCreate(AnEvtID: Integer);
begin
  uOrderEventID := AnEvtID;
end;

procedure SetOrderEventNameOnCreate(AnEvtNm: string);
begin
  uOrderEventName := AnEvtNm;
end;

function OrderEventNameOnCreate: string;
begin
  Result := uOrderEventName;
end;

function OrderEventIDOnCreate: integer;
begin
  Result := uOrderEventID;
end;

function GetKeyVars: string;
begin
  Result := '';
  with uKeyVarList do if Count > 0 then Result := Strings[Count - 1];
end;

procedure PopKeyVars(NumLevels: Integer = 1);
begin
  with uKeyVarList do while (NumLevels > 0) and (Count > 0) do
  begin
    Delete(Count - 1);
    Dec(NumLevels);
  end;
end;

procedure PushKeyVars(const NewVals: string);
var
  i: Integer;
  x: string;
begin
  if uKeyVarList.Count > 0 then x := uKeyVarList[uKeyVarList.Count - 1] else x := '';
  for i := 1 to MAX_KEYVARS do
    if Piece(NewVals, U, i) <> '' then SetPiece(x, U, i, Piece(NewVals, U, i));
  uKeyVarList.Add(x);
end;

procedure ExpandOrderObjects(var Txt: string; var ContainsObjects: boolean; msg: string = '');
var
  ObjList: TStringList;
  Err: TStringList;
  i, j, k, oLen: integer;
  obj, ObjTxt: string;
const
  CRDelim = #13;
  TC_BOILER_ERR  = 'Order Boilerplate Object Error';
  TX_BOILER_ERR  = 'Contact IRM and inform them about this error.' + CRLF +
                   'Make sure you give them the name of the quick' + CRLF +
                   'order that you are processing.' ;
begin
  ObjList := TStringList.Create;
  try
    Err := nil;
    if(not dmodShared.BoilerplateOK(Txt, CRDelim, ObjList, Err)) and (assigned(Err)) then
    begin
      try
        Err.Add(CRLF + TX_BOILER_ERR);
        InfoBox(Err.Text, TC_BOILER_ERR, MB_OK + MB_ICONERROR);
      finally
        Err.Free;
      end;
    end;
    if(ObjList.Count > 0) then
    begin
      ContainsObjects := True;
      GetTemplateText(ObjList);
      i := 0;
      while (i < ObjList.Count) do
      begin
        if(pos(ObjMarker, ObjList[i]) = 1) then
        begin
          obj := copy(ObjList[i], ObjMarkerLen+1, MaxInt);
          if(obj = '') then break;
          j := i + 1;
          while (j < ObjList.Count) and (pos(ObjMarker, ObjList[j]) = 0) do
            inc(j);
          if((j - i) > 2) then
          begin
            ObjTxt := '';
            for k := i+1 to j-1 do
              ObjTxt := ObjTxt + #13 + ObjList[k];
          end
          else
            ObjTxt := ObjList[i+1];
          i := j;
          obj := '|' + obj + '|';
          oLen := length(obj);
          repeat
            j := pos(obj, Txt);
            if(j > 0) then
            begin
              delete(Txt, j, OLen);
              insert(ObjTxt, Txt, j);
            end;
          until(j = 0);
        end
        else
          inc(i);
      end
    end;
  finally
    ObjList.Free;
  end;
end;

initialization
  uOrderEventType := #0;
  uOrderFormID := 0;
  uOrderEventName := '';
  uFillerAppID := TStringList.Create;
  uKeyVarList  := TStringList.Create;

finalization
  uFillerAppID.Free;
  uKeyVarList.Free;

end.
