unit fLabTest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ORCtrls, StdCtrls, ExtCtrls, ORNet;

type
  TfrmLabTest = class(TForm)
    pnlLabTest: TORAutoPanel;
    cmdOK: TButton;
    cmdCancel: TButton;
    cboList: TORComboBox;
    cboSpecimen: TORComboBox;
    lblTest: TLabel;
    lblSpecimen: TLabel;
    lblSpecInfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cboListNeedData(Sender: TObject; const StartFrom: string;
      Direction, InsertAt: Integer);
    procedure cboSpecimenNeedData(Sender: TObject; const StartFrom: string;
      Direction, InsertAt: Integer);
    procedure cmdOKClick(Sender: TObject);
    procedure cboListEnter(Sender: TObject);
    procedure cboListExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure SelectTest(FontSize: Integer);

implementation

uses fLabs, ORFn, rLabs;

{$R *.DFM}

procedure SelectTest(FontSize: Integer);
var
  frmLabTest: TfrmLabTest;
  W, H: integer;
begin
  frmLabTest := TfrmLabTest.Create(Application);
  try
    with frmLabTest do
    begin
      Font.Size := FontSize;
      W := ClientWidth;
      H := ClientHeight;
      ResizeToFont(FontSize, W, H);
      ClientWidth := W; pnlLabTest.Width := W;
      ClientHeight := H; pnlLabTest.Height := H;
      lblSpecInfo.Height := cboList.Height;
      lblSpecInfo.Width := pnlLabTest.Width - cboList.Left - cboList.Width -10;
      ShowModal;
    end;
  finally
    frmLabTest.Release;
  end;
end;

procedure TfrmLabTest.FormCreate(Sender: TObject);
var
  blood, urine, serum, plasma: string;
begin
  RedrawSuspend(cboList.Handle);
  cboList.InitLongList('');
  RedrawActivate(cboList.Handle);
  RedrawSuspend(cboSpecimen.Handle);
  cboSpecimen.InitLongList('');
  SpecimenDefaults(blood, urine, serum, plasma);
  cboSpecimen.Items.Add('0^Any');
  cboSpecimen.Items.Add(serum + '^Serum');
  cboSpecimen.Items.Add(blood + '^Blood');
  cboSpecimen.Items.Add(plasma + '^Plasma');
  cboSpecimen.Items.Add(urine + '^Urine');
  cboSpecimen.Items.Add(LLS_LINE);
  cboSpecimen.Items.Add(LLS_SPACE);
  cboSpecimen.ItemIndex := 0;
  RedrawActivate(cboSpecimen.Handle);
end;

procedure TfrmLabTest.cboListNeedData(Sender: TObject;
  const StartFrom: string; Direction, InsertAt: Integer);
begin
  cboList.ForDataUse(AtomicTests(StartFrom, Direction));
end;

procedure TfrmLabTest.cboSpecimenNeedData(Sender: TObject;
  const StartFrom: string; Direction, InsertAt: Integer);
begin
  cboSpecimen.ForDataUse(Specimens(StartFrom, Direction));
end;

procedure TfrmLabTest.cmdOKClick(Sender: TObject);
begin
  if cboList.ItemIndex = -1 then
    ShowMessage('No test was selected.')
  else
  begin
    frmLabs.lblSingleTest.Caption := cboList.Items[cboList.ItemIndex];
    frmLabs.lblSpecimen.Caption := cboSpecimen.Items[cboSpecimen.ItemIndex];
    Close;
  end;
end;

procedure TfrmLabTest.cboListEnter(Sender: TObject);
begin
  cmdOK.Default := true;
end;

procedure TfrmLabTest.cboListExit(Sender: TObject);
begin
  cmdOK.Default := false;
end;

end.
