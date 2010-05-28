unit untPerfilPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TfrmPerfilPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Manuteno1: TMenuItem;
    Label1: TLabel;
    Cargos1: TMenuItem;
    CHA1: TMenuItem;
    Departamentos1: TMenuItem;
    iposdeCargo1: TMenuItem;
    procedure Cargos1Click(Sender: TObject);
    procedure CHA1Click(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure iposdeCargo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerfilPrincipal: TfrmPerfilPrincipal;

implementation

uses untFpCargos, untFpAtributos, untFpDepartamentos, untFpTiposCargo;

{$R *.dfm}

procedure TfrmPerfilPrincipal.Cargos1Click(Sender: TObject);
begin
  frmFpCargos := TfrmFpCargos.Create(nil);
  frmFpCargos.ShowModal;
end;

procedure TfrmPerfilPrincipal.CHA1Click(Sender: TObject);
begin
  frmFpAtributos := TfrmFpAtributos.Create(self);
  frmFpAtributos.ShowModal;
end;

procedure TfrmPerfilPrincipal.Departamentos1Click(Sender: TObject);
begin
  frmFpDepartamentos := TfrmFpDepartamentos.Create(self);
  frmFpDepartamentos.ShowModal;
end;

procedure TfrmPerfilPrincipal.iposdeCargo1Click(Sender: TObject);
begin
  frmFpTiposCargo := TfrmFpTiposCargo.Create(self);
  frmFpTiposCargo.ShowModal;
end;

end.
