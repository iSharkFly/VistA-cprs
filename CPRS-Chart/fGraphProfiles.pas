unit fGraphProfiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, CheckLst, ORCtrls, ORFn, uGraphs, uCore;

type
  TfrmGraphProfiles = class(TForm)
    btnAdd: TButton;
    btnAddAll: TButton;
    btnClear: TButton;
    btnClose: TButton;
    btnDelete: TButton;
    btnRemoveAll: TButton;
    btnRemoveOne: TButton;
    btnRename: TButton;
    btnSave: TButton;
    btnSavePublic: TButton;
    bvlBase: TBevel;
    cboAllItems: TORComboBox;
    lblApply: TLabel;
    lblDisplay: TLabel;
    lblEditInfo: TLabel;
    lblEditInfo1: TLabel;
    lblSelectandDefine: TLabel;
    lblSelection: TLabel;
    lblSelectionInfo: TLabel;
    lblSource: TLabel;
    lstActualItems: TORListBox;
    lstDrugClass: TListBox;
    lstItemsDisplayed: TORListBox;
    lstItemsTopSelection: TORListBox;
    lstScratch: TListBox;
    lstSource: TORListBox;
    lstTests: TListBox;
    pnlApply: TPanel;
    pnlSource: TPanel;
    pnlTempData: TPanel;
    radSourceAll: TRadioButton;
    radSourcePat: TRadioButton;
    radTop: TRadioButton;
    radBottom: TRadioButton;
    radBoth: TRadioButton;
    radNeither: TRadioButton;
    lblSave: TLabel;
    lblClose: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btnClearClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnRemoveAllClick(Sender: TObject);
    procedure btnRemoveOneClick(Sender: TObject);
    procedure btnRenameClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);

    procedure radSourceAllClick(Sender: TObject);

    procedure cboAllItemsClick(Sender: TObject);
    procedure cboAllItemsChange(Sender: TObject);
    procedure cboAllItemsNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure lstItemsDisplayedChange(Sender: TObject);
    procedure lstItemsDisplayedDblClick(Sender: TObject);
    procedure lstSourceChange(Sender: TObject);
    procedure lstSourceDblClick(Sender: TObject);

    procedure AddToList(aItem: string; aListBox: TORListBox);
    procedure ArrangeList(aCheckFile, aCheckItem, aItem: string;
      aListBox: TORListBox; var addtolist: boolean);
    procedure AssignHints;
    procedure AssignProfile(aList: TStrings; aProfile: string);
    procedure CheckPublic;
    procedure FillSource;

    function ProfileExists(aName: string; aType: integer): boolean;
  private
    { Private declarations }
    FHintPauseTime: integer;
    FPublicEditor: boolean;
    procedure CheckToClear;
    procedure QualifierDelete(line: string);
    procedure wmNCLButtonDown(var Msg: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
  public
    { Public declarations }
  end;

var
  frmGraphProfiles: TfrmGraphProfiles;

procedure DialogOptionsGraphProfiles(topvalue, leftvalue, fontsize: integer;
  var actiontype: boolean);
procedure DialogGraphProfiles(fontsize: integer;  var actionOK: boolean;
  var checkaction: boolean; aGraphSetting: TGraphSetting;
  var aProfname, aProfilestring, aSection: string;
  const PatientDFN: string; var aCounter: integer;
  aSelections: string);

implementation

{$R *.DFM}

uses
  rGraphs;

procedure DialogOptionsGraphProfiles(topvalue, leftvalue, fontsize: integer;
  var actiontype: boolean);
// create the form and make it modal, return an action
var
  FGraphSetting: TGraphSetting;
  aList, AllTypes: TStrings;
  dfntype, listline, settings, settings1, t1, t2: string;
  actionOK, checkaction: boolean;
  counter, i: integer;
  aSelections, profile, profilestring, section: string;
begin
  aList := TStringList.Create;
  FastAssign(rpcGetGraphSettings, aList);
  if aList.Count < 1 then
  begin
    showmessage('CPRS is not configured for graphing.');
    aList.Free;
    exit;
  end;
  t1 := aList[0]; t2 := aList[1];   // t1 are personal, t2 public settings
  if length(t1) > 0 then settings := t1
  else settings := t2;
  SetPiece(settings, '|', 8, Piece(t2, '|', 8));
  settings1 := Piece(settings, '|', 1);
  Alltypes := TStringList.Create;
  FastAssign(rpcGetTypes('0', true), AllTypes);
  for i := 0 to AllTypes.Count - 1 do
  begin
    listline := AllTypes[i];
    dfntype := UpperCase(Piece(listline, '^', 1));
    SetPiece(listline, '^', 1, dfntype);
    AllTypes[i] := listline;
  end;
  FGraphSetting := GraphSettingsInit(settings);
  checkaction := false;
  actionOK := false;
  profile := '*';
  counter := BIG_NUMBER;
  aSelections :='';
  DialogGraphProfiles(fontsize, actionOK, checkaction, FGraphSetting,
    profile, profilestring, section, Patient.DFN, counter, aSelections);
  FGraphSetting.Free;
  aList.Free;
end;

procedure DialogGraphProfiles(fontsize: integer;  var actionOK: boolean;
  var checkaction: boolean; aGraphSetting: TGraphSetting;
  var aProfname, aProfilestring, aSection: string;
  const PatientDFN: string; var aCounter: integer;
  aSelections: string);
var
  i: integer;
  counter, profile, profileitem, profiletype: string;
  frmGraphProfiles: TfrmGraphProfiles;
begin
  frmGraphProfiles := TfrmGraphProfiles.Create(Application);
  try
    with frmGraphProfiles do
    begin
      lblSave.Hint := aProfname;
      lblClose.Hint := PatientDFN;
      if aCounter = BIG_NUMBER then
      begin
        pnlApply.Visible := false;
        frmGraphProfiles.Caption := 'Define Views';
      end
      else
      begin
        pnlApply.Visible := true;
        frmGraphProfiles.Caption := 'Select Items and Define Views';
      end;
      if length(aSelections) > 0 then
        lstSource.Items.Insert(0, '-3^<current selections>^' + aSelections);
      ResizeAnchoredFormToFont(frmGraphProfiles);
      ShowModal;
      actionOK := (btnClose.Tag = 1);
      aProfname := '';
      if actionOK then
      begin
        aProfname := lblSave.Hint;
        if radTop.Checked then aSection := 'top'
        else if radBottom.Checked then aSection := 'bottom'
        else if radBoth.Checked then aSection := 'both'
        else aSection := 'neither';
        profile := '';
        with lstItemsDisplayed do
        for i := 0 to Items.Count - 1 do
        begin
          profiletype := Piece(Items[i], '^', 1);
          profileitem := Piece(Items[i], '^', 2);
          profile := profile + profiletype + '~' + profileitem + '~|';
        end;
        aCounter := aCounter + 1;
        counter := inttostr(aCounter);
        aProfileString := '^<view' + counter + '>^' + profile;
        with aGraphSetting do
        begin
          lstActualItems.Items.Clear;
          with lstItemsDisplayed do
          for i := 0 to Items.Count - 1 do
          begin
            lstActualItems.Items.Add(Piece(Items[i], '<', 1));  //get rid of <any>
          end;
          ItemsForDisplay := lstActualItems.Items;
        end;
     end;
    end;
  finally
    frmGraphProfiles.Release;
  end;
end;

procedure TfrmGraphProfiles.FormCreate(Sender: TObject);
begin
  FillSource;
  FPublicEditor := rpcPublicEdit;
end;

procedure TfrmGraphProfiles.FormShow(Sender: TObject);
begin
  cboAllItems.Visible := radSourceAll.Checked;
  FHintPauseTime := Application.HintHidePause;
  Application.HintHidePause := 9000; // uses a longer hint pause time
end;

procedure TfrmGraphProfiles.btnClearClick(Sender: TObject);
begin
  lstItemsDisplayed.Items.Clear;
  lstItemsTopSelection.Items.Clear;
  cboAllItems.Items.Clear;
  cboAllItems.Text :='';
  lstItemsDisplayedChange(self);
  cboAllItemsChange(self);
  lstSource.ItemIndex := -1; 
end;

procedure TfrmGraphProfiles.btnDeleteClick(Sender: TObject);
var
  publicview: boolean;
  info, profilename, profname, proftype: string;
begin
  if lstSource.ItemIndex < 0 then
  begin
    showmessage('You must select a valid View for deletion.');
    exit;
  end;
  publicview := false;
  profilename := '';
  info := lstSource.Items[lstSource.ItemIndex];
  proftype := Piece(info, '^', 1);
  profname := Piece(info, '^', 2);
  if proftype = '-1' then
    profilename := profname
  else if (proftype = '-2') and FPublicEditor then
  begin
    profilename := profname;
    publicview := true;
  end
  else
  begin
    showmessage('You must select a valid View for deletion.');
    exit;
  end;
  if publicview then
  begin
    if MessageDlg('This is Public and may be used by others.'
      + #13 + 'Delete ' + profilename + '?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      rpcDeleteGraphProfile(UpperCase(profilename), '1');
      btnClose.Tag := 1;
      MessageDlg('The public view, ' + profilename + ' has been deleted.',
      mtInformation, [mbOk], 0);
    end
    else exit;
  end
  else
  begin
    if MessageDlg('Delete ' + profilename + '?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      rpcDeleteGraphProfile(UpperCase(profilename), '0');
      btnClose.Tag := 1;
      MessageDlg('Your personal view, ' + profilename + ' has been deleted.',
      mtInformation, [mbOk], 0);
    end
    else exit;
  end;
  btnClearClick(self);
  lstItemsDisplayed.Items.Clear;
  lstItemsTopSelection.Items.Clear;
  cboAllItems.Items.Clear;
  cboAllItems.Text :='';
  FormCreate(self);
  lstItemsDisplayedChange(self);
  btnDelete.Enabled := false;
  btnRename.Enabled := false;
end;

procedure TfrmGraphProfiles.btnRenameClick(Sender: TObject);
var
  profentered, publicview: boolean;
  i, match: integer;
  aName, aType, info, infotitle: string;
  newprofilename, profilename, profname, proftype: string;
begin
  if lstSource.ItemIndex < 0 then
  begin
    showmessage('You must select a valid View to rename.');
    exit;
  end;
  publicview := false;
  profilename := '';
  info := lstSource.Items[lstSource.ItemIndex];
  proftype := Piece(info, '^', 1);
  profname := Piece(info, '^', 2);
  if proftype = '-1' then
    profilename := profname
  else if (proftype = '-2') and FPublicEditor then
  begin
    profilename := profname;
    publicview := true;
  end
  else
  begin
    showmessage('You must select a valid View to rename.');
  end;
  btnRemoveAllClick(self);
  lstSourceDblClick(self);
  if publicview then
  begin
    infotitle := 'Rename this Public View';
    info := 'This is Public and may be used by others.'
      + #13 + 'Enter a new name for ' + profilename + '.'
  end
  else
  begin
    infotitle := 'Rename your Personal View';
    info := 'Enter a new name for ' + profilename + '.'
  end;
  profentered := InputQuery(infotitle, info, newprofilename);
  if not profentered then exit;
  if newprofilename = '' then exit;
  info := '';
  if not ProfileExists(newprofilename, -2) and publicview then
    info := 'The Public View, ' + profilename + ', will be changed to '
      + newprofilename + #13 + 'Is this OK?'
  else if not ProfileExists(newprofilename, -1) then
    info := 'Your Personal View, ' + profilename + ', will be changed to '
      + newprofilename + #13 + 'Is this OK?';
  if length(info) > 0 then
  begin
    if MessageDlg(info, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    if publicview then
    begin
      FastAssign(rpcGetGraphProfiles(UpperCase(profilename), '1', 1), lstScratch.Items);
      rpcDeleteGraphProfile(UpperCase(profilename), '1');
      rpcSetGraphProfile(newprofilename, '1', lstScratch.Items);
      btnClose.Tag := 1;
      proftype := '-2';
    end
    else
    begin
      FastAssign(rpcGetGraphProfiles(UpperCase(profilename), '0', 1), lstScratch.Items);
      rpcDeleteGraphProfile(UpperCase(profilename), '0');
      rpcSetGraphProfile(newprofilename, '0', lstScratch.Items);
      btnClose.Tag := 1;
      proftype := '-1';
    end;
  end;
  if length(newprofilename) > 0 then
    lblSave.Hint := newprofilename;
  btnClearClick(self);
  lstScratch.Items.Clear;
  lstSource.Items.Clear;
  FormCreate(btnSave);
  match := -1;
  profilename := UpperCase(newprofilename);
  for i := lstSource.Items.Count - 1 downto 0 do
  begin
    info := lstSource.Items[i];
    aType := Piece(info, '^', 1);
    aName := Piece(info, '^', 2);
    if (UpperCase(aName) = newprofilename) and (aType = proftype) then
    begin
      match := i;
      break;
    end;
  end;
  if match = -1 then exit;
  lstSource.ItemIndex := match;
  lstSourceChange(self);
end;

procedure TfrmGraphProfiles.btnCloseClick(Sender: TObject);
begin
  if lstItemsDisplayed.Items.Count > 0 then
    btnClose.Tag := 1;
  Close;
end;

procedure TfrmGraphProfiles.btnRemoveClick(Sender: TObject);
begin
  if lstItemsDisplayed.ItemIndex < 0 then exit;
  lstItemsDisplayed.Items.Delete(lstItemsDisplayed.ItemIndex);
  CheckToClear;
end;

procedure TfrmGraphProfiles.btnRemoveAllClick(Sender: TObject);
begin
  lstItemsDisplayed.Clear;
  lstItemsDisplayedChange(self);
  CheckToClear;
end;

procedure TfrmGraphProfiles.btnRemoveOneClick(Sender: TObject);
begin
  lstItemsDisplayedDblClick(self);
  CheckToClear;
end;

procedure TfrmGraphProfiles.CheckToClear;
begin
  if cboAllItems.Visible and (cboAllItems.Items.Count = 0) then
   lstSource.ItemIndex := -1
  else if lstItemsTopSelection.Visible and (lstItemsTopSelection.Items.Count = 0) then
   lstSource.ItemIndex := -1;
  if lstSource.ItemIndex = -1 then
  begin
    btnAdd.Enabled := false;
    btnAddAll.Enabled := false;
  end;
end;

procedure TfrmGraphProfiles.btnSaveClick(Sender: TObject);
var
  profentered, puplicedit: boolean;
  i, j, match: integer;
  aName, aType, info, infotitle, profile, profileitem, profilename, profiletype, profname, proftype: string;
  aList: TStrings;
begin
  puplicedit := Sender = btnSavePublic;
  if lstItemsDisplayed.Items.Count < 1 then exit;
  profilename := '';
  if lstSource.ItemIndex > -1 then
  begin
    info := lstSource.Items[lstSource.ItemIndex];
    proftype := Piece(info, '^', 1);
    profname := Piece(info, '^', 2);
    profilename := profname;
  end;
  if puplicedit then
  begin
    infotitle := 'Save this Public View';
    info := 'Save this Public View by entering a name for it.'
      + #13 + 'If you are editing a View, enter the View''s name to overwrite it.';
  end
  else
  begin
    infotitle := 'Save your Personal View';
    info := 'Save your Personal View by entering a name for it.'
      + #13 + 'If you are editing a View, enter the View''s name to overwrite it.';
  end;
  profentered := InputQuery(infotitle, info, profilename);
  if not profentered then exit;
  if profilename = '' then exit;
  if (length(profilename) < 3) or (length(profilename) > 30) then
  begin
    showmessage('Not accepted - names of views must be 3-30 characters.');
    exit;
  end;
  info := '';
  if ProfileExists(profilename, -2) and FPublicEditor and puplicedit then
    info := 'The Public View, ' + profilename + ', will be overwritten.'
      + #13 + 'Is this OK?'
  else if ProfileExists(profilename, -1) and (not puplicedit) then
    info := 'Your Personal View, ' + profilename + ', will be overwritten.'
      + #13 + 'Is this OK?';
  if length(info) > 0 then
    if MessageDlg(info, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  aList := TStringList.Create;
  profile := '';
  aList.Clear;
  j := 1;
  with lstItemsDisplayed do
  for i := 0 to Items.Count - 1 do
  begin
    profiletype := Piece(Items[i], '^', 1);
    profileitem := Piece(Items[i], '^', 2);
    profile := profile + profiletype + '~' + profileitem + '~|';
    j := j +1;
    if (j mod 10) = 0 then
      if length(profile) > 0 then
      begin
        aList.Add(UpperCase(profile));
        profile := '';
      end;
  end;
  if length(profile) > 0 then
  begin
    aList.Add(UpperCase(profile));
    profile := '';
  end;
  if puplicedit then
  begin
    proftype := '-2';
    rpcSetGraphProfile(profilename, '1', aList);
    btnClose.Tag := 1;
  end
  else
  begin
    proftype := '-1';
    rpcSetGraphProfile(profilename, '0', aList);
    btnClose.Tag := 1;
  end;
  if length(profilename) > 0 then
    lblSave.Hint := profilename;
  btnClearClick(self);
  lstScratch.Items.Clear;
  lstSource.Items.Clear;
  FormCreate(btnSave);
  match := -1;
  profilename := UpperCase(profilename);
  for i := lstSource.Items.Count - 1 downto 0 do
  begin
    info := lstSource.Items[i];
    aType := Piece(info, '^', 1);
    aName := Piece(info, '^', 2);
    if (UpperCase(aName) = profilename) and (aType = proftype) then
    begin
      match := i;
      break;
    end;
  end;
  aList.Free;
  if match = -1 then exit;
  lstSource.ItemIndex := match;
  lstSourceChange(self);
end;

procedure TfrmGraphProfiles.CheckPublic;
var
  typedata: string;
begin
  if lstSource.ItemIndex = -1 then
  begin
    btnDelete.Enabled := false;
    btnRename.Enabled := false;
    exit;
  end;
  typedata :=  lstSource.Items[lstSource.ItemIndex];
  btnDelete.Enabled := (Piece(typedata, '^', 1) = '-1')
                    or ((Piece(typedata, '^', 1) = '-2') and FPublicEditor);
  btnRename.Enabled := btnDelete.Enabled;
end;

procedure TfrmGraphProfiles.radSourceAllClick(Sender: TObject);
var
  dfn: string;
begin
  if Sender = radSourceAll then
  begin
    lstItemsTopSelection.Visible := false;
    cboAllItems.Visible := true;
  end
  else
  begin
    if radSourcePat.Tag = 0 then
    begin
      dfn := lblClose.Hint;
      FastAssign(rpcGetAllItems(dfn), lstTests.Items);  //*** using a DFN, get all items
      FastAssign(rpcGetItems('50.605', dfn), lstDrugClass.Items);
      radSourcePat.Tag := 1;
    end;
    cboAllItems.Visible := false;
    lstItemsTopSelection.Visible := true;
  end;
  lstSourceChange(self);
end;

procedure TfrmGraphProfiles.cboAllItemsClick(Sender: TObject);
var
  profileselected: boolean;
  i: integer;
  first, profileitem, selection, subtype: string;
begin
  if Sender is TButton then
  begin
    if lstItemsTopSelection.Visible then
    begin
      if Sender = btnAddAll then
        lstItemsTopSelection.ItemIndex := 0;
      Sender := lstItemsTopSelection;
    end
    else
    begin
      if Sender = btnAddAll then
        cboAllItems.ItemIndex := 0;
      Sender := cboAllItems;
    end;
  end;
  if Sender is TORListBox then
  with (Sender as TORListBox) do
  begin
    if ItemIndex < 0 then exit;
    selection := Items[ItemIndex];
    if length(Piece(selection, '_', 2)) > 0 then
      selection := Piece(selection, '_', 1) + ' ' + Piece(selection, '_', 2);
    first := Piece(selection, '^', 1);
    if first = '' then exit;     // line
    profileselected := strtointdef(Piece(selection, '^', 2), 0) < 0;
    if profileselected then
    begin
      for i := 2 to Items.Count - 1 do
      begin
        profileitem := Items[i];
        if length(Piece(profileitem, '_', 2)) > 0 then
          profileitem := Piece(profileitem, '_', 1) + ' ' + Piece(profileitem, '_', 2);   //*****???? ^
        AddToList(profileitem, lstItemsDisplayed);
      end;
    end
    else
      AddToList(selection, lstItemsDisplayed);
    if ItemIndex = 0 then Clear;        //profile or type <any>
    ItemIndex := -1;
  end
  else if Sender is TORComboBox then
  with (Sender as TORComboBox) do
  begin
    if ItemIndex < 0 then exit;
    selection := Items[ItemIndex];
    subtype := Piece(Items[0], '^', 3);
    subtype := Piece(subtype, ':', 2);
    subtype := copy(subtype, 2, length(subtype));
    subtype := Piece(subtype, ' ', 1);
    if UpperCase(copy(selection, 1, 5)) = '63AP;' then
        selection := copy(selection, 1, 4) + '^A;' + copy(selection, 6, 1) + ';'
        + Piece(selection, '^', 2) + '^' + subtype + ': ' + Piece(selection, '^', 3)
    else if UpperCase(copy(selection, 1, 5)) = '63MI;' then
        selection := copy(selection, 1, 4) + '^M;' + copy(selection, 6, 1) + ';'
        + Piece(selection, '^', 2) + '^' + subtype + ': ' + Piece(selection, '^', 3);
    if length(Piece(selection, '_', 2)) > 0 then
      selection := Piece(selection, '_', 1) + ' ' + Piece(selection, '_', 2);
    first := Piece(selection, '^', 1);
    if first = '' then exit;     // line
    profileselected := strtointdef(Piece(selection, '^', 2), 0) < 0;
    if profileselected then
    begin
      for i := 2 to Items.Count - 1 do
      begin
        profileitem := Items[i];
        if length(Piece(profileitem, '_', 2)) > 0 then
          profileitem := Piece(profileitem, '_', 1) + ' ' + Piece(profileitem, '_', 2);   //*****???? ^
        AddToList(profileitem, lstItemsDisplayed);
      end;
    end
    else
      AddToList(selection, lstItemsDisplayed);
    if ItemIndex = 0 then Clear;        //profile or type <any>
    ItemIndex := -1;
  end
  else exit;
  lstItemsDisplayedChange(self);
  CheckToClear;
end;

procedure TfrmGraphProfiles.cboAllItemsChange(Sender: TObject);
begin
 if (Sender is TORListBox) then
   btnClear.Enabled := btnSave.Enabled or ((Sender as TORListBox).Items.Count > 0)
 else if (Sender is TORComboBox) then
   btnClear.Enabled := btnSave.Enabled or ((Sender as TORComboBox).Items.Count > 0);
 if lstItemsTopSelection.Visible then
 begin
   btnAddAll.Enabled := lstItemsTopSelection.Items.Count > 0;
   btnAdd.Enabled := lstItemsTopSelection.ItemIndex > -1;
 end
 else
 begin
   btnAddAll.Enabled := cboAllItems.Items.Count > 0;
   btnAdd.Enabled := cboAllItems.ItemIndex > -1;
 end;
end;

procedure TfrmGraphProfiles.cboAllItemsNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
var
  filetype: string;
begin
  if lstSource.ItemIndex = -1 then exit;
  filetype := Piece(lstSource.Items[lstSource.ItemIndex], '^', 1);
  cboAllItems.ForDataUse(rpcLookupItems(filetype, StartFrom, Direction));
end;

procedure TfrmGraphProfiles.lstItemsDisplayedChange(Sender: TObject);
begin
 btnSave.Enabled := lstItemsDisplayed.Items.Count > 0;
 btnSavePublic.Enabled := btnSave.Enabled and FPublicEditor;
 btnRemoveAll.Enabled := btnSave.Enabled;
 btnAdd.Enabled := (cboAllItems.Visible and (cboAllItems.ItemIndex > -1))
   or (lstItemsTopSelection.Visible and (lstItemsTopSelection.ItemIndex > -1));
 btnRemoveOne.Enabled :=  btnSave.Enabled and (lstItemsDisplayed.ItemIndex > -1);
 btnClear.Enabled := btnSave.Enabled or (lstItemsTopSelection.Items.Count > 0);
 if btnSave.Enabled and pnlApply.Visible then btnClose.Caption := 'Close and Display'
 else btnClose.Caption := 'Close';
end;

procedure TfrmGraphProfiles.lstItemsDisplayedDblClick(Sender: TObject);
var
  line: string;
begin
  if lstItemsDisplayed.ItemIndex < 0 then exit;
  line := lstItemsDisplayed.Items[lstItemsDisplayed.ItemIndex];
  lstItemsDisplayed.Items.Delete(lstItemsDisplayed.ItemIndex);
  QualifierDelete(line);
  lstItemsDisplayedChange(self);
end;

procedure TfrmGraphProfiles.QualifierDelete(line: string);
var
  i: integer;
  filenum: string;
begin
  if Piece(line, '^', 1) <> '0' then exit;
  filenum := Piece(line, '^', 2);
  if strtointdef(filenum, 0) < 0 then exit;
  if (filenum = '52') or (filenum = '55') or (filenum = '55NVAE')
  or (filenum = '55NVA') or (filenum = '53.79') then
  with lstItemsDisplayed do
  for i := 0 to Items.Count - 1 do
  if (Piece(Items[i], '^', 2) = '50.605') and (Piece(Items[i], '^', 1) = '0') then
  begin
    Items.Delete(i);
    break;
  end;
end;

procedure TfrmGraphProfiles.lstSourceChange(Sender: TObject);
var
  i: integer;
  filetype, itemdata, typedata: string;
begin
  cboAllItems.Items.Clear;
  cboAllItems.Text := '';
  CheckPublic;
  if lstSource.ItemIndex = -1 then exit;
  typedata :=  lstSource.Items[lstSource.ItemIndex];
  if typedata = LLS_LINE then
  begin
    cboAllItems.Items.Clear;
    cboAllItems.Text := '';
    exit;
  end;
  filetype := Piece(typedata, '^', 1);
  if filetype = '-1' then
    AssignProfile(cboAllItems.Items, typedata)
  else
  if filetype = '-2' then
    AssignProfile(cboAllItems.Items, typedata)
  else
  if filetype = '-3' then   // current selections
  begin
    AssignProfile(cboAllItems.Items, typedata);
  end
  else
  with cboAllItems.Items do
  begin
    Clear;
    cboAllItems.InitLongList('');
    typedata := '0^' + Piece(typedata, '^', 1) + '^ ' + Piece(typedata, '^', 2) + ' <any>';
    Insert(0, typedata);
    Insert(1, '^' + LLS_LINE);
    if Piece(typedata, '^', 2) = '63AP' then
    begin
      for i := 0 to lstSource.Items.Count - 1 do
      if copy(lstSource.Items[i], 1, 5) = '63AP;' then
      begin
        typedata := lstSource.Items[i];
        typedata := '0^' + Piece(typedata, '^', 1) + '^ ' + Piece(typedata, '^', 2) + ' <any>';
        Add(typedata);
      end;
    end
    else if Piece(typedata, '^', 2) ='63MI' then
    begin
      for i := 0 to lstSource.Items.Count - 1 do
      if copy(lstSource.Items[i], 1, 5) = '63MI;' then
      begin
        typedata := lstSource.Items[i];
        typedata := '0^' + Piece(typedata, '^', 1) + '^ ' + Piece(typedata, '^', 2) + ' <any>';
        Add(typedata);
      end;
    end;
  end;
  cboAllItemsChange(cboAllItems);
  CheckPublic;
  if lstSource.ItemIndex = -1 then exit;
  typedata :=  lstSource.Items[lstSource.ItemIndex];
  if typedata = LLS_LINE then
  begin
    lstItemsTopSelection.Clear;
    exit;
  end;
  filetype := Piece(typedata, '^', 1);
  if filetype = '-1' then
    AssignProfile(lstItemsTopSelection.Items, typedata)
  else
  if filetype = '-2' then
    AssignProfile(lstItemsTopSelection.Items, typedata)
  else
  if filetype = '-3' then
  begin
    AssignProfile(lstItemsTopSelection.Items, typedata);
  end
  else
  with lstItemsTopSelection.Items do
  begin
    Clear;
    lstItemsTopSelection.Sorted := true;
    typedata := '0^' + Piece(typedata, '^', 1) + '^ ' + Piece(typedata, '^', 2) + ' <any>';
    Insert(0, typedata);
    Insert(1, '^' + LLS_LINE);
    if filetype = '63AP' then
    begin
      lstItemsTopSelection.Sorted := false;
      for i := 0 to lstSource.Items.Count - 1 do
      if copy(lstSource.Items[i], 1, 5) = '63AP;' then
      begin
        typedata := lstSource.Items[i];
        typedata := '0^' + Piece(typedata, '^', 1) + '^ ' + Piece(typedata, '^', 2) + ' <any>';
        Add(typedata);
      end;
    end
    else if filetype ='63MI' then
    begin
      lstItemsTopSelection.Sorted := false;
      for i := 0 to lstSource.Items.Count - 1 do
      if copy(lstSource.Items[i], 1, 5) = '63MI;' then
      begin
        typedata := lstSource.Items[i];
        typedata := '0^' + Piece(typedata, '^', 1) + '^ ' + Piece(typedata, '^', 2) + ' <any>';
        Add(typedata);
      end;
    end
    else if filetype = '50.605' then
    for i := 0 to lstDrugClass.Items.Count - 1 do
    begin
      itemdata := lstDrugClass.Items[i];
      if filetype = Piece(itemdata, '^', 1) then
        Add(itemdata);
    end
    else if copy(filetype, 1, 5) = '63AP;' then
    begin
      filetype := copy(filetype, 1, 4) + '^A;' + copy(filetype, 6, 1) + ';';
      for i := 0 to lstTests.Items.Count - 1 do
      begin
        itemdata := lstTests.Items[i];
        if filetype = UpperCase(copy(itemdata, 1, 9)) then
          Add(itemdata);
      end;
    end
    else if copy(filetype, 1, 5) = '63MI;' then
    begin
      filetype := copy(filetype, 1, 4) + '^M;' + copy(filetype, 6, 1) + ';';
      for i := 0 to lstTests.Items.Count - 1 do
      begin
        itemdata := lstTests.Items[i];
        if filetype = UpperCase(copy(itemdata, 1, 9)) then
          Add(itemdata);
      end;
    end
    else if filetype <> '405' then
    for i := 0 to lstTests.Items.Count - 1 do
    begin
      itemdata := lstTests.Items[i];
      if filetype = UpperCase(Piece(itemdata, '^', 1)) then
        Add(itemdata);
    end;
    cboAllItemsChange(lstItemsTopSelection);
  end;
end;

procedure TfrmGraphProfiles.lstSourceDblClick(Sender: TObject);
begin
  if cboAllItems.Visible then
  begin
    if cboAllItems.Items.Count < 1 then exit;
    cboAllItems.ItemIndex := 0;
    cboAllItemsClick(cboAllItems);
  end
  else
  begin
    if lstItemsTopSelection.Items.Count < 1 then exit;
    lstItemsTopSelection.Selected[0] := true;
    cboAllItemsClick(lstItemsTopSelection);
  end;
end;

procedure TfrmGraphProfiles.AddToList(aItem: string; aListBox: TORListBox);
var
  addtolist: boolean;
  checkfile, checkitem: string;
begin
  aItem := UpperCase(Pieces(aItem, '^', 1, 2)) + '^' + Piece(aItem, '^', 3);
  checkfile := Piece(aItem, '^', 1);
  checkitem := Piece(aItem, '^', 2);
  if checkfile = '0' then
  begin
    checkfile := checkitem;       // if drug class any - 52,0;55,0
    checkitem := '0';           // if drug class item - go thru meds
  end;
  ArrangeList(checkfile, checkitem, aItem, aListBox, addtolist);
  if addtolist then aListBox.Items.Add(aItem);
  if (checkfile = '50.605') and (checkitem = '0') then
  begin
    checkfile := '52';
    aItem := '0^52^ Medication,Outpatitent <any>';
    ArrangeList(checkfile, checkitem, aItem, aListBox, addtolist);
    if addtolist then aListBox.Items.Add(aItem);
    checkfile := '55';
    aItem := '0^55^ Medication,Inpatitent <any>';
    ArrangeList(checkfile, checkitem, aItem, aListBox, addtolist);
    if addtolist then aListBox.Items.Add(aItem);
    checkfile := '53.79';
    aItem := '0^53.79^ Medication,BCMA <any>';
    ArrangeList(checkfile, checkitem, aItem, aListBox, addtolist);
    if addtolist then aListBox.Items.Add(aItem);
    {checkfile := '55NVAE';               // nonvameds as events is not used
    aItem := '0^55NVAE^ Medication,Non-VA-Event <any>';
    ArrangeList(checkfile, checkitem, aItem, aListBox, addtolist);
    if addtolist then aListBox.Items.Add(aItem);}
    checkfile := '55NVA';
    aItem := '0^55NVA^ Medication,Non-VA <any>';
    ArrangeList(checkfile, checkitem, aItem, aListBox, addtolist);
    if addtolist then aListBox.Items.Add(aItem);
  end;
end;

procedure TfrmGraphProfiles.ArrangeList(aCheckFile, aCheckItem, aItem: string;
  aListBox: TORListBox; var addtolist: boolean);
var
  i: integer;
  listfile, listitem: string;
begin
  addtolist := true;
  with aListBox do
  for i := Items.Count - 1 downto 0 do
  begin
    listfile := Piece(Items[i], '^', 1);
    listitem := Piece(Items[i], '^', 2);
    if listfile = '0' then
    begin
      listfile := listitem;
      listitem := '0';
    end;
    if (aCheckItem = listitem) and (aCheckFile = listfile) then
    begin
      addtolist := false;
      break;
    end
    else
    if (listitem = '0') and (aCheckFile = listfile) then
    begin
      addtolist := false;
      break;
    end
    else
    if listitem = '0' then
    begin
      if aCheckFile = Piece(listfile, ';', 1) then
        if Piece(aCheckItem, ';', 2) = Piece(listfile, ';', 2) then
        begin
          addtolist := false;
          break;
        end;
    end
    else
    if (aCheckItem = '0') and (aCheckFile = listfile) then
      Items.Delete(i);
  end;
end;

procedure TfrmGraphProfiles.AssignProfile(aList: TStrings; aProfile: string);
var
  ext, stop: boolean;
  i, j, k: integer;
  dfn, itemname, itemnums, itempart, itempart1, itempart2, itemtest, typedata, teststring: string;
begin
  ext := radSourceAll.Checked;
  if ext then
  begin
    if Piece(aProfile, '^', 1) = '-2' then
      FastAssign(rpcGetGraphProfiles(UpperCase(Piece(aProfile, '^', 2)), '1', 1), aList)
    else

    if Piece(aProfile, '^', 1) = '-3' then   // current selection on list
    begin
      if radSourcePat.Tag = 0 then
      begin
        dfn := lblClose.Hint;
        FastAssign(rpcGetAllItems(dfn), lstTests.Items);  //*** using a DFN, get all items
        FastAssign(rpcGetItems('50.605', dfn), lstDrugClass.Items);
        radSourcePat.Tag := 1;
      end;
      typedata := '0^-1^ ' + Piece(aProfile, '^', 2);
      aProfile := Piece(aProfile, '^', 3);
      aList.Clear;
      aList.Add(typedata);
      aList.Add('^' + LLS_LINE);
      for i := 1 to BIG_NUMBER do
      begin
        itempart := Piece(aProfile, '|', i);
        if itempart = '' then exit;
        itempart1 := Piece(itempart, '~', 1);
        itempart2 := Piece(itempart, '~', 2);
        itemnums := itempart1 + '^' + itempart2;
        itemname := '';
        for k := 0 to lstTests.Items.Count - 1 do
        begin
          itemtest := UpperCase(Pieces(lstTests.Items[k], '^', 1, 2));
          if itemtest = itemnums then
          begin
            itemname := Piece(lstTests.Items[k], '^', 3);
            itemnums := itemnums + '^' + itemname;
            aList.Add(itemnums);
            break;
          end;
        end;
      end;
    end

    else
      FastAssign(rpcGetGraphProfiles(UpperCase(Piece(aProfile, '^', 2)), '0', 1), aList);
    for i := 0 to aList.Count -1 do
    begin
      teststring := aList[i];
      if Piece(teststring, '^', 1) = '0' then
        aList[i] := '0^' + Piece(teststring, '^', 2) + '^_' + Piece(teststring, '^', 3);
    end;
    typedata := '0^' + Piece(aProfile, '^', 1) + '^ ' + Piece(aProfile, '^', 2);
    aList.Insert(0, typedata);
    aList.Insert(1, '^' + LLS_LINE);
    exit;
  end;
  if Piece(aProfile, '^', 1) = '-2' then
  begin
    FastAssign(rpcGetGraphProfiles(UpperCase(Piece(aProfile, '^', 2)), '1', 0), lstScratch.Items);
    typedata := '0^-1^ ' + Piece(aProfile, '^', 2);
  end
  else
  if Piece(aProfile, '^', 1) = '-3' then   // current selection on list
  begin
    lstScratch.Items.Clear;
    lstScratch.Items.Add(Piece(aProfile, '^', 3));
    typedata := '0^-1^ ' + Piece(aProfile, '^', 2);
    aProfile := '-1^' + Piece(aProfile, '^', 2) + '^';
  end
  else
  begin
    FastAssign(rpcGetGraphProfiles(UpperCase(Piece(aProfile, '^', 2)), '0', 0), lstScratch.Items);
    typedata := '0^' + Piece(aProfile, '^', 1) + '^ ' + Piece(aProfile, '^', 2);
  end;
  for i := 0 to lstScratch.Items.Count - 1 do
    aProfile := aProfile + lstScratch.Items[i];
  aProfile := Piece(aProfile, '^', 3);
  aList.Clear;
  aList.Add(typedata);
  aList.Add('^' + LLS_LINE);
  for i := 1 to BIG_NUMBER do
  begin
    itempart := Piece(aProfile, '|', i);
    if itempart = '' then exit;
    itempart1 := Piece(itempart, '~', 1);
    itempart2 := Piece(itempart, '~', 2);
    itemnums := itempart1 + '^' + itempart2;
    itemname := '';
    if itempart1 = '0' then
    begin
      for j := 0 to lstSource.Items.Count - 1 do
        if itempart2 = Piece(lstSource.Items[j], '^', 1) then
        begin
          itemname := Piece(lstSource.Items[j], '^', 2);
          break;
        end;
      typedata := '0^' + itempart2 + '^_' + itemname + ' <any>';
      aList.Add(typedata);
    end
    else
    if (itempart1 <> '0') then    //DRUG CLASS NOT INCLUDED
    begin
      stop := false;
      for k := 0 to lstTests.Items.Count - 1 do
      begin
        itemtest := UpperCase(Pieces(lstTests.Items[k], '^', 1, 2));
        if itemtest = itemnums then
        begin
          itemname := Piece(lstTests.Items[k], '^', 3);
          itemnums := itemnums + '^' + itemname;
          aList.Add(itemnums);
          stop := true;
          break;
        end;
      end;
      if not stop then
      for k := 0 to lstDrugClass.Items.Count - 1 do
      begin
        itemtest := UpperCase(Pieces(lstDrugClass.Items[k], '^', 1, 2));
        if itemtest = itemnums then
        begin
          itemname := Piece(lstDrugClass.Items[k], '^', 3);
          itemnums := itemnums + '^' + itemname;
          aList.Add(itemnums);
          break;
        end;
      end;
    end;
  end;
end;

procedure TfrmGraphProfiles.FillSource;
var
  i: integer;
  dfntype, listline: string;
begin
  with lstSource do
  begin
    Sorted := true;
    OnClick := OnChange;     // turn off onchange event when loading
    OnChange := nil;
    FastAssign(rpcGetTypes('0', true), Items);
    for i := 0 to Items.Count - 1 do
    begin
      listline := Items[i];
      dfntype := UpperCase(Piece(listline, '^', 1));
      SetPiece(listline, '^', 1, dfntype);
      Items[i] := listline;
    end;
    //Items.Add('50.605^Drug Class');
    OnChange := OnClick;
    OnClick := nil;
    Sorted := false;
    FastAssign(rpcGetGraphProfiles('1', '0', 0), lstScratch.Items);
    if lstScratch.Items.Count > 0 then
    begin
      Items.Add(LLS_LINE);
      for i := 0 to lstScratch.Items.Count - 1 do
        Items.Add('-1^' + lstScratch.Items[i] + '^');
    end;
    FastAssign(rpcGetGraphProfiles('1', '1', 0), lstScratch.Items);
    if lstScratch.Items.Count > 0 then
    begin
      Items.Add(LLS_LINE);
      for i := 0 to lstScratch.Items.Count - 1 do
        Items.Add('-2^' + lstScratch.Items[i] + '^');
    end;
  end;
end;

function TfrmGraphProfiles.ProfileExists(aName: string; aType: integer): boolean;
var
  i, sourcetype: integer;
  info, profilename: string;
begin
  Result := false;
  aName := UpperCase(aName);
  for i := lstSource.Items.Count - 1 downto 0 do
  begin
    info := lstSource.Items[i];
    profilename := Piece(info, '^', 2);
    sourcetype := strtointdef(Piece(info, '^', 1), 0);
    if (UpperCase(profilename) = aName) and (aType = sourcetype) then
    begin
      Result := true;
      break;
    end;
  end;
end;

procedure TfrmGraphProfiles.AssignHints;
var
  i: integer;
begin                       // text defined in uGraphs
  for i := 0 to ControlCount - 1 do with Controls[i] do
    Controls[i].ShowHint := true;
  RadSourcePat.Hint := HINT_PAT_SOURCE;
  RadSourceAll.Hint := HINT_ALL_SOURCE;
  lblSelectionInfo.Hint := HINT_SELECTION_INFO;
  lblSource.Hint := HINT_SOURCE;
  lstSource.Hint := HINT_SOURCE;
  lblSelection.Hint := HINT_SELECTION;
  lstItemsTopSelection.Hint := HINT_SELECTION;
  cboAllItems.Hint := HINT_SELECTION;
  lblDisplay.Hint := HINT_DISPLAY;
  lstItemsDisplayed.Hint := HINT_DISPLAY;
  btnAddAll.Hint := HINT_BTN_ADDALL;
  btnAdd.Hint := HINT_BTN_ADD1;
  btnRemoveOne.Hint := HINT_BTN_REMOVE1;
  btnRemoveAll.Hint := HINT_BTN_REMOVEALL;
  btnClear.Hint := HINT_BTN_CLEAR;
  btnDelete.Hint := HINT_BTN_DELETE;
  btnRename.Hint := HINT_BTN_RENAME;
  btnSave.Hint := HINT_BTN_SAVE;
  btnSavePublic.Hint := HINT_BTN_SAVE_PUB;
  pnlApply.Hint := HINT_APPLY;
  btnClose.Hint := HINT_BTN_CLOSE;
end;

procedure TfrmGraphProfiles.wmNCLButtonDown(var Msg: TWMNCLButtonDown);
begin            // clicking the ? button will have controls show hints
  if Msg.HitTest = HTHELP then
  begin
    Msg.Result := 0; // ignore biHelp border icon
    AssignHints;
    ShowMessage('Help is now available.' + #13 +
                'By pausing over a list or control, hints will appear.');
  end
  else
    inherited;
end;

procedure TfrmGraphProfiles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.HintHidePause := FHintPauseTime;
end;

end.
