unit fActivateDeactivate;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fAutoSz, StdCtrls, ExtCtrls, ORCtrls,ORFn, rCore, uCore, oRNet, Math, fOrders, ORClasses, rOrders,
  fMeds, rMeds;

type
  TfrmActivateDeactive = class(TfrmAutoSz)
    TActivate: TButton;
    TDeactive: TButton;
    Memo1: TMemo;
    TCancel: TButton;
    procedure TActivateClick(Sender: TObject);
    procedure TDeactiveClick(Sender: TObject);
    procedure TCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetOriginalOrders(OrderID: TStringList; var OriginalOrder: TORStringList);
    procedure BuildForm(Str1: String);
    function PromptForm(Text: String): String;
  public
     { Public declarations }

    procedure fActivateDeactive(OrderID: TStringList); overload;
    procedure fActivateDeactive(OrderID: TStringList; AList: TListBox); overload;
  end;

var
  frmActivateDeactive: TfrmActivateDeactive;
  Act: Boolean;
  Deact: Boolean;
  CancelProcess: Boolean;

implementation

{$R *.dfm}

{ TfrmActivateDeactive }

procedure TfrmActivateDeactive.BuildForm(Str1: String);
var
 str: string;
begin
  with frmActivateDeactive do
     begin
        str := 'This order ' + str1 +' is currently in a pending status. ';
        str := str + CRLF + 'If this order is discontinued, the original order status will be changed to active, unless it is discontinued.';
        str := str + CRLF + CRLF + 'Click:';
        str := str + CRLF + '     "Yes" to discontinue the original order';
        str := str + CRLF + '     "No" to change the status to active';
        str := str + CRLF + '     "Cancel" to stop the discontinue process for this order';
        Memo1.ReadOnly := False;
        Memo1.Text := str;
        Memo1.ReadOnly := True;
     end;
    ResizeAnchoredFormToFont(frmActivateDeactive);
    frmActivateDeactive.ShowModal;
    frmActivateDeactive.Release;
end;

procedure TfrmActivateDeactive.fActivateDeactive(OrderID: TStringList);
var
i,j,Pos: integer;
tmpArr: TORStringList;
ActDeact: string;
AnOrder,AnOrder1: TOrder;
begin
  //called from order tab
  tmpArr := TORStringList.Create;
  GetOriginalOrders(OrderID,tmpArr);
      with forders.frmOrders.lstOrders do for i := 0 to items.Count-1 do if Selected[i] then
        begin
          AnOrder := TOrder(Items.Objects[i]);
          Pos := tmpArr.IndexOfPiece(AnOrder.ID,U,1);
          if Pos > -1 then
            begin
              ActDeact := PromptForm(AnOrder.Text);
              if ActDeact = 'D' then
                begin
                  for j := 0 to forders.frmOrders.lstOrders.Items.Count-1 do
                    begin
                      AnOrder1 := TOrder(forders.frmOrders.lstOrders.Items.Objects[j]);
                      if AnOrder1.ID = Piece(tmpArr.Strings[Pos],U,2) then
                        forders.frmOrders.lstOrders.Selected[j] := True;
                    end;
                end;
              if ActDeact = 'C' then Selected[i] := False;
            end;
        end;
end;

procedure TfrmActivateDeactive.fActivateDeactive(OrderID: TStringList; AList: TListBox);
var
i,j,Pos: integer;
tmpArr: TORStringList;
ActDeact: String;
AMed,AMed1: TMedListRec;
begin
  //called from Med tab
  tmpArr := TORStringList.Create;
  GetOriginalOrders(OrderID,tmpArr);
      with AList do for i := 0 to items.Count-1 do if Selected[i] then
        begin
          AMed := TMedListRec(Items.Objects[i]);
          Pos := tmpArr.IndexOfPiece(AMed.OrderID,U,1);
          if Pos > -1 then
            begin
              ActDeact := PromptForm(Alist.Items.Strings[i]);
              if ActDeact = 'D' then
                begin
                  for j := 0 to Alist.Items.Count-1 do
                    begin
                      AMed1 := TMedListRec(Alist.Items.Objects[j]);
                      if AMed1.OrderID = Piece(tmpArr.Strings[Pos],U,2) then
                        begin
                          Alist.Selected[j] := True;
                          break;
                        end;
                      //some med orders may not have an action defined tends to be renew order of orders that were renew from another
                      //order and outpatient orders
                      if (AMed1.OrderID = Piece(Piece(tmpArr.Strings[Pos],U,2),';',1)) then
                        begin
                          Alist.Selected[j] := True;
                          break;
                        end;

                    end;
                end;
              if ActDeact = 'C' then Selected[i] := False;
            end;
        end;
end;

procedure TfrmActivateDeactive.GetOriginalOrders(OrderID: TStringList; var OriginalOrder: TORStringList);
var
i: integer;
begin
  CallV('ORWDX1 DCREN', [OrderID]);
  for i := 0 to RPCBrokerV.Results.Count-1 do
    OriginalOrder.Add(RPCBrokerV.Results.Strings[i]);
end;

function TfrmActivateDeactive.PromptForm(Text: String): String;
begin
  frmActivateDeactive := TfrmActivateDeactive.create(Application);
  BuildForm(Text);
  if Deact = True then Result := 'D';
  if Act = True then Result := 'A';
  if CancelProcess = True then Result := 'C';
end;

procedure TfrmActivateDeactive.TActivateClick(Sender: TObject);
begin
  inherited;
   Act := True;
   Deact := False;
   CancelProcess := False;
   frmActivateDeactive.Close;
end;

procedure TfrmActivateDeactive.TDeactiveClick(Sender: TObject);
begin
  inherited;
   Act := False;
   Deact := True;
   CancelProcess := False;
   frmActivateDeactive.Close;
end;

procedure TfrmActivateDeactive.TCancelClick(Sender: TObject);
begin
  inherited;
  Act := False;
  Deact := False;
  CancelProcess := True;
  frmActivateDeactive.Close;
end;

end.
