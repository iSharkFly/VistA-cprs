unit mVitResp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls;

type
  TfraVitResp = class(TfraVitBase)
    UpDown1: TUpDown;
    edtResp: TEdit;
  private
    { Private declarations }
  public
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitResp: TfraVitResp;

implementation

uses uVitals;

{$R *.DFM}

{ TfraVitResp }

function TfraVitResp.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtResp;
  Result.VValue := edtResp.Text;
end;

end.
