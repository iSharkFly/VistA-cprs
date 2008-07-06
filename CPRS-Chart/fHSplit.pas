unit fHSplit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPage, ExtCtrls;

type
  TfrmHSplit = class(TfrmPage)
    pnlLeft: TPanel;
    pnlRight: TPanel;
    sptHorz: TSplitter;
  private
  public
    { Public declarations }
  end;

var
  frmHSplit: TfrmHSplit;

implementation

{$R *.DFM}

end.
