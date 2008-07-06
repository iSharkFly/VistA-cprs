unit mVitBP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  mVitBase, StdCtrls, Buttons, ComCtrls;

type
  TfraVitPB = class(TfraVitBase)
    udSystolic: TUpDown;
    edtSystolic: TEdit;
    udDiastolic: TUpDown;
    edtDiastolic: TEdit;
    lblSlash: TLabel;
  private
    { Private declarations }
  public
    function GetVitalInfo: TVitInfo; override;
  end;

var
  fraVitPB: TfraVitPB;

implementation

uses uVitals;

{$R *.DFM}

{ TfraVitPB }

function TfraVitPB.GetVitalInfo: TVitInfo;
begin
  Result.VType := vtBP;
  Result.VValue := edtSystolic.Text + '/' + edtDiastolic.Text;
  if Result.VValue = '/' then
    Result.VValue := '';
end;

end.
