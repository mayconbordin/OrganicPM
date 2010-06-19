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
    Relatrios1: TMenuItem;
    urmas2: TMenuItem;
    procedure Recursos1Click(Sender: TObject);
    procedure Resultados1Click(Sender: TObject);
    procedure Instrutores1Click(Sender: TObject);
    procedure Ambientes1Click(Sender: TObject);
    procedure urmas1Click(Sender: TObject);
    procedure cnicas1Click(Sender: TObject);
    procedure Objetivos1Click(Sender: TObject);
    procedure Mtodos1Click(Sender: TObject);
    procedure reinamentos1Click(Sender: TObject);
    procedure urmas2Click(Sender: TObject);
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
  uClassTdRelatorios, untTdRelTurmas;

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

procedure TfrmTDPrincipal.reinamentos1Click(Sender: TObject);
begin
  frmTDTreinamentos := TfrmTDTreinamentos.Create(self);
  frmTDTreinamentos.ShowModal;
end;

procedure TfrmTDPrincipal.Resultados1Click(Sender: TObject);
begin
  frmTDResultados := TfrmTDResultados.Create(self);
  frmTDResultados.ShowModal;
end;

procedure TfrmTDPrincipal.urmas1Click(Sender: TObject);
begin
  frmTDTurmas := TfrmTDTurmas.Create(self);
  frmTDTurmas.ShowModal;
end;

procedure TfrmTDPrincipal.urmas2Click(Sender: TObject);
begin
  frmTdRelTurmas := TfrmTdRelTurmas.Create(self);
  frmTdRelTurmas.ShowModal;
end;

end.
