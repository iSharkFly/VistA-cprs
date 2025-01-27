unit fPCEBaseMain;
{Warning: The tab order has been changed in the OnExit event of several controls.
 To change the tab order of lbSection, lbxSection, and btnOther you must do it programatically.}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPCEBaseGrid, ComCtrls, StdCtrls, ORCtrls, ExtCtrls, Buttons, rPCE, uPCE,
  CheckLst, ORFn, VA508AccessibilityManager;

type
  TCopyItemsMethod = procedure(Dest: TStrings) of object;
  TListSectionsProc = procedure(Dest: TStrings);

  TfrmPCEBaseMain = class(TfrmPCEBaseGrid)
    lbSection: TORListBox;
    edtComment: TCaptionEdit;
    lblSection: TLabel;
    lblList: TLabel;
    lblComment: TLabel;
    btnRemove: TButton;
    btnOther: TButton;
    bvlMain: TBevel;
    btnSelectAll: TButton;
    lbxSection: TORListBox;
    pnlMain: TPanel;
    pnlLeft: TPanel;
    splLeft: TSplitter;
    procedure lbSectionClick(Sender: TObject);
    procedure btnOtherClick(Sender: TObject);
    procedure edtCommentExit(Sender: TObject);
    procedure edtCommentChange(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure clbListClick(Sender: TObject);
    procedure lbGridSelect(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure FormResize(Sender: TObject); virtual;
    procedure clbListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbxSectionClickCheck(Sender: TObject; Index: Integer);
    procedure splLeftMoved(Sender: TObject);
    procedure edtCommentKeyPress(Sender: TObject; var Key: Char);
    procedure lbSectionExit(Sender: TObject);
    procedure btnOtherExit(Sender: TObject);
    procedure lbxSectionExit(Sender: TObject);
    procedure lbGridExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCommentItem: integer;
    FCommentChanged: boolean;
    FUpdateCount: integer;
    FSectionPopulated: boolean;
    //FUpdatingGrid: boolean;  moved to 'protected' so frmDiagnoses can see it  (RV)
  protected
    FUpdatingGrid: boolean;
    FPCEListCodesProc: TPCEListCodesProc;
    FPCEItemClass: TPCEItemClass;
    FPCECode: string;
    FSplitterMove: boolean;
    FProblems: TStringList;
    function GetCat: string;
    procedure UpdateNewItemStr(var x: string); virtual;
//    procedure UpdateNewItem(APCEItem: TPCEItem); virtual;
    procedure GridChanged; virtual;
    procedure UpdateControls; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    function NotUpdating: boolean;
    procedure CheckOffEntries;
    procedure UpdateTabPos;
    procedure Sync2Grid;
    procedure Sync2Section;
  public
    procedure AllowTabChange(var AllowChange: boolean); override;
    procedure InitTab(ACopyProc: TCopyItemsMethod; AListProc: TListSectionsProc);
  end;

var
  frmPCEBaseMain: TfrmPCEBaseMain;

const
  LBCheckWidthSpace = 18;

implementation

uses fPCELex, fPCEOther, fEncounterFrame, fHFSearch, VA508AccessibilityRouter,
  ORCtrlsVA508Compatibility, fBase508Form, UBAConst;

{$R *.DFM}

type
  TLBSectionManager = class(TORListBox508Manager)
  public
    function GetItemInstructions(Component: TWinControl): string; override;
    function GetState(Component: TWinControl): string; override;    
  end;

procedure TfrmPCEBaseMain.lbSectionClick(Sender: TObject);
begin
  inherited;
  ClearGrid;
  FPCEListCodesProc(lbxSection.Items, lbSection.ItemIEN);
  CheckOffEntries;
  FSectionPopulated := TRUE;
  if (lbSection.Items.Count > 0) then
    lblList.Caption := StringReplace(lbSection.DisplayText[lbSection.ItemIndex],
      '&', '&&', [rfReplaceAll] );
  if (lbSection.DisplayText[lbSection.ItemIndex] = DX_PROBLEM_LIST_TXT) then
    FastAssign(lbxSection.Items, FProblems);
end;

procedure TfrmPCEBaseMain.lbSectionExit(Sender: TObject);
begin
  inherited;
  if TabIsPressed then
    if lbxSection.CanFocus then
      lbxSection.SetFocus;
end;

procedure TfrmPCEBaseMain.UpdateNewItemStr(var x: string);
begin
end;

procedure TfrmPCEBaseMain.GridChanged;
var
  i: integer;
  tmpList: TStringList;
begin
  tmpList := TStringList.Create;
  BeginUpdate;
  try
    SaveGridSelected;
    FastAssign(lbGrid.Items, tmpList);
    for i := 0 to lbGrid.Items.Count-1 do
    begin
      //lbGrid.Items[i] := TPCEItem(lbGrid.Items.Objects[i]).ItemStr;   v22.5 - RV
      tmpList[i] := TPCEItem(lbGrid.Items.Objects[i]).ItemStr;
      tmpList.Objects[i] := lbGrid.Items.Objects[i];
    end;
  //FastAssign(tmpList,lbGrid.Items); //cq: 13228  Causin a/v errors.
    lbGrid.Items.Assign(tmpList);    //cq: 13228
    RestoreGridSelected;
    SyncGridData;
  finally
    EndUpdate;
    tmpList.Free;
  end;
  UpdateControls;
end;

//procedure TfrmPCEBaseMain.UpdateNewItem(APCEItem: TPCEItem);
//begin
//end;

procedure TfrmPCEBaseMain.btnOtherClick(Sender: TObject);
var
  x, Code: string;
  APCEItem: TPCEItem;
  SrchCode: integer;
begin
  inherited;
  ClearGrid;
  SrchCode := (Sender as TButton).Tag;
  if(SrchCode <= LX_Threshold) then
    LexiconLookup(Code, SrchCode)
  else
  if(SrchCode = PCE_HF) then
    HFLookup(Code)
  else
    OtherLookup(Code, SrchCode);
  btnOther.SetFocus;
  if Code <> '' then
  begin
    x := FPCECode + U + Piece(Code, U, 1) + U + U + Piece(Code, U, 2);
    if FPCEItemClass = TPCEProc then
      SetPiece(x, U, pnumProvider, IntToStr(uProviders.PCEProvider));
    UpdateNewItemStr(x);
    APCEItem := FPCEItemClass.Create;
    APCEItem.SetFromString(x);
//    UpdateNewItem(APCEItem);
    GridIndex := lbGrid.Items.AddObject(APCEItem.ItemStr, APCEItem);
    SyncGridData;
  end;
  UpdateControls;
end;

procedure TfrmPCEBaseMain.btnOtherExit(Sender: TObject);
begin
  inherited;
  if TabIsPressed then begin
    if lbGrid.CanFocus then
      lbGrid.SetFocus
  end
  else if ShiftTabIsPressed then
    if lbxSection.CanFocus then
      lbxSection.SetFocus;
end;

procedure TfrmPCEBaseMain.edtCommentExit(Sender: TObject);
begin
  inherited;
  if(FCommentChanged) then
  begin
    FCommentChanged := FALSE;
    if(FCommentItem >= 0) then
      TPCEItem(lbGrid.Items.Objects[FCommentItem]).Comment := edtComment.text;
  end;
end;

procedure TfrmPCEBaseMain.AllowTabChange(var AllowChange: boolean);
begin
  edtCommentExit(Self);
end;

procedure TfrmPCEBaseMain.edtCommentChange(Sender: TObject);
begin
  inherited;
  FCommentItem := GridIndex;
  FCommentChanged := TRUE;
end;

procedure TfrmPCEBaseMain.btnRemoveClick(Sender: TObject);
var
  i, j: Integer;
  APCEItem: TPCEItem;
  CurCategory: string;

begin
  inherited;
  FUpdatingGrid := TRUE;
  try
    for i := lbGrid.Items.Count-1 downto 0 do if(lbGrid.Selected[i]) then
    begin
      CurCategory := GetCat;
      APCEItem := TPCEDiag(lbGrid.Items.Objects[i]);
      if APCEItem.Category = CurCategory then
      begin
        with APCEItem do for j := 0 to lbxSection.Items.Count - 1 do
          if ORFn.Pieces(lbxSection.Items[j], U, 1, 2) = Code + U + Narrative then
            lbxSection.Checked[j] := False;
      end;
      APCEItem.Free;
      lbGrid.Items.Delete(i);
    end;
    ClearGrid;
  finally
    FUpdatingGrid := FALSE;
  end;
end;

procedure TfrmPCEBaseMain.UpdateControls;
var
  CommentOK: boolean;

begin
  btnSelectAll.Enabled := (lbGrid.Items.Count > 0);
  btnRemove.Enabled := (lbGrid.SelCount > 0);
  if(NotUpdating) then
  begin
    BeginUpdate;
    try
      inherited;
      CommentOK := (lbGrid.SelCount = 1);
      lblComment.Enabled := CommentOK;
      edtComment.Enabled := CommentOK;
      if(CommentOK) then
        edtComment.Text := TPCEItem(lbGrid.Items.Objects[GridIndex]).Comment
      else
        edtComment.Text := '';
    finally
      EndUpdate;
    end;
  end;
end;

procedure TfrmPCEBaseMain.clbListClick(Sender: TObject);
begin
  inherited;
//  with clbList do
//  if(ItemIndex >= 0) and (not(Checked[ItemIndex])) then
//    ClearGrid;
end;

procedure TfrmPCEBaseMain.lbGridExit(Sender: TObject);
begin
  inherited;
  if ShiftTabIsPressed then
    if btnOther.CanFocus then
      btnOther.SetFocus;
end;

procedure TfrmPCEBaseMain.lbGridSelect(Sender: TObject);
begin
  inherited;
//  clbList.ItemIndex := -1;
  UpdateControls;
end;

procedure TfrmPCEBaseMain.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FProblems := TStringList.Create;
  lbxSection.HideSelection := TRUE;
  amgrMain.ComponentManager[lbSection] := TLBSectionManager.Create;
end;

procedure TfrmPCEBaseMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FProblems.Free;
end;

procedure TfrmPCEBaseMain.InitTab(ACopyProc: TCopyItemsMethod; AListProc: TListSectionsProc);
begin
  AListProc(lbSection.Items);
  ACopyProc(lbGrid.Items);
  lbSection.ItemIndex := 0;
  lbSectionClick(lbSection);
  ClearGrid;
  GridChanged;
//  CheckOffEntries;
end;

procedure TfrmPCEBaseMain.BeginUpdate;
begin
  inc(FUpdateCount);
end;

procedure TfrmPCEBaseMain.EndUpdate;
begin
  if(FUpdateCount > 0) then
    dec(FUpdateCount);
end;

function TfrmPCEBaseMain.NotUpdating: boolean;
begin
  Result := (FUpdateCount = 0);
end;

procedure TfrmPCEBaseMain.CheckOffEntries;
{ TODO -oRich V. -cCode Set Versioning : Uncomment these lines to prevent acceptance of existing inactive DX codes. }
(*const
  TX_INACTIVE_ICD_CODE1 = 'The diagnosis of "';
  TX_INACTIVE_ICD_CODE2 = '" entered for this encounter' + #13#10 + 'contains an inactive ICD code of "';
  TX_INACTIVE_ICD_CODE3 = '" as of the encounter date, and will be removed.' + #13#10#13#10 +
                          'Please select another diagnosis.';
  TC_INACTIVE_ICD_CODE = 'Diagnosis Contains Inactive Code';*)
var
  i, j: Integer;
  CurCategory, CodeNarr: string;
  APCEItem: TPCEItem;
begin
  FUpdatingGrid := TRUE;
  try
    if(lbSection.Items.Count < 1) then exit;
    CurCategory := GetCat;
    for i := lbGrid.Items.Count - 1 downto 0 do
    begin
      APCEItem := TPCEItem(lbGrid.Items.Objects[i]);
      if APCEItem.Category = CurCategory then
      begin
        CodeNarr := APCEItem.Code + U + APCEItem.Narrative;
        for j := 0 to lbxSection.Items.Count - 1 do
          if ORFn.Pieces(lbxSection.Items[j], U, 1, 2) = CodeNarr then
            begin
{ TODO -oRich V. -cCode Set Versioning : Uncomment these lines to prevent acceptance of existing inactive DX codes. }
(*              if (CurCategory = 'Problem List Items') and (Piece(lbxSection.Items[j], U, 5) = '#') then
                begin
                  InfoBox(TX_INACTIVE_ICD_CODE1 + APCEItem.Narrative + TX_INACTIVE_ICD_CODE2 +
                         APCEItem.Code + TX_INACTIVE_ICD_CODE3, TC_INACTIVE_ICD_CODE, MB_ICONWARNING or MB_OK);
                  lbxSection.Checked[j] := False;
                  APCEItem.Free;
                  lbGrid.Items.Delete(i);
                end
              else*)
                lbxSection.Checked[j] := True;
            end;
      end;
    end;
  finally
    FUpdatingGrid := FALSE;
  end;
end;

procedure TfrmPCEBaseMain.btnSelectAllClick(Sender: TObject);
var
  i: integer;

begin
  inherited;
  BeginUpdate;
  try
    for i := 0 to lbGrid.Items.Count-1 do
      lbGrid.Selected[i] := TRUE;
  finally
    EndUpdate;
  end;
  UpdateControls;
end;

procedure TfrmPCEBaseMain.FormResize(Sender: TObject);
begin
  if FSplitterMove then
    FSplitterMove := FALSE
  else
    inherited;
end;

procedure TfrmPCEBaseMain.clbListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
//  if(Button <> mbLeft) then
//    clbList.Itemindex := clbList.itemAtPos(Point(X,Y), TRUE);
end;

function TfrmPCEBaseMain.GetCat: string;
begin
  Result := '';
  if(lbSection.Items.Count > 0) and (lbSection.ItemIndex >= 0) then
    Result := Piece(lbSection.Items[lbSection.ItemIndex], U, 2);
end;

procedure TfrmPCEBaseMain.lbxSectionClickCheck(Sender: TObject;
  Index: Integer);
var
  i, j: Integer;
  x, x0, CodeCatNarr: string;
  APCEItem: TPCEItem;
  Found, DoSync: boolean;

begin
  inherited;
  if FUpdatingGrid or FClosing then exit;
  DoSync := FALSE;
  x0 := GetCat;
  for i := 0 to lbxSection.Items.Count-1 do
  begin
    x := x0 + U + ORFn.Pieces(lbxSection.Items[i], U, 1, 2);
    CodeCatNarr := Piece(x, U, 2) + U + Piece(x, U, 1) + U + Piece(x, U, 3);
    Found := FALSE;
    for j := lbGrid.Items.Count - 1 downto 0 do
    begin
      APCEItem := TPCEItem(lbGrid.Items.Objects[j]);
      with APCEItem do if CodeCatNarr = Code + U + Category + U + Narrative then
      begin
        Found := TRUE;
        if(lbxSection.Checked[i]) then break;
        APCEItem.Free;
        lbGrid.Items.Delete(j);
      end;
    end;
    if(lbxSection.Checked[i] and (not Found)) then
    begin
      x := FPCECode + U + CodeCatNarr;
      if FPCEItemClass = TPCEProc then
        SetPiece(x, U, pnumProvider, IntToStr(uProviders.PCEProvider));
      UpdateNewItemStr(x);
      APCEItem := FPCEItemClass.Create;
      APCEItem.SetFromString(x);
      GridIndex := lbGrid.Items.AddObject(APCEItem.ItemStr, APCEItem);
      DoSync := TRUE;
    end;
  end;
  if(DoSync) then
    SyncGridData;
  UpdateControls;
end;

procedure TfrmPCEBaseMain.lbxSectionExit(Sender: TObject);
begin
  inherited;
  if TabIsPressed then begin
    if btnOther.CanFocus then
      btnOther.SetFocus
  end
  else if ShiftTabIsPressed then
    if lbSection.CanFocus then
      lbSection.SetFocus;
end;

procedure TfrmPCEBaseMain.UpdateTabPos;
begin
  lbxSection.TabPositions := SectionString;
end;

procedure TfrmPCEBaseMain.splLeftMoved(Sender: TObject);
begin
  inherited;
  lblList.Left := lbxSection.Left + pnlMain.Left;
  FSplitterMove := TRUE;
  FormResize(Sender);
end;

procedure TfrmPCEBaseMain.Sync2Grid;
var
  i, idx, cnt, NewIdx: Integer;
  CodeNarr: string;
  APCEItem: TPCEItem;

begin
  if(FUpdatingGrid or FClosing) then exit;
  FUpdatingGrid := TRUE;
  try
    cnt := 0;
    idx := -1;
    for i := 0 to lbGrid.Items.Count - 1 do
    begin
      if(lbGrid.Selected[i]) then
      begin
        if(idx < 0) then idx := i;
        inc(cnt);
        if(cnt > 1) then break;
      end;
    end;
    NewIdx := -1;
    if(cnt = 1) then
    begin
      APCEItem := TPCEItem(lbGrid.Items.Objects[idx]);
      if APCEItem.Category = GetCat then
      begin
        CodeNarr := APCEItem.Code + U + APCEItem.Narrative;
        for i := 0 to lbxSection.Items.Count - 1 do
        begin
          if Pieces(lbxSection.Items[i], U, 1, 2) = CodeNarr then
          begin
            NewIdx := i;
            break;
          end;
        end;
      end;
    end;
    lbxSection.ItemIndex := NewIdx;
  finally
    FUpdatingGrid := FALSE;
  end;
end;

procedure TfrmPCEBaseMain.Sync2Section;
var
  i, idx: Integer;
  ACode: string;

begin
  if(FUpdatingGrid or FClosing) then exit;
  FUpdatingGrid := TRUE;
  try
    idx := lbxSection.ItemIndex;
    if(idx >= 0) then
      ACode := GetCat + U + Pieces(lbxSection.Items[idx], U, 1, 2)
    else
      ACode := '~@^~@^@~';
    for i := 0 to lbGrid.Items.Count - 1 do
    begin
      with TPCEItem(lbGrid.Items.Objects[i]) do
        lbGrid.Selected[i] := (ACode = (Category + U + Code + U + Narrative));
    end;
  finally
    FUpdatingGrid := FALSE;
  end;
end;

procedure TfrmPCEBaseMain.edtCommentKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = '?') and
     ((edtComment.Text = '') or (edtComment.SelStart = 0)) then
    Key := #0;
end;

{ TLBSectionManager }

function TLBSectionManager.GetItemInstructions(Component: TWinControl): string;
var
  lb : TORListBox;
  idx: integer;
begin
  lb := TORListBox(Component);
  idx := lb.ItemIndex;
  if (idx >= 0) and lb.Selected[idx] then
    Result := 'Press space bar to populate ' +
        TfrmPCEBaseMain(Component.Owner).FTabName + ' section'
  else
    result := inherited GetItemInstructions(Component);
end;

function TLBSectionManager.GetState(Component: TWinControl): string;
var
  frm: TfrmPCEBaseMain;
begin
  Result := '';
  frm := TfrmPCEBaseMain(Component.Owner);
  if frm.FSectionPopulated then
  begin
    frm.FSectionPopulated := FALSE;
    Result := frm.FTabName + ' section populated with ' +
        inttostr(frm.lbxSection.Count) + ' items';
  end;
end;

initialization
  SpecifyFormIsNotADialog(TfrmPCEBaseMain);

end.
