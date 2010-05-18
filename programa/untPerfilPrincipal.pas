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
    procedure Cargos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerfilPrincipal: TfrmPerfilPrincipal;

implementation

uses untFpCargos;

{$R *.dfm}

procedure TfrmPerfilPrincipal.Cargos1Click(Sender: TObject);
begin
  frmFpCargos := TfrmFpCargos.Create(nil);
  frmFpCargos.ShowModal;
end;

end.
