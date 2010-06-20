unit untSalBenPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, jpeg;

type
  TfrmSalBenPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Manuteno1: TMenuItem;
    Folhadepagamento1: TMenuItem;
    Eventoscontbeis1: TMenuItem;
    Cadastrodefrias1: TMenuItem;
    Saldodefrias1: TMenuItem;
    Eventosdafolha1: TMenuItem;
    Ecentosdocolaborador1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Simularfrmulas1: TMenuItem;
    Image1: TImage;
    procedure Cadastrodefrias1Click(Sender: TObject);
    procedure Folhadepagamento1Click(Sender: TObject);
    procedure Eventosdafolha1Click(Sender: TObject);
    procedure Eventoscontbeis1Click(Sender: TObject);
    procedure Saldodefrias1Click(Sender: TObject);
    procedure Ecentosdocolaborador1Click(Sender: TObject);
    procedure iposdefolhasdepagamento1Click(Sender: TObject);
    procedure Simularfrmulas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalBenPrincipal: TfrmSalBenPrincipal;

implementation

uses untSBCadastroFerias, untSBEventos, untSBEventosFolha, untSBFolhaPagamento,
  untSBSaldoFerias, untSBColaboradorEventos, untSBTiposFolhas, untSBSimulacao;



{$R *.dfm}

procedure TfrmSalBenPrincipal.Cadastrodefrias1Click(Sender: TObject);
begin
  frmSBCadastroFerias.show;
end;

procedure TfrmSalBenPrincipal.Ecentosdocolaborador1Click(Sender: TObject);
begin
  frmSBColaboradorEvento.Show;
end;

procedure TfrmSalBenPrincipal.Eventoscontbeis1Click(Sender: TObject);
begin
  frmSBEventos.Show;
end;

procedure TfrmSalBenPrincipal.Eventosdafolha1Click(Sender: TObject);
begin
  frmSBEventosFolha.show;
end;

procedure TfrmSalBenPrincipal.Folhadepagamento1Click(Sender: TObject);
begin
  frmSBFolhaPagamento.Show;
end;

procedure TfrmSalBenPrincipal.iposdefolhasdepagamento1Click(Sender: TObject);
begin
  frmSBTiposFolhas.Show;
end;

procedure TfrmSalBenPrincipal.Saldodefrias1Click(Sender: TObject);
begin
  frmSBSaldoFerias.Show;
end;

procedure TfrmSalBenPrincipal.Simularfrmulas1Click(Sender: TObject);
begin
  frmSBSimulacao.Show;
end;

end.
