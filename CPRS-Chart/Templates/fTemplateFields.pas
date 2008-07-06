unit fTemplateFields;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ORCtrls, ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmTemplateFields = class(TForm)
    pnlBottom: TPanel;
    btnCancel: TButton;
    cboObjects: TORComboBox;
    btnInsert: TButton;
    lblReq: TStaticText;
    btnPreview: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboObjectsNeedData(Sender: TObject; const StartFrom: String;
      Direction, InsertAt: Integer);
    procedure cboObjectsDblClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInsertClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure cboObjectsChange(Sender: TObject);
  private
{    Fre: TRichEdit;}
    Fre: TCustomEdit;
    FAutoLongLines: TNotifyEvent;
    procedure InsertField;
{    procedure Setre(const Value: TRichEdit);}
    procedure Setre(const Value: TCustomEdit);
  public
    procedure UpdateStatus;
{    property re: TRichEdit read Fre write Setre;}
    property re: TCustomEdit read Fre write Setre;
    property AutoLongLines: TNotifyEvent read FAutoLongLines write FAutoLongLines;
  end;

implementation

uses
  ORFn, rTemplates, uTemplateFields, fTemplateDialog, ORClasses;

{$R *.DFM}

procedure TfrmTemplateFields.FormShow(Sender: TObject);
begin
  cboObjects.SelectAll;
  cboObjects.SetFocus;
end;

procedure TfrmTemplateFields.FormCreate(Sender: TObject);
begin
  cboObjects.InitLongList('');
  cboObjects.ItemHeight := 15;
  ResizeAnchoredFormToFont(self);
  //ResizeAnchoredFormToFont doesn't work right on the button positions for some reason.
  btnCancel.Left := pnlBottom.ClientWidth - btnCancel.Width;
  btnInsert.Left := btnCancel.Left - btnInsert.Width - 8;
end;

procedure TfrmTemplateFields.cboObjectsNeedData(Sender: TObject;
  const StartFrom: String; Direction, InsertAt: Integer);
var
  tmp: TStrings;

begin
  tmp := SubSetOfTemplateFields(StartFrom, Direction);
  ConvertCodes2Text(tmp, FALSE);
  cboObjects.ForDataUse(tmp);
end;

procedure TfrmTemplateFields.InsertField;
var
  cnt: integer;

begin
  if assigned(Fre) and (not TORExposedCustomEdit(Fre).ReadOnly) and (cboObjects.ItemIndex >= 0) then
  begin
    if Fre is TRichEdit then
      cnt := TRichEdit(FRe).Lines.Count
    else
      cnt :=0;
    Fre.SelText := TemplateFieldBeginSignature +
                   Piece(cboObjects.Items[cboObjects.ItemIndex],U,2)+
                   TemplateFieldEndSignature;
    if Fre is TRichEdit then
      if(assigned(FAutoLongLines) and (cnt <> TRichEdit(FRe).Lines.Count)) then
        FAutoLongLines(Self);
  end;
end;

procedure TfrmTemplateFields.cboObjectsDblClick(Sender: TObject);
begin
  if btnInsert.Enabled then
    InsertField;
end;

procedure TfrmTemplateFields.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTemplateFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmTemplateFields.Setre(const Value: TCustomEdit);
begin
  Fre := Value;
  UpdateStatus;
end;

procedure TfrmTemplateFields.UpdateStatus;
begin
  btnInsert.Enabled := (not TORExposedCustomEdit(re).ReadOnly);
end;

procedure TfrmTemplateFields.btnInsertClick(Sender: TObject);
begin
  InsertField;
end;

procedure TfrmTemplateFields.btnPreviewClick(Sender: TObject);
var
  tmp, txt: string;


begin
  if(cboObjects.ItemIndex >= 0) then
  begin
    FormStyle := fsNormal;
    try
      txt := Piece(cboObjects.Items[cboObjects.ItemIndex],U,2);
      tmp := TemplateFieldBeginSignature + txt + TemplateFieldEndSignature;
      CheckBoilerplate4Fields(tmp, 'Preview Template Field: ' + txt, TRUE);
    finally
      FormStyle := fsStayOnTop;
    end;
  end;
end;

procedure TfrmTemplateFields.cboObjectsChange(Sender: TObject);
begin
  btnPreview.Enabled := (cboObjects.ItemIndex >= 0)
end;

end.
