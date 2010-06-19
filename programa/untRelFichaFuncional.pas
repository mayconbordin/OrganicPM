unit untRelFichaFuncional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, RpCon, RpConDS, RpRave, RpDefine,
  RpBase, RpSystem, FMTBcd, DBClient, Provider, DB, SqlExpr, ADODB, DBTables,
  WideStrings;

type
  TfrmRelFichaFuncional = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    Label2: TLabel;
    gridDados: TDBGrid;
    RvsFichaFuncional: TRvSystem;
    rvFichaFuncional: TRvProject;
    RvDsColaborador: TRvDataSetConnection;
    QryColaborador: TADOQuery;
    QryColaboradorNOME: TStringField;
    QryColaboradorDATA_ADMISSAO: TDateField;
    DataSource1: TDataSource;
    QryDepend: TADOQuery;
    RvDsDepend: TRvDataSetConnection;
    QryDependNOME: TStringField;
    QryDependCPF: TStringField;
    RvDsCargos: TRvDataSetConnection;
    QryCargos: TADOQuery;
    QryCargosdescricao: TStringField;
    QryCargosdata_inicial: TDateField;
    QryCargosdata_final: TDateField;
    QrySalarios: TADOQuery;
    RvDsSalarios: TRvDataSetConnection;
    QrySalariosSALARIO_VALOR: TFloatField;
    QrySalariosSALARIO_DATA_ALTERACAO: TDateField;
    QrySalariosSTATUS: TStringField;
    QryBeneficios: TADOQuery;
    RvDsBeneficios: TRvDataSetConnection;
    QryBeneficiosDESCRICAO: TStringField;
    QryBeneficiosVALOR: TFloatField;
    QryBeneficiosDATA_INICIAL: TDateField;
    QryBeneficiosDATA_FINAL: TDateField;
    QryTreinamentos: TADOQuery;
    RvDsTreinamentos: TRvDataSetConnection;
    QryTreinamentosDESCRICAO: TStringField;
    QryAfastamentos: TADOQuery;
    RvDsAfastamentos: TRvDataSetConnection;
    QryAfastamentosMOTIVO: TStringField;
    QryAfastamentosDATA_INICIAL: TDateField;
    QryAfastamentosATESTADO: TStringField;
    QryAfastamentosDATA_FINAL: TDateField;
    QryFerias: TADOQuery;
    RvDsFerias: TRvDataSetConnection;
    QryFeriascad_fer_data_inicio: TDateField;
    QryFeriascad_fer_data_fim: TDateField;
    QryAtributos: TADOQuery;
    rvDsAtributos: TRvDataSetConnection;
    QryAtributosDESCRICAO: TStringField;
    QryAtributosTIPO: TStringField;
    QryTreinamentosEMENTA: TStringField;
    procedure edtPesquisaChange(Sender: TObject);
    procedure gridDadosDblClick(Sender: TObject);
    procedure cdsColaboradorAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFichaFuncional: TfrmRelFichaFuncional;

implementation

uses uClassGE_COLABORADORES, uClassConexao;

{$R *.dfm}

procedure TfrmRelFichaFuncional.cdsColaboradorAfterEdit(DataSet: TDataSet);
begin
  ShowMessage('chupa');
end;

procedure TfrmRelFichaFuncional.edtPesquisaChange(Sender: TObject);
var
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  if Length(edtPesquisa.Text) > 0 then
    begin
      COLABORADOR := TuClassGE_COLABORADORES.Create;
      try
        gridDados.DataSource := COLABORADOR.ConsultaPessoaColaborador('GE_PESSOAS.NOME LIKE ''%'+edtPesquisa.Text+'%''');
      finally
        COLABORADOR.Free;
      end;
    end;
  
end;

procedure TfrmRelFichaFuncional.gridDadosDblClick(Sender: TObject);
begin
  QryColaborador.Connection := TuClassConexao.ObtemConexao;
  QryColaborador.Close;
//  QryColaborador.Connection.Connected := True;
  QryColaborador.Parameters.ParamByName('pCod').Value := gridDados.Columns[0].Field.Value;
  QryColaborador.Open;

  QryDepend.Connection := TuClassConexao.ObtemConexao;
  QryDepend.Close;
  QryDepend.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryDepend.Open;

  QryCargos.Connection := TuClassConexao.ObtemConexao;
  QryCargos.Close;
  QryCargos.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryCargos.Open;

  QrySalarios.Connection := TuClassConexao.ObtemConexao;
  QrySalarios.Close;
  QrySalarios.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QrySalarios.Open;

  QryBeneficios.Connection := TuClassConexao.ObtemConexao;
  QryBeneficios.Close;
  QryBeneficios.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryBeneficios.Open;

  QryTreinamentos.Connection := TuClassConexao.ObtemConexao;
  QryTreinamentos.Close;
  QryTreinamentos.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryTreinamentos.Open;

  QryAfastamentos.Connection := TuClassConexao.ObtemConexao;
  QryAfastamentos.Close;
  QryAfastamentos.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryAfastamentos.Open;

  QryFerias.Connection := TuClassConexao.ObtemConexao;
  QryFerias.Close;
  QryFerias.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryFerias.Open;

  QryAtributos.Connection := TuClassConexao.ObtemConexao;
  QryAtributos.Close;
  QryAtributos.Parameters.ParamByName('pCod').value := gridDados.Columns[0].Field.Value;
  QryAtributos.Open;

  rvFichaFuncional.Close;
  rvFichaFuncional.ExecuteReport('rpt_ficha');
  rvFichaFuncional.Open;


end;

end.
