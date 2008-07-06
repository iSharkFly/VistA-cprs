unit fODMeds;

{$OPTIMIZATION OFF}                              // REMOVE AFTER UNIT IS DEBUGGED

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fODBase, StdCtrls, ComCtrls, ExtCtrls, ORCtrls, Grids, Buttons, uConst, ORDtTm,
  Menus, XUDIGSIGSC_TLB;

const
  UM_DELAYCLICK = 11037;  // temporary for listview click event

type
  TfrmODMeds = class(TfrmODBase)
    txtMed: TEdit;
    pnlMeds: TPanel;
    btnSelect: TButton;
    pnlFields: TPanel;
    lstQuick: TCaptionListView;
    sptSelect: TSplitter;
    lstAll: TCaptionListView;
    dlgStart: TORDateTimeDlg;
    cboXDosage: TORComboBox;
    cboXRoute: TORComboBox;
    pnlXDuration: TPanel;
    pnlXSequence: TKeyClickPanel;
    btnXSequence: TSpeedButton;
    timCheckChanges: TTimer;
    popDuration: TPopupMenu;
    popDays: TMenuItem;
    popBlank: TMenuItem;
    hours1: TMenuItem;
    minutes1: TMenuItem;
    popXSequence: TPopupMenu;
    and1: TMenuItem;
    then1: TMenuItem;
    months1: TMenuItem;
    weeks1: TMenuItem;
    pnlXSchedule: TPanel;
    cboXSchedule: TORComboBox;
    chkXPRN: TCheckBox;
    txtXDuration: TCaptionEdit;
    spnXDuration: TUpDown;
    pnlXDurationButton: TKeyClickPanel;
    btnXDuration: TSpeedButton;
    pnlTop: TPanel;
    lblRoute: TLabel;
    lblSchedule: TLabel;
    grdDoses: TCaptionStringGrid;
    lblGuideline: TStaticText;
    tabDose: TTabControl;
    cboDosage: TORComboBox;
    cboRoute: TORComboBox;
    cboSchedule: TORComboBox;
    chkPRN: TCheckBox;
    btnXInsert: TButton;
    btnXRemove: TButton;
    pnlBottom: TPanel;
    lblComment: TLabel;
    lblDays: TLabel;
    lblQuantity: TLabel;
    lblRefills: TLabel;
    lblPriority: TLabel;
    chkDoseNow: TCheckBox;
    memComment: TCaptionMemo;
    lblQtyMsg: TStaticText;
    txtSupply: TCaptionEdit;
    spnSupply: TUpDown;
    txtQuantity: TCaptionEdit;
    spnQuantity: TUpDown;
    txtRefills: TCaptionEdit;
    spnRefills: TUpDown;
    grpPickup: TGroupBox;
    radPickWindow: TRadioButton;
    radPickMail: TRadioButton;
    radPickClinic: TRadioButton;
    cboPriority: TORComboBox;
    chkSC: TCheckBox;
    lblAdminTime: TStaticText;
    stcPI: TStaticText;
    chkPtInstruct: TCheckBox;
    memPI: TMemo;
    Image1: TImage;
    memDrugMsg: TMemo;
    txtNSS: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure tabDoseChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure txtMedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtMedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtMedChange(Sender: TObject);
    procedure txtMedExit(Sender: TObject);
    procedure ListViewEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure ListViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewResize(Sender: TObject);
    procedure lstQuickData(Sender: TObject; Item: TListItem);
    procedure lstQuickDataHint(Sender: TObject; StartIndex,
      EndIndex: Integer);
    procedure lstAllDataHint(Sender: TObject; StartIndex,
      EndIndex: Integer);
    procedure lstAllData(Sender: TObject; Item: TListItem);
    procedure lblGuidelineClick(Sender: TObject);
    procedure ListViewClick(Sender: TObject);
    procedure cboScheduleChange(Sender: TObject);
    procedure cboRouteChange(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure cboDosageClick(Sender: TObject);
    procedure cboDosageChange(Sender: TObject);
    procedure cboScheduleClick(Sender: TObject);
    procedure txtSupplyChange(Sender: TObject);
    procedure txtQuantityChange(Sender: TObject);
    procedure cboRouteExit(Sender: TObject);
    procedure grdDosesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdDosesKeyPress(Sender: TObject; var Key: Char);
    procedure grdDosesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdDosesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure cboXDosageClick(Sender: TObject);
    procedure cboXDosageExit(Sender: TObject);
    procedure cboXRouteClick(Sender: TObject);
    procedure cboXRouteExit(Sender: TObject);
    procedure cboXScheduleClick(Sender: TObject);
    procedure pnlXDurationEnter(Sender: TObject);
    procedure pnlXDurationExit(Sender: TObject);
    procedure txtXDurationChange(Sender: TObject);
    procedure cboXDosageEnter(Sender: TObject);
    procedure cboXDosageChange(Sender: TObject);
    procedure cboXRouteChange(Sender: TObject);
    procedure cboXScheduleChange(Sender: TObject);
    procedure pnlXSequenceExit(Sender: TObject);
    procedure btnXSequenceClick(Sender: TObject);
    procedure grdDosesExit(Sender: TObject);
    procedure ListViewEnter(Sender: TObject);
    procedure timCheckChangesTimer(Sender: TObject);
    procedure popDurationClick(Sender: TObject);
    procedure popXSequenceClick(Sender: TObject);
    procedure chkSCEnter(Sender: TObject);
    procedure chkSCClick(Sender: TObject);
    procedure cmdAcceptClick(Sender: TObject);
    procedure btnXInsertClick(Sender: TObject);
    procedure btnXRemoveClick(Sender: TObject);
    procedure pnlXScheduleEnter(Sender: TObject);
    procedure pnlXScheduleExit(Sender: TObject);
    procedure chkPtInstructClick(Sender: TObject);
    procedure pnlFieldsResize(Sender: TObject);
    procedure chkDoseNowClick(Sender: TObject);
    procedure cboDosageExit(Sender: TObject);
    procedure chkXPRNClick(Sender: TObject);
    procedure memCommentClick(Sender: TObject);
    procedure btnXDurationClick(Sender: TObject);
    procedure chkPRNClick(Sender: TObject);
    procedure grdDosesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdDosesEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboXRouteEnter(Sender: TObject);
    procedure pnlXSequenceEnter(Sender: TObject);
    procedure pnlMessageEnter(Sender: TObject);
    procedure pnlMessageExit(Sender: TObject);
    procedure memMessageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure memPIClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure spnQuantityChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure memPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtNSSClick(Sender: TObject);
    procedure cboScheduleEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboScheduleExit(Sender: TObject);
    procedure cboXScheduleExit(Sender: TObject);
    procedure cboDosageKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboXDosageKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtSupplyClick(Sender: TObject);
    procedure txtQuantityClick(Sender: TObject);
    procedure txtRefillsClick(Sender: TObject);
    procedure WMClose(var Msg : TWMClose); message WM_CLOSE;
    procedure cboXScheduleEnter(Sender: TObject);
    //procedure btnNSSClick(Sender: TObject);
  private
    FScheduleChanged : Boolean;
    {selection}
    FAllItems:   TStringList;
    FAllFirst:   Integer;
    FAllLast:    Integer;
    FAllList:    Integer;
    FQuickList:  Integer;
    FQuickItems: TStringList;
    FChangePending: Boolean;
    FKeyTimerActive: Boolean;
    FActiveMedList: TListView;
    FRowHeight: Integer;
    FFromSelf: Boolean;
    {edit}
    FAllDoses:  TStringList;
    FAllDrugs:  TStringList;
    FGuideline: TStringList;
    FLastUnits:    string;
    FLastSchedule: string;
    FLastDuration: string;
    FLastInstruct: string;
    FLastDispDrug: string;
    FLastQuantity: Double;
    FLastSupply:   Integer;
    FLastPickup:   string;
    FSIGVerb: string;
    FSIGPrep: string;
    FDropColumn: Integer;
    FDrugID: string;
    FInptDlg: Boolean;
    FUpdated: Boolean;
    FSuppressMsg: Boolean;
    FPtInstruct: string;
    FAltChecked: Boolean;
    FOutptIV: Boolean;
    FQOQuantity: Double;
    FQODosage: string;
    FNoZERO: boolean;
    FIsQuickOrder: boolean;
    FAdminTimeLbl: string;
    FDisabledDefaultButton: TButton;
    FDisabledCancelButton: TButton;
    FShrinked: boolean;
    FShrinkDrugMsg: boolean;
    FResizedAlready: boolean;
    FQOInitial: boolean;
    FOrigiMsgDisp: boolean;
    FNSSOther: boolean;
    {selection}
    FShowPnlXScheduleOk : boolean;
    FRemoveText : Boolean;
    FSmplPRNChkd: Boolean;
    procedure ChangeDelayed;
    function FindQuickOrder(const x: string): Integer;
    function isUniqueQuickOrder(iText: string): Boolean;
    procedure LoadMedCache(First, Last: Integer);
    procedure ScrollToVisible(AListView: TListView);
    procedure StartKeyTimer;
    procedure StopKeyTimer;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    {edit}
    procedure ResetOnMedChange;
    procedure ResetOnTabChange;
    procedure SetControlsInpatient;
    procedure SetControlsOutpatient;
    procedure SetOnMedSelect;
    procedure SetOnQuickOrder;
    procedure SetVisibleCommentRows( Rows: integer );
    procedure ShowMedSelect;
    procedure ShowMedFields;
    procedure ShowControlsSimple;
    procedure ShowControlsComplex;
    procedure SetDosage(const x: string);
    procedure SetPickup(const x: string);
    procedure SetSchedule(const x: string);
    procedure CheckFormAltDose(DispDrug: Integer);
    function DurationToDays: Integer;
    function ConstructedDoseFields(const ADose: string; PrependName: Boolean = FALSE): string;
    function FieldsForDose(ARow: Integer): string;
    function FieldsForDrug(const DrugID: string): string;
    function FindCommonDrug(DoseList: TStringList): string;
    function FindDoseFields(const Drug, ADose: string): string;
    function InpatientSig: string;
    function OutpatientSig: string;
    procedure UpdateRelated(DelayUpdate: Boolean = TRUE);
    procedure UpdateRefills(const CurDispDrug: string; CurSupply: Integer);
    procedure UpdateSC(const CurDispDrug: string);
    procedure UpdateStartExpires(const CurSchedule: string);
    procedure UpdateDefaultSupply(const CurUnits, CurSchedule, CurDuration, CurDispDrug: string;
      var CurSupply: Integer; var CurQuantity: double; var SkipQtyCheck: Boolean);
    procedure UpdateSupplyQuantity(const CurUnits, CurSchedule, CurDuration, CurDispDrug: string;
      var CurSupply: Integer; var CurQuantity: double);
    procedure UpdateDurationControls( FreeText: boolean);
    function DisableDefaultButton(Control: TWinControl): boolean;
    function DisableCancelButton(Control: TWinControl): boolean;
    procedure RestoreDefaultButton;
    procedure RestoreCancelButton;
    function ValueOf(FieldID: Integer; ARow: Integer = -1): string;
    function ValueOfResponse(FieldID: Integer; AnInstance: Integer = 1): string;
    function ValFor(FieldID, ARow: Integer): string;
    function TextDosage(ADosage: string): string;
    //NSS
    function CreateOtherScheduel: string;
    function CreateOtherScheduelComplex: string;
    procedure ShowEditor(ACol, ARow: Integer; AChar: Char);
    procedure DropLastSequence(ASign: integer = 0);
    procedure DispOrderMessage(const AMessage: string);
    procedure UMDelayClick(var Message: TMessage); message UM_DELAYCLICK;
    procedure UMDelayEvent(var Message: TMessage); message UM_DELAYEVENT;
    procedure UMShowNSSBuilder(var Message: TMessage); message UM_NSSOTHER;
    function  IfIsIMODialog: boolean;
    procedure ValidateInpatientSchedule(ScheduleCombo: TORComboBox);
//    function ValidateRoute(RouteCombo: TORComboBox) : Boolean; Removed based on Site feeback. See CQ: 7518
    function IsSupplyAndOutPatient : boolean;
    function GetSchedListIndex(SchedCombo: TORComboBox; pSchedule: String):integer;
  protected
    procedure InitDialog; override;
    procedure Validate(var AnErrMsg: string); override;
  public
    ARow1: integer;
    procedure SetupDialog(OrderAction: Integer; const ID: string); override;
    procedure CheckDecimal(var AStr: string);
  end;

var
  frmODMeds: TfrmODMeds;
  crypto: IXuDigSigS;

implementation

{$R *.DFM}

uses rCore, uCore, ORFn, rODMeds, rODBase, rOrders, fRptBox, fODMedOIFA,
  uAccessibleStringGrid, uOrders, fOtherSchedule, StrUtils, fFrame;

const
  {grid columns for complex dosing}
  COL_SELECT   =  0;
  COL_DOSAGE   =  1;
  COL_ROUTE    =  2;
  COL_SCHEDULE =  3;
  COL_DURATION =  4;
  COL_SEQUENCE =  5;
  COL_CHKXPRN  =  6;
  VAL_DOSAGE   = 10;
  VAL_ROUTE    = 20;
  VAL_SCHEDULE = 30;
  VAL_DURATION = 40;
  VAL_SEQUENCE = 50;
  VAL_CHKXPRN  = 60;
  TAB          = #9;
  {field identifiers}
  FLD_LOCALDOSE =  1;
  FLD_STRENGTH  =  2;
  FLD_DRUG_ID   =  3;
  FLD_DRUG_NM   =  4;
  FLD_DOSEFLDS  =  5;
  FLD_UNITNOUN  =  6;
  FLD_TOTALDOSE =  7;
  FLD_DOSETEXT  =  8;
  FLD_INSTRUCT  = 10;
  FLD_DOSEUNIT  = 11;
  FLD_ROUTE_ID  = 15;
  FLD_ROUTE_NM  = 16;
  FLD_ROUTE_AB  = 17;
  FLD_ROUTE_EX  = 18;
  FLD_SCHEDULE  = 20;
  FLD_SCHED_EX  = 21;
  FLD_SCHED_TYP = 22;
  FLD_DURATION  = 30;
  FLD_SEQUENCE  = 31;
  FLD_MISC_FLDS = 50;
  FLD_SUPPLY    = 51;
  FLD_QUANTITY  = 52;
  FLD_REFILLS   = 53;
  FLD_PICKUP    = 55;
  FLD_QTYDISP   = 56;
  FLD_SC        = 58;
  FLD_PRIOR_ID  = 60;
  FLD_PRIOR_NM  = 61;
  FLD_START_ID  = 70;
  FLD_START_NM  = 71;
  FLD_EXPIRE    = 72;
  FLD_ANDTHEN   = 73;
  FLD_NOW_ID    = 75;
  FLD_NOW_NM    = 76;
  FLD_COMMENT   = 80;
  FLD_PTINSTR   = 85;
  {dosage type tab index values}
  TI_DOSE       =  0;
  TI_RATE       =  99;
  TI_COMPLEX    =  1;
  {misc constants}
  TIMER_ID = 6902;                                // arbitrary number
  TIMER_DELAY = 500;                              // 500 millisecond delay
  TIMER_FROM_DAYS = 1;
  TIMER_FROM_QTY  = 2;
  {text constants}
  TX_ADMIN      = 'Requested Start: ';
  TX_TAKE       = '';
  TX_NO_DEA     = 'Provider must have a DEA# or VA# to order this medication';
  TC_NO_DEA     = 'DEA# Required';
  TX_NO_MED     = 'Medication must be selected.';
  TX_NO_SEQ     = 'Missing one or more conjunction.';
  TX_NO_DOSE    = 'Dosage must be entered.';
  TX_DOSE_NUM   = 'Dosage may not be numeric only';
  TX_DOSE_LEN   = 'Dosage may not exceed 60 characters';
  TX_NO_ROUTE   = 'Route must be entered.';
  TX_NF_ROUTE   = 'Route not found in the Medication Routes file.';
  TX_NO_SCHED   = 'Schedule must be entered.';
  TX_NO_PICK    = 'A method for picking up the medication must be entered.';
  TX_RNG_REFILL = 'The number of refills must be in the range of 0 through ';
  TX_SCH_QUOTE  = 'Schedule must not have quotemarks in it.';
  TX_SCH_MINUS  = 'Schedule must not have a dash at the beginning.';
  TX_SCH_SPACE  = 'Schedule must have only one space in it.';
  TX_SCH_LEN    = 'Schedule must be less than 70 characters.';
  TX_SCH_PRN    = 'Schedule cannot include PRN - use Comments to enter PRN.';
  TX_SCH_ZERO   = 'Schedule cannot be Q0';
  TX_SCH_LSP    = 'Schedule may not have leading spaces.';
  TX_SCH_NS     = 'Unable to resolve non-standard schedule.';
  TX_MAX_STOP   = 'The maximum expiration for this order is ';
  TX_OUTPT_IV   = 'This patient has not been admitted.  Only IV orders may be entered.';
  TX_QTY_NV     = 'Unable to validate quantity.';
  TX_QTY_MAIL   = 'Quantity for mailed items must be a whole number.';
  TX_SUPPLY_LIM = 'Days Supply may not be greater than 90.';
  TX_SUPPLY_LIM1 = 'Days Supply may not be less than 1.';
  TX_SUPPLY_NINT= 'Days Supply is an invalid number.';
  TC_RESTRICT   = 'Ordering Restrictions';
  TC_GUIDELINE  = 'Restrictions/Guidelines';
  TX_QTY_PRE    = '>> Quantity Dispensed: ';
  TX_QTY_POST   = ' <<';

{ procedures inherited from fODBase --------------------------------------------------------- }

procedure TfrmODMeds.FormCreate(Sender: TObject);
var
  ListCount: Integer;
  x: string;
begin
  frmFrame.pnlVisit.Enabled := false;
  AutoSizeDisabled := True;
  inherited;
  btnXDuration.Align := alClient;
  AllowQuickOrder := True;
  FSmplPRNChkd := False; // GE CQ7585
  CheckAuthForMeds(x);
  if Length(x) > 0 then
  begin
    InfoBox(x, TC_RESTRICT, MB_OK);
    Close;
    Exit;
  end;
  if DlgFormID = OD_MEDINPT  then FInptDlg := TRUE;
  if DlgFormID = OD_MEDOUTPT then FInptDlg := FALSE;
  if DlgFormID = OD_MEDNONVA then FInptDlg := FALSE;
  if DlgFormID = OD_MEDS  then FInptDlg := OrderForInpatient;
  if XfInToOutNow then
    FInptDlg := False;
  if XferOuttoInOnMeds then
    FInptDlg := True;
  if ImmdCopyAct and isUDGroup and (Patient.Inpatient) then
    FInptDlg := True;
  if ImmdcopyAct and (not isUDGroup) then
    FInptDlg := False;
  if FInptDlg then FillerID := 'PSI' else FillerID := 'PSO';
  FGuideline := TStringList.Create;
  FAllDoses  := TStringList.Create;
  FAllDrugs  := TStringList.Create;
  StatusText('Loading Dialog Definition');
  if      DlgFormID = OD_MEDINPT  then Responses.Dialog := 'PSJ OR PAT OE'
  else if DlgFormID = OD_MEDOUTPT then Responses.Dialog := 'PSO OERR'
  else if DlgFormID = OD_MEDNONVA then Responses.Dialog := 'PSH OERR'
  else                                 Responses.Dialog := 'PS MEDS';  // loads formatting info
  {if not FInptDlg then } Responses.SetPromptFormat('INSTR', '@');
  StatusText('Loading Schedules');
  //if (Self.EvtID > 0) then LoadSchedules(cboSchedule.Items)
  //else LoadSchedules(cboSchedule.Items, FInptDlg);
  LoadSchedules(cboSchedule.Items, FInptDlg);  
  StatusText('');
  if FInptDlg then SetControlsInpatient else SetControlsOutpatient;
  CtrlInits.SetControl(cboPriority, 'Priority');
  FSuppressMsg := CtrlInits.DefaultText('DispMsg') = '1';
  FOrigiMsgDisp := FSuppressMsg;
  InitDialog;
  if FInptDlg then
  begin
    txtNss.Visible := True;
    //cboSchedule.ListItemsOnly := True;
    //cboXSchedule.ListItemsOnly := True;
  end;
  with grdDoses do
  begin
    ColWidths[0] := 8;  // select
    ColWidths[1] := 160; // dosage
    ColWidths[2] := 82;  // route
    ColWidths[3] := 102;  // schedule
    ColWidths[4] := 70;  // duration
    ColWidths[5] := 58;  // and/then
    Cells[1, 0]  := 'Dosage';
    Cells[2, 0]  := 'Route';
    Cells[3, 0]  := 'Schedule';
    Cells[4, 0]  := 'Duration (optional)';
    Cells[5, 0]  := 'then/and';
  end;
  TAccessibleStringGrid.WrapControl(grdDoses);

  // medication selection
  FRowHeight := MainFontHeight + 1;

  IsIMO := IfIsIMODialog; //IMO
  if (Self.EvtID > 0) then IsIMO := False; // event order can not be IMO order.
  if FInptDlg then x := 'UD RX'
  else if (not FInptDlg) and (DlgFormID = OD_MEDNONVA) then x := 'NV RX'
  else x := 'O RX';
  if FInptDlg and (not OrderForInpatient) and (not IsIMO) then        //IMO
  begin
    FOutptIV := TRUE;
    x := 'IVM RX';
  end;
  ListForOrderable(FAllList, ListCount, x);
  lstAll.Items.Count := ListCount;
  FAllItems := TStringList.Create;
  FAllFirst := -1;
  FAllLast  := -1;
  FQuickItems := TStringList.Create;
  ListForQuickOrders(FQuickList, ListCount, x);
  if ListCount > 0 then
  begin
    lstQuick.Items.Count := ListCount;
    SubsetOfQuickOrders(FQuickItems, FQuickList, 0, 0);
    FActiveMedList := lstQuick;
  end else
  begin
    lstQuick.Items.Count := 1;
    ListCount := 1;
    FQuickItems.Add('0^(No quick orders available)');
    FActiveMedList := lstAll;
  end;
  // set the height based on user parameter here
  with lstQuick do if ListCount < VisibleRowCount
    then Height := (((Height - 6) div VisibleRowCount) * ListCount) + 6;
  pnlFields.Height := memOrder.Top - 4 - pnlFields.Top;
  FNoZero := False;
  FShrinked := False;
  FShrinkDrugMsg := False;
  FResizedAlready := False;
  FShowPnlXScheduleOk := True;
  FRemoveText := True;
end;

procedure TfrmODMeds.FormDestroy(Sender: TObject);
begin
  {selection}
  FQuickItems.Free;
  FAllItems.Free;
  {edit}
  FGuideline.Free;
  FAllDoses.Free;
  FAllDrugs.Free;
  TAccessibleStringGrid.UnwrapControl(grdDoses);
  frmFrame.pnlVisit.Enabled := true;
  inherited;
end;

procedure TfrmODMeds.InitDialog;
{ Executed each time dialog is reset after pressing accept.  Clears controls & responses }
begin
  inherited;
  FLastPickup := ValueOf(FLD_PICKUP);
  Changing := True;
  ResetOnMedChange;
  txtMed.Text := '';
  txtMed.Tag := 0;
  lstQuick.Selected := nil;
  lstAll.Selected := nil;
  if Visible then ShowMedSelect;
  Changing := False;
  FIsQuickOrder := False;
  FQOQuantity := 0 ;
  FQODosage   := '';
  FQOInitial  := False;
  FNSSOther   := False;
end;

procedure TfrmODMeds.SetupDialog(OrderAction: Integer; const ID: string);
var
  AnInstr, OrderID, nsSch, Text: string;
  ix: integer;
begin
  inherited;
  if XfInToOutNow then DisplayGroup := DisplayGroupByName('O RX');
  if CharAt(ID,1)='X' then
  begin
    OrderID := Copy(Piece(ID, ';', 1), 2, Length(ID));
    CheckExistingPI(OrderID, FPtInstruct);
  end;
  if OrderAction = ORDER_QUICK then
  begin
    FIsQuickOrder := True;
    FQOInitial := True;
  end
  else
  begin
    FIsQuickOrder := False;
    FQOInitial := False;
  end;
  if lblDays.Visible then SetVisibleCommentRows(2) else SetVisibleCommentRows(4);
  if OrderAction in [ORDER_COPY, ORDER_EDIT] then Responses.Remove('START', 1);
  if OrderAction in [ORDER_COPY, ORDER_EDIT, ORDER_QUICK] then
  begin
    Changing := True;
    txtMed.Tag  := StrToIntDef(Responses.IValueFor('ORDERABLE', 1), 0);
    SetOnMedSelect;                               // set up for this medication
    SetOnQuickOrder;                              // insert quick order responses
    ShowMedFields;
    if (OrderAction = ORDER_EDIT) and OrderIsReleased(Responses.EditOrder)
      then btnSelect.Enabled := False;
    if (OrderAction in [ORDER_COPY, ORDER_EDIT]) and (self.EvtID <= 0) then //nss
    begin
       if NSSchedule then
       begin
         for ix := 0 to Responses.TheList.Count - 1 do
         begin
           if TResponse(Responses.TheList[ix]).promptid = 'SCHEDULE'  then
           begin
             nsSch :=  TResponse(Responses.theList[ix]).EVALUE;
             if length(nsSch) > 0 then
             begin
                SetSchedule(nsSch);
                {cboSchedule.SelectByID(nsSch);
                if cboSchedule.ItemIndex < 0 then
                begin
                  cboSchedule.Items.Add(nsSch);
                  cboSchedule.ItemIndex := cboSchedule.Items.IndexOf(nsSch);
                end;}
             end;
           end;
         end;
       end;
    end;  //nss
    if ((OrderAction <> Order_COPY) and (OrderAction <> Order_EDIT)) or
    (XfInToOutNow = true) then UpdateRelated(FALSE); //AGP Change
    Changing := False;
  end;
  { prevent the SIG from being part of the comments on pre-CPRS prescriptions }
  if (OrderAction in [ORDER_COPY, ORDER_EDIT]) and (cboDosage.Text = '') then
  begin
    OrderID := Copy(Piece(ID, ';', 1), 2, Length(ID));
    AnInstr := TextForOrder(OrderID);
    pnlMessage.TabOrder := 0;
    DispOrderMessage(AnInstr);
    if OrderAction = ORDER_COPY
      then AnInstr := 'Copy: ' + AnInstr
      else AnInstr := 'Change: ' + AnInstr;
    Text := AnsiReplaceText(AnInstr,CRLF,'');
    Caption := Text;
    memComment.Clear;  // sometimes the sig is in the comment
  end;
  ControlChange(Self);
  if Self.IsSupply then
    btnSelect.Enabled := False;
end;

procedure TfrmODMeds.Validate(var AnErrMsg: string);
var
  i,ie,code: Integer;

  procedure SetError(const x: string);
  begin
    if Length(AnErrMsg) > 0 then AnErrMsg := AnErrMsg + CRLF;
    AnErrMsg := AnErrMsg + x;
  end;

  procedure ValidateDosage(const x: string);
  begin
    if Length(x) = 0 then SetError(TX_NO_DOSE);
  end;

  procedure ValidateRoute(const x: string; NeedLookup: Boolean; AnInstance: Integer);
  var
    RouteID, RouteAbbr: string;
  begin
    //if order does not have route, and is not a supply order,
    // and is not an outpaitent order, then display error text to require route
    if (Length(x) = 0) and (Not IsSupplyAndOutPatient) then
    begin
      if cboRoute.Showing = true then cboRoute.SetFocus;  //CQ: 7467
      SetError(TX_NO_ROUTE);
    end;
    if (Length(x) > 0) and NeedLookup then
    begin
      LookupRoute(x, RouteID, RouteAbbr);
      if RouteID = '0'
        then
        begin
         if cboRoute.Showing = true then cboRoute.SetFocus;    //CQ: 7467
        SetError(TX_NF_ROUTE);
        end
        else Responses.Update('ROUTE', AnInstance, RouteID, RouteAbbr);
    end;
  end;

  procedure ValidateSchedule(const x: string; AnInstance: Integer);
  const
    SCH_BAD = 0;
    SCH_NO_RTN = -1;
  var
    ValidLevel: Integer;
    ARoute, ADrug, tmpX: string;
  begin
    ARoute := ValueOfResponse(FLD_ROUTE_ID, AnInstance);
    ADrug  := ValueOfResponse(FLD_DRUG_ID,  AnInstance);
    tmpX := x; //Changed for CQ: 7370 - it was tmpX := Trim(x);
    if (Length(tmpX) = 0) and (not FInptDlg) then SetError(TX_NO_SCHED)
    else if (Length(tmpX) = 0) and FInptDlg and ScheduleRequired(txtMed.Tag, ARoute, ADrug)
      then SetError(TX_NO_SCHED);
    if Length(tmpX) > 0 then
    begin
      if FInptDlg then ValidLevel := ValidSchedule(tmpX) else ValidLevel := ValidSchedule(tmpX, 'O');
      if ValidLevel = SCH_NO_RTN then
      begin
        if Pos('"', tmpX) > 0                              then SetError(TX_SCH_QUOTE);
        if Copy(tmpX, 1, 1) = '-'                          then SetError(TX_SCH_MINUS);
        if Pos(' ', Copy(tmpX, Pos(' ', tmpX) + 1, 999)) > 0  then SetError(TX_SCH_SPACE);
        if Length(tmpX) > 70                               then SetError(TX_SCH_LEN);
        if (Pos('P RN', tmpX) > 0) or (Pos('PR N', tmpX) > 0) then SetError(TX_SCH_PRN);
        if Pos('Q0', tmpX) > 0                             then SetError(TX_SCH_ZERO);
        if TrimLeft(tmpX) <> tmpX                             then SetError(TX_SCH_LSP);
      end;
      if ValidLevel = SCH_BAD then SetError(TX_SCH_NS);
    end;
  end;

begin
  inherited;
  ControlChange(Self);                            // make sure everything is updated
  if txtMed.Tag = 0 then SetError(TX_NO_MED);
  if Responses.InstanceCount('INSTR') < 1 then SetError(TX_NO_DOSE);
  i := Responses.NextInstance('INSTR', 0);
  while i > 0 do
  begin
    if (ValueOfResponse(FLD_DRUG_ID, i) = '') then
    begin
      if not ContainsAlpha(Responses.IValueFor('INSTR', i)) then
      begin
         SetError(TX_DOSE_NUM);
         if tabDose.TabIndex = TI_DOSE then
            cboDosage.SetFocus;    //CQ: 7467
      end;
      if Length(Responses.IValueFor('INSTR', i)) > 60       then
      begin
         SetError(TX_DOSE_LEN);
         cboDosage.SetFocus;  //CQ: 7467
      end;
    end;
    ValidateRoute(Responses.EValueFor('ROUTE', i), Responses.IValueFor('ROUTE', i) = '', i);
    ValidateSchedule(ValueOfResponse(FLD_SCHEDULE, i), i);
    i := Responses.NextInstance('INSTR', i);
  end;
  //AGP Change 26.45 Fix for then/and conjucntion PSI-04-069
  if self.tabDose.TabIndex = 1 then
    begin
       for i := 2 to self.grdDoses.RowCount do
         begin
           if ((ValFor(COL_DOSAGE, i-1) <> '') and (ValFor(COL_DOSAGE, i) <> '')) and (ValFor(COL_SEQUENCE,i-1) = '') then
             begin
              SetError(TX_NO_SEQ);
              Exit;
             end;
         end;
    end;
  if not FInptDlg then                            // outpatient stuff
  begin
    if Responses.IValueFor('PICKUP', 1) = '' then SetError(TX_NO_PICK);
    if StrToIntDef(Responses.IValueFor('REFILLS', 1), 99) > spnRefills.Max
      then SetError(TX_RNG_REFILL + IntToStr(spnRefills.Max));
    with txtQuantity do
      if not ValidQuantity(Responses.IValueFor('QTY', 1)) then SetError(TX_QTY_NV);
    with txtSupply do
    begin
      txtSupply.Text := Trim(txtSupply.Text);
      Val( txtSupply.Text, ie, code);
      if (code <> 0) and (ie = 0)then
      begin
        SetError(TX_SUPPLY_NINT);
        Exit;
      end;
      if (StrToIntDef(Responses.IValueFor('SUPPLY', 1), 0) > 90) then SetError(TX_SUPPLY_LIM);
      if (StrToIntDef(Responses.IValueFor('SUPPLY', 1), 0) < 1)  then SetError(TX_SUPPLY_LIM1);
    end;
  end;
end;

procedure TfrmODMeds.SetVisibleCommentRows( Rows: integer);
begin
  memComment.Height := (Abs(Font.Height)+2)*Rows+8;
end;

procedure TfrmODMeds.SetControlsInpatient;
begin
  FillerID := 'PSI';
  CtrlInits.LoadDefaults(ODForMedsIn);
  lblPriority.Top := pnlFields.Height - cboPriority.Height - lblPriority.Height - 1;
  cboPriority.Top := pnlFields.Height - cboPriority.Height;
  lblDays.Visible := False;
  txtSupply.Visible := False;
  spnSupply.Visible := False;
  lblQuantity.Visible := False;
  txtQuantity.Visible := False;
  spnQuantity.Visible := False;
  lblQtyMsg.Visible := False;
  lblRefills.Visible := False;
  txtRefills.Visible := False;
  spnRefills.Visible := False;
  grpPickup.Visible := False;
  lblPriority.Visible := True;
  cboPriority.Visible := True;
  chkSC.Visible := False;
  chkDoseNow.Visible := True;
  lblAdminTime.Visible := True;
end;

procedure TfrmODMeds.SetControlsOutpatient;
var
  ExceptItem: TMenuItem;
begin
  FillerID := 'PSO';
  CtrlInits.LoadDefaults(ODForMedsOut);
  lblPriority.Top := lblQuantity.Top;
  cboPriority.Top := txtQuantity.Top;
  lblDays.Visible := True;
  txtSupply.Visible := True;
  spnSupply.Visible := True;
  lblQuantity.Visible := True;
  txtQuantity.Visible := True;
  spnQuantity.Visible := True;
  lblQtyMsg.Visible := True;
  lblRefills.Visible := True;
  txtRefills.Visible := True;
  spnRefills.Visible := True;
  grpPickup.Visible := True;
  lblPriority.Visible := True;
  cboPriority.Visible := True;
  chkSC.Visible := True;
  chkDoseNow.Visible := False;
  lblAdminTime.Visible := False;
  ExceptItem := TMenuItem.Create(Self);
  ExceptItem.Caption := 'except';
  ExceptItem.Tag := 3;
  ExceptItem.OnClick := popXSequenceClick;
  popXSequence.Items.Add(ExceptItem);
end;

{ Navigate medication selection lists ------------------------------------------------------- }

{ txtMed methods (including timers) }

procedure TfrmODMeds.WMTimer(var Message: TWMTimer);
begin
  inherited;
  if (Message.TimerID = TIMER_ID) then
  begin
    StopKeyTimer;
    ChangeDelayed;
  end;
end;

procedure TfrmODMeds.StartKeyTimer;
{ start (or restart) a timer (done on keyup to delay before calling OnKeyPause) }
var
  ATimerID: Integer;
begin
  StopKeyTimer;
  ATimerID := SetTimer(Handle, TIMER_ID, TIMER_DELAY, nil);
  FKeyTimerActive := ATimerID > 0;
  // if can't get a timer, just call the event immediately  F
  if not FKeyTimerActive then Perform(WM_TIMER, TIMER_ID, 0);
end;

procedure TfrmODMeds.StopKeyTimer;
{ stop the timer (done whenever a key is pressed or the combobox no longer has focus) }
begin
  if FKeyTimerActive then
  begin
    KillTimer(Handle, TIMER_ID);
    FKeyTimerActive := False;
  end;
end;

function TfrmODMeds.FindQuickOrder(const x: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  if x = '' then Exit;
  for i := 0 to Pred(FQuickItems.Count) do
  begin
    if (Result > -1) or (FQuickItems[i] = '') then Break;
    if AnsiCompareText(x, Copy(Piece(FQuickItems[i],'^',2), 1, Length(x))) = 0 then Result := i;
  end;
end;

procedure TfrmODMeds.txtMedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  x: string;
begin
  if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN] then             // navigation
  begin
    FActiveMedList.Perform(WM_KEYDOWN, Key, 0);
    FFromSelf := True;
    //txtMed.Text := FActiveMedList.Selected.Caption;
    txtMed.SelectAll;
    FFromSelf := False;
    Key := 0;
  end
  else if Key = VK_BACK then
  begin
    FFromSelf := True;
    x := txtMed.Text;
    i := txtMed.SelStart;
    if i > 1 then Delete(x, i + 1, Length(x)) else x := '';
    txtMed.Text := x;
    if i > 1 then txtMed.SelStart := i;
    FFromSelf := False;
  end
  else {StartKeyTimer};
end;

procedure TfrmODMeds.txtMedKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN]) then StartKeyTimer;
end;

procedure TfrmODMeds.txtMedChange(Sender: TObject);
begin
  if FFromSelf then Exit;
  FChangePending := True;
end;

procedure TfrmODMeds.ScrollToVisible(AListView: TListView);
var
  Offset: Integer;
  SelRect: TRect;
begin
  AListView.Selected.MakeVisible(FALSE);
  SelRect := AListView.Selected.DisplayRect(drBounds);
  FRowHeight := SelRect.Bottom - SelRect.Top;
  Offset := AListView.Selected.Index - AListView.TopItem.Index;
  Application.ProcessMessages;
  if Offset > 0 then AListView.Scroll(0, (Offset * FRowHeight));
  Application.ProcessMessages;
end;

procedure TfrmODMeds.ChangeDelayed;
var
  QuickIndex, AllIndex: Integer;
  NewText, OldText, UserText: string;
  UniqueText: Boolean;
begin
  FRemoveText := False;
  UniqueText := False;
  FChangePending := False;
  if (Length(txtMed.Text) > 0) and (txtMed.SelStart = 0) then Exit;  // don't lookup null
  // lookup item in appropriate list box
  NewText := '';
  UserText := Copy(txtMed.Text, 1, txtMed.SelStart);
  QuickIndex := FindQuickOrder(UserText);            // look in quick list first
  AllIndex := IndexOfOrderable(FAllList, UserText);  // but always synch the full list
  if UserText <> Copy(txtMed.Text, 1, txtMed.SelStart) then Exit;  // if typing during lookup
  if AllIndex > -1 then
  begin
    lstAll.Selected := lstAll.Items[AllIndex];
    FActiveMedList := lstAll;
  end;
  if QuickIndex > -1 then
  begin
    try
      lstQuick.Selected := lstQuick.Items[QuickIndex];
      lstQuick.ItemFocused := lstQuick.Selected;
      NewText := lstQuick.Selected.Caption;
      FActiveMedList := lstQuick;
      //Search Quick List for Uniqueness
      UniqueText := isUniqueQuickOrder(UserText);
    except
      //doing nothing  short term solution related to 117
    end;
  end
  else if AllIndex > -1 then
  begin
    lstAll.Selected := lstAll.Items[AllIndex];
    lstAll.ItemFocused := lstAll.Selected;
    NewText := lstAll.Selected.Caption;
    lstQuick.Selected := nil;
    FActiveMedList := lstAll;
    //List is alphabetical, So compare next Item in list to establish uniqueness.
    if CompareText(UserText, Copy(lstAll.Items[AllIndex+1].Caption, 1, Length(UserText))) <> 0 then
      UniqueText := True;
  end
  else
  begin
    lstQuick.Selected := nil;
    lstAll.Selected := nil;
    FActiveMedList := lstAll;
    NewText := txtMed.Text;
  end;
  if (AllIndex > -1) and (QuickIndex > -1) then  //Not Unique Between Lists
    UniqueText := False;
  FFromSelf := True;
  {AutoSelection is only based upon uniquely matching characters.
   Several CQs have been resolved relating to this issue:
   See CQ:
   7326 - Auto complete does not work correctly if user has quick orders in Medication list
   7328 - PSI-05-016: TAM-0205-31170  Med Error due to pre-populated med screen
   6715 PSI-04-044 Orders: NJH-0804-20315  Physician unable to enter medication order
  }
  if UniqueText then
  begin
    OldText := Copy(txtMed.Text, 1, txtMed.SelStart);
    txtMed.Text := NewText;
    //txtMed.SelStart := Length(OldText);  // v24.14 RV
    txtMed.SelStart := Length(UserText);   // v24.14 RV
    txtMed.SelLength := Length(NewText);
  end
  else begin
    txtMed.Text := UserText;
    txtMed.SelStart := Length(txtMed.Text);
  end;
  FFromSelf := False;
  if lstAll.Selected <> nil then
    ScrollToVisible(lstAll);
  if lstQuick.Selected <> nil then
    ScrollToVisible(lstQuick);
  if Not UniqueText then
  begin
    lstQuick.ItemIndex := -1;
    lstAll.ItemIndex := -1;
  end;
  FRemoveText := True;
end;

procedure TfrmODMeds.txtMedExit(Sender: TObject);
begin
  StopKeyTimer;
  if not ((ActiveControl = lstAll) or (ActiveControl = lstQuick)) then ChangeDelayed;
end;

{ lstAll & lstQuick methods }

procedure TfrmODMeds.ListViewEnter(Sender: TObject);
begin
  inherited;
  FActiveMedList := TListView(Sender);
  with Sender as TListView do
  begin
    if Selected = nil then Selected := TopItem;
    if Name = 'lstQuick' then lstAll.Selected := nil else lstQuick.Selected := nil;
    ItemFocused := Selected;
    //ScrollToVisible(TListView(Sender));
  end;
end;

procedure TfrmODMeds.ListViewClick(Sender: TObject);
begin
  inherited;
  btnSelect.Visible := True;
  btnSelect.Enabled := True;
  //txtMed.Text := FActiveMedList.Selected.Caption;
  PostMessage(Handle, UM_DELAYCLICK, 0, 0);
end;

procedure TfrmODMeds.UMDelayClick(var Message: TMessage);
begin
 btnSelectClick(Self);
end;

procedure TfrmODMeds.ListViewEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
  AllowEdit := FALSE;
end;

procedure TfrmODMeds.ListViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//This code emulates combo-box behavior on the quick view and all meds view.
//I think this is a really bad idea because it cannot automatically be undone.
//Example: pull up a valid medication.  Press change button.  Press tab.  Valid
//medication is gone, replaced by first quick order entry.  Not good behavior
//when tabbing through page.
//If we are going to use an edit box to play combo box, I emphatically suggest
//that we use a different edit box.
(*
  with Sender as TListView do
  begin
    if txtMed.Text = Selected.Caption then Exit; // for tabs, arrows, etc.
    FFromSelf := True;
    txtMed.Text := Selected.Caption;
    txtMed.SelectAll;
    FFromSelf := False;
    Key := 0;
  end;
*)
end;

procedure TfrmODMeds.ListViewResize(Sender: TObject);
begin
  with Sender as TListView do Columns.Items[0].Width := ClientWidth - 20;
end;

{ lstAll Methods (lstAll is TListView) }

procedure TfrmODMeds.LoadMedCache(First, Last: Integer);
const
  MAX_CACHE_ITEMS = 1000;
begin
  // if range is within cache range we don't need to update anything
  if (First >= FAllFirst) and (Last <= FAllLast) then Exit;
  // if range is outside of cache or a superset of cache, start over
  if (Last < Pred(FAllFirst)) or (First > Succ(FAllLast)) or
     ((First < FAllFirst) and (Last > FAllLast)) or
     (FAllItems.Count > MAX_CACHE_ITEMS) then
  begin
    FAllItems.Clear;
    FAllFirst := -1;
    FAllLast  := -1;
  end;
  // if getting items immediately before cache range
  if (First < FAllFirst) and (Last  >= FAllFirst) then Last  := Pred(FAllFirst);
  // if getting items immediately after cache range
  if (Last  > FAllLast)  and (First <= FAllLast)  then First := Succ(FAllLast);
  // retrieve the items and append (First>FAllLast) or prepend them to FAllItems
  SubsetOfOrderable(FAllItems, First>FAllLast, FAllList, First, Last);
  // reset FAllFirst & FAllLast indexes to reflect current FAllItems
  if FAllFirst < 0     then FAllFirst := First;
  if FAllLast  < 0     then FAllLast  := Last;
  if First < FAllFirst then FAllFirst := First;
  if Last > FAllLast   then FAllLast := Last;
end;

procedure TfrmODMeds.lstAllData(Sender: TObject; Item: TListItem);
var
  x: string;
begin
  if (FAllFirst = -1) or (Item.Index < FAllFirst) or (Item.Index > FAllLast)
    then LoadMedCache(Item.Index, Item.Index);
  x := FAllItems[Item.Index - FAllFirst];
  Item.Caption := Piece(x, U, 2);
  Item.Data := Pointer(StrToIntDef(Piece(x, U, 1), 0));
end;

procedure TfrmODMeds.lstAllDataHint(Sender: TObject; StartIndex,
  EndIndex: Integer);
begin
  LoadMedCache(StartIndex, EndIndex);
end;

{ lstQuick methods (lstQuick is TListView) }

procedure TfrmODMeds.lstQuickData(Sender: TObject; Item: TListItem);
var
  x: string;
begin
{  try
    if FQuickItems[Item.Index] = '' then
      SubsetOfQuickOrders(FQuickItems, FQuickList, Item.Index, Item.Index);}
    x := FQuickItems[Item.Index];
    Item.Caption := Piece(x, U, 2);
    Item.Data := Pointer(StrToIntDef(Piece(x, U, 1), 0));
{  except
    // doing nothing
  end;}
end;

procedure TfrmODMeds.lstQuickDataHint(Sender: TObject; StartIndex,
  EndIndex: Integer);
begin

end;

{ Medication is now selected ---------------------------------------------------------------- }

procedure TfrmODMeds.btnSelectClick(Sender: TObject);
var
  MedIEN: Integer;
  MedName: string;
  QOQuantityStr: string;
  ErrMsg: string;
begin
  inherited;
  QOQuantityStr := '';
  btnSelect.SetFocus;                             // let the exit events finish

  if pnlMeds.Visible then                         // display the medication fields
  begin
    Changing := True;
    ResetOnMedChange;
    if (FActiveMedList = lstQuick) and (lstQuick.Selected <> nil) then   // quick order
    begin
      ErrMsg := '';
      FIsQuickOrder := True;
      FQOInitial := True;
      Responses.QuickOrder := Integer(lstQuick.Selected.Data);
      txtMed.Tag  := StrToIntDef(Responses.IValueFor('ORDERABLE', 1), 0);
      IsActivateOI(ErrMsg, txtMed.Tag);
      if Length(ErrMsg)>0 then
      begin
        //btnSelect.Visible := False;
        btnSelect.Enabled := False;
        ShowMessage(ErrMsg);
        Exit;
      end;
      if DEACheckFailed(txtMed.Tag, FInptDlg) then
      begin
        //btnSelect.Visible := False;
        btnSelect.Enabled := False;
        InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
        txtMed.Tag := 0;
        txtMed.SetFocus;
        Exit;
      end;
      if txtMed.Tag = 0 then
      begin
        //btnSelect.Visible := False;
        btnSelect.Enabled := False;
        txtMed.SetFocus;
        Exit;
      end;
      SetOnMedSelect;   // set up for this medication
      SetOnQuickOrder;  // insert quick order responses
      if Length(txtQuantity.Text)>0 then
         QOQuantityStr := txtQuantity.Text;
      ShowMedFields;
      if (txtQuantity.Text = '0') and (Length(QOQuantityStr)>0) then
        txtQuantity.Text := QOQuantityStr;
    end
    else if (FActiveMedList = lstAll) and (lstAll.Selected <> nil) then  // orderable item
    begin
      MedIEN := Integer(lstAll.Selected.Data);
      MedName := lstAll.Selected.Caption;
      txtMed.Tag := MedIEN;
      ErrMsg := '';
      IsActivateOI(ErrMsg, txtMed.Tag);
      if Length(ErrMsg)>0 then
      begin
        //btnSelect.Visible := False;
        btnSelect.Enabled := False;
        ShowMessage(ErrMsg);
        Exit;
      end;
      if DEACheckFailed(txtMed.Tag, FInptDlg) then
      begin
        //btnSelect.Visible := False;
        btnSelect.Enabled := False;
        InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
        txtMed.Tag := 0;
        txtMed.SetFocus;
        Exit;
      end;
      if Pos(' NF', MedName) > 0 then
      begin
        CheckFormularyOI(MedIEN, MedName, FInptDlg);
        FAltChecked := True;
      end;
      if MedIEN <> txtMed.Tag then
      begin
        txtMed.Tag := MedIEN;
        txtMed.Text := MedName;
      end;
      SetOnMedSelect;
      ShowMedFields;
    end
    else                                                                 // no selection
    begin
      //btnSelect.Visible := False;
      btnSelect.Enabled := False;
      MessageBeep(0);
      //btnSelect.Visible := False;
      btnSelect.Enabled := False;
      Exit;
    end;
    UpdateRelated(False);
    Changing := False;
    ControlChange(Self);
  end
  else ShowMedSelect;                             // show the selection fields
  FNoZERO   := False;
end;

procedure TfrmODMeds.ResetOnMedChange;
var
  i: Integer;
begin
  Responses.Clear;
  // clear dialog controls individually, since they are on panels
  with grdDoses do for i := 1 to Pred(RowCount) do Rows[i].Clear;
  cboDosage.Items.Clear;
  cboDosage.Text := '';
  cboRoute.Items.Clear;
  cboRoute.Text := '';
  cboRoute.Hint := cboRoute.Text;
  cboSchedule.ItemIndex := -1;
  cboSchedule.Text := '';  // leave items intact
  chkPRN.Checked := False;
  memComment.Lines.Clear;
  txtSupply.Text := '';
  txtQuantity.Text := '';
  txtRefills.Text := '0';
  lblQtyMsg.Caption := '';
  lblQuantity.Caption := 'Quantity';
  chkDoseNow.Checked := FALSE;
  lblAdminTime.Caption := '';
  chkPtInstruct.Checked := False;
  chkPtInstruct.Visible := False;
  memPI.Visible := False;
  stcPI.Visible := False;
  image1.Visible := False;
  memDrugMsg.Visible := False;
  FLastUnits    := '';
  FLastSchedule := '';
  FLastDuration := '';
  FLastInstruct := '';
  FLastDispDrug := '-1';
  FLastQuantity := 0;
  FLastSupply   := 0;
  FAltChecked   := False;
  FPtInstruct   := '';
end;

procedure TfrmODMeds.ResetOnTabChange;
var
  i: Integer;
begin
  with grdDoses do for i := 1 to Pred(RowCount) do Rows[i].Clear;
  Responses.Clear('STRENGTH');
  Responses.Clear('NAME');
  Responses.Clear('INSTR');
  Responses.Clear('DOSE');
  Responses.Clear('DRUG');
  Responses.Clear('DAYS');
  Responses.Clear('ROUTE');
  Responses.Clear('SCHEDULE');
  Responses.Clear('START', 1);
  Responses.Clear('SIG');
  Responses.Clear('SUPPLY');
  Responses.Clear('QTY');
  cboDosage.ItemIndex := -1;
  cboDosage.Text := '';
  cboRoute.ItemIndex  := -1;
  cboRoute.Text := '';
  cboSchedule.ItemIndex := -1;
  cboSchedule.Text := '';  // leave items intact
  txtSupply.Text := '';
  txtSupply.Tag := 0;
  txtQuantity.Text := '';
  txtQuantity.Tag := 0;
  lblQtyMsg.Caption := '';
  lblQuantity.Caption := 'Quantity';
  FSmplPRNChkd := chkPRN.Checked;  //  GE  CQ7585
  chkPRN.Checked := False;
  FLastUnits    := '';
  FLastSchedule := '';
  FLastDuration := '';
  FLastInstruct := '';
  FLastDispDrug := '';
  FDrugID := '';
end;

procedure TfrmODMeds.SetOnMedSelect;
var
  i,j: Integer;
  x: string;
  QOPiUnChk: boolean;
  PKIEnviron: boolean;
begin
  // clear controls?
  cboDosage.Tag := -1;
  txtSupply.Tag := 0;
  txtQuantity.Tag := 0;
  spnQuantity.Tag := 0;
  chkSC.Tag := 0;
  QOPiUnChk := False;
  PKIEnviron := False;
  if GetPKISite then PKIEnviron := True;
  with CtrlInits do
  begin
    // set up CtrlInits for orderable item
    LoadOrderItem(OIForMed(txtMed.Tag, FInptDlg, IncludeOIPI, PKIEnviron));
    // set up lists & initial values based on orderable item
    SetControl(txtMed,       'Medication');
    SetControl(cboDosage,    'Dosage');
    SetControl(cboRoute,     'Route');
    if cboRoute.Items.Count = 1 then cboRoute.ItemIndex := 0;
    cboRouteChange(Self);
    x := DefaultText('Schedule');
    if x <> '' then
    begin
      cboSchedule.SelectByID(x);
      cboSchedule.Text := x;
    end;
    if Length(ValueOf(FLD_QTYDISP))>10 then
    begin
      lblQuantity.Caption := Copy(ValueOf(FLD_QTYDISP),0,7) + '...';
      lblQuantity.Hint := ValueOf(FLD_QTYDISP);
    end;
    FAllDoses.Text := TextOf('AllDoses');
    FAllDrugs.Text := TextOf('Dispense');
    FGuideline.Text := TextOf('Guideline');
    case FGuideline.Count of
    0: lblGuideline.Visible := False;
    1:   begin
           lblGuideline.Caption := FGuideline[0];
           lblGuideline.Visible := TRUE;
         end;
    else begin
           lblGuideline.Caption := 'Display Restrictions/Guidelines';
           lblGuideline.Visible := TRUE;
         end;
    end;
    if FInptDlg then
    begin
      if not FResizedAlready then
      begin
        pnlBottom.Height := pnlBottom.Height - lblDays.Height -  txtSupply.Height
          - stcPi.Height - memPi.Height + 6;
        FResizedAlready := True;
      end;
      pnlTop.Height := pnlFields.Height - pnlBottom.Height;
      chkDoseNow.Top := memComment.Top + memComment.Height + 1;
      lblPriority.Top := memcomment.Top + memComment.Height + 1;
      cboPriority.Top := lblPriority.Top + lblPriority.Height;
      lblAdminTime.Left := chkDoseNow.Left;
      lblAdminTime.Top := chkDoseNow.Top + chkDoseNow.Height - 1;
    end else
    begin
      DEASig := '';
      if GetPKISite then DEASig := DefaultText('DEASchedule');
      FSIGVerb := DefaultText('Verb');
      if Length(FSIGVerb) = 0 then FSIGVerb := TX_TAKE;
      FSIGPrep := DefaultText('Preposition');
      if FLastPickup <> '' then SetPickup(FLastPickup) else SetPickup(DefaultText('Pickup'));
      SetControl(txtRefills, 'Refills');
      for j := 0 to Responses.TheList.Count - 1 do
      begin
        if (TResponse(Responses.theList[j]).PromptID = 'PI') and (TResponse(Responses.theList[j]).EValue = ' ') then
          QOPiUnChk := True;
      end;
      //if Length(FPtInstruct) = 0 then
      FPtInstruct := TextOf('PtInstr');
      for i := 1 to Length(FPtInstruct) do if Ord(FPtInstruct[i]) < 32 then FPtInstruct[i] := ' ';
      FPtInstruct := TrimRight(FPtInstruct);
      if Length(FPtInstruct) > 0 then
      begin
        //chkPtInstruct.Caption := FPtInstruct;
        if memPI.Lines.Count > 0 then
          memPI.Lines.Clear;
        memPI.Lines.Add(FPtInstruct);
        chkPtInstruct.Visible := True;
        chkPtInstruct.Checked := True;
        stcPI.Visible := True;
        memPI.Visible := True;
        if FShrinked then
        begin
          pnlBottom.Height := pnlBottom.Height + memPi.Height + stcPI.Height + 2;
          FShrinked := False;
        end;
        if QOPiUnChk then
          chkPtInstruct.Checked := False;
      end else
      begin
        chkPtInstruct.Visible := False;
        chkPtInstruct.Checked := False;
        stcPI.Visible := False;
        memPI.Visible := False;
        if not FShrinked then
        begin
          pnlBottom.Height := pnlBottom.Height - stcPI.Height - memPI.Height - 2;
          FShrinked := True;
        end;
      end;
    end;
    pnlMessage.TabOrder := cboDosage.TabOrder + 1;
    DispOrderMessage(TextOf('Message'));
  end;
end;

procedure TfrmODMeds.SetOnQuickOrder;
var
  AResponse: TResponse;
  x,LocRoute,TempSch,DispGrp: string;
  i, DispDrug: Integer;
begin
  // txtMed already set by SetOnMedSelect
  with Responses do
  begin
    if (InstanceCount('INSTR') > 1) or (InstanceCount('DAYS') > 0) then // complex dose
    begin
      grdDoses.RowCount := HigherOf(InstanceCount('INSTR')+2, 4);
      i := Responses.NextInstance('INSTR', 0);
      while i > 0 do
      begin
        SetDosage(IValueFor('INSTR', i));
        with cboDosage do
          if ItemIndex > -1 then x := Text + TAB + Items[ItemIndex]
         else x := IValueFor('INSTR',i); //AGP Change 26.41 for CQ 9102 PSI-05-015 affect copy and edit functionality
        grdDoses.Cells[COL_DOSAGE, i] := x;
        SetControl(cboRoute,  'ROUTE', i);
        with cboRoute do
          if ItemIndex > -1 then x := Text + TAB + Items[ItemIndex] else x := Text;
        grdDoses.Cells[COL_ROUTE,  i] := x;
        if FIsQuickOrder then TempSch := cboSchedule.Text;
        SetSchedule(IValueFor('SCHEDULE', i));
        if (cboSchedule.Text = '') and FIsQuickOrder then
        begin
          cboSchedule.SelectByID(TempSch);
          cboSchedule.Text := TempSch;
        end;
        x := cboSchedule.Text;
        if chkPRN.Checked then x := x + ' PRN';
        with cboSchedule do
          if ItemIndex > -1 then x := x + TAB + Items[ItemIndex];
        grdDoses.Cells[COL_SCHEDULE, i] := x;
        if chkPRN.Checked = True then grdDoses.Cells[COL_CHKXPRN,i] := '1';
        grdDoses.Cells[COL_DURATION, i] := IValueFor('DAYS', i);
        if      IValueFor('CONJ', i) = 'A' then x := 'AND'
        else if IValueFor('CONJ', i) = 'T' then x := 'THEN'
        else if IValueFor('CONJ', i) = 'X' then x := 'EXCEPT'
        else x := '';
        grdDoses.Cells[COL_SEQUENCE, i] := x;
        i := Responses.NextInstance('INSTR', i);
      end; {while}
    end else                                      // single dose
    begin
      if FIsQuickOrder then
      begin
        FQODosage := IValueFor('INSTR', 1);
        SetDosage(FQODosage);
        TempSch := cboSchedule.Text;
      end
      else
        SetDosage(IValueFor('INSTR', 1));
      SetControl(cboRoute,  'ROUTE',     1);
      SetSchedule(IValueFor('SCHEDULE',  1));
      if (cboSchedule.Text = '') and FIsQuickOrder then
      begin
        cboSchedule.SelectByID(TempSch);
        cboSchedule.Text := TempSch;
      end;
      if ((cboSchedule.Text = 'OTHER') and FIsQuickOrder)  then
         FNSSOther := True;
      DispDrug := StrToIntDef(ValueOf(FLD_DRUG_ID), 0);
      if Length(ValueOf(FLD_QTYDISP))>10 then
      begin
        lblQuantity.Caption := Copy(ValueOf(FLD_QTYDISP),0,7) + '...';
        lblQuantity.Hint := ValueOf(FLD_QTYDISP);
      end;
      if DispDrug > 0 then
      begin
        DispOrderMessage(DispenseMessage(DispDrug));
        x := QuantityMessage(DispDrug);
      end;
      if Length(x) > 0
        then lblQtyMsg.Caption := TX_QTY_PRE + x + TX_QTY_POST
        else lblQtyMsg.Caption := '';
    end;
    SetControl(memComment ,  'COMMENT',  1);
    SetControl(cboPriority,  'URGENCY',  1);
    if FInptDlg then
    begin
      SetControl(chkDoseNow, 'NOW', 1);
      chkDoseNowClick(Self);
    end else
    begin
      SetControl(txtSupply,   'SUPPLY',  1);
      txtSupply.Text := Trim(txtSupply.Text);
      spnSupply.Position   := StrToIntDef(txtSupply.Text, 0);
      { setting .Tag=1 was commented out because xfer & change were not auto-calculating }
      //if spnSupply.Position <> 0 then txtSupply.Tag   := 1;
      if Length(IValueFor('QTY',1))>0 then
      begin
        FQOQuantity := StrToFloat(IValueFor('QTY',1));
        txtQuantity.Text := FloatToStr(FQOQuantity);
      end;
      SetControl(txtQuantity, 'QTY',     1);
      SetControl(txtRefills,  'REFILLS', 1);
      spnRefills.Position  := StrToIntDef(txtRefills.Text, 0);
      AResponse := Responses.FindResponseByName('PICKUP', 1);
      if AResponse <> nil then SetPickup(AResponse.IValue);
      if FIsQuickOrder then
      begin
        if not QOHasRouteDefined(Responses.QuickOrder) then
        begin
          LocRoute := GetPickupForLocation(IntToStr(Encounter.Location));
          SetPickup(LocRoute);
        end;
      end;
      DispGrp := NameOfDGroup(Responses.DisplayGroup);
      if (AResponse = nil) or ((StrToIntDef(Piece(Responses.CopyOrder,';',1),0)>0) and AnsiSameText('Out. Meds',DispGrp)) then
      begin
        LocRoute := GetPickupForLocation(IntToStr(Encounter.Location));
        SetPickup(LocRoute);
      end;
      if ValueOf(FLD_PICKUP) = '' then SetPickup(FLastPickup);
      AResponse := Responses.FindResponseByName('SC',     1);
      if AResponse <> nil then chkSC.Checked := AResponse.IValue = '1';
    end; {if FInptDlg..else}
  end; {with}
  if FInptDlg then
  begin
    x := ValueOfResponse(FLD_SCHEDULE, 1);
    if Length(x) > 0 then UpdateStartExpires(x);
  end;
end;

procedure TfrmODMeds.ShowMedSelect;
begin
  txtMed.SelStart := Length(txtMed.Text);
  ChangeDelayed;  // synch the listboxes with display
  pnlFields.Enabled := False;
  pnlFields.Visible := False;
  pnlMeds.Enabled   := True;
  pnlMeds.Visible   := True;
  pnlFields.Height := MemOrder.Top - 4 - pnlFields.Top;
  if btnSelect.Caption = 'Change' then
  begin
    btnSelect.Caption := 'OK';
    //btnSelect.Visible := false;
    btnSelect.Enabled := false;
  end;
  btnSelect.Top     := memOrder.Top;
  btnSelect.Anchors := [akRight, akBottom];
  btnSelect.BringToFront;
  cmdAccept.Visible := False;
  cmdAccept.Default := False;
  btnSelect.Default := True;
  cmdAccept.Left := cmdQuit.Left;
  cmdAccept.Top := MemOrder.Top;
  btnSelect.TabOrder := cmdAccept.TabOrder;
  cmdAccept.TabStop := False;
  txtMed.Width      := grdDoses.Width;
  txtMed.Font.Color := clWindowText;
  txtMed.Color      := clWindow;
  txtMed.ReadOnly   := False;
  txtMed.SelectAll;
  txtMed.SetFocus;
  FDrugID := '';
  //ShowOrderMessage( False );
end;

procedure TfrmODMeds.ShowMedFields;
begin
  pnlMeds.Enabled   := False;
  pnlMeds.Visible   := False;
  pnlFields.Enabled := True;
  pnlFields.Visible := True;
  pnlFields.Height := MemOrder.Top - 4 - pnlFields.Top;
  btnSelect.Caption := 'Change';
  btnSelect.Visible := True;
  btnSelect.Enabled := True;
  btnSelect.Top     := txtMed.Top;
  btnSelect.Anchors := [akRight, akTop];
  btnSelect.Default := False;
  cmdAccept.Visible := True;
  cmdAccept.Default := True;
  cmdAccept.Left := cmdQuit.Left;
  cmdAccept.Top := MemOrder.Top;
  btnSelect.TabOrder := txtMed.TabOrder + 1;
  cmdAccept.TabStop := True;
  txtMed.Width      := memOrder.Width;
  txtMed.Font.Color := clInfoText;
  txtMed.Color      := clInfoBk;
  txtMed.ReadOnly   := True;
  if (Responses.InstanceCount('INSTR') > 1) or (Responses.InstanceCount('DAYS') > 0)
    then ShowControlsComplex else ShowControlsSimple;
end;

procedure TfrmODMeds.ShowControlsSimple;
//var
  //dosagetxt: string;
begin
  //Commented out, no longer using CharsNeedMatch Property
{  NumCharsForMatch := 0;
  for i := 0 to cboDosage.Items.Count - 1 do         //find the shortest unit dose text on fifth piece
  begin
    dosagetxt := Piece(cboDosage.Items[i],'^',5);
    if Length(dosagetxt) < 1 then break;
    if NumCharsForMatch = 0 then
      NumCharsForMatch := Length(dosagetxt);
    if (NumCharsForMatch > Length(dosagetxt)) then
      NumCharsForMatch := Length(dosagetxt);
  end;
  if NumCharsForMatch > 1 then
    cboDosage.CharsNeedMatch := NumCharsForMatch - 1;
  if NumCharsForMatch > 5 then
    cboDosage.CharsNeedMatch := 5;}
  tabDose.TabIndex := TI_DOSE;
  grdDoses.Visible := False;
  btnXInsert.Visible := False;
  btnXRemove.Visible := False;
  cboDosage.Visible := True;
  lblRoute.Visible := True;
  cboRoute.Visible := True;
  lblSchedule.Visible := True;
  cboSchedule.Visible := True;
  chkPRN.Visible := True;
  ActiveControl := cboDosage;
end;

procedure TfrmODMeds.ShowControlsComplex;

  procedure MoveCombo(SrcCombo, DestCombo: TORComboBox; CompSch: boolean = false); //AGP Changes 26.12 PSI-04-63
  var
  cnt,i,index: integer;
  node,text: string;
  begin
  if (CompSch = false) or not (FInptDlg)then
    begin
      DestCombo.Items.Clear;
      DestCombo.Items.Assign(SrcCombo.Items);
      DestCombo.ItemIndex := SrcCombo.ItemIndex;
      DestCombo.Text := Piece(SrcCombo.Text, TAB, 1);
    end;
  if (CompSch = true) and (FInptDlg) then     // AGP Changes 26.12 PSI-04-63
    begin
    //AGP change 26.34 CQ 7201,6902 fix the problem with one time schedule still showing for inpatient complex orders
    DestCombo.ItemIndex := -1;
    Text := SrcCombo.Text;
    index := SrcCombo.ItemIndex;
    cnt := 0;
    for i := 0 to SrcCombo.Items.Count - 1 do
      begin
        node := SrcCombo.Items.Strings[i];
        if piece(node,U,3) <> 'O' then
          begin
            DestCombo.Items.Add(SrcCombo.Items.Strings[i]);
            if Piece(node,U,1) = text then DestCombo.ItemIndex := index - cnt;
          end
        else cnt := cnt+1;
      end;
    end;
  end;

//var
  //dosagetxt: string;
begin
  tabDose.TabIndex := TI_COMPLEX;
  MoveCombo(cboDosage,   cboXDosage);
  MoveCombo(cboRoute,    cboXRoute);
  MoveCombo(cboSchedule, cboXSchedule, true);  //AGP Changes 26.12 PSI-04-063
  grdDoses.Visible := True;
  btnXInsert.Visible := True;
  btnXRemove.Visible := True;
  cboDosage.Visible := False;
  lblRoute.Visible := False;
  cboRoute.Visible := False;
  lblSchedule.Visible := False;
  cboSchedule.Visible := False;
  chkPRN.Visible := False;
  FDropColumn := -1;
  pnlFieldsResize(Self);
  ActiveControl := grdDoses;
  //Commented out, no longer using CharsNeedMatch Property
{  NumCharsForMatch := 0;
  for i := 0 to cboXDosage.Items.Count - 1 do         //find the shortest unit dose text on fifth piece
  begin
    dosagetxt := Piece(cboXDosage.Items[i],'^',5);
    if Length(dosagetxt) < 1 then break;
    if NumCharsForMatch = 0 then
      NumCharsForMatch := Length(dosagetxt);
    if (NumCharsForMatch > Length(dosagetxt)) then
      NumCharsForMatch := Length(dosagetxt);
  end;
  if NumCharsForMatch > 1 then
    cboXDosage.CharsNeedMatch := NumCharsForMatch - 1;
  if NumCharsForMatch > 5 then
    cboDosage.CharsNeedMatch := 5;}
end;

procedure TfrmODMeds.SetDosage(const x: string);
var
  i, DoseIndex: Integer;
begin
  DoseIndex := -1;
  with cboDosage do
  begin
    ItemIndex := -1;
    for i := 0 to Pred(Items.Count) do
      if Piece(Items[i], U, 5) = x then
      begin
        DoseIndex := i;
        Break;
      end;
    if DoseIndex <0 then Text := x
  (*  if ((DoseIndex < 0) and (not IsTransferAction)) then Text := x
    else if ((DoseIndex < 0) and IsTransferAction) and (DosageTab = False) then Text := ''
    else if ((DoseIndex < 0) and IsTransferAction) and (DosageTab = True) then Text := x *)
    else ItemIndex := DoseIndex;
  end;
end;

procedure TfrmODMeds.SetPickup(const x: string);
begin
  radPickClinic.Checked := FALSE;
  radPickMail.Checked   := FALSE;
  radPickWindow.Checked := FALSE;
  case CharAt(x, 1) of
  'C': radPickClinic.Checked := TRUE;
  'M': radPickMail.Checked   := TRUE;
  'W': radPickWindow.Checked := TRUE;
  else {leave all unchecked}
  end;
end;

procedure TfrmODMeds.SetSchedule(const x: string);
var
NonPRNPart: string;
begin
  cboSchedule.ItemIndex := -1;
  //AGP change CQ 10593, remove code to match the new expected first dose code
  //PSI-05-026
 (* if Pos('PRN', x) > 0 then
  begin
    NonPRNPart := Trim(Copy(x, 1, Pos('PRN', x) - 1));
    cboSchedule.SelectByID(NonPRNPart);
    if cboSchedule.ItemIndex < 0 then
    begin
      if NSSchedule then
      begin
        chkPRN.Checked := False;
        cboSchedule.Text := '';
      end else
      begin
        chkPRN.Checked := True;
        cboSchedule.Items.Add(NonPRNPart);
        cboSchedule.Text := NonPRNPart;
      end;
    end else
      chkPRN.Checked := True;
  end else
  begin  *)
    chkPRN.Checked := False;
    cboSchedule.SelectByID(x);
    if cboSchedule.ItemIndex < 0 then
    begin
      if NSSchedule then
      begin
        cboSchedule.Text := '';
      end
      else
      begin
      if Pos('PRN', x) > 0 then
        begin
         NonPRNPart := Trim(Copy(x, 1, Pos('PRN', x) - 1));
         chkPRN.Checked := True;
         cboSchedule.SelectByID(NonPRNPart);
         if cboSchedule.ItemIndex > -1 then  EXIT;
         cboSchedule.Items.Add(NonPRNPart);
         cboSchedule.Text := NonPRNPart;
         cboSchedule.SelectByID(NonPRNPart);
         EXIT;
        end;
         cboSchedule.Items.Add(x);
         cboSchedule.Text := x;
         cboSchedule.SelectByID(x);
      end;
  end;
end;

{ Medication edit --------------------------------------------------------------------------- }
procedure TfrmODMeds.tabDoseChange(Sender: TObject);
var
  //text,x, tmpsch: string;
  text, x: string;
  reset: integer;
begin
  inherited;
  reset := 0;
  //AGP change for CQ 6521 added warning message
  //AGP Change for CQ 7508 added tab information
  //GE  Change warning message functionality show only   cq 7590
  //    when tab changes from complex to simple.
  //AGP Change for CQ 7834 and 7832 change text and added check to see if some values have been completed in row 1
  if (tabDose.TabIndex = 0) and ((ValFor(COL_DOSAGE, 1)<>'') or (ValFor(COL_SCHEDULE, 1)<>'') or (ValFor(COL_DURATION, 1)<>'') or
      (ValFor(COL_SEQUENCE, 1)<>''))  then
      begin
        text := 'By switching to the Dosage Tab, ' ;
         if (InfoBox(text +'you will lose all data on this screen. Click �OK� to continue or �Cancel�','Warning',MB_OKCANCEL)=IDCANCEL) then
            begin
             if tabDose.TabIndex = 1 then tabDose.TabIndex := 0
             else tabDose.TabIndex := 1;
             reset := 1;
            end;
      end;
  case tabDose.TabIndex of
  TI_DOSE:    begin
                cboXSchedule.Clear;                       // Added to Fix CQ: 9603
                // clean up responses?
                FSuppressMsg := FOrigiMsgDisp;
                ShowControlsSimple;
                if reset = 0 then ResetOnTabChange;
                txtNss.Left := lblSchedule.Left + lblSchedule.Width + 2;
                if (FInptDlg) then txtNss.Visible := True
                else txtNss.Visible := False;
                cboXRoute.Hide;                           // Added to Fix CQ: 7640
                ControlChange(Self);
              end;
  TI_RATE:    begin
                // for future use...
              end;
  TI_COMPLEX: begin
                FSuppressMsg := FOrigiMsgDisp;
                if reset = 1 then exit;
                ShowControlsComplex;
                ResetOnTabChange;
                txtNss.Left := grdDoses.Left + grdDoses.ColWidths[0] + grdDoses.ColWidths[1] + grdDoses.ColWidths[2] + 3;
                txtNss.Visible := False;
                x := cboXDosage.Text + TAB;
                with cboXDosage   do if ItemIndex > -1 then x := x + Items[ItemIndex];
                grdDoses.Cells[COL_DOSAGE,   1] := x;
                x := cboXRoute.Text + TAB;
                with cboXRoute    do if ItemIndex > -1 then x := x + Items[ItemIndex];
                grdDoses.Cells[COL_ROUTE,    1] := x;
                x := cboXSchedule.Text + TAB;
                with cboXSchedule do if ItemIndex > -1 then x := x + Items[ItemIndex];
                grdDoses.Cells[COL_SCHEDULE, 1] := x;
                UpdateStartExpires(ValFor(VAL_SCHEDULE,1));
                ControlChange(Self);
             end; {TI_COMPLEX}
  end; {case}
end;


procedure TfrmODMeds.lblGuidelineClick(Sender: TObject);
var
  TextStrings: TStringList;
begin
  inherited;
  TextStrings := TStringList.Create;
  try
    TextStrings.Text := FGuideline.Text;
    ReportBox(TextStrings, TC_GUIDELINE, TRUE);
  finally
    TextStrings.Free;
  end;
  //if FGuideline.Count > 0 then InfoBox(FGuideline.Text, 'Restrictions/Guidelines', MB_OK);
end;

{ cboDosage ------------------------------------- }

procedure TfrmODMeds.CheckFormAltDose(DispDrug: Integer);
var
  OI: Integer;
  OIName: string;
begin
  if FAltChecked or (DispDrug = 0) then Exit;
  OI := txtMed.Tag;
  OIName := txtMed.Text;
  CheckFormularyDose(DispDrug, OI, OIName, FInptDlg);
  if OI <> txtMed.Tag then
  begin
    ResetOnMedChange;
    txtMed.Tag  := OI;
    txtMed.Text := OIName;
    SetOnMedSelect;
  end;
end;

procedure TfrmODMeds.cboDosageClick(Sender: TObject);
var
  DispDrug: Integer;
  x: string;
begin
  inherited;
  if FSuppressMsg then
  begin
     if PnlMessage.Visible = true then
     begin
       memMessage.SendToBack;
       PnlMessage.Visible := False;
     end;
  end;
  UpdateRelated(False);
  DispDrug := StrToIntDef(ValueOf(FLD_DRUG_ID), 0);
  if DispDrug > 0 then
  begin
    if not FSuppressMsg then
    begin
        DispOrderMessage(DispenseMessage(DispDrug));
    end;
    x := QuantityMessage(DispDrug);
  end
  else x := '';
  if Length(ValueOf(FLD_QTYDISP))>10 then
  begin
    lblQuantity.Caption := Copy(ValueOf(FLD_QTYDISP),0,7) + '...';
    lblQuantity.Hint := ValueOf(FLD_QTYDISP);
  end else
  begin
    lblQuantity.Caption := ValueOf(FLD_QTYDISP);
    lblQuantity.Hint := '';
  end;
  if Length(x) > 0
    then lblQtyMsg.Caption := TX_QTY_PRE + x + TX_QTY_POST
    else lblQtyMsg.Caption := '';
  with cboDosage do
    if (ItemIndex > -1) and (Piece(Items[ItemIndex], U, 3) = 'NF')
      then CheckFormAltDose(DispDrug);
end;

procedure TfrmODMeds.cboDosageChange(Sender: TObject);
begin
  inherited;
  UpdateRelated;
end;

procedure TfrmODMeds.cboDosageExit(Sender: TObject);
begin
  inherited;
  if (length(cboDosage.Text)<1) then
    cboDosage.ItemIndex := -1;
  if ActiveControl = memMessage then
  begin
    memMessage.SendToBack;
    PnlMessage.Visible := False;
    Exit;
  end;
  if ActiveControl = memComment then
  begin
   if PnlMessage.Visible = true then
   begin
     memMessage.SendToBack;
     PnlMessage.Visible := False;
   end;
  end
  else if (ActiveControl <> btnSelect) and (ActiveControl <> memComment) then
  begin
   if PnlMessage.Visible = true then
   begin
     memMessage.SendToBack;
     PnlMessage.Visible := False;
   end;
   //cboDosageClick(Self);
  end;
end;

{ cboRoute -------------------------------------- }

procedure TfrmODMeds.cboRouteChange(Sender: TObject);
begin
  inherited;
  with cboRoute do
    if ItemIndex > -1 then
    begin
      if Piece(Items[ItemIndex], U, 5) = '1'
        then tabDose.Tabs[0] := 'Dosage / Rate'
        else tabDose.Tabs[0] := 'Dosage';
    end;
  cboDosage.Caption := tabDose.Tabs[0];
  if Sender <> Self then ControlChange(Sender);
end;

procedure TfrmODMeds.cboRouteExit(Sender: TObject);
begin
  if Trim(cboRoute.Text) = '' then
    cboRoute.ItemIndex := -1;
//  ValidateRoute(cboRoute); Removed based on Site feeback. See CQ: 7518
  inherited;
end;

{ cboSchedule ----------------------------------- }

procedure TfrmODMeds.cboScheduleClick(Sender: TObject);
var
  othSch: string;
  idx : integer;
begin
  inherited;
  if (FInptDlg) and (cboSchedule.Text = 'OTHER') then
  begin
    othSch := CreateOtherScheduel;
    if length(trim(othSch)) > 1 then
    begin
      cboSchedule.Items.Add(othSch);
      idx := cboSchedule.Items.IndexOf(OthSch);
      cboSchedule.ItemIndex := idx;
    end;
  end;
  UpdateRelated(False);
end;

procedure TfrmODMeds.cboScheduleChange(Sender: TObject);
var
  othSch: string;
  idx : integer;
begin
  inherited;
  if  (FInptDlg) and (cboSchedule.Text = 'OTHER') then
  begin
    othSch := CreateOtherScheduel;
    if length(trim(othSch)) > 1 then
    begin
      cboSchedule.Items.Add(othSch);
      idx := cboSchedule.Items.IndexOf(OthSch);
      cboSchedule.ItemIndex := idx;
    end;
  end;
//Remove Deletion of Text, since we are changing the validation to be on exit of the control.
{  if (Length(cboSchedule.Text)>0) and (cboSchedule.ItemIndex < 0) and FInptDlg then
    cboSchedule.Text := '';}
  FScheduleChanged := true;
  UpdateRelated;
end;


{ Duration ----------------------------- }
procedure TfrmODMeds.UpdateDurationControls( FreeText: boolean);
begin
  if FreeText then
  begin
    pnlXDurationButton.Width := 8;
    pnlXDurationButton.Align := alRight;
    spnXDuration.Visible := False;
    txtXduration.Align := alClient;
  end
  else
  begin
    txtXduration.Align := alNone;
    txtXduration.Width := pnlXDuration.Width - (pnlXDuration.Width div 2) - spnXDuration.Width + 2;
    pnlXDurationButton.Width := pnlXDuration.Width div 2;
    pnlXDurationButton.Align := alRight;
    spnXDuration.Visible := True;
    spnXDuration.AlignButton := udRight;
  end;
end;

procedure TfrmODMeds.popDurationClick(Sender: TObject);
var
  x: string;
begin
  inherited;
  with TMenuItem(Sender) do
  begin
    if Tag > 0 then
    begin
      x := LowerCase(Caption);
      //Make sure duration is integer
      txtXDuration.Text := IntToStr(StrToIntDef(txtXDuration.Text,0));
      UpdateDurationControls(False);
    end
    else begin
      x := '';
      txtXDuration.Text := '';
      UpdateDurationControls(True);
    end;
  end;
  btnXDuration.Caption := x;
  txtXDurationChange(Sender);
  ControlChange(Sender);
end;

{ txtSupply, txtQuantity -------------------------- }

procedure TfrmODMeds.txtSupplyChange(Sender: TObject);
begin
  inherited;
  if Changing then Exit;
  if not Showing then Exit;
  if FNoZERO = False then FNoZERO := True;

  // if value = 0, change probably caused by the spin button
  if txtSupply.Text <> '0' then txtSupply.Tag := 1;
  UpdateRelated;
end;

procedure TfrmODMeds.txtQuantityChange(Sender: TObject);
begin
  inherited;
  if Changing then Exit;
  if not Showing then Exit;
  if FNoZERO = False then FNoZERO := True;
  // if value = 0, change probably caused by the spin button
  if txtQuantity.Text <> '0' then txtQuantity.Tag := 1;
  UpdateRelated;
end;

procedure TfrmODMeds.chkSCEnter(Sender: TObject);
begin
  inherited;
  pnlMessage.TabOrder := chkSC.TabOrder+1;
  DispOrderMessage(RatedDisabilities);
end;

procedure TfrmODMeds.chkSCClick(Sender: TObject);
begin
  inherited;
  chkSC.Tag := 1;
end;

{ values changing }

function TfrmODMeds.OutpatientSig: string;
var
  Dose, Route, Schedule, Duration, x: string;
  i: Integer;
begin
  case tabDose.TabIndex of
  TI_DOSE:
    begin
      if ValueOf(FLD_TOTALDOSE) = ''
        then Dose := ValueOf(FLD_LOCALDOSE)
        else Dose := ValueOf(FLD_UNITNOUN);
      CheckDecimal(Dose);
      Route := ValueOf(FLD_ROUTE_EX);
      if (Length(Route) > 0) and (Length(FSigPrep) > 0) then Route := FSigPrep + ' ' + Route;
      if Length(Route) = 0 then Route := ValueOf(FLD_ROUTE_NM);
      Schedule := ValueOf(FLD_SCHED_EX);
      (* Schedule := Piece(Temp,U,1);
      if Piece(Temp,U,3) = '1' then Schedule := Schedule + ' AS NEEDED';
      if UpperCase(Copy(Schedule, Length(Schedule) - 18, Length(Schedule))) = 'AS NEEDED AS NEEDED'
      then Schedule := Copy(Schedule, 1, Length(Schedule) - 10); *)
      if Length(Schedule) = 0 then
        begin
          Schedule := ValueOf(FLD_SCHEDULE);
          if RightStr(Schedule,3) = 'PRN' then
             begin
               Schedule := Copy(Schedule,1,Length(Schedule)-3); //Remove the Trailing PRN
               if (RightStr(Schedule,1) = ' ') or (RightStr(Schedule,1) = '-') then
               Schedule := Copy(Schedule,1,Length(Schedule)-1);
               Schedule := Schedule + ' AS NEEDED'
             end;
        end;
      Result := FSIGVerb + ' ' + Dose + ' ' + Route + ' ' + Schedule;
    end;
  TI_COMPLEX:
    begin
      with grdDoses do for i := 1 to Pred(RowCount) do
      begin
        if Length(ValueOf(FLD_LOCALDOSE, i)) = 0 then Continue;
        if FDrugID = '' then
        begin
         Dose := ValueOf(FLD_DOSETEXT, i);
         CheckDecimal(Dose);
        end
        else
        begin
          if ValueOf(FLD_TOTALDOSE, i) = ''
            then Dose := ValueOf(FLD_LOCALDOSE, i)
            else Dose := ValueOf(FLD_UNITNOUN, i);
          CheckDecimal(Dose);
        end;
        Route := ValueOf(FLD_ROUTE_EX, i);
        if (Length(Route) > 0) and (Length(FSigPrep) > 0) then Route := FSigPrep + ' ' + Route;
        if Length(Route) = 0 then Route := ValueOf(FLD_ROUTE_NM, i);
        Schedule := ValueOf(FLD_SCHED_EX, i);
        //if Length(Schedule) = 0 then Schedule := ValueOf(FLD_SCHEDULE, i);
        if Length(Schedule) = 0 then
        begin
          Schedule := ValueOf(FLD_SCHEDULE);
          if RightStr(Schedule,3) = 'PRN' then
             begin
               Schedule := Copy(Schedule,1,Length(Schedule)-3); //Remove the Trailing PRN
               if (RightStr(Schedule,1) = ' ') or (RightStr(Schedule,1) = '-') then
               Schedule := Copy(Schedule,1,Length(Schedule)-1);
               Schedule := Schedule + ' AS NEEDED'
             end;
        end;
        Duration := ValueOf(FLD_DURATION, i);
        if Length(Duration) > 0 then Duration := 'FOR ' + Duration;
        x := FSIGVerb + ' ' + Dose + ' ' + Route + ' ' + Schedule + ' ' + Duration;
        if i > 1
          then Result := Result + ' ' + ValueOf(FLD_SEQUENCE, i-1) + ' ' + x
          else Result := x;
      end; {with grdDoses}
    end; {TI__COMPLEX}
  end; {case}
end;

function TfrmODMeds.InpatientSig: string;
var
  Dose, Route, Schedule, Duration, x: string;
  i: Integer;
begin
  case tabDose.TabIndex of
  TI_DOSE:
    begin
      Dose  := ValueOf(FLD_LOCALDOSE);
      CheckDecimal(Dose);
      Route := ValueOf(FLD_ROUTE_AB);
      if Route = '' then Route := ValueOf(FLD_ROUTE_NM);
      Schedule := ValueOf(FLD_SCHEDULE);
      Result := Dose + ' ' + Route + ' ' + Schedule;
    end;
  TI_COMPLEX:
    begin
      with grdDoses do for i := 1 to Pred(RowCount) do
      begin
        if Length(ValueOf(FLD_LOCALDOSE, i)) = 0 then Continue;
        if FDrugID = ''
          then Dose := ValueOf(FLD_DOSETEXT,  i)
          else Dose := ValueOf(FLD_LOCALDOSE, i);
        CheckDecimal(Dose);
        Route := ValueOf(FLD_ROUTE_AB, i);
        if Route = '' then Route := ValueOf(FLD_ROUTE_NM, i);
        Schedule := ValueOf(FLD_SCHEDULE, i);
        Duration := ValueOf(FLD_DURATION, i);
        if Length(Duration) > 0 then Duration := 'FOR ' + Duration;
        x := Dose + ' ' + Route + ' ' + Schedule + ' ' + Duration;
        if i > 1
          then Result := Result + ' ' + ValueOf(FLD_SEQUENCE, i-1) + ' ' + x
          else Result := x;
      end; {with grdDoses}
    end; {TI__COMPLEX}
  end; {case}
end;

function TfrmODMeds.ConstructedDoseFields(const ADose: string; PrependName: Boolean = FALSE): string;
var
  i, DrugIndex: Integer;
  UnitsPerDose, Strength: Extended;
  Units, Noun, AName: string;
begin
  DrugIndex := -1;
  for i := 0 to Pred(FAllDrugs.Count) do
    if AnsiSameText(Piece(FAllDrugs[i], U, 1), FDrugID) then
    begin
      DrugIndex := i;
      Break;
    end;
  Strength := StrToFloatDef(Piece(FAllDrugs[DrugIndex], U, 2), 0);
  Units    := Piece(FAllDrugs[DrugIndex], U, 3);
  AName    := Piece(FAllDrugs[DrugIndex], U, 4);
  if FAllDoses.Count > 0
    then Noun := Piece(Piece(FAllDoses[0], U, 3), '&', 4)
    else Noun := '';
  if Strength > 0
    then UnitsPerDose := ExtractFloat(ADose) / Strength
    else UnitsPerDose := 0;
  if (UnitsPerDose > 1) and (Noun <> '') and (CharAt(Noun, Length(Noun)) <> 'S')
    then Noun := Noun + 'S';
  Result := FloatToStr(ExtractFloat(ADose)) + '&' + Units + '&' + FloatToStr(UnitsPerDose)
            + '&' + Noun + '&' + ADose + '&' + FDrugID + '&' + FloatToStr(Strength) + '&'
            + Units;
  if PrependName then Result := AName + U + FloatToStr(Strength) + Units + U + U +
                                Result + U + ADose;
  Result := UpperCase(Result);
end;

function TfrmODMeds.FieldsForDrug(const DrugID: string): string;
var
  i, DrugIndex: Integer;
begin
  Result := '';
  DrugIndex := -1;
  for i := 0 to Pred(FAllDrugs.Count) do
  begin
    if AnsiSameText(Piece(FAllDrugs[i], U, 1), DrugID) then DrugIndex := i;
  end;
  if DrugIndex > -1 then Result := FAllDrugs[DrugIndex];
end;

function TfrmODMeds.FieldsForDose(ARow: Integer): string;
var
  i: Integer;
  DoseDrug: string;
begin
  Result := Piece(Piece(grdDoses.Cells[COL_DOSAGE, ARow], TAB, 2), U, 4);
  //AGP CHANGE 26.33 change for Remedy ticket 87476 fix for quick orders for complex
  //inpatient orders not displaying the correct unit dose in Pharmacy
  //if (not FInptDlg) and (Length(FDrugID) > 0) then
  if Length(FDrugID) > 0 then
  begin
    Result := '';
    DoseDrug := Piece(Piece(grdDoses.Cells[COL_DOSAGE, ARow], TAB, 2), U, 5);
    if DoseDrug = '' then DoseDrug := Piece(grdDoses.Cells[COL_DOSAGE, ARow], TAB, 1);
    DoseDrug := DoseDrug + U + FDrugID;
    for i := 0 to Pred(FAllDoses.Count) do
    begin
      if AnsiSameText(DoseDrug, Copy(FAllDoses[i], 1, Length(DoseDrug))) then
      begin
        Result := Piece(FAllDoses[i], U, 3);
        Break;
      end; {if AnsiSameText}
    end; {for i}
    if Result = '' then Result := ConstructedDoseFields(Piece(DoseDrug, U, 1));
  end;
end;

function TfrmODMeds.FindDoseFields(const Drug, ADose: string): string;
var
  i: Integer;
  x: string;
begin
  Result := '';
  x := ADose + U + Drug + U;
  for i := 0 to Pred(FAllDoses.Count) do
  begin
    if AnsiSameText(x, Copy(FAllDoses[i], 1, Length(x))) then
    begin
      Result := Piece(FAllDoses[i], U, 3);
      Break;
    end;
  end;
end;

function TfrmODMeds.FindCommonDrug(DoseList: TStringList): string;
// DoseList[n] = DoseText ^ Dispense Drug Pointer
var
  i, j, UnitIndex: Integer;
  DrugStrength, DoseValue, UnitsPerDose: Extended;
  DrugOK, PossibleDoses, SplitTab: Boolean;
  ADrug, ADose, DoseFields, DoseUnits, DrugUnits: string;
  FoundDrugs: TStringList;

  procedure SaveDrug(const ADrug: string; UnitsPerDose: Extended);
  var
    i, DrugIndex: Integer;
    CurUnits: Extended;
  begin
    DrugIndex := -1;
    for i := 0 to Pred(FoundDrugs.Count) do
      if AnsiSameText(Piece(FoundDrugs[i], U, 1), ADrug) then DrugIndex := i;
    if DrugIndex = -1 then FoundDrugs.Add(ADrug + U + FloatToStr(UnitsPerDose)) else
    begin
      CurUnits := StrToFloatDef(Piece(FoundDrugs[DrugIndex], U, 2), 0);
      if UnitsPerDose > CurUnits
        then FoundDrugs[DrugIndex] := ADrug + U + FloatToStr(UnitsPerDose);
    end;
  end;

  procedure KillDrug(const ADrug: string);
  var
    i, DrugIndex: Integer;
  begin
    DrugIndex := -1;
    for i := 0 to Pred(FoundDrugs.Count) do
      if AnsiSameText(Piece(FoundDrugs[i], U, 1), ADrug) then DrugIndex := i;
    if DrugIndex > -1 then FoundDrugs.Delete(DrugIndex);
  end;

begin
  Result := '';
  if FInptDlg then                                // inpatient dialog
  begin
    DrugOK := True;
    for i := 0 to Pred(DoseList.Count) do
    begin
      ADrug := Piece(DoseList[i], U, 2);
      if ADrug = '' then DrugOK := False;
      if Result = '' then Result := ADrug;
      if not AnsiSameText(ADrug, Result) then DrugOK := False;
      if not DrugOK then Break;
    end;
    if not DrugOK then Result :='';
  end else                                        // outpatient dialog
  begin
    // check the dose combinations for each dispense drug
    FoundDrugs := TStringList.Create;
    try
      if FAllDoses.Count > 0
        then PossibleDoses := Length(Piece(Piece(FAllDoses[0], U, 3), '&', 1)) > 0
        else PossibleDoses := False;
      for i := 0 to Pred(FAllDrugs.Count) do
      begin
        ADrug := Piece(FAllDrugs[i], U, 1);
        DrugOK := True;
        DrugStrength := StrToFloatDef(Piece(FAllDrugs[i], U, 2), 0);
        DrugUnits := Piece(FAllDrugs[i], U, 3);
        SplitTab := Piece(FAllDrugs[i], U, 5) = '1';
        for j := 0 to Pred(DoseList.Count) do
        begin
          ADose:= Piece(DoseList[j], U, 1);
          DoseFields := FindDoseFields(ADrug, ADose);  // get the idnode for the dose/drug combination
          if not PossibleDoses then
          begin
            if DoseFields = '' then DrugOK := False else SaveDrug(ADrug, 0);
          end else
          begin
            DoseValue := StrToFloatDef(Piece(DoseFields, '&', 1), 0);
            if DoseValue = 0 then DoseValue := ExtractFloat(ADose);
            UnitsPerDose := DoseValue / DrugStrength;
            if (Frac(UnitsPerDose) = 0) or (SplitTab and (Frac(UnitsPerDose) = 0.5))
              then SaveDrug(ADrug, UnitsPerDose)
              else DrugOK := False;
            // make sure this dose is using the same units as the drug
            if DoseFields = '' then
            begin
              for UnitIndex := 1 to Length(ADose) do
                if not (ADose[UnitIndex] in ['0'..'9','.']) then Break;
              DoseUnits := Copy(ADose, UnitIndex, Length(ADose));
            end
            else DoseUnits := Piece(DoseFields, '&', 2);
            if not AnsiSameText(DoseUnits, DrugUnits) then DrugOK := False;
          end;
          if not DrugOK then
          begin
            KillDrug(ADrug);
            Break;
          end; {if not DrugOK}
        end; {with..for j}
      end; {for i}
      if FoundDrugs.Count > 0 then
      begin
        if not PossibleDoses then Result := Piece(FoundDrugs[0], U, 1) else
        begin
          UnitsPerDose := 99999999;
          for i := 0 to Pred(FoundDrugs.Count) do
          begin
            if StrToFloatDef(Piece(FoundDrugs[i], U, 2), 99999999) < UnitsPerDose then
            begin
              Result := Piece(FoundDrugs[i], U, 1);
              UnitsPerDose := StrToFloatDef(Piece(FoundDrugs[i], U, 2), 99999999);
            end; {if StrToFloatDef}
          end; {for i..FoundDrugs}
        end; {if not..else PossibleDoses}
      end; {if FoundDrugs}
    finally
      FoundDrugs.Free;
    end; {try}
  end; {if..else FInptDlg}
end; {FindCommonDrug}

procedure TfrmODMeds.ControlChange(Sender: TObject);
var
  x,ADose,AUnit,ADosageText: string;
  i, LastDose: Integer;
  DoseList: TStringList;
begin
  inherited;
  if csLoading in ComponentState then Exit;       // to prevent error caused by txtRefills
  if Changing then Exit;
  if txtMed.Tag = 0 then Exit;
  ADose := '';
  AUnit := '';
  ADosageText := '';
  FUpdated := FALSE;
  Responses.Clear;
  Responses.Update('ORDERABLE',  1, IntToStr(txtMed.Tag), txtMed.Text);
  DoseList := TStringList.Create;
  case tabDose.TabIndex of
  TI_DOSE:
    begin
      if (cboDosage.ItemIndex < 0) and (Length(cboDosage.Text) > 0) then
      begin
        // try to resolve freetext dose and add it as a new item to the combobox
        ADosageText := cboDosage.Text;
        ADose := Piece(ADosageText,' ',1);
        Delete(ADosageText,1,Length(ADose)+1);
        ADosageText := ADose + Trim(ADosageText);
        DoseList.Add(ADosageText);
        FDrugID := FindCommonDrug(DoseList);
        if FDrugID <> '' then
        begin
          if ExtractFloat(cboDosage.Text) > 0 then
          begin
            x := ConstructedDoseFields(cboDosage.Text, TRUE);
            FDrugID := '';
            with cboDosage do ItemIndex := cboDosage.Items.Add(x);
          end;
        end;
      end;
      x := ValueOf(FLD_DOSETEXT);    Responses.Update('INSTR',    1, x,  x);
      x := ValueOf(FLD_DRUG_ID);     Responses.Update('DRUG',     1, x, '');
      x := ValueOf(FLD_DOSEFLDS);    Responses.Update('DOSE',     1, x, '');
      x := ValueOf(FLD_STRENGTH);
      // if outpt or inpt order with no total dose (i.e., topical)
      if (not FInptDlg) or (ValueOf(FLD_TOTALDOSE) = '')
                                then Responses.Update('STRENGTH', 1, x,  x);
      // if no strength for dosage, use dispense drug name
      if Length(x) = 0 then
      begin
        x := ValueOf(FLD_DRUG_NM);
        if Length(x) > 0        then Responses.Update('NAME',     1, x,  x);
      end;
      x := ValueOf(FLD_ROUTE_AB);
      if Length(x) = 0 then x := ValueOf(FLD_ROUTE_NM);
      if Length(ValueOf(FLD_ROUTE_ID)) > 0
                                then Responses.Update('ROUTE',    1, ValueOf(FLD_ROUTE_ID), x)
                                else Responses.Update('ROUTE',    1, '', x);
      x := ValueOf(FLD_SCHEDULE);    Responses.Update('SCHEDULE', 1, x,  x);
    end;
  TI_COMPLEX:
    begin
      //if txtNss.Visible then txtNss.Visible := False;
      with grdDoses do for i := 1 to Pred(RowCount) do
      begin
        x := Piece(Piece(grdDoses.Cells[COL_DOSAGE, i], TAB, 2), U, 5);
        if x = '' then x := Piece(grdDoses.Cells[COL_DOSAGE, i], TAB, 1);
        if x = '' then Continue;
        x := x + U + Piece(Piece(grdDoses.Cells[COL_DOSAGE, i], U, 4), '&', 6);
        DoseList.Add(x);
      end;
      FDrugID := FindCommonDrug(DoseList);
      if FDrugID <> '' then                       // common drug found
      begin
        x := ValueOf(FLD_STRENGTH, 1);
        if (not FInptDlg) or (ValueOf(FLD_TOTALDOSE, 1) = '')
                                then    Responses.Update('STRENGTH', 1, x, x);
        // if no strength, use dispense drug
        if Length(x) = 0 then
        begin
          x := ValueOf(FLD_DRUG_NM, 1);
          if Length(x) > 0      then    Responses.Update('NAME',     1, x, x);
        end;
        Responses.Update('DRUG', 1, FDrugID, '');
      end; {if FDrugID}
      LastDose := 0;
      with grdDoses do for i := 1 to Pred(RowCount) do
        if Length(ValueOf(FLD_DOSETEXT, i)) > 0 then LastDose := i;
      with grdDoses do for i := 1 to Pred(RowCount) do
      begin
        if Length(ValueOf(FLD_DOSETEXT, i)) = 0 then Continue;
        x := ValueOf(FLD_DOSETEXT, i);  Responses.Update('INSTR',    i, x, x);
        x := ValueOf(FLD_DOSEFLDS, i);  Responses.Update('DOSE',     i, x, '');
        x := ValueOf(FLD_ROUTE_AB, i);
        if Length(x) = 0 then x := ValueOf(FLD_ROUTE_NM, i);
        if Length(ValueOf(FLD_ROUTE_ID, i)) > 0
                                   then Responses.Update('ROUTE',    i, ValueOf(FLD_ROUTE_ID, i), x)
                                   else Responses.Update('ROUTE',    i, '', x);
        x := ValueOf(FLD_SCHEDULE, i);  Responses.Update('SCHEDULE', i, x, x);
        if FSmplPRNChkd then   // GE CQ7585  Carry PRN checked from simple to complex tab
        begin
           pnlXSchedule.Tag := 1;
           chkXPRN.Checked := True;
          //cboXScheduleClick(Self);// force onclick to fire when complex tab is entered
           FSmplPRNChkd := False;
        end;
        x := ValueOf(FLD_DURATION, i);  Responses.Update('DAYS',     i, UpperCase(x), x);
        x := ValueOf(FLD_SEQUENCE, i);
        if      Uppercase(x) = 'THEN'   then x := 'T'
        else if Uppercase(x) = 'AND'    then x := 'A'
        else if Uppercase(x) = 'EXCEPT' then x := 'X'
        else x := '';
        if  i = LastDose then  x := '';            // no conjunction for last dose
        Responses.Update('CONJ',     i, x, x);
      end; {with grdDoses}
    end; {TI_COMPLEX}
  end; {case TabDose.TabIndex}
  DoseList.Free;
  Responses.Update('URGENCY',   1, ValueOf(FLD_PRIOR_ID), '');
  Responses.Update('COMMENT',   1, TX_WPTYPE, ValueOf(FLD_COMMENT));
  if FInptDlg then                       // inpatient orders
  begin
    Responses.Update('NOW',     1, ValueOf(FLD_NOW_ID), ValueOf(FLD_NOW_NM));
    x := InpatientSig;
    Responses.Update('SIG',     1, TX_WPTYPE, x);
  end else                                        // outpatient orders
  begin
    x := ValueOf(FLD_SUPPLY);           Responses.Update('SUPPLY',  1, x,  x);
    x := ValueOf(FLD_QUANTITY);         Responses.Update('QTY',     1, x,  x);
    x := ValueOf(FLD_REFILLS);          Responses.Update('REFILLS', 1, x,  x);
    x := ValueOf(FLD_SC);               Responses.Update('SC',      1, x, '');
    x := ValueOf(FLD_PICKUP);           Responses.Update('PICKUP',  1, x, '');
    x := ValueOf(FLD_PTINSTR);          Responses.Update('PI',      1, TX_WPTYPE, x);
    x := '';
    x := OutpatientSig;                 Responses.Update('SIG',     1, TX_WPTYPE, x);
  end;
  memOrder.Text := Responses.OrderText;
end;

{ complex dose ------------------------------------------------------------------------------ }

{ General Functions - get & set cell values}

function TfrmODMeds.ValFor(FieldID, ARow: Integer): string;
{ Contents of grid cells  (Only the first tab piece for each cell is drawn)
    Dosage    <TAB> DosageFields
    RouteText <TAB> IEN^RouteName^Abbreviation
    Schedule  <TAB> (nothing)
    Duration  <TAB> Duration^Units }
begin
  Result := '';
  if (ARow < 1) or (ARow >= grdDoses.RowCount) then Exit;
  with grdDoses do
    case FieldID of
    COL_DOSAGE   : Result := Piece(Cells[COL_DOSAGE,   ARow], TAB, 1);
    COL_ROUTE    : Result := Piece(Cells[COL_ROUTE,    ARow], TAB, 1);
    COL_SCHEDULE : Result := Piece(Cells[COL_SCHEDULE, ARow], TAB, 1);
    COL_DURATION : Result := Piece(Cells[COL_DURATION, ARow], TAB, 1);
    COL_SEQUENCE : Result := Piece(Cells[COL_SEQUENCE, ARow], TAB, 1);
    VAL_DOSAGE   : Result := Piece(Cells[COL_DOSAGE,   ARow], TAB, 2);
    VAL_ROUTE    : Result := Piece(Cells[COL_ROUTE,    ARow], TAB, 2);
    VAL_SCHEDULE : Result := Piece(Cells[COL_SCHEDULE, ARow], TAB, 1);
    VAL_DURATION : Result := Piece(Cells[COL_DURATION, ARow], TAB, 1);
    VAL_SEQUENCE : Result := Piece(Cells[COL_SEQUENCE, ARow], TAB, 1);
    VAL_CHKXPRN  : Result := Cells[COL_CHKXPRN, ARow];
    end;
end;

procedure FindInCombo(const x: string; AComboBox: TORComboBox);
begin
  AComboBox.SetTextAutoComplete(x);
end;

(*
procedure TfrmODMeds.DurationToDays;
var
  i, DoseHours, TotalHours: Integer;
  AllRows: Boolean;
  Days: Extended;
  x: string;
begin
  Exit;  // don't try to figure out days supply from duration for now
  if txtSupply.Tag = 1 then Exit;
  AllRows := True;
  with grdDoses do for i := 1 to Pred(RowCount) do
    if (Length(ValFor(COL_DOSAGE, i)) > 0) and (Length(ValFor(VAL_DURATION, i)) = 0)
      then AllRows := False;
  if not AllRows then Exit;
  Changing := True;
  TotalHours := 0;
  with grdDoses do for i := 1 to Pred(RowCount) do
    if Length(ValFor(COL_DOSAGE, i)) > 0 then
    begin
      x := ValFor(VAL_DURATION, i);
      if Piece(x, U, 2) = 'D'
        then DoseHours := ExtractInteger(x) * 24
        else DoseHours := ExtractInteger(x);
      TotalHours := TotalHours + DoseHours;
    end;
  Days := TotalHours / 24;
  if Days > Int(Days) then Days := Days + 1;
  txtSupply.Text := IntToStr(Trunc(Days));
  //timDayQty.Tag := TIMER_FROM_DAYS;
  //timDayQtyTimer(Self);
  Changing := False;
end;
*)

function TfrmODMeds.DurationToDays: Integer;
var
  i, DoseMinutes, TotalMinutes: Integer;
  AllRows: Boolean;
  Days: Extended;
  x: string;
begin
  Result := 0;
  // make sure a duration exists for all rows with a dose
  AllRows := True;
  with grdDoses do for i := 1 to Pred(RowCount) do
    if (Length(ValFor(COL_DOSAGE, i)) > 0) and (Length(ValFor(VAL_DURATION, i)) = 0)
      then AllRows := False;
  if not AllRows then Exit;

  TotalMinutes := 0;
  with grdDoses do for i := 1 to Pred(RowCount) do
    if Length(ValFor(COL_DOSAGE, i)) > 0 then
    begin
      x := ValFor(VAL_DURATION, i);
      DoseMinutes := 0;
      if Piece(x, ' ', 2) = 'MONTHS'  then DoseMinutes := ExtractInteger(x) * 43200;
      if Piece(x, ' ', 2) = 'WEEKS'   then DoseMinutes := ExtractInteger(x) * 10080;
      if Piece(x, ' ', 2) = 'DAYS'    then DoseMinutes := ExtractInteger(x) * 1440;
      if Piece(x, ' ', 2) = 'HOURS'   then DoseMinutes := ExtractInteger(x) * 60;
      if Piece(x, ' ', 2) = 'MINUTES' then DoseMinutes := ExtractInteger(x);
      TotalMinutes := TotalMinutes + DoseMinutes;
    end;
  Days := TotalMinutes / 1440;
  if Days > Int(Days) then Days := Days + 1;
  Result := Trunc(Days);
end;

procedure TfrmODMeds.pnlFieldsResize(Sender: TObject);
const
  REL_DOSAGE   = 0.38;
  REL_ROUTE    = 0.17;
  REL_SCHEDULE = 0.19;
  REL_DURATION = 0.16;
  REL_ANDTHEN  = 0.10;
var
  i, ht, RowCountShowing: Integer;
  ColControl: TWinControl;
begin
  inherited;
  with grdDoses do
  begin
    i := grdDoses.Width - 12;                 // 12 = 4 pixel margin + 8 pixel column 0
    i := i - GetSystemMetrics(SM_CXVSCROLL);  // compensate for appearance of scroll bar
    ColWidths[1] := Round(REL_DOSAGE   * i);  // dosage
    ColWidths[2] := Round(REL_ROUTE    * i);  // route
    ColWidths[3] := Round(REL_SCHEDULE * i);  // schedule
    ColWidths[4] := Round(REL_DURATION * i);  // duration
    ColWidths[5] := Round(REL_ANDTHEN  * i);  // and/then
    // adjust height of grid to not show partial rows
    ht := pnlBottom.Top - Top - 6;

    ht := ht div (DefaultRowHeight+1);
    ht := ht * (DefaultRowHeight+1);
    Inc(ht, 3);
    Height := ht;
    // Move a column control if it is showing
    ColControl := nil;
    case grdDoses.Col of
      COL_DOSAGE:ColControl := cboXDosage;
      COL_ROUTE:ColControl := cboXRoute;
      COL_SCHEDULE:ColControl := pnlXSchedule;
      COL_DURATION:ColControl := pnlXDuration;
      COL_SEQUENCE:ColControl := pnlXSequence;
    end; {case}

    if assigned(ColControl) and ColControl.Showing then
      begin
        RowCountShowing := (Height - 25) div (DefaultRowHeight+1);
        if (grdDoses.Row <= RowCountShowing) then
          ShowEditor(grdDoses.col, grdDoses.row, #0)
        else
          ColControl.Hide;
      end;

  end;
end;

procedure TfrmODMeds.grdDosesMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
begin
  inherited;
  grdDoses.MouseToCell(X, Y, ACol, ARow);
  if (ARow < 0) or (ACol < 0) then Exit;
  if ACol > COL_SELECT then ShowEditor(ACol, ARow, #0) else
  begin
    grdDoses.Col := COL_DOSAGE;
    grdDoses.Row := ARow;
  end;
  if grdDoses.Col <> COL_DOSAGE then
    DropLastSequence;
end;

procedure TfrmODMeds.grdDosesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key in [#32..#127] then ShowEditor(grdDoses.Col, grdDoses.Row, Key);
  if grdDoses.Col <> COL_DOSAGE then
    DropLastSequence;
end;

procedure TfrmODMeds.grdDosesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  case FDropColumn of
  COL_DOSAGE:   with cboXDosage   do if Items.Count > 0 then DroppedDown := True;
  COL_ROUTE:    with cboXRoute    do if Items.Count > 0 then DroppedDown := True;
  COL_SCHEDULE: with cboXSchedule do if Items.Count > 0 then DroppedDown := True;
  end;
  FDropColumn := -1;
end;

procedure TfrmODMeds.grdDosesDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
  grdDoses.Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
    Piece(grdDoses.Cells[ACol, ARow], TAB, 1));
end;

procedure TfrmODMeds.grdDosesExit(Sender: TObject);
begin
  inherited;
  UpdateRelated(FALSE);
  RestoreDefaultButton;
  RestoreCancelButton;
end;

procedure TfrmODMeds.ShowEditor(ACol, ARow: Integer; AChar: Char);
var
  x,tmpText: string;

  procedure PlaceControl(AControl: TWinControl);
  var
    ARect: TRect;
  begin
    with AControl do
    begin
      ARect := grdDoses.CellRect(ACol, ARow);
      SetBounds(ARect.Left + grdDoses.Left + 1,  ARect.Top  + grdDoses.Top + 1,
                ARect.Right - ARect.Left + 1,    ARect.Bottom - ARect.Top + 1);
      Tag := ARow;
      BringToFront;
      Show;
      SetFocus;
    end;
  end;

  procedure SynchCombo(ACombo: TORComboBox; const ItemText, EditText: string);
  var
    i: Integer;
  begin
    ACombo.ItemIndex := -1;
    for i := 0 to Pred(ACombo.Items.Count) do
      if ACombo.Items[i] = ItemText then ACombo.ItemIndex := i;
    if ACombo.ItemIndex < 0 then ACombo.Text := EditText;
  end;

begin
  inherited;
  txtNSS.Visible := False;
  //Make space just select editor.  This blows up as soon as some joker makes a
  //dosage starting with a space.
  if AChar = ' ' then
    AChar := #0;
  if ARow = 0 then Exit;  // header row
  // require initial instruction entry when in last row
  with grdDoses do if {(ARow = Pred(RowCount)) and} (ACol > COL_DOSAGE) and
    (ValFor(COL_DOSAGE, ARow) = '') then Exit;
  // require that initial instructions  for rows get entered from top to bottom
  //(this does not include behaivor of row insertion button.)
  if (ACol = COL_DOSAGE) and (ARow > 1) and (ValFor(COL_DOSAGE, ARow-1) = '') then
    Exit;
  // display appropriate editor for row & column
  case ACol of
  COL_DOSAGE:   begin
                  // default route & schedule to previous row
                  if (ARow > 1) then
                  begin
                    if (grdDoses.Cells[COL_ROUTE, ARow] = '') and
                       (grdDoses.Cells[COL_SCHEDULE, ARow] = '') then
                    begin
                      grdDoses.Cells[COL_ROUTE,    ARow] := grdDoses.Cells[COL_ROUTE,    Pred(ARow)];
                      { don't default schedule - recommended by Martin Lowe }
                      //grdDoses.Cells[COL_SCHEDULE, ARow] := grdDoses.Cells[COL_SCHEDULE, Pred(ARow)];
                    end;
                //AGP Change 26.45 remove auto-populate of the sequence field
                {*    if grdDoses.Cells[COL_SEQUENCE, Pred(ARow)] = '' then
                    begin
                      if StrToIntDef(Piece(grdDoses.Cells[COL_DURATION, Pred(ARow)], ' ', 1), 0) > 0
                        then grdDoses.Cells[COL_SEQUENCE, Pred(ARow)] := 'THEN'
                        else grdDoses.Cells[COL_SEQUENCE, Pred(ARow)] := 'AND';
                    end;  *}
                  end;
                  // set appropriate value for cboDosage
                  SynchCombo(cboXDosage, ValFor(VAL_DOSAGE, ARow), ValFor(COL_DOSAGE, ARow));
                  PlaceControl(cboXDosage);
                  FDropColumn := COL_DOSAGE;
                  if AChar <> #0 then PostMessage(Handle, UM_DELAYEVENT, Ord(AChar), COL_DOSAGE);
                end;
  COL_ROUTE:    begin
                  // set appropriate value for cboRoute
                  SynchCombo(cboXRoute, ValFor(VAL_ROUTE, ARow), ValFor(COL_ROUTE, ARow));
                  PlaceControl(cboXRoute);
                  FDropColumn := COL_ROUTE;
                  if AChar <> #0 then PostMessage(Handle, UM_DELAYEVENT, Ord(AChar), COL_ROUTE);
                end;
  COL_SCHEDULE: begin
                  // set appropriate value for cboSchedule
                  if FInptDlg then txtNSS.Visible := True;
                  x := Piece(grdDoses.Cells[COL_SCHEDULE, ARow], TAB, 1);
                  Changing := TRUE;
                  if ValFor(VAL_CHKXPRN,Arow)='1' then chkXPRN.Checked := true
                  else chkXPRN.Checked := False;
                  if Pos('PRN',x)>0 then
                    begin
                      cboXSchedule.SelectByID(x);
                      if cboXSchedule.ItemIndex <0 then
                        begin
                          x := Trim(Copy(x, 1, Pos('PRN', x) - 1));
                          chkXPRN.Checked := true;
                        end;
                    end;
                  if Length(x) > 0 then
                  begin
                    cboXSchedule.SelectByID(x);
                    cboXSchedule.Text := x;
                  end
                  else cboXSchedule.ItemIndex := -1;
                (*  if Pos('PRN', x) > 0 then
                  begin
                    NonPRNPart := Trim(Copy(x, 1, Pos('PRN', x) - 1));
                    cboXSchedule.SelectByID(NonPRNPart);
                    if cboXSchedule.ItemIndex > -1 then chkXPRN.Checked := True else
                    begin
                      chkXPRN.Checked := False;
                      cboXSchedule.SelectByID(x);
                      if cboXSchedule.ItemIndex < 0 then cboXSchedule.Text := x;
                    end;
                  end; *)
                  Changing := FALSE;
                  pnlXSequence.Tag := ARow;
                  PlaceControl(pnlXSchedule);
                  //cboXSchedule.SetFocus;
                  FDropColumn := COL_SCHEDULE;
                  if AChar <> #0 then PostMessage(Handle, UM_DELAYEVENT, Ord(AChar), COL_SCHEDULE);
                end;
  COL_DURATION: begin
                  // set appropriate value for pnlDuration
                  x := ValFor(VAL_DURATION, ARow);
                  Changing := TRUE;
                  txtXDuration.Text    := Piece(x, ' ', 1);
                  x := Piece(x, ' ', 2);
                  if Length(x) > 0 then btnXDuration.Caption := LowerCase(x)
                  else begin
                    txtXDuration.Text := '0';
                    btnXDuration.Caption := 'days';
                  end;
                  tmpText := txtXDuration.Text;  //Fix for CQ: 8107 - Kloogy but works.
                  UpdateDurationControls(False);
                  Changing := FALSE;
                  pnlXDuration.Tag := ARow;
                  PlaceControl(pnlXDuration);
                  txtXDuration.SetFocus;
                  ARow1 := ARow;
                  txtXDuration.Text := tmpText;  //Fix for CQ: 8107 - Kloogy but works.
                  if AChar <> #0 then PostMessage(Handle, UM_DELAYEVENT, Ord(AChar), COL_DURATION);
                end;
  COL_SEQUENCE: begin
                  x := ValFor(COL_SEQUENCE, ARow);
                  //if x = '' then x := 'and';  AGP Change 26.46 remove for CQ 9535
                  btnXSequence.Caption := x;
                  pnlXSequence.Caption := btnXSequence.Caption;
                  pnlXSequence.Tag := ARow;
                  ARow1 := ARow;
                  PlaceControl(pnlXSequence);
                  btnXSequence.Width := pnlXSequence.Width;
                end;
  end; {case ACol}
end;

procedure TfrmODMeds.UMDelayEvent(var Message: TMessage);
{ after focusing events are completed for a combobox, set the key the user typed }
begin
  case Message.LParam of
  COL_DOSAGE   : FindInCombo(Chr(Message.WParam), cboXDosage);
  COL_ROUTE    : FindInCombo(Chr(Message.WParam), cboXRoute);
  COL_SCHEDULE : FindInCombo(Chr(Message.WParam), cboXSchedule);
  COL_DURATION : begin
                   txtXDuration.Text := Chr(Message.WParam);
                   txtXDuration.SelStart := 1;
                 end;
  end;
end;

procedure TfrmODMeds.cboXDosageEnter(Sender: TObject);
begin
  inherited;
  // if this was the last row, create a new last row
  if grdDoses.Row = Pred(grdDoses.RowCount) then grdDoses.RowCount := grdDoses.RowCount + 1;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

procedure TfrmODMeds.cboXDosageChange(Sender: TObject);
begin
  inherited;
  if not Changing and (cboXDosage.ItemIndex < 0) then
  begin
    grdDoses.Cells[COL_DOSAGE, cboXDosage.Tag] := cboXDosage.Text;
    UpdateRelated;
  end;
end;

procedure TfrmODMeds.cboXDosageClick(Sender: TObject);
var
  DispDrug: Integer;
  x: string;
begin
  inherited;
  if FSuppressMsg then
  begin
     if PnlMessage.Visible = true then
     begin
       memMessage.SendToBack;
       PnlMessage.Visible := False;
     end;
  end;

  with cboXDosage do if ItemIndex > -1 then x := Text + TAB + Items[ItemIndex] else x := Text;
  grdDoses.Cells[COL_DOSAGE, cboXDosage.Tag] := x;
  UpdateRelated(FALSE);
  DispDrug := StrToIntDef(ValueOf(FLD_DRUG_ID, cboXDosage.Tag), 0);
  if DispDrug > 0 then
  begin
    if not FSuppressMsg then
    begin
      DispOrderMessage(DispenseMessage(DispDrug));
      FSuppressMsg  := False;
    end;
    x := QuantityMessage(DispDrug);
  end
  else x := '';
  if Length(x) > 0
    then lblQtyMsg.Caption := TX_QTY_PRE + x + TX_QTY_POST
    else lblQtyMsg.Caption := '';
end;

procedure TfrmODMeds.cboXDosageExit(Sender: TObject);
begin
  inherited;
  cboXDosageClick(Self);
  cboXDosage.Tag := -1;
  cboXDosage.Hide;
  UpdateRelated;
  RestoreDefaultButton;
  RestoreCancelButton;
  if (pnlMessage.Visible) and (memMessage.TabStop)  then
  begin
    pnlMessage.Parent := grdDoses.Parent;
    pnlMessage.TabOrder := grdDoses.TabOrder;
    ActiveControl := memMessage;
  end
  else if grdDoses.Showing then
    ActiveControl := grdDoses
  else
    ActiveControl := cboDosage;
end;

procedure TfrmODMeds.cboXRouteChange(Sender: TObject);
begin
  inherited;
  //Commented out to fix CQ: 7280
//  if cboXRoute.Text = '' then cboXRoute.ItemIndex := -1;
   if not Changing and (cboXRoute.ItemIndex < 0) then
   begin
     grdDoses.Cells[COL_ROUTE, cboXRoute.Tag] := cboXRoute.Text;
     ControlChange(Self);
   end;
end;

procedure TfrmODMeds.cboXRouteClick(Sender: TObject);
var
  x: string;
begin
  inherited;
  with cboXRoute do if ItemIndex > -1 then x := Text + TAB + Items[ItemIndex] else x := Text;
  grdDoses.Cells[COL_ROUTE, cboXRoute.Tag] := x;
  ControlChange(Self);
end;

procedure TfrmODMeds.cboXRouteExit(Sender: TObject);
begin
  inherited;
  //Removed based on Site feeback. See CQ: 7518
{  if Not ValidateRoute(cboXRoute) then
    Exit; }
  if Trim(cboXRoute.Text) = '' then
  begin
    cboXRoute.ItemIndex := -1;
    Exit;
  end;  
  cboXRouteClick(Self);
  cboXRoute.Tag := -1;
  cboXRoute.Hide;
  RestoreDefaultButton;
  RestoreCancelButton;
  if (pnlMessage.Visible) and (memMessage.TabStop) then
  begin
    pnlMessage.Parent := grdDoses.Parent;
    pnlMessage.TabOrder := grdDoses.TabOrder;
    ActiveControl := memMessage;
  end
  else if grdDoses.Showing then
    ActiveControl := grdDoses
  else
    ActiveControl := cboDosage;
end;

procedure TfrmODMeds.pnlXScheduleEnter(Sender: TObject);
begin
  inherited;
  cboXSchedule.SetFocus;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

procedure TfrmODMeds.cboXScheduleChange(Sender: TObject);
var
  othSch, x: string;
  idx : integer;
begin
  inherited;
  //Commented out to fix CQ: 7280
//  if cboXSchedule.Text = '' then cboXSchedule.ItemIndex := -1;
  if not Changing {and (cboXSchedule.ItemIndex < 0)} then
  begin
    if (FInptDlg) and (cboXSchedule.Text = 'OTHER') then
    begin
      othSch := CreateOtherScheduelComplex;
      if length(trim(othSch)) > 1 then
      begin
        cboXSchedule.Items.Add(othSch);
        idx := cboXSchedule.Items.IndexOf(OthSch);
        cboXSchedule.ItemIndex := idx;
      end;
    end;
  (* if chkXPRN.Checked then PRN := ' PRN' else PRN := '';
    with cboXSchedule do if ItemIndex > -1
      then x := Text + PRN + TAB + Items[ItemIndex]
      else x := Text + PRN; *)
    with cboXSchedule do if ItemIndex > -1
      then x := Text + TAB + Items[ItemIndex]
      else x := Text;
    grdDoses.Cells[COL_SCHEDULE, pnlXSchedule.Tag] := x;
    self.cboSchedule.Text := x;
    UpdateRelated;
  end;
end;

procedure TfrmODMeds.cboXScheduleClick(Sender: TObject);
var
  x: string;
begin
  inherited;
  //if chkXPRN.Checked then PRN := ' PRN' else PRN := '';
 (* with cboXSchedule do if ItemIndex > -1
    then x := Text + PRN + TAB + Items[ItemIndex]
    else x := Text + PRN;  *)
  with cboXSchedule do if ItemIndex > -1
    then x := Text + TAB + Items[ItemIndex]
    else x := Text;
   (* if (Pos('PRN',X)>0) and (pnlXSchedule.Tag = 1) then
    if lblAdmintime.visible then
      lblAdmintime.Caption := ''; *)
  grdDoses.Cells[COL_SCHEDULE, pnlXSchedule.Tag] := x;
  UpdateStartExpires(x);
  UpdateRelated;
end;

procedure TfrmODMeds.chkXPRNClick(Sender: TObject);
var
check: string;
begin
  inherited;
  if self.chkXPRN.Checked = True then check := '1'
  else check := '0';
  self.grdDoses.Cells[COL_CHKXPRN, self.grdDoses.Row] := check;
  if not Changing then cboXScheduleClick(Self);
end;

procedure TfrmODMeds.pnlXScheduleExit(Sender: TObject);
begin
  inherited;
  if Not FShowPnlXScheduleOk then   //Added for CQ: 7370
    Exit;
  cboXScheduleClick(Self);
  pnlXSchedule.Tag := -1;
  pnlXSchedule.Hide;
  UpdateRelated;
  RestoreDefaultButton;
  RestoreCancelButton;
  if (pnlMessage.Visible) and (memMessage.TabStop) then
  begin
    pnlMessage.Parent := grdDoses.Parent;
    pnlMessage.TabOrder := grdDoses.TabOrder;
    ActiveControl := memMessage;
  end
  else if grdDoses.Showing then
    ActiveControl := grdDoses
  else
    ActiveControl := cboDosage;
end;

procedure TfrmODMeds.pnlXDurationEnter(Sender: TObject);
begin
  inherited;
  txtXDuration.SetFocus;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

procedure TfrmODMeds.txtXDurationChange(Sender: TObject);
var
  I, Code: Integer;
  OrgValue: string;
begin
  inherited;
  if Changing then Exit;
  if (txtXDuration.Text <> '0') and (txtXDuration.Text <> '') then
  begin
    Val(txtXDuration.Text, I, Code);
    UpdateDurationControls(Code <> 0);
    //Commented out the "and" to resolve CQ: 7557
    if (Code <> 0) {and (I=0)} then
    begin
      ShowMessage('Please use numeric characters only.');
      with txtXDuration do
      begin
        Text := IntToStr(I);
        SelStart := Length(Text);
      end;
      Exit;
      btnXDuration.Width := 8;
      btnXDuration.Align := alRight;
      spnXDuration.Visible := False;
      txtXduration.Align := alClient;
      PopDuration.Items.Tag := 0;
      btnXDuration.Caption := '';
    end;
   {AGP change 26.19 for PSI-05-018 cq #7322
    else if PopDuration.Items.Tag = 0 then
    begin
      PopDuration.Items.Tag := 3;  //Days selection
      btnXDuration.Caption := 'days';
    end; }
    grdDoses.Cells[COL_DURATION, pnlXDuration.Tag] := txtXDuration.Text + ' ' + Uppercase(btnXDuration.Caption);
  end else   //AGP CHANGE ORDER
       begin
         if not(FInptDlg) then grdDoses.Cells[COL_DURATION, pnlXDuration.Tag] := '';
         OrgValue := ValFor(COL_DURATION, pnlxDuration.tag);
         //if ((txtXDuration.Text = '0') or (txtXDuration.Text = '')) and ((ValFor(COL_SEQUENCE, ARow1) = 'THEN') and (FInptDlg)) then //AGP CHANGE ORDER
         //AGP change 26.33 Then/And conjunction requiring a duration to include outpatient orders also
         if ((txtXDuration.Text = '0') or (txtXDuration.Text = '')) and (ValFor(COL_SEQUENCE, ARow1) = 'THEN') then //AGP CHANGE ORDER
             begin
               if (InfoBox('A duration is required when using "Then" as a sequence.'+CRLF+'"Then" will be remove from the sequence field if you continue'+
                    CRLF+'Click "OK" to continue or click "Cancel"','Duration Warning', MB_OKCANCEL)=1) then
                    begin
                        grdDoses.Cells[COL_DURATION, pnlXDuration.Tag] := '';
                        pnlXSequence.Tag := ARow1;
                        pnlXSequence.Caption := '';
                        grdDoses.Cells[COL_SEQUENCE, pnlXSequence.Tag] := '';
                        btnXSequence.Click;
                    end
                    else
                    grdDoses.Cells[COL_DURATION, pnlXDuration.Tag] := OrgValue;
               end
             else grdDoses.Cells[COL_DURATION, pnlXDuration.Tag] := txtXDuration.Text;
       end;
   // end;
  ControlChange(Self);
  UpdateRelated;
end;

procedure TfrmODMeds.pnlXDurationExit(Sender: TObject);
begin
  inherited;
  pnlXDuration.Tag := -1;
  pnlXDuration.Hide;
  UpdateRelated;
  RestoreDefaultButton;
  RestoreCancelButton;
  if (pnlMessage.Visible) and (memMessage.TabStop) then
  begin
    pnlMessage.Parent := grdDoses.Parent;
    pnlMessage.TabOrder := grdDoses.TabOrder;
    ActiveControl := memMessage;
  end
  else if grdDoses.Showing then
    ActiveControl := grdDoses
  else
    ActiveControl := cboDosage;
end;

procedure TfrmODMeds.btnXSequenceClick(Sender: TObject);
var
  APoint: TPoint;
begin
  inherited;
  inherited;
  with TSpeedButton(Sender) do APoint := ClientToScreen(Point(0, Height));
  popXSequence.Popup(APoint.X, APoint.Y);
  pnlXSequence.Caption := btnXSequence.Caption;
  {
  with TSpeedButton(Sender) do APoint := ClientToScreen(Point(0, Height));
  popXSequence.Popup(APoint.X, APoint.Y);
  pnlXSequence.Caption := btnXSequence.Caption;
  if (pnlXSequence.Caption = 'then') and
      ((ValFor(COL_DURATION, ARow1) = '') or
       (ValFor(COL_DURATION, ARow1) = '0')) then
     begin
       InfoBox('A duration is required when using "Then" as a conjunction','Duration Warning',MB_OK);
       pnlXSequence.Caption := '';
       btnXSequence.Caption := '';
     end;
     }
end;

procedure TfrmODMeds.popXSequenceClick(Sender: TObject);
var
  x: string;
begin
  inherited;
  with TMenuItem(Sender) do if Tag > 0 then x := Caption else x := '';
 //AGP Changes 26.12 PSI-04-63
 //if ((x = 'then') and (FInptDlg)) and ((ValFor(COL_DURATION, ARow1) = '') or (ValFor(COL_DURATION, ARow1) = '0')) then
 //AGP change 26.32 Then/And conjunction requiring a duration to include outpatient orders
 if (x = 'then') and ((ValFor(COL_DURATION, ARow1) = '') or (ValFor(COL_DURATION, ARow1) = '0')) then
     begin
       InfoBox('A duration is required when using "Then" as a conjunction' + CRLF + CRLF+
           'The patient will be instructed to take these doses consecutively, not concurrently.','Duration Warning',MB_OK);
       x := '';
     end;
  btnXSequence.Caption := x;
  pnlXSequence.Caption := btnXSequence.Caption;
  grdDoses.Cells[COL_SEQUENCE, pnlXSequence.Tag] := Uppercase(x);
  ControlChange(Sender);
end;

procedure TfrmODMeds.pnlXSequenceExit(Sender: TObject);
begin
  inherited;
  grdDoses.Cells[COL_SEQUENCE, pnlXSequence.Tag] := Uppercase(btnXSequence.Caption);
  if ActiveControl = grdDoses then
  begin
    //This next condition seldom occurs, since entering the dosage on the last
    // row adds another row
    if grdDoses.Row = grdDoses.RowCount - 1 then
      grdDoses.RowCount := grdDoses.RowCount + 1;
  end;
  pnlXSequence.Tag := -1;
  pnlXSequence.Hide;
  RestoreDefaultButton;
  RestoreCancelButton;
  if (pnlMessage.Visible) and (memMessage.TabStop) then
  begin
    pnlMessage.Parent := grdDoses.Parent;
    pnlMessage.TabOrder := grdDoses.TabOrder;
    ActiveControl := memMessage;
  end
  else if grdDoses.Showing then
    ActiveControl := grdDoses
  else
    ActiveControl := cboDosage;
end;

procedure TfrmODMeds.btnXInsertClick(Sender: TObject);
var
  i: Integer;
  x1, x2: string;
begin
  inherited;
  grdDoses.SetFocus;                            // make sure exit events for editors fire
  with grdDoses do
  begin
    if Row < 1 then Exit;
    x1 := grdDoses.Cells[COL_ROUTE,    Row];
    x2 := grdDoses.Cells[COL_SCHEDULE, Row];
    RowCount := RowCount + 1;
    { move rows down }
    for i := Pred(RowCount) downto Succ(Row) do Rows[i] := Rows[i-1];
    Rows[Row].Clear;
    Cells[COL_ROUTE,    Row] := x1;
    Cells[COL_SCHEDULE, Row] := x2;
    Col := COL_DOSAGE;
    ShowEditor(COL_DOSAGE, Row, #0);
  end;
  DropLastSequence;
end;

procedure TfrmODMeds.btnXRemoveClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  grdDoses.SetFocus;                            // make sure exit events for editors fire
  with grdDoses do if (Row > 0) and (RowCount > 2) then
  begin
    { move rows up }
    for i := Row to RowCount - 2 do Rows[i] := Rows[i+1];
    RowCount := RowCount - 1;
    Rows[RowCount].Clear;
  end;
  DropLastSequence;
  ControlChange(Self);
end;

function TfrmODMeds.ValueOf(FieldID: Integer; ARow: Integer = -1): string;
var
  x: string;
{ Contents of cboDosage
    DrugName^Strength^NF^TDose&Units&U/D&Noun&LDose&Drug^DoseText^CostText^MaxRefills
  Contents of grid cells  (Only the first tab piece for each cell is drawn)
    Dosage    <TAB> DosageFields
    RouteText <TAB> IEN^RouteName^Abbreviation
    Schedule  <TAB> (nothing)
    Duration  <TAB> Duration^Units }
begin
  Result := '';
  if ARow < 0 then                                // use single dose controls
  begin
    case FieldID of
    FLD_DOSETEXT  : with cboDosage do
                      if ItemIndex > -1 then Result := Uppercase(Piece(Items[ItemIndex], U, 5))
                                        else Result := Uppercase(Text);
    FLD_LOCALDOSE : with cboDosage do
                      if ItemIndex > -1 then Result := Piece(Piece(Items[ItemIndex], U, 4), '&', 5)
                                        else Result := Uppercase(Text);
    FLD_STRENGTH  : with cboDosage do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 2);
    FLD_DRUG_ID   : with cboDosage do
                     if ItemIndex > -1  then Result := Piece(Piece(Items[ItemIndex], U, 4), '&', 6);
    FLD_DRUG_NM   : with cboDosage do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 1);
    FLD_DOSEFLDS  : with cboDosage do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 4);
    FLD_TOTALDOSE : with cboDosage do
                      if ItemIndex > -1 then Result := Piece(Piece(Items[ItemIndex], U, 4), '&', 1);
    FLD_UNITNOUN  : with cboDosage do
                      if ItemIndex > -1 then Result := Piece(Piece(Items[ItemIndex], U, 4), '&', 3) + ' '
                                                     + Piece(Piece(Items[ItemIndex], U, 4), '&', 4);
    FLD_ROUTE_ID  : with cboRoute do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 1);
    FLD_ROUTE_NM  : with cboRoute do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 2)
                                        else Result := Text;
    FLD_ROUTE_AB  : with cboRoute do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 3);
    FLD_ROUTE_EX  : with cboRoute do
                     if ItemIndex > -1  then Result := Piece(Items[ItemIndex], U, 4);
    FLD_SCHEDULE  : begin        //gary)
                      Result := UpperCase(Trim(cboSchedule.Text));
                      if chkPRN.Checked then Result := Result + ' PRN';
                      if UpperCase(Copy(Result, Length(Result) - 6, Length(Result))) = 'PRN PRN'
                        then Result := Copy(Result, 1, Length(Result) - 4);
                    end;
    FLD_SCHED_EX  : begin
                      with cboSchedule do
                        begin
                        if ItemIndex > -1 then Result := Piece(Items[ItemIndex], U, 2);
                   (*     if (Length(Result)=0) and (ItemIndex > -1) then
                            begin
                              Result := Piece(Items[ItemIndex], U, 1);
                              if Piece(Items[ItemIndex], U, 3) = 'P' then
                              begin
                                if RightStr(Result,3) = 'PRN' then
                                  begin
                                    Result := Copy(Result,1,Length(Result)-3); //Remove the Trailing PRN
                                    if (RightStr(Result,1) = ' ') or (RightStr(Result,1) = '-') then
                                    Result := Copy(Result,1,Length(Result)-1);
                                  end;
                               Result := Result + ' AS NEEDED';
                              end;
                            end;
                        end; *)
                      if RightStr(Result,3) = 'PRN' then
                           begin
                              Result := Copy(Result,1,Length(Result)-3); //Remove the Trailing PRN
                              if (RightStr(Result,1) = ' ') or (RightStr(Result,1) = '-') then
                              Result := Copy(Result,1,Length(Result)-1);
                              Result := Result + ' AS NEEDED'
                           end;
                      if (Length(Result) > 0) and chkPRN.Checked then Result := Result + ' AS NEEDED';
                      if UpperCase(Copy(Result, Length(Result) - 18, Length(Result))) = 'AS NEEDED AS NEEDED'
                        then Result := Copy(Result, 1, Length(Result) - 10);
                      if UpperCase(Copy(Result, Length(Result) - 12, Length(Result))) = 'PRN AS NEEDED' then
                          begin
                            Result := Copy(Result, 1, Length(Result) - 13);
                            if RightStr(Result,1)=' ' then Result := Result + 'AS NEEDED'
                            else Result := Result + ' AS NEEDED';
                          end;
                    end;
                    end;
    FLD_SCHED_TYP : with cboSchedule do
                      if ItemIndex > -1 then Result := Piece(Items[ItemIndex], U, 3);
    FLD_QTYDISP   : with cboDosage do
                      begin
                        if ItemIndex > -1 then Result := Piece(Items[ItemIndex], U, 8);
                        if (Result = '') and (Items.Count > 0) then Result := Piece(Items[0], U, 8);
                        if Result <> ''
                          then Result := 'Qty (' + Result + ')'
                          else Result := 'Quantity';
                      end;
    end; {case FieldID}                           // use complex dose controls
  end else
  begin
    if (ARow < 1) or (ARow >= grdDoses.RowCount) then Exit;
    if Length(FDrugID) > 0
      then x := FieldsForDose(ARow)
      else x := Piece(Piece(grdDoses.Cells[COL_DOSAGE, ARow], TAB, 2), U, 4);
    with grdDoses do
      case FieldID of
      FLD_DOSETEXT  : Result := Uppercase(Piece(Cells[COL_DOSAGE, ARow], TAB, 1));
      FLD_LOCALDOSE : begin
                        if (Length(x) > 0) and (Length(FDrugID) > 0)
                          then Result := Piece(x, '&', 5)
                          else Result := Uppercase(Piece(Cells[COL_DOSAGE, ARow], TAB, 1));
                      end;
      FLD_STRENGTH  : Result := Piece(x, '&', 7) + Piece(x, '&', 8);
      FLD_DRUG_ID   : Result := Piece(x, '&', 6);
      FLD_DRUG_NM   : Result := Piece(FieldsForDrug(Piece(x, '&', 6)), U, 4);
      FLD_DOSEFLDS  : Result := x;
      FLD_TOTALDOSE : Result := Piece(x, '&', 1);
      FLD_UNITNOUN  : Result := Piece(x, '&', 3) + ' ' + Piece(x, '&', 4);
      FLD_ROUTE_ID  : Result := Piece(Piece(Cells[COL_ROUTE, ARow], TAB, 2), U, 1);
      FLD_ROUTE_NM  : begin
                        Result := Piece(Piece(Cells[COL_ROUTE, ARow], TAB, 2), U, 2);
                        if Result = '' then Result := Piece(Cells[COL_ROUTE, ARow], TAB, 1);
                      end;
      FLD_ROUTE_AB  : Result := Piece(Piece(Cells[COL_ROUTE, ARow], TAB, 2), U, 3);
      FLD_ROUTE_EX  : Result := Piece(Piece(Cells[COL_ROUTE, ARow], TAB, 2), U, 4);
      FLD_SCHEDULE  : begin
                         Result := Piece(Piece(Cells[COL_SCHEDULE, ARow], TAB, 2), U, 1);
                         if Result = '' then Result := Piece(Cells[COL_SCHEDULE, ARow], TAB, 1);
                         if valFor(VAL_CHKXPRN,ARow)='1' then Result := Result + ' PRN';
                         if UpperCase(Copy(Result, Length(Result) - 6, Length(Result))) = 'PRN PRN' then
                         Result := Copy(Result, 1, Length(Result) - 4);
                      end;
      FLD_SCHED_EX  : begin
                        (*Result := Piece(Piece(Cells[COL_SCHEDULE, ARow], TAB, 2), U, 2);
                        if Result = '' then //Added for CQ: 7639
                        begin
                          Result := Piece(Cells[COL_SCHEDULE, ARow], TAB, 1);
                          if RightStr(Result,4) = ' PRN' then
                            Result := Copy(Result,1,Length(Result)-4); //Remove the Trailing PRN
                        end;
                        if (Piece(Cells[COL_SCHEDULE, ARow], TAB, 1) <>
                           Piece(Piece(Cells[COL_SCHEDULE, ARow], TAB, 2), U, 1)) and
                           (Pos('PRN', Piece(Cells[COL_SCHEDULE, ARow], TAB, 1)) > 0)
                           then Result := Result + ' AS NEEDED';
                      end;*)
                        Result := Piece(Piece(Cells[COL_SCHEDULE, ARow], TAB, 2),U,2);
                        if Result = '' then Result := Piece(Piece(Cells[COL_SCHEDULE, ARow], TAB, 2),U,1); //Added for CQ: 7639
                        if Result = '' then Result := Piece(Cells[COL_SCHEDULE, ARow], TAB, 1);
                        if RightStr(Result,3) = 'PRN' then
                           begin
                              Result := Copy(Result,1,Length(Result)-3); //Remove the Trailing PRN
                              if (RightStr(Result,1) = ' ') or (RightStr(Result,1) = '-') then
                              Result := Copy(Result,1,Length(Result)-1);
                              Result := Result + ' AS NEEDED';
                           end;
                        if valFor(VAL_CHKXPRN,ARow)='1' then Result := Result + ' AS NEEDED';
                        if UpperCase(Copy(Result, Length(Result) - 18, Length(Result))) = 'AS NEEDED AS NEEDED'
                        then Result := Copy(Result, 1, Length(Result) - 10);
                        if UpperCase(Copy(Result, Length(Result) - 12, Length(Result))) = 'PRN AS NEEDED' then
                          begin
                            Result := Copy(Result, 1, Length(Result) - 13);
                            if RightStr(Result,1)=' ' then Result := Result + 'AS NEEDED'
                            else Result := Result + ' AS NEEDED';
                          end;
                      end;
      FLD_SCHED_TYP : Result := Piece(Piece(Cells[COL_SCHEDULE, ARow], TAB, 2), U, 3);
      FLD_DURATION  : Result := Piece(Cells[COL_DURATION, ARow], TAB, 1);
      FLD_SEQUENCE  : Result := Piece(Cells[COL_SEQUENCE, ARow], TAB, 1);
      end; {case FieldID}
  end; {if ARow}
  if FieldID > FLD_MISC_FLDS then                 // still need to process 'non-sig' fields
  begin
    case FieldID of
    FLD_SUPPLY    : Result := Trim(txtSupply.Text);
    FLD_QUANTITY  :
    begin
       if Pos(',', txtQuantity.Text)>0 then 
        Result := Piece(txtQuantity.Text,',',1) + Piece(txtQuantity.Text,',',2)
       else
        Result := Trim(txtQuantity.Text);
    end;
    FLD_REFILLS   : Result := txtRefills.Text;
    FLD_PICKUP    : if      radPickWindow.Checked then Result := 'W'
                    else if radPickMail.Checked   then Result := 'M'
                    else if radPickClinic.Checked then Result := 'C'
                    else Result := '';
    FLD_PRIOR_ID  : Result := cboPriority.ItemID;
    FLD_PRIOR_NM  : Result := cboPriority.Text;
    FLD_COMMENT   : Result := memComment.Text;
    FLD_SC        : if chkSC.Visible then
                    begin
                      if chkSC.Checked then Result := '1' else Result := '0';
                    end;
    FLD_NOW_ID    : if chkDoseNow.Visible and chkDoseNow.Checked then Result := '1'   else Result := '';
    FLD_NOW_NM    : if chkDoseNow.Visible and chkDoseNow.Checked then Result := 'NOW' else Result := '';
    FLD_PTINSTR   : if chkPtInstruct.Visible and chkPtInstruct.Checked
                      then Result := FPtInstruct
                      else Result := ' ';
    end; {case FieldID}
  end; {if FieldID}
end;

function TfrmODMeds.ValueOfResponse(FieldID: Integer; AnInstance: Integer = 1): string;
var
  x: string;
begin
  case FieldID of
  FLD_SCHEDULE  : Result := Responses.IValueFor('SCHEDULE', AnInstance);
  FLD_UNITNOUN  : begin
                    x := Responses.IValueFor('DOSE',   AnInstance);
                    Result := Piece(x, '&', 3) + ' ' + Piece(x, '&', 4);
                  end;
  FLD_DOSEUNIT  : begin
                    x := Responses.IValueFor('DOSE',   AnInstance);
                    Result := Piece(x, '&', 3);
                  end;
  FLD_DRUG_ID   : Result := Responses.IValueFor('DRUG',     AnInstance);
  FLD_INSTRUCT  : Result := Responses.IValueFor('INSTR',    AnInstance);
  FLD_SUPPLY    : Result := Responses.IValueFor('SUPPLY',   AnInstance);
  FLD_QUANTITY  : Result := Responses.IValueFor('QTY',      AnInstance);
  FLD_ROUTE_ID  : Result := Responses.IValueFor('ROUTE',    AnInstance);
  FLD_EXPIRE    : Result := Responses.IValueFor('DAYS',     AnInstance);
  FLD_ANDTHEN   : Result := Responses.IValueFor('CONJ',     AnInstance);
  end;
end;

procedure TfrmODMeds.UpdateDefaultSupply(const CurUnits, CurSchedule, CurDuration, CurDispDrug: string;
  var CurSupply: Integer; var CurQuantity: double; var SkipQtyCheck: Boolean);
var
  ADrug: string;
begin
  if ((StrToFloatDef(txtQuantity.Text, 0) = 0) and (StrToIntDef(txtSupply.Text, 0) = 0) and
     (txtQuantity.Tag = 0) and (txtSupply.Tag = 0) and (cboDosage.Text <> ''))
     or ((cboDosage.ItemIndex < 0) and not FIsQuickOrder ) then
  begin
    ADrug := Piece(CurDispDrug, U, 1);
    CurSupply := DefaultDays(ADrug, CurUnits, CurSchedule);
    if CurSupply > 0 then
    begin
      spnSupply.Position := CurSupply;
      if (txtSupply.Text = '') or (StrToInt(txtSupply.Text)<>CurSupply)  then
        txtSupply.Text := IntToStr(CurSupply);
      if (FIsQuickOrder and FQOInitial) then
      begin
        if StrToFloatDef(txtSupply.Text,0) > 0 then
        begin
          Exit;
        end;
      end;
      CurQuantity := DaysToQty(CurSupply, CurUnits, CurSchedule, CurDuration, ADrug);
      if CurQuantity >= 0 then
      begin
       //spnQuantity.Position := CurQuantity;
       if txtQuantity.Text <> '' then
        txtQuantity.Text := FloatToStr(CurQuantity);
       if (txtQuantity.Text = '') or (StrToInt(txtQuantity.Text) <> CurQuantity) then
         txtQuantity.Text := FloatToStr(CurQuantity);
      end;
      SkipQtyCheck := TRUE;
    end;
  end;
end;

procedure TfrmODMeds.UpdateSupplyQuantity(const CurUnits, CurSchedule, CurDuration, CurDispDrug: string;
  var CurSupply: Integer; var CurQuantity: double);
const
  UPD_NONE     = 0;
  UPD_QUANTITY = 1;
  UPD_SUPPLY   = 2;
  UPD_COMPLEX  = 3;
  UPD_BOTH     = 4;
var
  UpdateControl, NewSupply: Integer;
  ADrug: string;
  SaveChanging: Boolean;
  tmpQuty: Double;
begin
  tmpQuty := 0;
  if (tabDose.TabIndex = TI_COMPLEX) and (txtSupply.Tag = 0) and (txtQuantity.Tag = 0) then
  begin
    // set days supply based on durations
    NewSupply := DurationToDays;
    if NewSupply > 0 then
    begin
      SaveChanging := Changing;
      Changing := TRUE;
      txtSupply.Text := IntToStr(NewSupply);
      CurSupply := NewSupply;
      Changing := SaveChanging;
    end;
  end;
  // exit if not enough fields to calculation supply or quantity
  if (CurQuantity = 0) and (CurSupply = 0) then Exit;
  // exit if nothing has changed
  if (CurUnits    = FLastUnits)    and
     (CurSchedule = FLastSchedule) and
     (CurDuration = FLastDuration) and
     (CurQuantity = FLastQuantity) and
     (CurSupply   = FLastSupply)   then Exit;
  // exit if supply & quantity have both been directly edited
  if (txtSupply.Tag > 0) and (txtQuantity.Tag > 0) then Exit;
  // figure out which control to update
  UpdateControl := UPD_NONE;

  if (CurSupply <> FLastSupply) and (txtQuantity.Tag = 0) and (CurQuantity <> FLastQuantity) and (txtSupply.Tag = 0) and Changing then UpdateControl := UPD_BOTH
  else if (CurSupply <> FLastSupply) and (txtQuantity.Tag = 0) then UpdateControl := UPD_QUANTITY
  else if (CurQuantity <> FLastQuantity) and (txtSupply.Tag = 0) then UpdateControl := UPD_SUPPLY;
  if (UpdateControl = UPD_NONE) and ((CurUnits <> FLastUnits) or (CurSchedule <> FLastSchedule)) then
  begin
    if txtQuantity.Tag = 0    then UpdateControl := UPD_QUANTITY
    else if txtSupply.Tag = 0 then UpdateControl := UPD_SUPPLY;
  end;
  ADrug := Piece(CurDispDrug, U, 1);  // just use the first dispense drug (for clozapine chk)
  case UpdateControl of
  UPD_QUANTITY : begin
                   if FIsQuickOrder and (CurQuantity > 0) and FQOInitial then
                   begin
                     FQOInitial := False;
                     Exit;
                   end;
                   if FIsQuickOrder and (CurQuantity > 0) then
                     tmpQuty := CurQuantity;
                   CurQuantity := DaysToQty(CurSupply,   CurUnits, CurSchedule, CurDuration, ADrug);
                   if (tmpQuty > 0) and (CurQuantity <= 0) then
                   begin
                     txtQuantity.Text := FloatToStr(tmpQuty);
                     CurQuantity := tmpQuty;
                   end else if (CurQuantity >= 0) then
                     txtQuantity.Text := FloatToStr(CurQuantity);
                 end;
  UPD_SUPPLY   : begin
                   CurSupply   := QtyToDays(CurQuantity, CurUnits, CurSchedule, CurDuration, ADrug);
                   if CurSupply > 0   then txtSupply.Text     := IntToStr(CurSupply);
                 end;
  UPD_BOTH     : begin
                   txtSupply.Text     := IntToStr(CurSupply);
                   tmpQuty := 0;
                   if FIsQuickOrder and (CurQuantity > 0) and FQOInitial then
                   begin
                     FQOInitial := False;
                     Exit;
                   end;
                   if FIsQuickOrder and (CurQuantity > 0) then
                     tmpQuty := CurQuantity;
                   CurQuantity := DaysToQty(CurSupply,   CurUnits, CurSchedule, CurDuration, ADrug);
                   if (tmpQuty > 0) and (CurQuantity <= 0) then
                   begin
                     txtQuantity.Text := FloatToStr(tmpQuty);
                     CurQuantity := tmpQuty;
                   end else if CurQuantity >= 0 then
                     txtQuantity.Text := FloatToStr(CurQuantity);
                 end;
  end;
  if UpdateControl > UPD_NONE then FUpdated := True;
end;

procedure TfrmODMeds.UpdateSC(const CurDispDrug: string);
var
  Dispense: Integer;
begin
  Dispense := StrToIntDef(Piece(CurDispDrug, U, 1), 0);  // just use first dispense drug for now
  if Patient.ServiceConnected and RequiresCopay(Dispense) then
  begin
    chkSC.Visible := True;
    if chkSC.Tag = 0 then chkSC.Checked := Patient.SCPercent > 50;
    if chkSC.Hint = '' then chkSC.Hint := RatedDisabilities;
  end
  else chkSC.Visible := False;
  FUpdated := True;
end;

procedure TfrmODMeds.UpdateStartExpires(const CurSchedule: string);
var
  CompSch, ShowText, Duration, ASchedule: string;
  AdminTime:    TFMDateTime;
  i, j, Interval, PrnPos: Integer;
begin
  if Length(CurSchedule)=0 then Exit;
  ASchedule := Trim(CurSchedule);
  if (Pos('^',ASchedule)>0) then
  begin
    PrnPos := Pos('PRN',ASchedule);
    if (PrnPos > 1) and (CharAt(ASchedule,PrnPos-1)=' ') then
      Delete(ASchedule, PrnPos-1, 4);
  end;
  ASchedule := Trim(ASchedule);
  if self.tabDose.TabIndex = TI_COMPLEX then
    begin
      CompSch := valFor(VAL_SCHEDULE,1);
      if CompSch = '' then
        begin
          ASchedule := '';
          AdminTime := -1;
        end;
      if CompSch <> '' then
        begin
          for i := 0 to self.cboXSchedule.Items.Count-1 do
            begin
              if (Piece(self.cboXSchedule.Items.Strings[i],U,1) = CompSch) and (Piece(self.cboXSchedule.Items.Strings[i],U,3)='P') then
                begin
                  AdminTime := -1;
                  Aschedule := '';
                end;
            end;
        end;
        if valFor(VAL_CHKXPRN,1)='1' then
          begin
            AdminTime := -1;
            Aschedule := '';
          end;
      if (ASchedule <> '') and (CompSch <> '') then ASchedule := ';' + CompSch;
    end;
  if Length(ASchedule)>0 then
      LoadAdminInfo(ASchedule, txtMed.Tag, ShowText, AdminTime, Duration);
  //else Exit;
  if (AdminTime > 0) and (self.tabDose.TabIndex = TI_DOSE) then
    begin
     if self.cboSchedule.ItemIndex = -1 then
       begin
         for j := 0 to self.cboSchedule.items.Count -1 do
           begin
             if (Piece(self.cboSchedule.Items.Strings[j],U,1) = Piece(Aschedule,';',2)) and (Piece(self.cboSchedule.Items.Strings[j],U,3)='P') then
               begin
                 AdminTime := -1;
                 break;
               end;
           end;
       end;
     if (self.cboSchedule.ItemIndex > -1) and (Piece(self.cboSchedule.Items.Strings[self.cboSchedule.ItemIndex],U,3)='P') then
       AdminTime := -1;
     if self.chkPRN.Checked = true then AdminTime := -1
    end;
  if AdminTime > 0 then
  begin
    ShowText := 'Expected First Dose: ';
    Interval := Trunc(FMDateTimeToDateTime(AdminTime) - FMDateTimeToDateTime(FMToday));
    case Interval of
    0: ShowText := ShowText + 'TODAY ' + FormatFMDateTime('(mmm dd, yy) at hh:nn', AdminTime);
    1: ShowText := ShowText + 'TOMORROW ' + FormatFMDateTime('(mmm dd, yy) at hh:nn', AdminTime);
    else ShowText := ShowText + FormatFMDateTime('mmm dd, yy at hh:nn', AdminTime);
    end;

    if (Pos('PRN',Piece(CurSchedule,'^',1))>0) and ((pnlXSchedule.Tag = 1) or chkPrn.Checked ) then
    begin
      if lblAdmintime.visible then
      begin
        lblAdmintime.Caption := '';
        FAdminTimeLbl := lblAdminTime.Caption;
      end;
    end else
      lblAdminTime.Caption := ShowText;
      FAdminTimeLbl := lblAdminTime.Caption;
  end
  else lblAdminTime.Caption := '';
end;

procedure TfrmODMeds.UpdateRefills(const CurDispDrug: string; CurSupply: Integer);
begin
  if EvtForPassDischarge = 'D' then
    spnRefills.Max := CalcMaxRefills(CurDispDrug, CurSupply, txtMed.Tag, True)
  else
    spnRefills.Max := CalcMaxRefills(CurDispDrug, CurSupply, txtMed.Tag, Responses.EventType = 'D');
  if StrToIntDef(txtRefills.Text, 0) > spnRefills.Max then
  begin
    txtRefills.Text := IntToStr(spnRefills.Max);
    spnRefills.Position := spnRefills.Max;
    FUpdated := True;
  end;
end;

procedure TfrmODMeds.UpdateRelated(DelayUpdate: Boolean = TRUE);
begin
  timCheckChanges.Enabled := False;               // turn off timer
  if DelayUpdate
    then timCheckChanges.Enabled := True          // restart timer
    else timCheckChangesTimer(Self);              // otherwise call directly
end;

procedure TfrmODMeds.timCheckChangesTimer(Sender: TObject);
const
  UPD_NONE     = 0;
  UPD_QUANTITY = 1;
  UPD_SUPPLY   = 2;
var
  CurUnits, CurSchedule, CurInstruct, CurDispDrug, CurDuration, TmpSchedule, x, x1: string;
  CurScheduleIN, CurScheduleOut: string;
  CurSupply, i, pNum, j: Integer;
  CurQuantity: double;
  LackQtyInfo, SaveChanging, DispFirstDose: Boolean;
begin
  inherited;
  timCheckChanges.Enabled := False;
  ControlChange(Self);
  SaveChanging := Changing;
  Changing := TRUE;
  DispFirstDose := FALSE;
  // don't allow Exit procedure so Changing gets reset appropriately
  CurUnits    := '';
  CurSchedule := '';
  CurDuration := '';
  LackQtyInfo := False;
  i := Responses.NextInstance('DOSE', 0);
  while i > 0 do
  begin
    x := ValueOfResponse(FLD_DOSEUNIT,  i);
    if (x = '') and (not FIsQuickOrder) then LackQtyInfo := TRUE  //StrToIntDef(x, 0) = 0
    else if  (x = '') and FIsQuickOrder and (Length(txtQuantity.Text)>0) then
      LackQtyInfo := false;
    CurUnits    := CurUnits   + x  + U;
    x := ValueOfResponse(FLD_SCHEDULE,  i);
    if Length(x) = 0         then LackQtyInfo := TRUE;
    CurScheduleOut := CurScheduleOut + x + U;
    x1 := ValueOf(FLD_SEQUENCE,i);
    if Length(x1)>0 then
    begin
      X1 := CharAt(X1,1);
      CurScheduleIn := CurScheduleIn + x1 + ';' + x + U;
    end
    else
      CurScheduleIn := CurScheduleIn + ';' + x + U;
    x := ValueOfResponse(FLD_EXPIRE,    i);
    CurDuration := CurDuration + x + '~';
    x := ValueOfResponse(FLD_ANDTHEN,   i);
    CurDuration := CurDuration + x + U;
    x := ValueOfResponse(FLD_DRUG_ID,   i);
    CurDispDrug := CurDispDrug + x + U;
    x := ValueOfResponse(FLD_INSTRUCT,  i);
    CurInstruct := CurInstruct + x + U;  //AGP CHANGE 26.19 FOR CQ 7465
    i := Responses.NextInstance('DOSE', i);
  end;

  pNum := 1;
  while Length( Piece(CurScheduleIn,U,pNum)) > 0 do
    pNum := pNum + 1;
  if Length(Piece(CurScheduleIn,U,pNum)) < 1 then
    for j := 1 to pNum - 1 do
    begin
      if j = pNum -1 then
        TmpSchedule := TmpSchedule + ';' + Piece(Piece(CurScheduleIn,U,j),';',2)
      else
        TmpSchedule := TmpSchedule + Piece(CurScheduleIn,U,j) + U
    end;
  CurScheduleIn := TmpSchedule;
  CurQuantity := StrToFloatDef(ValueOfResponse(FLD_QUANTITY), 0);
  CurSupply   := StrToIntDef(ValueOfResponse(FLD_SUPPLY)   ,0);
  if FInptDlg then
  begin
    CurSchedule := CurScheduleIn;
    if Pos('^',CurSchedule)>0 then
    begin
      if Pos('PRN',Piece(CurSchedule,'^',1))>0 then
        if lblAdminTime.Visible then
          lblAdminTime.Caption := '';
    end;
    if CurSchedule <> FLastSchedule then UpdateStartExpires(CurSchedule);
    if (ValueOf(FLD_SCHED_TYP) = 'O')
      or (Responses.EventType in ['A','D','T','M','O'])
      or ((Length(cboSchedule.Text)>0) and (cboSchedule.ItemIndex < 0)) then
    begin
      if (chkDoseNow.Checked) and (chkDoseNow.Visible) then
      begin
        chkDoseNowClick(Self);
        chkDoseNow.Checked := False;
      end;
      for i := 0 to cboSchedule.Items.Count-1 do
        begin
                  if Piece(cboSchedule.Items.Strings[i],U,1) = Uppercase(cboSchedule.Text) then
            begin
              DispFirstDose := True;
              break;
            end;
        end;
      if not DispFirstDose then
        begin
          chkDoseNow.Visible := False;
          lblAdminTime.Visible := False;
        end;
    end
    else
      begin
        chkDoseNow.Visible := TRUE;
        lblAdminTime.Visible := not chkDoseNow.Checked;
      end;
    if Responses.EventType in ['A','D','T','M','O'] then lblAdminTime.Visible := False;
  end;
    if not FInptDlg then
  begin
    CurSchedule := CurScheduleOut;
    if (CurInstruct <> FLastInstruct) and (CurUnits <> U) //AGP Change 26.48 Do not update quantity and day supply if no matching dose on the server
      then UpdateDefaultSupply(CurUnits, CurSchedule, CurDuration, CurDispDrug, CurSupply, CurQuantity,
                               LackQtyInfo);
    if LackQtyInfo then begin
      if FScheduleChanged then
        txtQuantity.Text := '0';
    end
    else
      UpdateSupplyQuantity(CurUnits, CurSchedule, CurDuration, CurDispDrug, CurSupply, CurQuantity);
    if (CurDispDrug <> FLastDispDrug) then UpdateSC(CurDispDrug);
    if (CurDispDrug <> FLastDispDrug) or (CurSupply <> FLastSupply) then
      UpdateRefills(CurDispDrug, CurSupply);
  end;

  FLastUnits    := CurUnits;
  FLastSchedule := CurSchedule;
  FLastDuration := CurDuration;
  FLastInstruct := CurInstruct;
  FLastDispDrug := CurDispDrug;
  FLastQuantity := CurQuantity;
  FLastSupply   := CurSupply;
  if (not FNoZERO) and (txtQuantity.Text = '') and (FLastQuantity = 0) then
    txtQuantity.Text := FloatToStr(FLastQuantity);
  if (not FNoZERO) and (txtSupply.Text = '') and (FLastSupply = 0) then
     txtSupply.Text := IntToStr(FLastSupply);
  if (ActiveControl <> nil) and (ActiveControl.Parent <> cboDosage)
    then cboDosage.Text := Piece(cboDosage.Text, TAB, 1);
  Changing := SaveChanging;
  if FUpdated then ControlChange(Self);
  FScheduleChanged := false;
end;

procedure TfrmODMeds.cmdAcceptClick(Sender: TObject);
var
i: integer;
begin
  if (FInptDlg) and (cboSchedule.Text = 'OTHER') then
  begin
    cboScheduleClick(Self);
    Exit;
  end;
  //AGP Change for 26.45 PSI-04-069
  if self.tabDose.TabIndex = 1 then
    begin
       for i := 2 to self.grdDoses.RowCount do
         begin
           if ((ValFor(COL_DOSAGE, i-1) <> '') and (ValFor(COL_DOSAGE, i) <> '')) and (ValFor(COL_SEQUENCE,i-1) = '') then
             begin
              infoBox('To be able to complete a complex order every row except for the last row must have a conjunction defined. ' + CRLF
              + CRLF + 'Verify that all rows have a conjunction defined.','Sequence Error',MB_OK);
              Exit;
             end;
           //text := Self.cboXDosage.Items.Strings[i];
         end;
    end;
  if FInptDlg and (not FOutptIV)
    then DisplayGroup := DisplayGroupByName('UD RX')
  else DisplayGroup := DisplayGroupByName('O RX');
  //timCheckChangesTimer(Self);
  DropLastSequence;
  cmdAccept.SetFocus;
  inherited;
  (*if self.Responses.Cancel = true then
    begin
      self.Destroy;
      exit;
    end; *)
end;

procedure TfrmODMeds.chkPtInstructClick(Sender: TObject);
begin
  inherited;
  ControlChange(Self);
end;

procedure TfrmODMeds.chkDoseNowClick(Sender: TObject);
const
  T  = '"';
  T1 = 'By checking the "Give additional dose now" box, you have actually entered two orders for the same medication "';
  T2 = #13#13'The first order''s administrative schedule is "';
  T3 = #13'The second order''s administrative schedule is "';
  T4 = #13#13'Do you want to continue?';
  T1A = 'By checking the "Give additional dose now" box, you have actually entered a new order with the schedule "NOW"';
  T2A = ' in addition to the one you are placing for the same medication "';
var
  medNm: string;
  theSch: string;
begin
  inherited;
  if (chkDoseNow.Checked) and (tabDose.TabIndex <> TI_COMPLEX) then
  begin
    medNm := txtMed.Text;
    theSch := cboSchedule.Text;
    if length(theSch)>0 then
    begin
      if ( (ValueOf(FLD_SCHED_TYP) <> 'O') and (InfoBox(T1+medNm+T+T2+theSch+T+T3+'NOW"'+T4, 'Warning', MB_OKCANCEL or MB_ICONWARNING) = IDCANCEL) )then
      begin
        chkDoseNow.Checked := False;
        Exit;
      end;
    end else
    begin
      if InfoBox(T1A+T2A+medNm+T+T4, 'Warning', MB_OKCANCEL or MB_ICONWARNING) = IDCANCEL then
      begin
        chkDoseNow.Checked := False;
        Exit;
      end;
    end;
  end;
  lblAdminTime.Visible := not chkDoseNow.Checked;
  if (tabDose.TabIndex = TI_COMPLEX) and chkDoseNow.Checked  then
  begin
    if ( (ValueOf(FLD_SCHED_TYP) <> 'O') and (InfoBox('Give Additional Dose Now is in addition to those listed in the table.' + CRLF +
                 'Please adjust the duration of the first row, if necessary.',
                 'Give Additional Dose Now for Complex Order', MB_OKCANCEL or MB_ICONWARNING) = IDCANCEL) ) then
    begin
      chkDoseNow.Checked := False;
      Exit;
    end;
  end;
  ControlChange(Self);
end;


procedure TfrmODMeds.CheckDecimal(var AStr: string);
var
  DUName,UnitNum,tempStr: string;
  ToWord: string;
  ie,code: integer;
begin
  ToWord := '';
  tempStr := AStr;
  UnitNum := Piece(AStr,' ',1);
  DUName := Copy(tempStr,Length(UnitNum)+1,Length(tempStr));
  DUName := Trim(DUName);
  if CharAt(UnitNum,1)='.' then
  begin
    if CharAt(UnitNum,2) in ['0','1','2','3','4','5','6','7','8','9'] then
    begin
      UnitNum := '0' + UnitNum;
      AStr := '0' + AStr;
    end;
  end;
  if ((Pos('TABLET',upperCase(DUName))= 0)) and ( Pos('DROP',upperCase(DUName))= 0 )then
    Exit;
  if (Length(UnitNum)>0) and (Length(DUName)>0) then
  begin
    if CharAt(UnitNum,1) <> '0' then
    begin
      Val(UnitNum, ie, code);
      if (code <> 0) and (ie=0) then
        Exit;
    end;
    AStr := TextDosage(UnitNum) + ' ' + DUName;
  end;
end;

procedure TfrmODMeds.DropLastSequence(ASign: integer);
const
  TXT_CONJUNCTIONWARNING = 'is not associated with the comment field, and has been deleted.';
var
  i :integer;
  StrConjunc: string;
begin
  for i := 1 to grdDoses.RowCount - 1 do
  begin
    if (i = 1) and (grdDoses.Cells[COL_DOSAGE,i] = '' ) then
      Exit
    else if (i>1) and (grdDoses.Cells[COL_DOSAGE,i] = '') and (grdDoses.Cells[COL_ROUTE,i] = '') then
    begin
      if Length(grdDoses.Cells[COL_SEQUENCE, i-1])>0 then
      begin
        StrConjunc := grdDoses.Cells[COL_SEQUENCE, i-1];
        if ASign = 1 then
        begin
          if InfoBox('The "' + StrConjunc + '" ' + TXT_CONJUNCTIONWARNING, 'Warning', MB_OK or MB_ICONWARNING) = IDOK then
          begin
            grdDoses.Cells[COL_SEQUENCE, i-1] := '';
            ActiveControl := memOrder;
          end
        end
        else
        begin
          grdDoses.Cells[COL_SEQUENCE, i-1] := '';
        end;
      end;
      Exit;
    end;
  end;
end;

procedure TfrmODMeds.memCommentClick(Sender: TObject);
var
  theSign : integer;
begin
  inherited;
  theSign := 1;
  DropLastSequence(theSign);
end;

procedure TfrmODMeds.btnXDurationClick(Sender: TObject);
var
  APoint: TPoint;
begin
  inherited;
  with TSpeedButton(Sender) do APoint := ClientToScreen(Point(0, Height));
  popDuration.Popup(APoint.X, APoint.Y);
end;

procedure TfrmODMeds.chkPRNClick(Sender: TObject);
var
  tempSch: string;
  PRNPos: integer;
begin
  inherited;
  //GE  CQ 7552
  if chkPRN.Checked then
  begin
     lblAdminTime.Caption := '';
     PrnPos := Pos('PRN',cboSchedule.Text);
     if (PrnPos < 1) then
        UpdateStartExpires(cboSchedule.Text + ' PRN');
  end
  else
  begin
    if Length(Trim(cboSchedule.Text))>0 then
    begin
      tempSch := ';'+Trim(cboSchedule.Text);
      UpdateStartExpires(tempSch);
    end;
    //lblAdminTime.Caption := FAdminTimeLbl;
    if txtQuantity.visible then
      cboScheduleClick(Self);
  end;
  ControlChange(Self);
end;

procedure TfrmODMeds.grdDosesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
//  VK_RETURN:   //moved to form key press
  VK_ESCAPE:
    begin
      ActiveControl := FindNextControl(Sender as TWinControl, False, True, False); //Previous control
      Key := 0;
    end;
  VK_INSERT:
    begin
      btnXInsertClick(self);
      Key := 0;
    end;
  VK_DELETE:
    begin
      btnXRemoveClick(self);
      Key := 0;
    end;
  VK_TAB:
    begin
      if ssShift in Shift then
      begin
        ActiveControl := tabDose; //Previeous control
        Key := 0;
      end
      else if ssCtrl	in Shift then
      begin
        ActiveControl := memComment;
        Key := 0;
      end;
    end;
  end;
end;

procedure TfrmODMeds.grdDosesEnter(Sender: TObject);
begin
  inherited;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

function TfrmODMeds.DisableCancelButton(Control: TWinControl): boolean;
var
  i: integer;
begin
  if (Control is TButton) and TButton(Control).Cancel then begin
    result := True;
    FDisabledCancelButton := TButton(Control);
    TButton(Control).Cancel := False;
  end else begin
    result := False;
    for i := 0 to Control.ControlCount-1 do
      if (Control.Controls[i] is TWinControl) then
        if DisableCancelButton(TWinControl(Control.Controls[i])) then begin
          result := True;
          break;
        end;
  end;
end;

function TfrmODMeds.DisableDefaultButton(Control: TWinControl): boolean;
var
  i: integer;
begin
  if (Control is TButton) and TButton(Control).Default then begin
    result := True;
    FDisabledDefaultButton := TButton(Control);
    TButton(Control).Default := False;
  end else begin
    result := False;
    for i := 0 to Control.ControlCount-1 do
      if (Control.Controls[i] is TWinControl) then
        if DisableDefaultButton(TWinControl(Control.Controls[i])) then begin
          result := True;
          break;
        end;
  end;
end;

procedure TfrmODMeds.RestoreCancelButton;
begin
  if Assigned(FDisabledCancelButton) then begin
    FDisabledCancelButton.Cancel := True;
    FDisabledCancelButton := nil;
  end;
end;

procedure TfrmODMeds.RestoreDefaultButton;
begin
  if Assigned(FDisabledDefaultButton) then begin
    FDisabledDefaultButton.Default := True;
    FDisabledDefaultButton := nil;
  end;
end;

procedure TfrmODMeds.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (ActiveControl = grdDoses{pnlXSequence}) then
  begin
    ShowEditor(grdDoses.Col, grdDoses.Row, #0);
    Key := #0;  //Don't let the base class turn it into a forward tab!
  end
  else if (Key = #13) and (ActiveControl = txtMed) then
    Key := #0;   //Don't let the base class turn it into a forward tab!
end;

procedure TfrmODMeds.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) and (ssCtrl in Shift) and (ActiveControl <> grdDoses) then
  begin
    //Back-tab works the same as forward-tab because there are only two tabs.
    tabDose.TabIndex := (tabDose.TabIndex + 1) mod tabDose.Tabs.Count;
    Key := 0;
    tabDoseChange(tabDose);
  end;
end;

procedure TfrmODMeds.cboXRouteEnter(Sender: TObject);
begin
  inherited;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

procedure TfrmODMeds.pnlXSequenceEnter(Sender: TObject);
begin
  inherited;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

procedure TfrmODMeds.pnlMessageEnter(Sender: TObject);
begin
  inherited;
  DisableDefaultButton(self);
  DisableCancelButton(self);
end;

procedure TfrmODMeds.pnlMessageExit(Sender: TObject);
begin
  inherited;
  RestoreDefaultButton;
  RestoreCancelButton;
end;

procedure TfrmODMeds.memMessageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := 0;
  end;
end;

procedure TfrmODMeds.memPIClick(Sender: TObject);
begin
  inherited;
  ShowMessage('The patient instruction field may not be edited.');
  chkPtInstruct.SetFocus;
end;

procedure TfrmODMeds.FormResize(Sender: TObject);
var
  aftHeight: integer;
begin
  inherited;
  pnlFields.Height := memOrder.Top - 4 - pnlFields.Top;
  aftHeight := pnlFields.Top + pnlFields.Height + memOrder.Height;
  if aftHeight > Height then
    Height := aftHeight;
  if pnlMessage.Visible then
    pnlMessage.Top := pnlFields.Top + pnlTop.Height + 8;
end;

procedure TfrmODMeds.spnQuantityChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
  tempQuant: double;
begin
  inherited;
  if Direction = updUp then
  begin
    tempQuant := StrToFloatDef(txtQuantity.Text,0) + 1;
    txtQuantity.Text := FloatToStr(tempQuant);
  end else if Direction = updDown then
  begin
    tempQuant := StrToFloatDef(txtQuantity.Text,0) - 1 ;
    if tempQuant < 0 then tempQuant := 0;
    txtQuantity.Text := FloatToStr(tempQuant);
  end;
  spnQuantity.Tag := 1;
  txtQuantity.Tag := 1;
end;

procedure TfrmODMeds.memPIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  ShowMessage('The patient instruction field may not be edited.');
  chkPtInstruct.SetFocus;
end;

function TfrmODMeds.TextDosage(ADosage: string): string;
var
  intS, fltS: string;
  iNum: integer;
  fNum: double;
begin
  intS := '';
  fltS := '';
  Result := intS + fltS;
    try
      begin
        iNum := StrToIntDef(Piece(ADosage,'.',1),0);
        fNum := StrToFloatDef('0.'+Piece(ADosage,'.',2),0);
        if fNum = 0.5 then
          fltS := 'ONE-HALF';
        if ( fNum >= 0.3 ) and ( fNum <= 0.4 ) then
          fltS := 'ONE-THIRD';
        if fNum = 0.25 then
          fltS := 'ONE-FOURTH';
        if ( fNum >= 0.6 ) and ( fNum <= 0.7 ) then
          fltS := 'TWO-THIRDS';
        if fNum = 0.75 then
          fltS := 'THREE-FOURTHS';
        if iNum = 1 then
          intS := 'ONE';
        if iNum = 2 then
          intS := 'TWO';
        if iNum = 3 then
          intS := 'THREE';
        if iNum = 4 then
          intS := 'FOUR';
        if iNum = 5 then
          intS := 'FIVE';
        if iNum = 6 then
          intS := 'SIX';
        if iNum = 7 then
          intS := 'SEVEN';
        if iNum = 8 then
          intS := 'EIGHT';
        if iNum = 9 then
          intS := 'NINE';
        if iNum = 10 then
          intS := 'TEN';
        if Length(intS) > 0 then
        begin
          if Length(fltS)>1 then
            fltS :=' AND ' + fltS;
        end;
        Result := intS + fltS;
        if Result = '' then
          Result := ADosage;
      end
    except
      on EConvertError do Result := '';
    end;
end;

function TfrmODMeds.CreateOtherScheduel: string;      //NSS
var
  aSchedule: string;
begin
  aSchedule := '';
  if not ShowOtherSchedule(aSchedule) then
  begin
    cboSchedule.ItemIndex := -1;
    cboSchedule.Text      := '';
  end;
  Result := aSchedule;
end;

function TfrmODMeds.IfIsIMODialog: boolean;
var
  IsInptDlg, IsIMOLocation: boolean;
  Td: TFMDateTime;
begin
  result := False;
  IsInptDlg := False;
  Td := FMToday;
  if DlgFormID = MedsInDlgFormId  then IsInptDlg := TRUE;
  IsIMOLocation := IsValidIMOLoc(Encounter.Location,Patient.DFN);
  if (IsInptDlg) and (not Patient.Inpatient) and IsIMOLocation and (Encounter.DateTime > Td) then
    result := True;
end;

procedure TfrmODMeds.lstChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  inherited;
  btnSelect.Enabled := (lstAll.ItemIndex > -1) or
                       ((lstQuick.ItemIndex > -1) and
                       (Assigned(lstQuick.Items[lstQuick.ItemIndex].Data)) and
                       (Integer(lstQuick.Selected.Data) > 0)) ;
  if (btnSelect.Enabled) and (FRemoveText) then
    txtMed.Text := '';
end;


procedure TfrmODMeds.DispOrderMessage(const AMessage: string);
begin
  if ContainsVisibleChar(AMessage) then
  begin
    image1.Visible := True;
    memDrugMsg.Visible := True;
    image1.Picture.Icon.Handle := LoadIcon(0, IDI_ASTERISK);
    memDrugMsg.Lines.Clear;
    memDrugMsg.Lines.SetText(PChar(AMessage));
    if fShrinkDrugMsg then
    begin
      pnlBottom.Height := pnlBottom.Height + memDrugMsg.Height + 2;
      fShrinkDrugMsg := False;
    end;
  end else
  begin
    image1.Visible := False;
    memDrugMsg.Visible := False;
    if not fShrinkDrugMsg then
    begin
      pnlBottom.Height := pnlBottom.Height - memDrugMsg.Height - 2;
      fShrinkDrugMsg := True;
    end;
  end;
end;


procedure TfrmODMeds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FResizedAlready := False;
  inherited;
end;

function TfrmODMeds.CreateOtherScheduelComplex: string;
var
  aSchedule: string;
begin
  aSchedule := '';
  if not ShowOtherSchedule(aSchedule) then
  begin
    cboXSchedule.ItemIndex := -1;
    cboXSchedule.Text      := '';
  end;
  Result := aSchedule;
end;

procedure TfrmODMeds.txtNSSClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('You can also select ' + '"' + 'Other' + '"' + ' from the schedule list'
    + ' to create a day-of-week schedule.'
    + #13#10 + 'Click OK to launch schedule builder',
    mtInformation, [mbOK, mbCancel],0) = mrOK then
  begin
    if (tabDose.TabIndex = TI_DOSE) then
    begin
      cboSchedule.SelectByID('OTHER');
      cboScheduleClick(Self);
    end;
    if  (tabDose.TabIndex = TI_COMPLEX) then
    begin
      cboXSchedule.SelectByID('OTHER');
      CBOXScheduleChange(Self);
    end;
  end;
end;

procedure TfrmODMeds.cboScheduleEnter(Sender: TObject);
begin
  inherited;
  if (FInptDlg) and (cboSchedule.Text = 'OTHER') then
    cboScheduleClick(Self);
end;

procedure TfrmODMeds.FormShow(Sender: TObject);
begin
  inherited;
  if ( (cboSchedule.Text = 'OTHER') and FNSSOther and FInptDlg )then
    PostMessage(Handle, UM_NSSOTHER, 0, 0);
end;

procedure TfrmODMeds.UMShowNSSBuilder(var Message: TMessage);
begin
  Sleep(1000);
  cboScheduleClick(Self);
end;

procedure TfrmODMeds.cboScheduleExit(Sender: TObject);
begin
  inherited;
  if Trim(cboSchedule.Text) = '' then
    cboSchedule.ItemIndex := -1;
  ValidateInpatientSchedule(cboSchedule);
end;

procedure TfrmODMeds.ValidateInpatientSchedule(ScheduleCombo: TORComboBox);
var
  tmpIndex : Integer;
begin

{CQ: 6690 - Orders - autopopulation of schedule field - overtyping only 1 character
 CQ: 7280 - PTM 32-34, 42 Meds: NJH-0205-20901 MED DIALOG DROPPING FIRST LETTER (schedule)}

 //CQ 7575  Schedule coming across lower-case, change all schedules to Upper-Case.
  if (Length(ScheduleCombo.Text) > 0) then
    ScheduleCombo.Text := TrimLeft(UpperCase(ScheduleCombo.Text));
    {if user entered schedule verify it is in list}
  if ScheduleCombo.ItemIndex < 0 then // CQ: 7397
  begin //Fix for CQ: 9299 - Outpatient Med orders will not accept free text schedule
    tmpIndex := GetSchedListIndex(ScheduleCombo,ScheduleCombo.Text);
    if tmpIndex > -1 then
      ScheduleCombo.ItemIndex := tmpIndex;
  end;
  if (Length(ScheduleCombo.Text) > 0) and (ScheduleCombo.ItemIndex < 0) and FInptDlg then
  begin
    FShowPnlXScheduleOk := False; //Added for CQ: 7370
    Application.MessageBox('Please select a valid schedule from the list.'+#13+#13+
                           'If you would like to create a Day-of-Week schedule please'+
                           ' select ''OTHER'' from the list.',
                           'Incorrect Schedule.');
    FShowPnlXScheduleOk := True;  //Added for CQ: 7370
    if ScheduleCombo.CanFocus then
      ScheduleCombo.SetFocus;
    ScheduleCombo.SelStart := Length(ScheduleCombo.Text);
  end;
end;

//Removed based on Site feeback. See CQ: 7518
(*function TfrmODMeds.ValidateRoute(RouteCombo: TORComboBox) : Boolean;
begin
{CQ: 7331 - Medications - Route - Can not enter any route not listed in Route field in window}
  Result := True;
  if (Length(RouteCombo.Text) > 0) and (RouteCombo.ItemIndex < 0) and (Not IsSupplyAndOutPatient) then
  begin
    Application.MessageBox('Please select a correct route from the list.',
                           'Incorrect Route.');
    if RouteCombo.CanFocus then
      RouteCombo.SetFocus;
    RouteCombo.SelStart := Length(RouteCombo.Text);
    Result := False;
  end;
end;*)

function TfrmODMeds.isUniqueQuickOrder(iText: string): Boolean;
var
  counter,i: Integer;
begin
  counter := 0;
  Result := False;
  if iText = '' then Exit;
  for i := 0 to FQuickItems.Count-1 do
    if AnsiCompareText(iText, Copy(Piece(FQuickItems[i],'^',2), 1, Length(iText))) = 0 then
      Inc(counter);               //Found a Match
  Result := counter = 1;
end;

function TfrmODMeds.IsSupplyAndOutPatient: boolean;
begin
{CQ: 7331 - Medications - Route - Can not enter any route not listed in Route field in window}
  Result := False;
  if (MedIsSupply(txtMed.Tag)) and (not FInptDlg) then
    Result := True;
end;

// CQ: 7397 - Inpatient med orders with PRN cancel due to invalid schedule.
function TfrmODMeds.GetSchedListIndex(SchedCombo: TORComboBox; pSchedule: String):integer;
var i: integer;
begin
    result := -1;
    for i := 0 to SchedCombo.items.Count-1 do
    begin
         if pSchedule = SchedCombo.DisplayText[i] then
         begin
           result := i;   // match found
           break;
         end;
    end;
end;


procedure TfrmODMeds.cboXScheduleExit(Sender: TObject);
begin
  inherited;
{CQ: 7344 - Inconsistency with Schedule box: Allows free-text entry for Complex orders,
            doesn't for simple orders }
  ValidateInpatientSchedule(cboXSchedule);
end;

procedure TfrmODMeds.cboDosageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //Fix for CQ: 7545
  if cboDosage.ItemIndex > -1 then
    cboDosageClick(Sender);
end;

procedure TfrmODMeds.cboXDosageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //Fix for CQ: 7545
  if cboXDosage.ItemIndex > -1 then
    cboXDosageClick(Sender);
end;

procedure TfrmODMeds.txtSupplyClick(Sender: TObject);
begin
  inherited;
  Self.txtSupply.SelectAll;
end;

procedure TfrmODMeds.txtQuantityClick(Sender: TObject);
begin
  inherited;
   self.txtQuantity.SelectAll;
end;

procedure TfrmODMeds.txtRefillsClick(Sender: TObject);
begin
  inherited;
  self.txtRefills.SelectAll;
end;

procedure TfrmODMeds.WMClose(var Msg: TWMClose);
begin
   if self <> nil then
     begin
       if (self.tabDose.TabIndex = TI_Dose) then
         begin
            if Trim(cboSchedule.Text) = '' then cboSchedule.ItemIndex := -1;
            ValidateInpatientSchedule(cboSchedule);
            if self.cboSchedule.Focused = true then exit;
         end;
       if (self.tabDose.TabIndex = TI_Complex) then
         begin
           ValidateInpatientSchedule(cboXSchedule);
           if self.cboXSchedule.Focused = true then exit;
         end;
     end;
    inherited
end;

procedure TfrmODMeds.cboXScheduleEnter(Sender: TObject);
begin
  inherited;
  //agp Change CQ 10719 
   self.chkXPRN.OnClick(self.chkXPRN);
end;

end.
