unit mVitCirGirth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls;

type
  TfraVitCircum = class(TfraVitBase)
    edtCirIn: TEdit;
    lblIn: TLabel;
    udCir: TUpDown;
    edtCirCm: TEdit;
    lblCm: TLabel;
  private
    { Private declarations }
  public
    procedure VitalsMetricChanged; override;
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitCircum: TfraVitCircum;

implementation

uses uVitals, rVitals;

{$R *.DFM}

{ TfraVitCircum }

function TfraVitCircum.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtCircum;
  Result.VValue := edtCirIn.Text;
end;

procedure TfraVitCircum.VitalsMetricChanged;
begin
  inherited;
  edtCirCm.Color := VitEnabledColor[uVitalsMetric];
  edtCirCm.Enabled := uVitalsMetric;
  edtCirCm.TabStop := uVitalsMetric;
  edtCirIn.Color := VitEnabledColor[not uVitalsMetric];
  edtCirIn.Enabled := not uVitalsMetric;
  edtCirIn.TabStop := not uVitalsMetric;
end;

end.
