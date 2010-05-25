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
<<<<<<< .mine
  uClassFP_CARGOS in 'uClassFP_CARGOS.pas',
  uClassFP_DEPARTAMENTOS in 'uClassFP_DEPARTAMENTOS.pas',
  uClassFP_TIPOS_CARGO in 'uClassFP_TIPOS_CARGO.pas',
  uClassFP_ATRIBUTOS in 'uClassFP_ATRIBUTOS.pas',
  untFpAtributos in 'untFpAtributos.pas' {frmFpAtributos},
  uClassGE_COLABORADORES in 'uClassGE_COLABORADORES.pas',
  uClassGE_PESSOAS in 'uClassGE_PESSOAS.pas',
  uClassGE_ESTADOS_CIVIS in 'uClassGE_ESTADOS_CIVIS.pas',
  uClassGE_UNIDADES_FEDERATIVAS in 'uClassGE_UNIDADES_FEDERATIVAS.pas',
  untGeColaboradores in 'untGeColaboradores.pas' {frmGeColaboradores};
=======
  uClassCargos in 'uClassCargos.pas',
  uClassDepartamentos in 'uClassDepartamentos.pas',
  uClassTiposCargo in 'uClassTiposCargo.pas',
  uClassAtributos in 'uClassAtributos.pas',
  untFpAtributos in 'untFpAtributos.pas' {frmFpAtributos},
  Lua in 'Lua.pas';
>>>>>>> .r22

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmModelo, frmModelo);
  Application.CreateForm(TfrmFpCargos, frmFpCargos);
  Application.CreateForm(TfrmFpAtributos, frmFpAtributos);
  Application.CreateForm(TfrmGeColaboradores, frmGeColaboradores);
  Application.Run;
end.
