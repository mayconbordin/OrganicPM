program organic_pm;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untModelo in 'untModelo.pas' {frmModelo},
  untPerfilPrincipal in 'untPerfilPrincipal.pas' {frmPerfilPrincipal},
  untFichaPrincipal in 'untFichaPrincipal.pas' {frmFichaPrincipal},
  untTDPrincipal in 'untTDPrincipal.pas' {frmTDPrincipal},
  untRecrutPrincipal in 'untRecrutPrincipal.pas' {frmRecrutPrincipal},
  untSalBenPrincipal in 'untSalBenPrincipal.pas' {frmSalBenPrincipal},
  untAvaliacaoPrincipal in 'untAvaliacaoPrincipal.pas' {frmAvalicaoPrincipal},
  uClassConexao in 'uClassConexao.pas',
  untFpCargos in 'untFpCargos.pas' {frmFpCargos},
  uClassCargos in 'uClassCargos.pas',
  uClassDepartamentos in 'uClassDepartamentos.pas',
  uClassTiposCargo in 'uClassTiposCargo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmModelo, frmModelo);
  Application.CreateForm(TfrmFpCargos, frmFpCargos);
  Application.Run;
end.
