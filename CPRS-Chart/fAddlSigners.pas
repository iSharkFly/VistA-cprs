unit fAddlSigners;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ORCtrls, ORfn, ExtCtrls, FNoteProps,Dialogs;

type
  TfrmAddlSigners = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    cboSrcList: TORComboBox;
    DstList: TORListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    pnlBase: TPanel;
    cmdRemove: TButton;
    lblAuthor: TOROffsetLabel;
    cboCosigner: TORComboBox;
    lblCosigner: TOROffsetLabel;
    txtAuthor: TCaptionEdit;
    pnlAdditional: TORAutoPanel;
    pnlButtons: TORAutoPanel;
    pnlTop: TORAutoPanel;
    procedure NewPersonNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cboSrcListMouseClick(Sender: TObject);
    procedure cmdRemoveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cboCosignerChange(Sender: TObject);
    procedure DstListClick(Sender: TObject);
    procedure cboSrcListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboCosignerNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure cboCosignerExit(Sender: TObject);
    procedure cboSrcListClick(Sender: TObject);
  private
    FSigners: TStringList ;
    FCosigner: int64;
    FExclusions: TStringList;
    FSigAction: integer;
    FChanged: Boolean;
    FNoteIEN: integer;
    FRefDate: TFMDateTime;
    FToday: string;
    FTabID: integer;
    function CosignerOK: Boolean;
  end;

TSignerList = record
    Changed: Boolean;
    Signers: TStringList ;
    Cosigner: int64;
  end;

procedure SelectAdditionalSigners(FontSize, NoteIEN, SigAction: Integer; Exclusions: TStrings;
          var SignerList: TSignerList; TabID: integer; ARefDate: TFMDateTime) ;

const
  SG_ADDITIONAL = 1;
  SG_COSIGNER   = 2;
  SG_BOTH       = 3;

implementation

{$R *.DFM}

uses
  rCore, uCore, rTIU, uConst, rPCE;

const
  TX_SIGNER_CAP = 'Error adding signers';
  TX_SIGNER_TEXT = 'Select signers or press Cancel.';
  TX_BAD_SIGNER = 'Cannot select author, user, expected signer, or expected cosigner' ;
  TX_DUP_SIGNER = 'You have already selected that additional signer';
  TX_NO_COSIGNER = ' is not authorized to cosign this document.';
  TX_NO_COSIGNER_CAP = 'Invalid Cosigner';
  TX_NO_DELETE = 'A cosigner is required';
  TX_NO_DELETE_CAP = 'No cosigner selected';


procedure SelectAdditionalSigners(FontSize, NoteIEN, SigAction: Integer; Exclusions: TStrings;
          var SignerList: TSignerList; TabID: integer; ARefDate: TFMDateTime) ;
{ displays additional signer form for notes and returns a record of the selection }
var
  frmAddlSigners: TfrmAddlSigners;
  W, H, i: Integer;
begin
  frmAddlSigners := TfrmAddlSigners.Create(Application);
  try
    with frmAddlSigners do
    begin
      FTabID := TabID;
      FSigAction := SigAction;
      FNoteIEN := NoteIEN;
      FRefDate := ARefDate;
      FExclusions.Assign(Exclusions);
      FToday := FloatToStr(FMToday);
      if FSigAction = SG_COSIGNER then
        begin
          pnlAdditional.Visible := False;
          Height := Height - pnlAdditional.Height;
        end;
      Font.Size := FontSize;
      W := ClientWidth;
      H := ClientHeight;
      ResizeToFont(FontSize, W, H);
      ClientWidth  := W; pnlBase.Width  := W;
      ClientHeight := H; pnlBase.Height := H;
      with FExclusions do for i := 0 to Count-1 do
        begin
          if Piece(Strings[i],U,3) = 'Author' then txtAuthor.Text := Piece(Strings[i], U, 2)
          else if Piece(Strings[i],U,3) = 'Expected Cosigner' then
            begin
              cboCosigner.Items.Add(Strings[i]);
              cboCosigner.ItemIndex := 0;
            end
          else
            DstList.Items.Add(Strings[i]);
        end;

      if (SigAction = SG_COSIGNER) or (SigAction = SG_BOTH) then
        begin
          lblCosigner.Caption := 'Expected cosigner';
          cboCosigner.Caption := 'Expected cosigner';
          cboCosigner.Color := clWindow;
          cboCosigner.Enabled := True;
          cboCosigner.InitLongList('');
        end;
      if (SigAction = SG_ADDITIONAL) or (SigAction = SG_BOTH) then
        cboSrcList.InitLongList('');
      FChanged := False;
      ShowModal;
      with SignerList do
        begin
          Signers := TStringList.Create;
          Signers.Assign(FSigners);
          Cosigner := FCosigner;
          Changed := FChanged ;
        end ;
    end; {with frmAddlSigners}
  finally
    frmAddlSigners.Release;
  end;
end;

procedure TfrmAddlSigners.NewPersonNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
begin
  TORComboBox(Sender).ForDataUse(SubSetOfPersons(StartFrom, Direction));
end;

procedure TfrmAddlSigners.cmdCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddlSigners.cmdOKClick(Sender: TObject);
var
  i: integer;
begin
  FChanged := False;
  if (FSigAction = SG_ADDITIONAL) and ((DstList.Items.Count = 0) and (FSigners.Count = 0)) then
  begin
    InfoBox(TX_SIGNER_TEXT, TX_SIGNER_CAP, MB_OK or MB_ICONWARNING);
    Exit;
  end;
  if not CosignerOK then Exit;
  FChanged := True;
  FCosigner := cboCosigner.ItemIEN;
  for i := 0 to DstList.Items.Count-1 do
    begin
      if fExclusions.IndexOf(DstList.Items[i]) < 0 then FSigners.Add(DstList.Items[i]);
    end;
  Close;
end;

procedure TfrmAddlSigners.cboSrcListMouseClick(Sender: TObject);
var
  i: integer;
begin
  if cboSrcList.ItemIndex = -1 then exit;
  if (DstList.SelectByID(cboSrcList.ItemID) <> -1) then
    begin
      InfoBox(TX_DUP_SIGNER, TX_SIGNER_CAP, MB_OK or MB_ICONWARNING);
      Exit;
    end;
  for i := 0 to FExclusions.Count-1 do
    if (Piece(FExclusions.Strings[i],U,1) = cboSrcList.ItemID) then
      begin
        InfoBox(TX_BAD_SIGNER, TX_SIGNER_CAP, MB_OK or MB_ICONWARNING);
        Exit;
      end;
  DstList.Items.Add(cboSrcList.Items[cboSrcList.Itemindex]) ;
  cboSrcList.SelectByID(cboSrcList.ItemID);
end;

procedure TfrmAddlSigners.cmdRemoveClick(Sender: TObject);
var
  i,j: integer;
begin
  with DstList do
    begin
      if ItemIndex = -1 then exit ;
      for i := Items.Count-1 downto 0 do
        if Selected[i] then
          begin
            j := FExclusions.IndexOf(Items[i]);
            FSigners.Add(ORFn.Pieces(Items[i], U, 1, 2) + '^REMOVE');
            if j > -1 then FExclusions.Delete(j);
            Items.Delete(i) ;
          end;
    end;
end;

procedure TfrmAddlSigners.cboCosignerChange(Sender: TObject);
var
  i: integer;
begin
  if UserInactive(cboCosigner.ItemID) then
       if (InfoBox(fNoteProps.TX_USER_INACTIVE, TC_INACTIVE_USER, MB_OKCANCEL)= IDCANCEL) then exit;
  if not CosignerOK then Exit;
  i := DstList.SelectByID(cboCosigner.ItemID);
  if i > -1 then
    begin
      DstList.Items.Delete(i);
      FSigners.Add(ORFn.Pieces(cboCosigner.Items[cboCosigner.ItemIndex], U, 1, 2) + '^REMOVE');
    end;
end;

procedure TfrmAddlSigners.FormCreate(Sender: TObject);
begin
  cboCosigner.Color := ReadOnlyColor;
  txtAuthor.Color := ReadOnlyColor;
  FSigners := TStringList.Create;
  FExclusions := TStringList.Create;
end;

procedure TfrmAddlSigners.FormDestroy(Sender: TObject);
begin
  FSigners.Free;
  FExclusions.Free;
end;

procedure TfrmAddlSigners.DstListClick(Sender: TObject);
begin
  if DstList.ItemIndex > -1 then cmdRemoveClick(Self);
end;

procedure TfrmAddlSigners.cboSrcListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then cboSrcListMouseClick(Self);
end;

function TfrmAddlSigners.CosignerOK: Boolean;
begin
  Result := False;
  if not cboCosigner.Enabled then
    begin
      Result := True;
      Exit;
    end;
  if cboCosigner.ItemIndex < 0 then
    begin
      InfoBox(TX_NO_DELETE, TX_NO_DELETE_CAP, MB_OK or MB_ICONWARNING);
      Exit;
    end;
  case FTabID of
    CT_NOTES, CT_CONSULTS:
      if (not CanCosign(TitleForNote(FNoteIEN), 0, cboCosigner.ItemIEN, FRefDate)) then
        begin
          InfoBox(cboCosigner.Text + TX_NO_COSIGNER, TX_NO_COSIGNER_CAP, MB_OK or MB_ICONWARNING);
          Exit;
        end;
    CT_DCSUMM:
      if not IsUserAProvider(cboCosigner.ItemIEN, FMNow) then
        begin
          InfoBox(cboCosigner.Text + TX_NO_COSIGNER, TX_NO_COSIGNER_CAP, MB_OK or MB_ICONWARNING);
          Exit;
        end;
  end;
  Result := True;
end;

procedure TfrmAddlSigners.cboCosignerNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
begin
  case FTabID of
    CT_NOTES:     TORComboBox(Sender).ForDataUse(SubSetOfUsersWithClass(StartFrom, Direction, FToday));
    CT_CONSULTS:  TORComboBox(Sender).ForDataUse(SubSetOfUsersWithClass(StartFrom, Direction, FToday));
    CT_DCSUMM:    TORComboBox(Sender).ForDataUse(SubSetOfProviders(StartFrom, Direction));
  end;
end;

procedure TfrmAddlSigners.cboCosignerExit(Sender: TObject);
begin
  with cboCosigner do if Text = '' then ItemIndex := -1;
end;

procedure TfrmAddlSigners.cboSrcListClick(Sender: TObject);
var UserEIN:string;
begin
      UserEIN := Piece(cboSrcList.Items[cboSrcList.Itemindex],U,1);
      if UserInactive(UserEIN) then
        if (InfoBox(fNoteProps.TX_USER_INACTIVE, TC_INACTIVE_USER, MB_OKCANCEL)= IDCANCEL) then exit;

end;

end.
