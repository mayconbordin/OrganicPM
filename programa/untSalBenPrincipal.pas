unit untSalBenPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TfrmSalBenPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Manuteno1: TMenuItem;
    Label1: TLabel;
    Cadastrodefrias1: TMenuItem;
    procedure Cadastrodefrias1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalBenPrincipal: TfrmSalBenPrincipal;

implementation

uses untSbCadastroFerias;

{$R *.dfm}

procedure TfrmSalBenPrincipal.Cadastrodefrias1Click(Sender: TObject);
begin
  frmSbCadastroFerias.Show;
end;

end.
