unit mVitBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, uVitals;

type
  TVitInfo = record
    VType: TVitalType;
    VValue: string;
  end;

  TfraVitBase = class(TFrame)
    lblVitalType: TLabel;
    btnQuals: TBitBtn;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure VitalsMetricChanged; virtual;
    procedure VitalsCVPUnitsChanged; virtual;
    function GetVitalInfo: TVitInfo; virtual;
  end;

var
  VitEnabledColor: array[boolean] of TColor = (clBtnFace, clWindow);
  
implementation

{$R *.DFM}

{ TFrame1 }

constructor TfraVitBase.Create(AOwner: TComponent);
begin
  inherited;
  VitalsFrameCreated(Self);
  VitalsMetricChanged;
  VitalsCVPUnitsChanged;
end;

function TfraVitBase.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtUnknown;
  Result.VValue := '';
end;

procedure TfraVitBase.VitalsCVPUnitsChanged;
begin
end;

procedure TfraVitBase.VitalsMetricChanged;
begin
end;

end.
