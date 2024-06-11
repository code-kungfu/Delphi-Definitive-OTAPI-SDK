unit OTAPISample.UseThemeBarStyling.Expert;

interface

uses
  ToolsAPI;

type
  TOTAPISampleStyledFormExpert = class(TNotifierObject, IOTANotifier, IOTAWizard, IOTAMenuWizard)
  public
    { IOTAMenuWizard }
    function GetMenuText: string;
    { IOTAWizard }
    procedure Execute;
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    { IOTANotifier }
    procedure Destroyed;
  end;

  procedure Register;

implementation

uses
  OTAPISample.UseThemeBarStyling.Forms.Main;

procedure Register;
begin
  RegisterPackageWizard(TOTAPISampleStyledFormExpert.Create as IOTAMenuWizard);
end;

{ TOTAPISampleStyledFormExpert }

procedure TOTAPISampleStyledFormExpert.Destroyed;
begin
  TfrmMainForm.DestroyForm;
end;

procedure TOTAPISampleStyledFormExpert.Execute;
begin
  TfrmMainForm.CreateSampleStyledForm;
end;

function TOTAPISampleStyledFormExpert.GetIDString: string;
begin
  Result := 'OTAPISamples.StyledFormThemeBarExpert';
end;

function TOTAPISampleStyledFormExpert.GetMenuText: string;
begin
  Result := 'OTAPI Sample - Show Styled ThemeBar Form';
end;

function TOTAPISampleStyledFormExpert.GetName: string;
begin
  Result := 'OTAPI Samples - Show Styled ThemeBar Form';
end;

function TOTAPISampleStyledFormExpert.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

initialization
  // Do nothing

finalization
  TfrmMainForm.DestroyForm;

end.
