unit fAlertForward;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Forms, Controls,
  Dialogs, StdCtrls, Buttons, ORCtrls, ORfn, ExtCtrls, fAutoSz, ComCtrls;

type
  TfrmAlertForward = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    cboSrcList: TORComboBox;
    DstList: TORListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    pnlBase: TORAutoPanel;
    memAlert: TMemo;
    Label1: TLabel;
    memComment: TMemo;
    procedure cboSrcListNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cboSrcListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DstListClick(Sender: TObject);
    procedure cboSrcListMouseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DstListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
end;

function ForwardAlertTo(Alert: String): Boolean;

implementation

{$R *.DFM}

uses rCore, uCore;

var  XQAID: string;

function ForwardAlertTo(Alert: String): Boolean;
var
  frmAlertForward: TfrmAlertForward;
begin
  frmAlertForward := TfrmAlertForward.Create(Application);
  try
    ResizeAnchoredFormToFont(frmAlertForward);
    with frmAlertForward do
    begin
      memAlert.SetTextBuf(PChar(Piece(Alert, U, 2)));
      XQAID := Piece(Alert, U, 1);
      ShowModal;
    end;
  finally
    frmAlertForward.Release;
    Result := True;
  end;
end;

procedure TfrmAlertForward.FormCreate(Sender: TObject);
begin
  inherited;
  cboSrcList.InitLongList('');
end;

procedure TfrmAlertForward.cboSrcListNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
begin
  (Sender as TORComboBox).ForDataUse(SubSetOfPersons(StartFrom, Direction));
end;

procedure TfrmAlertForward.cmdCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAlertForward.cmdOKClick(Sender: TObject);
var
  i: integer ;
  Recip: string;
begin
  if DstList.Items.Count = 0 then Exit;
  for i := 0 to DstList.Items.Count-1 do
  begin
    Recip := Piece(DstList.Items[i], U, 1);
    memComment.Text := StringReplace(memComment.Text, CRLF, ' ', [rfReplaceAll]);
    ForwardAlert(XQAID, Recip, 'A', memComment.Text);
  end;
  Close;
end;

procedure TfrmAlertForward.DstListClick(Sender: TObject);
begin
  if DstList.ItemIndex = -1 then Exit;
  DstList.Items.Delete(DstList.ItemIndex);
end;

procedure TfrmAlertForward.cboSrcListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then cboSrcListMouseClick(Self);
end;

procedure TfrmAlertForward.cboSrcListMouseClick(Sender: TObject);
begin
  if cboSrcList.ItemIndex = -1 then Exit;
  if DstList.SelectByID(cboSrcList.ItemID) = -1 then
    DstList.Items.Add(cboSrcList.Items[cboSrcList.Itemindex]);
end;

procedure TfrmAlertForward.DstListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then DstListClick(Self);
end;

end.
