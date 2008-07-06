unit fGraphs;

interface

uses                                                
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ORCtrls, Menus, TeeProcs, TeEngine, Series, Chart, Math,
  ComCtrls, GanttCh, ClipBrd, StrUtils, ORFn, ORDtTmRng, DateUtils, Printers,
  OleServer, Variants, Word97, Word2000, ArrowCha, ORDtTm, uGraphs;

type
  TfrmGraphs = class(TForm)
    btnChangeSettings: TButton;
    btnClose: TButton;
    btnGraphSelections: TButton;
    bvlBottomLeft: TBevel;
    bvlBottomRight: TBevel;
    bvlTopLeft: TBevel;
    bvlTopRight: TBevel;
    calDateRange: TORDateRangeDlg;
    cboDateRange: TORComboBox;
    chartBase: TChart;
    chartDatelineBottom: TChart;
    chartDatelineTop: TChart;
    chkDualViews: TCheckBox;
    chkItemsBottom: TCheckBox;
    chkItemsTop: TCheckBox;
    dlgDate: TORDateTimeDlg;
    lblDateRange: TLabel;
    lblViewsBottom: TOROffsetLabel;
    lblViewsTop: TOROffsetLabel;
    lstAllTypes: TListBox;
    lstCheck: TListBox;
    lstData: TListBox;
    lstDrugClass: TListBox;
    lstItems: TListBox;
    lstItemsTemp: TListBox;
    lstMultiSpec: TListBox;
    lstNonNumeric: TListBox;
    lstScratchLab: TListBox;
    lstScratchSwap: TListBox;
    lstScratchTemp: TListBox;
    lstSelCopyBottom: TListBox;
    lstSelCopyTop: TListBox;
    lstSpec1: TListBox;
    lstSpec2: TListBox;
    lstSpec3: TListBox;
    lstSpec4: TListBox;
    lstTemp: TListBox;
    lstTempCheck: TListBox;
    lstTestSpec: TListBox;
    lstTypes: TListBox;
    lstViews: TListBox;
    lstZoomHistory: TListBox;
    lvwItemsBottom: TListView;
    lvwItemsTop: TListView;
    mnumedsasgantt: TMenuItem;
    mnumedsasganttvertheight: TMenuItem;
    mnuPopGraph3D: TMenuItem;
    mnuPopGraphClear: TMenuItem;
    mnuPopGraphCopy: TMenuItem;
    mnuPopGraphDates: TMenuItem;
    mnuPopGraphDefineViews: TMenuItem;
    mnuPopGraphDetails: TMenuItem;
    mnuPopGraphDualViews: TMenuItem;
    mnuPopGraphGradient: TMenuItem;
    mnuPopGraphFixed: TMenuItem;
    mnuPopGraphHints: TMenuItem;
    mnuPopGraphHorizontal: TMenuItem;
    mnuPopGraphIsolate: TMenuItem;
    mnuPopGraphLegend: TMenuItem;
    mnuPopGraphLines: TMenuItem;
    mnuPopGraphPrint: TMenuItem;
    mnuPopGraphRemove: TMenuItem;
    mnuPopGraphReset: TMenuItem;
    mnuPopGraphSeparate1: TMenuItem;
    mnuPopGraphSort: TMenuItem;
    mnuPopGraphSplit: TMenuItem;
    mnuPopGraphStayOnTop: TMenuItem;
    mnuPopGraphStuff: TPopupMenu;
    mnuPopGraphSwap: TMenuItem;
    mnuPopGraphToday: TMenuItem;
    mnuPopGraphValues: TMenuItem;
    mnuPopGraphVertical: TMenuItem;
    mnuPopGraphZoomBack: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pnlBlankBottom: TPanel;
    pnlBlankTop: TPanel;
    pnlBottom: TPanel;
    pnlBottomRightPad: TPanel;
    pnlData: TPanel;
    pnlDatelineBottom: TPanel;
    pnlDatelineBottomSpacer: TORAutoPanel;
    pnlDatelineTop: TPanel;
    pnlDatelineTopSpacer: TORAutoPanel;
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    pnlInfo: TORAutoPanel;
    pnlItemsBottom: TPanel;
    pnlItemsBottomInfo: TPanel;
    pnlItemsTop: TPanel;
    pnlItemsTopInfo: TPanel;
    pnlMain: TPanel;
    pnlScrollBottomBase: TPanel;
    pnlScrollTopBase: TPanel;
    pnlTemp: TPanel;
    pnlTop: TPanel;
    pnlTopRightPad: TPanel;
    scrlBottom: TScrollBox;
    scrlTop: TScrollBox;
    serDatelineBottom: TGanttSeries;
    serDatelineTop: TGanttSeries;
    splGraphs: TSplitter;
    splItemsBottom: TSplitter;
    splItemsTop: TSplitter;
    timHintPause: TTimer;
    lstSelPrevTop: TListBox;
    lstSelPrevBottom: TListBox;
    lstComp: TListBox;
    pnlViewsTopSpacer: TPanel;
    cboViewsTop: TORComboBox;
    pnlViewsTopSpacerRight: TPanel;
    pnlViewsBottomSpacer: TPanel;
    cboViewsBottom: TORComboBox;
    pnlViewsBottomSpacerRight: TPanel;
    testcount1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btnCloseClick(Sender: TObject);
    procedure btnChangeSettingsClick(Sender: TObject);
    procedure btnGraphSelectionsClick(Sender: TObject);

    procedure chkDualViewsClick(Sender: TObject);
    procedure chkItemsTopClick(Sender: TObject);
    procedure chkItemsBottomClick(Sender: TObject);

    procedure mnuMedsasganttClick(Sender: TObject);
    procedure mnuPopGraph3DClick(Sender: TObject);
    procedure mnuPopGraphClearClick(Sender: TObject);
    procedure mnuPopGraphCopyClick(Sender: TObject);
    procedure mnuPopGraphDatesClick(Sender: TObject);
    procedure mnuPopGraphDetailsClick(Sender: TObject);
    procedure mnuPopGraphDualViewsClick(Sender: TObject);
    procedure mnuPopGraphFixedClick(Sender: TObject);
    procedure mnuPopGraphGradientClick(Sender: TObject);
    procedure mnuPopGraphHintsClick(Sender: TObject);
    procedure mnuPopGraphIsolateClick(Sender: TObject);
    procedure mnuPopGraphLegendClick(Sender: TObject);
    procedure mnuPopGraphLinesClick(Sender: TObject);
    procedure mnuPopGraphPrintClick(Sender: TObject);
    procedure mnuPopGraphRemoveClick(Sender: TObject);
    procedure mnuPopGraphResetClick(Sender: TObject);
    procedure mnuPopGraphSeparate1Click(Sender: TObject);
    procedure mnuPopGraphStayOnTopClick(Sender: TObject);
    procedure mnuPopGraphSortClick(Sender: TObject);
    procedure mnuPopGraphSplitClick(Sender: TObject);
    procedure mnuPopGraphStuffPopup(Sender: TObject);
    procedure mnuPopGraphSwapClick(Sender: TObject);
    procedure mnuPopGraphTodayClick(Sender: TObject);
    procedure mnuPopGraphValuesClick(Sender: TObject);
    procedure mnuPopGraphHorizontalClick(Sender: TObject);
    procedure mnuPopGraphVerticalClick(Sender: TObject);
    procedure mnuPopGraphZoomBackClick(Sender: TObject);

    procedure splGraphsMoved(Sender: TObject);
    procedure splItemsBottomMoved(Sender: TObject);
    procedure splItemsTopMoved(Sender: TObject);

    procedure GetSize;
    procedure SetSize;

    procedure lvwItemsBottomClick(Sender: TObject);
    procedure lvwItemsBottomColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwItemsBottomCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure lvwItemsTopClick(Sender: TObject);
    procedure lvwItemsTopColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwItemsTopCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);

    procedure cboDateRangeChange(Sender: TObject);
    procedure cboViewsBottomChange(Sender: TObject);
    procedure cboViewsTopChange(Sender: TObject);

    procedure pnlScrollTopBaseResize(Sender: TObject);

    procedure chartBaseClickLegend(Sender: TCustomChart;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chartBaseClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chartBaseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chartBaseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure serDatelineTopGetMarkText(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: String);

    procedure ChartOnUndoZoom(Sender: TObject);
    procedure ChartOnZoom(Sender: TObject);
    procedure DisplayData(aSection: string);
    procedure HideDates(aChart: TChart);
    procedure SourcesDefault;
    procedure StayOnTop;

    procedure timHintPauseTimer(Sender: TObject);
    procedure ZoomUpdate;
    procedure ZoomUpdateInfo(SmallTime, BigTime: TDateTime);
    procedure ZoomTo(SmallTime, BigTime: TDateTime);
    procedure lvwItemsTopChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvwItemsTopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwItemsBottomChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure testcount1Click(Sender: TObject);
    procedure cboDateRangeDropDown(Sender: TObject);
    procedure cboViewsTopDropDown(Sender: TObject);
    procedure cboViewsTopDropDownClose(Sender: TObject);
    procedure cboViewsBottomDropDown(Sender: TObject);
    procedure cboViewsBottomDropDownClose(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvwItemsTopEnter(Sender: TObject);
    procedure lvwItemsBottomEnter(Sender: TObject);
    procedure chkItemsBottomEnter(Sender: TObject);
    procedure cboViewsBottomEnter(Sender: TObject);

  private
    { Private declarations }
    FBSortAscending: boolean;
    FBSortCol: integer;
    FDate1: Double;
    FDate2: Double;
    FSortAscending: boolean;
    FSortCol: integer;

    FActiveGraph: TChart;
    FArrowKeys: boolean;
    FBHighTime, FBLowTime: Double;
    FCreate: boolean;
    FFirstClick: boolean;
    FFirstSwitch: boolean;
    FGraphClick: TCustomChart;
    FGraphSeries: TChartSeries;
    FGraphValueIndex: integer;
    FGraphSetting: TGraphSetting;
    FGraphType: char;
    FItemsSortedTop: boolean;
    FItemsSortedBottom: boolean;
    FMouseDown: boolean;
    FMTimestamp: string;
    FMToday: TFMDateTime;
    FMyProfiles, FProfiles: TStringList;
    FNonNumerics: boolean; // used with pnlItemsTop.Tag & pnlItemsBottom.Tag
    FOnLegend:  integer;
    FOnSeries: integer;
    FOnValue: integer;
    FPrevEvent: string;
    FRetainZoom: boolean;
    FSources: TStrings;
    FSourcesDefault: TStrings;
    FTHighTime, FTLowTime: Double;
    FWarning: boolean;
    FX, FY: integer;
    FYMinValue: Double;
    FYMaxValue: Double;

    procedure AdjustTimeframe;
    procedure AllTypeDate(aType, aTypeName, firstline, secondline: string; aDate, aDate2: double);
    procedure AllDetails(aDate1, aDate2: TFMDateTime; aTempList: TStrings);
    procedure AssignProfile(aProfile, aSection: string);
    procedure AutoSelect(aListView: TListView);
    procedure BaseResize(aScrollBox: TScrollBox);
    procedure BottomAxis(aScrollBox: TScrollBox);
    procedure ChangeStyle;
    procedure ChartStyle(aChart: TChart);
    procedure CheckProfile(var aProfile: string; var Updated: boolean);
    procedure CheckToAddData(aListView: TListView; aSection, TypeToCheck: string);
    procedure CreatePatientHeader(var HeaderList: TStringList; PageTitle, Warning, DateRange: string);
    procedure DateRangeItems(oldestdate, newestdate: double; filenum: string);
    procedure UpdateView(filename, filenum, itemnum, aString: string; aListView: TListView);
    procedure DisplayType(itemtype, displayed: string);
    procedure FillViews;
    procedure FilterListView(oldestdate, newestdate: double);
    procedure FixedDates(var adatetime, adatetime1: TDateTime);
    procedure GetData(aString: string);
    procedure HideGraphs(action: boolean);
    procedure HighLow(fmtime, fmtime1: string; aChart: TChart; var adatetime, adatetime1: TDateTime);
    procedure InactivateHint;
    procedure ItemCheck(aListView: TListView; aItemName: string;
      var aNum: integer; var aTypeItem: string);
    procedure ItemsClick(Sender: TObject; aListView, aOtherListView: TListView;
      aCheckBox: TCheckBox; aComboBox: TORComboBox; aList: TListBox; aSection: string);
    procedure ItemDateRange(Sender: TCustomChart);
    procedure LabData(aItemType, aItemName, aSection: string);
    procedure LoadDateRange;
    procedure LoadDisplayCheck(typeofitem: string; var updated: boolean);
    procedure LoadType(itemtype, displayed: string);
    procedure NextPointerStyle(aSeries: TChartSeries; aSerCnt: integer);
    procedure OneDayTypeDetails(aTypeItem: string);
    procedure RefUnits(aItem, aSpec: string; var low, high, units: string);
    procedure ResetSpec(aListBox: TListBox; aItemNum, aNewItemNum, aNewItemName, aNewString: string);
    procedure TempCheck(typeitem: string; var levelseq: double);
    procedure SelCopy(aListView: TListView; aListBox: TListBox);
    procedure SelReset(aListbox: TListBox; aListView: TListView);
    procedure SelectItem(aListView: TListView; typeitem: string);
    procedure SetProfile(aProfile, aName: string; aListView: TListView);
    procedure SizeDates(aChart: TChart; aSmallTime, aBigTime: TDateTime);
    procedure SizeTogether(onlylines, nolines, anylines: Boolean; aScroll: TScrollBox;
      aChart: TChart; aPanel, aPanelBase: TPanel; portion: Double);
    procedure ViewsChange(aListView: TListView; aComboBox: TORComboBox; aSection: string);

    procedure MakeDateline(section, aTitle, aFileType: string; aChart: TChart; graphtype: integer;
      var bcnt, pcnt, gcnt, vcnt, acnt: integer);
    procedure MakeSeparate(aScrollBox: TScrollBox; aListView: TListView; aPadPanel: TPanel; section: string);
    procedure MakeTogether(aScrollBox: TScrollBox; aListView: TListView; aPadPanel: TPanel; section: string);

    procedure MakeAGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeArrowSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeBarSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeLineSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt, aNonCnt: integer; multiline: boolean);
    procedure MakeManyGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);  // good one
    procedure MakePointSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeVisitGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeWeightedArrowSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
    procedure MakeWeightedGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);

    function BPValue(aDateTime: TDateTime): string;
    function DateRangeMultiItems(aOldDate, aNewDate: double; aMultiItem: string): boolean;
    function DCName(aDCien: string): string;
    function ExpandTax(profile: string): string;
    function FileNameX(filenum: string): string;
    function FMCorrectedDate(fmtime: string): string;
    function GraphTypeNum(aType: string): integer;
    function HSAbbrev(aType: string): boolean;
    function InvVal(value: double): double;
    function ItemName(filenum, itemnum: string): string;
    function NextColor(aCnt: integer): TColor;
    function PortionSize(lcnt, pcnt, gcnt, vcnt, bcnt, acnt: integer): double;
    function SelectRef(aRef: string): string;
    function StdDev(value, high, low: double): double;
    function TypeIsDisplayed(itemtype: string): boolean;
    function TypeIsLoaded(itemtype: string): boolean;
    function Vfactor(aTitle: string): double;
    function ValueText(Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer): string;

  public
    { Public declarations }
    procedure InitialData;
    procedure Initialize;
    procedure InitialRetain;
    procedure LoadListView(aList: TStrings);
    procedure SourceContext;
    procedure ViewSelections;
    procedure SetFontSize(FontSize: integer);
    function FMToDateTime(FMDateTime: string): TDateTime;
  end;

var
  frmGraphs: TfrmGraphs;
  FHintWin: THintWindow;
  FHintWinActive: boolean;
  FHintStop: boolean;

implementation

uses fGraphSettings, fGraphProfiles, rGraphs,
  ComObj, ActiveX, ShellAPI, fFrame, uCore, rCore, fRptBox, fReports,
  uFormMonitor;

{$R *.DFM}

type
  TGraphItem = class
  public
    Values: string;
end;

procedure TfrmGraphs.FormCreate(Sender: TObject);
var
  i: integer;
  dfntype, listline, settings, settings1, t1, t2: string;
  aList: TStrings;
begin
  FMToday := DateTimeToFMDateTime(Date);
  FHintWinActive := false;
  FHintStop := false;
  FNonNumerics := false;
  FMouseDown := false;
  FItemsSortedTop := false;
  FItemsSortedBottom := false;
  FRetainZoom := false;
  FFirstClick := true;
  FArrowKeys := false;
  FCreate := true;
  FGraphType := Char(32);
  aList := TStringList.Create;
  FastAssign(rpcGetGraphSettings, aList);
  btnClose.Tag := 0;
  if aList.Count < 1 then
  begin
    Screen.Cursor := crDefault;
    showmessage('CPRS is not configured for graphing.');
    btnClose.Tag := 1;
    FreeAndNil(aList);
    Close;
    Exit;
  end;
  t1 := aList[0]; t2 := aList[1];   // hint are current, t1 are personal, t2 public settings
  if length(frmFrame.mnuToolsGraphing.Hint) > 0 then settings := frmFrame.mnuToolsGraphing.Hint
  else if length(t1) > 0 then settings := t1
  else settings := t2;
  SetPiece(settings, '|', 8, Piece(t2, '|', 8)); //??????????
  frmFrame.mnuToolsGraphing.Hint := settings;
  settings1 := Piece(settings, '|', 1);
  FSources := TStringList.Create;
  FSourcesDefault := TStringList.Create;
  FMyProfiles := TStringList.Create;
  FProfiles := TStringList.Create;
  FYMinValue := 0;
  FYMaxValue := 0;
  FTHighTime := 0;
  FTLowTime := BIG_NUMBER;
  FBHighTime := 0;
  FBLowTime := BIG_NUMBER;
  pnlInfo.Caption := TXT_INFO;
  FOnLegend := BIG_NUMBER;
  FOnSeries := BIG_NUMBER;
  FOnValue := BIG_NUMBER;
  FHintWin := THintWindow.Create(self);
  FHintWin.Color := clInfoBk;
  FHintWin.Canvas.Font.Color := clInfoBk;
  FX := 0; FY :=0;
  FastAssign(rpcGetTypes('0', false), lstAllTypes.Items);
  for i := 0 to lstAllTypes.Items.Count - 1 do
  begin
    listline := lstAllTypes.Items[i];
    dfntype := UpperCase(Piece(listline, '^', 1));
    SetPiece(listline, '^', 1, dfntype);
    lstAllTypes.Items[i] := listline;
  end;
  FGraphSetting := GraphSettingsInit(settings);
  for i := 0 to BIG_NUMBER do
  begin
    dfntype := Piece(settings1, ';', i);
    if length(dfntype) = 0 then break;
    listline := dfntype + '^' + FileNameX(dfntype) + '^1';
    FSources.Add(listline);
    FSourcesDefault.Add(listline);
  end;
  serDatelineTop.Active := false;
  serDatelineBottom.Active := false;
  chartDatelineTop.Gradient.EndColor := clGradientActiveCaption;
  chartDatelineTop.Gradient.StartColor := clWindow;
  chartDatelineBottom.Gradient.EndColor := clGradientActiveCaption;
  chartDatelineBottom.Gradient.StartColor := clWindow;
  LoadDateRange;
  chkItemsTop.Checked := true;
  chkItemsBottom.Checked := true;
  FastAssign(rpcGetTestSpec, lstTestSpec.Items);
  FillViews;
  FreeAndNil(aList);
end;

procedure TfrmGraphs.SourcesDefault;
var
  i: integer;
  dfntype, listline, settings, settings1, t1, t2: string;
  aList: TStrings;
begin
  aList := TStringList.Create;
  FastAssign(rpcGetGraphSettings, aList);
  t1 := aList[0]; t2 := aList[1];   // t1 are personal, t2 public settings
  if length(frmFrame.mnuToolsGraphing.Hint) > 0 then settings := frmFrame.mnuToolsGraphing.Hint
  else if length(t1) > 0 then settings := t1
  else settings := t2;
  SetPiece(settings, '|', 8, Piece(t2, '|', 8));
  settings1 := Piece(settings, '|', 1);
  FGraphSetting := GraphSettingsInit(settings);
  for i := 0 to BIG_NUMBER do
  begin
    dfntype := Piece(settings1, ';', i);
    if length(dfntype) = 0 then break;
    listline := dfntype + '^' + FileNameX(dfntype) + '^1';
    FSourcesDefault.Add(listline);
  end;
  FreeAndNil(aList);
end;

procedure TfrmGraphs.Initialize;
var
  i: integer;
  rptview1, rptview2, rptviews: string;
begin
  InitialData;
  SourceContext;
  LoadListView(lstItems.Items);
  if pnlMain.Tag > 0 then
  begin
    rptviews := MixedCase(rpcReportParams(pnlMain.Tag));
    if length(rptviews) > 1 then
    begin
      rptview1 := Piece(rptviews, '^', 1);
      rptview2 := Piece(rptviews, '^', 2);
      if length(rptview1) > 0 then
      begin
        for i := 0 to cboViewsTop.Items.Count - 1 do
        if Piece(cboViewsTop.Items[i], '^', 2) = rptview1 then
        begin
          cboViewsTop.ItemIndex := i;
          break;
        end;
      end;
      if length(rptview2) > 0 then
      begin
        chkDualViews.Checked := true;
        chkDualViewsClick(self);
        for i := 0 to cboViewsBottom.Items.Count - 1 do
        if Piece(cboViewsBottom.Items[i], '^', 2) = rptview2 then
        begin
          cboViewsBottom.ItemIndex := i;
          break;
        end;
      end;
    end;
  end;
  if cboViewsTop.ItemIndex > -1 then
    cboViewsTopChange(self)
  else
    lvwItemsTopClick(self);
  if cboViewsBottom.ItemIndex > -1 then
    cboViewsbottomChange(self)
  else
    lvwItemsBottomClick(self);
  if pnlMain.Tag > 0 then
  begin
    pnlMain.Tag := 0;
    cboDateRangeChange(self);
  if cboViewsTop.ItemIndex > -1 then
    cboViewsTopChange(self)
  else
    lvwItemsTopClick(self);
  if cboViewsBottom.ItemIndex > -1 then
    cboViewsbottomChange(self)
  else
    lvwItemsBottomClick(self);
  end;
end;

procedure TfrmGraphs.InitialRetain;
//var
  //i: integer;
begin
  {//
  allview=false
  fullview=false
  noview=true
  go thru items
        if selected
                if view
                        noview=false
                else
                        allview=false

        else
                if view
                        allview=false
                        fullview=false
                        noview=false
                else
                        //
  if noview
        //
  if allview
        //
  if fullview
        //
  else //partial view
        //
  //}
end;

procedure TfrmGraphs.FillViews;
var
  i: integer;
begin
  with cboViewsTop do
  begin
    Items.Clear;
    Sorted := false;
    lstTemp.Sorted := true;
    FastAssign(rpcGetGraphProfiles('1', '0', 0), lstTemp.Items);
    if lstTemp.Items.Count > 0 then
    begin
      for i := 0 to lstTemp.Items.Count - 1 do
        Items.Add('-1^' + lstTemp.Items[i] + '^');
    end;
    FastAssign(rpcGetGraphProfiles('1', '1', 0), lstTemp.Items);
    if lstTemp.Items.Count > 0 then
    begin
      Items.Add(LLS_LINE);
      for i := 0 to lstTemp.Items.Count - 1 do
        Items.Add('-2^' + lstTemp.Items[i] + '^');
    end;
    Items.Insert(0, '^<clear all selections>^0');
    Items.Insert(1, '^<select items>^0');
  end;
  FastAssign(cboViewsTop.Items, cboViewsBottom.Items);
end;

procedure TfrmGraphs.SourceContext;
begin
  if frmFrame.GraphContext = '' then exit;
  frmFrame.GraphContext := '';
end;

procedure TfrmGraphs.FormShow(Sender: TObject);
begin
  Font := MainFont;
  ChangeStyle;
  StayOnTop;
  mnuPopGraphResetClick(self);
  if pnlFooter.Tag = 1 then  // do not show footer controls on reports tab
  begin
    pnlFooter.Visible := false;
    if FCreate then
    begin
      FGraphType := GRAPH_REPORT;
      FCreate := false;
      GetSize;
    end;
  end
  else
  begin
    chkDualViews.Checked := false;
    chkDualViewsClick(self);
    if FCreate then
    begin
      FGraphType := GRAPH_FLOAT;
      FCreate := false;
      GetSize;
    end;
  end;
  if cboDateRange.ItemIndex < 0 then
    cboDateRange.ItemIndex := cboDateRange.Items.Count - 1;
  cboDateRangeChange(self);
  lvwItemsTopClick(self);
  if lvwItemsTop.Items.Count = 0 then
  begin
    cboViewsTop.ItemIndex := 0;
    cboViewsTop.Text := '';
  end;
  //else
  //  lvwItemsTop.SetFocus;
  //chkItemsTop.SetFocus;
  cboViewsTop.SetFocus;
  //Perform(WM_NextDlgCtl, 0, 0);
end;

procedure TfrmGraphs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetSize;
  timHintPause.Enabled := false;
  InactivateHint;
  frmFrame.GraphFloatActive := false;
end;

procedure TfrmGraphs.GetSize;
var
  i, v1, v2, v3, v4: integer;
  name, settings, value: string;
  aList: TStrings;
begin
  aList := TStringList.Create;
  FastAssign(rpcGetGraphSizing, aList);
  for i := 0 to aList.Count - 1 do
  begin
    settings := aList[i];
    name := Piece(settings, '^', 1);
    value := Piece(settings, '^', 2);
    if length(value) > 1 then
    begin
      v1 := strtointdef(Piece(value, ',', 1), 0);
      v2 := strtointdef(Piece(value, ',', 2), 0);
      v3 := strtointdef(Piece(value, ',', 3), 0);
      v4 := strtointdef(Piece(value, ',', 4), 0);
      if FGraphType = GRAPH_FLOAT then
      begin
        if name = 'FBOUNDS' then
        begin
          if value = '0,0,0,0' then
            WindowState := wsMaximized
          else
          begin
            if v1 > 0 then Left := v1;
            if v2 > 0 then Top := v2;
            if v3 > 0 then Width := v3;
            if v4 > 0 then Height := v4;
          end;
        end
        else if name = 'FWIDTH' then
        begin
          if v1 > 0 then
          begin
            pnlItemsTop.Width := v1;
            splItemsTopMoved(self);
          end;
        end
        else if name = 'FBOTTOM' then
        begin
          if v1 > 0 then
          begin
            chkDualViews.Checked := true;
            chkDualViewsClick(self);
            pnlBottom.Height := v1;
          end;
        end
        else if name = 'FCOLUMN' then
        begin
          if v1 > 0 then lvwItemsTop.Column[0].Width := v1;
          if v2 > 0 then lvwItemsTop.Column[1].Width := v2;
          if v3 > 0 then lvwItemsTop.Column[2].Width := v3;
          if v4 > 0 then lvwItemsTop.Column[3].Width := v4;
        end
        else if name = 'FBCOLUMN' then
        begin
          if v1 > 0 then lvwItemsBottom.Column[0].Width := v1;
          if v2 > 0 then lvwItemsBottom.Column[1].Width := v2;
          if v3 > 0 then lvwItemsBottom.Column[2].Width := v3;
          if v4 > 0 then lvwItemsBottom.Column[3].Width := v4;
        end;
      end
      else
      begin
        if name = 'RWIDTH' then
        begin
          if v1 > 0 then
          begin
            pnlItemsTop.Width := v1;
            splItemsTopMoved(self);
          end;
        end
        else if name = 'RBOTTOM' then
        begin
          if v1 > 0 then
          begin
            pnlBottom.Height := v1;
            splGraphsMoved(splGraphs);
          end;
        end
        else if name = 'RCOLUMN' then
        begin
          if v1 > 0 then lvwItemsTop.Column[0].Width := v1;
          if v2 > 0 then lvwItemsTop.Column[1].Width := v2;
          if v3 > 0 then lvwItemsTop.Column[2].Width := v3;
          if v4 > 0 then lvwItemsTop.Column[3].Width := v4;
        end
        else if name = 'RBCOLUMN' then
        begin
          if v1 > 0 then lvwItemsBottom.Column[0].Width := v1;
          if v2 > 0 then lvwItemsBottom.Column[1].Width := v2;
          if v3 > 0 then lvwItemsBottom.Column[2].Width := v3;
          if v4 > 0 then lvwItemsBottom.Column[3].Width := v4;
        end;
      end;
    end;
  end;
  FreeAndNil(aList);
end;

procedure TfrmGraphs.SetSize;
var
  name, v1, v2, v3, v4: string;
  aList: TStrings;
begin
  aList := TStringList.Create;
  if FGraphType = GRAPH_FLOAT then
  begin
    name := 'FBOUNDS';
    v1 := inttostr(Left);
    v2 := inttostr(Top);
    v3 := inttostr(Width);
    v4 := inttostr(Height);
    if WindowState = wsMaximized then
      aList.Add(name + '^0,0,0,0')
    else
      aList.Add(name + '^' + v1 +',' + v2 +',' + v3 +',' + v4);
    name := 'FWIDTH';
    v1 := inttostr(splItemsTop.Left);
    aList.Add(name + '^' + v1);
    name := 'FBOTTOM';
    if chkDualViews.Checked then
      v1 := inttostr(pnlBottom.Height)
    else
      v1 := '0';
    aList.Add(name + '^' + v1);
    name := 'FCOLUMN';
    v1 := inttostr(lvwItemsTop.Column[0].Width);
    v2 := inttostr(lvwItemsTop.Column[1].Width);
    v3 := inttostr(lvwItemsTop.Column[2].Width);
    v4 := inttostr(lvwItemsTop.Column[3].Width);
    aList.Add(name + '^' + v1 +',' + v2 +',' + v3 +',' + v4);
    name := 'FBCOLUMN';
    v1 := inttostr(lvwItemsBottom.Column[0].Width);
    v2 := inttostr(lvwItemsBottom.Column[1].Width);
    v3 := inttostr(lvwItemsBottom.Column[2].Width);
    v4 := inttostr(lvwItemsBottom.Column[3].Width);
    aList.Add(name + '^' + v1 +',' + v2 +',' + v3 +',' + v4);
  end
  else
  begin
    name := 'RWIDTH';
    v1 := inttostr(splItemsTop.Left);
    aList.Add(name + '^' + v1);
    name := 'RBOTTOM';
    if chkDualViews.Checked then
      v1 := inttostr(pnlBottom.Height)
    else
      v1 := '0';
    aList.Add(name + '^' + v1);
    name := 'RCOLUMN';
    v1 := inttostr(lvwItemsTop.Column[0].Width);
    v2 := inttostr(lvwItemsTop.Column[1].Width);
    v3 := inttostr(lvwItemsTop.Column[2].Width);
    v4 := inttostr(lvwItemsTop.Column[3].Width);
    aList.Add(name + '^' + v1 +',' + v2 +',' + v3 +',' + v4);
    name := 'RBCOLUMN';
    v1 := inttostr(lvwItemsBottom.Column[0].Width);
    v2 := inttostr(lvwItemsBottom.Column[1].Width);
    v3 := inttostr(lvwItemsBottom.Column[2].Width);
    v4 := inttostr(lvwItemsBottom.Column[3].Width);
    aList.Add(name + '^' + v1 +',' + v2 +',' + v3 +',' + v4);
  end;
  rpcSetGraphSizing(aList);
  FreeAndNil(aList);
end;

procedure TfrmGraphs.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGraphs.btnChangeSettingsClick(Sender: TObject);
var
  needtoupdate, okbutton: boolean;
  conv, i, preconv: integer;
  PreMaxGraphs: integer;
  PreMaxSelect: integer;
  PreMinGraphHeight: integer;
  PreSortColumn: integer;
  PreFixedDateRange: boolean;
  aSettings, filetype, sourcetype: string;
  PreSources: TStrings;
begin
  okbutton := false;
  conv := btnChangeSettings.Tag;
  preconv := conv;
  with FGraphSetting do
  begin
    PreMaxGraphs := MaxGraphs;
    PreMaxSelect := MaxSelect;
    PreMinGraphHeight := MinGraphHeight;
    PreSortColumn := SortColumn;
    PreFixedDateRange := FixedDateRange;
    MaxSelectMin := Max(Max(lvwItemsTop.SelCount, lvwItemsBottom.SelCount), 1);
  end;
  PreSources := TStringList.Create;
  PreSources.Assign(FSources);
  DialogGraphSettings(Font.Size, okbutton, FGraphSetting, FSources, conv, aSettings);
  if not okbutton then exit;
  if length(aSettings) > 0 then frmFrame.mnuToolsGraphing.Hint := aSettings;
  btnChangeSettings.Tag := conv;
  pnlInfo.Font.Size := lblViewsTop.Font.Size;
  SetFontSize(lblViewsTop.Font.Size);
  pnlInfo.Visible := conv > 0;
  if conv > 0 then
  begin
    pnlInfo.Caption := TXT_WARNING;
    pnlInfo.Color := COLOR_WARNING;
  end;
  pnlHeader.Visible := pnlInfo.Visible;
  StayOnTop;
  needtoupdate := (conv <> preconv);
  for i := 0 to FSources.Count - 1 do
  begin
    sourcetype := FSources[i];
    if Copy(sourcetype, 1, 1) = '*' then
    begin
      FSources[i] := Pieces(sourcetype, '^', 2, 4);
      filetype := Piece(FSources[i], '^', 1);
      lstItems.Items.AddStrings(rpcGetItems(filetype, Patient.DFN));
      needtoupdate := true;
    end;
    if not needtoupdate then
      if Piece(PreSources[i], '^', 3) = '0' then
        needtoupdate := TypeIsDisplayed(Piece(sourcetype, '^', 1))
      else
        needtoupdate := not TypeIsDisplayed(Piece(sourcetype, '^', 1));
  end;
  if not needtoupdate then
  with FGraphSetting do
    if MaxGraphs <> PreMaxGraphs then
      needtoupdate := true
    else if MaxSelect <> PreMaxSelect then
      needtoupdate := true
    else if MinGraphHeight <> PreMinGraphHeight then
      needtoupdate := true
    else if SortColumn <> PreSortColumn then
      needtoupdate := true
    else if FixedDateRange <> PreFixedDateRange then
      needtoupdate := true;
  if needtoupdate then
  begin
    cboDateRangeChange(self);
  end;
  ChangeStyle;
  if lvwItemsTop.SelCount = 0 then
  begin
    cboViewsTop.ItemIndex := -1;
    cboViewsTop.Text := '';
  end;
  if lvwItemsBottom.SelCount = 0 then
  begin
    cboViewsBottom.ItemIndex := -1;
    cboViewsBottom.Text := '';
  end;
end;

procedure TfrmGraphs.chkDualViewsClick(Sender: TObject);
begin
  if chkDualViews.Checked then
  begin
    pnlBottom.Height := pnlMain.Height div 2;
    lvwItemsTopClick(self);
  end
  else
  begin
    lvwItemsBottom.ClearSelection;
    lvwItemsBottomClick(self);
    pnlBottom.Height := 1;
  end;
  mnuPopGraphDualViews.Checked := chkDualViews.Checked;
  with pnlMain.Parent do
    if BorderWidth <> 1 then            // only do on Graph in Reports tab
      frmReports.chkDualViews.Checked := chkDualViews.Checked;
end;

procedure TfrmGraphs.LoadListView(aList: TStrings);
var
  i: integer;
  filename, filenum, itemnum: string;
begin
  lvwItemsTop.Items.Clear;
  lvwItemsBottom.Items.Clear;
  lvwItemsTop.SortType := stNone; // if Sorting during load then potential error
  lvwItemsBottom.SortType := stNone; // if Sorting during load then potential error
  with lvwItemsTop do
  for i := 0 to aList.Count - 1 do
  begin
    filenum := Piece(aList[i], '^', 1);
    filename := FileNameX(filenum);    // change rpc **********
    itemnum := Piece(aList[i], '^', 2);
    UpdateView(filename, filenum, itemnum, aList[i], lvwItemsTop);
  end;
  lvwItemsBottom.Items.Assign(lvwItemsTop.Items);
  lvwItemsTop.SortType := stBoth;
  lvwItemsBottom.SortType := stBoth;
  if not FItemsSortedTop then
  begin
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[0]);
    FItemsSortedTop := true;
  end;
  if not FItemsSortedBottom then
  begin
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[0]);
    FItemsSortedBottom := true;
  end;
  with FGraphSetting do
  if SortColumn > 0 then
  begin
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[SortColumn]);
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[SortColumn]);
    FItemsSortedTop := false;
    FItemsSortedBottom := false;
  end;
end;

procedure TfrmGraphs.FilterListView(oldestdate, newestdate: double);
var
  colnum, i: integer;
  lastdate: double;
  aProfile, filename, filenum, itemnum: string;
begin
  lvwItemsTop.Scroll(-BIG_NUMBER, -BIG_NUMBER);      //faster to set scroll at top
  lvwItemsBottom.Scroll(-BIG_NUMBER, -BIG_NUMBER);
  lvwItemsTop.Items.Clear;
  lvwItemsBottom.Items.Clear;
  lvwItemsTop.SortType := stNone; // if Sorting during load then potential error
  lvwItemsBottom.SortType := stNone; // if Sorting during load then potential error
  if (cboDateRange.ItemIndex > 0) and (cboDateRange.ItemIndex < 9) then
  begin
    with lvwItemsTop do
    if TypeIsDisplayed('405') then
      DateRangeItems(oldestdate, newestdate, '405');  // does not matter for all results ******************
    if TypeIsDisplayed('52') then
      DateRangeItems(oldestdate, newestdate, '52');  // does not matter for all results ******************
    if TypeIsDisplayed('55') then
      DateRangeItems(oldestdate, newestdate, '55');
    if TypeIsDisplayed('55NVA') then
      DateRangeItems(oldestdate, newestdate, '55NVA');
    if TypeIsDisplayed('9999911') then
      DateRangeItems(oldestdate, newestdate, '9999911');
    for i := 0 to lstItems.Items.Count - 1 do
    begin
      filenum := UpperCase(Piece(lstItems.Items[i], '^', 1));
      if filenum <> '405' then
      if filenum <> '52' then
        if filenum <> '55' then
        if filenum <> '55NVA' then
        if filenum <> '9999911' then
          if TypeIsDisplayed(filenum) then
          begin
            lastdate := strtofloatdef(Piece(lstItems.Items[i], '^', 6), -BIG_NUMBER);
            if (lastdate > oldestdate) and (lastdate < newestdate) then
            begin
              filename := FileNameX(filenum);
              itemnum := Piece(lstItems.Items[i], '^', 2);
              UpdateView(filename, filenum, itemnum, lstItems.Items[i], lvwItemsTop);
            end;
          end;
    end;
  end
  else if (cboDateRange.ItemIndex = 0) or (cboDateRange.ItemIndex > 8) then
  begin     // manual date range selection
    for i := 0 to lstAllTypes.Items.Count - 1 do
    begin
      filenum := Piece(lstAllTypes.Items[i], '^', 1);
      if TypeIsDisplayed(filenum) then
      begin
        DateRangeItems(oldestdate, newestdate, filenum);
      end;
    end;
  end;
  lvwItemsBottom.Items.Assign(lvwItemsTop.Items);
  lvwItemsTop.SortType := stBoth;
  lvwItemsBottom.SortType := stBoth;
  colnum := 0;
  if not FItemsSortedTop then
  begin
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[0]);
    FItemsSortedTop := true;
  end;
  if not FItemsSortedBottom then
  begin
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[0]);
    FItemsSortedBottom := true;
  end;
  with FGraphSetting do
  if SortColumn > 0 then
  begin
    colnum := SortColumn;
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[SortColumn]);
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[SortColumn]);
    FItemsSortedTop := false;
    FItemsSortedBottom := false;
  end;
  if cboViewsTop.ItemIndex > 1 then                         // sort by view
  begin
    aProfile := cboViewsTop.Items[cboViewsTop.ItemIndex];
    AssignProfile(aProfile, 'top');
    if not FItemsSortedTop then lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[colnum]);
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[2]);
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[2]);
    FItemsSortedTop := false;
  end;
  if cboViewsBottom.ItemIndex > 1 then                      // sort by view
  begin
    aProfile := cboViewsBottom.Items[cboViewsBottom.ItemIndex];
    AssignProfile(aProfile, 'bottom');
    if not FItemsSortedBottom then lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[colnum]);
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[2]);
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[2]);
    FItemsSortedBottom := false;
  end;
end;

procedure TfrmGraphs.DateRangeItems(oldestdate, newestdate: double; filenum: string);
var
  i, j: integer;
  filename, itemnum, itemstuff, mitemnum: string;
begin
  FastAssign(rpcDateItem(oldestdate, newestdate, filenum, Patient.DFN), lstScratchTemp.Items);
  filename := FileNameX(filenum);
  with lvwItemsTop do
  for i := 0 to lstScratchTemp.Items.Count - 1 do
  begin
    itemstuff := lstScratchTemp.Items[i];
    itemnum := UpperCase(Piece(itemstuff, '^',2));
    for j := 0 to lstItems.Items.Count - 1 do
    if (filenum = UpperCase(Piece(lstItems.Items[j], '^', 1))) and (itemnum = UpperCase(Piece(lstItems.Items[j], '^', 2))) then
      UpdateView(filename, filenum, itemnum, lstItems.Items[j], lvwItemsTop);
    if filenum = '63' then
    for j := 0 to lstMultiSpec.Items.Count - 1 do
    begin
      mitemnum := Piece(lstMultiSpec.Items[j], '^', 2);
      if itemnum = Piece(mitemnum, '.', 1) then
        if DateRangeMultiItems(oldestdate, newestdate, mitemnum) then     //******** check specific date range
          UpdateView(filename, filenum, mitemnum, lstMultiSpec.Items[j], lvwItemsTop);
    end;
  end;
end;

procedure TfrmGraphs.UpdateView(filename, filenum, itemnum, aString: string; aListView: TListView);
var
  drugclass, itemname, itemqualifier: string;
  aGraphItem: TGraphItem;
  aListItem: TListItem;
begin
  itemname := Piece(aString, '^', 4);
  itemqualifier := Pieces(aString, '^', 5, 9);
  itemqualifier := filenum + '^' + itemnum + '^' + itemqualifier;
  drugclass := Piece(aString, '^', 8);
  aListItem := aListView.Items.Add;
  with aListItem do
  begin
    Caption := itemname;
    SubItems.Add(filename);
    SubItems.Add('');
    SubItems.Add(drugclass);
    aGraphItem := TGraphItem.Create;
    aGraphItem.Values := itemqualifier;
    SubItems.AddObject('info object', aGraphItem);
  end;
end;

function TfrmGraphs.DateRangeMultiItems(aOldDate, aNewDate: double; aMultiItem: string): boolean;
var
  i: integer;
  checkdate: double;
  fileitem: string;
begin
  Result := false;
  fileitem := '63^' + aMultiItem;
  for i := 0 to lstData.Items.Count - 1 do
    if Pieces(lstData.Items[i], '^', 1, 2) = fileitem then
    begin
      checkdate := strtofloatdef(Piece(lstData.Items[i], '^', 3), BIG_NUMBER);
      if checkdate <> BIG_NUMBER then
        if checkdate >= aOldDate then
          if checkdate <= aNewDate then
          begin
            Result := true;
            break;
          end;
    end;
end;

function TfrmGraphs.FileNameX(filenum: string): string;
var
  i: integer;
  typestring: string;
begin
  Result := '';
  with lstAllTypes do
  for i := 0 to Items.Count - 1 do
  begin
    typestring := Items[i];
    if Piece(typestring, '^', 1) = filenum then
    begin
      Result := Piece(Items[i], '^', 2);
      break;
    end;
  end;
  if Result = '' then
  begin
    with lstAllTypes do
    for i := 0 to Items.Count - 1 do
    begin
      typestring := Items[i];
      if lowercase(Piece(typestring, '^', 1)) = filenum then
      begin
        Result := Piece(Items[i], '^', 2);
        break;
      end;
    end;
  end;
end;

function TfrmGraphs.ItemName(filenum, itemnum: string): string;
var
  i: integer;
  typestring: string;
begin
  Result := '';
  filenum := UpperCase(filenum);
  itemnum := UpperCase(itemnum);
  with lstItems do
  for i := 0 to Items.Count - 1 do
  begin
    typestring := UpperCase(Items[i]);
    if (Piece(typestring, '^', 1) = filenum) and
      (Piece(typestring, '^', 2) = itemnum) then
    begin
      Result := Piece(typestring, '^', 4);
      break;
    end;
  end;
end;

procedure TfrmGraphs.InitialData;
var
  i, total: integer;
  dfntype, listline: string;
begin
  total := pnlData.ControlCount - 1;
  with pnlData do
  for i:= 0 to total do
    if Controls[i] is TListBox then
      if Controls[i] <> lstAllTypes then
        if Controls[i] <> lstTestSpec then
          (Controls[i] as TListBox).Items.Clear;
  SourcesDefault;
  FSources.Assign(FSourcesDefault);
  btnChangeSettings.Tag :=0;
  btnClose.Tag := 0;
  cboViewsTop.Tag :=0;
  chartDatelineTop.Tag :=0;
  lvwItemsBottom.Tag :=0;
  lvwItemsTop.Tag :=0;
  pnlFooter.Parent.Tag :=0;
  pnlItemsBottom.Tag :=0;
  pnlItemsTop.Tag :=0;
  pnlTop.Tag :=0;
  scrlTop.Tag :=0;
  splGraphs.Tag :=0;
  cboViewsTop.ItemIndex := -1;
  cboViewsBottom.ItemIndex := -1;
  FastAssign(rpcGetTypes(Patient.DFN, false), lstTypes.Items);
  for i := 0 to lstTypes.Items.Count - 1 do
  begin
    dfntype := UpperCase(Piece(lstTypes.Items[i], '^', 1));
    if TypeIsLoaded(dfntype) then
      lstItems.Items.AddStrings(rpcGetItems(dfntype, Patient.DFN));
    listline := lstTypes.Items[i];
    dfntype := UpperCase(Piece(listline, '^', 1));
    SetPiece(listline, '^', 1, dfntype);
    lstTypes.Items[i] := listline;
  end;
  lstTypes.Hint := Patient.DFN;  // use to check for patient change
  FMTimestamp := floattostr(FMNow);
  FPrevEvent := '';
  FWarning := false;
  FFirstSwitch := true;
end;

function TfrmGraphs.TypeIsLoaded(itemtype: string): boolean;
var
  i: integer;
  filetype: string;
begin
  Result := false;
  for i := 0 to FSources.Count - 1 do
  begin
    filetype := Piece(FSources[i], '^', 1);
    if itemtype = filetype then
    begin
      Result := true;
      break;
    end;
  end;
end;

function TfrmGraphs.TypeIsDisplayed(itemtype: string): boolean;
var
  i: integer;
  displayed, filetype: string;
begin
  Result := false;
  for i := 0 to FSources.Count - 1 do
  begin
    filetype := Piece(FSources[i], '^', 1);
    displayed := Piece(FSources[i], '^', 3);
    if (itemtype = filetype) then
    begin
      if displayed = '1' then Result := true;
      break;
    end;
  end;
end;

procedure TfrmGraphs.LoadDateRange;
var
  defaults, defaultrange: string;
begin
  FastAssign(rpcGetGraphDateRange('OR_GRAPHS'), cboDateRange.Items);
  with cboDateRange do
  begin
    defaults := Items[Items.Count - 1];
    defaultrange := Piece(defaults, '^', 1);
    //get report views - param 1 and param 2
    lvwItemsTop.Hint := Piece(defaults,'^', 8);     // top view
    lvwItemsBottom.Hint := Piece(defaults,'^', 9);  // bottom view
    //check if default range already exists
    if strtointdef(defaultrange, BIG_NUMBER) = BIG_NUMBER then
      ItemIndex := Items.Count - 1;
  end;
end;

procedure TfrmGraphs.LoadType(itemtype, displayed: string);
var
  needtoadd: boolean;
  i: integer;
  filename, filetype: string;
begin
  if displayed <> '1' then displayed := '';
  needtoadd := true;
  for i := 0 to FSources.Count - 1 do
  begin
    filetype := Piece(FSources[i], '^', 1);
    if itemtype = filetype then
    begin
      needtoadd := false;
      break;
    end;
  end;
  if needtoadd then
  begin
    filename := FileNameX(itemtype);
    FSources.Add(itemtype + '^' + filename + '^' + displayed);
    lstItems.Items.AddStrings(rpcGetItems(itemtype, Patient.DFN));
  end;
end;

procedure TfrmGraphs.DisplayType(itemtype, displayed: string);
var
  i: integer;
  filename, filetype: string;
begin
  if displayed <> '1' then displayed := '';
  for i := 0 to FSources.Count - 1 do
  begin
    filetype := Piece(FSources[i], '^', 1);
    if itemtype = filetype then
    begin
      filename := FileNameX(itemtype);
      FSources[i] := itemtype + '^' + filename + '^' + displayed;
      break;
    end;
  end;
end;

procedure TfrmGraphs.DisplayData(aSection: string);
var
  aChart: TChart;
  aCheckBox: TCheckBox;
  aListView, aOtherListView: TListView;
  aDateline, aRightPad: TPanel;
  aScrollBox: TScrollBox;
begin
  FHintStop := true;
  SetFontSize(lblViewsTop.Font.Size);
  if aSection = 'top' then
  begin
    aListView := lvwItemsTop;
    aOtherListView := lvwItemsBottom;
    aDateline := pnlDatelineTop;
    aRightPad := pnlTopRightPad;
    aScrollBox := scrlTop;
    aChart := chartDatelineTop;
    aCheckBox := chkItemsTop;
  end
  else
  begin
    aListView := lvwItemsBottom;
    aOtherListView := lvwItemsTop;
    aDateline := pnlDatelineBottom;
    aRightPad := pnlBottomRightPad;
    aScrollBox := scrlBottom;
    aChart := chartDatelineBottom;
    aCheckBox := chkItemsBottom;
  end;
  if aListView.SelCount < 1 then
  begin
    if not FFirstClick then
    begin
      FFirstClick := true;
      while aScrollBox.ControlCount > 0 do
        aScrollBox.Controls[0].Free;
      exit;
    end;
    FFirstClick := false;
    aDateline.Visible := false;
    while aScrollBox.ControlCount > 0 do
      aScrollBox.Controls[0].Free;
    if aOtherListView.SelCount > 0 then
      if aOtherListView = lvwItemsTop then
        ItemsClick(self, lvwItemsTop, lvwItemsBottom, chkItemsTop, cboViewsTop, lstSelCopyTop, 'top')
      else
        ItemsClick(self, lvwItemsBottom, lvwItemsTop, chkItemsBottom, cboViewsBottom, lstSelCopyBottom, 'bottom');
    exit;
  end;
  aScrollBox.VertScrollBar.Visible := false;
  aScrollBox.HorzScrollBar.Visible := false;
  aChart.RemoveAllSeries;    // this would leave bottom dateline visible on date change
  //chartDatelineTop.RemoveAllSeries;    // do both
  //chartDatelineBottom.RemoveAllSeries; // do both
  lstNonNumeric.Items.Clear;
  if aCheckBox.Checked then
    MakeSeparate(aScrollBox, aListView, aRightPad, aSection)
  else
  begin
    MakeTogether(aScrollBox, aListView, aRightPad, aSection);
  end;
  ChangeStyle;
  pnlInfo.Font.Size := lblViewsTop.Font.Size;
  if ((lvwItemsTop.SelCount > MAX_ITEM_DISCLAIMER) and (not chkItemsTop.Checked))
    or ((lvwItemsBottom.SelCount > MAX_ITEM_DISCLAIMER) and (not chkItemsBottom.Checked)) then
  begin
    pnlInfo.Caption := TXT_DISCLAIMER;
    pnlInfo.Color := COLOR_WARNING;
    pnlInfo.Visible := true;
  end
  else
    pnlInfo.Visible := false;
  if btnChangeSettings.Tag > 0 then
  begin
    pnlInfo.Caption := TXT_WARNING;
    pnlInfo.Color := COLOR_WARNING;
    pnlInfo.Visible := true;
  end;
  //if copy(pnlInfo.Caption, 1, 7) = 'Warning' then
  if FWarning then
    pnlInfo.Visible := true;
  pnlHeader.Visible := pnlInfo.Visible;
  aScrollBox.VertScrollBar.Visible := true;
  aScrollBox.HorzScrollBar.Visible := false;
end;

procedure TfrmGraphs.chkItemsTopClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DisplayData('top');
  if FFirstSwitch then   // this code makes events appear better (on first click was not displaying bar)
  begin
    chartBaseMouseDown(chartDatelineTop, mbLeft, [], 1, 1);
    DisplayData('top');
    FFirstSwitch := false;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmGraphs.chkItemsBottomClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DisplayData('bottom');
  if FFirstSwitch then   // this code makes events appear better (on first click was not displaying bar)
  begin
    chartBaseMouseDown(chartDatelineBottom, mbLeft, [], 1, 1);
    DisplayData('bottom');
    FFirstSwitch := false;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmGraphs.BottomAxis(aScrollBox: TScrollBox);
var
  i: integer;
  ChildControl: TControl;
begin
  for i := 0 to aScrollBox.ControlCount - 1 do
  begin
    ChildControl := aScrollBox.Controls[i];
    with (ChildControl as TChart).BottomAxis do
    begin
      Automatic := false;
      Minimum := 0;
      Maximum := chartDatelineTop.BottomAxis.Maximum;
      Minimum := chartDatelineTop.BottomAxis.Minimum;
    end;
  end;
end;

procedure TfrmGraphs.AdjustTimeframe;
begin
  with FGraphSetting do
  begin
    if HighTime = 0 then exit;  // no data to chart clear form ???
    chartDatelineTop.BottomAxis.Minimum := 0;  // avoid possible error
    chartDatelineTop.BottomAxis.Maximum := HighTime;
    if LowTime < HighTime then
      chartDatelineTop.BottomAxis.Minimum := LowTime;
    chartDatelineBottom.BottomAxis.Minimum := 0;  // avoid possible error
    chartDatelineBottom.BottomAxis.Maximum := HighTime;
    if HighTime > FMDateTimeToDateTime(FMStopDate) then
      chartDatelineTop.BottomAxis.Maximum := FMDateTimeToDateTime(FMStopDate);
    if LowTime < FMDateTimeToDateTime(FMStartDate) then
      chartDatelineTop.BottomAxis.Minimum := FMDateTimeToDateTime(FMStartDate);  // *****
  end;
  BottomAxis(scrlTop);
  BottomAxis(scrlBottom);
end;

procedure TfrmGraphs.ChartOnZoom(Sender: TObject);
var
  i: integer;
  padding: double;
  datehx: string;
  BigTime, SmallTime: TDateTime;
  ChildControl: TControl;
begin
  if not (Sender is TChart) then exit;
  if not FGraphSetting.VerticalZoom then
  begin
    padding := 0; //(FYMaxValue - FYMinValue) * ((100 - ZOOM_PERCENT) * 0.01);
    (Sender as TChart).LeftAxis.Maximum := BIG_NUMBER;    // avoid min>max error
    (Sender as TChart).LeftAxis.Minimum := -BIG_NUMBER;
    (Sender as TChart).LeftAxis.Maximum := FYMaxValue + padding;    //padding 0?
    (Sender as TChart).LeftAxis.Minimum := FYMinValue - padding;    //padding 0?
  end;
  SmallTime := (Sender as TChart).BottomAxis.Minimum;
  BigTime := (Sender as TChart).BottomAxis.Maximum;
  if BigTime < SmallTime then BigTime := SmallTime;   // avoid min>max error
  for i := 0 to scrlTop.ControlCount - 1 do
  begin
    ChildControl := scrlTop.Controls[i];
    SizeDates((ChildControl as TChart), SmallTime, BigTime);
  end;
  SizeDates(chartDatelineTop, SmallTime, BigTime);
  for i := 0 to scrlBottom.ControlCount - 1 do
  begin
    ChildControl := scrlBottom.Controls[i];
    SizeDates((ChildControl as TChart), SmallTime, BigTime);
  end;
  SizeDates(chartDatelineBottom, SmallTime, BigTime);
  if FMouseDown and (Sender as TChart).Zoomed then
  begin
    datehx := FloatToStr(SmallTime) + '^' + FloatToStr(BigTime);
    lstZoomHistory.Items.Add(datehx);
    mnuPopGraphZoomBack.Enabled := true;
    FMouseDown := false;
    ZoomUpdateinfo(SmallTime, BigTime);
  end;
end;

procedure TfrmGraphs.ChartOnUndoZoom(Sender: TObject);
var
  i: integer;
  padding: double;
  BigTime, SmallTime: TDateTime;
  ChildControl: TControl;
begin
  if not (Sender is TChart) then exit;
  FRetainZoom := false;
  mnuPopGraphZoomBack.Enabled := false;
  lstZoomHistory.Items.Clear;
  if not FGraphSetting.VerticalZoom then
  begin
    padding := 0; //(FYMaxValue - FYMinValue) * ((100 - ZOOM_PERCENT) * 0.01);
    (Sender as TChart).LeftAxis.Maximum := BIG_NUMBER;    // avoid min>max error
    (Sender as TChart).LeftAxis.Minimum := -BIG_NUMBER;
    (Sender as TChart).LeftAxis.Maximum := FYMaxValue + padding;    //padding 0?
    (Sender as TChart).LeftAxis.Minimum := FYMinValue - padding;    //padding 0?
  end;
  SmallTime := (Sender as TChart).BottomAxis.Minimum;
  BigTime := (Sender as TChart).BottomAxis.Maximum;
  if BigTime < SmallTime then BigTime := SmallTime;   // avoid min>max error
  for i := 0 to scrlTop.ControlCount - 1 do
  begin
    ChildControl := scrlTop.Controls[i];
    SizeDates((ChildControl as TChart), SmallTime, BigTime);
  end;
  SizeDates(chartDatelineTop, SmallTime, BigTime);
  for i := 0 to scrlBottom.ControlCount - 1 do
  begin
    ChildControl := scrlBottom.Controls[i];
    SizeDates((ChildControl as TChart), SmallTime, BigTime);
  end;
  SizeDates(chartDatelineBottom, SmallTime, BigTime);
  if FMouseDown then
  begin
    FMouseDown := false;
    pnlInfo.Caption := '';
    pnlInfo.Color := COLOR_INFO;
    pnlInfo.Visible := false;
    pnlHeader.Visible := false;
  end;
end;

procedure TfrmGraphs.SizeDates(aChart: TChart; aSmallTime, aBigTime: TDateTime);
var
  datediff, yeardiff: integer;
begin
  with aChart.BottomAxis do
  begin
    Automatic := false;
    Maximum := BIG_NUMBER;    // avoid min>max error
    Minimum := -BIG_NUMBER;
    Minimum := aSmallTime;
    Maximum := aBigTime;
    Increment := DateTimeStep[dtOneMinute];
    datediff := DaysBetween(aBigTime, aSmallTime);
    yeardiff := datediff div 365;
    DateTimeFormat := '';
    Labels := true;
    if yeardiff > 0 then
    begin
      if (pnlScrollTopBase.Width div yeardiff) < DWIDTH_MDY then
        DateTimeFormat := DFORMAT_MYY;
      if (pnlScrollTopBase.Width div yeardiff) < DWIDTH_MYY then
        DateTimeFormat := DFORMAT_YY;
      if (pnlScrollTopBase.Width div yeardiff) < DWIDTH_YY then
        Labels := false;
    end;
  end;
  if datediff < 1 then
  begin
    if not aChart.Foot.Visible then
    begin
      aChart.Foot.Text.Clear;
      aChart.Foot.Text.Insert(0, FormatDateTime('mmm d, yyyy', aSmallTime));
      aChart.Foot.Font.Color := clBtnText;
      aChart.Foot.Visible := true;
    end;
  end
  else
    aChart.Foot.Visible := false;
end;

procedure TfrmGraphs.MakeSeparate(aScrollBox: TScrollBox; aListView:
  TListView; aPadPanel: TPanel; section: string);
var
  acnt, bcnt, displayheight, displaynum, gcnt, graphtype, i, j, lcnt, ncnt, pcnt, vcnt: integer;
  aTitle, checkdata, filetype, high, low, specimen, specnum, typeitem, units: string;
  newchart: TChart;
  aGraphItem: TGraphItem;
begin
  FNonNumerics := false;
  if section = 'top' then pnlItemsTop.Tag := 0 else pnlItemsBottom.Tag := 0;
  while aScrollBox.ControlCount > 0 do
    aScrollBox.Controls[0].Free;
  aPadPanel.Visible := false;
  if FGraphSetting.Hints then         //**************
  begin
    chartDatelineTop.OnMouseMove := chartBaseMouseMove;
    chartDatelineBottom.OnMouseMove := chartBaseMouseMove;
  end
  else
  begin
    chartDatelineTop.OnMouseMove := nil;
    chartDatelineBottom.OnMouseMove := nil;
  end;
  pcnt := 0; gcnt := 0; vcnt := 0; lcnt := 0; ncnt := 0; bcnt := 0; acnt := 0;
  for j := 0 to aListView.Items.Count - 1 do
  if aListView.Items[j].Selected then
  begin
    aGraphItem := TGraphItem(aListView.Items.Item[j].SubItems.Objects[3]);
    filetype := UpperCase(Piece(aGraphItem.Values, '^', 1));
    typeitem := UpperCase(Piece(aGraphItem.Values, '^', 2));
    graphtype := GraphTypeNum(filetype); //*****strtointdef(Piece(aListBox.Items[j], '^', 2), 1);
    if (filetype = '63') and (lstData.Items.Count > 0) then
    begin
      checkdata := '';
      for i := 0 to lstData.Items.Count - 1 do
      begin
        checkdata := lstData.Items[i];
        if (Piece(checkdata, '^', 1) = '63') and (Piece(checkdata, '^', 2) = typeitem) then
          break;
      end;
      specnum := Piece(checkdata, '^', 7);
      specimen := Piece(checkdata, '^', 8);
      RefUnits(typeitem, specnum, low, high, units);
      units := LowerCase(units);
      if units = '' then units := '  ';
    end
    else
    begin
      specimen := ''; low := ''; high := ''; units := '';
    end;
    aTitle := filetype + '^' + typeitem + '^' + aListView.Items[j].Caption + '^' +
              specimen + '^' + low + '^' + high + '^' + units;
    newchart := TChart.Create(self);
    with newchart do
    begin
      Parent := aScrollBox;
      View3D := false;
      height := 170;
      Align := alBottom;
      Align := alTop;
      AllowPanning := pmNone;
      Legend.LegendStyle := lsSeries;
      Legend.ShadowSize := 1;
      Legend.Color := clCream;
      Legend.VertMargin := 0;
      Legend.Alignment := laTop;
      Legend.Visible := true;
      Gradient.EndColor := clGradientActiveCaption;
      //SetPiece(aTitle, '^', 3, 'zzzz: ' + Piece(aTitle, '^', 3)); // test prefix
      if (graphtype = 1) and (btnChangeSettings.Tag = 1) then
        LeftAxis.Title.Caption := 'StdDev'
      else if (graphtype = 1) and (btnChangeSettings.Tag = 2) then
      begin
        LeftAxis.Title.Caption := '1/' + units;
        SetPiece(aTitle, '^', 3, 'Inverse ' + Piece(aTitle, '^', 3));
      end
      else
        LeftAxis.Title.Caption := units;
      if graphtype <> 1 then
      begin
        LeftAxis.Visible := false;
        MarginLeft := round((50 / (pnlScrollTopBase.Width + 1)) * 100);       // ************* marginleft is a %
      end;
      BottomAxis.ExactDateTime := true;
      BottomAxis.Increment := DateTimeStep[dtOneMinute];
      HideDates(newchart);
      BevelOuter := bvNone;
      OnZoom := ChartOnZoom;
      OnUndoZoom := ChartOnUndoZoom;
      OnClickSeries := chartBaseClickSeries;
      OnClickLegend := chartBaseClickLegend;
      OnDblClick := mnuPopGraphDetailsClick;
      OnMouseDown := chartBaseMouseDown;
      if FGraphSetting.Hints then             //*****
        OnMouseMove := chartBaseMouseMove
      else
        OnMouseMove := nil;
    end;
    splGraphs.Tag := 1;    // show ref ranges
    if graphtype = 4 then graphtype := 2;         // change points to be bars
    case graphtype of
      1:  MakeLineSeries(newchart, aTitle, filetype, lcnt, ncnt, false);
      2:  MakeBarSeries(newchart, aTitle, filetype, bcnt);
      3:  MakeVisitGanttSeries(newchart, aTitle, filetype, vcnt);
      4:  MakePointSeries(newchart, aTitle, filetype, pcnt);
      5:  MakeArrowSeries(newchart, aTitle, filetype, acnt);
      6:  MakeGanttSeries(newchart, aTitle, filetype, gcnt);
      7:  MakeAGanttSeries(newchart, aTitle, filetype, gcnt);
      8:  MakeManyGanttSeries(newchart, aTitle, filetype, gcnt);
      9:  MakeWeightedArrowSeries(newchart, aTitle, filetype, acnt);
     10:  MakeWeightedGanttSeries(newchart, aTitle, filetype, gcnt);
    end;
  end;
  if section = 'top' then
  begin
    pnlDatelineTop.Align := alBottom;
    pnlDatelineTop.Height := 30;
    scrlTop.Align := alClient;
    pnlDatelineTop.Visible := false;
  end
  else
  begin
    pnlDatelineBottom.Align := alBottom;
    pnlDatelineBottom.Height := 30;
    scrlBottom.Align := alClient;
    pnlDatelineBottom.Visible := false;
  end;
  with aScrollBox do
  begin
    if ControlCount < FGraphSetting.MaxGraphs then        //**** formating should be made for top & bottom
      displaynum := ControlCount
    else
      displaynum := FGraphSetting.MaxGraphs;
    if displaynum = 0 then
      displaynum := 3;
    if (Height div displaynum) < FGraphSetting.MinGraphHeight then
      displayheight := FGraphSetting.MinGraphHeight
    else
      displayheight := (Height div displaynum);
    for i := 0 to aScrollBox.ControlCount - 1 do
      Controls[i].height := displayheight;
  end;
  if (FGraphSetting.HighTime = FGraphSetting.LowTime)
  or (lcnt = 1) or (pcnt = 1) or (bcnt = 1) or (vcnt = 1) then
  begin
    FGraphSetting.HighTime := FGraphSetting.HighTime + 1;
    FGraphSetting.LowTime := FGraphSetting.LowTime - 1;
  end;
  AdjustTimeframe;
  if chartDatelineTop.Visible then chartDatelineTop.ZoomPercent(ZOOM_PERCENT);
  if chartDatelineBottom.Visible then chartDatelineBottom.ZoomPercent(ZOOM_PERCENT);
  if FNonNumerics then
    if section = 'top' then pnlItemsTop.Tag := 1
    else pnlItemsBottom.Tag := 1;
end;

procedure TfrmGraphs.MakeTogether(aScrollBox: TScrollBox; aListView:
  TListView; aPadPanel: TPanel; section: string);
var
  anylines, nolines, onlylines, singlelabtest: boolean;
  acnt, bcnt, cnt, gcnt, graphtype, i, j, lcnt, ncnt, pcnt, vcnt: integer;
  portion: double;
  aTitle, checkdata, filetype, high, low, specimen, specnum, typeitem, units: string;
  newchart: TChart;
  aGraphItem: TGraphItem;
begin
  pcnt := 0; gcnt := 0; lcnt := 0; ncnt := 0; bcnt := 0; acnt := 0;
  onlylines := true;
  anylines := false;
  nolines := true;
  FNonNumerics := false;
  if section = 'top' then pnlItemsTop.Tag := 0 else pnlItemsBottom.Tag := 0;
  if FGraphSetting.Hints then       //******
  begin
    chartDatelineTop.OnMouseMove := chartBaseMouseMove;
    chartDatelineBottom.OnMouseMove := chartBaseMouseMove;
  end
  else
  begin
    chartDatelineTop.OnMouseMove := nil;
    chartDatelineBottom.OnMouseMove := nil;
  end;
  for j := 0 to aListView.Items.Count - 1 do
  if aListView.Items[j].Selected then
  begin
    aGraphItem := TGraphItem(aListView.Items.Item[j].SubItems.Objects[3]);
    filetype := UpperCase(Piece(aGraphItem.Values, '^', 1));
    typeitem := UpperCase(Piece(aGraphItem.Values, '^', 2));
    if aListView.SelCount = 1 then                 // one lab test - make separate
    begin
      if filetype = '63' then
      begin
        MakeSeparate(aScrollBox, aListView, aPadPanel, section);
        exit;
      end;
    end;
    graphtype := GraphTypeNum(filetype);
    case graphtype of
    1: lcnt := lcnt + 1;
    2: bcnt := bcnt + 1;
    3: vcnt := vcnt + 1;
    4: pcnt := pcnt + 1;
    5: acnt := acnt + 1;
    6: gcnt := gcnt + 1;
    7: gcnt := gcnt + 1;
    8: gcnt := gcnt + 1;
    9: acnt := acnt + 1;
    end;
    if graphtype = 1 then
    begin
      anylines := true;
      nolines := false;
    end
    else
      onlylines := false;
  end;
  if section = 'top' then
    chkItemsTop.Checked := false
  else
    chkItemsBottom.Checked := false;
  lstTempCheck.Items.Clear;
  while aScrollBox.ControlCount > 0 do
    aScrollBox.Controls[0].Free;
  newchart := TChart.Create(self);  // whynot use base?
  with newchart do          // if a single line graph do lab stuff (ref range, units) ****************************************
  begin
    Parent := aScrollBox;
    View3D := false;
    Chart3DPercent := 10;
    AllowPanning := pmNone;
    Align := alClient;
    Gradient.EndColor := clGradientActiveCaption;
    Legend.LegendStyle := lsSeries;
    Legend.ShadowSize := 1;
    Legend.Color := clCream;
    Legend.VertMargin := 0;
    Legend.Alignment := laTop;
    Legend.Visible := true;
    LeftAxis.Title.Caption := ' ';
    BottomAxis.ExactDateTime := true;
    BottomAxis.Increment := DateTimeStep[dtOneMinute];
    HideDates(newchart);
    BevelOuter := bvNone;
    OnZoom := ChartOnZoom;
    OnUndoZoom := ChartOnUndoZoom;
    OnClickSeries := chartBaseClickSeries;
    OnClickLegend := chartBaseClickLegend;
    OnDblClick := mnuPopGraphDetailsClick;
    OnMouseDown := chartBaseMouseDown;
    if FGraphSetting.Hints then               //******
      OnMouseMove := chartBaseMouseMove
    else
      OnMouseMove := nil;
    Visible := false;
  end;
  aPadPanel.Visible := true;
  portion := PortionSize(lcnt, pcnt, gcnt, vcnt, bcnt, acnt);
  if section = 'top' then
    SizeTogether(onlylines, nolines, anylines, scrlTop, newchart,
      pnlDatelineTop, pnlScrollTopBase, portion)
  else
    SizeTogether(onlylines, nolines, anylines, scrlBottom, newchart,
      pnlDatelineBottom, pnlScrollBottomBase, portion);
  if btnChangeSettings.Tag = 1 then  splGraphs.Tag := 1 // show ref ranges
  else splGraphs.Tag := 0;

  if nolines then
  begin
    pcnt := 0; gcnt := 0; vcnt := 0; bcnt := 0; acnt := 0;
    for j := 0 to aListView.Items.Count - 1 do
    if aListView.Items[j].Selected then
    begin
      aGraphItem := TGraphItem(aListView.Items.Item[j].SubItems.Objects[3]);
      filetype := Piece(aGraphItem.Values, '^', 1);
      typeitem := Piece(aGraphItem.Values, '^', 2);
      aTitle := filetype + '^' + typeitem + '^' + aListView.Items[j].Caption + '^';
      graphtype := GraphTypeNum(filetype);
      if section = 'top' then
        MakeDateline(section, aTitle, filetype, chartDatelineTop, graphtype, bcnt, pcnt, gcnt, vcnt, acnt)
      else
        MakeDateline(section, aTitle, filetype, chartDatelineBottom, graphtype, bcnt, pcnt, gcnt, vcnt, acnt);
    end;
    if section = 'top' then
    begin
      scrlTop.Align := alTop;
      scrlTop.Height := 1; //pnlScrollTopBase.Height div 4;
      pnlDatelineTop.Align := alClient;
      pnlDatelineTop.Visible := true;
    end
    else
    begin
      scrlBottom.Align := alTop;
      scrlBottom.Height := 1; //pnlScrollBottomBase.Height div 4;
      pnlDatelineBottom.Align := alClient;
      pnlDatelineBottom.Visible := true;
    end;
  end
  else if onlylines then
  begin
    lcnt := 0;
    for j := 0 to aListView.Items.Count - 1 do
    if aListView.Items[j].Selected then
    begin
      aGraphItem := TGraphItem(aListView.Items.Item[j].SubItems.Objects[3]);
      filetype := Piece(aGraphItem.Values, '^', 1);
      typeitem := Piece(aGraphItem.Values, '^', 2);
      if (filetype = '63') and (lstData.Items.Count > 0) then    //***********
      begin
        checkdata := '';
        for i := 0 to lstData.Items.Count - 1 do
        begin
          checkdata := lstData.Items[i];
          if (Piece(checkdata, '^', 1) = '63') and (Piece(checkdata, '^', 2) = typeitem) then
            break;
        end;
        specnum := Piece(checkdata, '^', 7);
        specimen := Piece(checkdata, '^', 8);
        RefUnits(typeitem, specnum, low, high, units);
        units := LowerCase(units);
        if units = '' then units := '  ';
      end
      else
      begin
        specimen := ''; low := ''; high := ''; units := '';
      end;
      aTitle := filetype + '^' + typeitem + '^' + aListView.Items[j].Caption + '^' +
                specimen + '^' + low + '^' + high + '^' + units;
      MakeLineSeries(newchart, aTitle, filetype, lcnt, ncnt, true)
    end;
    if section = 'top' then
    begin
      pnlDatelineTop.Align := alBottom;
      pnlDatelineTop.Height := 5;
      scrlTop.Align := alClient;
      pnlDatelineTop.Visible := false;
    end
    else
    begin
      pnlDatelineBottom.Align := alBottom;
      pnlDatelineBottom.Height := 5;
      scrlBottom.Align := alClient;
      pnlDatelineBottom.Visible := false;
    end;
    with newchart do
    begin
      if btnChangeSettings.Tag = 1 then
        LeftAxis.Title.Caption := 'StdDev';
      Visible := true;
    end;
  end
  else if anylines then
  begin
    pcnt := 0; gcnt := 0; vcnt := 0; lcnt := 0; ncnt := 0; bcnt := 0; acnt := 0;
    cnt := 0;
    for j := 0 to aListView.Items.Count - 1 do
    if aListView.Items[j].Selected then
    begin
      aGraphItem := TGraphItem(aListView.Items.Item[j].SubItems.Objects[3]);
      filetype := Piece(aGraphItem.Values, '^', 1);
      if filetype = '120.5' then
      begin
        cnt := BIG_NUMBER;
        break;
      end;
      if filetype = '63' then
        cnt := cnt + 1;
      if cnt > 1 then
        break;
    end;
    singlelabtest := cnt = 1;
    for j := 0 to aListView.Items.Count - 1 do
    if aListView.Items[j].Selected then
    begin
      aGraphItem := TGraphItem(aListView.Items.Item[j].SubItems.Objects[3]);
      filetype := Piece(aGraphItem.Values, '^', 1);
      typeitem := Piece(aGraphItem.Values, '^', 2);
      if (filetype = '63') and (lstData.Items.Count > 0) then    //***********
      begin
        checkdata := '';
        for i := 0 to lstData.Items.Count - 1 do
        begin
          checkdata := lstData.Items[i];
          if (Piece(checkdata, '^', 1) = '63') and (Piece(checkdata, '^', 2) = typeitem) then
            break;
        end;
        specnum := Piece(checkdata, '^', 7);
        specimen := Piece(checkdata, '^', 8);
        RefUnits(typeitem, specnum, low, high, units);
        units := LowerCase(units);
        if units = '' then units := '  ';
      end
      else
      begin
        specimen := ''; low := ''; high := ''; units := '';
      end;
      aTitle := filetype + '^' + typeitem + '^' + aListView.Items[j].Caption + '^' +
                specimen + '^' + low + '^' + high + '^' + units;
      graphtype := GraphTypeNum(filetype);
      if graphtype = 1 then
      begin
        if btnChangeSettings.Tag = 1 then
          newchart.LeftAxis.Title.Caption := 'StdDev'
        else
          newchart.LeftAxis.Title.Caption := units;
        if singlelabtest then
          splGraphs.Tag := 1
        else
          splGraphs.Tag := 0;
        MakeLineSeries(newchart, aTitle, filetype, lcnt, ncnt, true);
      end
      else if section = 'top' then
        MakeDateline(section, aTitle, filetype, chartDatelineTop, graphtype, bcnt, pcnt, gcnt, vcnt, acnt)
      else
        MakeDateline(section, aTitle, filetype, chartDatelineBottom, graphtype, bcnt, pcnt, gcnt, vcnt, acnt);
    end;
    if section = 'top' then
    begin
      scrlTop.Align := alTop;
      pnlDatelineTop.Align := alBottom;
      pnlDatelineTop.Height := pnlScrollTopBase.Height div 2;
      scrlTop.Align := alClient;
      pnlDatelineTop.Visible := true;
    end
    else
    begin
      scrlBottom.Align := alTop;
      pnlDatelineBottom.Align := alBottom;
      pnlDatelineBottom.Height := pnlScrollBottomBase.Height div 2;
      scrlBottom.Align := alClient;
      pnlDatelineBottom.Visible := true;
    end;
    with newchart do
    begin
      if btnChangeSettings.Tag = 1 then
        LeftAxis.Title.Caption := 'StdDev';
      Visible := true;
    end;
  end;
  if (FGraphSetting.HighTime = FGraphSetting.LowTime)
  or (lcnt = 1) or (pcnt = 1) or (bcnt = 1) or (acnt = 1) or (vcnt = 1) then
  begin
    FGraphSetting.HighTime := FGraphSetting.HighTime + 1;
    FGraphSetting.LowTime := FGraphSetting.LowTime - 1;
    chartDatelineTop.LeftAxis.Minimum := chartDatelineTop.LeftAxis.Minimum - 0.5;
    chartDatelineTop.LeftAxis.Maximum := chartDatelineTop.LeftAxis.Maximum + 0.5;
    chartDatelineBottom.LeftAxis.Minimum := chartDatelineBottom.LeftAxis.Minimum - 0.5;
    chartDatelineBottom.LeftAxis.Maximum := chartDatelineBottom.LeftAxis.Maximum + 0.5;
  end;
  AdjustTimeframe;
  if chartDatelineTop.Visible then chartDatelineTop.ZoomPercent(ZOOM_PERCENT);
  if chartDatelineBottom.Visible then chartDatelineBottom.ZoomPercent(ZOOM_PERCENT);
  if FNonNumerics then
    if section = 'top' then pnlItemsTop.Tag := 1
    else pnlItemsBottom.Tag := 1;
end;

function TfrmGraphs.PortionSize(lcnt, pcnt, gcnt, vcnt, bcnt, acnt: integer): double;
var
  etotal, evalue, dvalue, value: double;
begin
  dvalue := (gcnt + vcnt + acnt);
  evalue := (pcnt + bcnt) / 2;
  etotal := dvalue + evalue;
  if etotal > 0 then
  begin
    value := lcnt / etotal;
    if value > 4 then Result := 0.2
    else if etotal < 5 then Result := 0.2
    else if value < 0.25 then Result := 0.8
    else if value < 0.4 then Result := 0.6
    else Result := 0.5;
  end
  else
    Result := 0;
end;

procedure TfrmGraphs.MakeDateline(section, aTitle, aFileType: string; aChart: TChart; graphtype: integer;
  var bcnt, pcnt, gcnt, vcnt, acnt: integer);
begin
  aChart.LeftAxis.Automatic := true;
  aChart.LeftAxis.Visible := true;
  //if graphtype = 4 then graphtype := 2;    // makes all points into bars
  case graphtype of
    2:  MakeBarSeries(aChart, aTitle, aFileType, bcnt);
    3:  MakeVisitGanttSeries(aChart, aTitle, aFileType, vcnt);
    4:  MakePointSeries(aChart, aTitle, aFileType, pcnt);
    5:  MakeArrowSeries(aChart, aTitle, aFileType, acnt);
    6:  MakeGanttSeries(aChart, aTitle, aFileType, gcnt);
    7:  MakeAGanttSeries(aChart, aTitle, aFileType, gcnt);
    8:  MakeManyGanttSeries(aChart, aTitle, aFileType, gcnt);
    9:  MakeWeightedArrowSeries(aChart, aTitle, aFileType, acnt);
   10:  MakeWeightedGanttSeries(aChart, aTitle, aFileType, gcnt);
  end;
end;

procedure TfrmGraphs.SizeTogether(onlylines, nolines, anylines: Boolean; aScroll: TScrollBox;
  aChart: TChart; aPanel, aPanelBase: TPanel; portion: Double);
begin
  if onlylines then                     //top &bottom
  begin
    aScroll.Align := alTop;
    aScroll.Height := 1;
    aChart.Visible := false;
    aPanel.Align := alClient;
    aPanel.Visible := true;
  end
  else if nolines then
  begin
    aPanel.Align := alBottom;
    aPanel.Height := 5;
    aScroll.Align := alClient;
    aPanel.Visible := false;
    if btnChangeSettings.Tag = 1 then
      aChart.LeftAxis.Title.Caption := 'StdDev';
  end
  else if anylines then
  begin
    aScroll.Align := alTop;
    aPanel.Align := alBottom;
    aPanel.Height := round(aPanelBase.Height * portion);
    if aPanel.Height < 60 then
      if aPanelBase.Height > 100 then aPanel.Height := 60;           //***
    aScroll.Align := alClient;
    aPanel.Visible := true;
    if btnChangeSettings.Tag = 1 then
      aChart.LeftAxis.Title.Caption := 'StdDev';
  end;
end;

function TfrmGraphs.Vfactor(aTitle: string): double;  // returns first numbers in string
var
  firstnum: boolean;
  i: integer;
  vfactor: string;
begin
  vfactor := '';
  firstnum := false;
  for i := 0 to length(aTitle) - 1 do
    if IsDelimiter('1234567890.', aTitle, i) then
    begin
      vfactor := vfactor + aTitle[i];
      firstnum := true;
    end
    else
      if firstnum = true then break;
  Result := strtofloatdef(vfactor, 1);
end;

function TfrmGraphs.NextColor(aCnt: integer): TColor;
begin
  case (aCnt mod NUM_COLORS) of
    1: Result := clRed;
    2: Result := clBlue;
    3: Result := clYellow;
    4: Result := clGreen;
    5: Result := clFuchsia;
    6: Result := clMoneyGreen;
    7: Result := clOlive;
    8: Result := clLime;
    9: Result := clMedGray;
   10: Result := clNavy;
   11: Result := clAqua;
   12: Result := clGray;
   13: Result := clSkyBlue;
   14: Result := clTeal;
   15: Result := clBlack;
    0: Result := clPurple;
   16: Result := clMaroon;
   17: Result := clCream;
   18: Result := clSilver;
   else
       Result := clWhite;
   end;
end;


procedure TfrmGraphs.mnuPopGraphSwapClick(Sender: TObject);
var
  tempcheck: boolean;
  bottomview, i, j, topview: integer;
  typeitem: string;
  aGraphItem: TGraphItem;
begin
  FFirstClick := true;
  if (lvwItemsTop.SelCount = 0) and (lvwItemsBottom.SelCount = 0) then exit;
  topview := cboViewsTop.ItemIndex;
  bottomview := cboViewsBottom.ItemIndex;
  HideGraphs(true);
  with chkDualViews do
    if not Checked then
    begin
      Checked := true;
      Click;
    end;
  tempcheck := chkItemsTop.Checked;
  chkItemsTop.Checked := chkItemsBottom.Checked;
  chkItemsBottom.Checked := tempcheck;
  pnlBottom.Height := pnlMain.Height - pnlBottom.Height;
  lstScratchSwap.Items.Clear;
  if topview < 1 then
    with lvwItemsTop do
    for i := 0 to Items.Count - 1 do
      if Items[i].Selected then
      begin
        aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);
        lstScratchSwap.Items.Add(aGraphItem.Values);
      end;
  if bottomview > 0 then
  begin
    cboViewsTop.ItemIndex := bottomview;
    cboViewsTopChange(self);
  end
  else
  begin
    cboViewsTop.ItemIndex := -1;
    cboViewsTop.Text := '';
    lvwItemsTop.ClearSelection;
    with lvwItemsBottom do
    for i := 0 to Items.Count - 1 do
    if Items[i].Selected then
    begin
      aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);
      typeitem := Pieces(aGraphItem.Values, '^', 1, 2);
      for j := 0 to lvwItemsTop.Items.Count - 1 do
      begin
        aGraphItem := TGraphItem(lvwItemsTop.Items[j].SubItems.Objects[3]);
        if typeitem = Pieces(aGraphItem.Values, '^', 1, 2) then
        begin
          lvwItemsTop.Items[j].Selected := true;
          break;
        end;
      end;
    end;
    lvwItemsTopClick(self);
  end;
  if topview > 0 then
  begin
    cboViewsBottom.ItemIndex := topview;
    cboViewsBottomChange(self);
  end
  else
  begin
    cboViewsBottom.ItemIndex := -1;
    cboViewsBottom.Text := '';
    lvwItemsBottom.ClearSelection;
    with lstScratchSwap do
    for i := 0 to Items.Count - 1 do
      for j := 0 to lvwItemsBottom.Items.Count - 1 do
      begin
        aGraphItem := TGraphItem(lvwItemsBottom.Items.Item[j].SubItems.Objects[3]);
        if aGraphItem.Values = Items[i] then
        begin
          lvwItemsBottom.Items[j].Selected := true;
          break;
        end;
      end;
    lvwItemsBottomClick(self);
  end;
  lstScratchSwap.Items.Clear;
  HideGraphs(false);
end;

procedure TfrmGraphs.mnuPopGraphSplitClick(Sender: TObject);
var
  i: integer;
  typeitem, typenum: string;
  aGraphItem: TGraphItem;
begin
  FFirstClick := true;
  if (lvwItemsTop.SelCount = 0) and (lvwItemsBottom.SelCount = 0) then exit;
  HideGraphs(true);
  with chkDualViews do
    if not Checked then
    begin
      Checked := true;
      Click;
    end;
  with cboViewsTop do
    if ItemIndex > -1 then
    begin
      ItemIndex := -1;
      Text := '';
    end;
  with cboViewsBottom do
    if ItemIndex > -1 then
    begin
      ItemIndex := -1;
      Text := '';
    end;
  chkItemsTop.Checked := true;
  chkItemsBottom.Checked := false;
  pnlBottom.Height := pnlMain.Height - pnlBottom.Height;
  lstScratchSwap.Items.Clear;
  with lvwItemsTop do
    for i := 0 to Items.Count - 1 do
    if Items[i].Selected then
    begin
      aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);
      typeitem := Pieces(aGraphItem.Values, '^', 1, 2);
      lstScratchSwap.Items.Add(typeitem);
    end;
  with lvwItemsBottom do
    for i := 0 to Items.Count - 1 do
    if Items[i].Selected then
    begin
      aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);
      typeitem := Pieces(aGraphItem.Values, '^', 1, 2);
      lstScratchSwap.Items.Add(typeitem);
    end;
  lvwItemsTop.ClearSelection;
  lvwItemsBottom.ClearSelection;
  with lstScratchSwap do
    for i := 0 to Items.Count - 1 do
    begin
      typeitem := Items[i];
      typenum := Piece(typeitem, '^', 1);
      if (typenum = '63') or (typenum = '120.5') then
        SelectItem(lvwItemsTop, typeitem)
      else
        SelectItem(lvwItemsBottom, typeitem);
    end;
  lvwItemsTopClick(self);
  lvwItemsBottomClick(self);
  lstScratchSwap.Items.Clear;
  HideGraphs(false);
end;

procedure TfrmGraphs.SelectItem(aListView: TListView; typeitem: string);
var
  i: integer;
  aGraphItem: TGraphItem;
begin
  with aListView do
    for i := 0 to Items.Count - 1 do
    begin
      aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);
      if typeitem = Pieces(aGraphItem.Values, '^', 1, 2) then
        Items[i].Selected := true;
    end;
end;

procedure TfrmGraphs.mnuPopGraphLinesClick(Sender: TObject);
begin
  with FGraphSetting do Lines := not Lines;
  ChangeStyle;
end;

procedure TfrmGraphs.mnuPopGraph3DClick(Sender: TObject);
begin
  with FGraphSetting do View3D := not View3D;
  ChangeStyle;
end;

procedure TfrmGraphs.mnuPopGraphValuesClick(Sender: TObject);
begin
  with FGraphSetting do Values := not Values;
  ChangeStyle;
end;

procedure TfrmGraphs.mnuPopGraphSortClick(Sender: TObject);
begin
  with FGraphSetting do
  begin
    if SortColumn = 1 then SortColumn := 0
    else SortColumn := 1;
    mnuPopGraphSort.Checked := SortColumn = 1;
    if not FItemsSortedTop then
    begin
      lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[0]);
      FItemsSortedTop := true;
    end;
    if not FItemsSortedBottom then
    begin
      lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[0]);
      FItemsSortedBottom := true;
    end;
    if SortColumn > 0 then
    begin
      lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[SortColumn]);
      lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[SortColumn]);
      FItemsSortedTop := false;
      FItemsSortedBottom := false;
    end;
  end;
end;

procedure TfrmGraphs.mnuPopGraphClearClick(Sender: TObject);
begin
  with FGraphSetting do
  begin
    ClearBackground := not ClearBackground;
    if ClearBackground then Gradient := false;
  end;
  ChangeStyle;
  // redisplay if nonnumericonly graph exists
  if pnlItemsTop.Tag = 1 then lvwItemsTopClick(self);
  if pnlItemsBottom.Tag = 1 then lvwItemsBottomClick(self);
end;

procedure TfrmGraphs.mnuPopGraphHorizontalClick(Sender: TObject);
begin
  with FGraphSetting do
  begin
    HorizontalZoom := not HorizontalZoom;
    mnuPopGraphHorizontal.Checked := HorizontalZoom;
    if not HorizontalZoom then mnuPopGraphResetClick(self);
  end;
end;

procedure TfrmGraphs.mnuPopGraphVerticalClick(Sender: TObject);
begin
  with FGraphSetting do
  begin
    VerticalZoom := not VerticalZoom;
    mnuPopGraphVertical.Checked := VerticalZoom;
    if not VerticalZoom then mnuPopGraphResetClick(self);
  end;
end;

procedure TfrmGraphs.mnuPopGraphDatesClick(Sender: TObject);
begin
  with FGraphSetting do Dates := not Dates;
  ChangeStyle;
end;

procedure TfrmGraphs.mnuPopGraphDualViewsClick(Sender: TObject);
begin
  chkDualViews.Checked := not chkDualViews.Checked;
  chkDualViewsClick(self);
end;

procedure TfrmGraphs.mnuPopGraphSeparate1Click(Sender: TObject);
begin
  with mnuPopGraphSeparate1 do
    Checked := not Checked;
  with chkItemsTop do
  begin
    Checked := mnuPopGraphSeparate1.Checked;
    Click;
  end;
  with chkItemsBottom do
  begin
    Checked := mnuPopGraphSeparate1.Checked;
    Click;
  end;
end;

procedure TfrmGraphs.mnuPopGraphGradientClick(Sender: TObject);
begin
  with FGraphSetting do
  begin
    Gradient := not Gradient;
    if Gradient then ClearBackground := false;
  end;
  ChangeStyle;
end;

procedure TfrmGraphs.mnuPopGraphHintsClick(Sender: TObject);
begin
  with FGraphSetting do
    Hints := not Hints;
  ChangeStyle;
end;

procedure TfrmGraphs.mnuPopGraphLegendClick(Sender: TObject);
begin
  with FGraphSetting do Legend := not Legend;
  ChangeStyle;
end;

procedure TfrmGraphs.ChartStyle(aChart: TChart);
var
  j: integer;
begin
  with aChart do
  begin
    View3D := FGraphSetting.View3D;
    Chart3DPercent := 10;
    AllowZoom := FGraphSetting.HorizontalZoom;
    Gradient.Visible := FGraphSetting.Gradient;
    Legend.Visible := FGraphSetting.Legend;
    HideDates(aChart);
    pnlHeader.Visible := pnlInfo.Visible;
    if FGraphSetting.ClearBackground then
    begin
      Color := clWindow;
      Legend.Color := clWindow;
      pnlBlankTop.Color := clWindow;
      pnlBlankBottom.Color := clWindow;
    end
    else
    begin
      Color := clBtnFace;
      Legend.Color := clCream;
      pnlBlankTop.Color := clBtnFace;
      pnlBlankBottom.Color := clBtnFace;
    end;
    for j := 0 to SeriesCount - 1 do
    begin
      if Series[j] is TLineSeries then
        with (Series[j] as TLineSeries) do
        begin
          Marks.Visible := FGraphSetting.Values;
          LinePen.Visible := FGraphSetting.Lines;
        end;
      if Series[j] is TPointSeries then
        with (Series[j] as TPointSeries) do
        begin
          Marks.Visible := FGraphSetting.Values;
          LinePen.Visible := FGraphSetting.Lines;
        end;
      if Series[j] is TBarSeries then
        with (Series[j] as TBarSeries) do
        begin
          Marks.Visible := FGraphSetting.Values;
        end;
      if Series[j] is TArrowSeries then
        with (Series[j] as TArrowSeries) do
        begin
          Marks.Visible := FGraphSetting.Values;
        end;
      if Series[j] is TGanttSeries then
        with (Series[j] as TGanttSeries) do
        begin
          Marks.Visible := FGraphSetting.Values;
          LinePen.Visible := FGraphSetting.Lines;
        end;
    end;
  end;
end;

procedure TfrmGraphs.ChangeStyle;
var
  i: integer;
  ChildControl: TControl;
  OriginalColor, ClearColor: TColor;
begin
  OriginalColor := pnlItemsTopInfo.Color;
  ClearColor := clWindow;
  for i := 0 to scrlTop.ControlCount - 1 do
  begin
    ChildControl := scrlTop.Controls[i];
    ChartStyle(ChildControl as TChart);
  end;
  for i := 0 to scrlBottom.ControlCount - 1 do
  begin
    ChildControl := scrlBottom.Controls[i];
    ChartStyle(ChildControl as TChart);
  end;
  if pnlDateLineTop.Visible then   // not visible when separate graphs
    ChartStyle(chartDateLineTop);
  if pnlDateLineBottom.Visible then
    ChartStyle(chartDateLineBottom);
  if FGraphSetting.ClearBackground then
  begin
    chartDatelineTop.Color := ClearColor;
    chartDatelineTop.Legend.Color := ClearColor;
    pnlDatelineTopSpacer.Color := ClearColor;
    scrlTop.Color := ClearColor;
    pnlTopRightPad.Color := ClearColor;
    pnlScrollTopBase.Color := ClearColor;
    pnlBlankTop.Color := ClearColor;
    chartDatelineBottom.Color := ClearColor;
    chartDatelineBottom.Legend.Color := ClearColor;
    pnlDatelineBottomSpacer.Color := ClearColor;
    scrlBottom.Color := ClearColor;
    pnlBottomRightPad.Color := ClearColor;
    pnlScrollBottomBase.Color := ClearColor;
    pnlBlankBottom.Color := ClearColor;
  end
  else
  begin
    chartDatelineTop.Color := OriginalColor;
    chartDatelineTop.Legend.Color := clCream;
    pnlDatelineTopSpacer.Color := OriginalColor;
    scrlTop.Color := OriginalColor;
    pnlTopRightPad.Color := OriginalColor;
    pnlScrollTopBase.Color := OriginalColor;
    pnlBlankTop.Color := OriginalColor;
    chartDatelineBottom.Color := OriginalColor;
    chartDatelineBottom.Legend.Color := clCream;
    pnlDatelineBottomSpacer.Color := OriginalColor;
    scrlBottom.Color := OriginalColor;
    pnlBottomRightPad.Color := OriginalColor;
    pnlScrollBottomBase.Color := OriginalColor;
    pnlBlankBottom.Color := OriginalColor;
  end;
  mnuPopGraphLines.Checked := FGraphSetting.Lines;
  mnuPopGraph3D.Checked := FGraphSetting.View3D;
  mnuPopGraphValues.Checked := FGraphSetting.Values;
  mnuPopGraphDates.Checked := FGraphSetting.Dates;
  mnuPopGraphFixed.Checked := FGraphSetting.FixedDateRange;
  mnuPopGraphGradient.Checked := FGraphSetting.Gradient;
  mnuPopGraphHints.Checked := FGraphSetting.Hints;
  mnuPopGraphStayOnTop.Checked := FGraphSetting.StayOnTop;
  mnuPopGraphLegend.Checked := FGraphSetting.Legend;
  mnuPopGraphSort.Checked := FGraphSetting.SortColumn = 1;
  mnuPopGraphClear.Checked := FGraphSetting.ClearBackground;
  mnuPopGraphVertical.Checked := FGraphSetting.VerticalZoom;
  mnuPopGraphHorizontal.Checked := FGraphSetting.HorizontalZoom;
end;

procedure TfrmGraphs.chartBaseClickSeries(Sender: TCustomChart; Series: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dttm, seriestitle, textvalue, textvalue1, textvalue2, typename, typenum: string;
begin
  timHintPause.Enabled := false;
  InactivateHint;
  FGraphClick := Sender;
  FGraphSeries := Series;
  FGraphValueIndex := ValueIndex;
  chartDateLineTop.Tag := 1;       // indicates a series click
  if (Series is TGanttSeries) then
  begin
    FDate1 := (Series as TGanttSeries).StartValues[ValueIndex];
    FDate2 := (Series as TGanttSeries).EndValues[ValueIndex];
  end
  else
  begin
    FDate1 := Series.XValue[ValueIndex];
    FDate2 := FDate1;
  end;
  seriestitle := Series.Title;
  if Button <> mbRight then
  begin
    textvalue := ValueText(Sender, Series, ValueIndex);
    dttm := Piece(textvalue, '^', 3);
    if copy(textvalue, length(textvalue) - 5, length(textvalue)) = ' 00:00' then
      dttm := Pieces(dttm, ' ', 1, 3);
    textvalue1 := Piece(textvalue, '^', 2) + '  ' + dttm;
    textvalue2 := Piece(textvalue, '^', 4) + '  ' + Piece(textvalue, '^', 5);
    typenum := trim(Piece(textvalue, '^', 1));
    typename := Piece(textvalue, '^', 2);
    AllTypeDate(typenum, typename, textvalue1, textvalue2, FDate1, FDate2);
  end
  else
  begin
    mnuPopGraphIsolate.Enabled := true;
    if pnlTop.Tag = 1 then
      mnuPopGraphIsolate.Caption := 'Move - ' + seriestitle + ' - from Top to Bottom'
    else
      mnuPopGraphIsolate.Caption := 'Move - ' + seriestitle + ' - from Bottom to Top';
    scrlTop.Hint := 'Details - for ' + seriestitle + ' for ' +
      FormatDateTime('mmm d, yyyy  h:nn am/pm', FDate1);
    scrlTop.Tag := ValueIndex + 1;
    mnuPopGraphIsolate.Hint := seriestitle;
    mnuPopGraphRemove.Enabled := true;
    mnuPopGraphRemove.Caption := 'Remove - ' + seriestitle;
    mnuPopGraphDetails.Caption := 'Details - ' + seriestitle;
  end;
  FMouseDown := false;
end;

procedure TfrmGraphs.AllTypeDate(aType, aTypeName, firstline, secondline: string; aDate, aDate2: double);
var
  i: integer;
  dttm, datax, datex1, datex2, fmdate1, fmdate2, newdata, newline, oldline, spacer, titlemsg: string;
  dt1, dt2, dtdata, dtdata1, dtdata2: double;
  tmpOtherList, templist: TStringList;
begin
  Screen.Cursor := crHourGlass;
  tmpOtherList := TStringList.Create;
  templist := TStringList.Create;
  datex1 := floattostr(DateTimeToFMDateTime(aDate));
  datex1 := Piece(datex1, '.', 1);
  if aDate <> aDate2 then
    datex2 := Piece(floattostr(DateTimeToFMDateTime(aDate2)), '.', 1) + '.23595959'
  else
    datex2 := datex1 + '.23595959';
  dt1 := strtofloatdef(datex1, BIG_NUMBER);
  dt2 := strtofloatdef(datex2, BIG_NUMBER);
  CheckToAddData(lvwItemsTop, 'top', aType);    // if type is not loaded - load data
  for i := 0 to lstData.Items.Count - 1 do
  begin
    datax := lstData.Items[i];
    if Piece(datax, '^', 1) = aType then
    begin
      if (length(Piece(datax, '^', 4))> 0) then    // date/times of episodes
      begin
        dtdata1 := strtofloatdef(Piece(datax, '^', 3), -1);
        fmdate1 := FormatFMDateTime('mm/dd/yy hh:nn', dtdata1);
        if copy(fmdate1, length(fmdate1) - 5, length(fmdate1)) = ' 00:00' then
          fmdate1 := copy(fmdate1, 1, length(fmdate1) - 5) + '     ';
        dtdata2 := strtofloatdef(Piece(datax, '^', 4), -1);
        fmdate2 := FormatFMDateTime('mm/dd/yy hh:nn', dtdata2);
        if copy(fmdate2, length(fmdate2) - 5, length(fmdate2)) = ' 00:00' then
          fmdate2 := copy(fmdate2, 1, length(fmdate2) - 5) + '     ';
        if (dtdata2 > dt1) and (dtdata1 < dt2) then
        begin
          newdata := Piece(datax, '^', 3) + '^' +
                     Piece(datax, '^', 2) + '^' +
                     fmdate1 + ' - ' +
                     fmdate2 + '^' +
                     ItemName(aType, Piece(datax, '^', 2)) + '^' +
                     Piece(datax, '^', 5);
          tmpOtherList.Add(MixedCase(newdata));
        end;
      end
      else
      begin
        dtdata := strtofloatdef(Piece(datax, '^', 3), -1);
        if (dtdata >= dt1) and (dtdata < dt2) then
        begin
          if length(Piece(Piece(datax, '^', 3), '.', 2)) > 0 then
            dttm := FormatFMDateTime('mm/dd/yy hh:nn', dtdata)
          else
            dttm := FormatFMDateTime('mm/dd/yy', dtdata);
          newdata := Piece(datax, '^', 3) + '^' +
          Piece(datax, '^', 2) + '^' +
          Piece(datax, '^', 5) + '^' +
          dttm + '^' +
          ItemName(aType, Piece(datax, '^', 2));
          tmpOtherList.Add(MixedCase(newdata));
        end;
      end;
    end;
  end;
  with tmpOtherList do
  begin
    Sort;
    for i := Count - 1 downto 0 do
    begin
      newline := '';
      oldline := tmpOtherList[i];
      newline := Piece(oldline, '^', 4) + '   ' +
        Piece(oldline, '^', 5);
        spacer := Copy(BIG_SPACES, 1, 40 - length(newline));
      newline := newline + spacer + ' ' +
        Piece(oldline, '^', 3);
      templist.Add(newline);
    end;
    Clear;
    Assign(templist);
    if aDate <> aDate2 then
      titlemsg := aTypeName + ' occurences for ' + FormatDateTime('mmm d, yyyy', aDate) +
        ' - ' + FormatDateTime('mmm d, yyyy', aDate2)
    else
      titlemsg := aTypeName + ' occurences for ' + FormatDateTime('mmm d, yyyy', aDate);
    Insert(0, firstline);
    Insert(1, secondline);
    Insert(2, '');
    Insert(3, 'All ' + titlemsg + ':');
    Insert(4, '');
    Insert(0, TXT_REPORT_DISCLAIMER);
    Insert(1, '');
    ReportBox(tmpOtherList, titlemsg, true);
  end;
  tmpOtherList.Free;
  templist.Free;
  Screen.Cursor := crDefault;
end;


procedure TfrmGraphs.ItemDateRange(Sender: TCustomChart);
var
  bpnotdone, ok: boolean;
  i, j: integer;
  prevtype, results, seriestitle, seriestype, spacer, textvalue, typenum: string;
  tmpOtherList: TStringList;
begin
  Screen.Cursor := crHourGlass;
  prevtype := '';
  tmpOtherList := TStringList.Create;
  with tmpOtherList do
  begin
    Add('Date Range: ' + cboDateRange.Text);
    Add('Selected Items from ' +
      FormatDateTime('mm/dd/yy', FGraphSetting.LowTime) + ' to ' +
      FormatDateTime('mm/dd/yy', FGraphSetting.HighTime));
    Add('');
  end;
  bpnotdone := true;
  for i := 0 to Sender.SeriesCount - 1 do
  begin
    if Sender.Series[i].Count > 0 then
    begin
      textvalue := ValueText(Sender, Sender.Series[i], 0);
      seriestype := Piece(textvalue, '^', 2);
      if (seriestype <> '') and (seriestype <> prevtype) then
      begin
        tmpOtherList.Add('     ' + seriestype);    // type
        prevtype := seriestype;
      end;
    end;
    ok := true;
    seriestitle := Sender.Series[i].Title;
    if seriestitle = 'Blood Pressure' then
      if bpnotdone = false then ok := false;
    if ok then
    begin
      for j := 0 to Sender.Series[i].Count - 1 do
      begin
        textvalue := ValueText(Sender, Sender.Series[i], j);
        seriestitle := Piece(textvalue, '^', 4);
        typenum := Piece(textvalue, '^', 1);
        if (typenum = '120.5') and (seriestitle = 'Blood Pressure') then bpnotdone := false;
        if length(typenum) > 0 then
        begin
          spacer := Copy(BIG_SPACES, 1, 30 - length(seriestitle));
          results := seriestitle + ':  ' + //spacer +
          Piece(textvalue, '^', 5); //LowerCase(Piece(textvalue, '^', 5));
          spacer := Copy(BIG_SPACES, 1, 40 - length(results));
          results := results + ' ' + spacer + Piece(textvalue, '^', 6);
          if copy(results, length(results) - 5, length(results)) = ' 00:00' then
            results := copy(results, 1, length(results) - 5);
          tmpOtherList.Add(results);                 // item occurrence
        end;
      end;
    end;
  end;                               // same items are not being sorted by date
  if tmpOtherList.Count > 0 then
  begin
    tmpOtherList.Insert(0, TXT_REPORT_DISCLAIMER);
    tmpOtherList.Insert(1, '');
    ReportBox(tmpOtherList, 'Selected Items from Graph', true);
  end;
  tmpOtherList.Free;
  FMouseDown := false;
  Screen.Cursor := crDefault;
end;

procedure TfrmGraphs.mnuPopGraphIsolateClick(Sender: TObject);
var
  i, j, selnum: integer;
  aSection, aOtherSection, typeitem: string;
  aGraphItem: TGraphItem;
  aListView, aOtherListView: TListView;
begin
  FFirstClick := true;
  cboViewsTop.ItemIndex := -1;
  cboViewsTop.Text := '';
  cboViewsBottom.ItemIndex := -1;
  cboViewsBottom.Text := '';
  if pnlTop.Tag = 1 then
  begin
    aListView := lvwItemsTop;
    aOtherListView := lvwItemsBottom;
    aSection := 'top';
    aOtherSection := 'bottom';
  end
  else
  begin
    aListView := lvwItemsBottom;
    aOtherListView := lvwItemsTop;
    aSection := 'bottom';
    aOtherSection := 'top';
  end;
  if aListView.SelCount = 0 then exit;
  if StripHotKey(mnuPopGraphIsolate.Caption) = ('Move all selections to ' + aOtherSection) then
  begin
    with aListView do
    for i := 0 to Items.Count - 1 do
    if Items[i].Selected then
    begin
      aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);
      typeitem := Pieces(aGraphItem.Values, '^', 1, 2);
      for j := 0 to aOtherListView.Items.Count - 1 do
      begin
        aGraphItem := TGraphItem(aOtherListView.Items.Item[j].SubItems.Objects[3]);
        if Pieces(aGraphItem.Values, '^', 1, 2) = typeitem then
          aOtherListView.Items[j].Selected := true;
      end;
      Items[i].Selected := false;
    end;
    with chkDualViews do
    if not Checked then
    begin
      Checked := true;
      Click;
    end;
    ChangeStyle;
    DisplayData(aSection);
    DisplayData(aOtherSection);
  end
  else
  begin
    ItemCheck(lvwItemsTop, mnuPopGraphIsolate.Hint, selnum, typeitem);
    if selnum = -1 then exit;
    for i := 0 to aOtherListView.Items.Count - 1 do
    begin
      aGraphItem := TGraphItem(aOtherListView.Items.Item[i].SubItems.Objects[3]);
      if Pieces(aGraphItem.Values, '^', 1, 2) = typeitem then
        aOtherListView.Items[i].Selected := true;
    end;
    aListView.Items[selnum].Selected := false;
    with chkDualViews do
    if not Checked then
    begin
      Checked := true;
      Click;
    end;
    ChangeStyle;
    DisplayData(aSection);
    DisplayData(aOtherSection);
  end;
  mnuPopGraphIsolate.Enabled := false;
end;

procedure TFrmGraphs.ItemCheck(aListView: TListView; aItemName: string;
  var aNum: integer; var aTypeItem: string);
var
  i: integer;
  aGraphItem: TGraphItem;
begin
  aNum := -1;
  aTypeItem := '';
  with aListView do
  for i := 0 to Items.Count - 1 do
  if Items[i].Caption = aItemName then
  begin
    aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);     //get file^ien match
    aNum := i;
    aTypeItem := Pieces(aGraphItem.Values, '^', 1, 2);
    break;
  end;
  if aNum = -1 then
  begin
    aItemName := ReverseString(aItemName);
    aItemName := Pieces(aItemName, '(', 2, DelimCount(aItemName, '(') + 1);
    aItemName := Copy(aItemName, 2, length(aItemName) - 1);
    aItemName := ReverseString(aItemName);
    with aListView do
    for i := 0 to Items.Count - 1 do
    if Items[i].Caption = aItemName then            // match without (specimen)
    begin
      aGraphItem := TGraphItem(Items.Item[i].SubItems.Objects[3]);     //get file^ien match
      aNum := i;
      aTypeItem := Pieces(aGraphItem.Values, '^', 1, 2);
      break;
    end;
  end;
end;

procedure TfrmGraphs.chartBaseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FHintStop := true;
  timHintPause.Enabled := false;
  InactivateHint;
  chartDatelineTop.Tag := 0; // not legend or series click
  scrlTop.Hint := '';
  scrlTop.Tag := 0;
  FYMinValue := (Sender as TChart).MinYValue((Sender as TChart).LeftAxis);
  FYMaxValue := (Sender as TChart).MaxYValue((Sender as TChart).LeftAxis);
  pnlTop.Tag := 1;
  if (Sender as TControl).Parent = pnlBottom then pnlTop.Tag := 0;
  if ((Sender as TControl).Parent as TControl) = pnlBottom then pnlTop.Tag := 0;
  if (((Sender as TControl).Parent as TControl).Parent as TControl).Parent = pnlBottom then pnlTop.Tag := 0;
  if pnlTop.Tag = 1 then
  begin
    mnuPopGraphIsolate.Caption := 'Move all selections to bottom';
    mnuPopGraphRemove.Caption := 'Remove all selections from top';
  end
  else
  begin
    mnuPopGraphIsolate.Caption := 'Move all selections to top';
    mnuPopGraphRemove.Caption := 'Remove all selections from bottom';
  end;
  If Button = mbLeft then
    FMouseDown := true;
end;

procedure TfrmGraphs.mnuPopGraphStuffPopup(Sender: TObject);
begin
  if scrlTop.Tag = 0 then scrlTop.Hint := '';
  if (lvwItemsTop.SelCount = 0) and (lvwItemsBottom.SelCount = 0) then scrlTop.Hint := '';
  if scrlTop.Hint = '' then
  begin
    if Pieces(mnuPopGraphIsolate.Caption, ' ', 1, 3) = 'Move all selections' then
      mnuPopGraphIsolate.Enabled := true
    else
    begin
      mnuPopGraphIsolate.Caption := 'Move';
      mnuPopGraphIsolate.Enabled := false;
    end;
    if Pieces(mnuPopGraphRemove.Caption, ' ', 1, 3) = 'Remove all selections' then
      mnuPopGraphRemove.Enabled := true
    else
    begin
      mnuPopGraphRemove.Caption := 'Remove';
      mnuPopGraphRemove.Enabled := false;
    end;
    mnuPopGraphDetails.Caption := 'Details...';
    mnuPopGraphDetails.Enabled := (lvwItemsTop.SelCount > 0) or (lvwItemsBottom.SelCount > 0);
  end
  else
  begin
    mnuPopGraphIsolate.Enabled := true;
    mnuPopGraphRemove.Enabled := true;
    mnuPopGraphDetails.Enabled := true;
  end;
  mnuPopGraphSwap.Enabled := (lvwItemsTop.SelCount > 0) or (lvwItemsBottom.SelCount > 0);
  mnuPopGraphReset.Enabled := mnuPopGraphSwap.Enabled;
  mnuPopGraphCopy.Enabled := mnuPopGraphSwap.Enabled;
  mnuPopGraphPrint.Enabled := mnuPopGraphSwap.Enabled;
  
  with pnlMain.Parent do
  if BorderWidth <> 1 then            // only do on float Graph
    mnuPopGraphStayOnTop.Enabled :=false
  else
    mnuPopGraphStayOnTop.Enabled :=true;
end;

procedure TfrmGraphs.mnuPopGraphDetailsClick(Sender: TObject);
var
  aGraphItem: TGraphItem;
  tmpList: TStringList;
  date1, date2: TFMDateTime;
  teststring, typeitem, textvalue, textvalue1, textvalue2, typenum, typename: string;
  i, selnum: integer;
begin
  if chartDatelineTop.Tag = 1 then               // series
  begin
    ItemCheck(lvwItemsTop, mnuPopGraphIsolate.Hint, selnum, typeitem);
    if selnum < 0 then exit;
    if not HSAbbrev(Piece(typeitem, '^', 1)) then
    begin
      if (FGraphSeries is TGanttSeries) then
      begin
        FDate1 := (FGraphSeries as TGanttSeries).StartValues[FGraphValueIndex];
        FDate2 := (FGraphSeries as TGanttSeries).EndValues[FGraphValueIndex];
      end
      else
      begin
        FDate1 := FGraphSeries.XValue[FGraphValueIndex];
        FDate2 := FDate1;
      end;
      textvalue := ValueText(FGraphClick, FGraphSeries, FGraphValueIndex);
      textvalue1 := Piece(textvalue, '^', 2) + '  ' + Piece(textvalue, '^', 3);
      textvalue2 := Piece(textvalue, '^', 4) + '  ' + Piece(textvalue, '^', 5);
      typenum := trim(Piece(textvalue, '^', 1));
      typename := Piece(textvalue, '^', 2);
      AllTypeDate(typenum, typename, textvalue1, textvalue2, FDate1, FDate2);
      exit;
    end
    else
      OneDayTypeDetails(typeitem);
  end
  else            // legend
  begin
    date1 := DateTimeToFMDateTime(FGraphSetting.HighTime);
    date2 := DateTimeToFMDateTime(FGraphSetting.LowTime);
    tmpList := TStringList.Create;
    if pnlTop.Tag = 1 then
    for i := 0  to lvwItemsTop.Items.Count - 1 do
    begin
      if lvwItemsTop.Items[i].Selected then
      begin
        aGraphItem := TGraphItem(lvwItemsTop.Items.Item[i].SubItems.Objects[3]);      //get file^ien match
        teststring := aGraphItem.Values;
        tmpList.Add(teststring);
      end;
    end
    else
    for i := 0  to lvwItemsBottom.Items.Count - 1 do
    begin
      if lvwItemsBottom.Items[i].Selected then
      begin
        aGraphItem := TGraphItem(lvwItemsBottom.Items.Item[i].SubItems.Objects[3]);    //get file^ien match
        teststring := aGraphItem.Values;
        tmpList.Add(teststring);
      end;
    end;
    if tmpList.Count > 0 then
      AllDetails(date1, date2, tmplist);
    tmpList.Free;
  end;
  FMouseDown := false;
end;

procedure TfrmGraphs.AllDetails(aDate1, aDate2: TFMDateTime; aTempList: TStrings);
var
  TypeList: TStringList;
  i: integer;
  detailsok: boolean;
  testnum, teststring, testtype: string;
begin
  detailsok := true;
  TypeList := TStringList.Create;
  for i := 0 to aTempList.Count -1 do
  begin
    teststring := aTempList[i];
    testtype := Piece(teststring, '^', 1);
    if not HSAbbrev(testtype) then
      detailsok := false;
    if testtype = '63' then
    begin
      testnum := Piece(teststring, '^', 2);
      testnum := Piece(testnum, '.', 1);
      TypeList.Add('63^' + testnum);
    end
    else
      TypeList.Add(teststring);
  end;
  if detailsok then
    ReportBox(rpcDetailSelected(Patient.DFN, aDate1, aDate2, TypeList, true), 'Graph results on ' + Patient.Name, True)
  else
    ItemDateRange(FGraphClick);
  TypeList.Free;
end;

procedure TfrmGraphs.OneDayTypeDetails(aTypeItem: string);
var
  strdate1, strdate2, titleitem, titletype: string;
  date1, date2: TFMDateTime;
  tmpList: TStringList;
begin
  tmpList := TStringList.Create;
  strdate1 := FormatDateTime('mm/dd/yyyy', FDate1);
  strdate2 := FormatDateTime('mm/dd/yyyy', FDate2);
  FDate1 := StrToDateTime(strdate1);
  FDate2 := StrToDateTime(strdate2);
  date1 := DateTimeToFMDateTime(FDate1 + 1);
  date2 := DateTimeToFMDateTime(FDate2);
  titletype := FileNameX(Piece(aTypeItem, '^', 1));
  titleitem := ItemName(Piece(aTypeItem, '^', 1), Piece(aTypeItem, '^', 2));
  rpcDetailDay(tmpList, Patient.DFN, date1, date2, aTypeItem, true);
  ReportBox(tmpList, titletype + ': ' + titleitem + ' on ' + Patient.Name + ' for ' + FormatFMDateTime('mmm d, yyyy', date1), True);
  tmpList.Free;
end;

procedure TfrmGraphs.mnuPopGraphCopyClick(Sender: TObject);
var
  i: integer;
  StrForFooter, StrForHeader, aTitle, aWarning, aDateRange: String;
  aHeader: TStringList;
  wrdApp, wrdDoc: Variant;
  ChildControl: TControl;
begin
  try
    wrdApp := CreateOleObject('Word.Application');
  except
    raise Exception.Create('Cannot start MS Word!');
  end;
  Screen.Cursor := crHourGlass;
  aTitle := 'CPRS Graphing';
  aWarning := pnlInfo.Caption;
  aDateRange :=  'Date Range: ' + cboDateRange.Text + '  Selected Items from ' +
      FormatDateTime('mm/dd/yy', FGraphSetting.LowTime) + ' to ' +
      FormatDateTime('mm/dd/yy', FGraphSetting.HighTime);
  aHeader := TStringList.Create;
  CreatePatientHeader(aHeader, aTitle, aWarning, aDateRange);
  StrForHeader := '';
  for i := 0 to aHeader.Count -1 do
    StrForHeader := StrForHeader + aHeader[i] + Chr(13);
  StrForFooter := aTitle + ' - *** WORK COPY ONLY ***' + Chr(13);
  wrdApp.Visible := False;
  wrdApp.Documents.Add;
  wrdDoc := wrdApp.Documents.Item(1);
  wrdDoc := wrdDoc.Sections.Item(1);
  wrdDoc := wrdDoc.Headers.Item(1).Range;
  wrdDoc.Font.Name := 'Courier New';
  wrdDoc.Font.Size := 9;
  wrdDoc.Text := StrForHeader;
  wrdDoc := wrdApp.Documents.Item(1);
  wrdDoc := wrdDoc.Sections.Item(1);
  wrdDoc := wrdDoc.Footers.Item(1);
  wrdDoc.Range.Font.Name := 'Courier New';
  wrdDoc.Range.Font.Size := 9;
  wrdDoc.Range.Text := StrForFooter;
  wrdDoc.PageNumbers.Add;
  wrdDoc := wrdApp.Documents.Item(1);
  wrdDoc.Range.Font.Name := 'Courier New';
  wrdDoc.Range.Font.Size := 9;
  wrdDoc.Range.Text := StrForHeader;
  wrdDoc.Range.InsertParagraphAfter;
  for i := 0 to scrlTop.ControlCount - 1 do           // goes from top to bottom
  begin
    ChildControl := scrlTop.Controls[i];
    if (ChildControl as TChart).Visible then
    begin
      (ChildControl as TChart).CopyToClipboardBitmap;
      wrdDoc.Range.InsertParagraphAfter;
      wrdDoc.Paragraphs.Last.Range.Paste;
    end;
  end;
  if (chartDatelineTop.SeriesCount > 0) and (not chkItemsTop.Checked) then
  begin
    chartDatelineTop.CopyToClipboardBitmap;
    wrdDoc.Range.InsertParagraphAfter;
    wrdDoc.Paragraphs.Last.Range.Paste;
  end;
  wrdDoc.Range.InsertParagraphAfter;
  wrdDoc.Paragraphs.Last.Range.Text := '   ';
  for i := 0 to scrlBottom.ControlCount - 1 do
  begin
    ChildControl := scrlBottom.Controls[i];
    if (ChildControl as TChart).Visible then
    begin
      (ChildControl as TChart).CopyToClipboardBitmap;
      wrdDoc.Range.InsertParagraphAfter;
      wrdDoc.Paragraphs.Last.Range.Paste;
    end;
  end;
  if (chartDatelineBottom.SeriesCount > 0) and (chkDualViews.Checked)
    and (not chkItemsBottom.Checked) then
  begin
    chartDatelineBottom.CopyToClipboardBitmap;
    wrdDoc.Range.InsertParagraphAfter;
    wrdDoc.Paragraphs.Last.Range.Paste;
  end;
  wrdDoc.Range.WholeStory;
  wrdDoc.Range.Copy;
  wrdDoc.Close(false);
  wrdApp.DisplayAlerts := false;
  wrdApp.Quit;
  wrdApp := Unassigned; // releases variant
  aHeader.Free;
  Screen.Cursor := crDefault;
end;

procedure TfrmGraphs.CreatePatientHeader(var HeaderList: TStringList; PageTitle, Warning, DateRange: string);
// this procedure modified from rReports
var
  tmpStr, tmpItem: string;
begin
  if Warning = TXT_INFO then Warning := '  ';
  with HeaderList do
    begin
      Add(' ');
      Add(StringOfChar(' ', (74 - Length(PageTitle)) div 2) + PageTitle);
      Add(' ');
      tmpStr := Patient.Name + '   ' + Patient.SSN;
      tmpItem := tmpStr + StringOfChar(' ', 39 - Length(tmpStr)) + Encounter.LocationName;
      tmpStr := FormatFMDateTime('mmm dd, yyyy', Patient.DOB) + ' (' + IntToStr(Patient.Age) + ')';
      tmpItem := tmpItem + StringOfChar(' ', 74 - (Length(tmpItem) + Length(tmpStr))) + tmpStr;
      Add(tmpItem);
      Add(StringOfChar('=', 74));
      Add('*** WORK COPY ONLY ***' + StringOfChar(' ', 24) + 'Printed: '
        + FormatFMDateTime('mmm dd, yyyy  hh:nn', FMNow));
      Add(TXT_COPY_DISCLAIMER);
      Add(StringOfChar(' ', (74 - Length(DateRange)) div 2) + DateRange);
      Add(StringOfChar(' ', (74 - Length(Warning)) div 2) + Warning);
      Add(' ');
    end;
end;

procedure TfrmGraphs.GetData(aString: string);
var
  i: integer;
  filenum, itemdata, itemid: string;
  aDate, aDate1: double;
begin
  lstTemp.Items.Clear;
  itemid := UpperCase(Pieces(aString, '^', 1, 2));
  with lstData do
  for i := Items.Count - 1 downto 0 do
    if itemid = UpperCase(Pieces(Items[i], '^', 1, 2)) then
    begin
      itemdata := Items[i];
      filenum := Piece(itemdata, '^', 1);
      if (filenum = '52') or (filenum = '55') or (filenum = '55NVA')
      or (filenum = '9999911') or (filenum = '405') or (filenum = '9000010') then
      begin
        aDate := strtofloat(FMCorrectedDate(Piece(itemdata, '^', 3)));
        aDate1 := strtofloat(FMCorrectedDate(Piece(itemdata, '^', 4)));
        if (aDate < FGraphSetting.FMStopDate) and (aDate > FGraphSetting.FMStartDate) then
          lstTemp.Items.Add(Items[i])
        else if (aDate < FGraphSetting.FMStopDate) and (aDate1 > FGraphSetting.FMStartDate) then
          lstTemp.Items.Add(Items[i])
        else if (aDate < FGraphSetting.FMStartDate) and (aDate1 > FGraphSetting.FMStopDate) then
          lstTemp.Items.Add(Items[i]);
      end
      else if Piece(itemdata, '^', 3) <> '' then
      begin
        aDate := strtofloat(FMCorrectedDate(Piece(itemdata, '^', 3)));
        if (aDate < FGraphSetting.FMStopDate) and (aDate > FGraphSetting.FMStartDate) then
          if Copy(itemdata, 1, 4) = '63MI' then
            lstTemp.Items.Add(Pieces(Items[i], '^', 1, 4))
          else if Copy(itemdata, 1, 4) = '63AP' then
            lstTemp.Items.Add(Pieces(Items[i], '^', 1, 4))
          //else lstTemp.Items.Add(Pieces(Items[i], '^', 1, 5));         // add in non micro, ap
          else lstTemp.Items.Add(Items[i]);         // add in non micro, ap
      end;
    end;
end;

function TfrmGraphs.FMToDateTime(FMDateTime: string): TDateTime;
var
  x, Year: string;
begin
  { Note: TDateTime cannot store month only or year only dates }
  x := FMDateTime + '0000000';
  if Length(x) > 12 then x := Copy(x, 1, 12);
  if StrToInt(Copy(x, 9, 4)) > 2359 then x := Copy(x, 1, 7) + '.2359';
  Year := IntToStr(17 + StrToInt(Copy(x, 1, 1))) + Copy(x, 2, 2);
  x := Copy(x, 4, 2) + '/' + Copy(x, 6, 2) + '/' + Year + ' ' + Copy(x, 9, 2) + ':' + Copy(x, 11, 2);
  Result := StrToDateTime(x);
end;

function TfrmGraphs.GraphTypeNum(aType: string): integer;
var
  i: integer;
begin
  Result := 4;
  if (aType = '52') or (aType = '55') or (aType = '55NVA') or (aType = '9999911') then
    if mnuMedsasgantt.Checked then Result := 8
    else if mnuMedsasganttvertheight.Checked then Result := 3
    else Result := 8
  else
  for i := 0 to lstAllTypes.Items.Count - 1 do
    if aType = Piece(lstAllTypes.Items[i], '^', 1) then
    begin
      Result := strtointdef(Piece(lstAllTypes.Items[i], '^', 3), 4);
      break;
    end;
end;

function TfrmGraphs.HSAbbrev(aType: string): boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to lstTypes.Items.Count - 1 do
  if Piece(lstTypes.Items[i], '^', 1) = aType then
  begin
    Result := length(Piece(lstTypes.Items[i], '^', 8)) > 0;
    break;
  end;
end;

procedure TfrmGraphs.TempCheck(typeitem: string; var levelseq: double);
var
  done, previous: boolean;
  j: integer;
begin
  previous := false;
  done := false;
  j := 0;
  with lstTempCheck do
  while not done do
  begin
    if Items.Count = j then done := true
    else if Items[j] = typeitem then
    begin
      previous := true;
      levelseq := j + 1;
      done := true;
    end
    else j := j + 1;
  end;
  if not previous then
  begin
    lstTempCheck.Items.Add(UpperCase(typeitem));
    levelseq := lstTempCheck.Items.Count;
  end;
end;

function TfrmGraphs.DCName(aDCien: string): string;
var
  i: integer;
begin
  if lstDrugClass.Items.Count < 1 then
    FastAssign(rpcClass('50.605'), lstDrugClass.Items);
  Result := '';
  for i := 0 to lstDrugClass.Items.Count - 1 do
    if Piece(lstDrugClass.Items[i], '^', 2) = aDCien then
    begin
      Result := 'Drug - ' + Piece(lstDrugClass.Items[i], '^', 3);
      break;
    end;
end;

procedure TfrmGraphs.splItemsBottomMoved(Sender: TObject);
begin
 chkItemsBottom.Left := pnlItemsBottom.Width - chkItemsBottom.Width - 2;
 pnlItemsTop.Width := pnlItemsBottom.Width;
 chkItemsTop.Left := pnlItemsTop.Width - chkItemsTop.Width - 2;
end;

procedure TfrmGraphs.splItemsTopMoved(Sender: TObject);
begin
 chkItemsTop.Left := pnlItemsTop.Width - chkItemsTop.Width - 2;
 pnlItemsBottom.Width := pnlItemsTop.Width;
 chkItemsBottom.Left := pnlItemsBottom.Width - chkItemsBottom.Width - 2;
end;

procedure TfrmGraphs.cboDateRangeChange(Sender: TObject);
var
  datetag: integer;
  endofday: double;
  dateranges, manualstart, manualstop: string;
begin
  endofday := FMDateTimeOffsetBy(FMToday, 1);
  SelCopy(lvwItemsTop, lstSelCopyTop);
  SelCopy(lvwItemsBottom, lstSelCopyBottom);
  dateranges := '';
  if (cboDateRange.ItemID = 'S') then
  begin
    with calDateRange do
    begin
      if Execute then
        if Length(TextOfStart) > 0 then
          if Length(TextOfStop) > 0 then
          begin
            dateranges :=
              '^' + UpperCase(TextOfStart) + ' to ' + UpperCase(TextOfStop) +
              '^^^' + RelativeStart + ';' + RelativeStop +
              '^' + floattostr(FMDateStart) + '^' + floattostr(FMDateStop);
            cboDateRange.Items.Append(dateranges);
            cboDateRange.ItemIndex := cboDateRange.Items.Count - 1;
          end
          else
            cboDateRange.ItemIndex := -1
        else
          cboDateRange.ItemIndex := -1
      else
        cboDateRange.ItemIndex := -1;
    end;
  end;
  HideGraphs(true);
  datetag := cboDateRange.ItemIEN;
  with FGraphSetting do
  case datetag of
  0:  begin
        if cboDateRange.ItemIndex > 8 then    // selected date range
        begin
          if dateranges = '' then dateranges := cboDateRange.Items[cboDateRange.ItemIndex];
          manualstart := Piece(dateranges, '^' , 6);
          manualstop := Piece(dateranges, '^' , 7);
          if (manualstop <> '') and (length(Piece(manualstop, '.', 2)) = 0) then
            manualstop := manualstop + '.2359';
          FMStartDate := MakeFMDateTime(manualstart);
          FMStopDate := MakeFMDateTime(manualstop);
          if (manualstart <> '') and (length(Piece(manualstart, '.', 2)) = 0) then
          begin
            FMStartDate := FMDateTimeOffsetBy(FMStartDate, -1);
            manualstart := floattostr(FMStartDate) + '.2359';
            FMStartDate := MakeFMDateTime(manualstart);
          end;
        end;
      end;
  1:  begin
        FMStartDate := FMToday;
        FMStopDate := endofday;
      end;
  2:  begin
        FMStartDate := FMDateTimeOffsetBy(FMToday, -7);
        FMStopDate := endofday;
      end;
  3:  begin
        FMStartDate := FMDateTimeOffsetBy(FMToday, -14);
        FMStopDate := endofday;
      end;
  4:  begin
        FMStartDate := FMDateTimeOffsetBy(FMToday, -30);
        FMStopDate := endofday;
      end;
  5:  begin
        FMStartDate := FMDateTimeOffsetBy(FMToday, -183);
        FMStopDate := endofday;
      end;
  6:  begin
        FMStartDate := FMDateTimeOffsetBy(FMToday, -365);
        FMStopDate := endofday;
      end;
  7:  begin
        FMStartDate := FMDateTimeOffsetBy(FMToday, -730);
        FMStopDate := endofday;
      end;
  8:  begin
        FMStartDate := FM_START_DATE;   // earliest recorded values
        FMStopDate := endofday;
      end;
  else
      begin
        if dateranges = '' then dateranges := cboDateRange.Items[cboDateRange.ItemIndex];
        manualstart := Piece(dateranges, '^' , 6);
        manualstop := Piece(dateranges, '^' , 7);
        if (manualstop <> '') and (length(Piece(manualstop, '.', 2)) = 0) then manualstop := manualstop + '.2359';
        FMStartDate := MakeFMDateTime(manualstart);
        FMStopDate := MakeFMDateTime(manualstop);
        if (manualstart <> '') and (length(Piece(manualstart, '.', 2)) = 0) then
        begin
          FMStartDate := FMDateTimeOffsetBy(FMStartDate, -1);
          manualstart := floattostr(FMStartDate) + '.2359';
          FMStartDate := MakeFMDateTime(manualstart);
        end;
      end;
  end;
  FilterListView(FGraphSetting.FMStartDate, FGraphSetting.FMStopDate);
  SelReset(lstSelCopyTop, lvwItemsTop);
  SelReset(lstSelCopyBottom, lvwItemsBottom);
  DisplayData('top');
  DisplayData('bottom');
  if cboViewsTop.ItemIndex > 1 then cboViewsTopChange(self);
  if cboViewsBottom.ItemIndex > 1 then cboViewsBottomChange(self);
  HideGraphs(false);
end;

function TfrmGraphs.StdDev(value, high, low: double): double;
begin
  if high - low <> 0 then
  begin
    Result := (value - (low + ((high - low) / 2)))/((high - low) / 4);
    Result := RoundTo(Result, -2);
  end
  else
    Result := 0;
end;

function TfrmGraphs.InvVal(value: double): double;
begin
  if value = 0 then value := 0.0001;
  Result := 1 / value;
  Result := RoundTo(Result, -2);
end;

procedure TfrmGraphs.lvwItemsTopCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if not(Sender is TListView) then exit;
  if FsortAscending then
  begin
    if FSortCol = 0 then
      Compare := CompareStr(Item1.Caption, Item2.Caption)
    else
      Compare := CompareStr(Item1.SubItems[FsortCol - 1],
        Item2.SubItems[FsortCol - 1]);
  end
  else
  begin
    if FSortCol = 0 then
      Compare := CompareStr(Item2.Caption, Item1.Caption)
    else
      Compare := CompareStr(Item2.SubItems[FsortCol - 1],
        Item1.SubItems[FsortCol - 1]);
  end;
end;

procedure TfrmGraphs.lvwItemsTopColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if FSortCol = Column.Index then
    FSortAscending := not FSortAscending
  else
    FSortAscending := true;
  FSortCol := Column.Index;
  (Sender as TListView).AlphaSort;
end;

procedure TfrmGraphs.lvwItemsBottomCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if not(Sender is TListView) then exit;
  if FBSortAscending then
  begin
    if FBSortCol = 0 then
      Compare := CompareStr(Item1.Caption, Item2.Caption)
    else
      Compare := CompareStr(Item1.SubItems[FBSortCol - 1],
        Item2.SubItems[FBSortCol - 1]);
  end
  else
  begin
    if FBSortCol = 0 then
      Compare := CompareStr(Item2.Caption, Item1.Caption)
    else
      Compare := CompareStr(Item2.SubItems[FBSortCol - 1],
        Item1.SubItems[FBSortCol - 1]);
  end;
end;

procedure TfrmGraphs.lvwItemsBottomColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if FBSortCol = Column.Index then
    FBSortAscending := not FBSortAscending
  else
    FBSortAscending := true;
  FBSortCol := Column.Index;
  (Sender as TListView).AlphaSort;
end;

procedure TfrmGraphs.btnGraphSelectionsClick(Sender: TObject);
var
  actionOK, checkaction: boolean;
  counter, i, listnum: integer;
  profile, profilestring, section, selections, specnum, typeitem: string;
  aGraphItem: TGraphItem;
begin
  selections := '';
  for i := 0 to lvwItemsTop.Items.Count - 1 do
  if lvwItemsTop.Items[i].Selected then
  begin
    aGraphItem := TGraphItem(lvwItemsTop.Items.Item[i].SubItems.Objects[3]);
    typeitem := UpperCase(aGraphItem.Values);
    if Piece(typeitem, '^', 1) = '63' then
    begin
      specnum := Piece(Piece(typeitem, '^', 2), '.', 2);
      if length(specnum) > 0 then  // mulispecimen
        if specnum = '1' then typeitem := Piece(typeitem, '.', 1)
        else typeitem := '';
    end;
    if length(typeitem) > 0 then
      selections := selections + Piece(typeitem, '^', 1) + '~' + Piece(typeitem, '^', 2) +'~|';
  end;
  checkaction := chkDualViews.Checked;
  actionOK := false;
  profile := '*';
  counter := cboViewsTop.Tag;
  // load lstItems with all patient items and pass to Define View    ????
  DialogGraphProfiles(Font.Size, actionOK, checkaction, FGraphSetting,
    profile, profilestring, section, Patient.DFN, counter, selections);
  if (not actionOK) then exit;
  FillViews;
  if (section = 'niether') then exit;
  cboViewsTop.Tag := counter;

  lstViews.Items.Add(profilestring);
  listnum := lstViews.Items.Count + 1;
  for i := 0 to lstViews.Items.Count - 1 do
  begin
    profilestring := lstViews.Items[i];
    cboViewsTop.Items.Insert(i + 2, profilestring);
    cboViewsBottom.Items.Insert(i + 2, profilestring);
  end;
  if (section = 'bottom') or (section = 'both') then
    lvwItemsBottom.Tag := listnum;
  if (section = 'top') or (section = 'both') then
    lvwItemsTop.Tag  := listnum;
  ViewSelections;
end;

procedure TfrmGraphs.ViewSelections;
var
  i: integer;
begin    // uses lvwItems... Tag as index for view selection
  with lvwItemsBottom do
  begin
    if (Tag = 0) and (length(lvwItemsBottom.Hint) > 0) then
    begin
      for i := 0 to cboViewsBottom.Items.Count - 1 do
      begin
        showmessage(cboViewsBottom.Items[i]);
        if lvwItemsBottom.Hint = Piece(cboViewsBottom.Items[i], '^', 2) then
        begin
          Tag := i;
          break;
        end;
      end;
    end;
    if Tag > 0 then
    begin
      if not chkDualViews.Checked then
      begin
        chkDualViews.Checked := true;
        chkDualViewsClick(self);
      end;
      ClearSelection;
      cboViewsBottom.ItemIndex := Tag;
      Tag := 0;
      Hint := '';
      cboViewsBottomChange(self);
    end;
  end;
  with lvwItemsTop do
  begin
    if (Tag = 0) and (length(lvwItemsTop.Hint) > 0) then
    begin
      for i := 0 to cboViewsTop.Items.Count - 1 do
      begin
        if lvwItemsTop.Hint = Piece(cboViewsTop.Items[i], '^', 2) then
        begin
          Tag := i;
          break;
        end;
      end;
    end;
    if Tag > 0 then
    begin
      ClearSelection;
      cboViewsTop.ItemIndex := Tag;
      Tag := 0;
      Hint := '';
      cboViewsTopChange(self);
    end;
  end;
end;

procedure TfrmGraphs.ItemsClick(Sender: TObject; aListView, aOtherListView: TListView;
  aCheckBox: TCheckBox; aComboBox: TORComboBox; aList: TListBox; aSection: string);
begin
  FRetainZoom := (lstZoomHistory.Count > 0);
  FWarning := false;
  Screen.Cursor := crHourGlass;
  HideGraphs(true);
  if Sender = aListView then
  begin
    aComboBox.ItemIndex := -1;
    aComboBox.Text := '';
  end;
  if (Sender is TListView) then           // clear out selcopy list
    aList.Items.Clear;
  if aOtherListView.SelCount < 1 then
  begin
    FGraphSetting.HighTime := 0;
    FGraphSetting.LowTime := BIG_NUMBER;
  end
  else if (FBHighTime <> 0) and (aSection = 'top') then
  begin
    if FBHighTime < FTHighTime then FGraphSetting.HighTime := FBHighTime;
    if FBLowTime > FTLowTime then FGraphSetting.LowTime := FBLowTime;
  end
  else if (FTHighTime <> 0) and (aSection = 'bottom') then
  begin
    if FTHighTime < FBHighTime then FGraphSetting.HighTime := FTHighTime;
    if FTLowTime > FBLowTime then FGraphSetting.LowTime := FTLowTime;
  end;
  if aSection = 'top' then
  begin
    FTHighTime := 0;
    FTLowTime := BIG_NUMBER;
  end
  else if aSection = 'bottom' then
  begin
    FBHighTime := 0;
    FBLowTime := BIG_NUMBER;
  end;
  CheckToAddData(aListView, aSection, 'SELECT');
  DisplayData(aSection);
  if (aListView.SelCount = 1) and (aOtherListView.SelCount = 0) then
  begin
    lstZoomHistory.Items.Clear;
    FRetainZoom := false;
    mnuPopGraphZoomBack.Enabled := false;
  end
  else if FRetainZoom and (lstZoomHistory.Count > 0) then
    ZoomUpdate;
  HideGraphs(false);
  if FWarning then
    FWarning := false;
  Screen.Cursor := crDefault;
end;

procedure TfrmGraphs.CheckToAddData(aListView: TListView; aSection, TypeToCheck: string);
var
  done, ok, previous, singletype: boolean;
  i, j: integer;
  itemname, typeitem: string;
  aGraphItem: TGraphItem;
begin
  TypeToCheck := UpperCase(TypeToCheck);
  if (TypeToCheck = 'SELECT') and (lvwItemsTop.SelCount = 0)
    and (lvwItemsBottom.SelCount = 0) then exit;
  singletype := length(Piece(TypeToCheck, '^', 2)) = 0;
  for i := 0 to aListView.Items.Count - 1 do
  begin
    ok := false;
    if (TypeToCheck = 'ALL') then ok := true;
    if (TypeToCheck = 'SELECT') and aListView.Items[i].Selected then ok := true;
    aGraphItem := TGraphItem(aListView.Items.Item[i].SubItems.Objects[3]);
    typeitem := UpperCase(Pieces(aGraphItem.Values, '^', 1, 2));
    if not ok then
      if TypeToCheck = typeitem then ok := true
      else if (TypeToCheck = Piece(typeitem, '^', 1)) and
        singletype then ok := true;
    if ok then
    begin
      previous := false;
      done := false;
      j := 0;
      with lstCheck do
      while not done do
      begin
        if Items.Count = j then done := true
        else if lstCheck.Items[j] = typeitem then
        begin
          previous := true;
          done := true;
        end
        else j := j + 1;
      end;
      if not previous then
      begin
        lstCheck.Items.Add(typeitem);
        itemname := aListView.Items[i].Caption;
        if Piece(typeitem, '^', 1) = '63' then
          LabData(typeitem, itemname, aSection)
        else
          lstData.Items.AddStrings(rpcGetItemData(typeitem, FMTimeStamp, Patient.DFN));
      end;
    end;
  end;
end;

procedure TfrmGraphs.lvwItemsTopClick(Sender: TObject);
var
  i: integer;
begin
  FFirstClick := true;
  with FGraphSetting do
  if lvwItemsTop.SelCount > MaxSelect then
  begin
    pnlItemsTopInfo.Tag := 1;
    lvwItemsTop.ClearSelection;
    showmessage('Too many items to graph');
    for i := 0 to lstSelPrevTop.Items.Count - 1 do
      lvwItemsTop.Items[strtoint(lstSelPrevTop.Items[i])].Selected := true;
    pnlItemsTopInfo.Tag := 0;
  end
  else
  begin
    lstSelPrevTop.Clear;
    for i := 0 to lvwItemsTop.Items.Count - 1 do
      if lvwItemsTop.Items[i].Selected then lstSelPrevTop.Items.Add(inttostr(i));
    ItemsClick(Sender, lvwItemsTop, lvwItemsBottom, chkItemsTop, cboViewsTop, lstSelCopyTop, 'top');
  end;
end;

procedure TfrmGraphs.lvwItemsBottomClick(Sender: TObject);
var
  i: integer;
begin
  FFirstClick := true;
  with FGraphSetting do
  if lvwItemsBottom.SelCount > MaxSelect then
  begin
    pnlItemsBottomInfo.Tag := 1;
    lvwItemsBottom.ClearSelection;
    showmessage('Too many items to graph');
    for i := 0 to lstSelPrevBottom.Items.Count - 1 do
      lvwItemsBottom.Items[strtoint(lstSelPrevBottom.Items[i])].Selected := true;
    pnlItemsBottomInfo.Tag := 0;
  end
  else
  begin
    lstSelPrevBottom.Clear;
    for i := 0 to lvwItemsBottom.Items.Count - 1 do
      if lvwItemsBottom.Items[i].Selected then lstSelPrevBottom.Items.Add(inttostr(i));
    ItemsClick(Sender, lvwItemsBottom, lvwItemsTop, chkItemsBottom, cboViewsBottom, lstSelCopyBottom, 'bottom');
  end;
end;

procedure TfrmGraphs.SelCopy(aListView: TListView; aListBox: TListBox);
var
  i: integer;
  aGraphItem: TGraphItem;
begin
  if aListView.Items.Count > 0 then
  begin
    for i := 0 to aListView.Items.Count - 1 do
    if aListView.Items[i].Selected then
    begin
      aGraphItem := TGraphItem(aListView.Items.Item[i].SubItems.Objects[3]);    //get file^ien match
      aListBox.Items.Add(aGraphItem.Values);
    end;
  end;
end;

procedure TfrmGraphs.SelReset(aListbox: TListBox; aListView: TListView);
var
  i, j: integer;
  typeitem, itemtype: string;
  aGraphItem: TGraphItem;
begin
  for i := 0 to aListView.Items.Count - 1 do
  begin
    aGraphItem := TGraphItem(aListView.Items.Item[i].SubItems.Objects[3]);    //get file^ien match
    typeitem := UpperCase(Pieces(aGraphItem.Values, '^', 1, 3));
    for j := 0 to aListBox.Items.Count - 1 do
    begin
      itemtype := UpperCase(Pieces(aListBox.Items[j], '^', 1, 3));
      if itemtype = typeitem then
      begin
        aListView.Items[i].Selected := true;
        break;
      end;
    end
  end;
end;

procedure TfrmGraphs.ViewsChange(aListView: TListView; aComboBox: TORComboBox; aSection: string);
var
  Updated: boolean;
  aProfile: string;
begin
  timHintPause.Enabled := false;
  InactivateHint;
  if aComboBox.ItemIndex = -1 then exit;  // or clear graph  ***************************
  if aComboBox.ItemIndex = 0 then  // <clear all selections>
  begin
    aComboBox.Text := '';
    aListView.ClearSelection;
    if aSection = 'top' then
    begin
      FTHighTime := 0;
      FTLowTime := BIG_NUMBER;
    end
    else
    begin
      FBHighTime := 0;
      FBLowTime := BIG_NUMBER;
    end;
    DisplayData(aSection);
    exit;
  end;
  if aComboBox.ItemIndex = 1 then  // <make selections>
  begin
    btnGraphSelectionsClick(self);
    if aComboBox.ItemIndex = -1 then
      aComboBox.Text := '';
    exit;
  end;                            // view selected
  aListView.ClearSelection;
  Updated := false;
  aProfile := aComboBox.Items[aComboBox.ItemIndex];
  if (length(Piece(aProfile, '^', 3)) = 0) or (length(Piece(aProfile, '^', 1)) = 0) then        //or <custom>
    CheckProfile(aProfile, Updated);
  aComboBox.Text := Piece(aProfile, '^', 2);
  if Updated then
    cboDateRangeChange(self);
  if aSection = 'top' then
  begin
    AssignProfile(aProfile, 'top');
    if not FItemsSortedTop then
      lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[0]);
    if FGraphSetting.SortColumn > 0 then
      lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[FGraphSetting.SortColumn]);
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[2]);
    lvwItemsTopColumnClick(lvwItemsTop, lvwItemsTop.Column[2]);
    FItemsSortedTop := false;
  end
  else
  begin
    AssignProfile(aProfile, 'bottom');
    if not FItemsSortedBottom then
      lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[0]);
    if FGraphSetting.SortColumn > 0 then
      lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[FGraphSetting.SortColumn]);
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[2]);
    lvwItemsBottomColumnClick(lvwItemsBottom, lvwItemsBottom.Column[2]);
    FItemsSortedBottom := false;
  end;
  aListView.ClearSelection;
  AutoSelect(aListView);
  DisplayData(aSection);
end;

procedure TfrmGraphs.cboViewsTopChange(Sender: TObject);
begin
  ViewsChange(lvwItemsTop, cboViewsTop, 'top');
end;

procedure TfrmGraphs.cboViewsBottomChange(Sender: TObject);
begin
  ViewsChange(lvwItemsBottom, cboViewsBottom, 'bottom');
end;

procedure TfrmGraphs.AssignProfile(aProfile, aSection: string);
var
  profilename: string;
begin
  profilename := Piece(aProfile, '^', 2);
  aProfile := UpperCase(Piece(aProfile, '^', 3));
  if length(aProfile) = 0 then exit;
  if aSection = 'top' then
    SetProfile(aProfile, profilename, lvwItemsTop)
  else
    SetProfile(aProfile, profilename, lvwItemsBottom);
end;

procedure TfrmGraphs.SetProfile(aProfile, aName: string; aListView: TListView);
var
  i, j: integer;
  dcnm, itemdrugclass, itempart, itempart1, itempart2, itemnums: string;
  itemstring, itemstring1, itemstringnums, profname: string;
  aGraphItem: TGraphItem;
begin
  if aProfile = '0' then
  for i := 0 to aListView.Items.Count - 1 do
    aListView.Items[i].SubItems[1] := ''
  else
  for i := 0 to aListView.Items.Count - 1 do
  begin
    profname := '';
    aGraphItem := TGraphItem(aListView.Items.Item[i].SubItems.Objects[3]);   //get file^ien match
    itemstring := aGraphItem.Values;
    itemstring1 := UpperCase(Piece(itemstring, '^', 1));
    itemdrugclass := Piece(itemstring, '^', 6);
    itemstringnums := UpperCase(Pieces(itemstring, '^', 1, 2));
    for j := 1 to BIG_NUMBER do
    begin
      itempart := Piece(aProfile, '|', j);
      if itempart = '' then break;
      itempart1 := Piece(itempart, '~', 1);
      itempart2 := Piece(itempart, '~', 2);
      itemnums := itempart1 + '^' + itempart2;
      if (itempart1 = '50.605') and (length(itemdrugclass) > 0) then
      begin
        dcnm := DCName(itempart2);
        if dcnm = itemdrugclass then
        begin
          profname := aName;
          break;
        end;
      end
      else if itempart1 = '63' then
      begin
        if itemnums = Piece(itemstringnums, '.', 1) then
        begin
          profname := aName;
          break;
        end;
      end
      else
      begin
        if itemnums = itemstringnums then
        begin
          profname := aName;
          break;
        end;
      end;
      if (itempart1 = '0') and (itempart2 = itemstring1) then
      begin
        profname := aName;
        break;
      end
      else if (itempart1 = '0') and (length(Piece(itempart2, ';', 2)) > 0) then    // subtypes
      if copy(itempart2, 1, length(itemstring1)) = Piece(itempart2, ';', 1) then
      if Piece(itempart2, ';', 2) = UpperCase(Piece(Piece(itemstring, '^', 2), ';', 2)) then
      begin
        profname := aName;
        break;
      end;
    end;
    aListView.Items[i].SubItems[1] := profname;
  end;
end;

function TfrmGraphs.ExpandTax(profile: string): string;
var
  i: integer;
  itempart, itempart1, itempart2, newprofile: string;
  taxonomies: TStrings;
  expandedcodes: TStrings;
  taxonomycodes: TStrings;
begin    //  '811.2~123~|0~63~|' or '55~12~|0~811.2~|0~63~|'
  Result := profile;
  if Pos('811.2~', profile) = 0 then exit;
  taxonomies := TStringList.Create;
  expandedcodes := TStringList.Create;
  taxonomycodes := TStringList.Create;
  newprofile := '';
  for i := 1 to BIG_NUMBER do
  begin
    itempart := Piece(profile, '|', i);
    if length(itempart) = 0 then break;
    if Pos('811.2~', itempart) = 0 then
      newprofile := newprofile + '|'
    else
      taxonomies.Add(itempart);
  end;
  for i := 0 to taxonomies.Count -1 do
  begin
    itempart := taxonomies[i];
    if (Piece(itempart, '~', 1) = '0') and (Piece(itempart, '~', 2) = '811.2') then
    begin
      // this is Reminder Taxonomy <any> and would bring back a ton of codes
      //FastAssign(rpcTaxonomy(true, nil), expandedcodes);
      break;
    end
    else if Piece(itempart, '~', 1) = '811.2' then
      taxonomycodes.Add(Piece(itempart, '~', 2));
  end;
  if taxonomycodes.Count > 0 then
    FastAssign(rpcTaxonomy(false, taxonomycodes), expandedcodes);
  for i := 1 to expandedcodes.Count -1 do
  begin
    itempart := expandedcodes[i];
    itempart1 := Piece(itempart, ';', 1);
    itempart2 := Piece(itempart, ';', 2);
    newprofile := newprofile + itempart1 + '~' + itempart2 + '~|'
  end;
  Result := newprofile;
end;

procedure TfrmGraphs.CheckProfile(var aProfile: string; var Updated: boolean);
var
  i, j: integer;
  itempart, itempart1, itempart2, profile, profilename, profiletype, xprofile: string;
begin
  profiletype := Piece(aProfile, '^', 1);
  profilename := Piece(aProfile, '^', 2);
  if profiletype = '-2' then
    FastAssign(rpcGetGraphProfiles(UpperCase(profilename), '1', 0), lstTemp.Items)
  else if profiletype = '-1' then
    FastAssign(rpcGetGraphProfiles(UpperCase(profilename), '0', 0), lstTemp.Items);
  if profiletype <> '' then
  begin
    for i := 0 to lstTemp.Items.Count - 1 do
      aProfile := aProfile + lstTemp.Items[i];
    lstTemp.Items.Clear;
  end;
  Updated := false;
  profile := UpperCase(Piece(aProfile, '^', 3));
  xprofile := ExpandTax(profile);
  if xprofile <> profile then
  begin                                         // taxonomies
    profile := xprofile;
    LoadDisplayCheck('45DX', Updated);
    LoadDisplayCheck('45OP', Updated);
    LoadDisplayCheck('9000010.07', Updated);
    LoadDisplayCheck('9000010.18', Updated);
    LoadDisplayCheck('9000011', Updated);
    //LoadDisplayCheck('9999911', Updated);   // problems as durations not being used
  end;
  aProfile := Pieces(aProfile, '^', 1, 2) + '^' + profile;
  for j := 1 to BIG_NUMBER do
  begin
    itempart := Piece(profile, '|', j);
    if itempart = '' then break;
    itempart1 := Piece(itempart, '~', 1);
    itempart2 := Piece(itempart, '~', 2);
    if itempart1 = '0' then                      // <any> type
      LoadDisplayCheck(itempart2, Updated)
    else if itempart1 = '50.605' then            // drug class
    begin
      LoadDisplayCheck('52', Updated);
      LoadDisplayCheck('55', Updated);
      //LoadDisplayCheck('55NVAE', Updated);     // nonvameds as events are not being used
      LoadDisplayCheck('55NVA', Updated);
      LoadDisplayCheck('53.79', Updated);
    end
    else if itempart1 <> '0' then                // all others
      LoadDisplayCheck(itempart1, Updated);
  end;
end;

procedure TfrmGraphs.LoadDisplayCheck(typeofitem: string; var Updated: boolean);
begin
  if not TypeIsLoaded(typeofitem) then
  begin
    LoadType(typeofitem, '1');
    Updated := true;
  end;
  if not TypeIsDisplayed(typeofitem) then
  begin
    DisplayType(typeofitem, '1');
    Updated := true;
  end;
end;

procedure TfrmGraphs.AutoSelect(aListView: TListView);
var
  counter, i: integer;
begin
  counter := 0;
  for i := 0 to aListView.Items.Count - 1 do
  begin
    if length(aListView.Items[i].SubItems[1]) > 0 then
      counter := counter + 1;
  end;
  if counter <= FGraphSetting.MaxSelect then
    for i := 0 to aListView.Items.Count - 1 do
    begin
      if length(aListView.Items[i].SubItems[1]) > 0 then
        aListView.Items[i].Selected := true;
    end
  else
  begin
    if aListView = lvwItemsTop then
      lvwItemsTop.ClearSelection
    else if aListView = lvwItemsBottom then
      lvwItemsBottom.ClearSelection;
  end;
  if aListView = lvwItemsTop then
    lvwItemsTopClick(self)
  else if aListView = lvwItemsBottom then
    lvwItemsBottomClick(self);
end;

procedure TfrmGraphs.LabData(aItemType, aItemName, aSection: string);
var
  singlespec: boolean;
  i, oldlisting: integer;
  checkitem, checkstring, datastring, filename, itemnum, newitemname, newitemnum, newstring: string;
  spec1, spec2, spec3, spec4: string;
  aGraphItem: TGraphItem;
  aListItem: TListItem;
begin
  singlespec := true;
  spec1 := ''; spec2 := ''; spec3 := ''; spec4 := '';
  lstSpec1.Items.Clear; lstSpec2.Items.Clear; lstSpec3.Items.Clear; lstSpec4.Items.Clear;
  FastAssign(rpcGetItemData(aItemType, FMTimeStamp, Patient.DFN), lstScratchLab.Items);
  for i := 0 to lstScratchLab.Items.Count - 1 do
  begin
    datastring := lstScratchLab.Items[i];
    checkstring := Pieces(datastring, '^', 1, 2) + '^' + Pieces(datastring, '^', 7, 8);
    if length(spec1) = 0  then
    begin
      spec1 := checkstring;
      lstSpec1.Items.Add(datastring)
    end
    else if spec1 = checkstring then
      lstSpec1.Items.Add(datastring)
    else if length(spec2) = 0 then
    begin
      singlespec := false;
      spec2 := checkstring;
      lstSpec2.Items.Add(datastring)
    end
    else if spec2 = checkstring then
      lstSpec2.Items.Add(datastring)
    else if length(spec3) = 0 then
    begin
      spec3 := checkstring;
      lstSpec3.Items.Add(datastring)
    end
    else if spec3 = checkstring then
      lstSpec3.Items.Add(datastring)
    else
    begin
      spec4 := checkstring;
      lstSpec4.Items.Add(datastring)
    end;
  end;
  if singlespec then
    lstData.Items.AddStrings(lstScratchLab.Items)
  else
  begin
    lstMultiSpec.Items.Clear;
    itemnum := Piece(aItemType, '^', 2);
    if length(spec1) > 0 then
    begin
      newitemnum := itemnum + '.1';
      newitemname := aItemName + ' (' + LowerCase(Piece(spec1, '^', 4)) + ')';
      for i := 0 to lstItems.Items.Count - 1 do
      if aItemType = Pieces(lstItems.Items[i], '^', 1, 2) then
      begin
        newstring := lstItems.Items[i];
        lstItems.Items.Delete(i);
        break;
      end;
      for i := 0 to lstData.Items.Count - 1 do
      if aItemType = Pieces(lstData.Items[i], '^', 1, 2) then
        lstData.Items.Delete(i);
      ResetSpec(lstSpec1, itemnum, newitemnum, newitemname, newstring);
    end;
    if length(spec2) > 0 then
    begin
      newitemnum := itemnum + '.2';
      newitemname := aItemName + ' (' + LowerCase(Piece(spec2, '^', 4)) + ')';
      ResetSpec(lstSpec2, itemnum, newitemnum, newitemname, newstring);
    end;
    if length(spec3) > 0 then
    begin
      newitemnum := itemnum + '.3';
      newitemname := aItemName + ' (' + LowerCase(Piece(spec3, '^', 4)) + ')';
      ResetSpec(lstSpec3, itemnum, newitemnum, newitemname, newstring);
    end;
    if length(spec4) > 0 then
    begin
      newitemnum := itemnum + '.4';
      newitemname := aItemName + ' (other)';     // not specific after 3 specimens (from same time)
      ResetSpec(lstSpec4, itemnum, newitemnum, newitemname, newstring);
    end;
    oldlisting := 0;
    lvwItemsTop.SortType := stNone;    // avoids out of bounds error
    for i := 0 to lvwItemsTop.Items.Count - 1 do
    begin
      aGraphItem := TGraphItem(lvwItemsTop.Items.Item[i].SubItems.Objects[3]);   //get file^ien match
      checkitem := Pieces(aGraphItem.Values, '^', 1, 2);
      if aItemType = checkitem then
      begin
        oldlisting := i;
        lvwItemsTop.Items.Delete(i);
        break;
      end;
    end;
    filename := FileNameX('63');
    for i := 0 to lstMultiSpec.Items.Count - 1 do
    begin
      lstCheck.Items.Add(UpperCase(Pieces(lstMultiSpec.Items[i], '^', 1, 2)));
      if (FGraphSetting.FMStartDate = FM_START_DATE)
        or DateRangeMultiItems(FGraphSetting.FMStartDate, FGraphSetting.FMStopDate, Piece(lstMultiSpec.Items[i], '^', 2)) then
      begin
      with lvwItemsTop do
        aListItem := Items.Insert(oldlisting);
        aListItem.Caption := Piece(lstMultiSpec.Items[i], '^', 4);
        aListItem.SubItems.Add(filename);
        aListItem.SubItems.Add('');
        aListItem.SubItems.Add('');
        aGraphItem := TGraphItem.Create;
        aGraphItem.Values := lstMultiSpec.Items[i];
        aListItem.SubItems.AddObject('info object', aGraphItem);
        if aSection = 'top' then lvwItemsTop.Items[oldlisting].Selected := true;
      end;
    end;
    lvwItemsTop.SortType := stBoth;
    oldlisting := 0;
    lvwItemsBottom.SortType := stNone;    // avoids out of bounds error
    for i := 0 to lvwItemsBottom.Items.Count - 1 do
    begin
      aGraphItem := TGraphItem(lvwItemsBottom.Items.Item[i].SubItems.Objects[3]);   //get file^ien match
      checkitem := Pieces(aGraphItem.Values, '^', 1, 2);
      if aItemType = checkitem then
      begin
        oldlisting := i;
        lvwItemsBottom.Items.Delete(i);
        break;
      end;
    end;
    for i := 0 to lstMultiSpec.Items.Count - 1 do
    begin
      aListItem := lvwItemsBottom.Items.Insert(oldlisting);
      aListItem.Caption := Piece(lstMultiSpec.Items[i], '^', 4);
      aListItem.SubItems.Add(filename);
      aListItem.SubItems.Add('');
      aListItem.SubItems.Add('');
      aGraphItem := TGraphItem.Create;
      aGraphItem.Values := lstMultiSpec.Items[i];
      aListItem.SubItems.AddObject('info object', aGraphItem);
      if aSection = 'bottom' then lvwItemsBottom.Items[oldlisting].Selected := true;
    end;
    lvwItemsBottom.SortType := stBoth;
  end;
end;

procedure TfrmGraphs.RefUnits(aItem, aSpec: string; var low, high, units: string);
var
  i: integer;
  item2: double;
  itemspec, specstring: string;
begin
  item2 := strtofloatdef(aItem, -BIG_NUMBER);
  if item2 <> -BIG_NUMBER then
  begin
    item2 := round(item2);
    aItem := floattostr(item2);
  end;
  itemspec := aItem + '^' + aSpec;
  for i := 0 to lstTestSpec.Items.Count - 1 do
  if itemspec = Pieces(lstTestSpec.Items[i], '^', 1, 2) then
  begin
    specstring := lstTestSpec.Items[i];
    low :=   Piece(specstring, '^', 3);
    high :=  Piece(specstring, '^', 4);
    units := Piece(specstring, '^', 8);
    if (Copy(low, 1, 3) = '$S(') then low  := SelectRef(low);
    if (Copy(high, 1, 3) = '$S(') then high := SelectRef(high);
    break;
  end;
end;

function TfrmGraphs.SelectRef(aRef: string): string;
// check ref range for AGE and SEX variables in $S statement

  procedure CheckRef(selection: string; var value: string; var ok: boolean);
  var
    age: integer;
    part1, part2, part3: string;
  begin
    value := '';
    ok := false;
    if pos('$S', selection) > 0 then exit;
    if pos(':', selection) = 0 then exit;
    part1 := Piece(selection, ':', 1);
    part2 := Piece(selection, ':', 2);
    part3 := Piece(selection, ':', 3);
    if length(part1) = 0 then exit;
    if length(part2) = 0 then exit;
    if length(part3) <> 0 then exit;
    ok := true;
    value := part2;
    if part1 = '1' then exit;
    if copy(part1, 1, 4) = 'SEX=' then
    begin
      if (part1 = 'SEX="M"') and (Patient.Sex = 'M') then exit;
      if (part1 = 'SEX="F"') and (Patient.Sex = 'F') then exit; //?? check for '= '> '<    ??
      value := '';
    end
    else if copy(part1, 1, 3) = 'AGE' then
    begin
      part3 := copy(part1, 5, length(part1));
      age := strtointdef(part3, BIG_NUMBER);
      if age <> BIG_NUMBER then
      begin
        part3 := copy(part1, 1, 4);
        if (part3 = 'AGE>') and (Patient.Age > age) then exit;
        if (part3 = 'AGE<') and (Patient.Age < age) then exit;
        if (part3 = 'AGE=') and (Patient.Age = age) then exit;
      end;
      value := '';
    end
    else
      value:= '';
  end;

var
  ok: boolean;
  i: integer;
  selection, selections: string;
begin
  Result := '';
  if copy(aRef, length(aRef), 1) = ')' then
  begin
    selections := copy(aRef, 4, length(aRef) - 4);
    for i := 1 to BIG_NUMBER do
    begin
      selection := Piece(selections, ',', i);
      if selection = '' then break;
      ok := true;
      CheckRef(selection, Result, ok);
      if not ok then break;
      if length(Result) > 0 then break;
    end;
  end;
end;

procedure TfrmGraphs.ResetSpec(aListBox: TListBox; aItemNum, aNewItemNum, aNewItemName, aNewString: string);
var                                             //also add itemx
  i: integer;
  checkdate, newdate: double;
  newestdate, newstring: string;
begin
  lstTemp.Items.Clear;
  newdate := 0;
  for i := 0 to aListBox.Items.Count - 1 do
  begin
    newstring := aListBox.Items[i];
    newestdate := FMCorrectedDate(Piece(newstring, '^', 3));
    checkdate := strtofloatdef(newestdate, -BIG_NUMBER);
    if checkdate > newdate then newdate := checkdate;
    SetPiece(newstring, '^', 2, aNewItemNum);
    lstTemp.Items.Add(newstring);
  end;
  lstData.Items.AddStrings(lstTemp.Items);
  newestdate := floattostr(newdate);
  SetPiece(aNewString, '^', 2, aNewItemNum);
  SetPiece(aNewString, '^', 4, aNewItemName);
  SetPiece(aNewString, '^', 6, newestdate);
  lstItems.Items.Add(aNewString);
  lstMultiSpec.Items.Add(aNewString);
end;

procedure TfrmGraphs.chartBaseClickLegend(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  seriestitle: string;
begin
  FGraphClick := Sender;
  chartDatelineTop.Tag := -1;   // indicates a legend click
  if Button <> mbRight then
    ItemDateRange(Sender)
  else
  begin
    mnuPopGraphIsolate.Enabled := true;
    if pnlTop.Tag = 1 then
    begin
      if chkItemsTop.Checked then
      begin
        seriestitle := Sender.SeriesTitleLegend(0);
        scrlTop.Hint := 'Details - for ' + seriestitle;
        scrlTop.Tag := 1;
        mnuPopGraphIsolate.Caption := 'Move - ' + seriestitle + ' - from Top to Bottom';
        mnuPopGraphIsolate.Hint := seriestitle;
        mnuPopGraphRemove.Enabled := true;
        mnuPopGraphRemove.Caption := 'Remove - ' + seriestitle;
        mnuPopGraphDetails.Caption := 'Details - ' + seriestitle;
      end
      else
      begin
        mnuPopGraphIsolate.Caption := 'Move all selections to bottom';
        mnuPopGraphRemove.Caption := 'Remove all selections from top';
      end;
    end
    else
    begin
      if chkItemsBottom.Checked then
      begin
        seriestitle := Sender.SeriesTitleLegend(0);
        scrlTop.Hint := 'Details - for ' + seriestitle;
        scrlTop.Tag := 1;
        mnuPopGraphIsolate.Caption := 'Move - ' + seriestitle + ' - from Bottom to Top';
        mnuPopGraphIsolate.Hint := seriestitle;
        mnuPopGraphRemove.Enabled := true;
        mnuPopGraphRemove.Caption := 'Remove - ' + seriestitle;
        mnuPopGraphDetails.Caption := 'Details - ' + seriestitle;
      end
      else
      begin
        mnuPopGraphIsolate.Caption := 'Move all selections to top';
        mnuPopGraphRemove.Caption := 'Remove all selections from bottom';
      end;
    end;
  end;
end;

function TfrmGraphs.BPValue(aDateTime: TDateTime): string;
var
  i: integer;
  fmdatetime: double;
  datastring, datecheck, fmstring: string;
begin
  Result := '';
  fmdatetime := datetimetofmdatetime(aDateTime);
  fmstring := floattostr(fmdatetime);
  for i := 0 to lstData.Items.Count - 1 do
  begin
    datastring := lstData.Items[i];
    if Pieces(datastring, '^', 1, 2) = '120.5^1' then   //********** get item # for bp instead of 1
    begin
      datecheck := Piece(datastring, '^', 3);
      if length(Piece(datecheck, '.', 2)) > 0 then
        datecheck := Piece(datecheck, '.', 1) + '.' + copy(Piece(datecheck, '.', 2), 1, 4);
      if fmstring = datecheck then
      begin
        Result := Piece(datastring, '^', 5);
        break;
      end;
    end;
  end;
end;

procedure TfrmGraphs.mnuMedsasganttClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := true;
  lvwItemsTopClick(self);
  lvwItemsBottomClick(self);
end;

procedure TfrmGraphs.mnuPopGraphResetClick(Sender: TObject);
begin
  FFirstClick := true;
  lstZoomHistory.Items.Clear;
  FRetainZoom := false;
  mnuPopGraphZoomBack.Enabled := false;
  lvwItemsTopClick(self);
end;

procedure TfrmGraphs.serDatelineTopGetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
var
  cnt, i: integer;
  checktag, nonstring: string;
begin    // ********* listing one series' values is ok but no multiple ???
  MarkText := Sender.Title;
  if Copy(MarkText, 1, 4) = 'Ref ' then
    MarkText := '';
  if Sender.Title = '(non-numeric)' then
  begin
    if Sender.Tag > 0 then
    begin
      checktag := inttostr(Sender.Tag);
      cnt := -1;
      for i := 0 to lstNonNumeric.Items.Count - 1 do
      begin
        nonstring := lstNonNumeric.Items[i];
        if  checktag = Piece(nonstring, '^', 3) then
        begin
          cnt := cnt + 1;
          if  cnt = ValueIndex then
          begin
            MarkText := Piece(nonstring, '^', 2);
            break;
          end;
        end;
      end;
      if MarkText = '(non-numeric)' then
        beep;
    end;
  end;
end;

procedure TfrmGraphs.mnuPopGraphRemoveClick(Sender: TObject);
var
  i, selnum: integer;
  aSection, typeitem: string;
  aComboBox: TORComboBox;
  aListView: TListView;
begin
  FFirstClick := true;
  if pnlTop.Tag = 1 then
  begin
    aComboBox := cboViewsTop;
    aListView := lvwItemsTop;
    aSection := 'top';
  end
  else
  begin
    aComboBox := cboViewsBottom;
    aListView := lvwItemsBottom;
    aSection := 'bottom';
  end;
  aComboBox.ItemIndex := -1;
  aComboBox.Text := '';
  if aListView.SelCount = 0 then exit;
  if StripHotKey(mnuPopGraphRemove.Caption) = ('Remove all selections from ' + aSection) then
  begin
    with aListView do
    for i := 0 to Items.Count - 1 do
      if Items[i].Selected then
      begin
        Items[i].Selected := false;
      end;
    DisplayData('top');
    DisplayData('bottom');
  end
  else
  begin
    ItemCheck(aListView, mnuPopGraphIsolate.Hint, selnum, typeitem);
    if selnum = -1 then exit;
    aListView.Items[selnum].Selected := false;
    DisplayData('top');
    DisplayData('bottom');
  end;
  mnuPopGraphRemove.Enabled := false;
  mnuPopGraphResetClick(self);
end;

procedure TfrmGraphs.mnuPopGraphTodayClick(Sender: TObject);
begin
  with dlgDate do
  begin
    FMDateTime := FMToday;
    if Execute then FMToday := FMDateTime;
  end;
end;

procedure TfrmGraphs.BaseResize(aScrollBox: TScrollBox);
var
  displayheight, displaynum, i: integer;
begin
  ChartOnZoom(chartDatelineTop);
  with aScrollBox do
  begin
    if ControlCount < FGraphSetting.MaxGraphs then
      displaynum := ControlCount
    else
      displaynum := FGraphSetting.MaxGraphs;
    displayheight := FGraphSetting.MinGraphHeight;
    if displaynum > 0 then
      if (Height div displaynum) < FGraphSetting.MinGraphHeight then
        displayheight := FGraphSetting.MinGraphHeight
      else
        displayheight := (Height div displaynum);
    for i := 0 to aScrollBox.ControlCount - 1 do
      Controls[i].height := displayheight;
  end;
end;

procedure TfrmGraphs.pnlScrollTopBaseResize(Sender: TObject);
begin
  ChartOnZoom(chartDatelineTop);
  BaseResize(scrlTop);
  BaseResize(scrlBottom);
end;

procedure TfrmGraphs.NextPointerStyle(aSeries: TChartSeries; aSerCnt: integer);
var
  colors1, colors2, colors3, colors4, colors5, colors6: integer;
begin
  colors1 := NUM_COLORS + 1;
  colors2 := NUM_COLORS * 2 + 1;
  colors3 := NUM_COLORS * 3 + 1;
  colors4 := NUM_COLORS * 4 + 1;
  colors5 := NUM_COLORS * 5 + 1;
  colors6 := NUM_COLORS * 6 + 1;
  if aSeries is TLineSeries then
  begin
    with (aSeries as TLineSeries) do
    if aSerCnt < colors1 then
      Pointer.Style := psCircle
    else if aSerCnt < colors2 then
      Pointer.Style := psTriangle
    else if aSerCnt < colors3 then
      Pointer.Style := psRectangle
    else if aSerCnt < colors4 then
      Pointer.Style := psStar
    else if aSerCnt < colors5 then
      Pointer.Style := psDownTriangle
    else if aSerCnt < colors6 then
      Pointer.Style := psCross
    else
      Pointer.Style := psDiagCross;
  end
  else if aSeries is TBarSeries then
  begin
    with (aSeries as TBarSeries) do
    if aSerCnt < colors1 then
      BarStyle := bsPyramid
    else if aSerCnt < colors2 then
      BarStyle := bsInvPyramid
    else if aSerCnt < colors3 then
      BarStyle := bsArrow
    else if aSerCnt < colors4 then
      BarStyle := bsEllipse
    else
      BarStyle := bsRectangle;
  end
  else if aSeries is TPointSeries then
  begin
    with (aSeries as TPointSeries) do
    if aSerCnt < colors1 then
      Pointer.Style := psRectangle
    else if aSerCnt < colors2 then
      Pointer.Style := psTriangle
    else if aSerCnt < colors3 then
      Pointer.Style := psCircle
    else if aSerCnt < colors4 then
      Pointer.Style := psStar
    else if aSerCnt < colors5 then
      Pointer.Style := psDownTriangle
    else if aSerCnt < colors6 then
      Pointer.Style := psCross
    else
      Pointer.Style := psDiagCross;
  end;
end;

function TfrmGraphs.FMCorrectedDate(fmtime: string): string;
begin
  if Copy(fmtime, 4, 4) = '0000' then Result := Copy(fmtime, 1, 3) + '0101'
  else if Copy(fmtime, 6, 2) = '00' then Result := Copy(fmtime, 1, 5) + '01'
  else Result := fmtime;
end;

procedure TfrmGraphs.FixedDates(var adatetime, adatetime1: TDateTime);
begin
  if FGraphSetting.FMStartDate <> FM_START_DATE then
  begin  // do not use when All Results
    adatetime := FMDateTimeToDateTime(FGraphSetting.FMStopDate);
    adatetime1 := FMDateTimeToDateTime(FGraphSetting.FMStartDate);
    FGraphSetting.HighTime := adatetime;
    FGraphSetting.LowTime := adatetime1;
    FTHighTime := adatetime;
    FTLowTime := adatetime1;
    FBHighTime := adatetime;
    FBLowTime := adatetime1;
  end;
end;

procedure TfrmGraphs.HighLow(fmtime, fmtime1: string; aChart: TChart; var adatetime, adatetime1: TDateTime);
begin
  adatetime1 := 0;
  adatetime := FMToDateTime(fmtime);
  if adatetime > FGraphSetting.HighTime then FGraphSetting.HighTime := adatetime;
  if adatetime < FGraphSetting.LowTime then FGraphSetting.LowTime := adatetime;
  if aChart = chartDatelineTop then
  begin
    if adatetime > FTHighTime then FTHighTime := adatetime;
    if adatetime < FTLowTime then FTLowTime := adatetime;
  end
  else
  begin
    if adatetime > FBHighTime then FBHighTime := adatetime;
    if adatetime < FBLowTime then FBLowTime := adatetime;
  end;
  if fmtime1 <> '' then
  begin
    adatetime1 := FMToDateTime(fmtime1);
    if adatetime1 > FGraphSetting.HighTime then FGraphSetting.HighTime := adatetime1;
    if adatetime1 < FGraphSetting.LowTime then FGraphSetting.LowTime := adatetime1;
    if aChart = chartDatelineTop then
    begin
      if adatetime1 > FTHighTime then FTHighTime := adatetime1;
      if adatetime1 < FTLowTime then FTLowTime := adatetime1;
    end
    else
    begin
      if adatetime1 > FBHighTime then FBHighTime := adatetime1;
      if adatetime1 < FBLowTime then FBLowTime := adatetime1;
    end;
  end;
end;

procedure TfrmGraphs.HideGraphs(action: boolean);
begin
  pnlTop.Color := chartDatelineTop.Color;
  pnlBottom.Color := chartDatelineTop.Color;
  if action then
  begin
    pnlScrollTopBase.Visible := false;
    pnlScrollBottomBase.Visible := false;
  end
  else
  begin
    pnlScrollTopBase.Visible := true;
    pnlScrollBottomBase.Visible := true;
    chartDatelineTop.Refresh;
  end;
end;

//****************************************************************************

procedure TfrmGraphs.MakeLineSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt, aNonCnt: integer; multiline: boolean);

  procedure BorderValue(var bordervalue: double; value: double);
  begin
    if FGraphSetting.FixedDateRange then
      if bordervalue = -BIG_NUMBER then
        bordervalue := value;
  end;

var
  estimate, firstcnt, i, noncnt: integer;
  value, fixeddatevalue, hi, highestvalue, highvalue, lo, nonvalue: double;
  checkdata, fmtime, itemvalue, valueD, valueM, valueS: string;
  high, low, specimen: string;
  adatetime, adatetime1: TDateTime;
  afixeddate, afixeddate1: TDateTime;
  ser1, ser2, ser3, serLow, serHigh: TLineSeries;
  serBlank, serPoint: TPointSeries;
begin
  fixeddatevalue := -BIG_NUMBER;
  highestvalue := aChart.MaxYValue(aChart.LeftAxis);
  if highestvalue < 1 then highestvalue := 1;
  firstcnt := lstNonNumeric.Items.Count;
  noncnt := firstcnt;
  aChart.LeftAxis.LabelsFont.Color := aChart.BottomAxis.LabelsFont.Color;
  aSerCnt := aSerCnt + 1;
  ser1 := TLineSeries.Create(aChart);
  ser2 := TLineSeries.Create(aChart);
  ser3 := TLineSeries.Create(aChart);
  serPoint := TPointSeries.Create(aChart);
  serBlank := TPointSeries.Create(aChart);
  serLow := TLineSeries.Create(aChart);
  serHigh := TLineSeries.Create(aChart);
  specimen := LowerCase(Piece(aTitle, '^', 4));
  low := Piece(aTitle, '^', 5);                   // collect non numeric - graph as events
  high := Piece(aTitle, '^', 6);
  lo := strtofloatdef(low, -BIG_NUMBER);
  hi := strtofloatdef(high, -BIG_NUMBER);
  serLow.Active := false;
  serHigh.Active := false;
  serPoint.Active := false;
  serBlank.Active := false;
  with ser1 do
  begin
    LinePen.Visible := FGraphSetting.Lines;
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    if (length(specimen) > 0) and (not ansicontainsstr(Title, specimen)) then
      Title := Title + ' (' + specimen + ')';
    XValues.DateTime := True;
    NextPointerStyle(ser1, aSerCnt);
    Identifier := aFileType;
    Pointer.Visible := true;
    Pointer.InflateMargins := true;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Marks.BackColor := clInfoBk;
    if ser1.Title = 'Blood Pressure' then
    begin
      ser1.Title := 'Blood Pressure';
      with ser2 do
      begin
        ParentChart := aChart;
        Title := 'Blood Pressure';
        XValues.DateTime := true;
        Pointer.Style := ser1.Pointer.Style;
        ShowInLegend := false;    //****
        Identifier := aFileType;
        Pointer.Visible := true;
        Pointer.InflateMargins := true;
        ColorEachPoint := false;
        SeriesColor := ser1.SeriesColor;
        Marks.BackColor := clInfoBk;
        Active := true;
      end;
      with ser3 do
      begin
        ParentChart := aChart;
        Title := 'Blood Pressure';
        XValues.DateTime := true;
        Pointer.Style := ser1.Pointer.Style;
        ShowInLegend := false;   //****
        Identifier := aFileType;
        Pointer.Visible := true;
        Pointer.InflateMargins := true;
        ColorEachPoint := false;
        SeriesColor := ser1.SeriesColor;
        Marks.BackColor := clInfoBk;
        Active := false;
      end;
    end
    else
    begin
      ser2.Active := false;
      ser3.Active := false;
    end;
    highvalue := 0;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      checkdata := lstTemp.Items[i];
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      if IsFMDateTime(fmtime) then
      begin
        HighLow(fmtime, '', aChart, adatetime, adatetime1);
        itemvalue := Piece(Items[i], '^', 5);
        itemvalue := trim(itemvalue);
        itemvalue := StringReplace(itemvalue, ',', '', [rfReplaceAll]);
        if ser1.Title = 'Blood Pressure' then
        begin
          valueS := Piece(itemvalue, '/', 1);
          valueD := Piece(itemvalue, '/', 2);
          valueM := Piece(itemvalue, '/', 3);
          value := strtofloatdef(valueS, -BIG_NUMBER);
          if value <> -BIG_NUMBER then
            ser1.AddXY(adatetime, value, '', clTeeColor);
          value := strtofloatdef(valueD, -BIG_NUMBER);
          if value <> -BIG_NUMBER then
            ser2.AddXY(adatetime, value, '', clTeeColor);
          value := strtofloatdef(valueM, -BIG_NUMBER);
          if value <> -BIG_NUMBER then
          begin
            ser3.AddXY(adatetime, value, '', clTeeColor);
            ser3.Active := true;
          end;
          BorderValue(fixeddatevalue, 100);
        end
        else
        begin
          value := strtofloatdef(itemvalue, -BIG_NUMBER);
          if value <> -BIG_NUMBER then
          begin
            if (btnChangeSettings.Tag = 1) and (hi <> -BIG_NUMBER) and (lo <> -BIG_NUMBER) then
            begin
              value := StdDev(value, hi, lo);
              ser1.AddXY(adatetime, value, '', clTeeColor);
              high := '2'; low := '-2';
              BorderValue(fixeddatevalue, 0);
              //splGraphs.Tag := 1;   // show ref range
            end
            else if btnChangeSettings.Tag = 2 then
            begin
              value := InvVal(value);
              ser1.AddXY(adatetime, value, '', clTeeColor);
              high := '2'; low := '0';
              BorderValue(fixeddatevalue, 0);
              splGraphs.Tag := 0;  // do not show ref range
            end
            else
            begin
              ser1.AddXY(adatetime, value, '', clTeeColor);
              if value > highvalue then
                highvalue := value;
              BorderValue(fixeddatevalue, value);
            end;
          end
          else
          begin
            noncnt := noncnt + 1;
            lstNonNumeric.Items.Add(floattostr(adatetime) + '^' +
              itemvalue + '^' + inttostr(aNonCnt + 1));
          end;
        end;
      end;
    end;
    if (length(low) > 0) and (splGraphs.Tag = 1) then
    begin
      with serLow do
      begin
        Active := true;
        ParentChart := aChart;
        XValues.DateTime := True;
        Pointer.Visible := false;
        Pointer.InflateMargins := true;
        OnGetMarkText := serDatelineTop.OnGetMarkText;
        ColorEachPoint := false;
        Title := 'Ref Low ' + low;
        Pointer.Style := psCircle;
        SeriesColor := ser1.SeriesColor; //clBtnShadow ; //clTeeColor;
        Marks.Visible := false;
        LinePen.Visible := true;
        LinePen.Width := 2;
        LinePen.Style := psDash;  //does not show when width <> 1
      end;
      value := strtofloatdef(low, -BIG_NUMBER);
      if value <> -BIG_NUMBER then
      begin
        serLow.AddXY(IncDay(FGraphSetting.LowTime, -1), value, '', clTeeColor);
        serLow.AddXY(IncDay(FGraphSetting.HighTime, 1), value, '', clTeeColor);
        BorderValue(fixeddatevalue, value);
      end;
    end;
    if (length(high) > 0) and (splGraphs.Tag = 1) then
    begin
      with serHigh do
      begin
        Active := true;
        ParentChart := aChart;
        XValues.DateTime := True;
        Pointer.Visible := false;
        Pointer.InflateMargins := true;
        OnGetMarkText := serDatelineTop.OnGetMarkText;
        ColorEachPoint := false;
        Title := 'Ref High ' + high;
        Pointer.Style := psCircle;
        SeriesColor := ser1.SeriesColor; // clBtnShadow; //clTeeColor;
        Marks.Visible := false;
        LinePen.Visible := true;
        LinePen.Width := 2;
        LinePen.Style := psDash;  //does not show when width <> 1
      end;
      value := strtofloatdef(high, -BIG_NUMBER);
      if value <> -BIG_NUMBER then
      begin
        serHigh.AddXY(IncDay(FGraphSetting.LowTime, -1), value, '', clTeeColor);
        serHigh.AddXY(IncDay(FGraphSetting.HighTime, 1), value, '', clTeeColor);
        BorderValue(fixeddatevalue, value);
      end;
    end;
    splGraphs.Tag := 0;
    if noncnt > firstcnt then
    begin
      if aChart.Height < 10 then estimate := pnlMain.Height div 2
      else estimate := aChart.Height;
      aNonCnt := aNonCnt + 1;  // use nonnumeric count to offset position
      nonvalue := (aNonCnt * (10 / (estimate + 1)) * highestvalue);
      with serBlank do
      begin
        Active := true;
        ParentChart := aChart;
        XValues.DateTime := True;
        Pointer.Visible := true;
        Pointer.InflateMargins := true;
        OnGetMarkText := serDatelineTop.OnGetMarkText;
        ColorEachPoint := false;
        Title := '';
        Pointer.Style := psSmallDot;
        SeriesColor := aChart.Color;
        Marks.Visible := false;
        ShowInLegend := false;
      end;
      with serPoint do
      begin
        Active := true;
        ParentChart := aChart;
        XValues.DateTime := True;
        Pointer.Visible := true;
        Pointer.InflateMargins := true;
        OnGetMarkText := serDatelineTop.OnGetMarkText;
        ColorEachPoint := false;
        Title := '(non-numeric)';
        Hint := aTitle;
        Tag := aNonCnt;
        Pointer.Style := ser1.Pointer.Style;
        SeriesColor := ser1.SeriesColor;
        Marks.BackColor := clInfoBk;
        ShowInLegend := false;
      end;
      for i := 0 to lstNonNumeric.Items.Count - 1 do
      begin
        if Piece(lstNonNumeric.Items[i], '^',3) = inttostr(aNonCnt) then
        if highvalue = 0 then
        begin
          adatetime := strtofloatdef(Piece(lstNonNumeric.Items[i], '^', 1), -BIG_NUMBER);
          if adatetime <> -BIG_NUMBER then
          begin
            serBlank.Pointer.Pen.Visible := false;
            serBlank.AddXY(adatetime, 1, '', pnlScrollTopBase.Color);
            break;
          end;
        end;
      end;
      for i := 0 to lstNonNumeric.Items.Count - 1 do
      if Piece(lstNonNumeric.Items[i], '^',3) = inttostr(aNonCnt) then
      begin
        adatetime := strtofloatdef(Piece(lstNonNumeric.Items[i], '^', 1), -BIG_NUMBER);
        if adatetime <> -BIG_NUMBER then
        begin
          serPoint.Pointer.Pen.Visible := true;
          serPoint.AddXY(adatetime, nonvalue, '', ser1.SeriesColor);
          BorderValue(fixeddatevalue, nonvalue);
        end;
      end;
      if highvalue = 0 then
      begin
        aChart.LeftAxis.LabelsFont.Color := pnlScrollTopBase.Color;
        FNonNumerics := true;
      end;
    end;
    if ser1.Title = 'Pain' then
    begin
      if not serBlank.Active then
      with serBlank do
      begin
        Active := true;
        ParentChart := aChart;
        XValues.DateTime := True;
        Pointer.Visible := true;
        Pointer.InflateMargins := true;
        OnGetMarkText := serDatelineTop.OnGetMarkText;
        ColorEachPoint := false;
        Title := '';
        Pointer.Style := psSmallDot;
        SeriesColor := aChart.Color;
        Marks.Visible := false;
        ShowInLegend := false;
      end;
      serBlank.Pointer.Pen.Visible := false;
      serBlank.AddXY(IncDay(FGraphSetting.LowTime, -1), 0, '', pnlScrollTopBase.Color);
      serBlank.AddXY(IncDay(FGraphSetting.LowTime, -1), 10, '', pnlScrollTopBase.Color);
    end;
    if multiline then
    begin
      // do nothing for now
    end;
    if fixeddatevalue <> -BIG_NUMBER then
    begin
      if not serBlank.Active then
      with serBlank do
      begin
        Active := true;
        ParentChart := aChart;
        XValues.DateTime := True;
        Pointer.Visible := true;
        Pointer.InflateMargins := true;
        OnGetMarkText := serDatelineTop.OnGetMarkText;
        ColorEachPoint := false;
        Title := '';
        Pointer.Style := psSmallDot;
        SeriesColor := aChart.Color;
        Marks.Visible := false;
        ShowInLegend := false;
      end;
      FixedDates(afixeddate, afixeddate1);
      serBlank.Pointer.Pen.Visible := false;
      serBlank.AddXY(afixeddate, fixeddatevalue, '', aChart.Color);
      serBlank.AddXY(afixeddate1, fixeddatevalue, '', aChart.Color);
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakePointSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime: string;
  adatetime, adatetime1: TDateTime;
  ser1: TPointSeries;
begin
  aSerCnt := aSerCnt + 1;
  ser1 := TPointSeries.Create(aChart);
  with ser1 do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    XValues.DateTime := True;
    NextPointerStyle(ser1, aSerCnt);
    Pointer.VertSize := 10;
    Pointer.HorizSize := 2;
    Identifier := aFileType;
    Pointer.Visible := true;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Marks.BackColor := clInfoBk;
    with lstTemp do
    for i := 0 to lstTemp.Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      if IsFMDateTime(fmtime) then
      begin
        HighLow(fmtime, '', aChart, adatetime, adatetime1);
        value := strtofloatdef(Piece(Items[i], '^', 5), -BIG_NUMBER);
        if value = -BIG_NUMBER then
        begin
          value := aSerCnt;
          TempCheck(Pieces(Items[i], '^', 1, 2), value);
        end;
        ser1.AddXY(adatetime, value, '', clTeeColor);
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeBarSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime: string;
  adatetime, adatetime1: TDateTime;
  afixeddate, afixeddate1: TDateTime;
  ser1: TBarSeries;
  serBlank: TPointSeries;
begin
  aSerCnt := aSerCnt + 1;
  ser1 := TBarSeries.Create(aChart);
  serBlank := TPointSeries.Create(aChart);
  with serBlank do
  begin
    Active := true;
    ParentChart := aChart;
    XValues.DateTime := True;
    Pointer.Visible := true;
    Pointer.InflateMargins := false;
    ColorEachPoint := false;
    Title := '';
    Pointer.Style := psSmallDot;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    SeriesColor := aChart.Color;
    Marks.BackColor := clInfoBk;
    ShowInLegend := false;
  end;
  with ser1 do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    XValues.DateTime := True;
    YOrigin := 0;
    Identifier := aFileType;
    Marks.Visible := false;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    CustomBarWidth := 7;
    Marks.Style := smsLabel;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Marks.BackColor := clInfoBk;
    NextPointerStyle(ser1, aSerCnt);
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      if IsFMDateTime(fmtime) then
      begin
        HighLow(fmtime, '', aChart, adatetime, adatetime1);
        value := 25 - (aSerCnt mod NUM_COLORS);
        if FPrevEvent = copy(fmtime, 1, 10) then
          if copy((FPrevEvent + '00'), 1, 12) = copy(fmtime, 1, 12) then  // same time occurrence
          begin
            pnlInfo.Caption := TXT_WARNING_SAME_TIME;
            pnlInfo.Color := COLOR_WARNING;
            pnlInfo.Visible := true;
            pnlHeader.Visible := true;
            FWarning := true;
          end;
        if value <> -BIG_NUMBER then
          ser1.AddXY(adatetime, value, '', clTeeColor);
        FPrevEvent := copy(fmtime, 1, 10);
        if i = 0 then
        begin
          serBlank.Pointer.Pen.Visible := false;
          serBlank.AddXY(adatetime, 100, '', aChart.Color);
          if FGraphSetting.FixedDateRange then
          begin
            FixedDates(afixeddate, afixeddate1);
            serBlank.AddXY(afixeddate, 100, '', aChart.Color);
            serBlank.AddXY(afixeddate1, 100, '', aChart.Color);
          end;
        end;
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeManyGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i, value: integer;
  fmtime, fmtime1: string;
  adatetime, adatetime1: TDateTime;
  afixeddate, afixeddate1: TDateTime;
  gantt: TGanttSeries;
  serBlank: TPointSeries;
begin
  aSerCnt := aSerCnt + 1;
  gantt := TGanttSeries.Create(aChart);
  serBlank := TPointSeries.Create(aChart);
  with serBlank do
  begin
    Active := true;
    ParentChart := aChart;
    XValues.DateTime := True;
    Pointer.Visible := true;
    Pointer.InflateMargins := false;
    ColorEachPoint := false;
    Title := '';
    Pointer.Style := psSmallDot;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    SeriesColor := aChart.Color;
    Marks.BackColor := clInfoBk;
    ShowInLegend := false;
  end;
  with gantt do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    if Piece(aTitle, '^', 1) = '55' then       // make inpatient meds smaller to identify
      Pointer.VertSize := RX_HEIGHT_IN
    else if Piece(aTitle, '^', 1) = '55NVA' then       // make nonva meds smaller to identify
      Pointer.VertSize := RX_HEIGHT_NVA
    else if Piece(aTitle, '^', 1) = '9999911' then       // make problems smaller to identify
      Pointer.VertSize := PROB_HEIGHT
    else
      Pointer.VertSize := RX_HEIGHT_OUT;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Identifier := aFileType;
    Marks.BackColor := clInfoBk;
    value := round(((aSerCnt mod NUM_COLORS) / NUM_COLORS) * 80) + 20 + aSerCnt;
    if aFileType <> '9999911' then
      if aChart <> chartDatelineTop then
        if aChart <> chartDatelineBottom then
      value := value - 26;
    with lstTemp do
    for i := 0 to lstTemp.Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        AddGantt(adatetime, adatetime1, value, '');
        if i = 0 then
        begin
          serBlank.Pointer.Pen.Visible := false;
          serBlank.AddXY(adatetime, 100, '', aChart.Color);
          if aFileType = '9999911' then
            serBlank.AddXY(adatetime, 0, '', aChart.Color);
          if FGraphSetting.FixedDateRange then
          begin
            FixedDates(afixeddate, afixeddate1);
            serBlank.AddXY(afixeddate, 100, '', aChart.Color);
            serBlank.AddXY(afixeddate1, 100, '', aChart.Color);
          end;
        end;
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeVisitGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime, fmtime1: string;
  adatetime, adatetime1: TDateTime;
  afixeddate, afixeddate1: TDateTime;
  gantt: TGanttSeries;
  serBlank: TPointSeries;
begin
  aSerCnt := aSerCnt + 1;
  gantt := TGanttSeries.Create(aChart);
  serBlank := TPointSeries.Create(aChart);
  with serBlank do
  begin
    Active := true;
    ParentChart := aChart;
    XValues.DateTime := True;
    Pointer.Visible := true;
    Pointer.InflateMargins := false;
    ColorEachPoint := false;
    Title := '';
    Pointer.Style := psSmallDot;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    SeriesColor := aChart.Color;
    Marks.Visible := false;
    ShowInLegend := false;
  end;
  with gantt do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    if Piece(aTitle, '^', 1) = '405' then  // make admit smaller to identify
      Pointer.VertSize := NUM_COLORS + 3
    else if Piece(aTitle, '^', 1) = '9999911' then  // make problems smaller to identify
      Pointer.VertSize := PROB_HEIGHT
    else
      Pointer.VertSize := NUM_COLORS + (aSerCnt mod NUM_COLORS) + 10;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Identifier := aFileType;
    Marks.BackColor := clInfoBk;
    value := aSerCnt div NUM_COLORS;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        AddGantt(adatetime, adatetime1, value, '');
        if i = 0 then
        begin
          serBlank.Pointer.Pen.Visible := false;
          serBlank.AddXY(adatetime, 100, '', aChart.Color);
          if FGraphSetting.FixedDateRange then
          begin
            FixedDates(afixeddate, afixeddate1);
            serBlank.AddXY(afixeddate, 100, '', aChart.Color);
            serBlank.AddXY(afixeddate1, 100, '', aChart.Color);
          end;
        end;
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeWeightedGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime, fmtime1: string;
  gantt: TGanttSeries;
  adatetime, adatetime1: TDateTime;
begin
  aSerCnt := aSerCnt + 1;
  gantt := TGanttSeries.Create(aChart);
  with gantt do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    value := NUM_COLORS;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Identifier := aFileType;
    Marks.BackColor := clInfoBk;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        value := Vfactor(Piece(aTitle, '^', 3));
        AddGantt(adatetime, adatetime1, 1, '');
        value := value + (value / 2);
      end;
    end;
    Pointer.VertSize := round(value);
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeArrowSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime, fmtime1: string;
  arrows: TArrowSeries;
  adatetime, adatetime1: TDateTime;
begin
  aSerCnt := aSerCnt + 1;
  arrows := TArrowSeries.Create(aChart);
  with arrows do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    Clear;
    ArrowWidth := 12;
    ArrowHeight := 9;
    StartXValues.DateTime := true;
    EndXValues.DateTime := true;
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    Pointer.Visible := false;
    Pointer.VertSize := 17; //pnlTop.Height;        //******* for meds
    Pointer.HorizSize := 24;
    Pointer.InflateMargins := true;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Identifier := aFileType;
    Marks.BackColor := clInfoBk;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        value := strtofloatdef(Piece(Items[i], '^', 5), -BIG_NUMBER);
        if value = -BIG_NUMBER then
          TempCheck(Pieces(Items[i], '^', 1, 2), value);
        AddArrow(adatetime, value, adatetime1, value, '', SeriesColor);
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeWeightedArrowSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime, fmtime1: string;
  adatetime, adatetime1: TDateTime;
  arrows: TArrowSeries;
begin
  aSerCnt := aSerCnt + 1;
  arrows := TArrowSeries.Create(aChart);
  with arrows do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    Clear;
    ArrowWidth := 12;
    ArrowHeight := 9;
    StartXValues.DateTime := true;
    EndXValues.DateTime := true;
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    Pointer.Visible := false;
    Pointer.VertSize := 17; //pnlTop.Height;        //******* for meds
    Pointer.HorizSize := 24;
    Pointer.InflateMargins := true;
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Identifier := aFileType;
    Marks.BackColor := clInfoBk;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        value := strtofloatdef(Piece(Items[i], '^', 5), -BIG_NUMBER);
        if value = -BIG_NUMBER then
          TempCheck(Pieces(Items[i], '^', 1, 2), value);
        AddArrow(adatetime, value, adatetime1, value, '', SeriesColor);
      end;
    end;
    value := Vfactor(Piece(aTitle, '^', 3));
    if value < 1 then value := 1;
    Pointer.HorizSize := round(value);
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime, fmtime1: string;
  adatetime, adatetime1: TDateTime;
  gantt: TGanttSeries;
begin
  aSerCnt := aSerCnt + 1;
  gantt := TGanttSeries.Create(aChart);
  with gantt do
  begin
    ParentChart := aChart;
    Title := Piece(aTitle, '^', 3);
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    Pointer.VertSize := pnlTop.Height;        //******* like vertical bars
    GetData(aTitle);
    ColorEachPoint := false;
    SeriesColor := NextColor(aSerCnt);
    Identifier := aFileType;
    Marks.BackColor := clInfoBk;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        value := strtofloatdef(Piece(Items[i], '^', 5), -BIG_NUMBER);
        if value = -BIG_NUMBER then
          TempCheck(Pieces(Items[i], '^', 1, 2), value);
        AddGantt(adatetime, adatetime1, 1, '');
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.MakeAGanttSeries(aChart: TChart; aTitle, aFileType: string; var aSerCnt: integer);
var
  i: integer;
  value: double;
  fmtime, fmtime1: string;
  gantt: TGanttSeries;
  adatetime, adatetime1: TDateTime;
begin
  aSerCnt := aSerCnt + 1;
  if aChart = chartDatelineTop then
    gantt := serDatelineTop
  else
    gantt := serDatelineBottom;
  with gantt do
  begin
    ParentChart := aChart;
    Active := true;
    Title := Piece(aTitle, '^', 3);
    Marks.Style := smsLabel;
    OnGetMarkText := serDatelineTop.OnGetMarkText;
    //Pointer.VertSize := pnlTop.Height;        //******* for meds
    GetData(aTitle);
    Identifier := aFileType;
    ColorEachPoint := True;
    with lstTemp do
    for i:= 0 to Items.Count - 1 do
    begin
      fmtime := FMCorrectedDate(Piece(Items[i], '^', 3));
      fmtime1 := FMCorrectedDate(Piece(Items[i], '^', 4));
      if IsFMDateTime(fmtime) and IsFMDateTime(fmtime1) then
      begin
        HighLow(fmtime, fmtime1, aChart, adatetime, adatetime1);
        value := strtofloatdef(Piece(Items[i], '^', 5), -BIG_NUMBER);
        if value = -BIG_NUMBER then
          TempCheck(Pieces(Items[i], '^', 1, 2), value);
        AddGantt(adatetime, adatetime1, aSerCnt, '');
      end;
    end;
    GetHorizAxis.ExactDateTime := True;
    GetHorizAxis.Increment := DateTimeStep[dtOneMinute];
  end;
end;

procedure TfrmGraphs.splGraphsMoved(Sender: TObject);
begin
  if Sender = splGraphs then
    chkDualViews.Checked := pnlBottom.Height > 3;
end;

function TfrmGraphs.ValueText(Sender: TCustomChart; Series: TChartSeries; ValueIndex: Integer): string;
var      // type#^typename^formatdate^itemname^result^date
  i, offset, SeriesNum, selnum: integer;
  dateend, datestart: double;
  astring, datecheck, filetype, fmdatecheck, item, otherdate, partitem: string;
  resultdate, results, seriestitle, typeitem, typename, typenum: string;
begin
  SeriesNum := -1;
  for i := 0 to Sender.SeriesCount -1 do
  if Sender.Series[i] = Series then
  begin
    SeriesNum := i;
    filetype := Sender.Series[i].Identifier;
    break;
  end;
  seriestitle := Sender.Series[SeriesNum].Title;
  if (seriestitle = '') and (SeriesNum < (Series.Count - 1)) then
    if Sender.Series[SeriesNum + 1].Title = '(non-numeric)' then
    begin
      SeriesNum := SeriesNum + 1;
      seriestitle := '(non-numeric)';
    end;
  Result := '';
  if seriestitle <> '(non-numeric)' then
  begin
    ItemCheck(lvwItemsTop, seriestitle, selnum, typeitem);
    typeitem := UpperCase(typeitem);
  end
  else
  begin
    selnum := 1;
    typeitem := '63';
    offset := 2; // 2 series before
    if (copy(Sender.Series[SeriesNum - offset].Title, 1, 4) = 'Ref ') then
      if SeriesNum - 4 > -1 then
        offset := 4 // if ref ranges
      else if SeriesNum - 3 > -1 then
        offset := 3; // if ref ranges
    seriestitle := Sender.Series[SeriesNum - offset].Title + ' ' + seriestitle;
  end;
  if selnum < 0 then
  begin
    Result := '^^^' + seriestitle;
    exit;
  end;
  typenum := Piece(typeitem, '^', 1);
  if (typenum <> filetype) and (filetype <> '') then
  begin
    typenum := filetype;
    typeitem := typenum + '^' + Piece(typeitem, '^', 2);
  end;
  if typenum = '55' then
  begin
    if Series is TGanttSeries then
      if (Series as TGanttSeries).Pointer.VertSize <> RX_HEIGHT_IN then
      if (Series as TGanttSeries).Pointer.VertSize <> RX_HEIGHT_NVA then
        typenum := '52'
      else typenum := '55NVA';
  end
  else if typenum = '55NVA' then
  begin
    if Series is TGanttSeries then
      if (Series as TGanttSeries).Pointer.VertSize <> RX_HEIGHT_NVA then
      if (Series as TGanttSeries).Pointer.VertSize <> RX_HEIGHT_OUT then
        typenum := '55'
      else typenum := '52';
  end
  else if typenum = '52' then
  begin
    if Series is TGanttSeries then
      if (Series as TGanttSeries).Pointer.VertSize <> RX_HEIGHT_OUT then
      if (Series as TGanttSeries).Pointer.VertSize <> RX_HEIGHT_NVA then
        typenum := '55'
      else typenum := '55NVA';
  end;
  typename := FileNameX(typenum);
  if ValueIndex < 0 then
  begin
    Result := typenum + '^' + typename + '^^' + seriestitle;
    exit;
  end;
  if Copy(typename, length(typename) - 2, 3) = 'ies' then
    typename := Copy(typename, 1, length(typename) - 3) + 'y'
  else if Copy(typename, length(typename), 1) = 's' then
    typename := Copy(typename, 1, length(typename) - 1);
  if (Series is TGanttSeries) then
  begin
    datestart := (Series as TGanttSeries).StartValues[ValueIndex];
    dateend := (Series as TGanttSeries).EndValues[ValueIndex];
  end
  else
  begin
    datestart := Series.XValue[ValueIndex];
    dateend := datestart;
  end;
  if datestart <> dateend then
  begin
    resultdate := FormatDateTime('mmm d, yyyy  h:nn am/pm', datestart) +
      ' - ' + FormatDateTime('mmm d, yyyy  h:nn am/pm', dateend);
    otherdate := FormatDateTime('mm/dd/yy hh:nn', datestart) +
      ' - ' + FormatDateTime('mm/dd/yy hh:nn', dateend);
  end
  else
  begin
    resultdate := FormatDateTime('mmm d, yyyy  h:nn am/pm', datestart);
    otherdate := FormatDateTime('mm/dd/yy hh:nn', datestart);
  end;
  results := '';
  if typenum = '63' then
  begin
    if Series is TLineSeries then
      if (Series as TLineSeries).LinePen.Style = psDash then
        exit;          // serHigh or serLow
    if Series is TPointSeries then
      if (Series as TPointSeries).Pointer.Style = psSmallDot then
        exit;         // serBlank
    if copy(seriestitle, length(seriestitle) - 12, length(seriestitle)) = '(non-numeric)' then
    begin
      seriestitle := copy(seriestitle, 1, length(seriestitle) - 13);
      serDatelineTopGetMarkText(Sender.Series[SeriesNum], ValueIndex, results);
    end
    else
      results := floattostr(Series.YValue[ValueIndex]);
  end
  else if typenum <> '120.5' then
  begin
    item := Piece(typeitem, '^', 2);
    partitem := copy(item, 1, 4);
    //if (partitem = 'M;A;') then     //or (partitem = 'M;T;') then   tb antibiotic on 1st piece
    begin
      fmdatecheck := floattostr(DateTimeToFMDateTime(Series.XValue[ValueIndex]));
      for i := 0 to lstData.Items.Count - 1 do
      begin
        astring := lstData.Items[i];
        if item = Piece(astring, '^', 2) then
        begin
          datecheck := Piece(astring, '^', 3);
          if length(Piece(datecheck, '.', 2)) > 0 then
            datecheck := Piece(datecheck, '.', 1) + '.' + copy(Piece(datecheck, '.', 2), 1, 4);
          if datecheck = fmdatecheck then
          begin
            results := MixedCase(Piece(astring, '^', 5));
            break;
          end;
        end;
      end;
    end;
  end
  else if typenum = '120.5' then
  begin
    if seriestitle = 'Blood Pressure' then
      results := BPValue(Series.XValue[ValueIndex])
    else
      results := floattostr(Series.YValue[ValueIndex]);
  end;
  Result := typenum + '  ^' + typename + '^' + resultdate + '^' +
    seriestitle + '^' + results + '^' + otherdate;
end;

procedure TfrmGraphs.chartBaseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  ClickedLegend, ClickedValue, j: Integer;
  itemname: string;
  NewPt: TPoint;
begin
  //if not FGraphSetting.Hints then exit;       //*****
  FX := x;
  FY := y;
  FActiveGraph := (Sender as TChart);
  NewPt := Mouse.CursorPos;
  ClickedValue := -1;
  ClickedLegend := -1;
  if FHintWinActive then exit;
  with FActiveGraph do
  begin
    for j := 0 to SeriesCount - 1 do
    with (Series[j] as TChartSeries) do
    begin
      itemname := Series[j].Title;
      if (Copy(itemname, 1, 7) <> 'Ref Low') and (Copy(itemname, 1, 8) <> 'Ref High') then
      begin
        ClickedValue := Clicked(FX, FY);
        if ClickedValue > -1 then break;
        ClickedLegend := Legend.Clicked(FX, FY);
        if ClickedLegend > -1 then break;
      end;
    end;
    if ClickedValue > -1 then
    begin
      FHintStop := false;
      Screen.Cursor := crHandPoint;
      timHintPause.Enabled := true;
    end
    else if ClickedLegend > -1 then
    begin
      timHintPause.Enabled := false;
      InactivateHint;
      Screen.Cursor := crHandPoint;
    end
    else
    begin
      timHintPause.Enabled := false;
      InactivateHint;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmGraphs.timHintPauseTimer(Sender: TObject);
var
  ClickedValue, j: Integer;
  dttm, itemname, textvalue: string;
  Rct: TRect;
begin
  with FActiveGraph do
  begin
    ClickedValue := -1;
    for j := 0 to SeriesCount - 1 do
    with (Series[j] as TChartSeries) do
    begin
      if FHintStop then break;
      ClickedValue := Clicked(FX, FY);
      if ClickedValue > -1 then break;
    end;
    if FHintStop then          // stop when clicked
    begin
      timHintPause.Enabled := false;
      InactivateHint;
      FHintStop := false;
      exit;
    end;
    if (ClickedValue > -1) and ((FOnValue <> ClickedValue) or (FOnSeries <> j)) then
    begin     // on a value but not the same value or series
      if FHintWinActive then
        InactivateHint;
      itemname := Series[j].Title;
      if Copy(itemname, 1, 7)= 'Ref Low' then exit;
      if Copy(itemname, 1, 8)= 'Ref High' then exit;
      FOnSeries := j;
      FOnValue := ClickedValue;
      textvalue := ValueText(FActiveGraph, Series[j], ClickedValue);
      dttm := Piece(textvalue, '^', 3);
      //if copy(textvalue, length(textvalue) - 5, length(textvalue)) = ' 00:00' then
      //  dttm := Pieces(dttm, ' ', 1, 3);
      textvalue := Piece(textvalue, '^', 2) + '  ' + dttm +
        #13 + Piece(textvalue, '^', 4) + '  ' + Piece(textvalue, '^', 5);
      Rct := FHintWin.CalcHintRect(Screen.Width, textvalue, nil);
      OffsetRect(Rct, FX, FY + 20);
      Rct.Right := Rct.Right + 3;
      Rct.TopLeft := ClientToScreen(Rct.TopLeft);
      Rct.BottomRight := ClientToScreen(Rct.BottomRight);
      FHintWin.ActivateHint(Rct, textvalue);
      FHintWinActive := true;
    end
    else if (ClickedValue = -1) and ((FOnValue <> BIG_NUMBER) and (FOnSeries <> BIG_NUMBER)) then
    begin  // not on a value anymore (used to be on a value and series)
      FOnSeries := BIG_NUMBER;
      FOnValue := BIG_NUMBER;
      timHintPause.Enabled := false;
      InactivateHint;
    end;
  end;
end;

procedure TfrmGraphs.InactivateHint;
begin
    FHintWin.ReleaseHandle;
    FHintWinActive := false;
end;

procedure TfrmGraphs.mnuPopGraphStayOnTopClick(Sender: TObject);
begin
  mnuPopGraphStayOnTop.Checked := not mnuPopGraphStayOnTop.Checked;
  if mnuPopGraphStayOnTop.Checked then
  begin
    MarkFormAsStayOnTop(Self, true);
    FGraphSetting.StayOnTop := true;
  end
  else
  begin
    MarkFormAsStayOnTop(Self, false);
    FGraphSetting.StayOnTop := false;
  end;
end;

procedure TfrmGraphs.StayOnTop;
begin
  with pnlMain.Parent do
  if BorderWidth <> 1 then
  begin
     mnuPopGraphStayOnTop.Enabled :=false;
     mnuPopGraphStayOnTop.Checked := false;
  end
  else
  begin     // only use on float Graph
    mnuPopGraphStayOnTop.Enabled :=true;
    mnuPopGraphStayOnTop.Checked := not FGraphSetting.StayOnTop;
    mnuPopGraphStayOnTopClick(self);
  end;
end;

procedure TfrmGraphs.HideDates(aChart: TChart);
var
  hidedates: boolean;
begin
  with aChart do          // dateline charts always have dates
  begin
    if (aChart = chartDatelineTop) then
      hidedates := false
    else if (aChart = chartDatelineBottom) then
      hidedates := false
    else
      hidedates := not FGraphSetting.Dates;
    if hidedates then
    begin
      MarginBottom := 0;
      BottomAxis.LabelsFont.Color := chartDatelineTop.Color;
      BottomAxis.LabelsSize := 1;
      LeftAxis.LabelsFont.Color := chartDatelineTop.LeftAxis.LabelsFont.Color;
    end
    else
    begin
      MarginBottom := chartDatelineTop.MarginBottom;
      BottomAxis.LabelsFont.Color := chartDatelineTop.BottomAxis.LabelsFont.Color;
      BottomAxis.LabelsSize := chartDatelineTop.BottomAxis.LabelsSize;
      LeftAxis.LabelsFont.Color := chartDatelineTop.LeftAxis.LabelsFont.Color;
    end;
  end;
end;

procedure TfrmGraphs.mnuPopGraphZoomBackClick(Sender: TObject);
begin
  FFirstClick := true;
  with lstZoomHistory do
  begin
    Items.Delete(Count - 1);
    if Count = 0 then mnuPopGraphResetClick(self)
    else ZoomUpdate;
  end;
end;

procedure TfrmGraphs.ZoomUpdate;
var
  lastzoom: string;
  BigTime, SmallTime: TDateTime;
begin
  lastzoom := lstZoomHistory.Items[lstZoomHistory.Count - 1];
  SmallTime := StrToFloat(Piece(lastzoom, '^', 1));
  BigTime := StrToFloat(Piece(lastzoom, '^', 2));
  ZoomTo(SmallTime, BigTime);
  ZoomUpdateInfo(SmallTime, BigTime);
end;

procedure TfrmGraphs.ZoomUpdateInfo(SmallTime, BigTime: TDateTime);
begin
  pnlInfo.Caption := TXT_ZOOMED;
  pnlInfo.Color := COLOR_ZOOM;
  pnlInfo.Caption := pnlInfo.Caption + FormatDateTime('mmm d, yyyy  h:nn am/pm', SmallTime);
  pnlInfo.Caption := pnlInfo.Caption + ' to ' + FormatDateTime('mmm d, yyyy  h:nn am/pm', BigTime) + '.';
  pnlInfo.Visible := true;
  pnlHeader.Visible := true;
end;

procedure TfrmGraphs.ZoomTo(SmallTime, BigTime: TDateTime);
var
  i: integer;
  ChildControl: TControl;
begin
  for i := 0 to scrlTop.ControlCount - 1 do
  begin
    ChildControl := scrlTop.Controls[i];
    SizeDates((ChildControl as TChart), SmallTime, BigTime);
  end;
  SizeDates(chartDatelineTop, SmallTime, BigTime);
  for i := 0 to scrlBottom.ControlCount - 1 do
  begin
    ChildControl := scrlBottom.Controls[i];
    SizeDates((ChildControl as TChart), SmallTime, BigTime);
  end;
  SizeDates(chartDatelineBottom, SmallTime, BigTime);
end;

procedure TfrmGraphs.mnuPopGraphPrintClick(Sender: TObject);
var
  topflag: boolean;
  i, count: integer;
  StrForFooter, StrForHeader, aTitle, aWarning, aDateRange: String;
  aHeader: TStringList;
  wrdApp, wrdDoc, wrdPrintDlg: Variant;
  ChildControl: TControl;
begin
  topflag := mnuPopGraphStayOnTop.Checked and mnuPopGraphStayOnTop.Enabled;
  try
    wrdApp := CreateOleObject('Word.Application');
  except
    raise Exception.Create('Cannot start MS Word!');
  end;
  Screen.Cursor := crDefault;
  aTitle := 'CPRS Graphing';
  aWarning := pnlInfo.Caption;
  aDateRange :=  'Date Range: ' + cboDateRange.Text + '  Selected Items from ' +
      FormatDateTime('mm/dd/yy', FGraphSetting.LowTime) + ' to ' +
      FormatDateTime('mm/dd/yy', FGraphSetting.HighTime);
  aHeader := TStringList.Create;
  CreatePatientHeader(aHeader, aTitle, aWarning, aDateRange);
  StrForHeader := '';
  for i := 0 to aHeader.Count -1 do
    StrForHeader := StrForHeader + aHeader[i] + Chr(13);
  StrForFooter := aTitle + ' - *** WORK COPY ONLY ***' + Chr(13);
  wrdApp.Visible := False;
  wrdApp.Documents.Add;
  wrdDoc := wrdApp.Documents.Item(1);
  wrdDoc := wrdDoc.Sections.Item(1);
  wrdDoc := wrdDoc.Headers.Item(1).Range;
  wrdDoc.Font.Name := 'Courier New';
  wrdDoc.Font.Size := 9;
  wrdDoc.Text := StrForHeader;
  wrdDoc := wrdApp.Documents.Item(1);
  wrdDoc := wrdDoc.Sections.Item(1);
  wrdDoc := wrdDoc.Footers.Item(1);
  wrdDoc.Range.Font.Name := 'Courier New';
  wrdDoc.Range.Font.Size := 9;
  wrdDoc.Range.Text := StrForFooter;
  wrdDoc.PageNumbers.Add;
  wrdDoc := wrdApp.Documents.Item(1);
  wrdDoc.Range.InsertParagraphAfter;
  for i := 0 to scrlTop.ControlCount - 1 do           // goes from top to bottom
  begin
    ChildControl := scrlTop.Controls[i];
    if (ChildControl as TChart).Visible then
    begin
      (ChildControl as TChart).CopyToClipboardBitmap;
      wrdDoc.Range.InsertParagraphAfter;
      wrdDoc.Paragraphs.Last.Range.Paste;
    end;
  end;
  if (chartDatelineTop.SeriesCount > 0) and (not chkItemsTop.Checked) then
  begin
    chartDatelineTop.CopyToClipboardBitmap;
    wrdDoc.Range.InsertParagraphAfter;
    wrdDoc.Paragraphs.Last.Range.Paste;
  end;
  wrdDoc.Range.InsertParagraphAfter;
  wrdDoc.Paragraphs.Last.Range.Text := '   ';
  for i := 0 to scrlBottom.ControlCount - 1 do
  begin
    ChildControl := scrlBottom.Controls[i];
    if (ChildControl as TChart).Visible then
    begin
      (ChildControl as TChart).CopyToClipboardBitmap;
      wrdDoc.Range.InsertParagraphAfter;
      wrdDoc.Paragraphs.Last.Range.Paste;
    end;
  end;
  if (chartDatelineBottom.SeriesCount > 0) and (chkDualViews.Checked)
    and (not chkItemsBottom.Checked) then
  begin
    chartDatelineBottom.CopyToClipboardBitmap;
    wrdDoc.Range.InsertParagraphAfter;
    wrdDoc.Paragraphs.Last.Range.Paste;
  end;
  wrdPrintDlg := wrdApp.Dialogs.item(wdDialogFilePrint);
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  if topflag then
    mnuPopGraphStayOnTopClick(self);
  wrdPrintDlg.Show;
  wrdApp.Visible := false;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Sleep(5000);
  count := 0;
  while (wrdApp.Application.BackgroundPrintingStatus > 0) do
  begin
    Sleep(1000);
    Application.ProcessMessages;
    count := count + 1;
    if count > 3 then break;
  end;
  wrdApp.DisplayAlerts := false;
  wrdDoc.Close(false);
  wrdApp.Quit;
  wrdApp := Unassigned; // releases variant
  aHeader.Free;
  Application.ProcessMessages;
  if topflag then
    mnuPopGraphStayOnTopClick(self);
  Screen.Cursor := crDefault;
end;

procedure TfrmGraphs.lvwItemsTopChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if FArrowKeys and (lvwItemsTop.SelCount > 0) then
  begin
    if pnlItemsTopInfo.Tag <> 1 then
      lvwItemsTopClick(self);
    FArrowKeys := false;
  end;
end;

procedure TfrmGraphs.lvwItemsBottomChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if FArrowKeys and (lvwItemsBottom.SelCount > 0) then
  begin
    if pnlItemsBottomInfo.Tag <> 1 then
      lvwItemsBottomClick(self);
    FArrowKeys := false;
  end;
end;

procedure TfrmGraphs.lvwItemsTopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN] then
    FArrowKeys := true;
end;

procedure TfrmGraphs.testcount1Click(Sender: TObject);

 function boxcount(aListBox: TListBox): string;
 var
   i, ccnt: integer;
 begin
   Result := '';
   ccnt := 0;
   for i := 0 to aListBox.Items.Count - 1 do
     ccnt := ccnt + length(aListBox.Items[i]);
   Result := inttostr(aListBox.Items.Count) + ';' + inttostr(ccnt);
 end;

var
  i, lines, total: integer;
  aString: string;
begin
  lines := 0;
  total := 0;
  with pnlData do
  for i:= 0 to pnlData.ControlCount - 1 do
    if Controls[i] is TListBox then
    begin
      aString := boxcount(Controls[i] as TListBox);
      lines := lines + strtointdef(Piece(aString, ';', 1), 0);
      total := total + strtointdef(Piece(aString, ';', 2), 0);
    end;
  aString := boxcount(lstTypes) + '^' + boxcount(lstItems) + '^' + boxcount(lstData)
             + '  lines: ' + inttostr(lines) + '   total: ' + inttostr(total);
  showmessage(aString);
end;

procedure TfrmGraphs.cboDateRangeDropDown(Sender: TObject);
begin
  if (Top + Height) > (Screen.Height - 100) then
    cboDateRange.DropDownCount := 3
  else
    cboDateRange.DropDownCount := 9;
end;

procedure TfrmGraphs.mnuPopGraphFixedClick(Sender: TObject);
begin
  with FGraphSetting do FixedDateRange := not FixedDateRange;
  ChangeStyle;
end;

//***************** these are used to fix dropdown when large fonts

procedure TfrmGraphs.cboViewsTopDropDown(Sender: TObject);
begin
  cboViewsTop.Align := alNone;
end;

procedure TfrmGraphs.cboViewsTopDropDownClose(Sender: TObject);
begin
  cboViewsTop.Align := alClient;
end;

procedure TfrmGraphs.cboViewsBottomDropDown(Sender: TObject);
begin
  cboViewsBottom.Align := alNone;
end;

procedure TfrmGraphs.cboViewsBottomDropDownClose(Sender: TObject);
begin
  cboViewsBottom.Align := alClient;
end;

//*********************

procedure TfrmGraphs.FormDestroy(Sender: TObject);
begin
  SetSize;
end;

procedure TfrmGraphs.SetFontSize(FontSize: integer);
begin   // for now, ignore changing chart font size
  with chartDatelineTop do
  begin
    LeftAxis.LabelsFont.Size := 8;
    BottomAxis.LabelsFont.Size := 8;
    Foot.Font.Size := 8;
    Legend.Font.Size := 8;
    Title.Font.Size := 8;
  end;
  with chartDatelineBottom do
  begin
    LeftAxis.LabelsFont.Size := 8;
    BottomAxis.LabelsFont.Size := 8;
    Foot.Font.Size := 8;
    Legend.Font.Size := 8;
    Title.Font.Size := 8;
  end;
end;

procedure TfrmGraphs.lvwItemsTopEnter(Sender: TObject);
begin
  if lvwItemsTop.SelCount = 0 then
    if lvwItemsTop.Items.Count > 0 then
      lvwItemsTop.Items[0].Focused := true;
end;

procedure TfrmGraphs.chkItemsBottomEnter(Sender: TObject);
begin
  if not chkDualViews.Checked then
    if pnlFooter.Visible then
      cboDateRange.SetFocus
    else
      SelectNext(ActiveControl as TWinControl, True, True);
end;

procedure TfrmGraphs.cboViewsBottomEnter(Sender: TObject);
begin
  if not chkDualViews.Checked then
    SelectNext(ActiveControl as TWinControl, True, True);
end;

procedure TfrmGraphs.lvwItemsBottomEnter(Sender: TObject);
begin
  if lvwItemsBottom.SelCount = 0 then
    if lvwItemsBottom.Items.Count > 0 then
      lvwItemsBottom.Items[0].Focused := true;
  if not chkDualViews.Checked then
    SelectNext(ActiveControl as TWinControl, True, True);
end;

initialization
  CoInitialize (nil);
end.
