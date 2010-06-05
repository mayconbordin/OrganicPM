unit uClassADP_INDICADORES_CARGOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassADP_INDICADORES_CARGOS = class 

  private 
    FINDICADOR_COD: String; 
    FCARGO_COD: String; 
    procedure SetFINDICADOR_COD(const Value: String); 
    procedure SetFCARGO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PINDICADOR_COD: String read FINDICADOR_COD write SetFINDICADOR_COD; 
    property PCARGO_COD: String read FCARGO_COD write SetFCARGO_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassADP_INDICADORES_CARGOS.Consultar(Condicao: string): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil); 
    ds := TDataSource.Create(nil); 
    if Condicao <> '' then 
      Condicao := ' where ('+Condicao+')'; 
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.Text := 'SELECT '+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD, '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD '+ 
                  'FROM ADP_INDICADORES_CARGOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassADP_INDICADORES_CARGOS.Carregar: Boolean;
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
        SQL.Text := 'SELECT '+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD, '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD '+ 
                  'FROM ADP_INDICADORES_CARGOS '+
                  'WHERE '+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD = :pINDICADOR_COD AND '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD = :pCARGO_COD'; 
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Open;
        if not IsEmpty then
        begin
          PINDICADOR_COD:= FieldByName('INDICADOR_COD').AsString; 
          PCARGO_COD:= FieldByName('CARGO_COD').AsString; 
          Result := True;
        end;
      end;
    finally
      Qry.Free;
    end;
  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
    end;
  end;
end;

function TuClassADP_INDICADORES_CARGOS.Editar: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao; 
        Close;
        SQL.Text := 'UPDATE ADP_INDICADORES_CARGOS SET '+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD = :pINDICADOR_COD, '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD = :pCARGO_COD '+ 
                    'WHERE '+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD = :pINDICADOR_COD, '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD = :pCARGO_COD '; 
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        ExecSQL;
        Result := True;
      end;
    finally
      Qry.Free;  //Liberando da memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

function TuClassADP_INDICADORES_CARGOS.Excluir: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao; 
        Close;
        SQL.Text := 'DELETE from ADP_INDICADORES_CARGOS '+
                    'WHERE '+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD = :pINDICADOR_COD, '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD = :pCARGO_COD '; 
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        ExecSQL;
        Result := True;
      end;
    finally
      Qry.Free;  //Liberando da memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

function TuClassADP_INDICADORES_CARGOS.Salvar: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao; 
        Close;
        SQL.Text := 'INSERT INTO ADP_INDICADORES_CARGOS ('+
                  '  ADP_INDICADORES_CARGOS.INDICADOR_COD, '+ 
                  '  ADP_INDICADORES_CARGOS.CARGO_COD'+ 
                  ') VALUES ('+
                  '  :pINDICADOR_COD, '+ 
                  '  :pCARGO_COD'; 
        // passa parametros
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        ExecSQL;  // Executa SQL 
        Result := True; // Se não houve erros retorna true
      end;
    finally
      Qry.Free;  //Liberando da memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

procedure TuClassADP_INDICADORES_CARGOS.SetFINDICADOR_COD(const Value: string);
begin
  FINDICADOR_COD := Value;
end; 
procedure TuClassADP_INDICADORES_CARGOS.SetFCARGO_COD(const Value: string);
begin
  FCARGO_COD := Value;
end; 

end.
