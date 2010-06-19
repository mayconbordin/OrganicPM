unit uClassTdRelatorios;

interface

Uses ADODB, DB, SysUtils, Controls;

Type
  TuClassTdRelatorios = class

  private

  public

    function TurmasTreinamentos(IdTreinamento:string): TDataSource;

  end;

implementation

uses uClassConexao;

{ TuntTDRelatorios }

function TuClassTdRelatorios.TurmasTreinamentos(
  IdTreinamento: string): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil);
    ds := TDataSource.Create(nil);
    with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao;
        Close;
        SQL.Text := 'select nome, data_inicial, data_final from td_turmas '+
                    'inner join td_turmas_treinamentos on (td_turmas.turma_cod = td_turmas_treinamentos.turma_cod) '+
                    'where (td_turmas_treinamentos.treinamento_cod = :pCod)';

        Parameters.ParamByName('pCod').Value := IdTreinamento;
        Open;
      end;

    ds.DataSet := Qry;
    Result := ds;

  except on E: Exception do
    raise exception.Create('Falha Catastrófica: '+e.Message);
  end;
end;

end.
