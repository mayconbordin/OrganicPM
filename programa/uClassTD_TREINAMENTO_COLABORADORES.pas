unit uClassTD_TREINAMENTO_COLABORADORES; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TREINAMENTO_COLABORADORES = class 

  private 
    FPESSOA_COD: String; 
    FTRIENAMENTO_COD: String; 
    FRESULTADO_COD: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFTRIENAMENTO_COD(const Value: String); 
    procedure SetFRESULTADO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PTRIENAMENTO_COD: String read FTRIENAMENTO_COD write SetFTRIENAMENTO_COD; 
    property PRESULTADO_COD: String read FRESULTADO_COD write SetFRESULTADO_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_TREINAMENTO_COLABORADORES.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD '+ 
                  'FROM TD_TREINAMENTO_COLABORADORES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TREINAMENTO_COLABORADORES.Carregar: Boolean;
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
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD '+ 
                  'FROM TD_TREINAMENTO_COLABORADORES '+
                  'WHERE '+
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD = :pRESULTADO_COD AND '+ 
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD = :pPESSOA_COD AND '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD = :pTRIENAMENTO_COD'; 
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTRIENAMENTO_COD').Value := FTRIENAMENTO_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PTRIENAMENTO_COD:= FieldByName('TRIENAMENTO_COD').AsString; 
          PRESULTADO_COD:= FieldByName('RESULTADO_COD').AsString; 
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

function TuClassTD_TREINAMENTO_COLABORADORES.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TREINAMENTO_COLABORADORES SET '+
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD = :pTRIENAMENTO_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD = :pRESULTADO_COD '+ 
                    'WHERE '+
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD = :pRESULTADO_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD = :pTRIENAMENTO_COD '; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTRIENAMENTO_COD').Value := FTRIENAMENTO_COD;
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

function TuClassTD_TREINAMENTO_COLABORADORES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TREINAMENTO_COLABORADORES '+
                    'WHERE '+
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD = :pRESULTADO_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD = :pTRIENAMENTO_COD '; 
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTRIENAMENTO_COD').Value := FTRIENAMENTO_COD;
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

function TuClassTD_TREINAMENTO_COLABORADORES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TREINAMENTO_COLABORADORES ('+
                  '  TD_TREINAMENTO_COLABORADORES.PESSOA_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.TRIENAMENTO_COD, '+ 
                  '  TD_TREINAMENTO_COLABORADORES.RESULTADO_COD'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pTRIENAMENTO_COD, '+ 
                  '  :pRESULTADO_COD'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTRIENAMENTO_COD').Value := FTRIENAMENTO_COD;
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
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

procedure TuClassTD_TREINAMENTO_COLABORADORES.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassTD_TREINAMENTO_COLABORADORES.SetFTRIENAMENTO_COD(const Value: string);
begin
  FTRIENAMENTO_COD := Value;
end; 
procedure TuClassTD_TREINAMENTO_COLABORADORES.SetFRESULTADO_COD(const Value: string);
begin
  FRESULTADO_COD := Value;
end; 

end;
