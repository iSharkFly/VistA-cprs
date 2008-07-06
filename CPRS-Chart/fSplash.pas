unit fSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    lblSplash: TStaticText;
    lblVersion: TStaticText;
    lblCopyright: TStaticText;
    Panel2: TPanel;
    Image1: TImage;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.DFM}

uses ORSystem;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  lblVersion.Caption := 'version ' +
                        FileVersionValue(Application.ExeName, FILE_VER_FILEVERSION);
end;

end.
