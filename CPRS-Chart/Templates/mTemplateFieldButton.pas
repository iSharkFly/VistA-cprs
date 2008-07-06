unit mTemplateFieldButton;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfraTemplateFieldButton = class(TFrame)
    pnlBtn: TPanel;
    lblText: TLabel;
    pbFocus: TPaintBox;
    procedure pnlBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlBtnEnter(Sender: TObject);
    procedure pnlBtnExit(Sender: TObject);
    procedure pbFocusPaint(Sender: TObject);
  private
    FBtnDown: boolean;
    FItems: TStringList;
    FOnChange: TNotifyEvent;
    procedure ButtonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    function GetButtonText: string;
    procedure SetButtonText(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ButtonText: string read GetButtonText write SetButtonText;
    property Items: TStringList read FItems;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

{$R *.DFM}

uses
  ORFn;
  
procedure TfraTemplateFieldButton.pnlBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  txt: string;
  i, idx: integer;

begin
  if(not FBtnDown) then
  begin
    FBtnDown := TRUE;
    pnlBtn.BevelOuter := bvLowered;
    if(FItems.Count > 0) then
    begin
      txt := ButtonText;
      idx := FItems.Count-1;
      for i := 0 to FItems.Count-1 do
      begin
        if(txt = FItems[i]) then
        begin
          idx := i;
          break;
        end;
      end;
      inc(idx);
      if(idx >= FItems.Count) then
        idx := 0;
      ButtonText := FItems[idx];
      if assigned(FOnChange) then
        FOnChange(Self);
    end;
    SetFocus;
  end;
end;

procedure TfraTemplateFieldButton.pnlBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if(FBtnDown) then
  begin
    FBtnDown := FALSE;
    pnlBtn.BevelOuter := bvRaised;
  end;
end;

procedure TfraTemplateFieldButton.pnlBtnEnter(Sender: TObject);
begin
  pbFocus.Invalidate;
end;

procedure TfraTemplateFieldButton.pnlBtnExit(Sender: TObject);
begin
  pbFocus.Invalidate;
end;

constructor TfraTemplateFieldButton.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TStringList.Create;
  OnKeyDown := ButtonKeyDown;
  OnKeyUp := ButtonKeyUp;
  Font.Size := MainFontSize;
end;

procedure TfraTemplateFieldButton.ButtonKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    pnlBtnMouseDown(Sender, mbLeft, [], 0, 0);
end;

procedure TfraTemplateFieldButton.ButtonKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  pnlBtnMouseUp(Sender, mbLeft, [], 0, 0);
end;

function TfraTemplateFieldButton.GetButtonText: string;
begin
  Result := lblText.Caption;
end;

procedure TfraTemplateFieldButton.SetButtonText(const Value: string);
begin
  lblText.Caption := Value;
end;

procedure TfraTemplateFieldButton.pbFocusPaint(Sender: TObject);
var
  R: TRect;
begin
  if(Focused) then
  begin
    R := Rect(1, 0, pnlBtn.Width - 3, pnlBtn.Height-2);
    pbFocus.Canvas.DrawFocusRect(R);
  end;
end;

destructor TfraTemplateFieldButton.Destroy;
begin
  FItems.Free;
  inherited;
end;

end.
