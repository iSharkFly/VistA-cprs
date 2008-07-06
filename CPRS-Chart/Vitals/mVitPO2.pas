unit mVitPO2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ORCtrls, ComCtrls;

type
  TfraVitPO2 = class(TfraVitBase)
    UpDown1: TUpDown;
    lblPercent: TLabel;
    edtPO2: TEdit;
  private
    { Private declarations }
  public
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitPO2: TfraVitPO2;

implementation

uses uVitals;

{$R *.DFM}

{ TfraVitPO2 }

function TfraVitPO2.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtPO2;
  Result.VValue := edtPO2.Text;
end;

end.
