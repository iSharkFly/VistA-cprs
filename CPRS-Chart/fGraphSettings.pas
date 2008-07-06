unit fGraphSettings;
                                          
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, CheckLst, Math, ORCtrls, ORFn, uGraphs;

type
  TfrmGraphSettings = class(TForm)
    brnClear: TButton;
    btnAll: TButton;
    btnClose: TButton;
    btnPersonal: TButton;
    btnPersonalSave: TButton;
    btnPublic: TButton;
    btnPublicSave: TButton;
    bvlBase: TBevel;
    bvlDefaults: TBevel;
    cboConversions: TORComboBox;
    chklstOptions: TCheckListBox;
    lblConversions: TLabel;
    lblMaxGraphs: TLabel;
    lblMaxGraphsRef: TLabel;
    lblMaxSelect: TLabel;
    lblMaxSelectRef: TLabel;
    lblMinGraphHeight: TLabel;
    lblMinGraphHeightRef: TLabel;
    lblOptions: TLabel;
    lblOptionsInfo: TLabel;
    lblSave: TLabel;
    lblShow: TLabel;
    lblSources: TLabel;
    lstATypes: TListBox;
    lstSources: TCheckListBox;
    lstSourcesCopy: TListBox;
    spnMaxGraphs: TUpDown;
    spnMaxSelect: TUpDown;
    spnMinGraphHeight: TUpDown;
    txtMaxGraphs: TEdit;
    txtMaxSelect: TEdit;
    txtMinGraphHeight: TEdit;
    bvlMid: TBevel;
    lstOptions: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPublicClick(Sender: TObject);
    procedure CheckSetting(setting: string; turnon: boolean);
    procedure chklstOptionsClickCheck(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure spnMaxGraphsClick(Sender: TObject; Button: TUDBtnType);
    procedure txtMaxGraphsChange(Sender: TObject);
    procedure txtMaxGraphsExit(Sender: TObject);
    procedure txtMaxGraphsKeyPress(Sender: TObject; var Key: Char);
    procedure spnMinGraphHeightClick(Sender: TObject; Button: TUDBtnType);
    procedure spnMaxSelectClick(Sender: TObject; Button: TUDBtnType);
    procedure txtMinGraphHeightChange(Sender: TObject);
    procedure txtMaxSelectChange(Sender: TObject);
    procedure txtMinGraphHeightExit(Sender: TObject);
    procedure txtMaxSelectExit(Sender: TObject);
    procedure txtMinGraphHeightKeyPress(Sender: TObject; var Key: Char);
    procedure txtMaxSelectKeyPress(Sender: TObject; var Key: Char);
    procedure AssignHints;
    function DisplaySettings: string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    FHintPauseTime: integer;
  public
    { Public declarations }
    procedure wmNCLButtonDown(var Msg: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
  end;

var
  frmGraphSettings: TfrmGraphSettings;
  procedure DialogOptionsGraphSettings(topvalue, leftvalue, fontsize: integer;
    var actiontype: boolean);
  procedure DialogGraphSettings(fontsize: integer;  var okbutton: boolean;
    aGraphSetting: TGraphSetting; DisplaySource: TStrings; var conv: integer; var aSettings: string);
  function FileNameX(filenum: string): string;

implementation

{$R *.DFM}

uses
  rGraphs;

procedure DialogOptionsGraphSettings(topvalue, leftvalue, fontsize: integer;
  var actiontype: boolean);
var
  FGraphSetting: TGraphSetting;
  aList, FSources, AllTypes: TStrings;
  i, conv: integer;
  aSettings, dfntype, listline, settings, settings1, t1, t2: string;
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
  FastAssign(rpcGetTypes('0', false), AllTypes);
  for i := 0 to AllTypes.Count - 1 do
  begin
    listline := AllTypes[i];
    dfntype := UpperCase(Piece(listline, '^', 1));
    SetPiece(listline, '^', 1, dfntype);
    AllTypes[i] := listline;
  end;
  FGraphSetting := GraphSettingsInit(settings);
  FSources := TStringList.Create;
  for i := 0 to BIG_NUMBER do
  begin
    dfntype := Piece(settings1, ';', i);
    if length(dfntype) = 0 then break;
    listline := dfntype + '^' + FileNameX(dfntype) + '^1';
    FSources.Add(listline);
  end;
  conv := BIG_NUMBER;  // indicates being called from Options
  DialogGraphSettings(fontsize, actiontype, FGraphSetting, FSources, conv, aSettings);
  FGraphSetting.Free;
  aList.Free;
  FSources.Free;
end;

procedure DialogGraphSettings(fontsize: integer;  var okbutton: boolean;
  aGraphSetting: TGraphSetting; DisplaySource: TStrings; var conv: integer; var aSettings: string);
var
  needtoadd, turnon: boolean;
  i, j: integer;
  dfntype, dsdisplay, dsitem, dsnum, filename, filenum, listitem, listline, t1, t2, value: string;
  aList: TStrings;
  frmGraphSettings: TfrmGraphSettings;
begin
  okbutton := false;
  aSettings := '';
  aList := TStringList.Create;
  frmGraphSettings := TfrmGraphSettings.Create(Application);
  try
    with frmGraphSettings do
    begin
      FastAssign(rpcGetGraphSettings, aList);
      t1 := aList[0]; t2 := aList[1];   // t1 are personal, t2 public settings
      if length(t1) = 0 then t1 := t2;
      SetPiece(t1, '|', 8, Piece(t2,'|', 8));
      btnPersonal.Hint := t1;
      btnPublic.Hint := t2;
      aList.Clear;
      FastAssign(rpcGetTypes('0', false), aList);
      for i := 0 to aList.Count -1 do
      begin
        listline := aList[i];
        dfntype := UpperCase(Piece(listline, '^', 1));
        SetPiece(listline, '^', 1, dfntype);
        aList[i] := listline;
      end;
      with lstSources.Items do
      begin
        Clear;
        lstSourcesCopy.Items.Clear;
        for i := 0 to aList.Count - 1 do
        begin
          listitem := aList[i];
          filenum := Piece(listitem, '^', 1);
          filename := Piece(listitem, '^', 2);
          Add(filename);
          lstSourcesCopy.Items.Add(filename + '^' + filenum);
        end;
        with lstSourcesCopy do
        for i := 0 to Items.Count - 1 do
        begin
          listitem := Items[i];
          filenum := Piece(listitem, '^', 2);
          for j := 0 to DisplaySource.Count - 1 do
          begin
            dsitem := DisplaySource[j];
            dsnum := Piece(dsitem, '^', 1);
            dsdisplay := Piece(dsitem, '^', 3);
            if filenum = dsnum then
            begin
              if dsdisplay = '1' then
                lstSources.Checked[i] := true;
              break;                         
            end;
          end;
        end;
      end;
      with aGraphSetting do
      begin
        OptionSettings := '';
        if Values then OptionSettings := OptionSettings + SETTING_VALUES;
        if VerticalZoom then OptionSettings := OptionSettings + SETTING_VZOOM;
        if HorizontalZoom then OptionSettings := OptionSettings + SETTING_HZOOM;
        if View3D then OptionSettings := OptionSettings + SETTING_3D;
        if Legend then OptionSettings := OptionSettings + SETTING_LEGEND;
        if Lines then OptionSettings := OptionSettings + SETTING_LINES;
        if Dates then OptionSettings := OptionSettings + SETTING_DATES;
        if SortByType then OptionSettings := OptionSettings + SETTING_SORT;
        if ClearBackground then OptionSettings := OptionSettings + SETTING_CLEAR;
        if Gradient then OptionSettings := OptionSettings + SETTING_GRADIENT;
        if Hints then OptionSettings := OptionSettings + SETTING_HINTS;
        if StayOnTop then OptionSettings := OptionSettings + SETTING_TOP;
        if FixedDateRange then OptionSettings := OptionSettings + SETTING_FIXED;
        spnMaxGraphs.Position := MaxGraphs;
        spnMinGraphHeight.Position := MinGraphHeight;
        MaxSelect := Min(MaxSelectMax, MaxSelect);
        if MaxSelect < MaxSelectMin then
          MaxSelect := MaxSelectMin;
        spnMaxSelect.Position := MaxSelect;
        spnMaxSelect.Min := MaxSelectMin;
        spnMaxSelect.Max := MaxSelectMax;
        if SortByType then SortColumn := 1 else SortColumn := 0;
        lstOptions.Tag := SortColumn;
        if (SortColumn > 0) then
          if Pos(SETTING_SORT, OptionSettings) = 0 then
            OptionSettings := OptionSettings + SETTING_SORT;
        for i := 0 to lstOptions.Items.Count - 1 do
        begin
          value := Piece(lstOptions.Items[i], '^', 2);
          chklstOptions.Checked[i] := Pos(value, OptionSettings) > 0;
        end;
      end;
      with spnMaxGraphs do
        lblMaxGraphsRef.Caption := inttostr(Min) + ' to ' + inttostr(Max);
      with spnMinGraphHeight do
        lblMinGraphHeightRef.Caption := inttostr(Min) + ' to ' + inttostr(Max);
      with spnMaxSelect do
        lblMaxSelectRef.Caption := inttostr(Min) + ' to ' + inttostr(Max);
      if conv = BIG_NUMBER then
      begin
        lblOptionsInfo.Visible := true;
        frmGraphSettings.Caption := 'Graph Settings - Defaults Only';
        lblConversions.Enabled := false;
        cboConversions.Enabled := false;
        cboConversions.ItemIndex := 0;
        cboConversions.Text := '';
      end
      else
      with cboConversions do
      begin
        lblOptionsInfo.Visible := false;
        frmGraphSettings.Caption := 'Graph Settings';
        if btnPublicSave.Enabled = true then
        begin
          lblConversions.Enabled := true;
          Enabled := true;
          ItemIndex := conv;
          Text := Items[ItemIndex];
        end
        else
        begin
          lblConversions.Enabled := false;
          cboConversions.Enabled := false;
          cboConversions.ItemIndex := 0;
          cboConversions.Text := '';
        end;
      end;
      ResizeAnchoredFormToFont(frmGraphSettings);
      ShowModal;
      okbutton := (btnClose.Tag = 1);
      if okbutton then
      begin
        aSettings := btnClose.Hint;
        conv := cboConversions.ItemIndex;
        with lstSources do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            needtoadd := false;
            if Checked[i] then
              needtoadd := true;
            filename := Piece(lstSourcesCopy.Items[i], '^', 1);
            filenum := Piece(lstSourcesCopy.Items[i], '^', 2);
            for j := 0 to DisplaySource.Count - 1 do
            begin
              dsitem := DisplaySource[j];
              dsnum := Piece(dsitem, '^', 1);
              if filenum = dsnum then
              begin
                needtoadd := false;
                if Checked[i] then
                  DisplaySource[j] := filenum + '^' + filename + '^1'
                else
                  DisplaySource[j] := filenum + '^' + filename + '^0';
                break;
              end;
            end;
            if needtoadd then
              DisplaySource.Add('*^' + filenum + '^' + filename + '^1');
          end;
        end;
        with aGraphSetting do
        begin
          MaxGraphs := spnMaxGraphs.Position;
          MinGraphHeight := spnMinGraphHeight.Position;
          MaxSelect := spnMaxSelect.Position;
          MaxSelectMin := 1;
          OptionSettings := '';
          with chklstOptions do
          for i := 0 to Items.Count - 1 do
          begin
            value := Piece(lstOptions.Items[i], '^', 2);
            turnon := Checked[i];
            if turnon then OptionSettings := OptionSettings + value;
            if value = SETTING_VALUES then Values := turnon
            else if value = SETTING_VZOOM then VerticalZoom := turnon
            else if value = SETTING_HZOOM then HorizontalZoom := turnon
            else if value = SETTING_3D then View3D := turnon
            else if value = SETTING_LEGEND then Legend := turnon
            else if value = SETTING_LINES then Lines := turnon
            else if value = SETTING_DATES then Dates := turnon
            else if value = SETTING_SORT then SortByType := turnon
            else if value = SETTING_CLEAR then ClearBackground := turnon
            else if value = SETTING_GRADIENT then Gradient := turnon
            else if value = SETTING_HINTS then Hints := turnon
            else if value = SETTING_FIXED then FixedDateRange := turnon
            else if value = SETTING_TOP then StayOnTop := turnon;
          end;
          if SortByType then SortColumn := 1 else SortColumn := 0;
        end;
      end;
    end;
  finally
    frmGraphSettings.Release;
    aList.Free;
  end;
end;

function FileNameX(filenum: string): string;
var
  i: integer;
  typestring: string;
  AllTypes: TStrings;
begin
  Result := '';
  Alltypes := TStringList.Create;
  for i := 0 to AllTypes.Count - 1 do
  begin
    typestring := AllTypes[i];
    if Piece(typestring, '^', 1) = filenum then
    begin
      Result := Piece(AllTypes[i], '^', 2);
      break;
    end;
  end;
  if Result = '' then
  begin
    for i := 0 to AllTypes.Count - 1 do
    begin
      typestring := AllTypes[i];
      if lowercase(Piece(typestring, '^', 1)) = filenum then
      begin
        Result := Piece(AllTypes[i], '^', 2);
        break;
      end;
    end;
  end;
end;

procedure TfrmGraphSettings.FormCreate(Sender: TObject);
var
  i: integer;
begin
  btnPublicSave.Enabled := rpcPublicEdit;
  lblConversions.Enabled := btnPublicSave.Enabled;
  cboConversions.Enabled := btnPublicSave.Enabled;
  for i := 0 to lstOptions.Items.Count - 1 do
   chklstOptions.Items.Add(Piece(lstOptions.Items[i], '^', 1));
end;

procedure TfrmGraphSettings.btnAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lstSources.Count - 1 do
    lstSources.Checked[i] := (Sender = btnAll);
end;

procedure TfrmGraphSettings.btnCloseClick(Sender: TObject);
begin
  btnClose.Tag := 1; // forces check for changes
  btnClose.Hint := DisplaySettings;
  Close;
end;

function TfrmGraphSettings.DisplaySettings: string;
var
  i: integer;
  delim, settings, value: string;
begin
  settings := '';
  delim := '';
  for i := 0 to lstSourcesCopy.Items.Count - 1 do
  if lstSources.Checked[i] then
  begin
    settings := settings + delim + Piece(lstSourcesCopy.Items[i], '^', 2);
    delim := ';';
  end;
  settings := settings + '|';
  delim := '';
  for i := 0 to chklstOptions.Items.Count - 1 do
  begin
    value := '';
    if chklstOptions.Checked[i] then value := Piece(lstOptions.Items[i], '^', 2);
    settings := settings + value;
  end;
  settings := settings + '|' + inttostr(lstOptions.Tag);  // sortorder
  settings := settings + '|';
  settings := settings + txtMaxGraphs.Text + '|';
  settings := settings + txtMinGraphHeight.Text + '|';
  settings := settings + '|';     // not used
  settings := settings + txtMaxSelect.Text + '|';
  settings := settings + Piece(btnPublic.Hint, '|', 8) + '|';
  Result := settings;
end;

procedure TfrmGraphSettings.btnPublicClick(Sender: TObject);
var
  i, j, k: integer;
  dfntype, filename, settings, settings1, settings2, value: string;
begin
  if Sender = btnPublic then
    settings := btnPublic.Hint
  else
    settings := btnPersonal.Hint;
  settings1 := Piece(settings, '|', 1);
  settings2 := Piece(settings, '|', 2);  //piece 3 not used
  spnMaxGraphs.Position := strtointdef(Piece(settings, '|', 4), 5);
  spnMinGraphHeight.Position := strtointdef(Piece(settings, '|', 5), 90);  //piece 6 not used
  spnMaxSelect.Position := strtointdef(Piece(settings, '|', 7), 100);
  spnMaxSelect.Max := strtointdef(Piece(settings, '|', 8), 1000);
  spnMaxGraphs.Tag := spnMaxGraphs.Position;
  spnMinGraphHeight.Tag := spnMinGraphHeight.Position;
  spnMaxSelect.Tag := spnMaxSelect.Position;
  for i := 0 to lstOptions.Items.Count - 1 do
  begin
    value := Piece(lstOptions.Items[i], '^', 2);
    chklstOptions.Checked[i] := Pos(value, settings2) > 0;
  end;
  for i := 0 to lstSources.Items.Count -1 do
    lstSources.Checked[i] := false;
  for i := 0 to BIG_NUMBER do
  begin
    dfntype := Piece(settings1, ';', i);
    if length(dfntype) = 0 then break;
    for j := 0 to lstSourcesCopy.Items.Count - 1 do
    if dfntype = Piece(lstSourcesCopy.Items[j], '^', 2) then
    begin
      filename := Piece(lstSourcesCopy.Items[j], '^', 1);
      for k := 0 to lstSources.Items.Count - 1 do
        if filename = lstSources.Items[k] then
        begin
          lstSources.Checked[k] := true;
          break;
        end;
      break;
    end;
  end;
end;

procedure TfrmGraphSettings.chklstOptionsClickCheck(Sender: TObject);
var
  value: string;
begin
  with chklstOptions do
  begin
    value := Piece(lstOptions.Items[ItemIndex], '^', 2);
    if State[ItemIndex] = cbChecked then
      if value = SETTING_CLEAR then
        CheckSetting(SETTING_GRADIENT, false)
      else if value = SETTING_GRADIENT then
        CheckSetting(SETTING_CLEAR, false)
      else if value = SETTING_VZOOM then
        CheckSetting(SETTING_HZOOM, true);
    if State[ItemIndex] = cbUnchecked then
      if value = SETTING_HZOOM then
        CheckSetting(SETTING_VZOOM, false);
  end;
end;

procedure TfrmGraphSettings.CheckSetting(setting: string; turnon: boolean);
var
  i: integer;
  value: string;
begin
  for i := 0 to lstOptions.Items.Count -1 do
  begin
    value := Piece(lstOptions.Items[i], '^', 2);
    if value = setting then
    begin
      chklstOptions.Checked[i] := turnon;
      break;
    end;
  end;
end;

procedure TfrmGraphSettings.SaveClick(Sender: TObject);
var
  info, settings: string;
begin
  if (Sender = btnPublicSave) then
    info := 'This will change the PUBLIC default to these settings.'
  else if (Sender = btnPersonalSave) then
    info := 'This will change your personal default to these settings.';
  info := info + #13 + 'Is this what you want to do?';
  if MessageDlg(info, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
  begin
    showmessage('No changes were made.');
    exit;
  end;
  settings := DisplaySettings;
  if (Sender = btnPersonalSave) then
  begin
    rpcSetGraphSettings(settings, '0');
    btnPersonal.Hint := settings;
  end;
  if (Sender = btnPublicSave) then
  begin
    rpcSetGraphSettings(settings, '1');
    btnPublic.Hint := settings;
  end;
end;

procedure TfrmGraphSettings.spnMaxGraphsClick(Sender: TObject;
  Button: TUDBtnType);
begin
  txtMaxGraphs.SetFocus;
  txtMaxGraphs.Tag := strtointdef(txtMaxGraphs.Text, spnMaxGraphs.Min);
end;

procedure TfrmGraphSettings.txtMaxGraphsChange(Sender: TObject);
var
  maxvalue, minvalue: integer;
begin
  maxvalue := spnMaxGraphs.Max;
  minvalue := spnMaxGraphs.Min;
  if strtointdef(txtMaxGraphs.Text, maxvalue) > maxvalue then
  begin
    beep;
    InfoBox('Number must be < ' + inttostr(maxvalue), 'Warning', MB_OK or MB_ICONWARNING);
    if strtointdef(txtMaxGraphs.Text, 0) > maxvalue then
      txtMaxGraphs.Text := inttostr(maxvalue);
  end;
  if strtointdef(txtMaxGraphs.Text, minvalue) < minvalue then
  begin
    beep;
    InfoBox('Number must be > ' + inttostr(minvalue), 'Warning', MB_OK or MB_ICONWARNING);
    if strtointdef(txtMaxGraphs.Text, 0) < minvalue then
      txtMaxGraphs.Text := inttostr(minvalue);
  end;
  spnMaxGraphsClick(self, btNext);
end;

procedure TfrmGraphSettings.txtMaxGraphsExit(Sender: TObject);
begin
  with txtMaxGraphs do
  if Text = '' then
  begin
    Text := inttostr(spnMaxGraphs.Min);
    spnMaxGraphsClick(self, btNext);
  end
  else if (copy(Text, 1, 1) = '0') and (length(Text) > 1) then
  begin
    Text := inttostr(strtointdef(Text, 0));
    if Text = '0' then
      Text := inttostr(spnMaxGraphs.Min);
    spnMaxGraphsClick(self, btNext);
  end;
end;

procedure TfrmGraphSettings.txtMaxGraphsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(WM_NextDlgCtl, 0, 0);
    exit;
  end;
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
    beep;
  end;
end;

procedure TfrmGraphSettings.spnMinGraphHeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
  txtMinGraphHeight.SetFocus;
  txtMinGraphHeight.Tag := strtointdef(txtMinGraphHeight.Text, spnMinGraphHeight.Min);
end;

procedure TfrmGraphSettings.spnMaxSelectClick(Sender: TObject;
  Button: TUDBtnType);
begin
  txtMaxSelect.SetFocus;
  txtMaxSelect.Tag := strtointdef(txtMaxSelect.Text, spnMaxSelect.Min);
end;

procedure TfrmGraphSettings.txtMinGraphHeightChange(Sender: TObject);
var
  maxvalue, minvalue: integer;
begin
  maxvalue := spnMinGraphHeight.Max;
  minvalue := spnMinGraphHeight.Min;
  if strtointdef(txtMinGraphHeight.Text, maxvalue) > maxvalue then
  begin
    beep;
    InfoBox('Number must be < ' + inttostr(maxvalue), 'Warning', MB_OK or MB_ICONWARNING);
    if strtointdef(txtMinGraphHeight.Text, 0) > maxvalue then
      txtMinGraphHeight.Text := inttostr(maxvalue);
  end;
  if strtointdef(txtMinGraphHeight.Text, minvalue) < minvalue then
    if txtMinGraphHeight.Hint = KEYPRESS_OFF then
    begin
      beep;
      InfoBox('Number must be > ' + inttostr(minvalue), 'Warning', MB_OK or MB_ICONWARNING);
      if strtointdef(txtMinGraphHeight.Text, 0) < minvalue then
        txtMinGraphHeight.Text := inttostr(minvalue);
    end;
  spnMinGraphHeightClick(self, btNext);
  txtMinGraphHeight.Hint := KEYPRESS_OFF;
end;

procedure TfrmGraphSettings.txtMaxSelectChange(Sender: TObject);
var
  maxvalue, minvalue: integer;
begin
  maxvalue := spnMaxSelect.Max;
  minvalue := spnMaxSelect.Min;
  if strtointdef(txtMaxSelect.Text, maxvalue) > maxvalue then
  begin
    beep;
    InfoBox('Number must be < ' + inttostr(maxvalue), 'Warning', MB_OK or MB_ICONWARNING);
    if strtointdef(txtMaxSelect.Text, 0) > maxvalue then
      txtMaxSelect.Text := inttostr(maxvalue);
  end;
  if strtointdef(txtMaxSelect.Text, minvalue) < minvalue then
    if txtMaxSelect.Hint = KEYPRESS_OFF then
    begin
      beep;
      InfoBox('Number must be > ' + inttostr(minvalue), 'Warning', MB_OK or MB_ICONWARNING);
      if strtointdef(txtMaxSelect.Text, 0) < minvalue then
        txtMaxSelect.Text := inttostr(minvalue);
    end;
  spnMaxSelectClick(self, btNext);
  txtMaxSelect.Hint := KEYPRESS_OFF;
end;

procedure TfrmGraphSettings.txtMinGraphHeightExit(Sender: TObject);
begin
  with txtMinGraphHeight do
  if Text = '' then
  begin
    Text := inttostr(spnMinGraphHeight.Min);
    spnMinGraphHeightClick(self, btNext);
  end
  else if (copy(Text, 1, 1) = '0') and (length(Text) > 1) then
  begin
    Text := inttostr(strtointdef(Text, 0));
    if Text = '0' then
      Text := inttostr(spnMinGraphHeight.Min);
    spnMinGraphHeightClick(self, btNext);
  end
  else if strtointdef(txtMinGraphHeight.Text, spnMinGraphHeight.Min) < spnMinGraphHeight.Min then
  begin
    Text := inttostr(spnMinGraphHeight.Min);
    spnMinGraphHeightClick(self, btNext);
  end;
end;

procedure TfrmGraphSettings.txtMaxSelectExit(Sender: TObject);
begin
  with txtMaxSelect do
  if Text = '' then
  begin
    Text := inttostr(spnMaxSelect.Min);
    spnMaxSelectClick(self, btNext);
  end
  else if (copy(Text, 1, 1) = '0') and (length(Text) > 1) then
  begin
    Text := inttostr(strtointdef(Text, 0));
    if Text = '0' then
      Text := inttostr(spnMaxSelect.Min);
    spnMaxSelectClick(self, btNext);
  end
  else if strtointdef(txtMaxSelect.Text, spnMaxSelect.Min) < spnMaxSelect.Min then
  begin
    Text := inttostr(spnMaxSelect.Min);
    spnMaxSelectClick(self, btNext);
  end;
end;

procedure TfrmGraphSettings.txtMinGraphHeightKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtMinGraphHeight.Hint := KEYPRESS_OFF;
  if Key = #13 then
  begin
    Perform(WM_NextDlgCtl, 0, 0);
    exit;
  end;
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
    beep;
    exit;
  end;
  txtMinGraphHeight.Hint := KEYPRESS_ON;
end;

procedure TfrmGraphSettings.txtMaxSelectKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtMaxSelect.Hint := KEYPRESS_OFF;
  if Key = #13 then
  begin
    Perform(WM_NextDlgCtl, 0, 0);
    exit;
  end;
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
    beep;
    exit;
  end;
  txtMaxSelect.Hint := KEYPRESS_ON;
end;

procedure TfrmGraphSettings.FormShow(Sender: TObject);
begin
  if Caption = 'Graph Settings - Defaults Only' then
    btnPersonal.SetFocus;
  FHintPauseTime := Application.HintHidePause;
  Application.HintHidePause := 9000; // uses a longer hint pause time
end;

procedure TfrmGraphSettings.AssignHints;
var
  i: integer;
begin                       // text defined in uGraphs
  for i := 0 to ControlCount - 1 do with Controls[i] do
    Controls[i].ShowHint := true;
  lblSources.Hint := SHINT_SOURCES;
  lstSources.Hint := SHINT_SOURCES;
  lblOptions.Hint := SHINT_OPTIONS;
  chklstOptions.Hint := SHINT_OPTIONS;
  btnAll.Hint := SHINT_BTN_ALL;
  brnClear.Hint := SHINT_BTN_CLEAR;
  lblShow.Hint := SHINT_BTN_SHOW;
  lblSave.Hint := SHINT_BTN_SAVE;
  btnPersonal.Hint := SHINT_BTN_PER;
  btnPersonalSave.Hint := SHINT_BTN_PERSAVE;
  btnPublic.Hint := SHINT_BTN_PUB;
  btnPublicSave.Hint := SHINT_BTN_PUBSAVE;
  lblOptionsInfo.Hint := SHINT_BTN_CLOSE;
  btnClose.Hint := SHINT_BTN_CLOSE;
  lblMaxGraphs.Hint := SHINT_MAX;
  txtMaxGraphs.Hint := SHINT_MAX;
  spnMaxGraphs.Hint := SHINT_MAX;
  lblMaxGraphsRef.Hint := SHINT_MAX ;
  lblMinGraphHeight.Hint := SHINT_MIN;
  txtMinGraphHeight.Hint := SHINT_MIN;
  spnMinGraphHeight.Hint := SHINT_MIN;
  lblMinGraphHeightRef.Hint := SHINT_MIN;
  lblMaxSelect.Hint := SHINT_MAX_ITEMS;
  txtMaxSelect.Hint := SHINT_MAX_ITEMS;
  spnMaxSelect.Hint := SHINT_MAX_ITEMS;
  lblMaxSelectRef.Hint := SHINT_MAX_ITEMS;
  lblConversions.Hint := SHINT_FUNCTIONS;
  cboConversions.Hint := SHINT_FUNCTIONS;
end;

procedure TfrmGraphSettings.wmNCLButtonDown(var Msg: TWMNCLButtonDown);
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

procedure TfrmGraphSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.HintHidePause := FHintPauseTime;
end;

end.
