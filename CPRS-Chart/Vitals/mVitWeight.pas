unit mVitWeight;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls;

type
  TfraVitWeight = class(TfraVitBase)
    edtWtLbs: TEdit;
    lblLbs: TLabel;
    udWeight: TUpDown;
    edtWtKg: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    procedure VitalsMetricChanged; override;
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitWeight: TfraVitWeight;

implementation

uses uVitals, rVitals;

{$R *.DFM}

{ TfraVitWeight }

function TfraVitWeight.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtWeight;
  Result.VValue := edtWtLbs.Text;
end;

procedure TfraVitWeight.VitalsMetricChanged;
begin
  inherited;
  edtWtKg.Color := VitEnabledColor[uVitalsMetric];
  edtWtKg.Enabled := uVitalsMetric;
  edtWtKg.TabStop := uVitalsMetric;
  edtWtLbs.Color := VitEnabledColor[not uVitalsMetric];
  edtWtLbs.Enabled := not uVitalsMetric;
  edtWtLbs.TabStop := not uVitalsMetric;
end;

end.
