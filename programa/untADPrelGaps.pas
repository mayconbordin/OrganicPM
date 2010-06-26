unit untADPrelGaps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DBCtrls, StdCtrls, Grids,
  DBGrids, Series, DBChart;

type
  TFRMGAPS = class(TForm)
    Label1: TLabel;
    edtPessoa: TEdit;
    gridNomes: TDBGrid;
    btnBuscar: TButton;
    listDatas: TDBLookupComboBox;
    Button1: TButton;
    gridCHA: TDBGrid;
    DBChart1: TDBChart;
    Label2: TLabel;
    lblcargo: TLabel;
    grid2: TDBGrid;
    Label3: TLabel;
    Series1: TBarSeries;
    procedure FormShow(Sender: TObject);
    procedure edtPessoaChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMGAPS: TFRMGAPS;

implementation

uses uClassGE_PESSOAS, uClassADP_AVALIACAO_TIPO, uClassADP_AVALIACOES, 
  uClassFP_ATRIBUTOS, uClassGE_COLABORADORES_CARGO, DB,
  uClassFP_ATRIBUTOS_CARGOS, DBClient, uClassFP_CARGOS;

{$R *.dfm}

procedure TFRMGAPS.btnBuscarClick(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
begin
  // busca datas que colaborador foi avaliado e exibe opcoes
  AVA := TuClassADP_AVALIACOES.Create;
  TRY
    listDatas.ListSource := ava.ListarAvaliacoes('ADP_AVALIACOES.PESSOA_COD='+gridNomes.Columns[0].Field.AsString);
  FINALLY
    AVA.FREE;
  END;
end;

procedure TFRMGAPS.Button1Click(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
  COMPETENCIA: TuClassAtributos;
  CARGOC: TuClassGE_COLABORADORES_CARGO;
  C: TuClassCargos;
  A: TuClassFP_ATRIBUTOS_CARGOS;
  codPessoa, Cargo, condicao:String;
  d, d2, dsC, dsA: TDataSource;
  ds: tdataSet;
  cds, cdsm: TClientDataSet;
  I: INTEGER;
  MEDIA, GAP: DOUBLE;
begin
  C := TuClassCargos.Create;
  AVA := TuClassADP_AVALIACOES.Create;
  COMPETENCIA := TuClassAtributos.Create;
  CARGOC := TuClassGE_COLABORADORES_CARGO.Create;
  d := TDataSource.Create(nil);
  d2 := TDataSource.Create(nil);
  dsc := TDataSource.Create(nil);
  dsa := TDataSource.Create(nil);
  CDS := TClientDataSet.Create(nil);
  CDSM := TClientDataSet.Create(nil);
  try
    codPessoa := gridNomes.Columns[0].Field.AsString;
    // BUSCA CARGO DO COLABORADOR
    condicao := 'GE_COLABORADORES_CARGO.PESSOA_COD='+codPessoa+' AND GE_COLABORADORES_CARGO.STATUS=''A''';
    dsc := cargoc.Consultar(condicao);
    C.PCARGO_COD :=dsc.DataSet.FieldByName('CARGO_COD').AsInteger;
    C.Carregar;
    lblcargo.Caption := C.PDESCRICAO;
    if dsc.DataSet.RecordCount > 0 then
    begin
      // BUSCA COMPETENCIAS RELACIONADAS AO CARGO (DESEMPENHO) DO COLABORADOR
      condicao := 'FP_ATRIBUTOS_CARGOS.CARGO_COD='+dsc.DataSet.FieldByName('CARGO_COD').AsString;
      dsa := a.Consultar(condicao);
      if dsa.DataSet.RecordCount > 0 then
      begin
        // cria cds off para armazenar dados
        CDS.Close;
        cds.FieldDefs.Clear; // cria campos no cds off
        cds.FieldDefs.Add('ATRIBUTO_COD',ftString,4,false);
        cds.FieldDefs.Add('DESCRICAO',ftString,200,false);
        cds.FieldDefs.Add('NOTA_CARGO',ftString,5,false);
        cds.FieldDefs.Add('MEDIA',ftString,5,false);
        cds.FieldDefs.Add('GAP',ftString,5,false);
        cds.CreateDataSet;
        CDS.Open;
        CDSM.Close;
        CDSM.FieldDefs.Clear; // cria campos no CDSM off
        CDSM.FieldDefs.Add('ATRIBUTO_COD',ftString,4,false);
        CDSM.FieldDefs.Add('DESCRICAO',ftString,200,false);
        CDSM.FieldDefs.Add('NOTA_CARGO',ftString,5,false);
        CDSM.FieldDefs.Add('MEDIA',ftString,5,false);
        CDSM.FieldDefs.Add('GAP',ftString,5,false);
        CDSM.CreateDataSet;
        CDSM.Open;
        // AQUI TEMOS NO DSA COMPETENCIAS DE DESEMPENHO E NOTA DESEJADA PARA O CARGO  E CDS OFF CRIADO
        dsa.DataSet.First;
        while not dsa.DataSet.Eof do
        begin
          // busca dados da avaliacao selecionada
          if datetostr(listDatas.KeyValue) <> '' then
          begin
            // busca notas da avaliacao selecionada na data
            ds := ava.NotasPorCompetencia(codPessoa,datetostr(listDatas.KeyValue),dsa.DataSet.FieldByName('ATRIBUTO_COD').AsString).DataSet;
            MEDIA := 0;
            i:= ds.RecordCount;
            // calcula a media das medias por indicador agrupadas por tipo para esta competencia
            ds.First;
            for I := 0 to ds.RecordCount - 1 do
            begin
              if ds.FieldByName('NOTA').AsString <> '' then
              begin
                MEDIA := MEDIA + ds.FieldByName('NOTA').AsFloat;
              end;
              ds.next;
            end;
            // divide pelo num de tipoavaliacoes para ter a media geral da competencia
            MEDIA := MEDIA/i;
            GAP := dsa.DataSet.FieldByName('NOTA_CARGO').AsFloat - MEDIA;
            // ADICIONA DADOS DA COPETENCIA, SUA NOTA MÉDIA E GAP NO CDS
            if GAP > 0 then
            BEGIN
              // ADD NO CDS OS GAPS
              with cds do
              begin
                Append;
                FieldByName('ATRIBUTO_COD').AsString := dsa.DataSet.FieldByName('ATRIBUTO_COD').AsString;
                COMPETENCIA.PATRIBUTO_COD := dsa.DataSet.FieldByName('ATRIBUTO_COD').AsInteger;
                COMPETENCIA.Carregar;
                FieldByName('DESCRICAO').AsString := COMPETENCIA.PDESCRICAO;
                FieldByName('NOTA_CARGO').AsString := dsa.DataSet.FieldByName('NOTA_CARGO').AsString;
                FieldByName('MEDIA').AsString := FLOATTOSTR(MEDIA);
                FieldByName('GAP').AsString := FLOATTOSTR(GAP);
                Post;
              end;
            END ELSE BEGIN
              // ADD NO CDSM PARA EXIBIR O QUE O FUNCIONARIO TEM "SOBRANDO"
              with cdsM do
              begin
                Append;
                FieldByName('ATRIBUTO_COD').AsString := dsa.DataSet.FieldByName('ATRIBUTO_COD').AsString;
                COMPETENCIA.PATRIBUTO_COD := dsa.DataSet.FieldByName('ATRIBUTO_COD').AsInteger;
                COMPETENCIA.Carregar;
                FieldByName('DESCRICAO').AsString := COMPETENCIA.PDESCRICAO;
                FieldByName('NOTA_CARGO').AsString := dsa.DataSet.FieldByName('NOTA_CARGO').AsString;
                FieldByName('MEDIA').AsString := FLOATTOSTR(MEDIA);
                FieldByName('GAP').AsString := FLOATTOSTR(GAP);
                Post;
              end;
            END;
          end;
          dsa.DataSet.Next;
        end;
        cds.First;
        cdsm.First;
        // EXIBE NO GRÁFICO
        WITH DBChart1.Series[0] DO
        BEGIN
          DataSource := cds;
          XLabelsSource := 'DESCRICAO';
          XValues.DateTime := false;
          XValues.Name := 'DESCRICAO';
          YValues.ValueSource := 'GAP';
          YValues.DateTime := False;
          YValues.Name := 'GAP';
          CheckDataSource;
        END;
        d.DataSet := cds;
        d2.DataSet := cdsm;
        grid2.DataSource := d2;
        gridCHA.DataSource := d;
      end;
    end;
  finally
    AVA.Free;
    COMPETENCIA.Free;
    CARGOC.Free;
    a.free;
    C.FREE;
  end;
end;

procedure TFRMGAPS.edtPessoaChange(Sender: TObject);
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

procedure TFRMGAPS.FormShow(Sender: TObject);
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

end.
