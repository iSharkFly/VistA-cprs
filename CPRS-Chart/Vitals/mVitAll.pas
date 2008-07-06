unit mVitAll;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, mVitCirGirth, mVitCVP, mVitPO2, mVitPain, mVitWeight,
  mVitHeight, mVitBP, mVitResp, mVitPulse, mVitBase, mVitTemp, mVitMetric;

type
  TfraVitAll = class(TFrame)
    fraVitMetric1: TfraVitMetric;
    fraVitTemp1: TfraVitTemp;
    fraVitPulse1: TfraVitPulse;
    fraVitResp1: TfraVitResp;
    fraVitPB1: TfraVitPB;
    fraVitHeight1: TfraVitHeight;
    fraVitWeight1: TfraVitWeight;
    fraVitPain1: TfraVitPain;
    fraVitPO21: TfraVitPO2;
    fraVitCVP1: TfraVitCVP;
    fraVitCircum1: TfraVitCircum;
  private
  public
  end;

implementation

uses uVitals;

{$R *.DFM}

end.
