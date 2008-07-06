unit fOCSession;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fAutoSz, StdCtrls, ORFn, uConst, ORCtrls, ExtCtrls;

type
  TfrmOCSession = class(TfrmAutoSz)
    lstChecks: TCaptionListBox;
    pnlBottom: TPanel;
    lblJustify: TLabel;
    txtJustify: TCaptionEdit;
    cmdCancelOrder: TButton;
    cmdContinue: TButton;
    procedure cmdCancelOrderClick(Sender: TObject);
    procedure cmdContinueClick(Sender: TObject);
    procedure lstChecksMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure lstChecksDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure txtJustifyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCritical: Boolean;
    FCheckList: TStringList;
    FOrderList: TStringList;
    procedure SetReqJustify;
  public
    { Public declarations }
  end;

procedure ExecuteReleaseOrderChecks(SelectList: TList);
procedure ExecuteSessionOrderChecks(OrderList: TStringList);

implementation

{$R *.DFM}

uses rOrders, uCore, rMisc;

type
  TOCRec = class
    OrderID: string;
    OrderText: string;
    Checks: TStringList;
    constructor Create(const AnID: string);
    destructor Destroy; override;
  end;

var
  uCheckedOrders: TList;
  FOldHintHidePause: integer;

constructor TOCRec.Create(const AnID: string);
begin
  OrderID := AnID;
  Checks := TStringList.Create;
  FOldHintHidePause := Application.HintHidePause;
end;

destructor TOCRec.Destroy;
begin
  Application.HintHidePause := FOldHintHidePause;
  Checks.Free;
  inherited Destroy;
end;

procedure ExecuteReleaseOrderChecks(SelectList: TList);
var
  i: Integer;
  AnOrder: TOrder;
  OrderIDList: TStringList;
begin
  OrderIDList := TStringList.Create;
  try
    for i := 0 to SelectList.Count - 1 do
    begin
      AnOrder := TOrder(SelectList.Items[i]);
      OrderIDList.Add(AnOrder.ID + '^^1');  // 3rd pce = 1 means releasing order
    end;
    ExecuteSessionOrderChecks(OrderIDList);
    for i := SelectList.Count - 1 downto 0 do
    begin
      AnOrder := TOrder(SelectList.Items[i]);
      if OrderIDList.IndexOf(AnOrder.ID + '^^1') < 0 then
      begin
        Changes.Remove(CH_ORD, AnOrder.ID);
        SelectList.Delete(i);
      end;
    end;
  finally
    OrderIDList.Free;
  end;
end;

procedure ExecuteSessionOrderChecks(OrderList: TStringList);
var
  i, j: Integer;
  LastID, NewID: string;
  CheckList: TStringList;
  OCRec: TOCRec;
  //AChangeItem: TChangeItem;
  frmOCSession: TfrmOCSession;
  x: string;
begin
  CheckList := TStringList.Create;
  try
    StatusText('Order Checking...');
    OrderChecksForSession(CheckList, OrderList);
    StatusText('');
    if CheckList.Count > 0 then
    begin
      frmOCSession := TfrmOCSession.Create(Application);
      try
        ResizeFormToFont(TForm(frmOCSession));
        uCheckedOrders := TList.Create;
        LastID := '';
        for i := 0 to CheckList.Count - 1 do
        begin
          NewID := Piece(CheckList[i], U, 1);
          if NewID <> LastID then
          begin
            OCRec := TOCRec.Create(NewID);
            uCheckedOrders.Add(OCRec);
            LastID := NewID;
          end; {if NewID}
        end; {for i}
        with uCheckedOrders do for i := 0 to Count - 1 do
        begin
          OCRec := TOCRec(Items[i]);
          x := TextForOrder(OCRec.OrderID);
          OCRec.OrderText := x;
          for j := 0 to CheckList.Count - 1 do
            if Piece(CheckList[j], U, 1) = OCRec.OrderID then
            begin
              OCRec.Checks.Add(Pieces(CheckList[j], U, 2, 4));
              x := x + CRLF + Piece(CheckList[j], U, 4);
            end;
          //AChangeItem := Changes.Locate(CH_ORD, OCRec.OrderID);
          //if AChangeItem <> nil then OCRec.OrderText := AChangeItem.Text;
          frmOCSession.lstChecks.Items.Add(x);
        end; {with...for i}
        frmOCSession.FOrderList := OrderList;
        frmOCSession.FCheckList := CheckList;
        frmOCSession.SetReqJustify;
        MessageBeep(MB_ICONASTERISK);
        if frmOCSession.Visible then frmOCSession.SetFocus;
        frmOCSession.ShowModal;
      finally
        with uCheckedOrders do for i := 0 to Count - 1 do TOCRec(Items[i]).Free;
        frmOCSession.Free;
      end; {try}
    end; {if CheckList}
  finally
    CheckList.Free;
  end;
end;

procedure TfrmOCSession.SetReqJustify;
var
  i, j: Integer;
  OCRec: TOCRec;
begin
  FCritical := False;
  with uCheckedOrders do for i := 0 to Count - 1 do
  begin
    OCRec := TOCRec(Items[i]);
    for j := 0 to OCRec.Checks.Count - 1 do
      if Piece(OCRec.Checks[j], U, 2) = '1' then FCritical := True;
  end;
  lblJustify.Visible := FCritical;
  txtJustify.Visible := FCritical;

end;

procedure TfrmOCSession.lstChecksMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
var
  i, AHt, TotalHt: Integer;
  x: string;
  ARect: TRect;
  OCRec: TOCRec;
begin
  inherited;

  with lstChecks do
     begin
       if Index >= uCheckedOrders.Count then Exit;
       OCRec := TOCRec(uCheckedOrders.Items[Index]);
       ARect := ItemRect(Index);
       ARect.Left := ARect.Left + 2;
       AHt := DrawText(Canvas.Handle, PChar(OCRec.OrderText), Length(OCRec.OrderText), ARect, DT_CALCRECT or DT_LEFT or DT_NOPREFIX or DT_WORDBREAK or DT_EXTERNALLEADING) + 2; //CQ7178: added DT_EXTERNALLEADING
       TotalHt := AHt;

       for i := 0 to OCRec.Checks.Count - 1 do
          begin
            ARect := ItemRect(Index);
            ARect.Left := ARect.Left + 10;
            x := Piece(OCRec.Checks[i], U, 3);
            AHt := DrawText(Canvas.Handle, PChar(x), Length(x), ARect, DT_CALCRECT or DT_LEFT or DT_NOPREFIX or DT_WORDBREAK or DT_EXTERNALLEADING); //CQ7178: added DT_EXTERNALLEADING
            TotalHt := TotalHt + AHt;
          end;
     end;
  Height := TotalHt + 2; // add 2 for focus rectangle
  if Height > 255 then Height := 255; //CQ7178
end;

procedure TfrmOCSession.lstChecksDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  i, AHt: Integer;
  x: string;
  ARect: TRect;
  OCRec: TOCRec;
begin
  inherited;

  with lstChecks do
     begin
       if Index >= uCheckedOrders.Count then Exit;
       OCRec := TOCRec(uCheckedOrders.Items[Index]);
       ARect := ItemRect(Index);
       AHt := DrawText(Canvas.Handle, PChar(OCRec.OrderText), Length(OCRec.OrderText), ARect, DT_LEFT or DT_NOPREFIX or DT_WORDBREAK or DT_EXTERNALLEADING) + 2; //CQ7178: added DT_EXTERNALLEADING
       ARect.Left := ARect.Left + 10;
       ARect.Top  := ARect.Top + AHt;
       for i := 0 to OCRec.Checks.Count - 1 do
          begin
            x := Piece(OCRec.Checks[i], U, 3);
            if not (odSelected in State) then
               begin
                 if (Piece(OCRec.Checks[i], U, 2) = '1') then
                   begin
                     if ColorToRGB(clWindowText) = ColorToRGB(clBlack) then
                       Canvas.Font.Color := clBlue;
                     Canvas.Font.Style := [fsUnderline];
                   end
                 else Canvas.Font.Color := clWindowText;
               end;
            AHt := DrawText(Canvas.Handle, PChar(x), Length(x), ARect, DT_LEFT or DT_NOPREFIX or DT_WORDBREAK or DT_EXTERNALLEADING); //CQ7178: added DT_EXTERNALLEADING
            ARect.Top  := ARect.Top + AHt;
        end;
     end;

end;

procedure TfrmOCSession.cmdCancelOrderClick(Sender: TObject);
var
  i, j: Integer;
  AnOrderID: string;
  OCRec: TOCRec;
begin
  inherited;
  for i := lstChecks.Items.Count - 1 downto 0 do if lstChecks.Selected[i] then
  begin
    OCRec := TOCRec(uCheckedOrders.Items[i]);
    AnOrderID := OCRec.OrderID;
    if DeleteCheckedOrder(AnOrderID) then
    begin
      for j := FCheckList.Count - 1 downto 0 do
        if Piece(FCheckList[j], U, 1) = AnOrderID then FCheckList.Delete(j);
      for j := FOrderList.Count - 1 downto 0 do
        if Piece(FOrderList[j], U, 1) = AnOrderID then FOrderList.Delete(j);
      OCRec.Free;
      uCheckedOrders.Delete(i);
      lstChecks.Items.Delete(i);
    end;
  end;
  if uCheckedOrders.Count = 0 then Close;
end;

procedure TfrmOCSession.cmdContinueClick(Sender: TObject);
begin
  inherited;
  if FCritical and ((Length(txtJustify.Text) < 2) or not ContainsVisibleChar(txtJustify.Text)) then
  begin
     InfoBox('A justification for overriding critical order checks is required.',
            'Justification Required', MB_OK);
    Exit;
  end;
  StatusText('Saving Order Checks...');
  SaveOrderChecksForSession(txtJustify.Text, FCheckList);
  StatusText('');
  Close;
end;

procedure TfrmOCSession.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SaveUserBounds(Self); //Save Position & Size of Form
end;

procedure TfrmOCSession.FormShow(Sender: TObject);
begin
  inherited;
  SetFormPosition(Self); //Get Saved Position & Size of Form
end;


procedure TfrmOCSession.FormResize(Sender: TObject);
begin
  //TfrmAutoSz has defect must call inherited Resize for the resize to function.
  inherited;
end;

procedure TfrmOCSession.txtJustifyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //GE CQ9540  activate Return key, behave as "Continue" buttom clicked.
  if Key = VK_RETURN then cmdContinueClick(self);
end;

end.
