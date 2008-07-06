unit mImgText;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfraImgText = class(TFrame)
    img: TImage;
    lblText: TLabel;
  private
    { Private declarations }
  public
  end;

implementation

{$R *.DFM}

end.
