unit uClassTD_TURMAS_TREINAMENTOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TURMAS_TREINAMENTOS = class 

  private 
    FTURMA_COD: String; 
    FTREINAMENTO_COD: String; 
    procedure SetFTURMA_COD(const Value: String); 
    procedure SetFTREINAMENTO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PTURMA_COD: String read FTURMA_COD write SetFTURMA_COD; 
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

function TuClassTD_TURMAS_TREINAMENTOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TURMAS_TREINAMENTOS.TURMA_COD, '+ 
                  '  TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD '+ 
                  'FROM TD_TURMAS_TREINAMENTOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TURMAS_TREINAMENTOS.Carregar: Boolean;
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
                  '  TD_TURMAS_TREINAMENTOS.TURMA_COD, '+
                  '  TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD '+
                  'FROM TD_TURMAS_TREINAMENTOS '+
                  'WHERE '+
                  '  TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+
                  '  TD_TURMAS_TREINAMENTOS.TURMA_COD = :pTURMA_COD';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Open;
        if not IsEmpty then
        begin
          PTURMA_COD:= FieldByName('TURMA_COD').AsString;
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

function TuClassTD_TURMAS_TREINAMENTOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TURMAS_TREINAMENTOS SET '+
                  '  TD_TURMAS_TREINAMENTOS.TURMA_COD = :pTURMA_COD, '+ 
                  '  TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD '+ 
                    'WHERE '+
                  '  TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_TURMAS_TREINAMENTOS.TURMA_COD = :pTURMA_COD '; 
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
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

function TuClassTD_TURMAS_TREINAMENTOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TURMAS_TREINAMENTOS WHERE '+
                    'TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+
                    'TD_TURMAS_TREINAMENTOS.TURMA_COD = :pTURMA_COD ';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
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

function TuClassTD_TURMAS_TREINAMENTOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TURMAS_TREINAMENTOS ('+
                  '  TD_TURMAS_TREINAMENTOS.TURMA_COD, '+
                  '  TD_TURMAS_TREINAMENTOS.TREINAMENTO_COD'+
                  ') VALUES ('+
                  '  :pTURMA_COD, '+
                  '  :pTREINAMENTO_COD)';
        // passa parametros
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
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

procedure TuClassTD_TURMAS_TREINAMENTOS.SetFTURMA_COD(const Value: string);
begin
  FTURMA_COD := Value;
end; 
procedure TuClassTD_TURMAS_TREINAMENTOS.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end; 

end.
