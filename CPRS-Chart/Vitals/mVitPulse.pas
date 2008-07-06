unit mVitPulse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls, Spin;

type
  TfraVitPulse = class(TfraVitBase)
    edtPulse: TEdit;
    UpDown1: TUpDown;
  private
    { Private declarations }
  public
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitPulse: TfraVitPulse;

implementation

uses uVitals;

{$R *.DFM}

{ TfraVitPulse }

function TfraVitPulse.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtPulse;
  Result.VValue := edtPulse.Text;
end;

end.
