unit fODRad;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ORCtrls, fODBase, ORFn, ExtCtrls,
  ComCtrls, uConst, ORDtTm;

type
  TfrmODRad = class(TfrmODBase)
    lblDrug: TLabel;
    cboProcedure: TORComboBox;
    cboAvailMod: TORComboBox;
    lblAvailMod: TLabel;
    cmdRemove: TButton;
    calRequestDate: TORDateBox;
    cboUrgency: TORComboBox;
    cboTransport: TORComboBox;
    cboCategory: TORComboBox;
    chkPreOp: TCheckBox;
    cboSubmit: TORComboBox;
    lstLastExam: TORListBox;
    lblReason: TLabel;
    memReason: TCaptionMemo;
    lstSelectMod: TORListBox;
    lblSelectMod: TLabel;
    lblRequestDate: TLabel;
    lblUrgency: TLabel;
    lblTransport: TLabel;
    lblCategory: TLabel;
    lblSubmit: TLabel;
    lblLastExam: TLabel;
    lblAskSubmit: TLabel;
    chkIsolation: TCheckBox;
    FRadCommonCombo: TORListBox;
    lblImType: TLabel;
    cboImType: TORComboBox;
    calPreOp: TORDateBox;
    lblPreOp: TLabel;
    pnlLeft: TORAutoPanel;
    pnlRight: TORAutoPanel;
    pnlHandR: TPanel;
    grpPregnant: TGroupBox;
    radPregnant: TRadioButton;
    radPregnantNo: TRadioButton;
    radPregnantUnknown: TRadioButton;
    procedure cboProcedureNeedData(Sender: TObject;
              const StartFrom: string; Direction, InsertAt: Integer);
    procedure cboAvailModMouseClick(Sender: TObject);
    procedure cmdRemoveClick(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure cboProcedureSelect(Sender: TObject);
    procedure SetModifierList;
    procedure cboCategoryChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboImTypeChange(Sender: TObject);
    procedure memReasonExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cboAvailModKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure calPreOpChange(Sender: TObject);
    procedure cmdAcceptClick(Sender: TObject);
    procedure cboProcedureExit(Sender: TObject);
    procedure cboImTypeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkIsolationExit(Sender: TObject);
    procedure calPreOpExit(Sender: TObject);
    procedure cboImTypeDropDownClose(Sender: TObject);
  private
    FLastRadID: string;
    FEditCopy: boolean;
    FPreOpDate: string;
    FEvtDelayDiv: string;
    FPredefineOrder: boolean;
    ImageTypeChanged : boolean;
    FFormFirstOpened: boolean;
    function NoPregnantSelection : Boolean;
    procedure ImageTypeChange;
    procedure FormFirstOpened(Sender: TObject);
  protected
    procedure InitDialog; override;
    procedure Validate(var AnErrMsg: string); override;
    procedure SetDefaultPregant;
  public
    procedure SetupDialog(OrderAction: Integer; const ID: string); override;
  end;

implementation

{$R *.DFM}

uses rODBase, rODRad, rOrders, uCore, rCore, fODRadApproval, fODRadConShRes, fLkUpLocation, fFrame,
  uFormMonitor;

const
  TX_NO_PROC          = 'An Imaging Procedure must be specified.'    ;
  TX_NO_MODE          = 'A mode of transport must be selected.';
  TX_NO_REASON        = 'A History & Reason for Exam must be entered.'  ;
  TX_NO_DATE          = 'Unable to evaluate request date.' ;
  TX_APPROVAL_REQUIRED= 'This procedure requires Radiologist approval.' ;
  TX_NO_SOURCE        = 'A source must be specified for Contract/Sharing/Research patients.';
  TX_NO_AGREE         = 'There are no active agreements of the type specified.';
  TX_NO_AGREE_CAP     = 'No Agreements on file';
  TX_ORD_LOC          = 'Ordering location must be specified if patient type and order category do not match.';
  TC_REQ_LOC          = 'Location Required';
  TX_LOC_ORDER        = 'The selected location will be used to determine the ordering location ' +
                        'when the patient location does not match the specified category.';
  TX_NO_CATEGORY      = 'A category of examination must be specified.';
  TX_NO_IMAGING_LOCATION = 'A  "Submit To"  location must be specified.';

var
  Radiologist, Contract, Research: string ;
  AName, IsPregnant: string;
  ALocation, AType: integer;
  
{ TfrmODBase common methods }

procedure TfrmODRad.SetupDialog(OrderAction: Integer; const ID: string);
var
  tmpResp: TResponse;
  i: integer;
begin
  inherited;
  if OrderAction in [ORDER_COPY, ORDER_EDIT, ORDER_QUICK] then with Responses do
  begin
    if (OrderAction = ORDER_QUICK) or (OrderAction = ORDER_EDIT) or (OrderAction = ORDER_COPY) then
      FPredefineOrder := True;
    FEditCopy := True;
    Changing := True;
    with cboImType do
      begin
        Items.Assign(SubsetOfImagingTypes);
        for i := 0 to Items.Count-1 do
          if StrToIntDef(Piece(Items[i],U,4), 0) = DisplayGroup then ItemIndex := i;
        if OrderAction = ORDER_EDIT then
        begin
          Enabled := False;
          Color := clBtnFace;
        end;
     end;
    if Self.EvtID>0 then
      FEvtDelayDiv := GetEventDiv1(IntToStr(Self.EvtID));
    CtrlInits.LoadDefaults(ODForRad(Patient.DFN, FEvtDelayDiv, DisplayGroup));   // ODForRad returns TStrings with defaults
    InitDialog;
    SetControl(cboProcedure,       'ORDERABLE', 1);
    Changing := True;
    SetModifierList;
    SetControl(cboUrgency,         'URGENCY', 1);
    SetControl(cboTransport,       'MODE', 1);
    SetControl(cboSubmit,          'IMLOC', 1);
    SetControl(cboCategory,        'CLASS', 1);
    SetControl(memReason,          'COMMENT', 1);
    SetControl(chkIsolation,       'YN', 1);
    SetControl(radPregnant,        'PREGNANT', 1);
    SetControl(calPreOp,           'PREOP', 1);
    tmpResp := FindResponseByName('START',1);
    if tmpResp <> nil then
      begin
        if ContainsAlpha(tmpResp.IValue) then
          calRequestDate.Text := tmpResp.IValue
        else
          calRequestDate.FMDateTime := StrToFMDateTime(tmpResp.IValue);
      end;
    tmpResp := FindResponseByName('PROVIDER',1);
    if tmpResp <> nil then with tmpResp do if Length(EValue)>0 then Radiologist := IValue + '^' + EValue;
    if (cboCategory.ItemID = 'C') or (cboCategory.ItemID = 'S') then
      begin
        tmpResp := FindResponseByName('CONTRACT',1);
        if tmpResp <> nil then with tmpResp do
         if Length(EValue)>0 then
          begin
            Contract := IValue + '^' + EValue;
            Research := '';
          end;
      end;
    if cboCategory.ItemID = 'R' then
      begin
        tmpResp := FindResponseByName('RESEARCH',1);
        if tmpResp <> nil then with tmpResp do
         if Length(EValue)>0 then
          begin
            Research := EValue;
            Contract := '';
          end;
      end;
    //hds00007460
    tmpResp := FindResponseByName('PREGNANT',1);
    if tmpResp <> nil then
       if Length(tmpResp.EValue)>0 then
       begin
          IsPregnant := tmpResp.EValue;
          if IsPregnant = 'YES' then
             radPregnant.Checked := True
          else
          if IsPregnant = 'NO' then
             radPregnantNo.Checked := True
          else
          if IsPregnant = 'UNKNOWN' then
             radPregnantUnknown.Checked := True;
       end;
    //hds00007460
    Changing := False;
    FEditCopy := False;
    OrderMessage(ImagingMessage(cboProcedure.ItemIEN)) ;
    ControlChange(Self);
    FPredefineOrder := False;
  end;
end;

procedure TfrmODRad.InitDialog;
var
   i: integer;
   tmplst: TStringList;
begin
  if not FEditCopy then inherited;

  FPreOpDate := '';
  FLastRadID := '';
  Radiologist := '';
  Contract := '';
  Research := '';
  ALocation := 0;
  AName := '';
  AType := 0;
  FEvtDelayDiv := '';
  if (Self.EvtID > 0 ) and (FEvtDelayDiv = '') then
    FEvtDelayDiv := GetEventDiv1(IntToStr(Self.EvtID));
  with CtrlInits do
   begin
    SetControl(cboProcedure, 'ShortList');
    if cboProcedure.Items.Count > 0 then cboProcedure.InsertSeparator;
    SetControl(FRadCommonCombo, 'Common Procedures');
    for i := 0 to FRadCommonCombo.Items.Count-1 do
      cboProcedure.Items.Add(FRadCommonCombo.Items[i]);
    if FRadCommonCombo.Items.Count>0 then cboProcedure.InsertSeparator;

    calRequestDate.Text := 'TODAY';
    SetControl(cboAvailMod, 'Modifiers');
    SetControl(cboUrgency, 'Urgencies');
    SetControl(cboTransport, 'Transport');
    with cboTransport do if OrderForInpatient
      then SelectByID('W')
      else SelectByID('A');
    SetControl(cboCategory, 'Category');
    with cboCategory do if OrderForInpatient
      then SelectByID('I')
      else SelectByID('O');
    SetControl(cboSubmit, 'Submit to');
    SetControl(lblAskSubmit,'Ask Submit') ;
    if (cboSubmit.Items.Count = 0) then
      begin
        cboSubmit.ItemIndex := -1;
        lblSubmit.Enabled := False;
        cboSubmit.Enabled := False;
        cboSubmit.Font.Color := clGrayText;
      end
    else if (lblAskSubmit.Caption = 'YES') then
      begin
        if (cboSubmit.Items.Count > 1) then
          begin
            tmplst := TStringList.Create;
            try
              tmplst.Assign(cboSubmit.Items);
              SortByPiece(tmplst, U, 2);
              cboSubmit.Items.Assign(tmplst);
            finally
              tmplst.Free;
            end;
            cboSubmit.ItemIndex := -1 ;
            lblSubmit.Enabled := True;
            cboSubmit.Enabled := True;
            cboSubmit.Font.Color := clWindowText;
          end
        else
          begin
            cboSubmit.ItemIndex := 0;
            lblSubmit.Enabled := False;
            cboSubmit.Enabled := False;
            cboSubmit.Font.Color := clGrayText;
          end;
      end
    else if lblAskSubmit.Caption = 'NO' then
      begin
        if (cboSubmit.Items.Count = 1) then
          cboSubmit.ItemIndex := 0
        else
          cboSubmit.ItemIndex := -1 ;
        lblSubmit.Enabled := False;
        cboSubmit.Enabled := False;
        cboSubmit.Font.Color := clGrayText;
      end;
    chkIsolation.Checked := PatientOnIsolationProcedures(Patient.DFN) ;
    SetControl(lstLastExam, 'Last 7 Days');
   end;
  lstSelectMod.Clear;
  ControlChange(Self);
  StatusText('Initializing Long List');
  cboProcedure.InitLongList('') ;
  StatusText('');
end;

procedure TfrmODRad.ControlChange(Sender: TObject);
var
  i: integer ;
begin
  inherited;
  if Changing then Exit;
  Responses.Clear;
  with cboProcedure do
    if ItemIEN > 0 then Responses.Update('ORDERABLE', 1, ItemID, Text)
    else Responses.Update('ORDERABLE', 1, ''    , '');
  //with calRequestDate do if FMDateTime > 0 then     RPC call on EVERY character typed in REASON box!!!!  (v15)
  with calRequestDate do if Length(Text) > 0 then
    Responses.Update('START', 1, Text, Text)
    else Responses.Update('START', 1, '', '') ;
  with cboUrgency do if Length(ItemID)   > 0 then Responses.Update('URGENCY',   1, ItemID, Text);
  with cboTransport do if Length(ItemID) > 0 then Responses.Update('MODE',      1, ItemID, Text);
  with cboCategory do if Length(ItemID)  > 0 then Responses.Update('CLASS',     1, ItemID, Text);
  with cboSubmit do if Length(ItemID)    > 0 then Responses.Update('IMLOC',     1, ItemID, Text);
  with radPregnant do if Checked                then Responses.Update('PREGNANT',  1, 'Y'   , 'Yes')
                 else if not Enabled         then Responses.Update('PREGNANT',  1, ''    , '');
  with radPregnantNo do if Checked           then Responses.Update('PREGNANT',  1, 'N'   , 'No');
  with radPregnantUnknown do if Checked      then Responses.Update('PREGNANT',  1, 'U'   , 'Unknown');
  with chkIsolation do if Checked            then Responses.Update('YN',        1, '1'   , 'Yes')
                                             else Responses.Update('YN',        1, '0'   , 'No');
  with calPreOp do if Length(Text) > 0       then Responses.Update('PREOP',     1, FPreOpDate, Text);
  with memReason do if GetTextLen        > 0 then Responses.Update('COMMENT',   1, TX_WPTYPE, Text);
  with lstSelectMod do for i := 0 to Items.Count - 1 do
                                                  Responses.Update('MODIFIER',i+1, Piece(Items[i],U,1), Piece(Items[i],U,2));
  Responses.Update('PROVIDER',1, Piece(Radiologist,U,1),Piece(Radiologist,U,2)) ;
  Responses.Update('CONTRACT',1, Piece(Contract,U,1),Piece(Contract,U,2)) ;
  Responses.Update('RESEARCH',1, Research, Research) ;
  if ALocation > 0 then  Responses.Update('LOCATION', 1, IntToStr(ALocation), AName)
  else with Encounter do Responses.Update('LOCATION', 1, IntToStr(Location) , LocationName);
  memOrder.Text := Responses.OrderText;
end;

procedure TfrmODRad.Validate(var AnErrMsg: string);
var
  i, j: integer;
  AskLoc: boolean;

  procedure SetError(const x: string);
  begin
    if Length(AnErrMsg) > 0 then AnErrMsg := AnErrMsg + CRLF;
    AnErrMsg := AnErrMsg + x;
  end;

  procedure GetOrderingLocation(AType: integer);
  begin
    ALocation := 0;
    AName := '';
    LookupLocation(ALocation, AName, AType, TX_LOC_ORDER);
    if ALocation = 0 then
      begin
        SetError(TX_ORD_LOC);
        if OrderForInpatient then cboCategory.SelectByID('I') else cboCategory.SelectByID('O');
        with Encounter do Responses.Update('LOCATION', 1, IntToStr(Location) , LocationName);
      end
    else
      Responses.Update('LOCATION', 1, IntToStr(ALocation), AName);
  end;

begin
  inherited ;
  with cboProcedure do
    begin
      if ((Length(Text) = 0) or (ItemIEN <= 0)) then SetError(TX_NO_PROC)
      else
        begin
          if ItemID <> FLastRadID then Responses.Update('PROVIDER',1, '','');
          if (UpperCase(Piece(Items[ItemIndex],U,4))='Y') and (Radiologist='') then
           begin
             SelectApprovingRadiologist(Font.Size, Radiologist);
             if Radiologist='' then  SetError(TX_APPROVAL_REQUIRED)
             else
               Responses.Update('PROVIDER',1, Piece(Radiologist,U,1),Piece(Radiologist,U,2)) ;
           end ;
        end ;
    end;
  with cboCategory do
    begin
      AskLoc := True;
      if ((not Patient.Inpatient) and (Self.EvtType = 'A')) then
        AskLoc := False;
      if ItemID = '' then SetError(TX_NO_CATEGORY);
      if (CharAt(ItemID,1) in ['C','S']) and (Contract = '') then SetError(TX_NO_SOURCE);
      if (CharAt(ItemID, 1) = 'R')       and (Research = '') then SetError(TX_NO_SOURCE);
      if ((CharAt(ItemID, 1) = 'O') and (LocationType(Encounter.Location) = 'W')) then
      begin
        if AskLoc then
          GetOrderingLocation(LOC_OUTP);
      end
      else if ((CharAt(ItemID, 1) = 'I') and (not (LocationType(Encounter.Location) = 'W'))) then
      begin
        if AskLoc then
          GetOrderingLocation(LOC_INP);
      end;
    end;
  if Length(cboTransport.Text) = 0 then SetError(TX_NO_MODE);

  if Length(memReason.Text) < 2 then
    SetError(TX_NO_REASON)
  else
    begin
      j := 0;
      for i := 1 to Length(memReason.Text) do
        begin
          if memReason.Text[i] in ['A'..'Z','a'..'z','0'..'9'] then j := j + 1;
          if not (memReason.Text[i] in ['A'..'Z','a'..'z','0'..'9']) and (j > 0) then j := 0;
          if j = 2 then break;
        end;
      if j < 2 then SetError(TX_NO_REASON);
    end;

  with cboSubmit do
    if Enabled and (ItemIEN = 0)then SetError(TX_NO_IMAGING_LOCATION);

  with calRequestDate do
    if FMDateTime = 0 then SetError(TX_NO_DATE);

end;

procedure TfrmODRad.cboProcedureNeedData(Sender: TObject;
  const StartFrom: string; Direction, InsertAt: Integer);

begin
  inherited ;
  cboProcedure.ForDataUse(SubSetOfRadProcs(DisplayGroup, StartFrom, Direction));
 end;

procedure TfrmODRad.cboAvailModMouseClick(Sender: TObject);
var
  x: string;
  i: integer;
  Found: boolean;
begin
  if (cboAvailMod.Items.Count < 1) or  //GE 04-30-05 prevent list index out of bounds when empty
     (cboAvailMod.ItemIndex < 0) then Exit;
  Found := False;
  with cboAvailMod do x := Items[ItemIndex];
  with lstSelectMod do
    begin
      if Items.Count > 0 then
        for i := 0 to Items.Count - 1 do
          if Items[i] = x then Found := True;
      if not Found then
        begin
          Items.Add(x);
          SelectByID(Piece(x, U, 1));
        end;
    end;
  if Piece(x, '^', 2) = 'PORTABLE EXAM' then
    cboTransport.SelectByID('P');
  ControlChange(Sender);
end;

procedure TfrmODRad.cmdRemoveClick(Sender: TObject);
begin
  with lstSelectMod do
     if (SelCount = 0) or (ItemIndex < 0) then exit
     else
      begin
       if Piece(Items[ItemIndex], U, 2) = 'PORTABLE EXAM' then
         with cboTransport do if OrderForInpatient
           then SelectByID('W')
           else SelectByID('A');
       Items.Delete(ItemIndex);
       ItemIndex := Items.Count - 1;
       if ItemIndex > -1 then SelectByID(Piece(Items[ItemIndex], U, 1));
      end ;
  ControlChange(Sender);
end;

procedure TfrmODRad.cboProcedureSelect(Sender: TObject);
var
  tmpResp: TResponse;
begin
  inherited;
  with cboProcedure do
   begin
    if ItemID <> FLastRadID then
     begin
       FLastRadID := ItemID;
       if FPredefineOrder then
         FPredefineOrder := False;
     end else Exit;
    Changing := True;
    if Sender <> Self then
      Responses.Clear;       // Sender=Self when called from SetupDialog
    ClearControl(lstSelectMod);
    ClearControl(lstLastExam);
    //ClearControl(memReason);    {WPB-1298-30758}
    Changing := False;
    if CharAt(ItemID, 1) = 'Q' then
     with Responses do
       begin
         QuickOrder := ExtractInteger(ItemID);
         //SetControl(cboProcedure, 'ORDERABLE', 1);   //v22.9 - RV
         //SetModifierList;                            //v22.9 - RV
         FLastRadID := ItemID;
       end;
   end;
   with Responses do if QuickOrder > 0 then
   begin
    Changing := True;
    SetControl(cboProcedure,       'ORDERABLE', 1);
    SetModifierList;                                   //v22.9 - RV
    SetControl(lstSelectMod,       'MODIFIER', 1);
    SetControl(cboUrgency,         'URGENCY', 1);
    SetControl(cboSubmit,          'IMLOC', 1);
    SetControl(cboTransport,       'MODE', 1);
    SetControl(cboCategory,        'CLASS', 1);
    SetControl(memReason,          'COMMENT', 1);
    SetControl(chkIsolation,       'YN', 1);
    SetControl(radPregnant,        'PREGNANT', 1);
    SetControl(calPreOp   ,        'PREOP', 1);
    tmpResp := FindResponseByName('START',1);
    if tmpResp <> nil then
      begin
        if ContainsAlpha(tmpResp.IValue) then
          calRequestDate.Text := tmpResp.IValue
        else
          calRequestDate.FMDateTime := StrToFMDateTime(tmpResp.IValue);
      end;
    Changing := False;
   end;
  OrderMessage(ImagingMessage(cboProcedure.ItemIEN)) ;
  ControlChange(Self);
end;

procedure TfrmODRad.SetModifierList;
var
  i: integer;
  tmpResp: TResponse;
begin
  i := 1;
  tmpResp := Responses.FindResponseByName('MODIFIER',i);
  while tmpResp <> nil do
    begin
      lstSelectMod.Items.Add(tmpResp.IValue + '^' + tmpResp.EValue);
      if tmpResp.EValue = 'PORTABLE EXAM' then
        with cboTransport do SelectByID('P'); 
      Inc(i);
      tmpResp := Responses.FindResponseByName('MODIFIER',i);
    end ;
end;

procedure TfrmODRad.cboCategoryChange(Sender: TObject);
var
  Source: string;
begin
  inherited;
  if Contract <> '' then Source := Contract
  else if Research <> '' then Source := Research
  else Source := '';
  Contract := '';
  Research := '';
  with cboCategory do
    begin
      if CharAt(ItemID,1) in ['C','S','R'] then
        begin
          SelectSource(Font.Size, CharAt(ItemID,1), Source);
          if Source = '-1' then
            InfoBox(TX_NO_AGREE, TX_NO_AGREE_CAP, MB_OK or MB_ICONWARNING)
          else if CharAt(ItemID,1) in ['C','S'] then
            Contract := Source
          else if ItemID='R' then
            Research := Source;
        end;
    end;
  ControlChange(Self);
end;

procedure TfrmODRad.FormCreate(Sender: TObject);
begin
  FFormFirstOpened := TRUE;
  ImageTypeChanged := false;
  frmFrame.pnlVisit.Enabled := false;
  AutoSizeDisabled := True;
  inherited;
  memReason.Width := pnlHandR.ClientWidth;
  memReason.Height := pnlHandR.ClientHeight - memReason.Top;
  FillerID := 'RA';                     // does 'on Display' order check **KCM**
  StatusText('Loading Dialog Definition');
  Responses.Clear;
  DisplayGroup := 0;
  AllowQuickOrder := True;
  Responses.Dialog := 'RA OERR EXAM';              // loads formatting info
  StatusText('Loading Default Values');
  cboImType.Items.Assign(SubsetOfImagingTypes);
  if Self.EvtID>0 then
    FEvtDelayDiv := GetEventDiv1(IntToStr(Self.EvtID));
  PreserveControl(cboImType);
  PreserveControl(calRequestDate);
  PreserveControl(cboUrgency);
  PreserveControl(cboTransport);
  PreserveControl(cboSubmit);
  PreserveControl(cboCategory);
  PreserveControl(calPreOp);
  PreserveControl(memReason);      {WPB-1298-30758}
  if (Patient.Sex <> 'F') then
  begin
    radPregnant.Enabled := False;
    radPregnantNo.Enabled := False;
    radPregnantUnknown.Enabled := False;
  end else SetDefaultPregant;
  FormMonitorBringToFrontEvent(Self, FormFirstOpened);
end;

{Assigned to cbolmType.OnDropDownClose and cbolmType.OnExit, instead of
 cbolmType.OnChange, becuase when it is OnChange the delay interfers with
 Window-Eyes ability to read the drop-down Items.}
procedure TfrmODRad.cboImTypeChange(Sender: TObject);
begin
  inherited;
  ImageTypeChanged := true;
end;

procedure TfrmODRad.memReasonExit(Sender: TObject);
var
  AStringList: TStringList;
begin
  inherited;
  AStringList := TStringList.Create;
  try
    AStringList.Assign(memReason.Lines);
    LimitStringLength(AStringList, 74);
    memReason.Lines.Assign(AstringList);
    ControlChange(Self);
  finally
    AStringList.Free;
  end;
end;

procedure TfrmODRad.FormResize(Sender: TObject);
begin
  inherited;
  memReason.Width := pnlHandR.ClientWidth;
  memReason.Height := pnlHandR.ClientHeight - memReason.Top;
end;

procedure TfrmODRad.cboAvailModKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then cboAvailModMouseClick(Self);
end;

procedure TfrmODRad.calPreOpChange(Sender: TObject);
begin
  inherited;
  FPreOpDate := FloatToStr(calPreOp.FMDateTime);
  ControlChange(Self);
end;

procedure TfrmODRad.SetDefaultPregant;
begin
  if (Patient.Sex = 'F') and ((Patient.Age > 55) or (Patient.Age < 12)) then
    radPregnantNo.Checked := True;
end;

procedure TfrmODRad.cmdAcceptClick(Sender: TObject);
const
  Txt1 = 'This order can not be saved for the following reason(s):';
  Txt2 = #13+#13+'A response for the pregnant field must be selected.';
var
  NeedCheckPregnant: boolean;
begin
  if Patient.Sex = 'F' then
  begin
    NeedCheckPregnant := True;
    if radPregnant.Checked then NeedCheckPregnant := False
    else if radPregnantNo.Checked then NeedCheckPregnant := False
    else if radPregnantUnknown.Checked then NeedCheckPregnant := False;
    if NeedCheckPregnant then
    begin
      MessageDlg(Txt1+Txt2, mtWarning,[mbOK],0);
      Exit;
    end;
  end;
  inherited;
end;

procedure TfrmODRad.cboProcedureExit(Sender: TObject);
var
  i: integer;
  ModList: TStringList;
begin
  inherited;
  ModList := TStringList.Create;
  if lstSelectMod.Items.Count > 0 then
    for i := 0 to lstSelectMod.Count - 1 do
      ModList.Add(lstSelectMod.Items[i]);
  cboProcedureSelect(Self);
  for i := 0 to ModList.Count - 1 do
  begin
    lstSelectMod.Items.Add(ModList[i]);
    lstSelectMod.SelectByID(Piece(ModList[i],U,1));
  end;
  with lstSelectMod do
    for i := 0 to Items.Count - 1 do
      Responses.Update('MODIFIER',i+1, Piece(Items[i],U,1), Piece(Items[i],U,2));
end;


procedure TfrmODRad.cboImTypeExit(Sender: TObject);
begin
  inherited;
  ImageTypeChange;
end;

procedure TfrmODRad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmFrame.pnlVisit.Enabled := true;
  FormMonitorBringToFrontEvent(Self, nil);
end;

procedure TfrmODRad.chkIsolationExit(Sender: TObject);
begin
  inherited;
  //Fix for CQ: 10025
  if TabIsPressed() then
    if NoPregnantSelection() then
      if radPregnant.CanFocus then
        radPregnant.SetFocus();
end;

procedure TfrmODRad.calPreOpExit(Sender: TObject);
begin
  inherited;
  //Fix for CQ: 10025
  if ShiftTabIsPressed() then
    if NoPregnantSelection() then
      if radPregnant.CanFocus then
        radPregnant.SetFocus();
end;

function TfrmODRad.NoPregnantSelection : Boolean;
begin
  result := not ((radPregnant.Checked) or (radPregnantNo.Checked) or (radPregnantUnknown.Checked));
end;

procedure TfrmODRad.cboImTypeDropDownClose(Sender: TObject);
begin
  inherited;
  ImageTypeChange;
end;

procedure TfrmODRad.ImageTypeChange;
begin
  if not ImageTypeChanged then Exit;
  ImageTypeChanged := false;
  if FPredefineOrder then
    FPredefineOrder := False;
  if Changing or (cboImtype.ItemIndex = -1) then exit;
  with cboImType do DisplayGroup := StrToIntDef(Piece(Items[ItemIndex], U, 4), 0) ;
  if DisplayGroup = 0 then exit;
  CtrlInits.LoadDefaults(ODForRad(Patient.DFN, FEvtDelayDiv, DisplayGroup));   // ODForRad returns TStrings with defaults
  FPredefineOrder := False;
  InitDialog;
end;

procedure TfrmODRad.FormFirstOpened(Sender: TObject);
begin
  if(FFormFirstOpened) then
  begin
    FFormFirstOpened := FALSE;
    with cboImType do
      if not FEditCopy and (ItemIEN = 0) and (DroppedDown = False) and (Application.Active) then
      begin
        cboImType.DroppedDown := TRUE;
      end;
  end;
end;

end.

