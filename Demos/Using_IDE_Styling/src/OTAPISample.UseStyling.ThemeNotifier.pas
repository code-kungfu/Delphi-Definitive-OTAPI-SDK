unit OTAPISample.UseStyling.ThemeNotifier;

interface

uses
  System.Classes,
  ToolsAPI;

type
  TThemingServicesNotifier = class(TInterfacedObject, IOTANotifier, INTAIDEThemingServicesNotifier)
  private
    FNotifyEvent: TNotifyEvent;
  public
    { IOTANotifier }
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    { INTAIDEThemingServicesNotifier }
    procedure ChangedTheme;
    procedure ChangingTheme;
    { TThemingServicesNotifier }
    constructor Create(const ANotifyProc: TNotifyEvent);
  end;

implementation

{ TThemingServicesNotifier }

procedure TThemingServicesNotifier.AfterSave;
begin
  // Do Nothing
end;

procedure TThemingServicesNotifier.BeforeSave;
begin
  // Do Nothing
end;

procedure TThemingServicesNotifier.ChangedTheme;
begin
  if @FNotifyEvent <> nil then
    FNotifyEvent(nil);
end;

procedure TThemingServicesNotifier.ChangingTheme;
begin
  // Do Nothing
end;

constructor TThemingServicesNotifier.Create(const ANotifyProc: TNotifyEvent);
begin
  if (not Assigned(FNotifyEvent)) and (Assigned(ANotifyProc)) then
    FNotifyEvent := ANotifyProc;
end;

procedure TThemingServicesNotifier.Destroyed;
begin
  // Do Nothing
end;

procedure TThemingServicesNotifier.Modified;
begin
  // Do Nothing
end;

end.
