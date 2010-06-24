unit uClassTD_OBJETIVOS_TREINAMENTO; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_OBJETIVOS_TREINAMENTO = class 

  private 
    FOBJETIVO_COD: String; 
    FTREINAMENTO_COD: String;
    procedure SetFOBJETIVO_COD(const Value: String); 
    procedure SetFTREINAMENTO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property POBJETIVO_COD: String read FOBJETIVO_COD write SetFOBJETIVO_COD; 
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

function TuClassTD_OBJETIVOS_TREINAMENTO.Consultar(Condicao: string): TDataSource;
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
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD '+ 
                  'FROM TD_OBJETIVOS_TREINAMENTO '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_OBJETIVOS_TREINAMENTO.Carregar: Boolean;
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
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD '+ 
                  'FROM TD_OBJETIVOS_TREINAMENTO '+
                  'WHERE '+
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+ 
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD = :pOBJETIVO_COD'; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Open;
        if not IsEmpty then
        begin
          POBJETIVO_COD:= FieldByName('OBJETIVO_COD').AsString; 
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

function TuClassTD_OBJETIVOS_TREINAMENTO.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_OBJETIVOS_TREINAMENTO SET '+
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD = :pOBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD = :pTREINAMENTO_COD '+ 
                    'WHERE '+
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD = :pOBJETIVO_COD '; 
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
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

function TuClassTD_OBJETIVOS_TREINAMENTO.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_OBJETIVOS_TREINAMENTO WHERE '+
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD = :pOBJETIVO_COD ';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
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

function TuClassTD_OBJETIVOS_TREINAMENTO.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_OBJETIVOS_TREINAMENTO ('+
                  '  TD_OBJETIVOS_TREINAMENTO.OBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS_TREINAMENTO.TREINAMENTO_COD'+ 
                  ') VALUES ('+
                  '  :pOBJETIVO_COD, '+ 
                  '  :pTREINAMENTO_COD)';
        // passa parametros
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
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

procedure TuClassTD_OBJETIVOS_TREINAMENTO.SetFOBJETIVO_COD(const Value: string);
begin
  FOBJETIVO_COD := Value;
end; 
procedure TuClassTD_OBJETIVOS_TREINAMENTO.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end; 

end.
