unit fOptionsPrimaryList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ORCtrls, StdCtrls, ORFn, ExtCtrls;

type
  TfrmOptionsPrimaryList = class(TForm)
    pnlBottom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    lblPrimaryList: TLabel;
    cboPrimary: TORComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DialogOptionsPrimaryList(fontsize: integer; var actiontype: Integer);

var
  frmOptionsPrimaryList: TfrmOptionsPrimaryList;

implementation

{$R *.DFM}

procedure DialogOptionsPrimaryList(fontsize: integer; var actiontype: Integer);
// create the form and make in modal, return an action
var
  frmOptionsPrimaryList: TfrmOptionsPrimaryList;
begin
  frmOptionsPrimaryList := TfrmOptionsPrimaryList.Create(Application);
  actiontype := 0;
  try
    with frmOptionsPrimaryList do
    begin
      Position := poScreenCenter;
      Font.Size := MainFontSize;
      ShowModal;
      actiontype := btnOK.Tag;
    end;
  finally
    frmOptionsPrimaryList.Release;
  end;
end;

end.
