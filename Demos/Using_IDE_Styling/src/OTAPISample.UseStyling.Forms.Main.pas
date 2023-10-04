unit OTAPISample.UseStyling.Forms.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmMainForm = class(TForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    FStyleServicesNotifierID: Integer;
    class var FCreationID: Integer;
    procedure UpdateFormTheme(Sender: TObject);
  public
    class procedure CreateSampleStyledForm;
    class procedure DestroyForm;
    destructor Destroy; override;
  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.dfm}

uses
  OTAPISample.UseStyling.ThemeNotifier,
  ToolsAPI;

{ TfrmMainForm }

class procedure TfrmMainForm.CreateSampleStyledForm;
begin
  if not Assigned(frmMainForm) then
    frmMainForm := TfrmMainForm.Create(Application.MainForm)
  else
    frmMainForm.UpdateFormTheme(nil);

  //FCreationID := frmMainForm.ShowModal;
  frmMainForm.Show;
end;

destructor TfrmMainForm.Destroy;
var
  LThemingServices: IOTAIDEThemingServices;
begin
  if (FStyleServicesNotifierID <> -1) and (Supports(BorlandIDEServices, IOTAIDEThemingServices, LThemingServices)) then
    LThemingServices.RemoveNotifier(FStyleServicesNotifierID);

  inherited;
end;

class procedure TfrmMainForm.DestroyForm;
begin
  if Assigned(frmMainForm) then
    FreeAndNil(frmMainForm);
end;

procedure TfrmMainForm.btnCloseClick(Sender: TObject);
begin
  //Self.ModalResult := mrOK;
  Self.Close;
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
var
  LThemingServices: IOTAIDEThemingServices;
begin
  FStyleServicesNotifierID := -1;
  if Supports(BorlandIDEServices, IOTAIDEThemingServices, LThemingServices) then
  begin
    if LThemingServices.IDEThemingEnabled then
    begin
      FStyleServicesNotifierID := LThemingServices.AddNotifier(TThemingServicesNotifier.Create(UpdateFormTheme));
      Self.UpdateFormTheme(nil);
    end;
  end;
end;

procedure TfrmMainForm.UpdateFormTheme(Sender: TObject);
var
  LThemingServices: IOTAIDEThemingServices;
begin
  if Supports(BorlandIDEServices, IOTAIDEThemingServices250, LThemingServices) then
  begin
    if LThemingServices.IDEThemingEnabled then
    begin
      LThemingServices.RegisterFormClass(TfrmMainForm);
      LThemingServices.ApplyTheme(Self);
    end;
  end;
end;

initialization
  // Do nothing here

finalization
  if Assigned(frmMainForm) then
    FreeAndNil(frmMainForm);

end.
