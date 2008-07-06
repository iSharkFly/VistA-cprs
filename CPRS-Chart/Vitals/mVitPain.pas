unit mVitPain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ORCtrls;

type
  TfraVitPain = class(TfraVitBase)
    cbxPain: TORComboBox;
  private
    { Private declarations }
  public
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitPain: TfraVitPain;

implementation

uses uVitals;

{$R *.DFM}

{ TfraVitPain }

function TfraVitPain.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtPain;
  Result.VValue := cbxPain.ItemID;
end;

end.
