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
    gridCHA: TDBGrid;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Button1: TButton;
    procedure edtPessoaChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnUltimaClick(Sender: TObject);
    procedure gridCHACellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelDesempenhoColaborador: TfrmRelDesempenhoColaborador;

implementation

uses uClassGE_PESSOAS, uClassADP_AVALIACOES, uClassADP_INDICADORES,
  uClassFP_ATRIBUTOS, uClassConexao, uClassFP_ATRIBUTOS_CARGOS,
  uClassGE_COLABORADORES, uClassGE_COLABORADORES_CARGO;

{$R *.dfm}

procedure TfrmRelDesempenhoColaborador.btnBuscarClick(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
  COMPETENCIA: TuClassAtributos;
  ds: TDataSet;
  cds: TClientDataSet;
  d: TDataSource;
  codPessoa,c:string;
begin
  cds := TClientDataSet.Create(nil);
  d := TDataSource.Create(nil);
  codPessoa := gridNomes.Columns[0].Field.AsString;
  // busca datas que colaborador foi avaliado e exibe opcoes
  AVA := TuClassADP_AVALIACOES.Create;
  COMPETENCIA := TuClassAtributos.Create;
  TRY
    // busca todas competencias
    ds := COMPETENCIA.Consultar('').DataSet;
    ds.First;
    // cria cds para montar dados
    CDS.Close;
    cds.FieldDefs.Clear;
    cds.FieldDefs.Add('DP',ftString,20,false);
    cds.FieldDefs.Add('DESCRICAO',ftString,300,false);
    cds.FieldDefs.Add('ATRIBUTO_COD',ftString,5,false);
    cds.CreateDataSet;
    cds.Open;
    // verifica quais sao relacionadas ao cargo e marca como desempenho, outras sao potencial
    while not ds.Eof do
    begin
      cds.Append;
      c := ds.FieldByName('ATRIBUTO_COD').AsString;
      if ava.CompetenciaPertenceCargoPessoa(codPessoa,c) then
      begin
        cds.FieldByName('DP').AsString := 'Desempenho';
      end else begin
        cds.FieldByName('DP').AsString := 'Potencial';
      end;
      cds.FieldByName('DESCRICAO').AsString := ds.FieldByName('DESCRICAO').AsString;
      cds.FieldByName('ATRIBUTO_COD').AsString := c;
      cds.Post;
      ds.Next;
    end;
    CDS.First;
    d.DataSet := cds;
    gridCHA.DataSource := d;
    listDatas.ListSource := ava.ListarAvaliacoes('ADP_AVALIACOES.PESSOA_COD='+codPessoa);
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
  ac: TuClassFP_ATRIBUTOS_CARGOS;
  ds,ds2: TDataSet;
  cc: TuClassGE_COLABORADORES_CARGO;
  cds, cdsm: TClientDataSet;
  media:DOUBLE;
  i:integer;
begin
  AVA := TuClassADP_AVALIACOES.Create;
  ac := TuClassFP_ATRIBUTOS_CARGOS.Create;
  cc := TuClassGE_COLABORADORES_CARGO.create;
  CDS := TClientDataSet.Create(nil);
  CDSm := TClientDataSet.Create(nil);
  try
    try
      if datetostr(listDatas.KeyValue) <> '' then
      begin
        ds := ava.NotasPorCompetencia(gridNomes.Columns[0].Field.AsString,datetostr(listDatas.KeyValue),gridcha.Columns[2].Field.AsString).DataSet;
        CDS.Close;
        cds.FieldDefs.Clear;
        cds.FieldDefs.Add('TIPO',ftString,20,false);
        cds.FieldDefs.Add('NOTA',ftString,4,false);
        cds.CreateDataSet;
        CDS.Open;
        ds.First;
        while not ds.Eof do
        begin
          with cds do
          begin
            Append;
            FieldByName('TIPO').AsString := ds.FieldByName('TIPO').AsString;
            FieldByName('NOTA').AsString := ds.FieldByName('NOTA').AsString;
            Post;
          end;
          ds.Next;
        end;
        cdsm := cds;
        with cds do
        begin
          i:= CDSm.RecordCount;
          if i>0 then
          begin
            Append;
            FieldByName('TIPO').AsString := 'Média';
            // calcula a media das medias/indicador para esta competencia
            cdsm.First;
            media := 0;
            while not cdsm.Eof do
            begin
              // soma medias/indicador de todos tipos de avaliacoes da competencia
              media := cdsm.FieldByName('NOTA').AsFloat+MEDIA;
              cdsm.next;
            end;
            // divide pelo num de tipoavaliacoes para ter a media geral da competencia
            MEDIA := MEDIA/i;
            FieldByName('NOTA').AsString := FloatToStr(MEDIA);
            Post;
          end;
          Append;
          FieldByName('TIPO').AsString := 'Função';
          // busca a nota desejada pra funcao
          ds2 := cc.Consultar('GE_COLABORADORES_CARGO.PESSOA_COD='+gridNomes.Columns[0].Field.AsString+' AND GE_COLABORADORES_CARGO.STATUS=''A''').dataset;
          ac.PATRIBUTO_COD := gridcha.Columns[2].Field.AsString;
          ac.PCARGO_COD := ds2.FieldByName('CARGO_COD').AsString;
          ac.Carregar;
          FieldByName('NOTA').AsString := FloatToStr(ac.PNOTA_CARGO);
          Post;
        end;
        WITH DBChart1.Series[0] DO
        BEGIN
          DataSource := cds;
          XLabelsSource := 'TIPO';
          XValues.DateTime := false;
          XValues.Name := 'TIPO';
          YValues.ValueSource := 'NOTA';
          YValues.DateTime := False;
          YValues.Name := 'NOTA';
          CheckDataSource;
        END;
      end;
    except on e:exception do
      ShowMessageUser('Erro. '+e.Message);
    end;
  finally
    AVA.Free;
    ac.free;
    cc.free;
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

procedure TfrmRelDesempenhoColaborador.FormShow(Sender: TObject);
var
  PESSOA: TuClassGE_PESSOAS;
begin
  // exibe todos colaboradores
  PESSOA := TuClassGE_PESSOAS.Create;
  try
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
