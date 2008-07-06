unit mCoPayDesc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ORCtrls, UBAConst;

type
  TfraCoPayDesc = class(TFrame)
    pnlRight: TPanel;
    lblCaption: TStaticText;
    pnlSC: TPanel;
    lblSCDisplay: TLabel;
    memSCDisplay: TCaptionMemo;
    Spacer2: TLabel;
    pnlMain: TPanel;
    spacer1: TLabel;
    Panel7: TPanel;
    lblHNC2: TORStaticText;
    lblHNC: TORStaticText;
    Panel8: TPanel;
    Label12: TORStaticText;
    Label11: TORStaticText;
    Panel9: TPanel;
    Label14: TORStaticText;
    Label13: TORStaticText;
    Panel10: TPanel;
    Label16: TORStaticText;
    Label15: TORStaticText;
    Panel11: TPanel;
    Label18: TORStaticText;
    Label17: TORStaticText;
    Panel12: TPanel;
    Label24: TORStaticText;
    Label23: TORStaticText;
    Panel1: TPanel;
    StaticText4: TORStaticText;
    StaticText1: TORStaticText;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses rPCE, UBAGlobals;

{$R *.DFM}

{ TfraCoPayDesc }

constructor TfraCoPayDesc.Create(AOwner: TComponent);
begin
  inherited;
  ListSCDisabilities(memSCDisplay.Lines);
  Label23.Hint := BAFactorsRec.FBAFactorSC;
  Label24.Hint := BAFactorsRec.FBAFactorSC;
  staticText1.Hint := BAFactorsRec.FBAFactorCV;
  staticText4.Hint := BAFactorsRec.FBAFactorCV;
  Label17.Hint := BAFactorsRec.FBAFactorAO;
  Label18.Hint := BAFactorsRec.FBAFactorAO;
  Label15.Hint := BAFactorsRec.FBAFactorIR;
  Label16.Hint := BAFactorsRec.FBAFactorIR;
  Label13.Hint := BAFactorsRec.FBAFactorEC;
  Label14.Hint := BAFactorsRec.FBAFactorEC;
  Label11.Hint := BAFactorsRec.FBAFactorMST;
  Label12.Hint := BAFactorsRec.FBAFactorMST;
  lblHNC.Hint :=  BAFactorsRec.FBAFactorHNC;
  lblHNC2.Hint := BAFactorsRec.FBAFactorHNC;

end;

end.
