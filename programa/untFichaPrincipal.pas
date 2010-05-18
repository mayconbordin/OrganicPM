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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaPrincipal: TfrmFichaPrincipal;

implementation

{$R *.dfm}

end.
