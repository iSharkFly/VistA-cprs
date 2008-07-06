unit fODMedIV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fODBase, Grids, StdCtrls, ORCtrls, ComCtrls, ExtCtrls, Buttons, Menus, IdGlobal;

type
  TfrmODMedIV = class(TfrmODBase)
    lblInfusionRate: TLabel;
    txtRate: TCaptionEdit;
    lblComponent: TLabel;
    lblAmount: TLabel;
    grdSelected: TCaptionStringGrid;
    cmdRemove: TButton;
    lblComments: TLabel;
    memComments: TCaptionMemo;
    txtSelected: TCaptionEdit;
    cboSelected: TCaptionComboBox;
    popDuration: TPopupMenu;
    popML: TMenuItem;
    popDays: TMenuItem;
    popHours: TMenuItem;
    popL: TMenuItem;
    pnlXDuration: TPanel;
    txtXDuration: TCaptionEdit;
    lblLimit: TLabel;
    btnXDuration: TBitBtn;
    pnlCombo: TPanel;
    cboAdditive: TORComboBox;
    tabFluid: TTabControl;
    cboSolution: TORComboBox;
    lblPriority: TLabel;
    cboPriority: TORComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tabFluidChange(Sender: TObject);
    procedure cboAdditiveNeedData(Sender: TObject; const StartFrom: string; Direction,
      InsertAt: Integer);
    procedure cboSolutionNeedData(Sender: TObject; const StartFrom: string; Direction,
      InsertAt: Integer);
    procedure cboAdditiveMouseClick(Sender: TObject);
    procedure cboAdditiveExit(Sender: TObject);
    procedure cboSolutionMouseClick(Sender: TObject);
    procedure cboSolutionExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdRemoveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure txtSelectedExit(Sender: TObject);
    procedure cboSelectedExit(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure txtSelectedChange(Sender: TObject);
    procedure cboSelectedChange(Sender: TObject);
    procedure grdSelectedDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdSelectedKeyPress(Sender: TObject; var Key: Char);
    procedure grdSelectedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnXDurationClick(Sender: TObject);
    procedure popDurationClick(Sender: TObject);
    procedure txtXDurationChange(Sender: TObject);
    procedure pnlXDurationEnter(Sender: TObject);
    procedure txtXDurationExit(Sender: TObject);
    procedure txtRateExit(Sender: TObject);
  private
    FInpatient: Boolean;
    procedure SetValuesFromResponses;
    procedure DoSetFontSize( FontSize: integer);
    procedure ClickOnGridCell;
    procedure SetLimitationControl(aValue: string);
  public
    procedure InitDialog; override;
    procedure SetupDialog(OrderAction: Integer; const ID: string); override;
    procedure Validate(var AnErrMsg: string); override;
    procedure SetFontSize( FontSize: integer); override;
  end;

var
  frmODMedIV: TfrmODMedIV;

implementation

{$R *.DFM}

uses ORFn, uConst, rODMeds, rODBase, uAccessibleStringGrid, fFrame;

const
  TX_NO_DEA     = 'Provider must have a DEA# or VA# to order this medication';
  TC_NO_DEA     = 'DEA# Required';

type
  TIVComponent = class
  private
    IEN: Integer;
    Name: string;
    Fluid: Char;
    Amount: Integer;
    Units: string;
    Volumes: string;
  end;

const
  TC_RESTRICT  = 'Ordering Restrictions';
  TX_NO_BASE   = 'A solution must be selected.';
  TX_NO_AMOUNT = 'A valid strength or volume must be entered for ';
  TX_NO_UNITS  = 'Units must be entered for ';
  TX_NO_RATE   = 'An infusion rate must be entered.';
  TX_BAD_RATE  = 'The infusion rate must be:  # ml/hr  or  text@labels per day';

(*
  { TIVComponent methods }

procedure TIVComponent.Clear;
begin
  IEN     := 0;
  Name    := '';
  Fluid   := #0;
  Amount  := 0;
  Units   := '';
  Volumes := '';
end;
*)

{ Form methods }

procedure TfrmODMedIV.FormCreate(Sender: TObject);
var
  Restriction: string;
begin
  frmFrame.pnlVisit.Enabled := false;
  inherited;
  AllowQuickOrder := True;
  CheckAuthForMeds(Restriction);
  if Length(Restriction) > 0 then
  begin
    InfoBox(Restriction, TC_RESTRICT, MB_OK);
    Close;
    Exit;
  end;
  DoSetFontSize(MainFontSize);
  FillerID := 'PSIV';                            // does 'on Display' order check **KCM**
  StatusText('Loading Dialog Definition');
  Responses.Dialog := 'PSJI OR PAT FLUID OE';    // loads formatting info
  StatusText('Loading Default Values');
  CtrlInits.LoadDefaults(ODForIVFluids);         // ODForIVFluids returns TStrings with defaults
  InitDialog;
  TAccessibleStringGrid.WrapControl(grdSelected);
end;

procedure TfrmODMedIV.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  TAccessibleStringGrid.UnwrapControl(grdSelected);
  with grdSelected do for i := 0 to RowCount - 1 do TIVComponent(Objects[0, i]).Free;
  inherited;
  frmFrame.pnlVisit.Enabled := True;
end;

procedure TfrmODMedIV.FormResize(Sender: TObject);
begin
  inherited;
  with grdSelected do
  begin
    ColWidths[1] := Canvas.TextWidth(' 10000 ') + GetSystemMetrics(SM_CXVSCROLL);
    ColWidths[2] := Canvas.TextWidth('meq.') + GetSystemMetrics(SM_CXVSCROLL);
    ColWidths[0] := ClientWidth - ColWidths[1] - ColWidths[2] - 4;
  end;
  lblAmount.Left := grdSelected.Left + grdSelected.ColWidths[0];
end;

{ TfrmODBase overrides }

procedure TfrmODMedIV.InitDialog;
const
  NOSELECTION: TGridRect = (Left: -1; Top: -1; Right: -1; Bottom: -1);
var
  i: Integer;
begin
  inherited;
  //grdSelected.Selection := NOSELECTION;
  with grdSelected do for i := 0 to RowCount - 1 do
  begin
     TIVComponent(Objects[0, i]).Free;
     Rows[i].Clear;
  end;
  grdSelected.RowCount := 1;
  //txtRate.Text := ' ml/hr';   {*kcm*}
  with CtrlInits do
  begin
    SetControl(cboSolution, 'ShortList');
    cboSolution.InsertSeparator;
    SetControl(cboPriority, 'Priorities');
  end;
  tabFluid.TabIndex := 0;
  tabFluidChange(Self);            // this makes cboSolution visible
  cboSolution.InitLongList('');
  cboAdditive.InitLongList('');
  ActiveControl := cboSolution;  //SetFocusedControl(cboSolution);
  StatusText('');
end;

procedure TfrmODMedIV.Validate(var AnErrMsg: string);
var
  ItemOK: Boolean;
  x: string;
  i: Integer;

  procedure SetError(const x: string);
  begin
    if Length(AnErrMsg) > 0 then AnErrMsg := AnErrMsg + CRLF;
    AnErrMsg := AnErrMsg + x;
  end;

begin
  inherited;
  with grdSelected do
  begin
    ItemOK := False;
    for i := 0 to RowCount - 1 do
      if TIVComponent(Objects[0, i]).Fluid = 'B' then ItemOK := True;
    if not ItemOK then SetError(TX_NO_BASE);
    for i := 0 to RowCount - 1 do
    begin
      if (Objects[0, i] <> nil) and ((Length(Cells[1, i]) = 0) or (StrToFloat(Cells[1,i])=0))
        then SetError(TX_NO_AMOUNT + Cells[0, i]);
      if (Objects[0, i] <> nil) and (Length(Cells[2, i]) = 0)
        then SetError(TX_NO_UNITS + Cells[0, i]);
    end;
  end;
  if Length(txtRate.Text) = 0 then SetError(TX_NO_RATE) else
  begin
    x := Trim(txtRate.Text);
    ValidateIVRate(x);
    if Length(x) = 0 then SetError(TX_BAD_RATE) else Responses.Update('RATE', 1, x, x);
  end;
end;

procedure TfrmODMedIV.SetValuesFromResponses;
var
  x: string;
  AnInstance: Integer;
  AResponse: TResponse;
  AnIVComponent: TIVComponent;
begin
  Changing := True;
  with Responses do
  begin
    FInpatient := OrderForInpatient;
    AnInstance := NextInstance('ORDERABLE', 0);
    while AnInstance > 0 do
    begin
      AResponse := FindResponseByName('ORDERABLE', AnInstance);
      if AResponse <> nil then
      begin
        x := AmountsForIVFluid(StrToIntDef(AResponse.IValue, 0), 'B');
        AnIVComponent := TIVComponent.Create;
        AnIVComponent.IEN     := StrToIntDef(AResponse.IValue, 0);
        if not FInpatient then
        begin
          if DEACheckFailedForIVOnOutPatient(AnIVComponent.IEN,'S') then
          begin
            InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
            cboAdditive.Text := '';
            Exit;
          end;
        end else
        begin
          if DEACheckFailed(AnIVComponent.IEN, FInpatient) then
          begin
            InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
            cboAdditive.Text := '';
            Exit;
          end;
        end;
        AnIVComponent.Name    := AResponse.EValue;
        AnIVComponent.Fluid   := 'B';
        AnIVComponent.Amount  := StrToIntDef(Piece(x, U, 2), 0);
        AnIVComponent.Units   := Piece(x, U, 1);
        AnIVComponent.Volumes := Copy(x, Pos(U, x) + 1, Length(x));
        with grdSelected do
        begin
          if Objects[0, RowCount - 1] <> nil then RowCount := RowCount + 1;
          Objects[0, RowCount - 1] := AnIVComponent;
          Cells[0, RowCount - 1] := AnIVComponent.Name;
          if AnIVComponent.Amount <> 0 then
            Cells[1, RowCount - 1] := IntToStr(AnIVComponent.Amount);
          Cells[2, RowCount - 1] := AnIVComponent.Units;
        end;
      end;
      AResponse := FindResponseByName('VOLUME', AnInstance);
      if AResponse <> nil then with grdSelected do Cells[1, RowCount - 1] := AResponse.EValue;
      AnInstance := NextInstance('ORDERABLE', AnInstance);
    end; {while AnInstance - ORDERABLE}
    AnInstance := NextInstance('ADDITIVE', 0);
    while AnInstance > 0 do
    begin
      AResponse := FindResponseByName('ADDITIVE', AnInstance);
      if AResponse <> nil then
      begin
        x := AmountsForIVFluid(StrToIntDef(AResponse.IValue, 0), 'A');
        AnIVComponent := TIVComponent.Create;
        AnIVComponent.IEN     := StrToIntDef(AResponse.IValue, 0);
        if not FInpatient then
        begin
          if DEACheckFailedForIVOnOutPatient(AnIVComponent.IEN,'A') then
          begin
            InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
            cboAdditive.Text := '';
            Exit;
          end;
        end else
        begin
          if DEACheckFailed(AnIVComponent.IEN, FInpatient) then
          begin
            InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
            cboAdditive.Text := '';
            Exit;
          end;
        end;
        AnIVComponent.Name    := AResponse.EValue;
        AnIVComponent.Fluid   := 'A';
        AnIVComponent.Amount  := StrToIntDef(Piece(x, U, 2), 0);
        AnIVComponent.Units   := Piece(x, U, 1);
        AnIVComponent.Volumes := Copy(x, Pos(U, x) + 1, Length(x));
        with grdSelected do
        begin
          if Objects[0, RowCount - 1] <> nil then RowCount := RowCount + 1;
          Objects[0, RowCount - 1] := AnIVComponent;
          Cells[0, RowCount - 1] := AnIVComponent.Name;
          if AnIVComponent.Amount <> 0 then
            Cells[1, RowCount - 1] := IntToStr(AnIVComponent.Amount);
          Cells[2, RowCount - 1] := AnIVComponent.Units;
        end;
      end;
      AResponse := FindResponseByName('STRENGTH', AnInstance);
      if AResponse <> nil then with grdSelected do Cells[1, RowCount - 1] := AResponse.EValue;
      AResponse := FindResponseByName('UNITS', AnInstance);
      if AResponse <> nil then with grdSelected do Cells[2, RowCount - 1] := AResponse.EValue;
      AnInstance := NextInstance('ADDITIVE', AnInstance);
    end; {while AnInstance - ADDITIVE}
    SetControl(txtRate,     'RATE',    1);
    if LowerCase(Copy(ReverseStr(txtRate.Text), 1, 6)) = 'rh/lm '             {*kcm*}
      then txtRate.Text := Copy(txtRate.Text, 1, Length(txtRate.Text) - 6);
    SetControl(cboPriority, 'URGENCY', 1);
    SetControl(memComments, 'COMMENT', 1);

    AnInstance := NextInstance('DAYS', 0);
    if AnInstance > 0 then
    begin
      AResponse := FindResponseByName('DAYS', AnInstance);
      if AResponse <> nil then
          SetLimitationControl(AResponse.EValue);
    end;
  end; {if...with Responses}
  Changing := False;
  ControlChange(Self);
end;

procedure TfrmODMedIV.SetupDialog(OrderAction: Integer; const ID: string);
begin
  inherited;
  if OrderAction in [ORDER_COPY, ORDER_EDIT, ORDER_QUICK] then SetValuesFromResponses;
end;

{ tabFluid events }

procedure TfrmODMedIV.tabFluidChange(Sender: TObject);
begin
  inherited;
  case TabFluid.TabIndex of
  0: begin
       cboSolution.Visible := True;
       cboAdditive.Visible := False;
     end;
  1: begin
       cboAdditive.Visible := True;
       cboSolution.Visible := False;
     end;
  end;
  if cboSolution.Visible then
    ActiveControl := cboSolution;
  if cboAdditive.Visible then
    ActiveControl := cboAdditive;
end;

{ cboSolution events }

procedure TfrmODMedIV.cboSolutionNeedData(Sender: TObject; const StartFrom: string;
  Direction, InsertAt: Integer);
var
  CurString: string;
begin
  inherited;
  if (Direction = 1) then
    CurString := AnsiUpperCase(StartFrom) + '          ';
  cboSolution.ForDataUse(SubSetOfOrderItems(CurString, Direction, 'S.IVB RX'));
end;

procedure TfrmODMedIV.cboSolutionMouseClick(Sender: TObject);
var
  AnIVComponent: TIVComponent;
  x: string;
begin
  inherited;
  if CharAt(cboSolution.ItemID, 1) = 'Q' then              // setup quick order
  begin
    Responses.QuickOrder := ExtractInteger(cboSolution.ItemID);
    SetValuesFromResponses;
    cboSolution.ItemIndex := -1;
    Exit;
  end;
  if cboSolution.ItemIEN <= 0 then Exit;                   // process selection of solution
  FInpatient := OrderForInpatient;
  if not FInpatient then
  begin
    if DEACheckFailedForIVOnOutPatient(cboSolution.ItemIEN,'S') then
    begin
      InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
      cboSolution.Text := '';
      Exit;
    end;
  end else
  begin
    if DEACheckFailed(cboSolution.ItemIEN, FInpatient) then
    begin
       InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
       cboSolution.Text := '';
       Exit;
    end;
  end;

  x := AmountsForIVFluid(cboSolution.ItemIEN, 'B');
  AnIVComponent := TIVComponent.Create;
  AnIVComponent.IEN     := cboSolution.ItemIEN;
  AnIVComponent.Name    := Piece(cboSolution.Items[cboSolution.ItemIndex], U, 3);
  AnIVComponent.Fluid   := 'B';
  AnIVComponent.Amount  := StrToIntDef(Piece(x, U, 2), 0);
  AnIVComponent.Units   := Piece(x, U, 1);
  AnIVComponent.Volumes := Copy(x, Pos(U, x) + 1, Length(x));
  cboSolution.ItemIndex := -1;
  with grdSelected do
  begin
    if Objects[0, RowCount - 1] <> nil then RowCount := RowCount + 1;
    Objects[0, RowCount - 1] := AnIVComponent;
    Cells[0, RowCount - 1] := AnIVComponent.Name;
    Cells[1, RowCount - 1] := IntToStr(AnIVComponent.Amount);
    Cells[2, RowCount - 1] := AnIVComponent.Units;
    Row := RowCount - 1;
    if Length(Piece(AnIVComponent.Volumes, U, 2)) > 0 then Col := 1 else Col := 0;
    if RowCount = 1 then        // switch to additives after 1st IV
    begin
       tabFluid.TabIndex := 1;
       tabFluidChange(Self);
    end;
  end;
  Application.ProcessMessages;         //CQ: 10157
  ClickOnGridCell;
  ControlChange(Sender);
end;

procedure TfrmODMedIV.cboSolutionExit(Sender: TObject);
begin
  inherited;
  if cboSolution.ItemIEN > 0 then cboSolutionMouseClick(Self);
end;

{ cboAdditive events }

procedure TfrmODMedIV.cboAdditiveNeedData(Sender: TObject; const StartFrom: string;
  Direction, InsertAt: Integer);
var
  CurString: string;
begin
  inherited;
  if (Direction = 1) then
    CurString := AnsiUpperCase(StartFrom) + '          ';
  cboAdditive.ForDataUse(SubSetOfOrderItems(CurString, Direction, 'S.IVA RX'));
end;

procedure TfrmODMedIV.cboAdditiveMouseClick(Sender: TObject);
var
  AnIVComponent: TIVComponent;
  x: string;
begin
  inherited;
  if cboAdditive.ItemIEN <= 0 then Exit;
  FInpatient := OrderForInpatient;
  if not FInpatient then
  begin
    if DEACheckFailedForIVOnOutPatient(cboAdditive.ItemIEN,'A') then
    begin
      InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
      cboAdditive.Text := '';
      Exit;
    end;
  end else
  begin
    if DEACheckFailed(cboAdditive.ItemIEN, FInpatient) then
    begin
       InfoBox(TX_NO_DEA, TC_NO_DEA, MB_OK);
       cboAdditive.Text := '';
       Exit;
    end;
  end;
  x := AmountsForIVFluid(cboAdditive.ItemIEN, 'A');
  AnIVComponent := TIVComponent.Create;
  AnIVComponent.IEN     := cboAdditive.ItemIEN;
  AnIVComponent.Name    := Piece(cboAdditive.Items[cboAdditive.ItemIndex], U, 3);
  AnIVComponent.Fluid   := 'A';
  AnIVComponent.Amount  := 0;
  AnIVComponent.Units   := Piece(x, U, 1);
  AnIVComponent.Volumes := '';
  cboAdditive.ItemIndex := -1;
  with grdSelected do
  begin
    if Objects[0, RowCount - 1] <> nil then RowCount := RowCount + 1;
    Objects[0, RowCount - 1] := AnIVComponent;
    Cells[0, RowCount - 1] := AnIVComponent.Name;
    Cells[2, RowCount - 1] := AnIVComponent.Units;
    Row := RowCount - 1;
    Col := 1;
  end;
  Application.ProcessMessages;         //CQ: 10157
  ClickOnGridCell;
  ControlChange(Sender);
end;

procedure TfrmODMedIV.cboAdditiveExit(Sender: TObject);
begin
  inherited;
  if cboAdditive.ItemIEN > 0 then cboAdditiveMouseClick(Self);
end;

{ grdSelected events }

procedure TfrmODMedIV.ClickOnGridCell;
var
  AnIVComponent: TIVComponent;

  procedure PlaceControl(AControl: TWinControl);
  var
    ARect: TRect;
  begin
    with AControl do
    begin
      ARect := grdSelected.CellRect(grdSelected.Col, grdSelected.Row);
      SetBounds(ARect.Left + grdSelected.Left + 1,  ARect.Top  + grdSelected.Top + 1,
                ARect.Right - ARect.Left + 1,       ARect.Bottom - ARect.Top + 1);
      BringToFront;
      Show;
      SetFocus;
      if AControl is TComboBox then                    //CQ: 10157
        TComboBox(AControl).DroppedDown := True;
    end;
  end;

begin
  AnIVComponent := TIVComponent(grdSelected.Objects[0, grdSelected.Row]);
  if (AnIVComponent = nil) or (grdSelected.Col = 0) then Exit;
  // allow selection if more the 1 unit to choose from
  if (grdSelected.Col = 2) and (Length(Piece(AnIVComponent.Units, U, 2)) > 0) then
  begin
    PiecesToList(AnIVComponent.Units, U, cboSelected.Items);
    cboSelected.ItemIndex := cboSelected.Items.IndexOf(grdSelected.Cells[grdSelected.Col, grdSelected.Row]);
    cboSelected.Tag  := (grdSelected.Col * 256) + grdSelected.Row;
    PlaceControl(cboSelected);
  end;
  // allow selection if more than 1 volume to choose from
  if (grdSelected.Col = 1) and (Length(Piece(AnIVComponent.Volumes, U, 2)) > 0) then
  begin
    PiecesToList(AnIVComponent.Volumes, U, cboSelected.Items);
    cboSelected.ItemIndex := cboSelected.Items.IndexOf(grdSelected.Cells[grdSelected.Col, grdSelected.Row]);
    cboSelected.Tag  := (grdSelected.Col * 256) + grdSelected.Row;
    PlaceControl(cboSelected);
  end;
  // display text box to enter strength if the entry is an additive
  if (grdSelected.Col = 1) and (AnIVComponent.Fluid = 'A') then
  begin
    txtSelected.Text := grdSelected.Cells[grdSelected.Col, grdSelected.Row];
    txtSelected.Tag  := (grdSelected.Col * 256) + grdSelected.Row;
    PlaceControl(txtSelected);
  end;
end;

procedure TfrmODMedIV.txtSelectedChange(Sender: TObject);   // text editor for grid
begin
  inherited;
  with txtSelected do
  begin
    if Tag < 0 then Exit;
    grdSelected.Cells[Tag div 256, Tag mod 256] := Text;
  end;
  ControlChange(Sender);
end;

procedure TfrmODMedIV.txtSelectedExit(Sender: TObject);
begin
  inherited;
  with txtSelected do
  begin
    grdSelected.Cells[Tag div 256, Tag mod 256] := Text;
    Tag := -1;
    Hide;
  end;
end;

procedure TfrmODMedIV.cboSelectedChange(Sender: TObject);   // combo editor for grid
begin
  inherited;
  with cboSelected do
  begin
    if Tag < 0 then Exit;
    grdSelected.Cells[Tag div 256, Tag mod 256] := Text;
  end;
  ControlChange(Sender);
end;

procedure TfrmODMedIV.cboSelectedExit(Sender: TObject);
begin
  inherited;
  with cboSelected do
  begin
    grdSelected.Cells[Tag div 256, Tag mod 256] := Text;
    Tag := -1;
    Hide;
  end;
end;

procedure TfrmODMedIV.cmdRemoveClick(Sender: TObject);  // remove button for grid
var
  i: Integer;
begin
  inherited;
  with grdSelected do
  begin
    if Row < 0 then Exit;
    if Objects[0, Row] <> nil then TIVComponent(Objects[0, Row]).Free;
    for i := Row to RowCount - 2 do Rows[i] := Rows[i + 1];
    Rows[RowCount - 1].Clear;
    RowCount := RowCount - 1;
  end;
  ControlChange(Sender);
end;

{ update Responses & Create Order Text }

procedure TfrmODMedIV.ControlChange(Sender: TObject);
var
  i, CurAdd, CurBase: Integer;
  x,xlimIn,xLimEx,eSch,iSch: string;
  AnIVComponent: TIVComponent;
  FQOSchedule: TResponse;

  function IsNumericRate(const x: string): Boolean;
  var
    i: Integer;
  begin
    Result := True;
    for i := 1 to Length(x) do if not (x[i] in ['0'..'9','.']) then Result := False;
  end;

begin
  inherited;
  if Changing then Exit;
//  FQOSchedule := TResponse.Create;
  FQOSchedule := Responses.FindResponseByName('SCHEDULE',1);
  if FQOSchedule <> nil then
  begin
    eSch := FQOSchedule.EValue;
    iSch := FQOSchedule.IValue;
  end;
  //if Sender <> Self then Responses.Clear;       // Sender=Self when called from SetupDialog
  Responses.Clear;   // want this to clear even after SetupDialog in case instances don't match
  CurAdd := 1; CurBase := 1;
  with grdSelected do for i := 0 to RowCount - 1 do
  begin
    AnIVComponent := TIVComponent(Objects[0, i]);
    if AnIVComponent = nil then Continue;
    with AnIVComponent do
    begin
      if Fluid = 'B' then                        // Solutions
      begin
        if IEN > 0                then Responses.Update('ORDERABLE', CurBase, IntToStr(IEN), Name);
        if Length(Cells[1,i]) > 0 then Responses.Update('VOLUME',    CurBase, Cells[1,i], Cells[1,i]);
        Inc(CurBase);
      end; {if Fluid B}
      if Fluid = 'A' then                        // Additives
      begin
        if IEN > 0                then Responses.Update('ADDITIVE', CurAdd, IntToStr(IEN), Name);
        if Length(Cells[1,i]) > 0 then Responses.Update('STRENGTH', CurAdd, Cells[1,i], Cells[1,i]);
        if Length(Cells[2,i]) > 0 then Responses.Update('UNITS',    CurAdd, Cells[2,i], Cells[2,i]);
        Inc(CurAdd);
      end; {if Fluid A}
    end; {with AnIVComponent}
  end; {with grdSelected}
  x := txtRate.Text;
  xlimIn := '';
  xlimEx := '';
  if length(txtXDuration.Text) > 0 then
  begin
    if (btnXDuration.Caption = 'L') or (btnXDuration.Caption = 'ml') then
    begin
      xlimEx := 'with total volume ' +  txtXDuration.Text + btnXDuration.Caption;
      xlimIn := 'with total volume ' +  txtXDuration.Text + btnXDuration.Caption;
    end
    else if (btnXDuration.Caption = 'days') or (btnXDuration.Caption = 'hours') then
    begin
      xlimEx := 'for ' + txtXDuration.Text + ' ' +  btnXDuration.Caption;
      xlimIn := 'for ' + txtXDuration.Text + ' ' +  btnXDuration.Caption;
    end  else
    begin
      xlimIn := '';
      xlimEx := '';
    end;
  end;
  //if x = IntToStr(StrToIntDef(x, -1)) then x := x + ' ml/hr';
  if IsNumericRate(x) then x := x + ' ml/hr';
  if (Pos('@',x)>0) and (Piece(x,'@',1) = IntToStr(StrToIntDef(Piece(x,'@',1), -1)))
    then x := Piece(x,'@',1) + ' ml/hr@' + Copy(x, Pos('@',x) + 1, Length(x));
  with txtRate     do if (Length(Text) > 0) then Responses.Update('RATE', 1, x, x);
  with cboPriority do if ItemIndex > -1     then Responses.Update('URGENCY', 1, ItemID, Text);
  if Length(xlimIn)>0 then Responses.Update('DAYS',1, xlimIn, xlimEx);
  with memComments do if GetTextLen > 0     then Responses.Update('COMMENT', 1, TX_WPTYPE, Text);
  memOrder.Text := Responses.OrderText;
  if (Length(eSch)>0) or (Length(iSch)>0) then
    Responses.Update('SCHEDULE',1,iSch,eSch);
end;

procedure TfrmODMedIV.grdSelectedDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  inherited;
  if Sender = ActiveControl then Exit;
  if not (gdSelected in State) then Exit;
  with Sender as TStringGrid do
  begin
    Canvas.Brush.Color := Color;
    Canvas.Font := Font;
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[ACol, ARow]);
  end;
end;

procedure TfrmODMedIV.SetFontSize( FontSize: integer);
begin
  inherited SetFontSize( FontSize );
  DoSetFontSize( FontSize );
end;

procedure TfrmODMedIV.DoSetFontSize( FontSize: integer);
begin
  tabFluid.TabHeight := Abs(Font.Height) + 4;
  grdSelected.DefaultRowHeight := Abs(Font.Height) + 8;
end;

procedure TfrmODMedIV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) and (ssCtrl in Shift) then
  begin
    //Back-tab works the same as forward-tab because there are only two tabs.
    tabFluid.TabIndex := (tabFluid.TabIndex + 1) mod tabFluid.Tabs.Count;
    Key := 0;
    tabFluidChange(tabFluid);
  end;
end;

procedure TfrmODMedIV.grdSelectedKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ClickOnGridCell;
end;

procedure TfrmODMedIV.grdSelectedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ClickOnGridCell;
end;

procedure TfrmODMedIV.btnXDurationClick(Sender: TObject);
var
  APoint: TPoint;
begin
  inherited;
  txtXDuration.SetFocus;
  with TSpeedButton(Sender) do APoint := ClientToScreen(Point(0, Height));
  popDuration.Popup(APoint.X, APoint.Y);
end;

procedure TfrmODMedIV.popDurationClick(Sender: TObject);
var
  x: string;
begin
  inherited;
  with TMenuItem(Sender) do
  begin
    x := Caption;
    {if Length(Trim(txtXDuration.Text)) > 0 then
      if AnsiCompareStr(btnXduration.Caption,x) <> 0 then
        txtXDuration.Text := '';}
  end;
  btnXDuration.Caption := x;
  txtXDurationChange(Sender);
  ControlChange(Sender);
end;

procedure TfrmODMedIV.txtXDurationChange(Sender: TObject);
begin
  inherited;
  if Changing then Exit;
  ControlChange(Sender);
end;

procedure TfrmODMedIV.pnlXDurationEnter(Sender: TObject);
begin
  inherited;
  txtXDuration.SetFocus;
end;

procedure TfrmODMedIV.SetLimitationControl(aValue: string);
var
  limitUnit,limitValue,tempval: string;
begin
  limitUnit  := '';
  limitValue := '';
  tempVal := '';
  if ( CharAt(aValue,1)= 'f') or ( CharAt(aValue,1)= 'F') then  //days, hours
  begin
     limitValue := Piece(aValue,' ',2);
     limitUnit  := Piece(aValue,' ',3);
  end;
  if (CharAt(aValue,1)= 'w') or (CharAt(aValue,1)= 'W') then  //L, ml
  begin
     tempval  := Piece(aValue,' ',4);
     limitValue := FloatToStr(ExtractFloat(tempVal));
     limitUnit  := Copy(tempVal,length(limitValue)+1,Length(tempVal));
  end;
  if isNumeric(CharAt(aValue,1)) then
  begin
    limitValue := FloatToStr(ExtractFloat(aValue));
    limitUnit  := Copy(aValue,length(limitValue)+1,Length(aValue));
    if limitUnit = 'D' then limitUnit := 'days'
    else if limitUnit = 'H' then limitUnit := 'hours'
    else if limitUnit = 'ML' then limitUnit := 'ml';
  end;
  if ( Length(limitUnit)> 0)  and ( (Length(limitValue) > 0 ) ) then
  begin
    txtXDuration.Text := limitValue;
    if Trim(UpperCase(limitUnit))='CC' then
      limitUnit := 'ml';
    btnXDuration.Caption := limitUnit;
  end;

end;

procedure TfrmODMedIV.txtXDurationExit(Sender: TObject);
var
  Len: Integer;
  Code: double;
  Digits, Warning: string;
begin
  inherited;
  if Changing then Exit;
  //AGP Change 26.15 HIN-1203-42283 Added additional check to make sure the user can only enter the correct duration
  Len := Length(txtXDuration.Text);
  if (Len > 0) and (Pos('.', txtXDuration.Text)=0) then
    begin
      Warning := '0';
      Digits := '2';
      if ((btnXDuration.Caption = 'days') or (btnXDuration.Caption = 'hours') or (btnXDuration.Caption = 'L')) and (Len > 2) then  Warning := '1';
      if (btnXDuration.Caption = 'ml') and (Len > 4) then  Warning := '1';
      if Warning = '1' then
          begin
             if btnXduration.Caption = 'ml' then Digits := '4';
             ShowMessage('Invalid Value.' + #13#10 + 'Reason: Duration for ' + btnXDuration.Caption + ' cannot be greater than ' + digits + ' digits.');
             txtXDuration.Text := '';
             txtXDuration.SetFocus;
             Exit;
          end;
      end;
  if (Pos('.', txtXDuration.Text)>0) and
     ((btnXduration.Caption = 'days') or (btnXduration.Caption = 'hours')) then
  begin
    ShowMessage('Can not save order.' + #13#10
       + 'Reason: Invalid Duration, please enter an integer value for days or hours.');
    txtXDuration.Text := '';
    txtXDuration.SetFocus;
    Exit;
  end;
  if (txtXDuration.Text <> '0') and (txtXDuration.Text <> '') then
  begin
    try
      code := StrToFloat(txtXDuration.Text);
    except
      code := 0;
    end;
    if code < 0.0001 then
    begin
      ShowMessage('Can not save order.' + #13#10 + 'Reason: Invalid Duration or Total Volume!');
      txtXDuration.Text := '';
      txtXDuration.SetFocus;
      Exit;
    end;
  end;
  try
    if (Length(txtXDuration.Text)>0) and (StrToFloat(txtXDuration.Text)<0) then
    begin
      ShowMessage('Can not save order.' + #13#10 + 'Reason: Invalid Duration or total volume!');
      txtXDuration.Text := '';
      txtXDuration.SetFocus;
      Exit;
    end;
  except
    txtXDuration.Text := '';
  end;
  ControlChange(Sender);
end;

procedure TfrmODMedIV.txtRateExit(Sender: TObject);
var
ErrorText, LDec,RDec: string;
i: Integer;
Result: boolean;
begin
  inherited;
  //AGP Change 26.28 for CQ # 7598 add infusion rate check for valid value
  ErrorText := 'The Infusion Rate must be in one of the following formats:' + CRLF + CRLF + 'nnnn.nn ml/hr or text@per labels per day';
  Result := False;
  if pos('@',Self.txtRate.Text)>0 then exit;
  if pos('.',Self.txtRate.Text)>0 then
      begin
         LDec := Piece(Self.txtRate.Text,'.',1);
         RDec := Piece(Self.txtRate.Text,'.',2);
         if Length(LDec)>4 then Result := True;
         if Length(RDec)>2 then Result := True;
      end
  else if Length(Self.txtRate.Text)>4 then Result := True;
  if (Result = False) and (pos('.',Self.txtRate.Text)=0) then
    begin
    for i := 1 to Length(Self.txtRate.Text) do if not (Self.txtRate.Text[i] in ['0'..'9']) then Result := True
    end;
  if Result = True then
    begin
       InfoBox(ErrorText,'Warning - Invalid Infusion Rate', MB_OK);
       Self.txtRate.Text := '';
       Self.txtRate.SetFocus;
    end;
end;

end.
