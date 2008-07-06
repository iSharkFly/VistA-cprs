unit fOptionsNewList;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Dialogs,
  Buttons, ComCtrls, ExtCtrls, OrFn, ORCtrls;

type
  TfrmOptionsNewList = class(TForm)
    pnlBottom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    txtNewList: TCaptionEdit;
    lblEnter: TLabel;
    lblNew: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure txtNewListKeyPress(Sender: TObject; var Key: Char);
    procedure txtNewListChange(Sender: TObject);
  private
    { Private declarations }
    FNewList: string;
  public
    { Public declarations }
  end;

procedure DialogOptionsNewList(fontsize: integer; var actiontype: string);

var
  frmOptionsNewList: TfrmOptionsNewList;

implementation

uses rOptions;

{$R *.DFM}

procedure DialogOptionsNewList(fontsize: integer; var actiontype: string);
// create the form and make it modal, return an action
var
  frmOptionsNewList: TfrmOptionsNewList;
begin
  frmOptionsNewList := TfrmOptionsNewList.Create(Application);
  actiontype := '';
  try
    with frmOptionsNewList do
    begin
      Position := poScreenCenter;
      ResizeAnchoredFormToFont(frmOptionsNewList);
      ShowModal;
      actiontype := FNewList;
    end;
  finally
    frmOptionsNewList.Release;
  end;
end;

procedure TfrmOptionsNewList.btnOKClick(Sender: TObject);
var
  ok: boolean;
begin
  ok := false;
  with txtNewList do
  begin
    if (length(Text) < 3) or (length(Text) > 30) then
      showmessage('Enter a valid name.')
    else if not ContainsAlpha(txtNewList.Text[1]) then
      showmessage('Enter a valid name.')
    else
    begin
      FNewList := rpcNewList(Text);
      if Piece(FNewList, '^', 1) = '' then
        showmessage('Enter a valid name. ' + Piece(FNewList, '^', 2))
      else
        ok := true;
    end;
    if ok then Close
    else
    begin
      Text := '';
      SetFocus;
    end;
  end;
end;

procedure TfrmOptionsNewList.txtNewListKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['A'..'Z', 'a'..'z', '0'..'9', #32, #8]) then
  begin
    Key := #0;
    beep;
  end;
end;

procedure TfrmOptionsNewList.txtNewListChange(Sender: TObject);
begin
  btnOK.Enabled := length(txtNewList.Text) > 3;
end;

end.

