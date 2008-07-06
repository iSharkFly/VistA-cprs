unit fPatientFlagMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, fAutoSz, ORCtrls, ExtCtrls, ComCtrls, rMisc;

type
  {This object holds a List of Notes Linked to a PRF as Returned VIA the RPCBroker}
  TPRFNotes = class(TObject)
  private
    FPRFNoteList : TStringList;
  public
    //procedure to show the Notes in a ListView, requires a listview parameter
    procedure ShowActionsOnList(DisplayList : TCaptionListView);
    //procedure to load the notes, this will call the RPC
    procedure Load(TitleIEN : Int64; DFN : String);
    function getNoteIEN(index: integer): String;
    constructor create;
    destructor Destroy(); override;
  end;

  TfrmFlags = class(TForm)
    Splitter1: TSplitter;
    pnlTop: TORAutoPanel;
    lblFlags: TLabel;
    lstFlags: TORListBox;
    memFlags: TRichEdit;
    pnlNotes: TPanel;
    lvPRF: TCaptionListView;
    lblNoteTitle: TLabel;
    Splitter2: TSplitter;
    pnlBottom: TORAutoPanel;
    btnClose: TButton;
    procedure lstFlagsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure lvPRFClick(Sender: TObject);
    procedure lvPRFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFlagID: integer;
    FPRFNotes : TPRFNotes;
    FNoteTitle: String;
    procedure GetNotes();
  public
    { Public declarations }
  end;
const
  HIDDEN_COL = 'Press enter or space bar to view this note:';
  //TIU GET LINKED PRF NOTES, return position constants
  NOTE_IEN_POS = 1;
  ACTION_POS = 2;
  NOTE_DATE_POS = 3;
  AUTHOR_POS = 4;
  //TIU GET PRF TITLE, return position constants
  NOTE_TITLE_IEN = 1;
  NOTE_TITLE = 2;


procedure ShowFlags(FlagId: integer = 0);

implementation

uses uCore,uOrPtf,ORFn, ORNet, uConst, fRptBox, rCover;
{$R *.dfm}

procedure ShowFlags(FlagId: integer);
var
  frmFlags: TfrmFlags;
begin
  frmFlags := TFrmFlags.Create(Nil);
  try
    SetFormPosition(frmFlags);
    if HasFlag then
    begin
      //SetFormPosition(frmFlags);
      frmFlags.FFlagID := FlagId;
      frmFlags.lstFlags.Items.Assign(FlagList);
      frmFlags.memFlags.SelStart := 0;
      ResizeFormToFont(TForm(frmFlags));
      frmFlags.ShowModal;
    end
  finally
    frmFlags.Release;
  end;
end;

procedure TfrmFlags.lstFlagsClick(Sender: TObject);
var
  FlagArray: TStringList;
begin
  if lstFlags.ItemIndex >= 0 then
  begin
    FlagArray := TStringList.Create;
    GetActiveFlg(FlagArray, Patient.DFN, lstFlags.ItemID);
    if FlagArray.Count > 0 then
      memFlags.Lines.Assign(FlagArray);
    memFlags.SelStart := 0;
    GetNotes;
  end;
end;

procedure TfrmFlags.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;


procedure TfrmFlags.FormShow(Sender: TObject);
var
  idx: integer;
begin
  inherited;
  SetFormPosition(Self);
  idx := 0;
  if FFlagID > 0 then idx := lstFlags.SelectByIEN(FFlagId);
  lstFlags.ItemIndex := idx;
  lstFlagsClick(Self);
  ActiveControl := memFlags;
  GetNotes;
end;

procedure TfrmFlags.FormCreate(Sender: TObject);
begin
  inherited;
  FFlagID := 0;
end;

procedure TfrmFlags.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SaveUserBounds(Self);
end;

procedure TfrmFlags.GetNotes;
var
  NoteTitleIEN, FlagID : Int64;
begin
    if FPRFNotes = nil then
      FPRFNotes := TPRFNotes.Create;
    FlagID := lstFlags.ItemID;
    CallV('TIU GET PRF TITLE', [Patient.DFN,FlagID]);
    FNoteTitle := Piece(RPCBrokerV.Results[0],U,NOTE_TITLE);
    lblNoteTitle.Caption := 'Signed, Linked Notes of Title: '+ FNoteTitle;
    NoteTitleIEN := StrToInt(Piece(RPCBrokerV.Results[0],U,NOTE_TITLE_IEN));
    FPRFNotes.Load(NoteTitleIEN,Patient.DFN);
    FPRFNotes.ShowActionsOnList(lvPRF);
    with lvPRF do begin

      Columns.BeginUpdate;
      Columns.EndUpdate;
    end;
end;

{ TPRFNotes }

constructor TPRFNotes.create;
begin
  inherited;
  FPRFNoteList := TStringList.create;
end;

destructor TPRFNotes.Destroy;
begin
  FPRFNoteList.Free;
  inherited;
end;

function TPRFNotes.getNoteIEN(index: integer): String;
begin
 Result := Piece(FPRFNoteList[index],U,NOTE_IEN_POS);
end;

procedure TPRFNotes.Load(TitleIEN: Int64; DFN: String);
const
  REVERSE_CHRONO = 1;
begin
  CallV('TIU GET LINKED PRF NOTES', [DFN,TitleIEN,REVERSE_CHRONO]);
  FPRFNoteList.Assign(RPCBrokerV.Results);
end;

procedure TPRFNotes.ShowActionsOnList(DisplayList: TCaptionListView);
var
  i : integer;
  ListItem: TListItem;
begin
  DisplayList.Clear;
  for i := 0 to FPRFNoteList.Count-1 do
  begin
    //Caption="Text for Screen Reader" SubItem1=Flag SubItem2=Date SubItem3=Action SubItem4=Note
    ListItem := DisplayList.Items.Add;
    ListItem.Caption := HIDDEN_COL; //Screen readers don't read the first column title on a listview.
    ListItem.SubItems.Add(Piece(FPRFNoteList[i],U,NOTE_DATE_POS));
    ListItem.SubItems.Add(Piece(FPRFNoteList[i],U,ACTION_POS));
    ListItem.SubItems.Add(Piece(FPRFNoteList[i],U,AUTHOR_POS));
  end;
end;

procedure TfrmFlags.FormDestroy(Sender: TObject);
begin
  FPRFNotes.Free;
end;

procedure TfrmFlags.lvPRFClick(Sender: TObject);
begin
  if lvPRF.ItemIndex > -1 then
  begin
    NotifyOtherApps(NAE_REPORT, 'TIU^' + FPRFNotes.getNoteIEN(lvPRF.ItemIndex));
    ReportBox(DetailPosting(FPRFNotes.getNoteIEN(lvPRF.ItemIndex)), FNoteTitle, True);
  end;
end;

procedure TfrmFlags.lvPRFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_SPACE) or (Key = VK_RETURN) then
    lvPRFClick(Sender);
end;

end.
