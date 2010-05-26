program organic_pm;

uses
  Forms,
  Lua in 'Lua.pas',
  uClassConexao in 'uClassConexao.pas',
  uClassFP_ATRIBUTOS in 'uClassFP_ATRIBUTOS.pas',
  uClassFP_CARGOS in 'uClassFP_CARGOS.pas',
  uClassFP_DEPARTAMENTOS in 'uClassFP_DEPARTAMENTOS.pas',
  uClassFP_TIPOS_CARGO in 'uClassFP_TIPOS_CARGO.pas',
  uClassFuncoesGerais in 'uClassFuncoesGerais.pas',
  uClassGE_COLABORADORES in 'uClassGE_COLABORADORES.pas',
  uClassGE_ESTADOS_CIVIS in 'uClassGE_ESTADOS_CIVIS.pas',
  uClassGE_PESSOAS in 'uClassGE_PESSOAS.pas',
  uClassGE_UNIDADES_FEDERATIVAS in 'uClassGE_UNIDADES_FEDERATIVAS.pas',
  uClassTiposCargo in 'uClassTiposCargo.pas',
  untAvaliacaoPrincipal in 'untAvaliacaoPrincipal.pas' {frmAvalicaoPrincipal},
  untFichaPrincipal in 'untFichaPrincipal.pas' {frmFichaPrincipal},
  untFpAtributos in 'untFpAtributos.pas' {frmFpAtributos},
  untFpCargos in 'untFpCargos.pas' {frmFpCargos},
  untGeColaboradores in 'untGeColaboradores.pas' {frmGeColaboradores},
  untModelo in 'untModelo.pas' {frmModelo},
  untPerfilPrincipal in 'untPerfilPrincipal.pas' {frmPerfilPrincipal},
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untRecrutPrincipal in 'untRecrutPrincipal.pas' {frmRecrutPrincipal},
  untSalBenPrincipal in 'untSalBenPrincipal.pas' {frmSalBenPrincipal},
  untTDPrincipal in 'untTDPrincipal.pas' {frmTDPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmModelo, frmModelo);
  Application.CreateForm(TfrmFpCargos, frmFpCargos);
  Application.CreateForm(TfrmAvalicaoPrincipal, frmAvalicaoPrincipal);
  Application.CreateForm(TfrmFichaPrincipal, frmFichaPrincipal);
  Application.CreateForm(TfrmFpAtributos, frmFpAtributos);
  Application.CreateForm(TfrmFpCargos, frmFpCargos);
  Application.CreateForm(TfrmGeColaboradores, frmGeColaboradores);
  Application.CreateForm(TfrmModelo, frmModelo);
  Application.CreateForm(TfrmPerfilPrincipal, frmPerfilPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRecrutPrincipal, frmRecrutPrincipal);
  Application.CreateForm(TfrmSalBenPrincipal, frmSalBenPrincipal);
  Application.CreateForm(TfrmTDPrincipal, frmTDPrincipal);
  Application.Run;
end.
