unit untADPrelGaps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DBCtrls, StdCtrls, Grids,
  DBGrids;

type
  TFRMGAPS = class(TForm)
    Label1: TLabel;
    edtPessoa: TEdit;
    gridNomes: TDBGrid;
    btnBuscar: TButton;
    listDatas: TDBLookupComboBox;
    Button1: TButton;
    gridCHA: TDBGrid;
    Chart1: TChart;
    procedure FormShow(Sender: TObject);
    procedure edtPessoaChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMGAPS: TFRMGAPS;

implementation

uses uClassGE_PESSOAS, uClassADP_AVALIACAO_TIPO, uClassADP_AVALIACOES, 
  uClassFP_ATRIBUTOS;

{$R *.dfm}

procedure TFRMGAPS.btnBuscarClick(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
  COMPETENCIA: TuClassAtributos;
begin
  // busca datas que colaborador foi avaliado e exibe opcoes
  AVA := TuClassADP_AVALIACOES.Create;
  COMPETENCIA := TuClassAtributos.Create;
  TRY
    // aqui ver como deixar as competencias relacionadas ao cargo do colaborador com
    gridCHA.DataSource := COMPETENCIA.Consultar('');
    listDatas.ListSource := ava.ListarAvaliacoes('ADP_AVALIACOES.PESSOA_COD='+gridNomes.Columns[0].Field.AsString);
  FINALLY
    AVA.FREE;
    COMPETENCIA.FREE;
  END;
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
