unit fPtSel;
{ Allows patient selection using various pt lists.  Allows display & processing of alerts. }
 //vwpt enhancements included

{$OPTIMIZATION OFF}                              // REMOVE AFTER UNIT IS DEBUGGED

{$define VAA}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ORCtrls, ExtCtrls, ORFn, ORNet, ORDtTmRng, Gauges, Menus, ComCtrls,
  UBAGlobals, UBACore;

type
  TfrmPtSel = class(TForm)
    pnlPtSel: TORAutoPanel;
    cboPatient: TORComboBox;
    lblPatient: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    pnlNotifications: TORAutoPanel;
    cmdProcessInfo: TButton;
    cmdProcessAll: TButton;
    cmdProcess: TButton;
    cmdForward: TButton;
    sptVert: TSplitter;
    cmdSaveList: TButton;
    pnlDivide: TORAutoPanel;
    lblNotifications: TLabel;
    ggeInfo: TGauge;
    cmdRemove: TButton;
    popNotifications: TPopupMenu;
    mnuProcess: TMenuItem;
    mnuRemove: TMenuItem;
    mnuForward: TMenuItem;
    lstvAlerts: TCaptionListView;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup ;
    //RadioGroup1: TRadioGroup;
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cboPatientChange(Sender: TObject);
    procedure cboPatientKeyPause(Sender: TObject);
    procedure cboPatientMouseClick(Sender: TObject);
    procedure cboPatientEnter(Sender: TObject);
    procedure cboPatientExit(Sender: TObject);
    procedure cboPatientNeedData(Sender: TObject; const StartFrom: string;
      Direction, InsertAt: Integer);
    procedure cboPatientDblClick(Sender: TObject);
    procedure cmdProcessClick(Sender: TObject);
    procedure cmdSaveListClick(Sender: TObject);
    procedure cmdProcessInfoClick(Sender: TObject);
    procedure cmdProcessAllClick(Sender: TObject);
    procedure lstvAlertsDblClick(Sender: TObject);
    procedure cmdForwardClick(Sender: TObject);
    procedure cmdRemoveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlPtSelResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboPatientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstvAlertsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lstvAlertsCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    function DupLastSSN(const DFN: string): Boolean;
    procedure lstFlagsClick(Sender: TObject);
    procedure lstFlagsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstvAlertsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ShowButts(ShowButts: Boolean);
    procedure lstvAlertsInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstvAlertsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

    //VWPT ENAHANCED PATIENT LOOKUP
    function IsOther(itemindex:Integer):Boolean;
    
    procedure onclick1(Sender: TObject);

  private
    FsortCol: integer;
    FsortAscending: boolean;
    FLastPt: string;
    FsortDirection: string;
    FUserCancelled: boolean;
    procedure AdjustFormSize(ShowNotif: Boolean; FontSize: Integer);
    procedure ClearIDInfo;
    procedure ShowIDInfo;
    procedure ShowFlagInfo;
    procedure SetCaptionTop;
    procedure SetPtListTop(IEN: Int64);
    procedure RPLDisplay;
    procedure AlertList;
    procedure ReformatAlertDateTime;
  public
    procedure Loaded; override;
  end;

procedure SelectPatient(ShowNotif: Boolean; FontSize: Integer; var UserCancelled: boolean);

var
  frmPtSel: TfrmPtSel;
  FDfltSrc, FDfltSrcType: string;
  IsRPL, RPLJob, DupDFN: string;                 // RPLJob stores server $J job number of RPL pt. list.
  RPLProblem: boolean;                           // Allows close of form if there's an RPL problem.
  PtStrs: TStringList;
  SortViaKeyboard: boolean;
  //vwpt enhancement
  itimson : integer = 1;
  enhanceskip : integer = 0;
  radiogrp1index : integer = 0;
implementation

{$R *.DFM}

uses rCore,uCore, fDupPts, fPtSens, fPtSelDemog, fPtSelOptns, fPatientFlagMulti,
     uOrPtf, fAlertForward, rMisc,  fFrame;

const
  TX_DGSR_ERR    = 'Unable to perform sensitive record checks';
  TC_DGSR_ERR    = 'Error';
  TC_DGSR_SHOW   = 'Restricted Record';
  TC_DGSR_DENY   = 'Access Denied';
  TX_DGSR_YESNO  = CRLF + 'Do you want to continue processing this patient record?';
  AliasString = ' -- ALIAS';

 //VWPT ENAHANCED PATIENT LOOKUP
function TfrmPtSel.IsOther(itemindex:Integer):Boolean;
var
   i:Integer  ;

begin
         Result := True;
         if (RadioGroup1.ItemIndex = -1) or (RadioGroup1.ItemIndex = 0) or (itimson = 0) then Result := False;
end;




procedure SelectPatient(ShowNotif: Boolean; FontSize: Integer; var UserCancelled: boolean);
{ displays patient selection dialog (with optional notifications), updates Patient object }
var
  frmPtSel: TfrmPtSel;
begin
  frmPtSel := TfrmPtSel.Create(Application);
  RPLProblem := false;
  try
    with frmPtSel do
    begin
      AdjustFormSize(ShowNotif, FontSize);           // Set initial form size
      FDfltSrc := DfltPtList;
      FDfltSrcType := Piece(FDfltSrc, U, 2);
      FDfltSrc := Piece(FDfltSrc, U, 1);
      if (IsRPL = '1') then                          // Deal with restricted patient list users.
        FDfltSrc := '';
      frmPtSelOptns.SetDefaultPtList(FDfltSrc);
      if RPLProblem then
         begin
          frmPtSel.Release;
          Exit;
        end;
      Notifications.Clear;
      FsortCol := -1;
      AlertList;
      ClearIDInfo;
      if (IsRPL = '1') then                          // Deal with restricted patient list users.
        RPLDisplay;                                  // Removes unnecessary components from view.
      FUserCancelled := FALSE;
      ShowModal;
      UserCancelled := FUserCancelled;
    end;
  finally
    frmPtSel.Release;
  end;
end;

procedure TfrmPtSel.AdjustFormSize(ShowNotif: Boolean; FontSize: Integer);
{ Adjusts the initial size of the form based on the font used & if notifications should show. }
var
  Rect: TRect;
//  TheFormHeight: integer;
  SplitterTop, t1, t2, t3: integer;
begin
  ResizeAnchoredFormToFont(self);
//  TheFormHeight := pnlPtSel.Height;
  // Make the form bigger (140%) to show notifications and show notification controls.
  if ShowNotif then
  begin
//    TheFormHeight := Round(TheFormHeight * 2.4);
//    pnlDivide.Height := lblNotifications.Height + 4;
    pnlDivide.Visible := True;
    lstvAlerts.Visible := True;
    pnlNotifications.Visible := True;
    pnlPtSel.BevelOuter := bvRaised;
//    ClientHeight := TheFormHeight;
  end
  else
  begin
    pnlDivide.Visible := False;
    lstvAlerts.Visible := False;
    pnlNotifications.Visible := False;
//    ClientHeight := TheFormHeight;
//    pnlPtSel.Anchors := [akLeft,akRight,akTop,akBottom];
  end;
//  ClientHeight := TheFormHeight;
//  VertScrollBar.Range := TheFormHeight;

  //After all of this calcualtion, we still use the saved preferences when possible
  SetFormPosition(self);
  Rect := BoundsRect;
  ForceInsideWorkArea(Rect);
  BoundsRect := Rect;

  if frmFrame.EnduringPtSelSplitterPos <> 0 then
    SplitterTop := frmFrame.EnduringPtSelSplitterPos
  else
    SetUserBounds2(Name+'.'+sptVert.Name,SplitterTop, t1, t2, t3);
  if SplitterTop <> 0 then
    pnlPtSel.Height := SplitterTop;
end;

procedure TfrmPtSel.SetCaptionTop;
{ Show patient list name, set top list to 'Select ...' if appropriate. }
var
  x: string;
begin
  x := '';
  lblPatient.Caption := 'Patients';
  if (not User.IsReportsOnly) then
  begin
  case frmPtSelOptns.SrcType of
  TAG_SRC_DFLT: lblPatient.Caption := 'Patients (' + FDfltSrc + ')';
  TAG_SRC_PROV: x := 'Provider';
  TAG_SRC_TEAM: x := 'Team';
  TAG_SRC_SPEC: x := 'Specialty';
  TAG_SRC_CLIN: x := 'Clinic';
  TAG_SRC_WARD: x := 'Ward';
  TAG_SRC_ALL:  { Nothing };
  end; // case stmt
  end; // begin
  if Length(x) > 0 then with cboPatient do
  begin
    RedrawSuspend(Handle);
    ClearIDInfo;
    ClearTop;
    Text := '';
    Items.Add('^Select a ' + x + '...');
    Items.Add(LLS_LINE);
    Items.Add(LLS_SPACE);
    cboPatient.InitLongList('');
    RedrawActivate(cboPatient.Handle);
  end;
end;

{ List Source events: }

procedure TfrmPtSel.SetPtListTop(IEN: Int64);
{ Sets top items in patient list according to list source type and optional list source IEN. }
var
  NewTopList: string;
  FirstDate, LastDate: string;
begin
  // NOTE:  Some pieces in RPC returned arrays are rearranged by ListPtByDflt call in rCore!
  IsRPL := User.IsRPL;
  if (IsRPL = '') then // First piece in ^VA(200,.101) should always be set (to 1 or 0).
    begin
      InfoBox('Patient selection list flag not set.', 'Incomplete User Information', MB_OK);
      RPLProblem := true;
      Exit;
    end;
  // FirstDate := 0; LastDate := 0; // Not req'd, but eliminates hint.
  // Assign list box TabPosition, Pieces properties according to type of list to be displayed.
  // (Always use Piece "2" as the first in the list to assure display of patient's name.)
  cboPatient.pieces := '2,3'; // This line and next: defaults set - exceptions modifield next.
  cboPatient.tabPositions := '20,28';
  if ((frmPtSelOptns.SrcType = TAG_SRC_DFLT) and (FDfltSrc = 'Combination')) then
    begin
      cboPatient.pieces := '2,3,4,5,9';
      cboPatient.tabPositions := '20,28,35,45';
    end;
  if ((frmPtSelOptns.SrcType = TAG_SRC_DFLT) and
      (FDfltSrcType = 'Ward')) or (frmPtSelOptns.SrcType = TAG_SRC_WARD) then
    cboPatient.tabPositions := '35';
  if ((frmPtSelOptns.SrcType = TAG_SRC_DFLT) and
      (AnsiStrPos(pChar(FDfltSrcType), 'Clinic') <> nil)) or (frmPtSelOptns.SrcType = TAG_SRC_CLIN) then
    begin
      cboPatient.pieces := '2,3,9';
      cboPatient.tabPositions := '24,45';
    end;
  NewTopList := IntToStr(frmPtSelOptns.SrcType) + U + IntToStr(IEN); // Default setting.
  if (frmPtSelOptns.SrcType = TAG_SRC_CLIN) then with frmPtSelOptns.cboDateRange do
    begin
      if ItemID = '' then Exit;                        // Need both clinic & date range.
      FirstDate := Piece(ItemID, ';', 1);
      LastDate  := Piece(ItemID, ';', 2);
      NewTopList := IntToStr(frmPtSelOptns.SrcType) + U + IntToStr(IEN) + U + ItemID; // Modified for clinics.
    end;
  if NewTopList = frmPtSelOptns.LastTopList then Exit; // Only continue if new top list.
  frmPtSelOptns.LastTopList := NewTopList;
  RedrawSuspend(cboPatient.Handle);
  ClearIDInfo;
  cboPatient.ClearTop;
  cboPatient.Text := '';
  if (IsRPL = '1') then                                // Deal with restricted patient list users.
    begin
      RPLJob := MakeRPLPtList(User.RPLList);           // MakeRPLPtList is in rCore, writes global "B" x-ref list.
      if (RPLJob = '') then
        begin
          InfoBox('Assignment of valid OE/RR Team List Needed.', 'Unable to build Patient List', MB_OK);
          RPLProblem := true;
          Exit;
        end;
    end
  else
    begin
      case frmPtSelOptns.SrcType of
      TAG_SRC_DFLT: ListPtByDflt(cboPatient.Items);
      TAG_SRC_PROV: ListPtByProvider(cboPatient.Items, IEN);
      TAG_SRC_TEAM: ListPtByTeam(cboPatient.Items, IEN);
      TAG_SRC_SPEC: ListPtBySpecialty(cboPatient.Items, IEN);
      TAG_SRC_CLIN: ListPtByClinic(cboPatient.Items, frmPtSelOptns.cboList.ItemIEN, FirstDate, LastDate);
      TAG_SRC_WARD: ListPtByWard(cboPatient.Items, IEN);
      TAG_SRC_ALL:  ListPtTop(cboPatient.Items);
      end;
    end;
  if frmPtSelOptns.cboList.Visible then
    lblPatient.Caption := 'Patients (' + frmPtSelOptns.cboList.Text + ')';
  if frmPtSelOptns.SrcType = TAG_SRC_ALL then
    lblPatient.Caption := 'Patients (All Patients)';
  with cboPatient do if ShortCount > 0 then
    begin
      Items.Add(LLS_LINE);
      Items.Add(LLS_SPACE);
    end;
  cboPatient.Caption := lblPatient.Caption;
  cboPatient.InitLongList('');
  //VWPT
  //cboPatient.LongList := True;
  //cboPateint.HintonItem := True;
  //end
  RedrawActivate(cboPatient.Handle);
end;

{ Patient Select events: }

procedure TfrmPtSel.cboPatientEnter(Sender: TObject);
begin
  cmdOK.Default := True;
  if cboPatient.ItemIndex >= 0 then
  begin
    ShowIDInfo;
    ShowFlagInfo;
  end;
end;

procedure TfrmPtSel.cboPatientExit(Sender: TObject);
begin
  cmdOK.Default := False;
end;

procedure TfrmPtSel.cboPatientChange(Sender: TObject);

    procedure ShowMatchingPatients;
    begin
      with cboPatient do
        begin
          ClearIDInfo;
          if ShortCount > 0 then
            begin
              if ShortCount = 1 then
                begin
                  ItemIndex := 0;
                  ShowIDInfo;
                  ShowFlagInfo;                  
                end;
              Items.Add(LLS_LINE);
              Items.Add(LLS_SPACE);
            end;
          InitLongList('');
        end;
    end;
var caption:string;
    index:integer;
begin
  with cboPatient do
    if IsOther(integer(1))and (IsRPL <> '1')and (enhanceskip=0) and (frmPtSelOptns.IsEnhanced(Text))and (not frmPtSelOptns.IsPatientName(Text)) then
      begin
        if (IsRPL = '1') then
          ///ListPtByRPLLast5(Items, Text)   Messagebox error
        else
         begin
             index := RadioGroup1.ItemIndex;
             caption := piece(RadioGroup1.Items[index],'&',2);
             //Application.MessageBox(pChar(caption), pChar('Message'),MB_OK);
             //caption := '' ; //derivative of integer(1) or other index of radio button selection
             ListPtByOther(Items, Text,caption); // one extra argument on radio button selection
             if Items.Count>0  then
             begin
                  //itimson :=0 ;//no check for timson change in cbopatient until after click event finished
             RadioGroup1.ItemIndex  := 0;
             RadioGroup1.SetFocus;
             RadioGroup1.Refresh;
             end;
             ShowMatchingPatients;
         end;
      end
    else if frmPtSelOptns.IsLast5(Text) then
      begin
        if (IsRPL = '1') then
          ListPtByRPLLast5(Items, Text)
        else
          ListPtByLast5(Items, Text);
        ShowMatchingPatients;
      end
    else if frmPtSelOptns.IsFullSSN(Text) then
      begin
        if (IsRPL = '1') then
           ListPtByRPLFullSSN(Items, Text)
        else
           ListPtByFullSSN(Items, Text);
        ShowMatchingPatients;
      end

    else if (not IsOther(integer(1))) and (IsRPL <> '1')and (enhanceskip=0) and (frmPtSelOptns.IsEnhanced(Text)) and (not frmPtSelOptns.IsPatientName(Text)) then
    begin

           ListPtByTimson(Items,Text) ;
           ShowMatchingPatients;
          //vwpt enhanced changes
          //check for change here if itimson flag =1 .no matter what however, even if 0,
         //set it back to 1
         //itimson :=1;
         //end vwpt enhanced


    end
    //enhanceskip := 0 ;
end;

procedure TfrmPtSel.cboPatientKeyPause(Sender: TObject);
begin
  if Length(cboPatient.ItemID) > 0 then  //*DFN*
  begin
    ShowIDInfo;
    ShowFlagInfo;
  end else
  begin
    ClearIDInfo;
  end;
end;

procedure TfrmPtSel.cboPatientMouseClick(Sender: TObject);
begin
  // vwpt enhanced   on click or double clck set mode back to normal to a.) not allow change event
 //erroneously checked with false lookup, and b.0 immedicately put back into normal mode
 //without separate step needed.
  if (RadioGroup1.ItemIndex  > 0) then
  begin
  //itimson :=0 ;//no check for timson change in cbopatient until after click event finished
  RadioGroup1.ItemIndex  := 0;
  RadioGroup1.SetFocus;
  RadioGroup1.Refresh;
  end;
  //enhanceskip:=1 ;

//end vwpt enhanced
  if Length(cboPatient.ItemID) > 0 then   //*DFN*
  begin
    ShowIDInfo;
    ShowFlagInfo;
  end else
  begin
    ClearIDInfo;
  end;
end;

procedure TfrmPtSel.cboPatientDblClick(Sender: TObject);
begin
  // vwpt enhanced   on click or double clck set mode back to normal to a.) not allow change event
//erroneiusly checked with false lookup, and b.0 immedicately put back into normal mode
//withut separate step needed.
if (RadioGroup1.ItemIndex  > 0 ) then
  begin
 // itimson :=0 ;//no check for timson change in cbopatient until after click event finished
  RadioGroup1.ItemIndex  := 0;
  RadioGroup1.SetFocus;
  RadioGroup1.Refresh;

end;
//end vwpt enhanced
  if Length(cboPatient.ItemID) > 0 then cmdOKClick(Self);  //*DFN*
end;

procedure TfrmPtSel.cboPatientNeedData(Sender: TObject; const StartFrom: string;
  Direction, InsertAt: Integer);
var
  i: Integer;
  NoAlias, Patient: String;
  PatientList: TStringList;
begin

NoAlias := StartFrom;
with Sender as TORComboBox do
  if Items.Count > ShortCount then
    NoAlias := Piece(Items[Items.Count-1], U, 1) + U + NoAlias;
if pos(AliasString, NoAlias)> 0 then
  NoAlias := Copy(NoAlias, 1, pos(AliasString, NoAlias)-1);
PatientList := TStringList.Create;
try
  begin
    if (IsRPL  = '1') then // Restricted patient lists uses different feed for long list box:
      PatientList.Assign(ReadRPLPtList(RPLJob, NoAlias, Direction))
    else
    begin
      PatientList.Assign(SubSetOfPatients(NoAlias, Direction));
      for i := 0 to PatientList.Count-1 do  // Add " - Alias" to alias names:
      begin
        Patient := PatientList[i];
        // Piece 6 avoids display problems when mixed with "RPL" lists:
        if (Uppercase(Piece(Patient, U, 2)) <> Uppercase(Piece(Patient, U, 6))) then
        begin
          SetPiece(Patient, U, 2, Piece(Patient, U, 2) + AliasString);
          PatientList[i] := Patient;
        end;
      end;
    end;
    cboPatient.ForDataUse(PatientList);
  end;
finally
  PatientList.Free;
end;

end;

procedure TfrmPtSel.ClearIDInfo;
begin
  frmPtSelDemog.ClearIDInfo;
end;

procedure TfrmPtSel.ShowIDInfo;
begin
  frmPtSelDemog.ShowDemog(cboPatient.ItemID);
end;

{ Command Button events: }

procedure TfrmPtSel.cmdOKClick(Sender: TObject);
{ Checks for restrictions on the selected patient and sets up the Patient object. }
const
  DLG_CANCEL = False;
  DGSR_FAIL = -1;
  DGSR_NONE =  0;
  DGSR_SHOW =  1;
  DGSR_ASK  =  2;
  DGSR_DENY =  3;
var
  NewDFN, AMsg: string;  //*DFN*
  AccessStatus: Integer;
  DateDied: TFMDateTime;
begin
// vwpt enhanced   on click or double clck set mode back to normal to a.) not allow change event
//erroneiusly checked with false lookup, and b.0 immedicately put back into normal mode
//without separate step needed.
  if (RadioGroup1.ItemIndex  > 0 ) then
  begin
  //itimson :=0 ;//no check for timson change in cbopatient until after click event finished
  RadioGroup1.ItemIndex  := 0;
  RadioGroup1.SetFocus;
  RadioGroup1.Refresh;
  end;

//end vwpt enhanced
if not (Length(cboPatient.ItemID) > 0) then  //*DFN*
  begin
    InfoBox('A patient has not been selected.', 'No Patient Selected', MB_OK);
    Exit;
  end;
  NewDFN := cboPatient.ItemID;  //*DFN*
  if FLastPt <> cboPatient.ItemID then
  begin
    HasActiveFlg(FlagList, HasFlag, cboPatient.ItemID);
    flastpt := cboPatient.ItemID;
  end;

  If DupLastSSN(NewDFN) then    // Check for, deal with duplicate patient data.
    if (DupDFN = 'Cancel') then
      Exit
    else
      NewDFN := DupDFN;
  CheckSensitiveRecordAccess(NewDFN, AccessStatus, AMsg);
  case AccessStatus of
  DGSR_FAIL: begin
               InfoBox(TX_DGSR_ERR, TC_DGSR_ERR, MB_OK);
               Exit;
             end;
  DGSR_NONE: { Nothing - allow access to the patient. };
  DGSR_SHOW: InfoBox(AMsg, TC_DGSR_SHOW, MB_OK);
  DGSR_ASK:  if InfoBox(AMsg + TX_DGSR_YESNO, TC_DGSR_SHOW, MB_YESNO or MB_ICONWARNING or
               MB_DEFBUTTON2) = IDYES then LogSensitiveRecordAccess(NewDFN) else Exit;
  else       begin
               InfoBox(AMsg, TC_DGSR_DENY, MB_OK);
               Exit;
             end;
  end;
  DateDied := DateOfDeath(NewDFN);
  if (DateDied > 0) and (InfoBox('This patient died ' + FormatFMDateTime('mmm dd,yyyy hh:nn', DateDied) + CRLF +
     'Do you wish to continue?', 'Deceased Patient', MB_YESNO or MB_DEFBUTTON2) = ID_NO) then
    Exit;
  // 9/23/2002: Code used to check for changed pt. DFN here, but since same patient could be
  //    selected twice in diff. Encounter locations, check was removed and following code runs
  //    no matter; in fFrame code then updates Encounter display if Encounter.Location has changed.
  // NOTE: Some pieces in RPC returned arrays are modified/rearranged by ListPtByDflt call in rCore!
  Patient.DFN := NewDFN;     // The patient object in uCore must have been created already!
  Encounter.Clear;
  Changes.Clear;             // An earlier call to ReviewChanges should have cleared this.
  if (frmPtSelOptns.SrcType = TAG_SRC_CLIN) and (frmPtSelOptns.cboList.ItemIEN > 0) and
    IsFMDateTime(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 4)) then // Clinics, not by default.
  begin
    Encounter.Location := frmPtSelOptns.cboList.ItemIEN;
    with cboPatient do Encounter.DateTime := MakeFMDateTime(Piece(Items[ItemIndex], U, 4));
  end
  else if (frmPtSelOptns.SrcType = TAG_SRC_DFLT) and (DfltPtListSrc = 'C') and
         IsFMDateTime(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 4))then
       with cboPatient do // "Default" is a clinic.
  begin
    Encounter.Location := StrToIntDef(Piece(Items[ItemIndex], U, 10), 0); // Piece 10 is ^SC( location IEN in this case.
    Encounter.DateTime := MakeFMDateTime(Piece(Items[ItemIndex], U, 4));
  end
  else if ((frmPtSelOptns.SrcType = TAG_SRC_DFLT) and (FDfltSrc = 'Combination') and
           (copy(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 3), 1, 2) = 'Cl')) and
           (IsFMDateTime(Piece(cboPatient.Items[cboPatient.ItemIndex], U, 8))) then
       with cboPatient do // "Default" combination, clinic pt.
  begin
    Encounter.Location := StrToIntDef(Piece(Items[ItemIndex], U, 7), 0); // Piece 7 is ^SC( location IEN in this case.
    Encounter.DateTime := MakeFMDateTime(Piece(Items[ItemIndex], U, 8));
  end
  else if Patient.Inpatient then // Everything else:
  begin
    Encounter.Inpatient := True;
    Encounter.Location := Patient.Location;
    Encounter.DateTime := Patient.AdmitTime;
    Encounter.VisitCategory := 'H';
  end;
  if User.IsProvider then Encounter.Provider := User.DUZ;

  GetBAStatus(Encounter.Provider,Patient.DFN);
  //HDS00005025
  if BILLING_AWARE then
    if Assigned(UBAGLOBALS.BAOrderList) then UBAGLOBALS.BAOrderList.Clear;
  FUserCancelled := FALSE;
  Close;
end;

procedure TfrmPtSel.cmdCancelClick(Sender: TObject);
begin
  // Leave Patient object unchanged
  FUserCancelled := TRUE;
  Close;
end;

procedure TfrmPtSel.cmdProcessClick(Sender: TObject);
var
  AFollowUp, i, infocount: Integer;
  enableclose: boolean;
  ADFN, x, RecordID, XQAID: string;  //*DFN*
begin
  enableclose := false;
  with lstvAlerts do
  begin
    if SelCount <= 0 then Exit;

    // Count information-only selections for gauge
    infocount := 0;
    for i:= 0 to Items.Count - 1 do if Items[i].Selected then
      if (Items[i].SubItems[0] = 'I') then Inc(infocount);

    if infocount >= 1 then
    begin
      ggeInfo.Visible := true; (*BOB*)
      ggeInfo.MaxValue := infocount;
    end;

    for i := 0 to Items.Count - 1 do if Items[i].Selected then
      { Items[i].Selected    =  Boolean TRUE if item is selected
            "   .Caption     =  Info flag ('I')
            "   .SubItems[0] =  Patient ('ABC,PATIE (A4321)')
            "   .    "   [1] =  Patient location ('[2B]')
            "   .    "   [2] =  Alert urgency level ('HIGH, Moderate, low')
            "   .    "   [3] =  Alert date/time ('2002/12/31@12:10')
            "   .    "   [4] =  Alert message ('New order(s) placed.')
            "   .    "   [5] =  Forwarded by/when
            "   .    "   [6] =  XQAID ('OR,66,50;1416;3021231.121024')
                                       'TIU6028;1423;3021203.09')
            "   .    "   [7] =  Remove without processing flag ('YES')
            "   .    "   [8] =  Forwarding comments (if applicable) }
    begin
      XQAID := Items[i].SubItems[6];
      RecordID := Items[i].SubItems[0] + ': ' + Items[i].SubItems[4] + '^' + XQAID;
      //RecordID := patient: alert message^XQAID  ('ABC,PATIE (A4321): New order(s) placed.^OR,66,50;1416;3021231.121024')
      if Items[i].Caption = 'I' then
    // If Caption is 'I' delete the information only alert.
        begin
          ggeInfo.Progress := ggeInfo.Progress + 1;
          DeleteAlert(XQAID);
        end
      else if Piece(XQAID, ',', 1) = 'OR' then
    //  OR,16,50;1311;2980626.100756
        begin
          ADFN := Piece(XQAID, ',', 2);  //*DFN*
          AFollowUp := StrToIntDef(Piece(Piece(XQAID, ';', 1), ',', 3), 0);
          Notifications.Add(ADFN, AFollowUp, RecordID);
          enableclose := true;
        end
      else if Copy(XQAID, 1, 6) = 'TIUERR' then
        InfoBox(Piece(RecordID, U, 1) + #13#10#13#10 +
           'The CPRS GUI cannot yet process this type of alert.  Please use List Manager.',
           'Unable to Process Alert', MB_OK)
      else if Copy(XQAID, 1, 3) = 'TIU' then
    //   TIU6028;1423;3021203.09
        begin
          x := GetTIUAlertInfo(XQAID);
          if Piece(x, U, 2) <> '' then
            begin
              ADFN := Piece(x, U, 2);  //*DFN*
              AFollowUp := StrToIntDef(Piece(Piece(x, U, 3), ';', 1), 0);
              Notifications.Add(ADFN, AFollowUp, RecordID + '^^' + Piece(x, U, 3));
              enableclose := true;
            end
          else
            DeleteAlert(XQAID);
        end
      else  //other alerts cannot be processed
        InfoBox('This alert cannot be processed by the CPRS GUI.', Items[i].SubItems[0] + ': ' + Items[i].SubItems[4], MB_OK);    end;
    if enableclose = true then
      Close
    else
      begin
        ggeInfo.Visible := False;
        // Update notification list:
        lstvAlerts.Clear;
        AlertList;
        //display alerts sorted according to parameter settings:
        FsortCol := -1;     //CA - display alerts in correct sort
        FormShow(Sender);
      end;
    if Items.Count = 0 then ShowButts(False);
    if SelCount <= 0 then ShowButts(False);
  end;
  GetBAStatus(User.DUZ,Patient.DFN);
end;

procedure TfrmPtSel.cmdSaveListClick(Sender: TObject);
begin
  frmPtSelOptns.cmdSaveListClick(Sender);
end;

procedure TfrmPtSel.cmdProcessInfoClick(Sender: TObject);
  // Select and process all items that are information only in the lstvAlerts list box.
var
  i: integer;
begin
  if lstvAlerts.Items.Count = 0 then Exit;
  if InfoBox('You are about to process all your INFORMATION alerts.' + CRLF
    + 'These alerts will not be presented to you for individual' + CRLF
    + 'review and they will be permanently removed from your' + CRLF
    + 'alert list.  Do you wish to continue?',
    'Warning', MB_YESNO or MB_ICONWARNING) = IDYES then
  begin
    for i := 0 to lstvAlerts.Items.Count-1 do
      lstvAlerts.Items[i].Selected := False;  //clear any selected alerts so they aren't processed
    for i := 0 to lstvAlerts.Items.Count-1 do
      if lstvAlerts.Items[i].Caption = 'I' then
        lstvAlerts.Items[i].Selected := True;
    cmdProcessClick(Self);
    ShowButts(False);
  end;
end;

procedure TfrmPtSel.cmdProcessAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lstvAlerts.Items.Count-1 do
    lstvAlerts.Items[i].Selected := True;
  cmdProcessClick(Self);
  ShowButts(False);
end;

procedure TfrmPtSel.lstvAlertsDblClick(Sender: TObject);
begin
  cmdProcessClick(Self);
end;

procedure TfrmPtSel.cmdForwardClick(Sender: TObject);
var
  i: integer;
  Alert: String;
begin
  try
    with lstvAlerts do
      begin
        if SelCount <= 0 then Exit;
        for i := 0 to Items.Count - 1 do
          if Items[i].Selected then
            try
              Alert := Items[i].SubItems[6] + '^' + Items[i].Subitems[0] + ': ' +
                 Items[i].Subitems[4];
              ForwardAlertTo(Alert);
            finally
              Items[i].Selected := False;
            end;
      end;
  finally
    if lstvAlerts.SelCount <= 0 then ShowButts(False);
  end;
end;

procedure TfrmPtSel.cmdRemoveClick(Sender: TObject);
var
  i: integer;
begin
  with lstvAlerts do
    begin
      if SelCount <= 0 then Exit;
      for i := 0 to Items.Count - 1 do
        if Items[i].Selected then
          begin
            if Items[i].SubItems[7] = '1' then  //remove flag enabled
              DeleteAlertforUser(Items[i].SubItems[6])
            else InfoBox('This alert cannot be removed.', Items[i].SubItems[0] + ': ' + Items[i].SubItems[4], MB_OK);
          end;
    end;
  lstvAlerts.Clear;
  AlertList;
  FsortCol := -1;     //CA - display alerts in correct sort
  FormShow(Sender);  //CA - display alerts in correct sort
  if lstvAlerts.Items.Count = 0 then ShowButts(False);
  if lstvAlerts.SelCount <= 0 then ShowButts(False);
end;

procedure TfrmPtSel.FormDestroy(Sender: TObject);
begin
  SaveUserBounds(Self);
  frmFrame.EnduringPtSelSplitterPos := pnlPtSel.Height;
 end;

procedure TfrmPtSel.pnlPtSelResize(Sender: TObject);
begin
  frmPtSelDemog.Left := cboPatient.Left + cboPatient.Width + 9;
//  frmPtSelDemog.Width := frmPtSel.CmdCancel.Left - frmPtSelDemog.Left-2;// before vwpt enhancements pnlPtSel.Width - frmPtSelDemog.Left - 2;
  frmPtSelOptns.Width := cboPatient.Left-8;
end;

procedure TfrmPtSel.Loaded;
begin
  inherited;
// This needs to be in Loaded rather than FormCreate or the TORAutoPanel resize logic breaks.
  //vwpt enhancements
  CmdOK.parent := pnlPtSel;
  CmdCancel.parent  :=  pnlPtSel;
  //end vwpt
  frmPtSelDemog := TfrmPtSelDemog.Create(Self);  // Was application - kcm
  with frmPtSelDemog do
  begin
    parent := pnlPtSel;
    Top := 4; //before vwpt change was 65
    Left := cboPatient.Left + cboPatient.Width + 9;
    //Width := pnlPtSel.Width - Left - 2; //before vwpt change
    Width := CmdCancel.Left - Left-2  ;
    TabOrder := cmdCancel.TabOrder + 1;  //Place after cancel button
    Show;
  end;

  with RadioGroup1 do
  begin
      parent := pnlPtSel;
      TabOrder  := cmdCancel.TabOrder + 2;
      Show;
  end;
  //end vwpt enhancements
  frmPtSelOptns := TfrmPtSelOptns.Create(Self);  // Was application - kcm
  with frmPtSelOptns do
  begin
    parent := pnlPtSel;
    Top := 4;
    Left := 4;
    Width := cboPatient.Left-8;
    SetCaptionTopProc := SetCaptionTop;
    SetPtListTopProc  := SetPtListTop;
    if RPLProblem then
      Exit;
    TabOrder := cmdSaveList.TabOrder;  //Put just before save default list button
    Show;
  end;
  FLastPt := '';
  //Begin at alert list, or patient listbox if no alerts
  if lstvAlerts.Items.Count = 0 then
    ActiveControl := cboPatient;
end;

procedure TfrmPtSel.RPLDisplay;
begin

// Make unneeded components invisible:
cmdSaveList.visible := false;
frmPtSelOptns.visible := false;

end;

procedure TfrmPtSel.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if (IsRPL = '1') then                          // Deal with restricted patient list users.
  KillRPLPtList(RPLJob);                       // Kills server global data each time.
                                               // (Global created by MakeRPLPtList in rCore.)
end;

procedure TfrmPtSel.cboPatientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('D')) and (ssCtrl in Shift) then begin
    Key := 0;
    frmPtSelDemog.ToggleMemo;
  end;
end;

function ConvertDate(var thisList: TStringList; listIndex: integer) : string;
{
 Convert date portion from yyyy/mm/dd to mm/dd/yyyy
}
var
  //thisListItem: TListItem;
  thisDateTime: string[16];
  tempDt: string;
  tempYr: string;
  tempTime: string;
  newDtTime: string;
  k: byte;
  piece1: string;
  piece2: string;
  piece3: string;
  piece4: string;
  piece5: string;
  piece6: string;
  piece7: string;
  piece8: string;
  piece9: string;
  piece10: string;
  piece11: string;
begin
  piece1 := '';
  piece2 := '';
  piece3 := '';
  piece4 := '';
  piece5 := '';
  piece6 := '';
  piece7 := '';
  piece8 := '';
  piece9 := '';
  piece10 := '';
  piece11 := '';

  piece1 := Piece(thisList[listIndex],U,1);
  piece2 := Piece(thisList[listIndex],U,2);
  piece3 := Piece(thisList[listIndex],U,3);
  piece4 := Piece(thisList[listIndex],U,4);
  //piece5 := Piece(thisList[listIndex],U,5);
  piece6 := Piece(thisList[listIndex],U,6);
  piece7 := Piece(thisList[listIndex],U,7);
  piece8 := Piece(thisList[listIndex],U,8);
  piece9 := Piece(thisList[listIndex],U,9);
  piece10 := Piece(thisList[listIndex],U,1);

  thisDateTime := Piece(thisList[listIndex],U,5);

  tempYr := '';
  for k := 1 to 4 do
   tempYr := tempYr + thisDateTime[k];

  tempDt := '';
  for k := 6 to 10 do
   tempDt := tempDt + thisDateTime[k];

  tempTime := '';
  //Use 'Length' to prevent stuffing the control chars into the date when a trailing zero is missing
  for k := 11 to Length(thisDateTime) do //16 do
   tempTime := tempTime + thisDateTime[k];

  newDtTime := '';
  newDtTime := newDtTime + tempDt + '/' + tempYr + tempTime;
  piece5 := newDtTime;

  Result := piece1 +U+ piece2 +U+ piece3 +U+ piece4 +U+ piece5 +U+ piece6 +U+ piece7 +U+ piece8 +U+ piece9 +U+ piece10 +U+ piece11;
end;

procedure TfrmPtSel.AlertList;
var
  List: TStringList;
  NewItem: TListItem;
  I,J: Integer;
  Comment: String;
begin
  // Load the items
  lstvAlerts.Items.Clear;
  List := TStringList.Create;
  NewItem := nil;
  try
     LoadNotifications(List);
     for I := 0 to List.Count - 1 do
       begin
    //   List[i] := ConvertDate(List, i);  //cla commented out 8/9/04 CQ #4749

         if Piece(List[I], U, 1) <> 'Forwarded by: ' then
           begin
              NewItem := lstvAlerts.Items.Add;
              NewItem.Caption := Piece(List[I], U, 1);
              for J := 2 to DelimCount(List[I], U) + 1 do
                 NewItem.SubItems.Add(Piece(List[I], U, J));
           end
         else   //this list item is forwarding information
           begin
             NewItem.SubItems[5] := Piece(List[I], U, 2);
             Comment := Piece(List[I], U, 3);
             if Length(Comment) > 0 then NewItem.SubItems[8] := 'Fwd Comment: ' + Comment;
           end;
       end;
   finally
      List.Free;
   end;
   with lstvAlerts do
     begin
        Columns[0].Width := 30;          //Info                 Caption
        Columns[1].Width := 120;         //Patient              SubItems[0]
        Columns[2].Width := 60;          //Location             SubItems[1]
        Columns[3].Width := 60;          //Urgency              SubItems[2]
        Columns[4].Width := 110;         //Alert Date/Time      SubItems[3]
        Columns[5].Width := 312;         //Message Text         SubItems[4]
        Columns[6].Width := 210;         //Forwarded By/When    SubItems[5]
     //Items not displayed in Columns:     XQAID                SubItems[6]
     //                                    Remove w/o process   SubItems[7]
     //                                    Forwarding comments  SubItems[8]
     end;
  //with lstvAlerts do      ca comment out 12/24/03 to prevent default selection of first alert on list
    //if (ItemIndex = -1) and (Items.Count > 0) then
      //ItemIndex := 0;
end;

procedure TfrmPtSel.lstvAlertsColumnClick(Sender: TObject; Column: TListColumn);
begin

  if ((FsortCol = Column.Index) and (not SortViaKeyboard)) then
     FsortAscending := not FsortAscending;

  if FsortAscending then
     FsortDirection := 'F'
  else
     FsortDirection := 'R';

  FsortCol := Column.Index;

  if FsortCol = 4 then
    ReformatAlertDateTime //  hds7397- ge 2/6/6 sort and display date/time column correctly - as requested
  else
     lstvAlerts.AlphaSort;
  SortViaKeyboard := false;


  //Set the Notifications sort method to last-used sort-type
  //ie., user clicked on which column header last use of CPRS?
  case Column.Index of
     0: rCore.SetSortMethod('I', FsortDirection);
     1: rCore.SetSortMethod('P', FsortDirection);
     2: rCore.SetSortMethod('L', FsortDirection);
     3: rCore.SetSortMethod('U', FsortDirection);
     4: rCore.SetSortMethod('D', FsortDirection);
     5: rCore.SetSortMethod('M', FsortDirection);
     6: rCore.SetSortMethod('F', FsortDirection);
  end;
end;

procedure TfrmPtSel.lstvAlertsCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if not(Sender is TListView) then Exit;
  if FsortAscending then
    begin
      if FsortCol = 0 then Compare := CompareStr(Item1.Caption, Item2.Caption)
      else Compare := CompareStr(Item1.SubItems[FsortCol - 1], Item2.SubItems[FsortCol - 1]);
    end
  else
    begin
      if FsortCol = 0 then Compare := CompareStr(Item2.Caption, Item1.Caption)
      else Compare := CompareStr(Item2.SubItems[FsortCol - 1], Item1.SubItems[FsortCol - 1]);
    end;
end;

function TfrmPtSel.DupLastSSN(const DFN: string): Boolean;
var
  i: integer;
  frmPtDupSel: tForm;
begin
  Result := False;

  // Check data on server for duplicates:
  CallV('DG CHK BS5 XREF ARRAY', [DFN]);
  if (RPCBrokerV.Results[0] <> '1') then // No duplicates found.
    Exit;
  Result := True;
  PtStrs := TStringList.Create;
  with RPCBrokerV do if Results.Count > 0 then
  begin
    for i := 1 to Results.Count - 1 do
    begin
      if Piece(Results[i], U, 1) = '1' then
        PtStrs.Add(Piece(Results[i], U, 2) + U + Piece(Results[i], U, 3) + U +
                   FormatFMDateTimeStr('mmm dd,yyyy', Piece(Results[i], U, 4)) + U +
                   Piece(Results[i], U, 5));
    end;
  end;

  // Call form to get user's selection from expanded duplicate pt. list (resets DupDFN variable if applicable):
  DupDFN := DFN;
  frmPtDupSel:= TfrmDupPts.Create(Application);
  with frmPtDupSel do
    begin
      try
        ShowModal;
      finally
        frmPtDupSel.Release;
      end;
    end;
end;

procedure TfrmPtSel.ShowFlagInfo;
begin
  if (Pos('*SENSITIVE*',frmPtSelDemog.lblPtSSN.Caption)>0) then
  begin
//    pnlPrf.Visible := False;
    Exit;
  end;
  if (flastpt <> cboPatient.ItemID) then
  begin
    HasActiveFlg(FlagList, HasFlag, cboPatient.ItemID);
    flastpt := cboPatient.ItemID;
  end;
  if HasFlag then
  begin
//    lstFlags.Items.Assign(FlagList);
//    pnlPrf.Visible := True;
  end
  //else pnlPrf.Visible := False;
end;

procedure TfrmPtSel.lstFlagsClick(Sender: TObject);
begin
{  if lstFlags.ItemIndex >= 0 then
     ShowFlags(lstFlags.ItemID); }
end;

procedure TfrmPtSel.lstFlagsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    lstFlagsClick(Self);
end;

procedure TfrmPtSel.lstvAlertsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if lstvAlerts.SelCount <= 0 then ShowButts(False)
  else ShowButts(True);
  GetBAStatus(User.DUZ,Patient.DFN);
end;

procedure TfrmPtSel.ShowButts(ShowButts: Boolean);
begin
  cmdProcess.Enabled := ShowButts;
  cmdRemove.Enabled := ShowButts;
  cmdForward.Enabled := ShowButts;
end;

procedure TfrmPtSel.lstvAlertsInfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: String);
begin
  InfoTip := Item.SubItems[8];
end;

procedure TfrmPtSel.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
{
var
  keyValue: word;
}  
begin{
  keyValue := MapVirtualKey(Key,2);
  if keyValue = VK_RETURN then
     cmdProcessClick(Sender);
}
end;

procedure TfrmPtSel.lstvAlertsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
{
 //KW
 508: Allow non-sighted users to sort Notifications using Ctrl + <key>
 Numbers in case stmnt are ASCII values for character keys.
}
begin
  if lstvAlerts.Focused then
     begin
     SortViaKeyboard := true;
     case Key of
        VK_RETURN: cmdProcessClick(Sender); //Process all selected alerts
        73,105: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[0]); //I,i
        80,113: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[1]); //P,p
        76,108: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[2]); //L,l
        85,117: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[3]); //U,u
        68,100: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[4]); //D,d
        77,109: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[5]); //M,m
        70,102: if (ssCtrl in Shift) then lstvAlertsColumnClick(Sender, lstvAlerts.Columns[6]); //F,f
     end;
     end;
end;

procedure TfrmPtSel.FormShow(Sender: TObject);
{
 //KW
 Sort Alerts by last-used method for current user
}
var
  sortResult: string;
  sortMethod: string;
begin
  sortResult := rCore.GetSortMethod;
  sortMethod := Piece(sortResult, U, 1);
  FsortDirection := Piece(sortResult, U, 2);
  if FsortDirection = 'F' then
     FsortAscending := true
  else
     FsortAscending := false;

  case sortMethod[1] of
     'I','i': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[0]);
     'P','p': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[1]);
     'L','l': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[2]);
     'U','u': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[3]);
     'D','d': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[4]);
     'M','m': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[5]);
     'F','f': lstvAlertsColumnClick(Sender, lstvAlerts.Columns[6]);
  end;
end;

//hds7397- ge 2/6/6 sort and display date/time column correctly - as requested
procedure  TfrmPtSel.ReformatAlertDateTime;
var
  I,J: Integer;
  inDateStr, holdDayTime,srtDate: String;
begin
  // convert date to yyyy/mm/dd prior to sort.
 for J := 0 to lstvAlerts.items.count -1 do
  begin
    inDateStr := '';
    srtDate := '';
    holdDayTime := '';
    inDateStr := lstvAlerts.Items[j].SubItems[3];
    srtDate := ( (Piece( Piece(inDateStr,'/',3), '@',1)) + '/' + Piece(inDateStr,'/',1) + '/' + Piece(inDateStr,'/',2) +'@'+ Piece(inDateStr, '@',2) );
    lstvAlerts.Items[j].SubItems[3] := srtDate;
  end;
   //sort the listview records by date
  lstvAlerts.AlphaSort;
 // loop thru lstvAlerts change date to yyyy/mm/dd
 // sort list
 // change alert date/time back to mm/dd/yyyy@time for display
  for I := 0 to lstvAlerts.items.Count -1 do
   begin
     inDateStr := '';
     srtDate := '';
     holdDayTime := '';
     inDateStr :=   lstvAlerts.Items[i].SubItems[3];
     holdDayTime := Piece(inDateStr,'/',3);  // dd@time
     lstvAlerts.Items[i].SubItems[3] := (Piece(inDateStr, '/', 2) + '/' + Piece(holdDayTime, '@',1) +'/'
                                            + Piece(inDateStr,'/',1) + '@' + Piece(holdDayTime,'@',2) );
  end;
end;


//vwpt enhanced //
procedure TfrmPtSel.onclick1(Sender: TObject);  //click on RadioGroup1
var index :integer;

begin
if RadioGroup1.ItemIndex >0 then
 begin
     itimson := 1  ;
     cboPatient.Text := '' ;
     if (frmPtSelOptns.radAll.Checked <> True)and (frmPtSelOptns.radDflt.Checked <> True) then
     begin
        radiogrp1index :=0  ;
        RadioGroup1.ItemIndex  := 0;
        RadioGroup1.SetFocus;
        RadioGroup1.Refresh;
     end
     else
     begin
          index := RadioGroup1.ItemIndex;
          radiogrp1index := index;
          cboPatient.Hint  := 'Enter ' + piece(RadioGroup1.Items[index],'&',2);
     end ;
 end
 else
 begin
       //itimson := 0;
        cboPatient.Hint :=  'Enter name,Full SSN,Last4(x1234),''HRN'',DOB,or Phone#'  ;
        radiogrp1index := 0;
 end;

end;
 //end vwpt enhanced
Initialization
  SortViaKeyboard := false;

end.
