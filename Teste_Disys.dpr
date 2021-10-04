program Teste_Disys;

uses
  Vcl.Forms,
  Menu in 'Menu.pas' {frmPrincipal},
  DataModule in 'DataModule.pas' {DM1: TDataModule},
  Cadastro in 'Cadastro.pas' {frmCadastro},
  Clientes in 'Clientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM1, DM1);
  Application.Run;
end.
