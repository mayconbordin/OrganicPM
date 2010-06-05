unit untAvaliacaoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TfrmAvalicaoPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Manutenao1: TMenuItem;
    Label1: TLabel;
    Indicadores1: TMenuItem;
    Avaliaes1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvalicaoPrincipal: TfrmAvalicaoPrincipal;

implementation

{$R *.dfm}

end.
