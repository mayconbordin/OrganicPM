unit untFichaPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TfrmFichaPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Manuteno1: TMenuItem;
    Label1: TLabel;
    Colaboradores1: TMenuItem;
    Lanamentos1: TMenuItem;
    AtributosdosColaboradores1: TMenuItem;
    ColabDependentes1: TMenuItem;
    Relatrios1: TMenuItem;
    FichaFuncional1: TMenuItem;
    ColabCargos1: TMenuItem;
    ColabSalarios1: TMenuItem;
    ColabBenefcios1: TMenuItem;
    ColabAfastamentos1: TMenuItem;
    procedure Colaboradores1Click(Sender: TObject);
    procedure AtributosdosColaboradores1Click(Sender: TObject);
    procedure FichaFuncional1Click(Sender: TObject);
    procedure ColabDependentes1Click(Sender: TObject);
    procedure ColabCargos1Click(Sender: TObject);
    procedure ColabSalarios1Click(Sender: TObject);
    procedure ColabBenefcios1Click(Sender: TObject);
    procedure ColabAfastamentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaPrincipal: TfrmFichaPrincipal;

implementation

uses untGeColaboradores, untFpAtributosColaboradores, untRelFichaFuncional,
  untFpColaboradorDependentes, untGeColaboradoresCargo,
  untFpColaboradorSalarios, untFpColaboradorBeneficios,
  untFpColaboradorAfastamentos;

{$R *.dfm}

procedure TfrmFichaPrincipal.AtributosdosColaboradores1Click(Sender: TObject);
begin
  frmFpAtributosColaboradores := TfrmFpAtributosColaboradores.Create(self);
  frmFpAtributosColaboradores.ShowModal;
end;

procedure TfrmFichaPrincipal.ColabAfastamentos1Click(Sender: TObject);
begin
  frmFpColaboradorAfastamentos := TfrmFpColaboradorAfastamentos.Create(self);
  frmFpColaboradorAfastamentos.ShowModal;
end;

procedure TfrmFichaPrincipal.ColabBenefcios1Click(Sender: TObject);
begin
  frmFpColaboradoresBeneficios := TfrmFpColaboradoresBeneficios.Create(self);
  frmFpColaboradoresBeneficios.ShowModal;
end;

procedure TfrmFichaPrincipal.ColabCargos1Click(Sender: TObject);
begin
  frmGeColaboradoresCargo := TfrmGeColaboradoresCargo.Create(nil);
  frmGeColaboradoresCargo.ShowModal;
end;

procedure TfrmFichaPrincipal.ColabDependentes1Click(Sender: TObject);
begin
  frmFpColaboradoresDependentes := TfrmFpColaboradoresDependentes.Create(nil);
  frmFpColaboradoresDependentes.ShowModal;
end;

procedure TfrmFichaPrincipal.Colaboradores1Click(Sender: TObject);
begin
  frmGeColaboradores := TfrmGeColaboradores.Create(nil);
  frmGeColaboradores.ShowModal;
end;

procedure TfrmFichaPrincipal.ColabSalarios1Click(Sender: TObject);
begin
  frmFpColaboradorSalarios := TfrmFpColaboradorSalarios.Create(self);
  frmFpColaboradorSalarios.ShowModal;
end;

procedure TfrmFichaPrincipal.FichaFuncional1Click(Sender: TObject);
begin
  frmRelFichaFuncional := TfrmRelFichaFuncional.Create(nil);
  frmRelFichaFuncional.ShowModal;
end;

end.
