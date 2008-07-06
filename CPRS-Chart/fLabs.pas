unit fLabs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fHSplit, StdCtrls, ExtCtrls, ORCtrls, ComCtrls, Grids, Buttons, fLabTest,
  fLabTests, fLabTestGroups, ORFn, TeeProcs, TeEngine, Chart, Series, Menus,
  uConst, ORDtTmRng, OleCtrls, SHDocVw, Variants, StrUtils;

type
  TfrmLabs = class(TfrmHSplit)
    lblHeading: TOROffsetLabel;
    lstReports: TORListBox;
    lstHeaders: TORListBox;
    lstDates: TORListBox;
    pnlHeader: TORAutoPanel;
    pnlFooter: TORAutoPanel;
    grdLab: TCaptionStringGrid;
    pnlChart: TPanel;
    memLab: TRichEdit;
    lblSpecimen: TLabel;
    lblSingleTest: TLabel;
    lstTests: TORListBox;
    lblFooter: TOROffsetLabel;
    lblReports: TOROffsetLabel;
    lblDates: TOROffsetLabel;
    lblHeaders: TOROffsetLabel;
    bvlHeader: TBevel;
    pnlButtons: TORAutoPanel;
    cmdNext: TButton;
    cmdPrev: TButton;
    cmdRecent: TButton;
    cmdOld: TButton;
    lblDateFloat: TLabel;
    lblOld: TOROffsetLabel;
    lblPrev: TOROffsetLabel;
    lblNext: TOROffsetLabel;
    lblRecent: TOROffsetLabel;
    pnlOtherTests: TORAutoPanel;
    cmdOtherTests: TButton;
    chtChart: TChart;
    serHigh: TLineSeries;
    serLow: TLineSeries;
    serTest: TLineSeries;
    bvlOtherTests: TBevel;
    lblMostRecent: TLabel;
    lblDate: TLabel;
    lblCollection: TLabel;
    pnlWorksheet: TORAutoPanel;
    chkValues: TCheckBox;
    chk3D: TCheckBox;
    ragHorV: TRadioGroup;
    chkAbnormals: TCheckBox;
    ragCorG: TRadioGroup;
    lstTestGraph: TORListBox;
    pnlGraph: TORAutoPanel;
    chkGraph3D: TCheckBox;
    chkGraphValues: TCheckBox;
    lblGraphInfo: TLabel;
    chkGraphZoom: TCheckBox;
    PopupMenu1: TPopupMenu;
    GotoTop1: TMenuItem;
    GotoBottom1: TMenuItem;
    FreezeText1: TMenuItem;
    UnfreezeText1: TMenuItem;
    Memo1: TMemo;
    chkZoom: TCheckBox;
    popChart: TPopupMenu;
    popValues: TMenuItem;
    pop3D: TMenuItem;
    popZoom: TMenuItem;
    N1: TMenuItem;
    popCopy: TMenuItem;
    popZoomBack: TMenuItem;
    popDetails: TMenuItem;
    N2: TMenuItem;
    calLabRange: TORDateRangeDlg;
    dlgWinPrint: TPrintDialog;
    N3: TMenuItem;
    popPrint: TMenuItem;
    Timer1: TTimer;
    TabControl1: TTabControl;
    WebBrowser1: TWebBrowser;
    lblGraph: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DisplayHeading;
    procedure lstReportsClick(Sender: TObject);
    procedure lstHeadersClick(Sender: TObject);
    procedure lstDatesClick(Sender: TObject);
    procedure cmdOtherTestsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdNextClick(Sender: TObject);
    procedure cmdPrevClick(Sender: TObject);
    procedure cmdRecentClick(Sender: TObject);
    procedure cmdOldClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pnlRightResize(Sender: TObject);
    procedure chkValuesClick(Sender: TObject);
    procedure chk3DClick(Sender: TObject);
    procedure ragHorVClick(Sender: TObject);
    procedure ragCorGClick(Sender: TObject);
    procedure lstTestGraphClick(Sender: TObject);
    procedure chkGraphValuesClick(Sender: TObject);
    procedure chkGraph3DClick(Sender: TObject);
    procedure chkGraphZoomClick(Sender: TObject);
    procedure GotoTop1Click(Sender: TObject);
    procedure GotoBottom1Click(Sender: TObject);
    procedure FreezeText1Click(Sender: TObject);
    procedure UnfreezeText1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure chkZoomClick(Sender: TObject);
    procedure chtChartUndoZoom(Sender: TObject);
    procedure popCopyClick(Sender: TObject);
    procedure popChartPopup(Sender: TObject);
    procedure popValuesClick(Sender: TObject);
    procedure pop3DClick(Sender: TObject);
    procedure popZoomClick(Sender: TObject);
    procedure popZoomBackClick(Sender: TObject);
    procedure chtChartMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chtChartClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chtChartClickLegend(Sender: TCustomChart;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure popDetailsClick(Sender: TObject);
    procedure popPrintClick(Sender: TObject);
    procedure BeginEndDates(var ADate1, ADate2: TFMDateTime; var ADaysBack: integer);
    procedure Timer1Timer(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpdateRemoteStatus(aSiteID, aStatus: string);
  private
    { Private declarations }
    procedure AlignList;
    procedure HGrid(griddata: TStrings);
    procedure VGrid(griddata: TStrings);
    procedure FillGrid(agrid: TStringGrid; aitems: TStrings);
    procedure GridComments(aitems: TStrings);
    procedure FillComments(amemo: TRichEdit; aitems:TStrings);
    procedure GetInterimGrid(adatetime: TFMDateTime; direction: integer);
    procedure WorksheetChart(test: string; aitems: TStrings);
    procedure GetStartStop(var start, stop: string; aitems: TStrings);
    procedure GraphChart(test: string; aitems: TStrings);
    procedure GraphList(griddata: TStrings);
    procedure ProcessNotifications;
    procedure PrintLabGraph;
    procedure GoRemote(Dest: TStringList; AItem, AReportID: Int64; AQualifier,
      ARpc, AHSType, ADaysBack, ASection: string; ADate1, ADate2: TFMDateTime);
    procedure ChkBrowser;
    procedure CommonComponentVisible(A1,A2,A3,A4,A5,A6,A7,A8,A9: Boolean);
  public
    procedure ClearPtData; override;
    function AllowContextChange(var WhyNot: string): Boolean; override;
    procedure DisplayPage; override;
    procedure SetFontSize(NewFontSize: Integer); override;
    function FMToDateTime(FMDateTime: string): TDateTime;
    procedure RequestPrint; override;
    procedure ExtlstReportsClick(Sender: TObject; Ext: boolean);

end;

var
  frmLabs: TfrmLabs;
  uPrevReportIndex, uFormat: integer;
  uDate1, uDate2: Tdatetime;
  tmpGrid: TStringList;
  uLabLocalReportData: TStringList;  //Storage for Local report data
  uLabRemoteReportData: TStringList; //Storage for Remote lab query
  uUpdateStat: boolean;             //flag turned on when remote status is being updated

implementation

uses uCore, rLabs, rCore, rCover, rOrders, fLabPrint, fFrame, fRptBox, Printers,
     clipbrd, rReports, rGraphs, activex, mshtml, uAccessibleStringGrid;

const
  CT_LABS     = 9;            // ID for Labs tab used by frmFrame
  TX_NOREPORT     = 'No report is currently selected.';
  TX_NOREPORT_CAP = 'No Report Selected';
  ZOOM_PERCENT = 99;        // padding for inflating margins
  HTML_PRE  = '<html><head><style>' + CRLF +
              'PRE {font-size:8pt;font-family: "Courier New", "monospace"}' + CRLF +
              '</style></head><body><pre>';
  HTML_POST = CRLF + '</pre></body></html>';

{$R *.DFM}

var
  uFrozen: Boolean;
  uGraphingActivated: Boolean;
  uRemoteCount: Integer;
  uHTMLDoc: string;
  uReportType: string;
  uReportRPC: string;
  uHTMLPatient: ANSIstring;

procedure TfrmLabs.RequestPrint;
begin
  with lstReports do
  begin
    if ItemIEN = 0 then InfoBox(TX_NOREPORT, TX_NOREPORT_CAP, MB_OK);
    case ItemIen of
      1: begin
           InfoBox('Unable to print ''Most Recent'' report.', 'No Print Available', MB_OK);
         end;
      2: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
      3: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
      4: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
      5: begin
           InfoBox('Unable to print ''Worksheet'' report.', 'No Print Available', MB_OK);
         end;
      6: begin
           if chtChart.Visible then PrintLabGraph;
         end;
      8: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
      9: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
     10: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
     20: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
     21: begin
           PrintLabs(ItemIEN, DisplayText[ItemIndex], lstDates.ItemIEN);
         end;
    end;
  end;
end;


procedure TfrmLabs.FormCreate(Sender: TObject);
var
  aList: TStrings;
begin
  inherited;
  PageID := CT_LABS;
  grdLab.Color := ReadOnlyColor;
  memLab.Color := ReadOnlyColor;
  uFrozen := False;
  aList := TStringList.Create;
  FastAssign(rpcGetGraphSettings, aList);
  uGraphingActivated := aList.Count > 0;
  aList.Free;
  uRemoteCount := 0;
  tmpGrid := TStringList.Create;
  uLabLocalReportData := TStringList.Create;
  uLabRemoteReportData := TStringList.Create;
  uPrevReportIndex := 0;
  lstReports.ItemIndex := uPrevReportIndex;
  if Patient.Inpatient then lstDates.ItemIndex := 2 else lstDates.ItemIndex := 5;
  lblSingleTest.Caption := '';
  lblSpecimen.Caption := '';
  SerTest.GetHorizAxis.ExactDateTime := true;
  SerTest.GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  TAccessibleStringGrid.WrapControl(grdLab);
end;

procedure TfrmLabs.UpdateRemoteStatus(aSiteID, aStatus: string);
var
  j: integer;
  s: string;
  c: boolean;
begin
  if uUpdateStat = true then exit;                 //uUpdateStat also looked at in fFrame
  uUpdateStat := true;
  for j := 0 to frmFrame.lstCIRNLocations.Items.Count - 1 do
    begin
      s := frmFrame.lstCIRNLocations.Items[j];
      c := frmFrame.lstCIRNLocations.checked[j];
      if piece(s, '^', 1) = aSiteID then
        begin
          frmFrame.lstCIRNLocations.Items[j] := pieces(s, '^', 1, 3) + '^' + aStatus;
          frmFrame.lstCIRNLocations.checked[j] := c;
        end;
    end;
  uUpdateStat := false;
end;

function TfrmLabs.AllowContextChange(var WhyNot: string): Boolean;
var
  i: integer;
begin
  Result := inherited AllowContextChange(WhyNot);  // sets result = true
  if Timer1.Enabled = true then
    case BOOLCHAR[frmFrame.CCOWContextChanging] of
      '1': begin
             WhyNot := 'A remote data query in progress will be aborted.';
             Result := False;
           end;
      '0': if WhyNot = 'COMMIT' then
             begin
               with RemoteSites.SiteList do for i := 0 to Count - 1 do
                 if TRemoteSite(Items[i]).Selected then
                 if Length(TRemoteSite(Items[i]).LabRemoteHandle) > 0 then
                   begin
                     TRemoteSite(Items[i]).ReportClear;
                     TRemoteSite(Items[i]).LabQueryStatus := '-1^Aborted';
                     TabControl1.OnChange(nil);
                   end;
               Timer1.Enabled := false;
               Result := True;
             end;
    end;
end;

procedure TfrmLabs.ClearPtData;
begin
  inherited ClearPtData;
  Timer1.Enabled := False;
  memLab.Lines.Clear;
  uLabLocalReportData.Clear;
  uLabRemoteReportData.Clear;
  TabControl1.Tabs.Clear;
  TabControl1.Visible := false;
  tmpGrid.Clear;
  with grdLab do
  begin
    RowCount := 1;
    ColCount := 1;
    Cells[0, 0] := '';
  end;
end;

procedure TfrmLabs.DisplayPage;
begin
  inherited DisplayPage;
  frmFrame.mnuFilePrint.Tag := CT_LABS;
  frmFrame.mnuFilePrint.Enabled := True;
  frmFrame.mnuFilePrintSetup.Enabled := True;
  memLab.SelStart := 0;
  uHTMLPatient := '<DIV align left>'
                  + '<TABLE width="75%" border="0" cellspacing="0" cellpadding="1">'
                  + '<TR valign="bottom" align="left">'
                  + '<TD nowrap><B>Patient: ' + Patient.Name + '</B></TD>'
                  + '<TD nowrap><B>' + Patient.SSN + '</B></TD>'
                  + '<TD nowrap><B>Age: ' + IntToStr(Patient.Age) + '</B></TD>'
                  + '</TR></TABLE></DIV><HR>';
                  //the preferred method would be to use headers and footers
                  //so this is just an interim solution.
  if InitPage then
  begin
    ListLabReports(lstReports.Items);
  end;
  if InitPatient and not (CallingContext = CC_NOTIFICATION) then
  begin
    if Patient.Inpatient then lstDates.ItemIndex := 2 else lstDates.ItemIndex := 5;
    lstReports.ItemIndex := 0;
    lstReportsClick(self);
  end;
  case CallingContext of
    CC_INIT_PATIENT:  if not InitPatient then
      begin
        if Patient.Inpatient then lstDates.ItemIndex := 2 else lstDates.ItemIndex := 5;
        lstReports.ItemIndex := 0;
        lstReportsClick(self);
      end;
    CC_NOTIFICATION:  ProcessNotifications;
  end;
end;

procedure TfrmLabs.SetFontSize(NewFontSize: Integer);
begin
  inherited SetFontSize(NewFontSize);
  FormResize(self);
end;

procedure TfrmLabs.DisplayHeading;
begin
  with lblHeading do
  begin
   Caption := 'Laboratory Results - ' + lstReports.DisplayText[lstReports.ItemIndex];
   if lstDates.Visible then
     Caption := Caption + ' - ' + lstDates.DisplayText[lstDates.ItemIndex];
  end;
end;

procedure TfrmLabs.AlignList;
begin
  lblReports.Top := 0;
  lstReports.Top := lblReports.Height;
  lstDates.Height := pnlLeft.Height div 3 - (lblDates.Height div 2);
  lstDates.Top := pnlLeft.Height - lstDates.Height;
  lblDates.Top := lstDates.Top - lblDates.Height;
  pnlOtherTests.Top := lblDates.Top - pnlOtherTests.Height;
  lstHeaders.Height := pnlLeft.Height div 3 - (lblHeaders.Height * 3);
  lstHeaders.Top := lblDates.Top - lstHeaders.Height;
  lblHeaders.Top := lstHeaders.Top - lblHeaders.Height;
  lstReports.Repaint;
  lstDates.Repaint;
  lstHeaders.Repaint;
end;

procedure TfrmLabs.lstReportsClick(Sender: TObject);
begin
  ExtlstReportsClick(Sender, false);
end;

procedure TfrmLabs.ExtlstReportsClick(Sender: TObject; Ext: boolean);
var
  i,iCat: integer;
  Rpt: string;
begin
  inherited;
  uRemoteCount := 0;
  Timer1.Enabled := False;
  Rpt := lstReports.Items[lstReports.ItemIndex];
  uReportType := Piece(Rpt,'^',4);
  uReportRPC := UpperCase(Piece(Rpt,'^',6));
  if length(Piece(Rpt,'^',5)) > 0 then
    iCat := StrToInt(Piece(Rpt,'^',5))
  else
    iCat := 0;
  if uReportType = '' then uReportType := 'R';
  StatusText('');
  uLabLocalReportData.Clear;
  uLabRemoteReportData.Clear;
  lstHeaders.Clear;
  TabControl1.Visible := false;
  if Piece(Rpt,'^',3) = '1' then
    if TabControl1.Tabs.Count > 1 then
      TabControl1.Visible := true;
  for i := 0 to RemoteSites.SiteList.Count - 1 do
    TRemoteSite(RemoteSites.SiteList.Items[i]).LabClear;
  if uFrozen = True then memo1.visible := False;
  case lstReports.ItemIEN of
  1: begin                // Most Recent
       CommonComponentVisible(false,false,false,false,false,true,true,false,true);
       pnlButtons.Visible := true;
       pnlWorksheet.Visible := false;
       pnlGraph.Visible := false;
       memLab.Align := alBottom;
       memLab.Height := pnlLeft.Height div 5;
       grdLab.Align := alClient;
       memLab.Clear;
       if uReportType = 'H' then
         begin
           WebBrowser1.Navigate('about:blank');
           WebBrowser1.Align := alBottom;
           WebBrowser1.Height := pnlLeft.Height div 5;
           WebBrowser1.Visible := true;
           WebBrowser1.BringToFront;
           memLab.Visible := false;
         end
       else
        begin
          WebBrowser1.Visible := false;
          WebBrowser1.SendToBack;
          memLab.Visible := true;
          memLab.BringToFront;
        end;
       FormResize(self);
       cmdRecentClick(self);
       uPrevReportIndex := lstReports.ItemIndex;
     end;
  4: begin               // Interim for Selected Tests
       if uPrevReportIndex <> lstReports.ItemIndex then
       begin
         lstTests.Clear;
         lblSpecimen.Caption := '';
       end;
       if not Ext then SelectTests(Font.Size);
       if lstTests.Items.Count > 0 then
       begin
         CommonComponentVisible(false,false,true,true,true,false,false,false,true);
         memLab.Clear;
         chkBrowser;
         FormResize(self);
         RedrawActivate(memLab.Handle);
         lstDatesClick(self);
         if not Ext then cmdOtherTests.SetFocus;
         cmdOtherTests.Default := true;
       end
       else lstReports.ItemIndex := uPrevReportIndex;
     end;
  5: begin               // Worksheet
       if uPrevReportIndex <> lstReports.ItemIndex then
       begin
         lstTests.Clear;
         lblSpecimen.Caption := '';
       end;
       if not Ext then SelectTestGroups(Font.Size);
       if lstTests.Items.Count > 0 then
       begin
         CommonComponentVisible(false,false,true,true,true,true,true,false,false);
         chtChart.Visible := true;
         memLab.Visible := false;
         pnlButtons.Visible := false;
         pnlWorksheet.Visible := true;
         pnlGraph.Visible := false;
         lstTestGraph.Width := 97;
         ragCorG.ItemIndex := 0;
         FormResize(self);
         lblFooter.Caption := '  KEY: "L" = Abnormal Low, "H" = Abnormal High, "*" = Critical Value, "**" = Comments on Specimen';
         //chkZoom.Checked := false;
         //chkZoomClick(self);
         lstDatesClick(self);
         if not Ext then cmdOtherTests.SetFocus;
         cmdOtherTests.Default := true;
       end
       else lstReports.ItemIndex := uPrevReportIndex;
     end;
  6: begin               // Graph
        // do if graphing is activiated
       if uGraphingActivated then
       begin
         memLab.Clear;
         chkBrowser;
         FormResize(self);
         memLab.Align := alClient;
         CommonComponentVisible(false,false,false,false,false,false,false,false,false);
         RedrawActivate(memLab.Handle);
         StatusText('');
         memLab.Lines.Insert(0, ' ');
         memLab.Lines.Insert(1, 'Graphing activated');
         memLab.SelStart := 0;
         frmFrame.mnuToolsGraphingClick(self);  // make it just lab tests ??
         //lstReports.ItemIndex := uPrevReportIndex;
       end
       else  // otherwise, do lab graph
       begin
         if uPrevReportIndex <> lstReports.ItemIndex then
         begin
           lblSingleTest.Caption := '';
           lblSpecimen.Caption := '';
         end;
         if not Ext then SelectTest(Font.Size);
         if (length(lblSingleTest.Caption) > 2) and (length(lblSpecimen.Caption) > 2) then
         begin
           CommonComponentVisible(false,false,true,true,true,true,false,false,true);
           pnlChart.Visible := true;
           chtChart.Visible := true;
           pnlButtons.Visible := false;
           pnlWorksheet.Visible := false;
           pnlGraph.Visible := true;
           memLab.Height := pnlRight.Height div 5;
           memLab.Clear;
           if uReportType = 'H' then
           begin
             WebBrowser1.Visible := true;
             WebBrowser1.Navigate('about:blank');
             WebBrowser1.Height := pnlRight.Height div 5;
             WebBrowser1.BringToFront;
             memLab.Visible := false;
           end
           else
           begin
             WebBrowser1.Visible := false;
             WebBrowser1.SendToBack;
             memLab.Visible := true;
             memLab.BringToFront;
           end;
           lstTestGraph.Items.Clear;
           lstTestGraph.Width := 0;
           FormResize(self);
           RedrawActivate(memLab.Handle);
           lblFooter.Caption := '';
           chkGraphZoom.Checked := false;
           chkGraphZoomClick(self);
           chkGraph3DClick(self);
           chkGraphValuesClick(self);
           lstDatesClick(self);
           if not Ext then cmdOtherTests.SetFocus;
           cmdOtherTests.Default := true;
         end
         else
           lstReports.ItemIndex := uPrevReportIndex;
       end;
     end
    else // case
    begin
      //added to deal with other reports from file 101.24
      memLab.Clear;
      chkBrowser;
      FormResize(self);
      memLab.Align := alClient;
      case iCat of
                    {Categories of reports:
                        0:Fixed
                        1:Fixed w/Dates
                        2:Fixed w/Headers
                        3:Fixed w/Dates & Headers
                        4:Specialized
                        5:Graphic}

        0: begin
            CommonComponentVisible(false,false,false,false,false,false,false,false,false);
            StatusText('Retrieving data...');
            GoRemote(uLabRemoteReportData,lstReports.ItemIEN,1,'',uReportRPC,'0','9999','1',0,0);
            TabControl1.OnChange(nil);
            Reports(uLabLocalReportData,Patient.DFN, Piece(Rpt,'^',1), '0', '9999', '1', 0, 0, uReportRPC);
            if TabControl1.TabIndex < 1 then
              QuickCopy(uLabLocalReportData,memLab);
            RedrawActivate(memLab.Handle);
            StatusText('');
            memLab.Lines.Insert(0,' ');
            memLab.Lines.Delete(0);
            memLab.SelStart := 0;
            if uReportType = 'R' then
            uHTMLDoc := HTML_PRE + uLabLocalReportData.Text + HTML_POST
            else
            uHTMLDoc := uHTMLPatient + uLabLocalReportData.Text;
            if WebBrowser1.Visible = true then WebBrowser1.Navigate('about:blank');
           end;
        1: begin
            CommonComponentVisible(false,false,false,true,true,false,false,false,false);
            memLab.Repaint;
            lstDatesClick(self);
           end;
        2: begin
            CommonComponentVisible(true,true,false,false,false,false,false,false,false);
            lstHeaders.Clear;
            StatusText('Retrieving data...');
            GoRemote(uLabRemoteReportData,lstReports.ItemIEN,1,'',uReportRPC,'0','9999','1',0,0);
            TabControl1.OnChange(nil);
            Reports(uLabLocalReportData,Patient.DFN, Piece(Rpt,'^',1), '0', '9999', '1', 0, 0, uReportRPC);
            if uLabLocalReportData.Count > 0 then
            begin
             TabControl1.OnChange(nil);
             if lstHeaders.Items.Count > 0 then lstHeaders.ItemIndex := 0;
            end;
            RedrawActivate(memLab.Handle);
            StatusText('');
            memLab.Lines.Insert(0,' ');
            memLab.Lines.Delete(0);
            if uReportType = 'R' then
             uHTMLDoc := HTML_PRE + uLabLocalReportData.Text + HTML_POST
            else
             uHTMLDoc := uHTMLPatient + uLabLocalReportData.Text;
            if WebBrowser1.Visible = true then WebBrowser1.Navigate('about:blank');
           end;
        3: begin
            CommonComponentVisible(true,true,false,true,true,false,false,false,true);
            lstDatesClick(self);
            memLab.Lines.Insert(0,' ');
            memLab.Lines.Delete(0);
           end;
      end;
    end;
  end;
  uPrevReportIndex := lstReports.ItemIndex;
  DisplayHeading;
end;

procedure TfrmLabs.lstHeadersClick(Sender: TObject);
var
  Current, Desired: integer;
begin
  inherited;
  if uFrozen = True then memo1.visible := False;
  Current := SendMessage(memLab.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
  Desired := lstHeaders.ItemIEN;
  SendMessage(memLab.Handle, EM_LINESCROLL, 0, Desired - Current - 1);
end;

procedure TfrmLabs.lstDatesClick(Sender: TObject);
var
  tmpList: TStringList;
  daysback: integer;
  date1, date2: TFMDateTime;
  today: TDateTime;
  i: integer;
  Rpt: string;
begin
  inherited;
  uRemoteCount := 0;
  if uFrozen = True then memo1.visible := False;
  Screen.Cursor := crHourGlass;
  DisplayHeading;
  uHTMLDoc := '';
  Rpt := lstReports.Items[lstReports.ItemIndex];
  uReportRPC := UpperCase(Piece(Rpt,'^',6));
  chkBrowser;
  if (lstDates.ItemID = 'S') then
  begin
    with calLabRange do
    begin
      if Execute then
        if Length(TextOfStart) > 0 then
          if Length(TextOfStop) > 0 then
            begin
              lstDates.ItemIndex := lstDates.Items.Add(RelativeStart + ';' +
                RelativeStop + U + TextOfStart + ' to ' + TextOfStop);
                DisplayHeading;
            end
          else
            lstDates.ItemIndex := -1
        else
          lstDates.ItemIndex := -1
      else
        lstDates.ItemIndex := -1;
    end;
  end;
  today := FMToDateTime(floattostr(FMToday));
  if lstDates.ItemIEN > 0 then
    begin
      daysback := lstDates.ItemIEN;
      date1 := FMToday;
      If daysback = 1 then
        date2 := DateTimeToFMDateTime(today)
      Else
        date2 := DateTimeToFMDateTime(today - daysback);
    end
  else
    BeginEndDates(date1,date2,daysback);
  date1 := date1 + 0.2359;
  uHTMLDoc := '';
  WebBrowser1.Navigate('about:blank');
  case lstReports.ItemIEN of
  21: begin                // Cumulative
       lstHeaders.Clear;
       memLab.Clear;
       uLabLocalReportData.Clear;
       uLabRemoteReportData.Clear;
       StatusText('Retrieving data for cumulative report...');
       GoRemote(uLabRemoteReportData,0,2,'',uReportRPC,'',IntToStr(daysback),'',date1,date2);
       TabControl1.OnChange(nil);
       Cumulative(uLabLocalReportData, Patient.DFN, daysback, date1, date2, uReportRPC);
       if uLabLocalReportData.Count > 0 then
         begin
           TabControl1.OnChange(nil);
           if lstHeaders.Items.Count > 0 then lstHeaders.ItemIndex := 0;
         end;
       memLab.Lines.Insert(0,' ');
       memLab.Lines.Delete(0);
     end;
  3: begin            // Interim
       memLab.Clear;
       uLabLocalReportData.Clear;
       uLabRemoteReportData.Clear;
       StatusText('Retrieving data for interim report...');
       GoRemote(uLabRemoteReportData,0,3,'',uReportRPC,'','','',date1,date2);
       TabControl1.OnChange(nil);
       Interim(uLabLocalReportData, Patient.DFN, date1, date2, uReportRPC);
       if uLabLocalReportData.Count < 1 then
         uLabLocalReportData.Add('<No results for this date range.>');
       if TabControl1.TabIndex < 1 then
         QuickCopy(uLabLocalReportData,memLab);
       memLab.Lines.Insert(0,' ');
       memLab.Lines.Delete(0);
       memLab.SelStart := 0;
     end;
  4: begin            // Interim for Selected Tests
       memLab.Clear;
       uLabLocalReportData.Clear;
       uLabRemoteReportData.Clear;
       try
         StatusText('Retrieving data for selected tests...');
         uLabLocalReportData.Assign(InterimSelect(Patient.DFN, date1, date2, lstTests.Items));
         if uLabLocalReportData.Count > 0 then
           QuickCopy(uLabLocalReportData,memLab)
         else
           memLab.Lines.Add('<No results for selected tests in this date range.>');
         memLab.SelStart := 0;
       finally
         //tmpList.Free;
       end;
     end;
  5: begin            // Worksheet
       chtChart.BottomAxis.Automatic := true;
       chkZoom.Checked := false;
       //chkZoomClick(self);
       chkAbnormals.Checked := false;
       memLab.Clear;
       uLabLocalReportData.Clear;
       uLabRemoteReportData.Clear;
       grdLab.Align := alClient;
       StatusText('Retrieving data for worksheet...');
       tmpGrid.Assign(Worksheet(Patient.DFN, date1, date2,
         Piece(lblSpecimen.Caption, '^', 1), lstTests.Items));
       if ragHorV.ItemIndex = 0 then
         HGrid(tmpGrid)
       else
         VGrid(tmpGrid);
       GraphList(tmpGrid);
       GridComments(tmpGrid);
       ragCorGClick(self);
     end;
  6: begin            // Graph
       if not uGraphingActivated then
       begin
         chtChart.BottomAxis.Automatic := true;
         chkGraphZoom.Checked := false;
         chkGraphZoomClick(self);
         memLab.Clear;
         uLabLocalReportData.Clear;
         uLabRemoteReportData.Clear;
         tmpList := TStringList.Create;
         try
           StatusText('Retrieving data for graph...');
           tmpList.Assign(GetChart(Patient.DFN, date1, date2,
             Piece(lblSpecimen.Caption, '^', 1),
             Piece(lblSingleTest.Caption, '^', 1)));
           if tmpList.Count > 1 then
           begin
             chtChart.Visible := true;
             GraphChart(lblSingleTest.Caption, tmpList);
             chtChart.ZoomPercent(ZOOM_PERCENT);
             for i := strtoint(Piece(tmpList[0], '^', 1)) + 1 to tmpList.Count - 1
               do memLab.Lines.Add(tmpList[i]);
             if memLab.Lines.Count < 2 then
               memLab.Lines.Add('<No comments on specimens.>');
             memLab.SelStart := 0;
             lblGraph.Visible := false;
           end
           else
           begin
             lblGraph.Left := chtChart.Left + ((chtChart.Width - lblGraph.Width) div 2);
             lblGraph.Top := 2;
             lblGraph.Visible := true;
             if Piece(lblSpecimen.Caption, '^', 1) = '0' then
               pnlChart.Caption := '<No results can be graphed for ' +
                 Piece(lblSingleTest.Caption, '^', 2) + ' in this date range.> '
                 + 'Results may be available, but cannot be graphed. Please try an alternate view.'
             else
               pnlChart.Caption := '<No results can be graphed for ' +
                 Piece(lblSingleTest.Caption, '^', 2)
                 + ' (' + Piece(lblSpecimen.Caption, '^', 2) +
                   ') in this date range.> '
                 + 'Results may be available, but cannot be graphed. Please try an alternate view.';
             chtChart.Visible := false;
           end;
         finally
           tmpList.Free;
         end;
       end;
     end;
  9: begin            // Micro
       memLab.Clear;
       uLabLocalReportData.Clear;
       uLabRemoteReportData.Clear;
       StatusText('Retrieving microbiology data...');
       GoRemote(uLabRemoteReportData,0,4,'',uReportRPC,'','','',date1,date2);
       TabControl1.OnChange(nil);
       Micro(uLabLocalReportData, Patient.DFN, date1, date2, uReportRPC);
       if uLabLocalReportData.Count < 1 then
         uLabLocalReportData.Add('<No microbiology results for this date range.>');
       if TabControl1.TabIndex < 1 then
         QuickCopy(uLabLocalReportData,memLab);
       memLab.Lines.Insert(0,' ');
       memLab.Lines.Delete(0);
       memLab.SelStart := 0;
     end;
  10: begin           // Lab Status
       memLab.Clear;
       uLabLocalReportData.Clear;
       uLabRemoteReportData.Clear;
       StatusText('Retrieving lab status data...');
       GoRemote(uLabRemoteReportData,9,1,'',uReportRPC,'',IntToStr(daysback),'',date1,date2);
       TabControl1.OnChange(nil);
       Reports(uLabLocalReportData,Patient.DFN, '9', '', IntToStr(daysback),'',
         date1, date2, uReportRPC);
       if uLabLocalReportData.Count < 1 then
         uLabLocalReportData.Add('<No laboratory orders for this date range.>');
       if TabControl1.TabIndex < 1 then
         QuickCopy(uLabLocalReportData,memLab);
       memLab.Lines.Insert(0,' ');
       memLab.Lines.Delete(0);
       memLab.SelStart := 0;
      end;
  else begin          //Anything Else
         lstHeaders.Clear;
         memLab.Clear;
         uLabLocalReportData.Clear;
         uLabRemoteReportData.Clear;
         StatusText('Retrieving lab data...');
         GoRemote(uLabRemoteReportData, StrToInt(Piece(Rpt,'^',1)), 1, '',
           uReportRPC, '', IntToStr(daysback), '', date1, date2);
         TabControl1.OnChange(nil);
         Reports(uLabLocalReportData,Patient.DFN, Piece(Rpt,'^',1), '',
           IntToStr(daysback), '', date1, date2, uReportRPC);
         if uLabLocalReportData.Count < 1 then
           uLabLocalReportData.Add('<No data for this date range.>');
         if TabControl1.TabIndex < 1 then
           QuickCopy(uLabLocalReportData,memLab);
         memLab.Lines.Insert(0,' ');
         memLab.Lines.Delete(0);
         memLab.SelStart := 0;
       end;
  end;
  if uReportType = 'R' then
    uHTMLDoc := HTML_PRE + uLabLocalReportData.Text + HTML_POST
  else
    uHTMLDoc := uHTMLPatient + uLabLocalReportData.Text;
  Screen.Cursor := crDefault;
  StatusText('');
end;

procedure TfrmLabs.cmdOtherTestsClick(Sender: TObject);
begin
  inherited;
  lstReportsClick(self);
end;

procedure TfrmLabs.GraphList(griddata: TStrings);
var
  i, j: integer;
  ok: boolean;
  testname, testnum, testnum1, line: string;
begin
  lstTestGraph.Clear;
  for i := 0 to lstTests.Items.Count - 1 do
  begin
    testnum := Piece(lstTests.Items[i], '^', 1);
    testname := Piece(lstTests.Items[i], '^', 2);
    ok := false;
    for j := strtoint(Piece(griddata[0], '^', 4)) + 1 to strtointdef(Piece(griddata[0], '^', 5), 0) do
    begin
      testnum1 := Piece(griddata[j - 1], '^', 1);
      if testnum1 = testnum then
      begin
        ok := true;
        line := testnum + '^' + testname + ' (' + MixedCase(Piece(griddata[j - 1], '^', 2)) + ')^';
        line := line + Pieces(griddata[j - 1], '^', 3, 6);
        lstTestGraph.Items.Add(line);
      end;
    end;
    if not ok then lstTestGraph.Items.Add(lstTests.Items[i]);
  end;
end;

procedure TfrmLabs.HGrid(griddata: TStrings);
var
  testcnt, datecnt, datacnt, linecnt, offset, x, y, i: integer;
begin
  offset := 0;
  testcnt := strtoint(Piece(griddata[offset], '^', 1));
  datecnt := strtoint(Piece(griddata[offset], '^', 2));
  datacnt := strtoint(Piece(griddata[offset], '^', 3));
  linecnt := testcnt + datecnt + datacnt;
  if chkAbnormals.Checked and (linecnt > 0) then
  begin
    offset := linecnt + 1;
    testcnt := strtoint(Piece(griddata[offset], '^', 1));
    datecnt := strtoint(Piece(griddata[offset], '^', 2));
    datacnt := strtoint(Piece(griddata[offset], '^', 3));
    linecnt := testcnt + datecnt + datacnt;
  end;
  with grdLab do
  begin
    if testcnt = 0 then ColCount := 3 else ColCount := testcnt + 2;
    if datecnt = 0 then RowCount := 2 else RowCount := datecnt + 1;
    DefaultColWidth := ResizeWidth( BaseFont, MainFont, 60);
    ColWidths[0] := ResizeWidth( BaseFont, MainFont, 80);
    FixedCols := 2;
    FixedRows := 1;
    for y := 0 to RowCount - 1 do
      for x := 0 to ColCount - 1 do
        Cells[x, y] := '';
    Cells[0, 0] := 'Date/Time';
    Cells[1, 0] := 'Specimen';
    for i := 1 to testcnt do
    begin
      Cells[i + 1, 0] := Piece(griddata[i + offset], '^', 3);
    end;
    if datecnt = 0 then
    begin
      Cells[0, 1] := 'no results';
      for x := 1 to ColCount - 1 do
        Cells[x, 1] := '';
    end;
    for i := testcnt + 1 to testcnt + datecnt do
    begin
      Cells[0, i - testcnt] := FormatFMDateTime('mm/dd/yy hh:nn',MakeFMDateTime(Piece(griddata[i + offset], '^', 2)));
      Cells[1, i - testcnt] := MixedCase(Piece(griddata[i + offset], '^', 4)) + '  ' + Piece(griddata[i + offset], '^', 5);
    end;
    for i := testcnt + datecnt + 1 to linecnt do
    begin
      y := strtoint(Piece(griddata[i + offset], '^', 1));
      x := strtoint(Piece(griddata[i + offset], '^', 2)) + 1;
      Cells[x, y]  := Piece(griddata[i + offset], '^', 3) + ' ' + Piece(griddata[i + offset], '^', 4);
    end;
  end;
end;

procedure TfrmLabs.VGrid(griddata: TStrings);
var
  testcnt, datecnt, datacnt, linecnt, offset, x, y, i: integer;
begin
  offset := 0;
  testcnt := strtoint(Piece(griddata[offset], '^', 1));
  datecnt := strtoint(Piece(griddata[offset], '^', 2));
  datacnt := strtoint(Piece(griddata[offset], '^', 3));
  linecnt := testcnt + datecnt + datacnt;
  if chkAbnormals.Checked and (linecnt > 0) then
  begin
    offset := linecnt + 1;
    testcnt := strtoint(Piece(griddata[offset], '^', 1));
    datecnt := strtoint(Piece(griddata[offset], '^', 2));
    datacnt := strtoint(Piece(griddata[offset], '^', 3));
    linecnt := testcnt + datecnt + datacnt;
  end;
  with grdLab do
  begin
    if datecnt = 0 then ColCount := 2 else ColCount := datecnt + 1;
    if testcnt = 0 then RowCount := 3 else RowCount := testcnt + 2;
    DefaultColWidth := ResizeWidth( BaseFont, MainFont, 80);
    ColWidths[0] := ResizeWidth( BaseFont, MainFont, 60);
    FixedCols := 1;
    FixedRows := 2;
    for y := 0 to RowCount - 1 do
      for x := 0 to ColCount - 1 do
        Cells[x, y] := '';
    Cells[0, 0] := 'Date/Time';
    Cells[0, 1] := 'Specimen';
    for i := 1 to testcnt do
    begin
      Cells[0, i + 1] := Piece(griddata[i + offset], '^', 3);
    end;
    if datecnt = 0 then
    begin
      Cells[1, 0] := 'no results';
      for x := 1 to RowCount - 1 do
        Cells[x, 1] := '';
    end;
    for i := testcnt + 1 to testcnt + datecnt do
    begin
      Cells[i - testcnt, 0] := FormatFMDateTime('mm/dd/yy hh:nn',MakeFMDateTime(Piece(griddata[i + offset], '^', 2)));
      Cells[i - testcnt, 1] := MixedCase(Piece(griddata[i + offset], '^', 4));
    end;
    for i := testcnt + datecnt + 1 to linecnt do
    begin
      x := strtoint(Piece(griddata[i + offset], '^', 1));
      y := strtoint(Piece(griddata[i + offset], '^', 2)) + 1;
      Cells[x, y]  := Piece(griddata[i + offset], '^', 3) + ' ' + Piece(griddata[i + offset], '^', 4);
    end;
  end;
end;

procedure TfrmLabs.GridComments(aitems: TStrings);
var
  i, start: integer;
begin
  start := strtointdef(Piece(aitems[0], '^', 5), 1);
  memLab.Clear;
  uLabLocalReportData.Clear;
  uLabRemoteReportData.Clear;
  for i := start to aitems.Count - 1 do
    memLab.Lines.Add(aitems[i]);
  if (memLab.Lines.Count = 0) and (aitems.Count > 1) then
    memLab.Lines.Add('<No comments on specimens.>');
  memLab.SelStart := 0;
end;

procedure TfrmLabs.FormDestroy(Sender: TObject);
begin
  inherited;
  tmpGrid.free;
  uLabLocalReportData.Free;
  uLabRemoteReportData.Free;
  TAccessibleStringGrid.UnwrapControl(grdLab);
end;

procedure TfrmLabs.FillGrid(agrid: TStringGrid; aitems: TStrings);
var
  testcnt, x, y, i: integer;
begin
  testcnt := strtoint(Piece(aitems[0], '^', 1));
  with agrid do
  begin
    if testcnt = 0 then RowCount := 3 else RowCount := testcnt + 1;
    ColCount := 5;
    DefaultColWidth := agrid.Width div ColCount - 2;
    ColWidths[0] := agrid.Width div 4;
    ColWidths[4] := agrid.Width div 4;
    ColWidths[2] := agrid.Width div 9;
    ColWidths[3] := agrid.Width div 6;
    ColWidths[1] := agrid.Width - ColWidths[0] - ColWidths[2] - ColWidths[3] - ColWidths[4] - 8;
    FixedCols := 0;
    FixedRows := 1;
    for y := 0 to RowCount - 1 do
      for x := 0 to ColCount - 1 do
        Cells[x, y] := '';
    Cells[0, 0] := 'Test';
    Cells[1, 0] := 'Result';
    Cells[2, 0] := 'Flag';
    Cells[3, 0] := 'Units';
    Cells[4, 0] := 'Ref Range';
    for i := 1 to testcnt do
    begin
      Cells[0, i] := Piece(aitems[i], '^', 2);
      Cells[1, i] := Piece(aitems[i], '^', 3);
      Cells[2, i] := Piece(aitems[i], '^', 4);
      Cells[3, i] := Piece(aitems[i], '^', 5);
      Cells[4, i] := Piece(aitems[i], '^', 6);
    end;
  end;
end;

procedure TfrmLabs.FillComments(amemo: TRichEdit; aitems:TStrings);
var
  testcnt, i: integer;
  specimen, accession, provider: string;
begin
  amemo.Lines.Clear;
  specimen := Piece(aitems[0], '^', 5);
  accession := Piece(aitems[0], '^', 6);
  provider := Piece(aitems[0], '^', 7);
  amemo.Lines.Add('Specimen: ' + specimen + ';    Accession: ' + accession + ';    Provider: ' + provider);
  testcnt := strtoint(Piece(aitems[0], '^', 1));
  for i := testcnt + 1 to aitems.Count - 1 do
    amemo.Lines.Add(aitems[i]);
  amemo.SelStart := 0;
end;

procedure TfrmLabs.GetInterimGrid(adatetime: TFMDateTime; direction: integer);
var
  tmpList: TStringList;
  nexton, prevon: boolean;
  newest, oldest: string;
begin
  tmpList := TStringList.Create;
  GetNewestOldest(Patient.DFN, newest, oldest);  //****** PATCH
  nexton := true;
  prevon := true;
  try
    tmpList.Assign(InterimGrid(Patient.DFN, adatetime, direction, uFormat));
    if tmpList.Count > 0 then
    begin
      lblDateFloat.Caption := Piece(tmpList[0], '^', 3);
      uFormat := strtointdef(Piece(tmpList[0], '^', 9), 1);
      if length(lblDateFloat.Caption) > 0 then
        lblDate.Caption := FormatFMDateTime('MMM DD, YYYY hh:nn', strtofloat(lblDateFloat.Caption));
      if length(lblDateFloat.Caption) < 1
      then
      begin
        lblDateFloat.Caption := FloatToStr(adatetime);
        nexton := false;
      end
      else
      begin
        nexton := lblDateFloat.Caption <> newest;
        prevon := lblDateFloat.Caption <> oldest;
      end;
      if (not nexton) and (uFormat = 3) then
        nexton := true;
      if (not prevon) and (uFormat = 2) then
        prevon := true;
    end
    else
    begin
      lblDateFloat.Caption := '';
      lblDate.Caption := '';
    end;
    cmdNext.Enabled := nexton;
    cmdRecent.Enabled := nexton;
    lblNext.Enabled := nexton;
    lblRecent.Enabled := nexton;
    cmdPrev.Enabled := prevon;
    cmdOld.Enabled := prevon;
    lblPrev.Enabled := prevon;
    lblOld.Enabled := prevon;
    if cmdOld.Enabled and cmdRecent.Enabled then
      lblMostRecent.Visible := false
    else
    begin
      lblMostRecent.Visible := true;
      if (not cmdOld.Enabled) and (not cmdRecent.Enabled) then
        lblMostRecent.Caption := 'No Lab Results'
      else if cmdOld.Enabled then
        lblMostRecent.Caption := 'Most Recent Lab Result'
      else
        lblMostRecent.Caption := 'Oldest Lab Result';
    end;
    if tmpList.Count > 0 then
    begin
      if Piece(tmpList[0], '^', 2) = 'CH' then
      begin
        FillGrid(grdLab, tmpList);
        FillComments(memLab, tmpList);
        memLab.Align := alBottom;
        memLab.Height := pnlLeft.Height div 5;
        grdLab.Align := alClient;
        grdLab.Visible := true;
        memLab.Visible := true;
        pnlFooter.Height := lblHeading.Height + 5;
        pnlFooter.Top := pnlLeft.Height - pnlFooter.Height;
        lblFooter.Caption := '  KEY: "L" = Abnormal Low, "H" = Abnormal High, "*" = Critical Value';
        lblFooter.Align := alTop;
        pnlFooter.Visible := true;
        if (grdLab.VisibleRowCount + 1) < grdLab.RowCount then
          grdLab.ColWidths[4] := grdLab.ColWidths[4] - 18;
        memLab.Repaint;
      end;
      if Piece(tmpList[0], '^', 2) = 'MI' then
      begin
        tmpList.Delete(0);
        memLab.Lines.Assign(tmpList);
        memLab.SelStart := 0;
        grdLab.Visible := false;
        pnlFooter.Visible := false;
        memLab.Align := alClient;
      end;
    end
    else
    begin
      grdLab.Visible := false;
      pnlFooter.Visible := false;
      memLab.Align := alClient;
    end;
  finally
    tmpList.Free;
  end;
end;

procedure TfrmLabs.cmdNextClick(Sender: TObject);
var
  HadFocus: boolean;
begin
  inherited;
  HadFocus := Screen.ActiveControl = cmdNext;
  StatusText('Retrieving next lab data...');
  if Length(lblDateFloat.Caption) > 0 then GetInterimGrid(strtofloat(lblDateFloat.Caption), -1);
  StatusText('');
  if HadFocus then begin
    if cmdNext.Enabled then cmdNext.SetFocus
    else if cmdPrev.Enabled then cmdPrev.SetFocus
    else lstReports.SetFocus;
  end;
end;

procedure TfrmLabs.cmdPrevClick(Sender: TObject);
var
  HadFocus: boolean;
begin
  inherited;
  HadFocus := Screen.ActiveControl = cmdPrev;
  StatusText('Retrieving previous lab data...');
  if Length(lblDateFloat.Caption) > 0 then GetInterimGrid(strtofloat(lblDateFloat.Caption), 1);
  StatusText('');
  if HadFocus then begin
    if cmdPrev.Enabled then cmdPrev.SetFocus
    else if cmdNext.Enabled then cmdNext.SetFocus
    else lstReports.SetFocus;
  end;
end;

procedure TfrmLabs.WorksheetChart(test: string; aitems: TStrings);

function OkFloatValue(value: string): boolean;
var
  i, j: integer;
  first, second: string;
begin
  Result := false;
  i := strtointdef(value, -99999);
  if i <> -99999 then Result := true
  else if pos('.', Copy(Value, Pos('.', Value) + 1, Length(Value))) > 0 then Result := false
  else
  begin
    first := Piece(value, '.', 1);
    second := Piece(value, '.', 2);
    if length(second) > 0 then
    begin
      i := strtointdef(first, -99999);
      j := strtointdef(second, -99999);
      if (i <> -99999) and (j <> -99999) then Result := true;
    end
    else
    begin
      i :=strtointdef(first, -99999);
      if i <> -99999 then Result := true;
    end;
  end;
end;

var
  datevalue, oldstart, oldend: TDateTime;
  labvalue: double;
  i, numtest, numcol, numvalues, valuecount: integer;
  high, low, start, stop, numspec, value, testcheck, units, specimen, testnum, testorder: string;
begin
  if chkZoom.Checked and chtChart.Visible then
  begin
    oldstart := chtChart.BottomAxis.Minimum;
    oldend := chtChart.BottomAxis.Maximum;
    chtChart.UndoZoom;
    chtChart.BottomAxis.Automatic := false;
    chtChart.BottomAxis.Minimum := oldstart;
    chtChart.BottomAxis.Maximum := oldend;
  end
  else
  begin
    chtChart.BottomAxis.Automatic := true;
  end;
  chtChart.Visible := true;
  valuecount := 0;
  testnum := Piece(test, '^', 1);
  specimen := Piece(test, '^', 3);
  units := Piece(test, '^', 4);
  low := Piece(test, '^', 5);
  high := Piece(test, '^', 6);
  numtest := strtoint(Piece(aitems[0], '^', 1));
  numcol := strtoint(Piece(aitems[0], '^', 2));
  numvalues := strtoint(Piece(aitems[0], '^', 3));
  serHigh.Clear;  serLow.Clear;  serTest.Clear;
  if numtest > 0 then
  begin
  for i := 1 to numtest do
    if testnum = Piece(aitems[i], '^', 2) then
    begin
      testorder := inttostr(i);
      break;
    end;
  GetStartStop(start, stop, aitems);
  if OKFloatValue(high) then
  begin
    serHigh.AddXY(FMToDateTime(start), strtofloat(high), '',clTeeColor);
    serHigh.AddXY(FMToDateTime(stop), strtofloat(high), '',clTeeColor);
  end;
  if OKFloatValue(low) then
  begin
    serLow.AddXY(FMToDateTime(start), strtofloat(low), '',clTeeColor);
    serLow.AddXY(FMToDateTime(stop), strtofloat(low), '',clTeeColor);
  end;
  numspec := Piece(specimen, '^', 1);
  chtChart.Legend.Color := grdLab.Color;
  chtChart.Title.Font.Size := MainFontSize;
  chtChart.LeftAxis.Title.Caption := units;
  serTest.Title := Piece(test, '^', 2);
  serHigh.Title := 'Ref High ' + high;
  serLow.Title := 'Ref Low ' + low;
  testcheck := testorder;
  for i := numtest + numcol + 1 to numtest + numcol + numvalues do
    if Piece(aitems[i], '^', 2) = testcheck then
      if Piece(aitems[numtest + strtoint(Piece(aitems[i], '^', 1))], '^', 3) = numspec then
      begin
        value := Piece(aitems[i], '^', 3);
        if OkFloatValue(value) then
        begin
          labvalue := strtofloat(value);
          datevalue := FMToDateTime(Piece(aitems[numtest + strtoint(Piece(aitems[i], '^', 1))], '^', 2));
          serTest.AddXY(datevalue, labvalue, '', clTeeColor);
          inc(valuecount);
        end;
      end;
  end;
  if valuecount = 0 then
  begin
    lblGraph.Left := chtChart.Left + ((chtChart.Width - lblGraph.Width) div 2);
    lblGraph.Top := 2;
    lblGraph.Visible := true;
    if length(Piece(specimen, '^', 2)) > 0 then
      pnlChart.Caption := '<No results can be graphed for ' + serTest.Title + ' in this date range.> '
    else
      pnlChart.Caption := '<No results can be graphed for ' + Piece(test, '^', 2) + ' in this date range.>';
    chtChart.Visible := false;
  end
  else
    lblGraph.Visible := false;
  if not chkZoom.Checked then
  begin
    chtChart.UndoZoom;
    chtChart.ZoomPercent(ZOOM_PERCENT);
  end;
end;

procedure TfrmLabs.GetStartStop(var start, stop: string; aitems: TStrings);
var
  numtest, numcol: integer;
begin
  numtest := strtoint(Piece(aitems[0], '^', 1));
  numcol := strtoint(Piece(aitems[0], '^', 2));
  start := Piece(aitems[numtest + 1], '^', 2);
  stop := Piece(aitems[numtest + numcol], '^', 2);
end;

procedure TfrmLabs.cmdRecentClick(Sender: TObject);
var
  HadFocus: boolean;
begin
  inherited;
  HadFocus := Screen.ActiveControl = cmdRecent;
  StatusText('Retrieving most recent lab data...');
  uFormat := 1;
  GetInterimGrid(FMToday + 0.2359, 1);
  StatusText('');
  if HadFocus and cmdPrev.Enabled then cmdPrev.SetFocus;
end;

procedure TfrmLabs.cmdOldClick(Sender: TObject);
var
  HadFocus: boolean;
begin
  inherited;
  HadFocus := Screen.ActiveControl = cmdOld;
  StatusText('Retrieving oldest lab data...');
  uFormat := 1;
  GetInterimGrid(2700101, -1);
  if HadFocus and cmdNext.Enabled then cmdNext.SetFocus;
  StatusText('');
end;

procedure TfrmLabs.FormResize(Sender: TObject);
begin
  inherited;
  AlignList;
  lblHeaders.Height := lblReports.Height;
  lblDates.Height := lblReports.Height;
  lblHeading.Height := lblReports.Height;
  pnlFooter.Height := lblReports.Height + 5;
  lblFooter.Height := lblReports.Height;
  case lstReports.ItemIEN of
  1: begin                // Most Recent
       pnlHeader.Align := alTop;
       memLab.Height := pnlLeft.Height div 5;
       memLab.Top := pnlLeft.Height - pnlFooter.Height - memLab.Height;
       memLab.Align := alBottom;
       grdLab.Align := alClient;
       if tmpGrid.Count > 0 then HGrid(tmpGrid);
       if (grdLab.VisibleRowCount + 1) < grdLab.RowCount then
         grdLab.ColWidths[4] := grdLab.ColWidths[4] - 18;
       pnlFooter.Top := pnlLeft.Height - pnlFooter.Height;
       pnlFooter.Align := alBottom;
       memLab.Repaint;
     end;
  2: begin               // Cumulative
       pnlFooter.Top := pnlLeft.Height - pnlFooter.Height;
       pnlFooter.Align := alBottom;
       lblFooter.Align := alTop;
       memLab.Align := alClient;
       memLab.Repaint;
     end;
  3: begin               // Interim
       pnlFooter.Top := pnlLeft.Height - pnlFooter.Height;
       pnlFooter.Align := alBottom;
       lblFooter.Caption := '  KEY: "L" = Abnormal Low, "H" = Abnormal High, "*" = Critical Value';
       lblFooter.Align := alTop;
       memLab.Align := alClient;
       memLab.Repaint;
     end;
  4: begin               // Interim for Selected Tests
       pnlFooter.Top := pnlLeft.Height - pnlFooter.Height;
       pnlFooter.Align := alBottom;
       lblFooter.Caption := '  KEY: "L" = Abnormal Low, "H" = Abnormal High, "*" = Critical Value';
       lblFooter.Align := alTop;
       memLab.Align := alClient;
       memLab.Repaint;
     end;
  5: begin               // Worksheet
       pnlHeader.Align := alTop;
       grdLab.Align := alClient;
       ragCorGClick(self);
       pnlFooter.Top := pnlLeft.Height - pnlFooter.Height;
       pnlFooter.Align := alBottom;
     end;
  6: begin               // Graph
       if not uGraphingActivated then
       begin
         memLab.Height := pnlLeft.Height div 4;
         memLab.Align := alBottom;
         pnlChart.Top := pnlHeader.Height;
         pnlChart.Align := alClient;
         memLab.Height := pnlLeft.Height div 4;
         memLab.Align := alBottom;
         memLab.Repaint;
       end;
     end;
  7: begin               // Anatomic Path
       memLab.Repaint;
     end;
  8: begin               // Blood Bank
       memLab.Repaint;
     end;
  9: begin               // Microbiology
       memLab.Repaint;
     end;
  10: begin              // Lab Status
        memLab.Repaint;
      end;
  end;
end;

procedure TfrmLabs.pnlRightResize(Sender: TObject);
begin
  inherited;
  pnlRight.Refresh;
  lblFooter.Height := lblHeading.Height;
end;

function TfrmLabs.FMToDateTime(FMDateTime: string): TDateTime;
var
  x, Year: string;
begin
  { Note: TDateTime cannot store month only or year only dates }
  x := FMDateTime + '0000000';
  if Length(x) > 12 then x := Copy(x, 1, 12);
  if StrToInt(Copy(x, 9, 4)) > 2359 then x := Copy(x,1,7) + '.2359';
  Year := IntToStr(17 + StrToInt(Copy(x,1,1))) + Copy(x,2,2);
  x := Copy(x,4,2) + '/' + Copy(x,6,2) + '/' + Year + ' ' + Copy(x,9,2) + ':' + Copy(x,11,2);
  Result := StrToDateTime(x);
end;

procedure TfrmLabs.chkValuesClick(Sender: TObject);
begin
  inherited;
  serTest.Marks.Visible := chkValues.Checked;
end;

procedure TfrmLabs.chk3DClick(Sender: TObject);
begin
  inherited;
  chtChart.View3D := chk3D.Checked;
end;

procedure TfrmLabs.GraphChart(test: string; aitems: TStrings);
var
  datevalue: TDateTime;
  labvalue: double;
  i, numvalues: integer;
  high, low, start, stop, value, units, specimen: string;
begin
  numvalues := strtoint(Piece(aitems[0], '^', 1));
  specimen := Piece(aitems[0], '^', 2);
  high := Piece(aitems[0], '^', 3);
  low := Piece(aitems[0], '^', 4);
  units := Piece(aitems[0], '^', 5);
  if numvalues > 0 then
  begin
    start := Piece(aitems[1], '^', 1);
    stop := Piece(aitems[numvalues], '^', 1);
    chtChart.Legend.Color := grdLab.Color;
    serHigh.Clear;  serLow.Clear;  serTest.Clear;
    if high <> '' then
    begin
      serHigh.AddXY(FMToDateTime(start), strtofloat(high), '',clTeeColor);
      serHigh.AddXY(FMToDateTime(stop), strtofloat(high), '',clTeeColor);
    end;
    if low <> '' then
    begin
      serLow.AddXY(FMToDateTime(start), strtofloat(low), '',clTeeColor);
      serLow.AddXY(FMToDateTime(stop), strtofloat(low), '',clTeeColor);
    end;
    //chtChart.Title.Text.Strings[0] := Piece(test, '^', 2) + '  (' + MixedCase(specimen) + ')';
    //chtChart.Title.Font.Size := 12;
    chtChart.LeftAxis.Title.Caption := units;
    serTest.Title := Piece(test, '^', 2) + '  (' + MixedCase(specimen) + ')';
    serHigh.Title := 'Ref High ' + high;
    serLow.Title := 'Ref Low ' + low;
    for i := 1 to numvalues do
    begin
      value := Piece(aitems[i], '^', 2);
      labvalue := strtofloat(value);
      datevalue := FMToDateTime(Piece(aitems[i], '^', 1));
      serTest.AddXY(datevalue, labvalue, '', clTeeColor);
    end;
  end;
end;

procedure TfrmLabs.ragHorVClick(Sender: TObject);
begin
  inherited;
  if ragHorV.ItemIndex = 0 then HGrid(tmpGrid) else VGrid(tmpGrid);
end;

procedure TfrmLabs.ragCorGClick(Sender: TObject);
begin
  inherited;
  if ragCorG.ItemIndex = 0 then      // comments
  begin
    chkZoom.Enabled := false;
    chk3D.Enabled := false;
    chkValues.Enabled := false;
    pnlChart.Visible:= false;
    grdLab.Align := alNone;
    memLab.Height := pnlRight.Height div 6;
    memLab.Top := pnlRight.Height - pnlFooter.Height - memLab.Height;
    memLab.Align := alBottom;
    memLab.Visible := true;
    grdLab.Align := alClient;
  end
  else                             // graph
  begin
    chkZoom.Enabled := true;
    chk3D.Enabled := true;
    chkValues.Enabled := true;
    chk3DClick(self);
    chkValuesClick(self);
    memLab.Visible := false;
    grdLab.Align := alNone;
    //pnlChart.Height := pnlLeft.Height - pnlOtherTests.Top - pnlFooter.Height;
    //pnlChart.Top := pnlOtherTests.Top;
    pnlChart.Height :=  pnlRight.Height div 2;
    pnlChart.Top := pnlRight.Height - pnlFooter.Height - pnlChart.Height;
    pnlChart.Align := alBottom;
    pnlChart.Visible := true;
    grdLab.Align := alClient;
    if lstTestGraph.Items.Count > 0 then
    begin
      if lstTestGraph.ItemIndex < 0 then
        lstTestGraph.ItemIndex := 0;
      lstTestGraphClick(self);
    end;
  end;
end;

procedure TfrmLabs.lstTestGraphClick(Sender: TObject);
begin
  inherited;
  WorksheetChart(lstTestGraph.Items[lstTestGraph.ItemIndex], tmpGrid);
end;


procedure TfrmLabs.chkGraphValuesClick(Sender: TObject);
begin
  inherited;
  serTest.Marks.Visible := chkGraphValues.Checked;
end;

procedure TfrmLabs.chkGraph3DClick(Sender: TObject);
begin
  inherited;
  chtChart.View3D := chkGraph3D.Checked;
end;

procedure TfrmLabs.chkGraphZoomClick(Sender: TObject);
begin
  inherited;
  chtChart.AllowZoom := chkGraphZoom.Checked;
  chtChart.AnimatedZoom := chkGraphZoom.Checked;
  lblGraphInfo.Caption := 'To Zoom, hold down the mouse button while dragging an area to be enlarged.';
  if chkGraphZoom.Checked then
    lblGraphInfo.Caption := lblGraphInfo.Caption + #13
                          + 'To Zoom Back drag to the upper left. You can also use the actions on the right mouse button.';
  lblGraphInfo.Visible := chkGraphZoom.Checked;
  if not chkGraphZoom.Checked then chtChart.UndoZoom;
end;

procedure TfrmLabs.GotoTop1Click(Sender: TObject);
begin
  inherited;
with memLab do
  begin
    SetFocus;
    SelStart :=0;
    SelLength :=0;
  end;
end;

procedure TfrmLabs.GotoBottom1Click(Sender: TObject);
var
  I,CharCount : Integer;
begin
  Inherited;
  CharCount :=0;
  with memLab do
  begin
    for I := 0 to lines.count-1 do
      CharCount := CharCount + Length(Lines[I]) + 2;
    SetFocus;
    SelStart := CharCount;
    SelLength :=0;
  end;
end;

procedure TfrmLabs.FreezeText1Click(Sender: TObject);
var
  Current, Desired : Longint;
  LineCount : Integer;
begin
  Inherited;
  If memLab.SelLength > 0 then begin
    Memo1.visible := true;
    Memo1.Text := memLab.SelText;
    If Memo1.Lines.Count <6 then
      LineCount := Memo1.Lines.Count + 1
    Else
      LineCount := 5;
    Memo1.Height := LineCount * frmLabs.Canvas.TextHeight(memLab.SelText);
    Current := SendMessage(memLab.handle, EM_GETFIRSTVISIBLELINE, 0, 0);
    Desired := SendMessage(memLab.handle, EM_LINEFROMCHAR,
               memLab.SelStart + memLab.SelLength ,0);
    SendMessage(memLab.Handle,EM_LINESCROLL, 0, Desired - Current);
    uFrozen := True;
  end;
end;

procedure TfrmLabs.UnfreezeText1Click(Sender: TObject);
begin
  Inherited;
  If uFrozen = True Then begin
    uFrozen := False;
    UnFreezeText1.Enabled := False;
    Memo1.Visible := False;
    Memo1.Text := '';
  end;
end;

procedure TfrmLabs.PopupMenu1Popup(Sender: TObject);
begin
 inherited;
  If Screen.ActiveControl.Name <> memLab.Name then
   begin
     memLab.SetFocus;
     memLab.SelStart := 0;
   end;
  If memLab.SelLength > 0 Then
    FreezeText1.Enabled := True
  Else
    FreezeText1.Enabled := False;
  If Memo1.Visible Then
    UnFreezeText1.Enabled := True;
  If memLab.SelStart > 0 then
    GotoTop1.Enabled := True
  Else
    GotoTop1.Enabled := False;
  If SendMessage(memLab.handle, EM_LINEFROMCHAR,
    memLab.SelStart,0) < memLab.Lines.Count then
    GotoBottom1.Enabled := True
  Else
    GotoBottom1.Enabled := False;
  case lstReports.ItemIEN of
    1: FreezeText1.Enabled := False;
    5: FreezeText1.Enabled := False;
    6: FreezeText1.Enabled := False;
  end;
end;

procedure TfrmLabs.ProcessNotifications;
var
  //AlertDate, CurrentDate: TFMDateTime;
  OrderIFN: string;
begin
  {uNewest := '';
  uOldest := '';    
  GetNewestOldest(Patient.DFN, uNewest, uOldest); }
  {AlertDate   := Trunc(StrToFMDateTime(Piece(Piece(Notifications.RecordID, U, 2), ';', 3)));
  CurrentDate := FMToday;
  lstReports.ItemIndex := 2;
  if AlertDate = CurrentDate then
    begin
      lstDates.ItemIndex   := 0;
      lstReports.ItemIndex := 0;
    end
  else if CurrentDate - AlertDate < 7  then lstDates.ItemIndex  := 2
  else if CurrentDate - AlertDate < 14 then lstDates.ItemIndex  := 3
  else if CurrentDate - AlertDate < 28 then lstDates.ItemIndex  := 4
  else                                      lstDates.ItemIndex  := 5;

  lstReportsClick(self); }

  OrderIFN                := Piece(Notifications.AlertData, '@', 1);
  if StrToIntDef(OrderIFN,0) > 0 then
   begin
    lstDates.ItemIndex      := -1;
    lstReports.ItemIndex    := -1;
    Memo1.Visible           := false;
    lblHeaders.Visible      := false;
    lstHeaders.Visible      := false;
    pnlOtherTests.Visible   := false;
    lblDates.Visible        := true;
    lstDates.Visible        := true;
    pnlHeader.Visible       := false;
    grdLab.Visible          := false;
    pnlChart.Visible        := false;
    WebBrowser1.Visible     := false;
    WebBrowser1.SendToBack;
    memLab.Visible          := true;
    memLab.BringToFront;
    pnlFooter.Visible       := true;
    memLab.Clear;
    uLabLocalReportData.Clear;
    uLabRemoteReportData.Clear;
    memLab.Align            := alClient;
    FormResize(self);
    memLab.Lines.Assign(ResultOrder(OrderIFN));
    memLab.SelStart := 0;
    memLab.Repaint;
    lblHeading.Caption      := Notifications.Text;
   end
   else
   begin
     if Patient.Inpatient then lstDates.ItemIndex := 2 else lstDates.ItemIndex := 5;
     lstReports.ItemIndex := 0;
     lstReportsClick(self);
   end;

  case Notifications.FollowUp of
    NF_LAB_RESULTS          :   Notifications.Delete;
    NF_ABNORMAL_LAB_RESULTS :   Notifications.Delete;
    NF_SITE_FLAGGED_RESULTS :   Notifications.Delete;
    NF_STAT_RESULTS         :   Notifications.Delete;
    NF_CRITICAL_LAB_RESULTS :   Notifications.Delete;
    NF_LAB_THRESHOLD_EXCEEDED : Notifications.Delete;
  end;
end;

procedure TfrmLabs.chkZoomClick(Sender: TObject);
begin
  inherited;
  chtChart.AllowZoom := chkZoom.Checked;
  chtChart.AnimatedZoom := chkZoom.Checked;
  if not chkZoom.Checked then
  begin
    chtChart.UndoZoom;
    chtChart.ZoomPercent(ZOOM_PERCENT);
  end;
end;

procedure TfrmLabs.chtChartUndoZoom(Sender: TObject);
begin
  inherited;
  chtChart.BottomAxis.Automatic := true;
end;

procedure TfrmLabs.popCopyClick(Sender: TObject);
begin
  inherited;
  chtChart.CopyToClipboardBitmap;
end;

procedure TfrmLabs.popChartPopup(Sender: TObject);
begin
  inherited;
  if pnlWorksheet.Visible then
  begin
    popValues.Checked := chkValues.Checked;
    pop3D.Checked := chk3D.Checked;
    popZoom.Checked := chkZoom.Checked;
  end
  else
  begin
    popValues.Checked := chkGraphValues.Checked;
    pop3D.Checked := chkGraph3D.Checked;
    popZoom.Checked := chkGraphZoom.Checked;
  end;
  popZoomBack.Enabled := popZoom.Checked and not chtChart.BottomAxis.Automatic;;
  if chtChart.Hint <> '' then
  begin
    popDetails.Caption := chtChart.Hint;
    popDetails.Enabled := true;
  end
  else
  begin
    popDetails.Caption := 'Details';
    popDetails.Enabled := false;
  end;
end;

procedure TfrmLabs.popValuesClick(Sender: TObject);
begin
  inherited;
  if pnlWorksheet.Visible then
  begin
    chkValues.Checked := not chkValues.Checked;
    chkValuesClick(self);
  end
  else
  begin
    chkGraphValues.Checked := not chkGraphValues.Checked;
    chkGraphValuesClick(self);
  end;
end;

procedure TfrmLabs.pop3DClick(Sender: TObject);
begin
  inherited;
  if pnlWorksheet.Visible then
  begin
    chk3D.Checked := not chk3D.Checked;
    chk3DClick(self);
  end
  else
  begin
    chkGraph3D.Checked := not chkGraph3D.Checked;
    chkGraph3DClick(self);
  end;
end;

procedure TfrmLabs.popZoomClick(Sender: TObject);
begin
  inherited;
  if pnlWorksheet.Visible then
  begin
    chkZoom.Checked := not chkZoom.Checked;
    chkZoomClick(self);
  end
  else
  begin
    chkGraphZoom.Checked := not chkGraphZoom.Checked;
    chkGraphZoomClick(self);
  end;
end;

procedure TfrmLabs.popZoomBackClick(Sender: TObject);
begin
  inherited;
  chtChart.UndoZoom;
end;

procedure TfrmLabs.chtChartMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  chtChart.Hint := '';
  chtChart.Tag := 0;
end;

procedure TfrmLabs.chtChartClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Series = serHigh then exit;
  if Series = serLow then exit;
  uDate1 := Series.XValue[ValueIndex];
  uDate2 := uDate1;
  chtChart.Hint := 'Details - Lab results for ' + FormatDateTime('dddd, mmmm d, yyyy', Series.XValue[ValueIndex]) + '...';
  chtChart.Tag := ValueIndex + 1;
  if Button <> mbRight then  popDetailsClick(self);
end;

procedure TfrmLabs.chtChartClickLegend(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  chtChart.Hint := 'Details - for ' + Piece(serTest.Title, '(', 1) + '...';
  chtChart.Tag := 0;
  if Button <> mbRight then  popDetailsClick(self);
end;

procedure TfrmLabs.popDetailsClick(Sender: TObject);
var
  tmpList: TStringList;
  date1, date2: TFMDateTime;
  strdate1, strdate2: string;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if chtChart.Tag > 0 then
  begin
    tmpList := TStringList.Create;
    try
      strdate1 := FormatDateTime('mm/dd/yyyy', uDate1);
      strdate2 := FormatDateTime('mm/dd/yyyy', uDate2);
      uDate1 := StrToDateTime(strdate1);
      uDate2 := StrToDateTime(strdate2);
      date1 := DateTimeToFMDateTime(uDate1 + 1);
      date2 := DateTimeToFMDateTime(uDate2);
      StatusText('Retrieving data for ' + FormatDateTime('dddd, mmmm d, yyyy', uDate2) + '...');
      Interim(tmpList, Patient.DFN, date1, date2,'ORWLRR INTERIM');
      ReportBox(tmpList, 'Lab results on ' + Patient.Name + ' for ' + FormatDateTime('dddd, mmmm d, yyyy', uDate2), True);
    finally
      tmplist.Free;
    end;
  end
  else
  begin
    date1 := DateTimeToFMDateTime(chtChart.BottomAxis.Maximum);
    date2 := DateTimeToFMDateTime(chtChart.BottomAxis.Minimum);
    tmpList := TStringList.Create;
    try
      if lstTestGraph.ItemIndex > -1 then
        tmpList.Add(lstTestGraph.Items[lstTestGraph.ItemIndex])
      else
        tmpList.Add(Piece(lblSingleTest.Caption, '^', 1));
      StatusText('Retrieving data for ' + serTest.Title + '...');
      ReportBox(InterimSelect(Patient.DFN, date1, date2, tmpList), Piece(serTest.Title, '(', 1) + 'results on ' + Patient.Name, True);
    finally
      tmpList.Free;
    end;
  end;
  Screen.Cursor := crDefault;
  StatusText('');
end;

procedure TfrmLabs.popPrintClick(Sender: TObject);
begin
  inherited;
  if chtChart.Visible then PrintLabGraph;
end;

procedure TfrmLabs.PrintLabGraph;
var
  GraphTitle: string;
begin
  inherited;
  GraphTitle := Piece(lblSingleTest.Caption, '^', 2);
  if (Length(lblSpecimen.Caption) > 2) then GraphTitle := GraphTitle + ' (' + Piece(lblSpecimen.Caption, '^', 2) + ')';
  GraphTitle := GraphTitle + ' - ' + lstDates.DisplayText[lstDates.ItemIndex];
  if dlgWinPrint.Execute then PrintGraph(chtChart, GraphTitle);
end;

procedure TfrmLabs.BeginEndDates(var ADate1, ADate2: TFMDateTime; var ADaysBack: integer);
var
  datetemp: TFMDateTime;
  today, datetime1, datetime2: TDateTime;
  relativedate: string;
begin
  today := FMToDateTime(floattostr(FMToday));
  relativedate := Piece(lstDates.ItemID, ';', 1);
  relativedate := Piece(relativedate, '-', 2);
  ADaysBack := strtointdef(relativedate, 0);
  ADate1 := DateTimeToFMDateTime(today - ADaysBack);
  relativedate := Piece(lstDates.ItemID, ';', 2);
  if StrToIntDef(Piece(relativedate, '+', 2), 0) > 0 then
    begin
      relativedate := Piece(relativedate, '+', 2);
      ADaysBack := strtointdef(relativedate, 0);
      ADate2 := DateTimeToFMDateTime(today + ADaysBack + 1);
    end
  else
    begin
      relativedate := Piece(relativedate, '-', 2);
      ADaysBack := strtointdef(relativedate, 0);
      ADate2 := DateTimeToFMDateTime(today - ADaysBack);
    end;
  datetime1 := FMDateTimeToDateTime(ADate1);
  datetime2 := FMDateTimeToDateTime(ADate2);
  if datetime1 < datetime2 then                 // reorder dates, if needed
    begin
      datetemp := ADate1;
      ADate1 := ADate2;
      ADate2 := datetemp
    end;
  ADate1 := ADate1 + 0.2359;
end;

procedure TfrmLabs.Timer1Timer(Sender: TObject);
var
  i,j: integer;
  r0: String;
begin
  inherited;
  with RemoteSites.SiteList do
   begin
    for i := 0 to Count - 1 do
      if TRemoteSite(Items[i]).Selected then
        if Length(TRemoteSite(Items[i]).LabRemoteHandle) > 0 then
          begin
            r0 := GetRemoteStatus(TRemoteSite(Items[i]).LabRemoteHandle);
            TRemoteSite(Items[i]).LabQueryStatus := r0; //r0='1^Done' if no errors
            if piece(r0,'^',1) = '1' then
              begin
                RemoteReports.Add(TRemoteSite(Items[i]).CurrentLabQuery,
                  TRemoteSite(Items[i]).LabRemoteHandle);
                GetRemoteData(TRemoteSite(Items[i]).LabData,
                  TRemoteSite(Items[i]).LabRemoteHandle,Items[i]);
                TRemoteSite(Items[i]).LabRemoteHandle := '';
                TabControl1.OnChange(nil);
              end
            else
              begin
                uRemoteCount := uRemoteCount + 1;
                if uRemoteCount > 60 then //5 minute limit
                  begin
                    Timer1.Enabled := False;
                    TRemoteSite(Items[i]).LabQueryStatus := '-1^Timed out';
                    UpdateRemoteStatus(TRemoteSite(Items[i]).SiteID, 'Timed out');
                    StatusText('');
                    TabControl1.OnChange(nil);
                  end
                else
                  StatusText('Retrieving Lab data from '
                    + TRemoteSite(Items[i]).SiteName + '...');
              end;
            Timer1.Interval := 5000;
          end;
     if Timer1.Enabled = True then
       begin
         j := 0;
         for i := 0 to Count -1 do
           if Length(TRemoteSite(Items[i]).LabRemoteHandle) > 0 then
             j := 1;
         if j = 0 then  //Shutdown timer if all sites have been processed
           begin
             Timer1.Enabled := False;
             StatusText('');
           end;
         j := 0;
         for i := 0 to Count -1 do
           if TRemoteSite(Items[i]).Selected = true then
             j := 1;
         if j = 0 then  //Shutdown timer if user has de-selected all sites
           begin
             Timer1.Enabled := False;
             StatusText('');
             TabControl1.OnChange(nil);
           end;
       end;
   end;
end;

procedure TfrmLabs.GoRemote(Dest: TStringList; AItem, AReportID: Int64; AQualifier,
  ARpc, AHSType, ADaysBack, ASection: string; ADate1, ADate2: TFMDateTime);
var
  i,j: integer;
  LocalHandle, Report, Query: String;
begin
  { AReportID := 1  Generic report   RemoteLabReports
                 2  Cumulative       RemoteLabCumulative
                 3  Interim          RemoteLabInterim
                 4  Microbioloby     RemoteLabMicro }
  with RemoteSites.SiteList do
    for i := 0 to Count - 1 do
      if TRemoteSite(Items[i]).Selected then
        begin
          TRemoteSite(Items[i]).LabClear;
          if (LeftStr(TRemoteSite(Items[i]).SiteID, 5) = '200HD') then
          begin
            TRemoteSite(Items[i]).LabQueryStatus := '1^Not Included';
            UpdateRemoteStatus(TRemoteSite(Items[i]).SiteID, 'NOT INCLUDED');
            TabControl1.OnChange(nil);
            continue;
          end;
          TRemoteSite(Items[i]).CurrentLabQuery := 'Lab' + Patient.DFN + ';' + Patient.ICN +
            '^' + IntToStr(AItem) + '^' + IntToStr(AReportID) + '^^' + ARpc + '^' + AHSType +
            '^' + ADaysBack + '^' + ASection + '^' + DateToStr(ADate1) + '^' + DateToStr(ADate2) + '^' +
            TRemoteSite(Items[i]).SiteID;
          LocalHandle := '';
          for j := 0 to RemoteReports.Count - 1 do
            begin
              Query := TRemoteSite(Items[i]).CurrentLabQuery;
              Report := TRemoteReport(RemoteReports.ReportList.Items[j]).Report;
              if Report = Query then
                begin
                  LocalHandle := TRemoteReport(RemoteReports.ReportList.Items[j]).Handle;
                  break;
                end;
            end;
          if Length(LocalHandle) > 1 then
            with RemoteSites.SiteList do
              begin
                GetRemoteData(TRemoteSite(Items[i]).LabData,LocalHandle,Items[i]);
                TRemoteSite(Items[i]).LabRemoteHandle := '';
                TRemoteSite(Items[i]).LabQueryStatus := '1^Done';
                UpdateRemoteStatus(TRemoteSite(Items[i]).SiteID, 'Done');
                TabControl1.OnChange(nil);
              end
          else
            begin
              case AReportID of
              1: begin
                   RemoteLabReports(Dest, Patient.DFN + ';' + Patient.ICN, IntToStr(AItem),
                     AHSType, ADaysBack, ASection, ADate1, ADate2,
                     TRemoteSite(Items[i]).SiteID, ARpc);
                 end;
              2: begin
                   RemoteLabCumulative(Dest, Patient.DFN + ';' + Patient.ICN,
                     StrToInt(Adaysback), Adate1, Adate2, TRemoteSite(Items[i]).SiteID,ARpc);
                 end;
              3: begin
                   RemoteLabInterim(Dest, Patient.DFN + ';' + Patient.ICN, Adate1, Adate2,
                     TRemoteSite(Items[i]).SiteID, ARpc);
                 end;
              4: begin
                   RemoteLabMicro(Dest, Patient.DFN + ';' + Patient.ICN, Adate1, Adate2,
                     TRemoteSite(Items[i]).SiteID, ARpc);
                 end;
              else begin
                     RemoteLab(Dest, Patient.DFN + ';' + Patient.ICN, IntToStr(AItem),
                     AHSType, ADaysBack, ASection, ADate1, ADate2,
                     TRemoteSite(Items[i]).SiteID, ARpc);
                   end;
              end;
              if Dest[0] = '' then
                begin
                  TRemoteSite(Items[i]).LabQueryStatus := '-1^Communication error';
                  UpdateRemoteStatus(TRemoteSite(Items[i]).SiteID, 'Communication error');
                end
              else
                begin
                  TRemoteSite(Items[i]).LabRemoteHandle := Dest[0];
                  TRemoteSite(Items[i]).LabQueryStatus := '0^initialization...';
                  UpdateRemoteStatus(TRemoteSite(Items[i]).SiteID, 'Initialization');
                  Timer1.Enabled := True;
                  StatusText('Retrieving reports from '
                    + TRemoteSite(Items[i]).SiteName + '...');
                end;
            end;
        end;
end;

procedure TfrmLabs.TabControl1Change(Sender: TObject);
var
  aStatus: string;
  hook: Boolean;
  i: integer;
begin
  inherited;
  memLab.Lines.Clear;
  lstHeaders.Items.Clear;
  with TabControl1 do
    begin
      memLab.Lines.BeginUpdate;
      if TabIndex > 0 then
        begin
          aStatus := TRemoteSite(Tabs.Objects[TabIndex]).LabQueryStatus;
          if aStatus = '1^Done' then
            begin
              if Piece(TRemoteSite(Tabs.Objects[TabIndex]).LabData[0],'^',1) = '[HIDDEN TEXT]' then
                begin
                  lstHeaders.Clear;
                  hook := false;
                  for i := 1 to TRemoteSite(Tabs.Objects[TabIndex]).LabData.Count - 1 do
                    if hook = true then
                      memLab.Lines.Add(TRemoteSite(Tabs.Objects[TabIndex]).LabData[i])
                    else
                      begin
                        lstHeaders.Items.Add(MixedCase(TRemoteSite(Tabs.Objects[TabIndex]).LabData[i]));
                        if Piece(TRemoteSite(Tabs.Objects[TabIndex]).LabData[i],'^',1) = '[REPORT TEXT]' then
                          hook := true;
                      end;
                end
              else
                QuickCopy(TRemoteSite(Tabs.Objects[TabIndex]).LabData,memLab);
              memLab.Lines.Insert(0,' ');
              memLab.Lines.Delete(0);
            end;
          if Piece(aStatus,'^',1) = '-1' then
            memLab.Lines.Add('Remote data transmission error: ' + Piece(aStatus,'^',2));
          if Piece(aStatus,'^',1) = '0' then
            memLab.Lines.Add('Transmission in progress: ' + Piece(aStatus,'^',2));
          if Piece(aStatus,'^',1) = '' then
            memLab.Lines.Add('Select a report...');
        end
      else
        if uLabLocalReportData.Count > 0 then
          begin
            if Piece(uLabLocalReportData[0],'^',1) = '[HIDDEN TEXT]' then
              begin
                lstHeaders.Clear;
                hook := false;
                for i := 1 to uLabLocalReportData.Count - 1 do
                  if hook = true then
                    memLab.Lines.Add(uLabLocalReportData[i])
                  else
                    begin
                      lstHeaders.Items.Add(MixedCase(uLabLocalReportData[i]));
                      if Piece(uLabLocalReportData[i],'^',1) = '[REPORT TEXT]' then
                        hook := true;
                    end;
              end
            else
              QuickCopy(uLabLocalReportData,memLab);
            memLab.Lines.Insert(0,' ');
            memLab.Lines.Delete(0);
          end;
      memLab.SelStart := 0;
      memLab.Lines.EndUpdate;
    end;
end;

procedure TfrmLabs.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  WebDoc: IHtmlDocument2;
  v: variant;
begin
  inherited;
  if uHTMLDoc = '' then Exit;
  if not(uReportType = 'H') then Exit; //this can be removed if & when browser replaces memtext control
  if not Assigned(WebBrowser1.Document) then Exit;
  WebDoc := WebBrowser1.Document as IHtmlDocument2;
  v := VarArrayCreate([0, 0], varVariant);
  v[0] := uHTMLDoc;
  WebDoc.write(PSafeArray(TVarData(v).VArray));
  WebDoc.close;
  //uHTMLDoc := '';
end;

procedure TfrmLabs.ChkBrowser;
begin
  if uReportType = 'H' then
   begin
     WebBrowser1.Visible := true;
     WebBrowser1.Navigate('about:blank');
     WebBrowser1.BringToFront;
     memLab.Visible := false;
   end
 else
  begin
    WebBrowser1.Visible := false;
    WebBrowser1.SendToBack;
    memLab.Visible := true;
    memLab.BringToFront;
  end;
end;

procedure TfrmLabs.CommonComponentVisible(A1,A2,A3,A4,A5,A6,A7,A8,A9: Boolean);
begin
  lstDates.Visible := false;    // turned off to realign correctly
  lblDates.Visible := false;
  pnlOtherTests.Visible := false;
  lstHeaders.Visible := false;
  lblHeaders.Visible := false;
  lstDates.Visible := A5;        // reordered to realign
  lblDates.Visible := A4;
  pnlOtherTests.Visible := A3;
  lstHeaders.Visible := A2;
  lblHeaders.Visible := A1;
  pnlHeader.Visible := A6;
  grdLab.Visible := A7;
  pnlChart.Visible := A8;
  pnlFooter.Visible := A9;
  if A4 and A1 and (lblDates.Top < lblHeaders.Top) then
  begin
    lblDates.Caption := 'Headings';  // swithes captions if not aligned
    lblHeaders.Caption := 'Date Range';
  end
  else
  begin
    lblDates.Caption := 'Date Range';
    lblHeaders.Caption := 'Headings';
  end;
  lstDates.Caption := lblDates.Caption;
  lstHeaders.Caption := lblHeaders.Caption;
end;

procedure TfrmLabs.Memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) then
  begin
    if ssShift in Shift then
    begin
      FindNextControl(Sender as TWinControl, False, True, False).SetFocus; //previous control
      Key := 0;
    end
    else if ssCtrl	in Shift then
    begin
      FindNextControl(Sender as TWinControl, True, True, False).SetFocus; //next control
      Key := 0;
    end;
  end;
  if (key = VK_ESCAPE) then begin
    FindNextControl(Sender as TWinControl, False, True, False).SetFocus; //previous control
    key := 0;
  end;
end;

end.
