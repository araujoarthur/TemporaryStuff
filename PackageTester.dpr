program PackageTester;

uses
  Vcl.Forms,
  PackageTesteApplication in 'PackageTesteApplication.pas' {frmPackageTestApplication},
  PreXML in 'PreXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPackageTestApplication, frmPackageTestApplication);
  Application.Run;
end.
