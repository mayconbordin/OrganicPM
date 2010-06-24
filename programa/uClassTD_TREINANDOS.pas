unit uClassTD_TREINANDOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TREINANDOS = class 

  private 
    FTURMA_COD: String;
    FPESSOA_COD: String; 
    FRESULTADO_COD: String; 
    FOBJETIVO_COD: String;
    FTREINAMENTO_COD: String; 
    procedure SetFTURMA_COD(const Value: String);
    procedure SetFPESSOA_COD(const Value: String);
    procedure SetFRESULTADO_COD(const Value: String);
    procedure SetFOBJETIVO_COD(const Value: String);
    procedure SetFTREINAMENTO_COD(const Value: String);

  public 
    {Propriedades da classe}
    property PTURMA_COD: String read FTURMA_COD write SetFTURMA_COD; 
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PRESULTADO_COD: String read FRESULTADO_COD write SetFRESULTADO_COD; 
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

function TuClassTD_TREINANDOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TREINANDOS.TURMA_COD, '+ 
                  '  TD_TREINANDOS.PESSOA_COD, '+ 
                  '  TD_TREINANDOS.RESULTADO_COD, '+ 
                  '  TD_TREINANDOS.OBJETIVO_COD, '+ 
                  '  TD_TREINANDOS.TREINAMENTO_COD, '+
                  '  TD_TREINAMENTOS.DESCRICAO, '+
                  '  TD_TURMAS.NOME, '+
                  '  GE_PESSOAS.NOME, '+
                  '  TD_OBJETIVOS.DESCRICAO, '+
                  '  TD_RESULTADOS.DESCRICAO '+
                  '  FROM TD_TREINANDOS '+Condicao+' '+ 
                  '  INNER JOIN GE_PESSOAS ON GE_PESSOAS.PESSOA_COD = TD_TREINANDOS.PESSOA_COD '+
                  '  INNER JOIN TD_TURMAS ON TD_TURMAS.TURMA_COD = TD_TREINANDOS.TURMA_COD '+
                  '  INNER JOIN TD_OBJETIVOS ON TD_OBJETIVOS.OBJETIVO_COD = TD_TREINANDOS.OBJETIVO_COD '+
                  '  INNER JOIN TD_RESULTADOS ON TD_RESULTADOS.RESULTADO_COD = TD_TREINANDOS.RESULTADO_COD '+
                  '  INNER JOIN TD_TREINAMENTOS ON TD_TREINAMENTOS.TREINAMENTO_COD = TD_TREINANDOS.TREINAMENTO_COD ';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TREINANDOS.Carregar: Boolean;
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
                  '  TD_TREINANDOS.TURMA_COD, '+ 
                  '  TD_TREINANDOS.PESSOA_COD, '+ 
                  '  TD_TREINANDOS.RESULTADO_COD, '+ 
                  '  TD_TREINANDOS.OBJETIVO_COD, '+ 
                  '  TD_TREINANDOS.TREINAMENTO_COD '+ 
                  '  FROM TD_TREINANDOS '+
                  '  WHERE '+
                  '  TD_TREINANDOS.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+ 
                  '  TD_TREINANDOS.RESULTADO_COD = :pRESULTADO_COD AND '+ 
                  '  TD_TREINANDOS.TURMA_COD = :pTURMA_COD AND '+ 
                  '  TD_TREINANDOS.PESSOA_COD = :pPESSOA_COD AND '+ 
                  '  TD_TREINANDOS.OBJETIVO_COD = :pOBJETIVO_COD'; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Open;
        if not IsEmpty then
        begin
          PTURMA_COD:= FieldByName('TURMA_COD').AsString; 
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PRESULTADO_COD:= FieldByName('RESULTADO_COD').AsString; 
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

function TuClassTD_TREINANDOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TREINANDOS SET '+
                  '  TD_TREINANDOS.RESULTADO_COD = :pRESULTADO_COD, '+
                    'WHERE '+
                  '  TD_TREINANDOS.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_TREINANDOS.RESULTADO_COD = :pRESULTADO_COD, '+ 
                  '  TD_TREINANDOS.TURMA_COD = :pTURMA_COD, '+ 
                  '  TD_TREINANDOS.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_TREINANDOS.OBJETIVO_COD = :pOBJETIVO_COD '; 
        Parameters.ParamByName('pTURMA_COD').Value := PTURMA_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := PPESSOA_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := POBJETIVO_COD;
        Parameters.ParamByName('pTREINAMENTO_COD').Value := PTREINAMENTO_COD;
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
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

function TuClassTD_TREINANDOS.Excluir: Boolean;
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
        SQL.Text := ' DELETE from TD_TREINANDOS '+
                    ' WHERE '+
                    ' TD_TREINANDOS.TREINAMENTO_COD = :pTREINAMENTO_COD, '+
                    ' TD_TREINANDOS.RESULTADO_COD = :pRESULTADO_COD, '+
                    ' TD_TREINANDOS.TURMA_COD = :pTURMA_COD, '+
                    ' TD_TREINANDOS.PESSOA_COD = :pPESSOA_COD, '+
                    ' TD_TREINANDOS.OBJETIVO_COD = :pOBJETIVO_COD ';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        ExecSQL;
        Result := True;
      end;
    finally
      Qry.Free;  //Liberando da Memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

function TuClassTD_TREINANDOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TREINANDOS ('+
                  '  TD_TREINANDOS.TURMA_COD, '+ 
                  '  TD_TREINANDOS.PESSOA_COD, '+ 
                  '  TD_TREINANDOS.RESULTADO_COD, '+ 
                  '  TD_TREINANDOS.OBJETIVO_COD, '+ 
                  '  TD_TREINANDOS.TREINAMENTO_COD'+ 
                  ') VALUES ('+
                  '  :pTURMA_COD, '+ 
                  '  :pPESSOA_COD, '+ 
                  '  :pRESULTADO_COD, '+ 
                  '  :pOBJETIVO_COD, '+ 
                  '  :pTREINAMENTO_COD)'; 
        // Passa parametros
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
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

procedure TuClassTD_TREINANDOS.SetFTURMA_COD(const Value: string);
begin
  FTURMA_COD := Value;
end; 
procedure TuClassTD_TREINANDOS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassTD_TREINANDOS.SetFRESULTADO_COD(const Value: string);
begin
  FRESULTADO_COD := Value;
end; 
procedure TuClassTD_TREINANDOS.SetFOBJETIVO_COD(const Value: string);
begin
  FOBJETIVO_COD := Value;
end; 
procedure TuClassTD_TREINANDOS.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end; 

end.
