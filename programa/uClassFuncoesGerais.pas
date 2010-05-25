unit uClassFuncoesGerais;

interface

Uses ADODB, DB, SysUtils;

Type
  TuClassFuncoesGerais = class

    private

    public

    function UltimoID(Tabela,Campo:string):Integer;

  end;

implementation

uses uClassConexao;

{ TuClassFuncoesGerais }

function TuClassFuncoesGerais.UltimoID(Tabela, Campo: string): Integer;
var
  Qry: TADOQuery;
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
        begin
          Connection := TuClassConexao.ObtemConexao;
          Close;
          SQL.Text := 'select max('+Campo+') AS ULTIMO from '+Tabela+'';

          Open;

          if not IsEmpty then
            Result := Fields[0].AsInteger;

        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    raise exception.Create('Falha Catastrófica:'+e.Message);
  end;
end;

end.
