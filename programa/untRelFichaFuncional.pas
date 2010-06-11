unit untRelFichaFuncional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, RpCon, RpConDS, RpRave, RpDefine,
  RpBase, RpSystem, FMTBcd, DBClient, Provider, DB, SqlExpr, ADODB, DBTables;

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
    sqlColaborador: TSQLDataSet;
    dspColaborador: TDataSetProvider;
    cdsColaborador: TClientDataSet;
    ADOQuery1: TADOQuery;
    ADOQuery1NOME: TStringField;
    ADOQuery1DATA_ADMISSAO: TDateField;
    cdsColaboradorNOME: TStringField;
    cdsColaboradorDATA_ADMISSAO: TDateField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    sqlColaboradorNOME: TStringField;
    sqlColaboradorDATA_ADMISSAO: TDateField;
    procedure edtPesquisaChange(Sender: TObject);
    procedure gridDadosDblClick(Sender: TObject);
    procedure RvDsColaboradorFirst(Connection: TRvCustomConnection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFichaFuncional: TfrmRelFichaFuncional;

implementation

uses uClassGE_COLABORADORES, uClassConexao, ubtDmConexaoRelatorios;

{$R *.dfm}

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
  ADOQuery1.Connection := TuClassConexao.ObtemConexao;
  ADOQuery1.Close;
  ADOQuery1.Connection.Connected := True;
  ADOQuery1.Parameters.ParamByName('pCod').Value := 5;
  ADOQuery1.Open;

//  with DataModule1.Conexao do
//    begin
//      Close;
// Carrega variáveis conexao
//      ConnectionName := 'Conexao';
//      Params.Values['DriverName'] := 'Oracle';
//      Params.Values['DataBase'] := 'localhost';
//      Params.Values['User_Name'] := 'organic_pm';
//      Params.Values['Password'] := 'pratica';
//      Open;
//      Connected := True;
//    end;

//  rvFichaFuncional.Close;
//  cdsColaborador.Close;
//  cdsColaborador.Params[0].AsInteger := 5;
//  cdsColaborador.Open;

  rvFichaFuncional.ExecuteReport('rpt_ficha',);
  rvFichaFuncional.Open;


  DataSource1.DataSet.Open;
end;

procedure TfrmRelFichaFuncional.RvDsColaboradorFirst(
  Connection: TRvCustomConnection);
begin
  ShowMessage('Chupa');
end;

end.
