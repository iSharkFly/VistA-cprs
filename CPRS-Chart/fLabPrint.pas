unit fLabPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ORCtrls, ORNet, Mask, ComCtrls;

type
  TfrmLabPrint = class(TForm)
    lblLabTitle: TMemo;
    lblPrintTo: TLabel;
    grpDevice: TGroupBox;
    lblMargin: TLabel;
    lblLength: TLabel;
    txtRightMargin: TMaskEdit;
    txtPageLength: TMaskEdit;
    cboDevice: TORComboBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    dlgWinPrinter: TPrintDialog;
    chkDefault: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cboDeviceChange(Sender: TObject);
    procedure cboDeviceNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FReports: Integer;
    FDaysBack: Integer;
    FReportText: TRichEdit;
    procedure DisplaySelectDevice;
  public
    { Public declarations }
  end;

var
  frmLabPrint: TfrmLabPrint;

procedure PrintLabs(AReports: Longint; const ALabTitle: string; ADaysBack: Integer);

implementation

{$R *.DFM}

uses ORFn, rCore, uCore, fLabs, rLabs, Printers, rReports;

const
  TX_NODEVICE = 'A device must be selected to print, or press ''Cancel'' to not print.';
  TX_NODEVICE_CAP = 'Device Not Selected';
  TX_ERR_CAP = 'Print Error';
  PAGE_BREAK = '**PAGE BREAK**';

procedure PrintLabs(AReports: Integer; const ALabTitle: string; ADaysBack: Integer);
{ displays a form that prompts for a device and then prints the report }
var
  frmLabPrint: TfrmLabPrint;
  DefPrt: string;
begin
  frmLabPrint := TfrmLabPrint.Create(Application);
  try
    ResizeAnchoredFormToFont(frmLabPrint);
    with frmLabPrint do
    begin
      lblLabTitle.Text := ALabTitle;
      FReports := AReports;
      FDaysBack := ADaysBack;
      DefPrt := GetDefaultPrinter(User.Duz, Encounter.Location);
      if User.CurrentPrinter = '' then User.CurrentPrinter := DefPrt;
      with cboDevice do
        begin
          if Printer.Printers.Count > 0 then
            begin
              Items.Add('WIN;Windows Printer^Windows Printer');
              Items.Add('^--------------------VistA Printers----------------------');
            end;
          if User.CurrentPrinter <> '' then
            begin
              InitLongList(Piece(User.CurrentPrinter, ';', 2));
              SelectByID(User.CurrentPrinter);
            end
          else
            InitLongList('');
        end;
      if (DefPrt = 'WIN;Windows Printer') and
         (User.CurrentPrinter = DefPrt) then
         cmdOKClick(frmLabPrint)
      else
         ShowModal;
    end;
  finally
    frmLabPrint.Release;
  end;
end;

procedure TfrmLabPrint.DisplaySelectDevice;
begin
  with cboDevice, lblPrintTo do
  begin
   Caption := 'Print Report on:  ' + Piece(ItemID, ';', 2);
  end;
end;

procedure TfrmLabPrint.FormCreate(Sender: TObject);
begin
  inherited;
  FReportText := TRichEdit.Create(Self);
  with FReportText do
    begin
      Parent := Self;
      Visible := False;
      Width := 600;
    end;
end;

procedure TfrmLabPrint.cboDeviceChange(Sender: TObject);
begin
  inherited;
  with cboDevice do if ItemIndex > -1 then
    begin
      txtRightMargin.Text := Piece(Items[ItemIndex], '^', 4);
      txtPageLength.Text := Piece(Items[ItemIndex], '^', 5);
      DisplaySelectDevice;
    end;
end;

procedure TfrmLabPrint.cboDeviceNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
begin
inherited;
  cboDevice.ForDataUse(SubsetOfDevices(StartFrom, Direction));
end;

procedure TfrmLabPrint.cmdOKClick(Sender: TObject);
var
  ADevice, ErrMsg: string;
  daysback: integer;
  date1, date2: TFMDateTime;
  today: TDateTime;
  RemoteSiteID: string;    //for Remote site printing
  RemoteQuery: string;    //for Remote site printing
begin
  inherited;
  RemoteSiteID := '';
  RemoteQuery := '';
  with frmLabs.TabControl1 do
    if TabIndex > 0 then
      begin
        RemoteSiteID := TRemoteSite(Tabs.Objects[TabIndex]).SiteID;
        RemoteQuery := TRemoteSite(Tabs.Objects[TabIndex]).CurrentLabQuery;
      end;
  if cboDevice.ItemID = '' then
  begin
    InfoBox(TX_NODEVICE, TX_NODEVICE_CAP, MB_OK);
    Exit;
  end;
  today := frmLabs.FMToDateTime(floattostr(FMToday));
  if frmLabs.lstDates.ItemIEN > 0 then
    begin
      daysback := frmLabs.lstDates.ItemIEN;
      date1 := FMToday;
      If daysback = 1 then
        date2 := DateTimeToFMDateTime(today)
      Else
        date2 := DateTimeToFMDateTime(today - daysback);
    end
  else
    frmLabs.BeginEndDates(date1,date2,daysback);
  date1 := date1 + 0.2359;
  if Piece(cboDevice.ItemID, ';', 1) = 'WIN' then
    begin
      if dlgWinPrinter.Execute then with FReportText do
        begin
          Lines.Assign(GetFormattedLabReport(FReports, FDaysBack, Patient.DFN,
            frmLabs.lstTests.Items, date1, date2, RemoteSiteID, RemoteQuery));
          PrintWindowsReport(FReportText, PAGE_BREAK, Self.Caption, ErrMsg);
          if Length(ErrMsg) > 0 then InfoBox(ErrMsg, TX_ERR_CAP, MB_OK);
        end;
    end
  else
    begin
      ADevice := Piece(cboDevice.ItemID, ';', 2);
      PrintLabsToDevice(FReports, FDaysBack, Patient.DFN, ADevice,
        frmLabs.lstTests.Items, ErrMsg, date1, date2, RemoteSiteID, RemoteQuery);
      ErrMsg := Piece(FReportText.Lines[0], U, 2);
      if Length(ErrMsg) > 0 then InfoBox(ErrMsg, TX_ERR_CAP, MB_OK);
    end;
  if chkDefault.Checked then SaveDefaultPrinter(Piece(cboDevice.ItemID, ';', 1));
  User.CurrentPrinter := cboDevice.ItemID;
  Close;
end;

procedure TfrmLabPrint.cmdCancelClick(Sender: TObject);
begin
inherited;
  Close;
end;

procedure TfrmLabPrint.FormDestroy(Sender: TObject);
begin
  FReportText.Free;
  inherited;
end;

end.
