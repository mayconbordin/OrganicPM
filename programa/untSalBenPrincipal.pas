unit untSalBenPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, jpeg, Buttons;

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
    btnFolhaPagamento: TSpeedButton;
    btnSaldoFerias: TSpeedButton;
    btnSimularFormulas: TSpeedButton;
    btnEventosContabeis: TSpeedButton;
    Consultas1: TMenuItem;
    InvestimentoemSalrio1: TMenuItem;
    procedure Cadastrodefrias1Click(Sender: TObject);
    procedure Folhadepagamento1Click(Sender: TObject);
    procedure Eventosdafolha1Click(Sender: TObject);
    procedure Eventoscontbeis1Click(Sender: TObject);
    procedure Saldodefrias1Click(Sender: TObject);
    procedure Ecentosdocolaborador1Click(Sender: TObject);
    procedure iposdefolhasdepagamento1Click(Sender: TObject);
    procedure Simularfrmulas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEventosContabeisClick(Sender: TObject);
    procedure btnSimularFormulasClick(Sender: TObject);
    procedure btnFolhaPagamentoClick(Sender: TObject);
    procedure btnSaldoFeriasClick(Sender: TObject);
    procedure InvestimentoemSalrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalBenPrincipal: TfrmSalBenPrincipal;

implementation

uses untSBCadastroFerias, untSBEventos, untSBEventosFolha, untSBFolhaPagamento,
  untSBSaldoFerias, untSBColaboradorEventos, untSBTiposFolhas, untSBSimulacao,
  uClassFuncoesGerais, untSBInvestimentosSalarios;



{$R *.dfm}

procedure TfrmSalBenPrincipal.Cadastrodefrias1Click(Sender: TObject);
begin
  frmSBCadastroFerias:= TfrmSBCadastroFerias.Create(Self);
  frmSBCadastroFerias.show;
end;

procedure TfrmSalBenPrincipal.Ecentosdocolaborador1Click(Sender: TObject);
begin
  frmSBColaboradorEvento := TfrmSBColaboradorEvento.Create(Self);
  frmSBColaboradorEvento.Show;
end;

procedure TfrmSalBenPrincipal.Eventoscontbeis1Click(Sender: TObject);
begin
  btnEventosContabeis.Click;
end;

procedure TfrmSalBenPrincipal.Eventosdafolha1Click(Sender: TObject);
begin
  frmSBEventosFolha:= TfrmSBEventosFolha.Create(Self);
  frmSBEventosFolha.show;
end;

procedure TfrmSalBenPrincipal.Folhadepagamento1Click(Sender: TObject);
begin
  btnFolhaPagamento.Click;
end;

procedure TfrmSalBenPrincipal.FormShow(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
begin
  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a tela principal de salários e benefícios');
  UTILS.Free;
end;

procedure TfrmSalBenPrincipal.InvestimentoemSalrio1Click(Sender: TObject);
begin
  frmSBInvestimentoSalario:= TfrmSBInvestimentoSalario.Create(Self);
  frmSBInvestimentoSalario.Show;
end;

procedure TfrmSalBenPrincipal.iposdefolhasdepagamento1Click(Sender: TObject);
begin
  frmSBTiposFolhas := TfrmSBTiposFolhas.Create(Self);
  frmSBTiposFolhas.Show;
end;

procedure TfrmSalBenPrincipal.Saldodefrias1Click(Sender: TObject);
begin
  btnSaldoFerias.Click;
end;

procedure TfrmSalBenPrincipal.Simularfrmulas1Click(Sender: TObject);
begin
  btnSimularFormulas.Click;
end;

procedure TfrmSalBenPrincipal.btnFolhaPagamentoClick(Sender: TObject);
begin
  frmSBFolhaPagamento := TfrmSBFolhaPagamento.Create(Self);
  frmSBFolhaPagamento.Show;
end;

procedure TfrmSalBenPrincipal.btnSaldoFeriasClick(Sender: TObject);
begin
  frmSBSaldoFerias:= TfrmSBSaldoFerias.Create(Self);
  frmSBSaldoFerias.Show;
end;

procedure TfrmSalBenPrincipal.btnSimularFormulasClick(Sender: TObject);
begin
  frmSBSimulacao:= TfrmSBSimulacao.Create(Self);
  frmSBSimulacao.Show;
end;

procedure TfrmSalBenPrincipal.btnEventosContabeisClick(Sender: TObject);
begin
  frmSBEventos := TfrmSBEventos.Create(Self);
  frmSBEventos.Show;
end;

end.
