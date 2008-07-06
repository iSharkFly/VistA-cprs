unit fOtherSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, fAutoSz, rMisc;

const
  NSS_TXT = 'This order will not become active until a valid schedule is used.';

type
  TfrmOtherSchedule = class(TfrmAutoSz)
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    cbo7: TCheckBox;
    cbo1: TCheckBox;
    cbo2: TCheckBox;
    cbo3: TCheckBox;
    cbo4: TCheckBox;
    cbo5: TCheckBox;
    cbo6: TCheckBox;
    GroupBox2: TGroupBox;
    lstHour: TListBox;
    lstMinute: TListBox;
    Panel4: TPanel;
    btn0k1: TButton;
    btnCancel: TButton;
    txtSchedule: TEdit;
    Label1: TLabel;
    btnReset: TButton;
    btnRemove: TButton;
    memMessage: TMemo;
    Splitter1: TSplitter;
    btnAdd: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btn0k1Click(Sender: TObject);
    procedure cbo7Click(Sender: TObject);
    procedure cbo1Click(Sender: TObject);
    procedure cbo2Click(Sender: TObject);
    procedure cbo3Click(Sender: TObject);
    procedure cbo4Click(Sender: TObject);
    procedure cbo5Click(Sender: TObject);
    procedure cbo6Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstHourClick(Sender: TObject);
    procedure txtScheduleChange(Sender: TObject);
    procedure lstMinuteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstMinuteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    FDaySchedule: array [1..7] of string;
    FTimeSchedule: TStringList;
    FOtherSchedule: String;
    FFromCheckBox: boolean;
    FFromEditBox: boolean;
    function GetSiteMessage: string;
    procedure SetDaySchedule(Sender: TObject);
    procedure SetTimeSchedule;
    procedure UpdateOnFreeTextInput;
    function CheckDay(ADayStr: string): string;
    
  public
  end;

function ShowOtherSchedule(var ASchedule: string): boolean;

implementation

uses ORFn, ORNet, rOrders;
{$R *.dfm}

function ShowOtherSchedule(var ASchedule: string): boolean;
var
  frmOtherSchedule: TfrmOtherSchedule;
begin
  Result := False;
  try
   frmOtherSchedule := TfrmOtherSchedule.Create(Application);
   ResizeFormToFont(TForm(frmOtherSchedule));
   SetFormPosition(frmOtherSchedule);
   if frmOtherSchedule.ShowModal = mrOK then
   begin
     ASchedule := UpperCase(frmOtherSchedule.FOtherSchedule);
     Result := True;
   end;
  except
   ShowMessage('Error happen when building other schedule');
  end;
end;


procedure TfrmOtherSchedule.FormCreate(Sender: TObject);
var
  i: integer;
  nssMsg: string;
begin
  FFromCheckBox := False;
  FFromEditBox := False;
  image1.Picture.Icon.Handle := LoadIcon(0, IDI_WARNING);
  for i := 1 to 7 do
   FDaySchedule[i] := '';
  FTimeSchedule := TStringlist.Create;
  FOtherSchedule := '';
  nssMsg := GetSiteMessage;
  if Length(nssMsg)< 1 then
    nssMsg := NSS_TXT;
  memMessage.Lines.Add(nssMsg);
end;

procedure TfrmOtherSchedule.btnCancelClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TfrmOtherSchedule.btn0k1Click(Sender: TObject);
begin
  if (cbo1.Checked = false) and (cbo2.Checked = false) and (cbo3.Checked = false) and (cbo4.Checked = false) and (cbo5.Checked = false) and
    (cbo6.Checked = false) and (cbo7.Checked = false) then
    begin
      ShowMessage('A day of week must be selected!');
      Exit;
    end;
  if not IsValidSchStr(FOtherSchedule) then
  begin
    ShowMessage('The schedule you entered is invalid!');
    Exit;
  end;
  modalResult := mrOK;
end;

procedure TfrmOtherSchedule.SetDaySchedule(Sender: TObject);
var
  i : integer;
  TimePart, DayPart: string;
begin
  with (Sender as TCheckBox) do
  begin
    try
      if TCheckBox(Sender).Checked then
        FDaySchedule[TCheckBox(Sender).Tag] := Copy(TCheckBox(Sender).Caption,0,2)
      else
        FDaySchedule[TCheckBox(Sender).Tag] := '';
    except
      ShowMessage('Error happened when building day schedule.');
      Exit;
    end;
  end;

  TimePart := '';
  DayPart := '';
  for i := 0 to FTimeSchedule.Count - 1 do
  begin
    if i = 0 then TimePart := TimePart + FTimeSchedule[i]
    else TimePart := TimePart + '-' + FTimeSchedule[i];
  end;
  for i := Low(FDaySchedule) to High(FDaySchedule) do
  begin
    if Length(FDaySchedule[i])>0 then
    begin
      if DayPart = '' then DayPart := FDaySchedule[i]
      else DayPart := DayPart + '-' + FDaySchedule[i];
    end;
  end;
  if Length(TimePart) > 0 then
  begin
    if Length(DayPart) > 0 then
      FOtherSchedule := DayPart + '@' + TimePart
    else if Length(DayPart) = 0 then
      FOtherSchedule := TimePart;
  end
  else FOtherSchedule := DayPart;
  txtSchedule.Text := FOtherSchedule;
end;

procedure TfrmOtherSchedule.SetTimeSchedule;
var
  i : integer;
  TimePart, DayPart,APRN,ASearchTxt: string;
begin
  TimePart := '';
  DayPart := '';
  APRN := '';
  ASearchTxt := UpperCase(txtSchedule.Text);
  if StrPos(PChar(ASearchTxt),PChar('PRN')) <> nil then APRN := ' PRN'; //hds8326 retain PRN free text if data time entered
  for i := 0 to FTimeSchedule.Count - 1 do
  begin
    if i = 0 then TimePart := TimePart + FTimeSchedule[i]
    else TimePart := TimePart + '-' + FTimeSchedule[i];
  end;
  for i := Low(FDaySchedule) to High(FDaySchedule) do
  begin
    if Length(FDaySchedule[i])>0 then
    begin
      if DayPart = '' then DayPart := FDaySchedule[i]
      else DayPart := DayPart + '-' + FDaySchedule[i];
    end;
  end;
  if Length(DayPart) > 0 then
  begin
    if Length(TimePart) > 0 then
      FOtherSchedule := DayPart + '@' + TimePart
    else
      FOtherSchedule := DayPart;
  end
  else FOtherSchedule := TimePart;
  if Length(APRN) > 0 then FOtherSchedule := FOtherSchedule + APRN; //hds8326 retain PRN free text if data time entered
  txtSchedule.Text := FOtherSchedule;
end;

procedure TfrmOtherSchedule.cbo7Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.cbo1Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.cbo2Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.cbo3Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.cbo4Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.cbo5Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.cbo6Click(Sender: TObject);
begin
  FFromCheckBox := True;
  if not FFromEditBox then
    SetDaySchedule(Sender);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.btnAddClick(Sender: TObject);
var
  hour, min: string;
begin
  if lstHour.ItemIndex < 0 then exit;
  hour := lstHour.Items[lstHour.ItemIndex];
  hour := Trim(Copy(hour,1,3));
  if length(Trim(hour)) = 1 then
    hour := '0' + Trim(hour);
  if lstMinute.ItemIndex >= 0 then
  begin
    min := lstMinute.Items[lstMinute.itemIndex];
    min := Copy(min,2,2);
  end;
  if min = '' then min := '00';
  if (hour='00') and (min='00') then hour := '24';
  if FTimeSchedule.IndexOf(hour)>=0 then
  begin
    FTimeSchedule[FTimeSchedule.IndexOf(hour)] := hour + min;
  end;
  if FTimeSchedule.IndexOf(hour+min) < 0 then
    FTimeSchedule.Add(hour+min);
  FTimeSchedule.Sort;
  SetTimeSchedule;
end;

procedure TfrmOtherSchedule.btnResetClick(Sender: TObject);
var
  i : integer;
begin
  cbo1.Checked := false;
  cbo2.Checked := false;
  cbo3.Checked:= false;
  cbo4.Checked := false;
  cbo5.Checked := false;
  cbo6.Checked := false;
  cbo7.Checked := false;
  lstHour.ItemIndex := -1;
  lstMinute.ItemIndex := -1;
  for i := low(FDaySchedule) to high(FDaySchedule) do
    FDaySchedule[i] := '';
  FTimeSchedule.Clear;
  FOtherSchedule := '';
  txtSchedule.Text := '';
end;

procedure TfrmOtherSchedule.btnRemoveClick(Sender: TObject);
var
  hour, min: string;
  idx : integer;
begin
  FFromCheckBox := True;
  if lstHour.ItemIndex >= 0 then
  begin
    hour := lstHour.Items[lstHour.ItemIndex];
    hour := Trim(Copy(hour,1,3));
    if length(hour) = 1 then
      hour := '0' + Trim(hour);
  end;
  if lstMinute.ItemIndex >= 0 then
  begin
    min := lstMinute.Items[lstMinute.itemIndex];
    min := Copy(min,2,2);
  end;
  if min = '' then min := '00';
  if (hour='00') and (min='00') then hour := '24';
  idx := FTimeSchedule.IndexOf(hour+min);
  if idx > -1 then
    FTimeSchedule.Delete(idx);
  FTimeSchedule.Sort;
  SetTimeSchedule;
  FFromCheckBox := False;
end;

function TfrmOtherSchedule.GetSiteMessage: string;
var
  i: integer;
  rstStr: string;
begin
  rstStr := '';
  CallV('ORWNSS NSSMSG',[nil]);
  for i := 0 to RPCBrokerV.Results.Count - 1 do
    rstStr := rstStr + RPCBrokerV.Results[i];
  Result := rstStr;
end;

procedure TfrmOtherSchedule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    inherited;
    SaveUserBounds(Self);
    Action := caFree;
  except
    Action := caFree;
  end;
end;

procedure TfrmOtherSchedule.UpdateOnFreeTextInput;
var
  dayStr,timeStr: string;
  dayList: TStringList;
  i,Code,cnt : integer;
  OrigSch: string;

  procedure updateCheckbox(aDList: TStringList);
  var
    idx: integer;
    x: string;
  begin
    for idx := aDList.Count - 1 downto 0 do
    begin
    // cq hds8326 PRN entered manually split PRN from DOW to retain last DOW
      x := UpperCase(aDList.Strings[idx]); // added to properly process DOW when followed by a space "PRN".
      if Piece(x,' ',2) = 'PRN' then
         aDLIst.Strings[idx] := Piece(x,' ',1);
    // cq hds8326
      if ((CheckDay(aDList[idx]) = 'SUN') or (CheckDay(aDList[idx]) = 'SU')) then
        begin
          cbo7.Checked := true;
          aDList[idx] := 'SU';
          FDaySchedule[cbo7.tag] := 'SU';
        end
      else if ((CheckDay(aDList[idx]) = 'MON') or (CheckDay(aDList[idx]) = 'MO')) then
        begin
          cbo1.Checked := true;
          aDList[idx] := 'MO';
          FDaySchedule[cbo1.tag] := 'MO';
        end
      else if ((CheckDay(aDList[idx]) = 'TUE') or (CheckDay(aDList[idx]) = 'TU')) then
        begin
          cbo2.Checked := true;
          aDList[idx] := 'TU';
          FDaySchedule[cbo2.tag] := 'TU';
        end
      else if ((CheckDay(aDList[idx]) = 'WED') or (CheckDay(aDList[idx]) = 'WE')) then
        begin
          cbo3.Checked := true;
          aDList[idx] := 'WE';
          FDaySchedule[cbo3.tag] := 'WE';
        end
      else if ((CheckDay(aDList[idx]) = 'THU') or (CheckDay(aDList[idx]) = 'TH')) then
        begin
          cbo4.Checked := true;
          aDList[idx] := 'TH';
          FDaySchedule[cbo4.tag] := 'TH';
        end
      else if ((CheckDay(aDList[idx]) = 'FRI') or (CheckDay(aDList[idx]) = 'FR')) then
        begin
          cbo5.Checked := true;
          aDList[idx] := 'FR';
          FDaySchedule[cbo5.tag] := 'FR';
        end
      else if ((CheckDay(aDList[idx]) = 'SAT') or (CheckDay(aDList[idx]) = 'SA')) then
        begin
          cbo6.Checked := true;
          aDList[idx] := 'SA';
          FDaySchedule[cbo6.tag] := 'SA';
        end
      else aDList.Delete(idx);
    end;
  end;

begin
  inherited;
  dayStr  := '';
  timeStr := '';
  if Length (txtSchedule.Text) = 0 then
  begin
    FOtherSchedule := '';
    btnReset.Click;
    Exit;
  end;
  OrigSch := txtSchedule.Text;
  dayList  := TStringList.Create;
  if Pos('@',txtSchedule.Text)>0 then
  begin
    dayStr  := Trim(Piece(txtSchedule.Text,'@',1));
    timeStr := Trim(Piece(txtSchedule.Text,'@',2));
  end  else
  begin
    Val(Piece(txtSchedule.Text,'-',1), i, Code);
    if i = 0 then begin end;  // just to make compiler not give hint
    if Code <> 0 then dayStr := Trim(txtSchedule.Text)
    else timeStr := Trim(txtSchedule.Text);
  end;
  FTimeSchedule.Clear;
  for cnt := Low(FDaySchedule) to High(FDaySchedule) do
    FDaySchedule[cnt] := '';
  PiecesToList(timeStr, '-', FTimeSchedule);
  if Length(dayStr)>0 then
  begin
    PiecesToList(dayStr, '-', dayList);
    cbo7.Checked := False;
    cbo1.Checked := False;
    cbo2.Checked := False;
    cbo3.Checked := False;
    cbo4.Checked := False;
    cbo5.Checked := False;
    cbo6.Checked := False;
    updateCheckbox(dayList);
  end;

  FOtherSchedule := txtSchedule.Text;
end;

procedure TfrmOtherSchedule.lstHourClick(Sender: TObject);
begin
  inherited;
  if lstMinute.ItemIndex = -1 then lstMinute.ItemIndex :=0;
end;

procedure TfrmOtherSchedule.txtScheduleChange(Sender: TObject);
begin
  inherited;
  FFromEditBox := True;
  if not FFromCheckBox then
    UpdateOnFreeTextInput;
  FFromEditBox := False;
end;

function TfrmOtherSchedule.CheckDay(ADayStr: string): string;
var
  lng: integer;
begin
  lng := Length(ADayStr);
  if lng <2 then
  begin
    result := '';
    Exit;
  end;
  if (lng < 7) and ( UpperCase(aDayStr)= Copy('SUNDAY',1,lng)) then
    result := 'SU'
  else if (lng < 7) and (UpperCase(aDayStr)= Copy('MONDAY',1,lng)) then
    result := 'MO'
  else if (lng < 8) and (UpperCase(aDayStr)= Copy('TUESDAY',1,lng)) then
    result := 'TU'
  else if (lng < 10) and (UpperCase(aDayStr)= Copy('WEDNESDAY',1,lng)) then
    result := 'WE'
  else if (lng < 9) and (UpperCase(aDayStr)= Copy('THURSDAY',1,lng)) then
    result := 'TH'
  else if (lng < 7) and (UpperCase(aDayStr)= Copy('FRIDAY',1,lng)) then
    result := 'FR'
  else if (lng < 9) and (UpperCase(aDayStr)= Copy('SATURDAY',1,lng)) then
    result := 'SA'
  else
    result := '';
end;

procedure TfrmOtherSchedule.lstMinuteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FFromCheckBox := True;
  if lstHour.ItemIndex < 0 then Exit;
  //btnAddClick(Self);
  FFromCheckBox := False;
end;

procedure TfrmOtherSchedule.lstMinuteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) then
  begin
    FFromCheckBox := True;
    if lstHour.ItemIndex < 0 then Exit;
    //btnAddClick(Self);
    FFromCheckBox := False;
  end;
end;

procedure TfrmOtherSchedule.Button1Click(Sender: TObject);
begin
  inherited;
   cbo1.Checked := true;
   cbo2.Checked := true;
   cbo3.Checked := true;
   cbo4.Checked := true;
   cbo5.Checked := true;
   cbo6.Checked := true;
   cbo7.Checked := true;
end;

end.

