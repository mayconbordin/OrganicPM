unit untAvaliacaoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, RpRender, RpRenderPDF, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, WideStrings, FMTBcd, SqlExpr, DB, Provider,
  DBClient;

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
    RvPrjAva: TRvProject;
    RvSysAva: TRvSystem;
    RvDsAva: TRvDataSetConnection;
    RvDsTipo: TRvDataSetConnection;
    Imprimir1: TMenuItem;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet2: TSQLDataSet;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    procedure Indicadores1Click(Sender: TObject);
    procedure Potencialidades1Click(Sender: TObject);
    procedure ipoAvaliao1Click(Sender: TObject);
    procedure Avaliaes1Click(Sender: TObject);
    procedure AvaliaoFuncionrios1Click(Sender: TObject);
    procedure HistricoColaborador1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvalicaoPrincipal: TfrmAvalicaoPrincipal;

implementation

uses untADP_Indicadores, uClassADP_INDICADORES, uClassADP_AVALIACAO_TIPO,
  untADP_Tipos_Avaliacao, untADP_Avaliacao, untADPRelDesempenhoColaborador,
  untADPrelGaps;

{$R *.dfm}

procedure TfrmAvalicaoPrincipal.Avaliaes1Click(Sender: TObject);
begin
// manutencao de avaliacoes
  frmAvaliacao.Show;
end;

procedure TfrmAvalicaoPrincipal.AvaliaoFuncionrios1Click(Sender: TObject);
begin
// relatorio desempenho de uma competencia
  frmRelDesempenhoColaborador.show;
end;

procedure TfrmAvalicaoPrincipal.HistricoColaborador1Click(Sender: TObject);
var
  INDICADORES: TuClassADP_INDICADORES;
  TIPO: TuClassADP_AVALIACAO_TIPO;
begin
  // Busca indicadores no banco
  INDICADORES := TuClassADP_INDICADORES.Create;
  TIPO := TuClassADP_AVALIACAO_TIPO.Create;
  try
    // Configura componentes Rave
    RvSysAva.TitleSetup := 'Opções de Impressão';
    RvSysAva.TitleStatus := 'Status da Impressão';
    RvSysAva.TitlePreview := 'Previsão da Ficha de Avaliação';
    RvDsAva.DataSet := INDICADORES.Consultar('').DataSet;
    RvDsTipo.DataSet := TIPO.Consultar('').DataSet;
  finally
    INDICADORES.Free;
    TIPO.Free;
  end;
  // Exibe relatório
  try
    RvPrjAva.ExecuteReport('rptAvaliacoes');
  except on e:exception do
    ShowMessage('Erro. '+e.Message);
  end;
end;

procedure TfrmAvalicaoPrincipal.Indicadores1Click(Sender: TObject);
begin
  frmADP_Indicadores.Show;
end;

procedure TfrmAvalicaoPrincipal.ipoAvaliao1Click(Sender: TObject);
begin
  frmAvaTipo.show;
end;

procedure TfrmAvalicaoPrincipal.Potencialidades1Click(Sender: TObject);
begin
  // grafico GAPS
  FRMGAPS.SHOW;

end;

end.
