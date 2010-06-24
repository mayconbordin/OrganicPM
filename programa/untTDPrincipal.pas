unit untTDPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TfrmTDPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Manuteno1: TMenuItem;
    Label1: TLabel;
    reinamentos1: TMenuItem;
    urmas1: TMenuItem;
    Instrutores1: TMenuItem;
    Objetivos1: TMenuItem;
    Ambientes1: TMenuItem;
    Recursos1: TMenuItem;
    cnicas1: TMenuItem;
    Mtodos1: TMenuItem;
    Resultados1: TMenuItem;
    ResultadosObtidos1: TMenuItem;
    Vinculao1: TMenuItem;
    RecursosAmbientes1: TMenuItem;
    urmasTreinandos1: TMenuItem;
    cnicasMtodos1: TMenuItem;
    reinamentos2: TMenuItem;
    procedure Recursos1Click(Sender: TObject);
    procedure Resultados1Click(Sender: TObject);
    procedure Instrutores1Click(Sender: TObject);
    procedure Ambientes1Click(Sender: TObject);
    procedure urmas1Click(Sender: TObject);
    procedure cnicas1Click(Sender: TObject);
    procedure Objetivos1Click(Sender: TObject);
    procedure Mtodos1Click(Sender: TObject);
    procedure reinamentos1Click(Sender: TObject);
    procedure ResultadosObtidos1Click(Sender: TObject);
    procedure RecursosAmbientes1Click(Sender: TObject);
    procedure urmasTreinandos1Click(Sender: TObject);
    procedure cnicasMtodos1Click(Sender: TObject);
    procedure reinamentos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDPrincipal: TfrmTDPrincipal;

implementation

uses untTDRecursos, untTDResultados, untTDInstrutores, untTDAmbiente,
  untTDTurmas, untTDTecnicas, untTDObjetivos, untTDMetodos, untTDTreinamentos,
  untTDResultadosObtidos, untTDVincrecursosambientes, untTDVincturmastreinandos,
  untTDVinctecnicasmetodos, untTDVincTreinamentos;

{$R *.dfm}

procedure TfrmTDPrincipal.Ambientes1Click(Sender: TObject);
begin
  frmTDAmbiente := TfrmTDAmbiente.Create(self);
  frmTDAmbiente.ShowModal;

end;

procedure TfrmTDPrincipal.cnicas1Click(Sender: TObject);
begin
  frmTDTecnicas := TfrmTDTecnicas.Create(self);
  frmTDTecnicas.ShowModal;
end;

procedure TfrmTDPrincipal.cnicasMtodos1Click(Sender: TObject);
begin
  frmTDVinctecnicasmetodos := TfrmTDVinctecnicasmetodos.Create(self);
  frmTDVinctecnicasmetodos.ShowModal;
end;

procedure TfrmTDPrincipal.Instrutores1Click(Sender: TObject);
begin
  frmTDInstrutores := TfrmTDInstrutores.Create(self);
  frmTDInstrutores.ShowModal;
end;

procedure TfrmTDPrincipal.Mtodos1Click(Sender: TObject);
begin
  frmTDMetodos := TfrmTDMetodos.Create(self);
  frmTDMetodos.ShowModal;
end;

procedure TfrmTDPrincipal.Objetivos1Click(Sender: TObject);
begin
  frmTDObjetivos := TfrmTDObjetivos.Create(self);
  frmTDObjetivos.ShowModal;
end;

procedure TfrmTDPrincipal.Recursos1Click(Sender: TObject);
begin
  frmTDRecursos := TfrmTDRecursos.Create(self);
  frmTDRecursos.ShowModal;
end;

procedure TfrmTDPrincipal.RecursosAmbientes1Click(Sender: TObject);
begin
   frmTDVincrecursosAmbientes := TfrmTDVincrecursosAmbientes.Create(self);
   frmTDVincrecursosAmbientes.ShowModal;
end;

procedure TfrmTDPrincipal.reinamentos1Click(Sender: TObject);
begin
  frmTDTreinamentos := TfrmTDTreinamentos.Create(self);
  frmTDTreinamentos.ShowModal;
end;

procedure TfrmTDPrincipal.reinamentos2Click(Sender: TObject);
begin
  frmTDVincTreinamentos := TfrmTDVincTreinamentos.Create(self);
  frmTDVincTreinamentos.ShowModal;
end;

procedure TfrmTDPrincipal.Resultados1Click(Sender: TObject);
begin
  frmTDResultados := TfrmTDResultados.Create(self);
  frmTDResultados.ShowModal;
end;

procedure TfrmTDPrincipal.ResultadosObtidos1Click(Sender: TObject);
begin
  frmResultadosObtidos := TfrmResultadosObtidos.Create(self);
  frmResultadosObtidos.ShowModal;
end;

procedure TfrmTDPrincipal.urmas1Click(Sender: TObject);
begin
  frmTDTurmas := TfrmTDTurmas.Create(self);
  frmTDTurmas.ShowModal;
end;

procedure TfrmTDPrincipal.urmasTreinandos1Click(Sender: TObject);
begin
  frmTDVincturmastreinandos := TfrmTDVincturmastreinandos.Create(self);
  frmTDVincturmastreinandos.ShowModal;
end;

end.
