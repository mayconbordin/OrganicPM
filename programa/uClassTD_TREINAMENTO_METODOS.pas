unit uClassTD_TREINAMENTO_METODOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TREINAMENTO_METODOS = class 

  private 
    FMETODO_COD: String; 
    FTREINAMENTO_COD: String; 
    procedure SetFMETODO_COD(const Value: String); 
    procedure SetFTREINAMENTO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PMETODO_COD: String read FMETODO_COD write SetFMETODO_COD; 
    property PTREINAMENTO_COD: String read FTREINAMENTO_COD write SetFTREINAMENTO_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_TREINAMENTO_METODOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TREINAMENTO_METODOS.METODO_COD, '+ 
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD '+ 
                  'FROM TD_TREINAMENTO_METODOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TREINAMENTO_METODOS.Carregar: Boolean;
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
                  '  TD_TREINAMENTO_METODOS.METODO_COD, '+ 
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD '+ 
                  'FROM TD_TREINAMENTO_METODOS '+
                  'WHERE '+
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+ 
                  '  TD_TREINAMENTO_METODOS.METODO_COD = :pMETODO_COD'; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Open;
        if not IsEmpty then
        begin
          PMETODO_COD:= FieldByName('METODO_COD').AsString; 
          PTREINAMENTO_COD:= FieldByName('TREINAMENTO_COD').AsString; 
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

function TuClassTD_TREINAMENTO_METODOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TREINAMENTO_METODOS SET '+
                  '  TD_TREINAMENTO_METODOS.METODO_COD = :pMETODO_COD, '+ 
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD = :pTREINAMENTO_COD '+ 
                    'WHERE '+
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_TREINAMENTO_METODOS.METODO_COD = :pMETODO_COD '; 
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
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

function TuClassTD_TREINAMENTO_METODOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TREINAMENTO_METODOS WHERE '+
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+
                  '  TD_TREINAMENTO_METODOS.METODO_COD = :pMETODO_COD ';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
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

function TuClassTD_TREINAMENTO_METODOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TREINAMENTO_METODOS ('+
                  '  TD_TREINAMENTO_METODOS.METODO_COD, '+ 
                  '  TD_TREINAMENTO_METODOS.TREINAMENTO_COD'+ 
                  ') VALUES ('+
                  '  :pMETODO_COD, '+ 
                  '  :pTREINAMENTO_COD)'; 
        // passa parametros
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
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

procedure TuClassTD_TREINAMENTO_METODOS.SetFMETODO_COD(const Value: string);
begin
  FMETODO_COD := Value;
end; 
procedure TuClassTD_TREINAMENTO_METODOS.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end; 

end.
