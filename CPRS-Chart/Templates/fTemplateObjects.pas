unit fTemplateObjects;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ORCtrls, StdCtrls, ExtCtrls, ComCtrls, ORFn, dShared;

type
  TfrmTemplateObjects = class(TForm)
    cboObjects: TORComboBox;
    pnlBottom: TPanel;
    btnCancel: TButton;
    btnInsert: TButton;
    btnRefresh: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure cboObjectsDblClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fre: TRichEdit;
    FAutoLongLines: TNotifyEvent;
    procedure InsertObject;
    procedure Setre(const Value: TRichEdit);
  public
    procedure UpdateStatus;
    property re: TRichEdit read Fre write Setre;
    property AutoLongLines: TNotifyEvent read FAutoLongLines write FAutoLongLines;
  end;

implementation

{$R *.DFM}

procedure TfrmTemplateObjects.FormShow(Sender: TObject);
begin
  ResizeAnchoredFormToFont(self);
  //ResizeAnchoredFormToFont doesn't work right on the button positions for some reason.
  btnCancel.Left := pnlBottom.ClientWidth - btnCancel.Width;
  btnInsert.Left := btnCancel.Left - btnInsert.Width - 5;
  btnRefresh.Left := btnInsert.Left - btnRefresh.Width - 5;
  cboObjects.SelectAll;
  cboObjects.SetFocus;
end;

procedure TfrmTemplateObjects.btnInsertClick(Sender: TObject);
begin
  InsertObject;
end;

procedure TfrmTemplateObjects.InsertObject;
var
  cnt: integer;

begin
  if(not Fre.ReadOnly) and (cboObjects.ItemIndex >= 0) then
  begin
    cnt := Fre.Lines.Count;
    Fre.SelText := '|'+Piece(cboObjects.Items[cboObjects.ItemIndex],U,3)+'|';
    if(assigned(FAutoLongLines) and (cnt <> FRe.Lines.Count)) then
      FAutoLongLines(Self);
  end;
end;

procedure TfrmTemplateObjects.cboObjectsDblClick(Sender: TObject);
begin
  InsertObject;
end;

procedure TfrmTemplateObjects.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTemplateObjects.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmTemplateObjects.Setre(const Value: TRichEdit);
begin
  Fre := Value;
  UpdateStatus;
end;

procedure TfrmTemplateObjects.UpdateStatus;
begin
  btnInsert.Enabled := (not re.ReadOnly);
end;

procedure TfrmTemplateObjects.btnRefreshClick(Sender: TObject);
begin
cboObjects.SelectAll;
cboObjects.Clear;
dmodShared.RefreshObject := true;
dmodShared.LoadTIUObjects;
CboOBJECTS.Items.AddStrings(dmodShared.TIUObjects);
end;

end.
