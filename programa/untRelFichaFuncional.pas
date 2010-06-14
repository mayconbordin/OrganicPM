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
    QryCargoscol_car_matricula: TIntegerField;
    QryCargosdata_inicial: TDateField;
    QryCargosdata_final: TDateField;
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

  rvFichaFuncional.Close;
  rvFichaFuncional.ExecuteReport('rpt_ficha');
  rvFichaFuncional.Open;


end;

end.
