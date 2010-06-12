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
    procedure Avaliaes1Click(Sender: TObject);
    procedure ipoAvaliao1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvalicaoPrincipal: TfrmAvalicaoPrincipal;

implementation

uses untADP_Indicadores, untADP_Avaliacao, untADP_Tipos_Avaliacao;

{$R *.dfm}

procedure TfrmAvalicaoPrincipal.Avaliaes1Click(Sender: TObject);
begin
  FRMavaliacao.show;
end;

procedure TfrmAvalicaoPrincipal.Indicadores1Click(Sender: TObject);
begin
  frmADP_Indicadores.Show;
end;

procedure TfrmAvalicaoPrincipal.ipoAvaliao1Click(Sender: TObject);
begin
  frmAvaTipo.Show;
end;

end.
