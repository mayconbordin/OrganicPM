unit untADPRelDesempenhoColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, ExtCtrls, TeeProcs, TeEngine,
  Chart, DBChart, Series, DB, DBClient, FMTBcd, WideStrings, Provider, SqlExpr,
  ADODB;

type
  TfrmRelDesempenhoColaborador = class(TForm)
    Label1: TLabel;
    edtPessoa: TEdit;
    gridNomes: TDBGrid;
    btnBuscar: TButton;
    listDatas: TDBLookupComboBox;
    btnPrint: TButton;
    gridCHA: TDBGrid;
    DBChart1: TDBChart;
    DBGrid1: TDBGrid;
    Series1: TBarSeries;
    Button1: TButton;
    procedure edtPessoaChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnUltimaClick(Sender: TObject);
    procedure gridCHACellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelDesempenhoColaborador: TfrmRelDesempenhoColaborador;

implementation

uses uClassGE_PESSOAS, uClassADP_AVALIACOES, uClassADP_INDICADORES,
  uClassFP_ATRIBUTOS, uClassConexao;

{$R *.dfm}

procedure TfrmRelDesempenhoColaborador.btnBuscarClick(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
  COMPETENCIA: TuClassAtributos;
begin
  // busca datas que colaborador foi avaliado e exibe opcoes
  AVA := TuClassADP_AVALIACOES.Create;
  COMPETENCIA := TuClassAtributos.Create;
  TRY
    gridCHA.DataSource := COMPETENCIA.Consultar('');
    listDatas.ListSource := ava.ListarAvaliacoes('ADP_AVALIACOES.PESSOA_COD='+gridNomes.Columns[0].Field.AsString);
  FINALLY
    AVA.FREE;
    COMPETENCIA.FREE;
  END;
end;

procedure TfrmRelDesempenhoColaborador.btnPrintClick(Sender: TObject);
begin
  DBChart1.Print;
end;

procedure TfrmRelDesempenhoColaborador.btnUltimaClick(Sender: TObject);
begin
  // monta grafico
  
end;

procedure TfrmRelDesempenhoColaborador.Button1Click(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
  i:integer;
  x: TDataSet;
begin
  AVA := TuClassADP_AVALIACOES.Create;
  try
    try
      x := ava.NotasPorCompetencia(gridNomes.Columns[0].Field.AsString,datetostr(listDatas.KeyValue),gridcha.Columns[0].Field.AsString).DataSet;
      x.First;
      DBGrid1.DataSource := ava.NotasPorCompetencia(gridNomes.Columns[0].Field.AsString,datetostr(listDatas.KeyValue),gridcha.Columns[0].Field.AsString);
//      i:=0;
      WITH DBChart1.Series[0] DO
      BEGIN
        DataSource := x;
        XLabelsSource := 'TIPO';
        XValues.DateTime := false;
        XValues.Name := 'TIPO';
        YValues.ValueSource := 'NOTA';
        YValues.DateTime := False;
        YValues.Name := 'NOTA';
        CheckDataSource;
//        while not x.eof do
//        begin
//          AddY(3,'teste',1);
//          x.Next;
//          i:=i+1;
//        end;
        //ShowMessage(gridNomes.Columns[0].Field.AsString+'-'+datetostr(listDatas.KeyValue)+'-'+gridcha.Columns[0].Field.AsString);
      END;

    except on e:exception do
      ShowMessageUser('Erro. '+e.Message);
    end;
  finally
    AVA.Free;
  end;
end;

procedure TfrmRelDesempenhoColaborador.edtPessoaChange(Sender: TObject);
var
  PESSOA: TuClassGE_PESSOAS;
begin
  // busca pessoa pelo nome
  PESSOA := TuClassGE_PESSOAS.Create;
  try
    if Length(edtPessoa.Text) > 0 then
       gridNomes.DataSource := PESSOA.Consultar(' UPPER(GE_PESSOAS.NOME) LIKE '''+UpperCase(edtPessoa.Text)+'%''')
    else
      gridNomes.DataSource := PESSOA.Consultar('');
  finally
    PESSOA.Free;
  end;
end;

procedure TfrmRelDesempenhoColaborador.gridCHACellClick(Column: TColumn);
begin
//  AVA := TuClassADP_AVALIACOES.Create;
//  try
//    WITH DBChart1.Series[0] DO
//    BEGIN
//      DataSource := ava.NotasPorCompetencia(gridNomes.Columns[0].Field.AsString,
//      listDatas.Field.AsString,gridcha.Columns[0].Field.AsString);
//      XLabelsSource := 'TIPO';
//      XValues.DateTime := false;
//      XValues.Name := 'TIPO';
//      YValues.ValueSource := 'NOTA';
//      YValues.DateTime := False;
//      YValues.Name := 'NOTA';
//      CheckDataSource;
//      ShowMessage(gridNomes.Columns[0].Field.AsString+'-'+listDatas.Field.AsString+'-'+gridcha.Columns[0].Field.AsString);
//    END;
//  finally
//    AVA.Free;
//  end;
end;

end.
