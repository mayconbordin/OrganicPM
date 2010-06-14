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
    ipoAvaliao1: TMenuItem;
    Relatrios1: TMenuItem;
    AvaliaoFuncionrios1: TMenuItem;
    HistricoColaborador1: TMenuItem;
    Potencialidades1: TMenuItem;
    procedure Indicadores1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvalicaoPrincipal: TfrmAvalicaoPrincipal;

implementation

uses untADP_Indicadores;

{$R *.dfm}

procedure TfrmAvalicaoPrincipal.Indicadores1Click(Sender: TObject);
begin
  frmADP_Indicadores.Show;
end;

end.
