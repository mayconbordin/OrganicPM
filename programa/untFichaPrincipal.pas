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
    procedure Colaboradores1Click(Sender: TObject);
    procedure AtributosdosColaboradores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaPrincipal: TfrmFichaPrincipal;

implementation

uses untGeColaboradores, untFpAtributosColaboradores;

{$R *.dfm}

procedure TfrmFichaPrincipal.AtributosdosColaboradores1Click(Sender: TObject);
begin
  frmFpAtributosColaboradores := TfrmFpAtributosColaboradores.Create(self);
  frmFpAtributosColaboradores.ShowModal;
end;

procedure TfrmFichaPrincipal.Colaboradores1Click(Sender: TObject);
begin
  frmGeColaboradores := TfrmGeColaboradores.Create(nil);
  frmGeColaboradores.ShowModal;
end;

end.
