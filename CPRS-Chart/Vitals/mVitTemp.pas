unit mVitTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls;

type
  TfraVitTemp = class(TfraVitBase)
    edtTempF: TEdit;
    udTemp: TUpDown;
    edtTempC: TEdit;
    lblF: TLabel;
    lblC: TLabel;
  private
    { Private declarations }
  public
    procedure VitalsMetricChanged; override;
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitTemp: TfraVitTemp;

implementation

uses uVitals, rVitals;

{$R *.DFM}

{ TfraVitTemp }

function TfraVitTemp.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtTemp;
  Result.VValue := edtTempF.Text;
end;

procedure TfraVitTemp.VitalsMetricChanged;
begin
  inherited;
  edtTempC.Color := VitEnabledColor[uVitalsMetric];
  edtTempC.Enabled := uVitalsMetric;
  edtTempC.TabStop := uVitalsMetric;
  edtTempF.Color := VitEnabledColor[not uVitalsMetric];
  edtTempF.Enabled := not uVitalsMetric;
  edtTempF.TabStop := not uVitalsMetric;
end;

end.
