unit mVitCVP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, ComCtrls, StdCtrls, Buttons, ORCtrls;

type
  TfraVitCVP = class(TfraVitBase)
    edtCVPcm: TEdit;
    UpDown1: TUpDown;
    lblMm: TLabel;
    edtCVPmm: TEdit;
    lblCm: TLabel;
    cbcmH2O: TORCheckBox;
    procedure cbcmH2OClick(Sender: TObject);
  private
    FChanging: boolean;
  public
    function GetVitalInfo: TVitInfo; override;
    procedure VitalsCVPUnitsChanged; override;
  end;

var
  fraVitCVP: TfraVitCVP;

implementation

uses uVitals, rVitals;

{$R *.DFM}

{ TfraVitCVP }

function TfraVitCVP.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtCVP;
  Result.VValue := edtCVPcm.Text;
end;

procedure TfraVitCVP.VitalsCVPUnitsChanged;
begin
  inherited;
  edtCVPmm.Color := VitEnabledColor[uVitCVPmmHg];
  edtCVPmm.Enabled := uVitCVPmmHg;
  edtCVPmm.TabStop := uVitCVPmmHg;
  edtCVPcm.Color := VitEnabledColor[not uVitCVPmmHg];
  edtCVPcm.Enabled := not uVitCVPmmHg;
  edtCVPcm.TabStop := not uVitCVPmmHg;
  FChanging := TRUE;
  try
    cbcmH2O.Checked := not uVitCVPmmHg;
  finally
    FChanging := FALSE;
  end;
end;

procedure TfraVitCVP.cbcmH2OClick(Sender: TObject);
begin
  inherited;
  if FChanging then exit;
  SetVitCVPmmHg(not cbcmH2O.Checked);
end;

end.
