unit mVitMetric;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfraVitMetric = class(TFrame)
    rgMetric: TRadioGroup;
    procedure rgMetricClick(Sender: TObject);
  private
    FChanging: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure VitalsMetricChanged;
  end;

implementation

uses rVitals, uVitals;

{$R *.DFM}

{ TfraVitMetric }

constructor TfraVitMetric.Create(AOwner: TComponent);
begin
  inherited;
  VitalsMetricChanged;
  VitalsFrameCreated(Self);
end;

procedure TfraVitMetric.rgMetricClick(Sender: TObject);
begin
  if FChanging then exit;
  SetVitalsMetric(rgMetric.ItemIndex = 1);
end;

procedure TfraVitMetric.VitalsMetricChanged;
begin
  FChanging := TRUE;
  try
    if uVitalsMetric then
      rgMetric.ItemIndex := 1
    else
      rgMetric.ItemIndex := 0;
  finally
    FCHanging := FALSE;
  end;
end;

end.
