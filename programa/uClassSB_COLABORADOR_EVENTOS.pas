unit uClassSB_COLABORADOR_EVENTOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_COLABORADOR_EVENTOS = class 

  private 
    FEVENTO_COD: String; 
    FPESSOA_COD: String; 
    procedure SetFEVENTO_COD(const Value: String); 
    procedure SetFPESSOA_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PEVENTO_COD: String read FEVENTO_COD write SetFEVENTO_COD; 
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassSB_COLABORADOR_EVENTOS.Consultar(Condicao: string): TDataSource;
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
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD, '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD '+ 
                  'FROM SB_COLABORADOR_EVENTOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassSB_COLABORADOR_EVENTOS.Carregar: Boolean;
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
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD, '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD '+ 
                  'FROM SB_COLABORADOR_EVENTOS '+
                  'WHERE '+
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD = :pEVENTO_COD AND '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD = :pPESSOA_COD'; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PEVENTO_COD:= FieldByName('EVENTO_COD').AsString; 
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
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

function TuClassSB_COLABORADOR_EVENTOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE SB_COLABORADOR_EVENTOS SET '+
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD = :pEVENTO_COD, '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD = :pPESSOA_COD '+ 
                    'WHERE '+
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD = :pEVENTO_COD, '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD = :pPESSOA_COD '; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

function TuClassSB_COLABORADOR_EVENTOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_COLABORADOR_EVENTOS '+
                    'WHERE '+
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD = :pEVENTO_COD, '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD = :pPESSOA_COD '; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

function TuClassSB_COLABORADOR_EVENTOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_COLABORADOR_EVENTOS ('+
                  '  SB_COLABORADOR_EVENTOS.EVENTO_COD, '+ 
                  '  SB_COLABORADOR_EVENTOS.PESSOA_COD'+ 
                  ') VALUES ('+
                  '  :pEVENTO_COD, '+ 
                  '  :pPESSOA_COD'; 
        // passa parametros
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

procedure TuClassSB_COLABORADOR_EVENTOS.SetFEVENTO_COD(const Value: string);
begin
  FEVENTO_COD := Value;
end; 
procedure TuClassSB_COLABORADOR_EVENTOS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 

end;
