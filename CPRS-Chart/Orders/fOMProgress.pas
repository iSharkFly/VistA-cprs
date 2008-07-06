unit fOMProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fAutoSz, StdCtrls, ORCtrls, CheckLst, ORFn;

type
  TfrmOMProgress = class(TfrmAutoSz)
    lstItems: TCheckListBox;
    cmdStop: TORAlignButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOMProgress: TfrmOMProgress;

procedure OrderSetStart(AnItemList: TStringList);
procedure OrderSetItemStart(AnItem: Integer; ADialog: TForm);
procedure OrderSetItemDone(AnItem: Integer);
procedure OrderSetDone;

implementation

{$R *.DFM}

procedure OrderSetStart(AnItemList: TStringList);
begin
end;

procedure OrderSetItemStart(AnItem: Integer; ADialog: TForm);
begin
end;

procedure OrderSetItemDone(AnItem: Integer);
begin
end;

procedure OrderSetDone;
begin
end;

procedure TfrmOMProgress.FormCreate(Sender: TObject);
begin
  inherited;
  lstItems.Color := ReadOnlyColor;
end;

end.
