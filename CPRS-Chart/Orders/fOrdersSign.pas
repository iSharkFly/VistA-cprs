unit fOrdersSign;

{.$define debug}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fAutoSz, StdCtrls, ORFn, ORCtrls, AppEvnts, mCoPayDesc, XUDIGSIGSC_TLB,
  ComCtrls, CheckLst, ExtCtrls, uConsults, UBAGlobals,UBACore, UBAMessages, UBAConst,
  Menus, ORClasses;

type
  TfrmSignOrders = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    lblESCode: TLabel;
    txtESCode: TCaptionEdit;
    fraCoPay: TfraCoPayDesc;
    clstOrders: TCaptionCheckListBox;
    laDiagnosis: TLabel;
    gbdxLookup: TGroupBox;
    buOrdersDiagnosis: TButton;
    poBACopyPaste: TPopupMenu;
    Copy1: TMenuItem;
    Paste1: TMenuItem; 
    Diagnosis1: TMenuItem;
    Exit1: TMenuItem;
    Label2: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure clstOrdersDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure clstOrdersMeasureItem(Control: TWinControl; Index: Integer; var AHeight: Integer);
    procedure clstOrdersClickCheck(Sender: TObject);
    procedure clstOrdersMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure buOrdersDiagnosisClick(Sender: TObject);
    function IsSignatureRequired:boolean;
    procedure Exit1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject); 
    procedure clstOrdersMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure clstOrdersClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer); 
    procedure fraCoPaylblHNCMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fraCoPayLabel23Enter(Sender: TObject);
    procedure fraCoPayLabel23Exit(Sender: TObject);
    procedure clstOrdersKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OKPressed: Boolean;
    ESCode: string;
    FLastHintItem: integer;
    FOldHintPause: integer;
    FOldHintHidePause: integer;
    function ItemsAreChecked: Boolean;
    function GetNumberOfSelectedOrders : byte;
    procedure ShowTreatmentFactorHints(var pHintText: string; var pCompName: TORStaticText); // 508
    procedure SetItemTextToState;
    procedure FormatListForScreenReader;
  public
    procedure SetCheckBoxStatus(thisOrderID: string);
    function GetCheckBoxStatus(sourceOrderID : string) : string; overload; 
    
end;

{Begin BillingAware}
  { TODO 3 -oKW -cRefinement : Change to dynamic array or other dynamic structure for Billing Awareness Phase II. }
  TarRect = array[MIN_RECT..MAX_RECT] of TRect;

  var
    thisRect: TRect;
    j: shortint;
    ARect: TRect;
    arRect: TarRect;
    ProvDx:  TProvisionalDiagnosis;
    FOSTFHintWndActive: boolean;
    FOSTFhintWindow: THintWindow;
    tempList : TList;

{End BillingAware}

{Forward} function ExecuteSignOrders(SelectedList: TList): Boolean;

var
  crypto: IXuDigSigS;
  rectIndex: Integer;

  {Begin BillingAware}
    frmSignOrders: TfrmSignOrders;
    chkBoxStatus: string;
    srcOrderID: string;
    targetOrderID: string;
    tempStrList: TStringList;
    srcDx: string;
    tempBillableList :TStringList;
    tempOrderList: TStringList;
    copyOrderID: string;
    srcIndex: integer;
    CopyBuffer: TBADxRecord;
    //CopyActive: boolean;  //CQ6225
  {End BillingAware}

implementation

{$R *.DFM}

uses
  Hash, rCore, rOrders, uConst, fOrdersPrint, uCore, uOrders, uSignItems, fOrders,
  fPCELex, rPCE, fODConsult, fBALocalDiagnoses, fClinicWardMeds, fFrame;

const
  TX_SAVERR1 = 'The error, ';
  TX_SAVERR2 = ', occurred while trying to save:' + CRLF + CRLF;
  TC_SAVERR  = 'Error Saving Order';

function TfrmSignOrders.GetNumberOfSelectedOrders : byte;
{
 - Return the number of orders in clstOrders that are currently selected.
}
var
  i: integer;
  numSelected: byte;
begin
  Result := 0;
  if BILLING_AWARE then
     begin
      numSelected := 0;

        try
            for i := 0 to fOrdersSign.frmSignOrders.clstOrders.Items.Count-1 do
                if (fOrdersSign.frmSignOrders.clstOrders.Selected[i]) then
                   Inc(numSelected);
        except
           on EListError do
              begin
              {$ifdef debug}ShowMessage('EListError in frmSignOrders.GetNumberOfSelectedOrders()');{$endif}
              raise;
              end;
        end;

      Result := numSelected;
     end;
end;

procedure TfrmSignOrders.SetCheckBoxStatus(thisOrderID: string);
{
 - Set the current GRID checkboxes status
}
begin
  if BILLING_AWARE then
     begin
        uSignItems.uSigItems.SetSigItems(clstOrders, thisOrderID);
     end;
end;

function TfrmSignOrders.GetCheckBoxStatus(sourceOrderID: string) : string;  //PASS IN ORDER ID - NOT GRID INDEX
{
- Obtain checkbox status for selected order - BY ORDER ID
}
var
  itemsList: TStringList;
  i: smallint;
  thisOrderID: string;
begin
  Result := '';
  itemsList := TStringList.Create;
  itemsList.Clear;
  itemsList := uSigItems.GetSigItems; //Get FItems list

  if BILLING_AWARE then
     begin
        try
           for i := 0 to itemsList.Count-1 do
              begin
              thisOrderID := Piece(itemsList[i],'^',1); //get the order ID
              if thisOrderID = sourceOrderID then   //compare to order ID of source order
                 begin
                 Result := Piece(itemsList[i],U,4);  //return TF status'
                 Break;
                 end;
              end;
        except
           on EListError do
              begin
              {$ifdef debug}ShowMessage('EListError in frmSignOrders.GetCheckBoxStatus()');{$endif}
              raise;
              end;
        end;
     end;
end;

function ExecuteSignOrders(SelectedList: TList): Boolean;
var
  i, cidx,cnt, theSts: Integer;
  ShrinkHeight: integer;
  SignList: TStringList;
  Obj: TOrder;
  DigSigErr, DigStoreErr: Boolean;
  x, SigData, SigUser, SigDrugSch, SigDEA: string;
  cSignature, cHashData, cCrlUrl, cErr: string;
  cProvDUZ: Int64;
  OrderText: string;
  PrintLoc: Integer;
 // tempOrderID: string;

  function FindOrderText(const AnID: string): string;
  var
    i: Integer;
  begin
    Result := '';
    fOrdersSign.tempList := selectedList;
    with SelectedList do for i := 0 to Count - 1 do
      with TOrder(Items[i]) do if ID = AnID then
      begin
        Result := Text;
        Break;
      end;
  end;

  function SignNotRequired: Boolean;
  var
    i: Integer;
  begin
    Result := True;
    tempList := SelectedList;
    with SelectedList do for i := 0 to Pred(Count) do
    begin
      with TOrder(Items[i]) do if Signature <> OSS_NOT_REQUIRE then Result := False;
    end;
  end;

  function DigitalSign: Boolean;
  var
    i: Integer;
  begin
    Result := False;

    with SelectedList do for i := 0 to Pred(Count) do
    begin
      with TOrder(Items[i]) do if Copy(DigSigReq,1,1) = '2' then Result := True;
    end;
  end;

begin
  Result := False;
  DigSigErr := True;
  PrintLoc := 0;
  if SelectedList.Count = 0 then Exit;
  if BILLING_AWARE then
  begin
     tempOrderList := TStringList.Create;
     tempOrderList.Clear;
  end;
  frmSignOrders := TfrmSignOrders.Create(Application);
  try
    ResizeAnchoredFormToFont(frmSignOrders);
    SigItems.ResetOrders;
    with SelectedList do for i := 0 to Count - 1 do
      begin
        obj := TOrder(Items[i]);
        cidx := frmSignOrders.clstOrders.Items.AddObject(Obj.Text,Obj);
        SigItems.Add(CH_ORD,Obj.ID, cidx);
         //HDS6205 allows dx entry for NON CIDC Consult orders
   //    if BILLING_AWARE then  //HDS6205
   //        if UBAGlobals.BAConsultOrdersRequireDx.Count > 0 then  //HDS6205
   //        begin
  //            tempOrderID := UBACore.SetOrderIDConsultDxRequired(Piece(Obj.ID,';',1) + ';1');  //HDS6205
  //            tempOrderList.Add(tempOrderID);  //HDS6205
  //         end
  //         else
         if BILLING_AWARE then
            tempOrderList.Add(Obj.ID);

        frmSignOrders.clstOrders.Checked[cidx] := TRUE;

        if (TOrder(Items[i]).DGroupName) = NonVAMedGroup then
           frmSignOrders.clstOrders.State[cidx] := cbGrayed ;
      end;

    if SigItems.UpdateListBox(frmSignOrders.clstOrders) then
      frmSignOrders.fraCoPay.Visible := TRUE
    else
      begin

      {Begin BillingAware}
        if  BILLING_AWARE then
           frmSignOrders.gbDxLookup.Visible := FALSE;
       {End BillingAware}

        ShrinkHeight := frmSignOrders.fraCoPay.Height + 9;
        frmSignOrders.Height := frmSignOrders.Height - ShrinkHeight;
        frmSignOrders.Label2.Top := frmSignOrders.Label2.Top - ShrinkHeight;
        frmSignOrders.clstOrders.Top := frmSignOrders.clstOrders.Top - ShrinkHeight;
        frmSignOrders.clstOrders.Height := frmSignOrders.clstOrders.Height + ShrinkHeight;
      end;

    if GetPKISite and GetPKIUse and DigitalSign then //PKI setup for crypto card read
      begin
        try  //PKI object creation
          crypto := CoXuDigSigS.Create;
          crypto.GetCSP;
          StatusText(crypto.Reason);
          DigSigErr := False;
        except
          on  E: Exception do
            begin
              DigSigErr := True;
            end;
        end;
      end;

    if SignNotRequired then
      begin
        frmSignOrders.lblESCode.Visible := False;
        frmSignOrders.txtESCode.Visible := False;
      end;

    if BILLING_AWARE then
    begin
     //  build list of orders that are not billable based on order type
        UBAGlobals.NonBillableOrderList := rpcNonBillableOrders(tempOrderList);
    end;

     frmSignOrders.ShowModal;
      if frmSignOrders.OKPressed then
      begin
        Result := True;
        SignList := TStringList.Create;
        try
          with SelectedList do for i := 0 to Count - 1 do with TOrder(Items[i]) do
            begin
              DigStoreErr := false;
              if (DigSigErr = False) and (Copy(TOrder(Items[i]).DigSigReq,1,1) = '2') then
                begin
                  StatusText('Retrieving DIGITAL SIGNATURE');
                  x := TOrder(Items[i]).ID;
                  SigDrugSch := GetDrugSchedule(x);
                  SigData := SetExternalText(x,SigDrugSch,User.DUZ);
                  if Length(SigData) < 1 then
                    begin
                      ShowMessage(TOrder(SelectedList.Items[i]).Text + CRLF + CRLF + 'Digital Signature failed with reason: Unable to get required data from server');
                      DigStoreErr := true;
                    end;
                  SigUser := piece(SigData,'^',18);
                  SigDEA := piece(SigData,'^',20);
                  cProvDUZ := User.DUZ;
                  if DigStoreErr = false then
                  try
                    crypto.Reset;
                    crypto.DEAsig := true;
                    crypto.UsrName := SigUser;
                    crypto.DrugSch := SigDrugSch;
                    crypto.UsrNumber := SigDEA;
                    crypto.DataBuffer := SigData;
                    if crypto.Signdata = true then
                      begin
                        cSignature := crypto.Signature;
                        cHashData := crypto.HashValue;
                        cCrlUrl := crypto.CrlUrl;
                      end
                    else
                      begin
                        ShowMessage(TOrder(SelectedList.Items[i]).Text + CRLF + CRLF + 'Digital Signature failed with reason: '+ piece(Crypto.Reason, '^', 2));
                        DigStoreErr := true;
                      end;
                  except
                    on  E: Exception do
                      begin
                        ShowMessage(TOrder(SelectedList.Items[i]).Text + CRLF + CRLF + 'Crypto raised an error: '+ E.Message);
                        DigStoreErr := true;
                      end;
                  end;  //except
                  if DigStoreErr = true then //PKI
                    begin
                      //NoOp
                    end
                  else
                    begin
                      cErr := '';
                      StoreDigitalSig(ID, cHashData, cProvDUZ, cSignature, cCrlUrl, cErr);
                      cidx := frmSignOrders.clstOrders.Items.IndexOfObject(TOrder(Items[i]));
                      if (cidx > -1 ) and (frmSignOrders.clstOrders.Checked[cidx]) and (cErr = '') then
                      begin
                        UpdateOrderDGIfNeeded(ID);
                        SignList.Add(ID + U + SS_DIGSIG + U + RS_RELEASE + U + NO_PROVIDER);
                        BAOrderList.Add(TOrder(Items[i]).ID);
                      end;
                    end;
                end
              else
                begin
                  if GetPKISite and (Copy(TOrder(SelectedList.Items[i]).DigSigReq,1,1) = '2') then
                    begin
                      ShowMessage('ORDER NOT SENT TO PHARMACY' + CRLF + CRLF + TOrder(SelectedList.Items[i]).Text + CRLF + CRLF +
                        'This Schedule II medication cannot be electronically entered without a Digital Signature. ' +
                        CRLF + 'Please discontinue/cancel this order and create a hand written order for manual processing, or digitally sign the order at a PKI-enabled workstation.');
                    end
                  else
                    begin
                      cidx := frmSignOrders.clstOrders.Items.IndexOfObject(TOrder(Items[i]));
                      if TOrder(Items[i]).DGroupName = NonVAMedGroup  then  frmSignOrders.clstOrders.Checked[cidx] := True;    //Non VA MEDS
                      if (cidx > -1 ) and (frmSignOrders.clstOrders.Checked[cidx]) then
                      begin
                        UpdateOrderDGIfNeeded(ID);
                        SignList.Add(ID + U + SS_ESIGNED + U + RS_RELEASE + U + NO_PROVIDER);
                      end;
                    end;
                end;
            end;
          StatusText('Sending Orders to Service(s)...');
          if SignList.Count > 0 then
          begin

          //hds7591  Clinic/Ward movement.  Patient Admission IMO
          if not frmFrame.TimedOut then
          begin
             if IsValidIMOLoc(uCore.TempEncounterLoc,Patient.DFN) then
                frmClinicWardMeds.ClinicOrWardLocation(SignList, Encounter.Location,uCore.Encounter.LocationName, PrintLoc)
             else
                if (IsValidIMOLoc(Encounter.Location,Patient.DFN)) and ((frmClinicWardMeds.rpcIsPatientOnWard(patient.DFN)) and (Patient.Inpatient = false)) then
                   frmClinicWardMeds.ClinicOrWardLocation(SignList, Encounter.Location,Encounter.LocationName, PrintLoc);
          end;
          uCore.TempEncounterLoc := 0;
          uCore.TempEncounterLocName := '';
          //hds7591  Clinic/Ward movement  Patient Admission IMO

            SigItems.SaveSettings; // Save CoPay FIRST!
            SendOrders(SignList, frmSignOrders.ESCode);

        end;

            with SignList do if Count > 0 then for i := 0 to Count - 1 do
            begin
              if Pos('E', Piece(SignList[i], U, 2)) > 0 then
                begin
                  OrderText := FindOrderText(Piece(SignList[i], U, 1));
                  InfoBox(TX_SAVERR1 + Piece(SignList[i], U, 4) + TX_SAVERR2 + OrderText,
                          TC_SAVERR, MB_OK);
                end;
              if Pos('R', Piece(SignList[i], U, 2)) > 0 then
                NotifyOtherApps(NAE_ORDER, 'RL' + U + Piece(SignList[i], U, 1));
            end;
          StatusText('');
          for cnt := SignList.Count - 1 downto 0 do
          begin
              if Pos('E', Piece(SignList[cnt], U, 2)) > 0 then
              begin
                SignList.Delete(cnt);
                Continue;
              end;
              theSts := GetOrderStatus(Piece(SignList[cnt],U,1));
              if theSts = 10 then  SignList.Delete(cnt);  //signed delayed order should not be printed.
          end;
          PrintOrdersOnSignRelease(SignList, NO_PROVIDER, PrintLoc);
        finally
          SignList.Free;
        end;
      end; {if frmSignOrders.OKPressed}
  finally
    frmSignOrders.Free;
    with SelectedList do for i := 0 to Count - 1 do UnlockOrder(TOrder(Items[i]).ID);
  end;
  crypto := nil;
end;

procedure TfrmSignOrders.FormCreate(Sender: TObject);
begin
  inherited;
  FLastHintItem := -1;
  OKPressed := False;
  FOldHintPause := Application.HintPause;
  Application.HintPause := 250;
  FOldHintHidePause := Application.HintHidePause;
  Application.HintHidePause := 30000;
  tempList := TList.Create;

  {Begin BillingAware}
  //This is the DIAGNOSIS label above the Dx column
  if  BILLING_AWARE then
      begin
        clstOrders.Height := 234;
        clstOrders.Top :=  (gbdxLookup.top + 65);
        gbDxLookup.Visible := TRUE;
        label2.Top := (gbdxLookup.Top +  48);
        laDiagnosis.Top :=  Label2.Top;
        laDiagnosis.Left := 270;
        laDiagnosis.Visible := TRUE;
        rectIndex := 0;
      end
   else
      begin
         label2.Top := 145;
         label2.Left := 8;
     end;
 {End BillingAware}

end;

function TfrmSignOrders.IsSignatureRequired:boolean;
var
   i: Integer;
begin
    Result := FALSE;

    with tempList do for i := 0 to Pred(Count) do
    begin
      if frmSignOrders.clstOrders.Checked[i] then
      begin
      with TOrder(Items[i]) do if Signature <> OSS_NOT_REQUIRE then
         Result := TRUE;
      end;
    end;
end;

procedure TfrmSignOrders.cmdOKClick(Sender: TObject);
const
  TX_NO_CODE  = 'An electronic signature code must be entered to sign orders.';
  TC_NO_CODE  = 'Electronic Signature Code Required';
  TX_BAD_CODE = 'The electronic signature code entered is not valid.';
  TC_BAD_CODE = 'Invalid Electronic Signature Code';
  TC_NO_DX   =  'Incomplete Diagnosis Entry';
  TX_NO_DX   = 'A Diagnosis must be selected prior to signing any of the following order types:'
                + CRLF + 'Lab, Radiology, Outpatient Medications, Prosthetics.';
begin
  inherited;

  if txtESCode.Visible and (Length(txtESCode.Text) = 0) then
  begin
    InfoBox(TX_NO_CODE, TC_NO_CODE, MB_OK);
    Exit;
  end;

  if txtESCode.Visible and not ValidESCode(txtESCode.Text) then
  begin
    InfoBox(TX_BAD_CODE, TC_BAD_CODE, MB_OK);
    txtESCode.SetFocus;
    txtESCode.SelectAll;
    Exit;
  end;

{Begin BillingAware}
  if  BILLING_AWARE then
  begin
    if SigItems.OK2SaveSettings then
   
      if Not UBACore.BADxEntered then   //  if Dx have been entered and OK is pressed
         begin                     // billing data will be saved. otherwise error message!
            InfoBox(TX_NO_DX, 'Sign Orders', MB_OK);
            Exit;
         end;
    end;
{End BillingAware}

  if not SigItems.OK2SaveSettings then
  begin
    InfoBox(TX_Order_Error, 'Sign Orders', MB_OK);
    Exit;
  end;

  if txtESCode.Visible then
     ESCode := Encrypt(txtESCode.Text) else ESCode := '';
     
  OKPressed := True;
  Close;
end;

procedure TfrmSignOrders.cmdCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSignOrders.FormDestroy(Sender: TObject);
begin
  inherited;
  Application.HintPause := FOldHintPause;
  Application.HintHidePause := FOldHintHidePause;
  Crypto := nil;  //PKI object destroy
end;

procedure TfrmSignOrders.clstOrdersDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
{Begin BillingAware}
  str: String;
  tempID: string;
  thisRec: UBAGlobals.TBADxRecord;
 {End BillingAware}

  X: string;
  ARect: TRect;
begin
  inherited;
  X := '';
  ARect := Rect;

{Begin BillingAware}
  if  BILLING_AWARE then
  begin
     with clstOrders do
     begin
       if Index < Items.Count then
       begin
          Canvas.FillRect(ARect);
          Canvas.Pen.Color := clSilver;
          Canvas.MoveTo(ARect.Left, ARect.Bottom);
          Canvas.LineTo(ARect.Right, ARect.Bottom);
          x := FilteredString(Items[Index]);
          ARect.Right := ARect.Right - 50;    //50 to 40
          //Vertical column line
          Canvas.MoveTo(ARect.Right, Rect.Top);
          Canvas.LineTo(ARect.Right, Rect.Bottom);
          //Adjust position of 'Diagnosis' column label for font size
          laDiagnosis.Left := ARect.Right + 14;

              //ARect.Right below controls the right-hand side of the Dx Column
              //Adjust ARect.Right in conjunction with procedure uSignItems.TSigItems.lbDrawItem(), because the
              //two rectangles overlap each other.
           if  BILLING_AWARE then
           begin
              arRect[Index] := Classes.Rect(ARect.Right+2, ARect.Top, ARect.Right + 108, ARect.Bottom);
              Canvas.FillRect(arRect[Index]);
           end;

              //Win32 API - This call to DrawText draws the text of the ORDER - not the diagnosis code
               DrawText(Canvas.handle, PChar(x), Length(x), ARect, DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
       {v25 BA}
        if  BILLING_AWARE then
         begin
             if Assigned(UBAGlobals.tempDxList) then
                begin
                tempID := TOrder(clstOrders.Items.Objects[Index]).ID;

                if UBAGlobals.tempDxNodeExists(tempID) then
                    begin
                       thisRec := TBADxRecord.Create;
                       UBAGlobals.GetBADxListForOrder(thisRec, tempID);
                       str := Piece(thisRec.FBADxCode,'^',1);
                       {v25 BA}
                       str := Piece(str,':',1);
                       DrawText(Canvas.handle, PChar(str), Length(str), arRect[Index], DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
                       if Not UBACore.IsOrderBillable(tempID) then //and
                      //    Not UBAGlobals.tempDxNodeExists(tempID) then   // if consult is non cidc but requires dx, show it.
                       begin
                            Canvas.Font.Color := clBlue;
                            DrawText(Canvas.handle, PChar(NOT_APPLICABLE), Length(NOT_APPLICABLE), {Length(str),} arRect[Index], DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
                       end;
                    end
                 else
                    begin
                      //   determine if order is billable, if NOT then insert NA in Dx field
                     if Not UBACore.IsOrderBillable(tempID) then
                        begin
                            Canvas.Font.Color := clBlue;
                            DrawText(Canvas.handle, PChar(NOT_APPLICABLE), Length(NOT_APPLICABLE), {Length(str),} arRect[Index], DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
                        end;
                    end;
                end;
            end;
  
        end;
       end;
  end
  else
     begin
        X := '';
        ARect := Rect;
        with clstOrders do
           begin
             if Index < Items.Count then
                begin
                Canvas.FillRect(ARect);
                Canvas.Pen.Color := clSilver;
                Canvas.MoveTo(ARect.Left, ARect.Bottom - 1);
                Canvas.LineTo(ARect.Right, ARect.Bottom - 1);
                X := FilteredString(Items[Index]);
                DrawText(Canvas.handle, PChar(x), Length(x), ARect, DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
                end;
           end;
     end;
{End BillingAware}
end;

procedure TfrmSignOrders.clstOrdersMeasureItem(Control: TWinControl;
  Index: Integer; var AHeight: Integer);
var
  X: string;
  ARect: TRect;
begin
  inherited;
  AHeight := SigItemHeight;
  with clstOrders do if Index < Items.Count then
  begin
    ARect := ItemRect(Index);
    Canvas.FillRect(ARect);
    x := FilteredString(Items[Index]);
    AHeight := WrappedTextHeightByFont(Canvas, Font, x, ARect);
    if AHeight > 255 then AHeight := 255;
    //-------------------
    {Bug fix-HDS00001627}
    //if AHeight <  13 then AHeight := 13; {ORIG}
    if AHeight <  13 then AHeight := 15;
    //-------------------
  end;
end;

procedure TfrmSignOrders.clstOrdersClickCheck(Sender: TObject);

   procedure updateAllChilds(CheckedStatus: boolean; ParentOrderId: string);
   var
     idx: integer;
   begin
     for idx := 0 to clstOrders.Items.Count - 1 do
        if TOrder(clstOrders.Items.Objects[idx]).ParentID = ParentOrderId then
        begin
           if clstOrders.Checked[idx] <> CheckedStatus then
           begin
              clstOrders.Checked[idx] := CheckedStatus;
              SigItems.EnableSettings(idx, clstOrders.checked[Idx]);
           end;
        end;
   end;

begin
  with clstOrders do
  begin
    if Length(TOrder(Items.Objects[ItemIndex]).ParentID)>0 then
    begin
      SigItems.EnableSettings(ItemIndex, checked[ItemIndex]);
      updateAllChilds(checked[ItemIndex],TOrder(Items.Objects[ItemIndex]).ParentID);
    end else
      SigItems.EnableSettings(ItemIndex, checked[ItemIndex]);
  end;
  if ItemsAreChecked then
  begin
     lblESCode.Visible := IsSignatureRequired;
     txtESCode.Visible := IsSignatureRequired
  end
  else
  begin
    lblESCode.Visible := ItemsAreChecked;
    txtESCode.Visible := ItemsAreChecked;
  end;
end;

function TfrmSignOrders.ItemsAreChecked: Boolean;
{ return true if any items in the Review List are checked for applying signature }
var
  i: Integer;
begin
  Result := False;

  with clstOrders do
     for i := 0 to Items.Count - 1 do
        if Checked[i] then
           begin
           Result := True;
           break;
           end;
end;

procedure TfrmSignOrders.clstOrdersMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Itm: integer;
{Begin BillingAware}
  thisRec: UBAGlobals.TBADxRecord;
  i: smallint;
  thisOrderID: string;
{End BillingAware}
begin
  inherited;
  Itm := clstOrders.ItemAtPos(Point(X, Y), TRUE);
  if (Itm >= 0) then
  begin
    if (Itm <> FLastHintItem) then
    begin
      Application.CancelHint;
   {Begin BillingAware}
    if  BILLING_AWARE then
    begin
       //Billing Awareness 'flyover' hint includes Dx code(s) when Dx code(s) have been assigned to an order
           thisOrderID := TChangeItem(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[Itm]).ID;

           if UBAGlobals.tempDxNodeExists(thisOrderID) then
                 begin
                 if Assigned(tempDxList) then
                 try
                      for i := 0 to (tempDxList.Count - 1) do
                         begin
                          thisRec := TBADxRecord(tempDxList.Items[i]);

                          if Assigned(thisRec) then
                            if (thisRec.FOrderID = thisOrderID) then
                                begin
                                with thisRec do
                                   begin
                                      FBADxCode := StringReplace(thisrec.FBADxCode,'^',':',[rfReplaceAll]);
                                      FBASecDx1 := StringReplace(thisrec.FBASecDx1,'^',':',[rfReplaceAll]);
                                      FBASecDx2 := StringReplace(thisrec.FBASecDx2,'^',':',[rfReplaceAll]);;
                                      FBASecDx3 := StringReplace(thisrec.FBASecDx3,'^',':',[rfReplaceAll]);
                                   end;

                                clstOrders.Hint := TrimRight(clstOrders.Items[Itm] + #13 +
                                                             thisRec.FBADxCode + #13 + thisRec.FBASecDx1 + #13 + thisRec.FBASecDx2 + #13 + thisRec.FBASecDx3);
                                end
                          end
                 except
                    on EListError do
                       begin
                       {$ifdef debug}ShowMessage('EListError in frmSignOrders.clstOrdersMouseMove()');{$endif}
                       raise;
                       end;
                 end;

                 end
           else
               clstOrders.Hint := TrimRight(clstOrders.Items[Itm]);
  end;
  {End BillingAware}
    FLastHintItem := Itm;
    Application.ActivateHint(Point(X, Y));
   end;
  end
  else
  begin
    clstOrders.Hint := '';
    FLastHintItem := -1;
    Application.CancelHint;
  end;
end;

procedure TfrmSignOrders.FormShow(Sender: TObject);
begin
{Begin BillingAware}

  //INITIALIZATIONS
  Paste1.Enabled := false;
  fOrdersSign.srcOrderID := '';
  fOrdersSign.srcDx := '';
  if txtESCode.Visible then
     frmSignOrders.txtESCode.SetFocus;

    if  BILLING_AWARE then
       begin
         //List to contain loading OrderID's
        if not Assigned(UBAGlobals.OrderIDList) then
           UBAGlobals.OrderIDList := TStringList.Create;

        if  BILLING_AWARE then
           clstOrders.Multiselect := true;

         with fraCoPay do
           begin
            Label24.Caption := 'Service &Connected Condition';
            StaticText4.Caption := 'Combat &Vet (Combat Related)';
            Label18.Caption := 'Agent &Orange Exposure';
            Label16.Caption := 'Ionizing &Radiation Exposure';
            Label14.Caption := '&Environmental Contaminants';
            Label12.Caption := '&MST';
            lblHNC2.Caption := '&Head and/or Neck Cancer';
            Label24.ShowAccelChar := true;
            StaticText4.ShowAccelChar := true;
            Label18.ShowAccelChar := true;
            Label16.ShowAccelChar := true;
            Label14.ShowAccelChar := true;
            Label12.ShowAccelChar := true;
            lblHNC2.ShowAccelChar := true;
           end;
        end;  //BILLING_AWARE

  clstOrders.TabOrder := 0; //CQ5057
  FormatListForScreenReader;

  //CQ5172
  if clstOrders.Count = 1 then
  begin
     clstOrders.Selected[0] := true;
     buOrdersDiagnosis.Enabled := True;
     Diagnosis1.Enabled := True;
     // if number of orders is 1 and order is billable select order and disable diagnosis button
     if NOT UBACore.IsOrderBillable(TChangeItem(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[0]).ID) then
     begin
        buOrdersDiagnosis.Enabled := False;
        Diagnosis1.Enabled := False;
        clstOrders.Selected[0] := False;
     end
     else
        if Piece(TChangeItem(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[0]).ID,';',2) = DISCONTINUED_ORDER then
        begin
           buOrdersDiagnosis.Enabled := False;
           Diagnosis1.Enabled := False;
        end;
  end;
 //end CQ5172
end;

 {Begin BillingAware}
 //   New BA Button....
procedure TfrmSignOrders.buOrdersDiagnosisClick(Sender: TObject);
var
  i: smallint;
  thisOrderID: string;
  match: boolean;
  allBlank: boolean;
  numSelected: smallint;
begin
{Begin BillingAware}

  match := false;
  allBlank := false;
  //orderIDList := TStringList.Create;
  if Assigned (orderIDList) then orderIDList.Clear;
  if Assigned(UBAGlobals.PLFactorsIndexes) then UBAGlobals.PLFactorsIndexes.Clear;
  if Assigned (BAtmpOrderList) then BAtmpOrderList.Clear;

   try
     // User has selected no orders to sign
        for i := 0 to fOrdersSign.frmSignOrders.clstOrders.Items.Count-1 do
           begin
            if (fOrdersSign.frmSignOrders.clstOrders.Selected[i]) then
               begin
               thisOrderID := TChangeItem(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i]).ID;
               orderIDList.Add(thisOrderID);
               {BAV25 Code}
               BAtmpOrderList.Add(TOrder(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i]).TEXT);
               // stringlist holding index and stsFactors
               UBAGlobals.PLFactorsIndexes.Add(IntToStr(i)+ U + GetCheckBoxStatus(thisOrderID) );  // store indexes and flags of selected orders
               {BAV25 Code}
               // Test for blank Dx on current grid item
                if not (tempDxNodeExists(thisOrderID)) then
                   if Assigned(UBAGlobals.globalDxRec) then
                   InitializeNewDxRec(UBAGlobals.globalDxRec);
               if (tempDxNodeExists(thisOrderID)) then
               begin
                   // Create UBAGlobals.globalDxRec with loaded fields
                  if not Assigned(UBAGlobals.globalDxRec) then
                     begin
                        UBAGlobals.globalDxRec := UBAGlobals.TBADxRecord.Create;
                        InitializeNewDxRec(UBAGlobals.globalDxRec);
                        GetBADxListForOrder(UBAGlobals.globalDxRec, thisOrderID);
                     end
                 else
                    GetBADxListForOrder(UBAGlobals.globalDxRec, thisOrderID);

                 {$ifdef debug}
                 with UBAGlobals.globalDxRec do
                    //ShowMessage('globalDxRec:'+#13+FOrderID+#13+FBADxCode+#13+FBASecDx1+#13+FBASecDx2+#13+FBASecDx3);
                 {$endif}
                  end;
           end; //if
        end; //for
     except
        on E: Exception  do
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
   end;

  numSelected  := CountSelectedOrders(UBAConst.F_ORDERS_SIGN);
  
  if numSelected = 0 then
     begin
     ShowMessage(UBAMessages.BA_NO_ORDERS_SELECTED);
     Exit;
     end
  else
     if numSelected = 1 then
        match := true;

  if (UBAGlobals.CompareOrderDx(UBAConst.F_ORDERS_SIGN)) then
     match := true;


  if UBAGlobals.AllSelectedDxBlank(UBAConst.F_ORDERS_SIGN) then
     allBlank := true;

  if ((match and allBlank) or (match and (not allBlank))) then  // All selected are blank or matching-not-blank
//     begin
     { TODO 3 -oKW -cRefinement : Define a const to replace string literal }
       frmBALocalDiagnoses.Enter(UBAConst.F_ORDERS_SIGN, orderIDList)
   else
     begin
     //Warning message
     //If 'Yes' on warning message then open localDiagnosis
     if (not allBlank) then
         if MessageDlg(UBAMessages.BA_CONFIRM_DX_OVERWRITE, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
              Exit
         else
//              begin
              if Assigned(UBAGlobals.globalDxRec) then
                 InitializeNewDxRec(UBAGlobals.globalDxRec);
              frmBALocalDiagnoses.Enter(UBAConst.F_ORDERS_SIGN, orderIDList);
     end;
 // TFactors come from FBALocalDiagnoses(Problem List Dx's Only).
    if Length(UBAGlobals.TFactors) > 0 then
    begin
       UBACore.SetTreatmentFactors(UBAGlobals.TFactors);
       SigItems.DisplayPlTreatmentFactors;
    end;
 {End BillingAware}
 txtESCode.SetFocus;
end;

procedure TfrmSignOrders.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSignOrders.Copy1Click(Sender: TObject);
{
   - Copy contents of the 'source' order for copy/paste operation
}
var
  i : byte;
  numSelected: byte;
  thisChangeItem: TChangeItem;
begin
   try
     if BILLING_AWARE then
        begin
        Paste1.Enabled := true;

         numSelected := GetNumberOfSelectedOrders;

         if numSelected > 1 then
           begin
           ShowMessage('Only 1 order at a time may be selected for ''Copying''');
           Exit;
           end;

         for i := 0 to fOrdersSign.frmSignOrders.clstOrders.Items.Count-1 do
             if (fOrdersSign.frmSignOrders.clstOrders.Selected[i]) then
               begin
               thisChangeItem := TChangeItem.Create;
               thisChangeItem := nil;
               thisChangeItem := TChangeItem(clstOrders.Items.Objects[i]);
               //Skip this one if it's a "header" on the grid
                 if (thisChangeItem = nil) then //or (thisChangeItem.ItemType <> CH_ORD)) then
                    begin
                    FreeAndNil(thisChangeItem);
                    Exit;
                    end;

               fOrdersSign.srcOrderID := TChangeItem(frmSignOrders.clstOrders.Items.Objects[i]).ID;

               //Copy source order to COPY BUFFER and add it to the Dx List
               CopyBuffer := TBADxRecord.Create;
               InitializeNewDxRec(CopyBuffer);
               GetBADxListForOrder(CopyBuffer, fOrdersSign.srcOrderID);
               fOrdersSign.CopyBuffer.FOrderID := BUFFER_ORDER_ID;
               UBAGlobals.tempDxList.Add(CopyBuffer);

               //*************************************************************************
               if (NOT UBACore.IsOrderBillable(fOrdersSign.srcOrderID) ) then //and
             //    (NOT tempDxNodeExists(fOrdersSign.srcOrderID)) then   // added to allow copy to NON CIDC consult order the requires a DX. then
                 begin
                 ShowMessage(BA_NA_COPY_DISALLOWED);
                 fOrdersSign.srcOrderID := '';
                 Exit;
                 end;
               //*************************************************************************

               fOrdersSign.srcIndex := clstOrders.ItemIndex;
               fOrdersSign.chkBoxStatus := GetCheckBoxStatus(fOrdersSign.srcOrderID);
               Break;
               end;
         end; //if BILLING_AWARE
   except
     on EListError do
        begin
        ShowMessage('EListError in frmSignOrders.Copy1Click()');
        raise;
        end;
   end;

  //CopyActive := true; //CQ6225
  //Paste1.Enabled := true; //CQ6225
end;

procedure TfrmSignOrders.Paste1Click(Sender: TObject);
{
 - Populate 'target' orders of a copy/paste operation with contents of 'source' order
}  
var
  i: byte;
  newRec: TBADxRecord;
begin
  if BILLING_AWARE then
     begin
      if not Assigned(fOrdersSign.CopyBuffer) then //CQ5414
        fOrdersSign.CopyBuffer := TBADxRecord.Create; //CQ5414

     try
         for i := 0 to clstOrders.Count - 1 do
               begin
               if (fOrdersSign.frmSignOrders.clstOrders.Selected[i]) then
                 begin
                 fOrdersSign.targetOrderID := TChangeItem(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i]).ID;

                  if fOrdersSign.targetOrderID = fOrdersSign.srcOrderID then //disallow copying an order to itself
                     Continue
                  else
                     begin
                       fOrdersSign.CopyBuffer.FOrderID := BUFFER_ORDER_ID;

                     //***************************************************************
                     if Not UBACore.IsOrderBillable(targetOrderID) then
                       begin
                       ShowMessage(BA_NA_PASTE_DISALLOWED);
                       fOrdersSign.targetOrderID := '';
                       Continue;
                       end;
                     //***************************************************************

                     newRec := TBADxRecord.Create;
                     with newRec do
                       begin
                       FOrderID :=  fOrdersSign.targetOrderID;
                       FBADxCode := CopyBuffer.FBADxCode;
                       FBASecDx1 := CopyBuffer.FBASecDx1;
                       FBASecDx2 := CopyBuffer.FBASecDx2;
                       FBASecDx3 := CopyBuffer.FBASecDx3;
                       end;

                    tempDxList.Add(newRec);

                    CopyTFCIToTargetOrder( fOrdersSign.targetOrderID, fOrdersSign.chkBoxStatus);
                    SetCheckBoxStatus( fOrdersSign.targetOrderID);  //calls uSignItems.SetSigItems()
                  end;
                 end;
               end;
     except
        on EListError do
           begin
           ShowMessage('EListError in frmSignOrders.Paste1Click()'+#13+'for i := 0 to clstOrders.Count - 1 do');
           raise;
           end;
     end;
         clstOrders.Refresh; //Update grid to show pasted Dx
     end;
{
  //CQ6225
  if CopyActive then
     begin
     Paste1.Enabled := false;
     CopyActive := false;
     end;
  //end CQ6225
}
end;

procedure TfrmSignOrders.clstOrdersMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{
 - Open copy/paste popup menu.
}
var
  ClientPoint: TPoint;
  ScreenPoint: TPoint;
begin
  if not BILLING_AWARE then clstOrders.PopupMenu := nil;
  
  if BILLING_AWARE then
     begin
     try
        if Button = mbRight then  //Right-click to open copy/paste popup menu
           begin
           //CQ3325
           if fOrdersSign.frmSignOrders.clstOrders.Items.Count = 1 then
              begin
              Copy1.Enabled := false;
              Paste1.Enabled := false
              end
           else
              begin
              Copy1.Enabled := true;
              //Paste1.Enabled := true; //commented out for CQ6225
              end;
           //End CQ3325

           if not frmSignOrders.clstOrders.Selected[clstOrders.ItemIndex] then
              (Sender as TCheckListBox).Selected[clstOrders.ItemIndex] := true;

           ClientPoint.X := X;
           ClientPoint.Y := Y;
           ScreenPoint := clstOrders.ClientToScreen(ClientPoint);
           poBACopyPaste.Popup(ScreenPoint.X, ScreenPoint.Y);
           end;
     except
        on EListError do
           begin
           ShowMessage('EListError in frmSignOrders.clstOrdersMouseDown()');
           raise;
           end;
     end;
     end;
end;


procedure TfrmSignOrders.clstOrdersClick(Sender: TObject);
//If grid item is an order-able item, then enable the Diagnosis button
// else disable the Diagnosis button.
var
  thisChangeItem: TChangeItem;
  i: smallint;
  thisOrderList: TStringList;
begin
  thisOrderList := TStringList.Create;

 {Begin BillingAware}
 if  BILLING_AWARE then
 begin

 if clstOrders.Items.Count > 1 then
        copy1.Enabled := True
     else
        copy1.Enabled := False;

     for i := 0 to clstOrders.Items.Count - 1 do
        begin
           if clstOrders.Selected[i] then
              begin
              thisChangeItem := TChangeItem(clstOrders.Items.Objects[i]);

              //Disallow copying of a grid HEADER item on LEFT MOUSE CLICK
              if thisChangeItem = nil then
                 begin
                 Copy1.Enabled := false;
                 buOrdersDiagnosis.Enabled := false;
                 Exit;
                 end;

              if (thisChangeItem <> nil) then //Blank row - not an order item
                 begin
                 thisOrderList.Clear;
                 thisOrderList.Add(thisChangeItem.ID);

                 if IsAllOrdersNA(thisOrderList) then
                 begin
                    Diagnosis1.Enabled := false;
                    buOrdersDiagnosis.Enabled := false;
                 end
                 else
                 begin
                    Diagnosis1.Enabled := true;
                    buOrdersDiagnosis.Enabled := true;
                 end
              end
              else
              begin
                 buOrdersDiagnosis.Enabled := false;
                 Diagnosis1.Enabled := False;
                 Break;
              end;
           end;
        end;

  if Assigned(thisOrderList) then thisOrderList.Free;
  end;        
end;

procedure TfrmSignOrders.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  j: integer; //CQ5054
begin

       if FOSTFHintWndActive then
       begin
          FOSTFhintWindow.ReleaseHandle ;
          FOSTFHintWndActive := False ;
       end;

       case Key of
           67,99:  if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorSC,fraCoPay.Label24); //C,c
           86,118: if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorCV,fraCoPay.staticText4); //V,v
           79,111: if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorAO,fraCoPay.Label18); //O,o
           82,114: if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorIR,fraCoPay.Label16); //R,r
           69,101: if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorEC,fraCoPay.Label14); //E,e
           77,109: if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorMST,fraCoPay.Label12); //M,m
           72,104: if (ssAlt in Shift) then ShowTreatmentFactorHints(BAFactorsRec.FBAFactorHNC,fraCoPay.lblHNC2); //H,h
           //CQ5054
           83,115: if (ssAlt in Shift) then
                begin
                for j := 0 to clstOrders.Items.Count-1 do
                      clstOrders.Selected[j] := false;
                clstOrders.Selected[0] := true;
                clstOrders.SetFocus;
                end;
           //end CQ5054
       end;
end;

//BILLING AWARE Procedure
procedure TfrmSignOrders.ShowTreatmentFactorHints(var pHintText: string; var pCompName: TORStaticText); // 508
var
 HRect: TRect;
 thisRect: TRect;
 x,y: integer;

begin
  try
     if FOSTFhintWndActive then
        begin
        FOSTFhintWindow.ReleaseHandle;
        FOSTFhintWndActive := False;
        end;
  except
     on E: Exception do
        begin
        {$ifdef debug}ShowMessage('Unhandled exception in procedure TfrmSignOrders.ShowTreatmentFactorHints()');{$endif}
        raise;
        end;
  end;

  try
      FOSTFhintWindow := THintWindow.Create(frmSignOrders);
      FOSTFhintWindow.Color := clInfoBk;
      GetWindowRect(pCompName.Handle,thisRect);
      x := thisRect.Left;
      y := thisRect.Top;
      hrect := FOSTFhintWindow.CalcHintRect(Screen.Width, pHintText,nil);
      hrect.Left   := hrect.Left + X;
      hrect.Right  := hrect.Right + X;
      hrect.Top    := hrect.Top + Y;
      hrect.Bottom := hrect.Bottom + Y;

  if FOSTFHintWndActive then
     begin
     with fraCoPay do
        begin
        //Abbreviated captions
        Label23.ShowHint := false;
        StaticText1.ShowHint := false;
        Label17.ShowHint := false;
        Label15.ShowHint := false;
        Label13.ShowHint := false;
        Label11.ShowHint := false;
        lblHNC.ShowHint := false;
        //Long captions
        staticText4.ShowHint := false;
        Label17.ShowHint := false;
        Label18.ShowHint := false;
        Label15.ShowHint := false;
        Label16.ShowHint := false;
        Label13.ShowHint := false;
        Label14.ShowHint := false;
        Label11.ShowHint := false;
        Label12.ShowHint := false;
        lblHNC.ShowHint := false;
        lblHNC2.ShowHint := false;
        end;
     end
  else
     begin
     with fraCoPay do
        begin
        //Abbreviated captions
        Label23.ShowHint := true;
        StaticText1.ShowHint := true;
        Label17.ShowHint := true;
        Label15.ShowHint := true;
        Label13.ShowHint := true;
        Label11.ShowHint := true;
        lblHNC.ShowHint := true;
        //Long captions        
        staticText4.ShowHint := true;
        Label17.ShowHint := true;
        Label18.ShowHint := true;
        Label15.ShowHint := true;
        Label16.ShowHint := true;
        Label13.ShowHint := true;
        Label14.ShowHint := true;
        Label11.ShowHint := true;
        Label12.ShowHint := true;
        lblHNC.ShowHint := true;
        lblHNC2.ShowHint := true;
        end;
     end;

      FOSTFhintWindow.ActivateHint(hrect, pHintText);
      FOSTFHintWndActive := True;
  except
     on E: Exception do
        begin
        {$ifdef debug}ShowMessage('Unhandled exception in procedure TfrmSignOrders.ShowTreatmentFactorHints()');{$endif}
        raise;
        end;
  end;
end;

procedure TfrmSignOrders.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   try
      if FOSTFhintWndActive then
      begin
         FOSTFhintWindow.ReleaseHandle;
         FOSTFHintWndActive := False;
         Application.ProcessMessages;
      end;
  except
     on E: Exception do
        begin
        {$ifdef debug}ShowMessage('Unhandled exception in procedure TfrmSignOrders.FormMouseMove()');{$endif}
        raise;
        end;
  end;
end;

procedure TfrmSignOrders.fraCoPaylblHNCMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FOSTFHintWndActive then
     begin
     with fraCoPay do
        begin
        //Abbreviated captions
        Label23.ShowHint := false;
        StaticText1.ShowHint := false;
        Label17.ShowHint := false;
        Label15.ShowHint := false;
        Label13.ShowHint := false;
        Label11.ShowHint := false;
        lblHNC.ShowHint := false;
        //Long captions
        Label24.ShowHint := false;
        staticText4.ShowHint := false;
        Label17.ShowHint := false;
        Label18.ShowHint := false;
        Label15.ShowHint := false;
        Label16.ShowHint := false;
        Label13.ShowHint := false;
        Label14.ShowHint := false;
        Label11.ShowHint := false;
        Label12.ShowHint := false;
        lblHNC.ShowHint := false;
        lblHNC2.ShowHint := false;
        end;
     end
  else
     begin
     with fraCoPay do
        begin
        //Abbreviated captions
        Label23.ShowHint := true;
        StaticText1.ShowHint := true;
        Label17.ShowHint := true;
        Label15.ShowHint := true;
        Label13.ShowHint := true;
        Label11.ShowHint := true;
        lblHNC.ShowHint := true;
        //Long captions
        Label24.ShowHint := true;
        staticText4.ShowHint := true;
        Label17.ShowHint := true;
        Label18.ShowHint := true;
        Label15.ShowHint := true;
        Label16.ShowHint := true;
        Label13.ShowHint := true;
        Label14.ShowHint := true;
        Label11.ShowHint := true;
        Label12.ShowHint := true;
        lblHNC.ShowHint := true;
        lblHNC2.ShowHint := true;
        end;
     end;

end;

procedure TfrmSignOrders.fraCoPayLabel23Enter(Sender: TObject);
begin
    (Sender as TORStaticText).Font.Style := [fsBold];
end;

procedure TfrmSignOrders.fraCoPayLabel23Exit(Sender: TObject);
begin
    (Sender as TORStaticText).Font.Style := [];
end;

procedure TfrmSignOrders.SetItemTextToState;
var
  i : integer;
begin
  //The with statement below would cause access violations on other Delphi machines.
  {  with clstOrders do
    begin }
  //Must use fully qualifying path includeing the unit... very wierd!

  if fOrdersSign.frmSignOrders.clstOrders.Count < 1 then Exit;
  for i := 0 to fOrdersSign.frmSignOrders.clstOrders.Count-1 do
    if fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i] <> nil then //Not a Group Title
    begin
      if fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i] is TOrder then
      if fOrdersSign.frmSignOrders.clstOrders.Checked[i] then
        fOrdersSign.frmSignOrders.clstOrders.Items[i] := 'Checked '+TOrder(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i]).Text
      else
        fOrdersSign.frmSignOrders.clstOrders.Items[i] := 'Not Checked '+TOrder(fOrdersSign.frmSignOrders.clstOrders.Items.Objects[i]).Text;
    end;
  if fOrdersSign.frmSignOrders.clstOrders.ItemIndex >= 0 then
    fOrdersSign.frmSignOrders.clstOrders.Selected[fOrdersSign.frmSignOrders.clstOrders.ItemIndex] := True;
//    end;
end;

procedure TfrmSignOrders.clstOrdersKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Space) then
    FormatListForScreenReader
end;

procedure TfrmSignOrders.FormatListForScreenReader;
var
  ListStateOn : longbool;
  Success: longbool;
begin
  //Determine if a screen reader is currently being used.
  Success := SystemParametersInfo(SPI_GETSCREENREADER, 0, @ListStateOn,0);
  if Success and ListStateOn then
    SetItemTextToState;
end;

end.
