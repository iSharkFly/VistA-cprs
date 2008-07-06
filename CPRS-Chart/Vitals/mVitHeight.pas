unit mVitHeight;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls;

type
  TfraVitHeight = class(TfraVitBase)
    edtHtIn: TEdit;
    lblIn: TLabel;
    udHeight: TUpDown;
    edtHtCm: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    procedure VitalsMetricChanged; override;
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitHeight: TfraVitHeight;

implementation

uses uVitals, rVitals;

{$R *.DFM}

{ TfraVitHeight }

function TfraVitHeight.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtHeight;
  Result.VValue := edtHtIn.Text;
end;

procedure TfraVitHeight.VitalsMetricChanged;
begin
  inherited;
  edtHtCm.Color := VitEnabledColor[uVitalsMetric];
  edtHtCm.Enabled := uVitalsMetric;
  edtHtCm.TabStop := uVitalsMetric;
  edtHtIn.Color := VitEnabledColor[not uVitalsMetric];
  edtHtIn.Enabled := not uVitalsMetric;
  edtHtIn.TabStop := not uVitalsMetric;
end;

end.
