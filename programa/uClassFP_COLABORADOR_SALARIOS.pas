unit uClassFP_COLABORADOR_SALARIOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_COLABORADOR_SALARIOS = class 

  private 
    FSALARIO_DATA_ALTERACAO: String; 
    FSALARIO_STATUS: String; 
    FPESSOA_COD: String; 
    FSALARIO_VALOR: String; 
    FCOL_SAL_COD: String; 
    procedure SetFSALARIO_DATA_ALTERACAO(const Value: String); 
    procedure SetFSALARIO_STATUS(const Value: String); 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFSALARIO_VALOR(const Value: String); 
    procedure SetFCOL_SAL_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PSALARIO_DATA_ALTERACAO: String read FSALARIO_DATA_ALTERACAO write SetFSALARIO_DATA_ALTERACAO; 
    property PSALARIO_STATUS: String read FSALARIO_STATUS write SetFSALARIO_STATUS; 
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PSALARIO_VALOR: String read FSALARIO_VALOR write SetFSALARIO_VALOR; 
    property PCOL_SAL_COD: String read FCOL_SAL_COD write SetFCOL_SAL_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassFP_COLABORADOR_SALARIOS.Consultar(Condicao: string): TDataSource;
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
                  'FP_COLABORADOR_SALARIOS.SALARIO_DATA_ALTERACAO, '+
                  'FP_COLABORADOR_SALARIOS.SALARIO_STATUS, '+
                  'FP_COLABORADOR_SALARIOS.PESSOA_COD, '+
                  'FP_COLABORADOR_SALARIOS.SALARIO_VALOR, '+
                  'FP_COLABORADOR_SALARIOS.COL_SAL_COD, GE_PESSOAS.NOME '+
                  'FROM FP_COLABORADOR_SALARIOS '+
                  'inner join GE_PESSOAS on (FP_COLABORADOR_SALARIOS.PESSOA_COD = GE_PESSOAS.PESSOA_COD) '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_COLABORADOR_SALARIOS.Carregar: Boolean;
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
                  '  FP_COLABORADOR_SALARIOS.SALARIO_DATA_ALTERACAO, '+ 
                  '  FP_COLABORADOR_SALARIOS.SALARIO_STATUS, '+ 
                  '  FP_COLABORADOR_SALARIOS.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_SALARIOS.SALARIO_VALOR, '+ 
                  '  FP_COLABORADOR_SALARIOS.COL_SAL_COD '+ 
                  'FROM FP_COLABORADOR_SALARIOS '+
                  'WHERE '+
                  '  FP_COLABORADOR_SALARIOS.COL_SAL_COD = :pCOL_SAL_COD';

        Parameters.ParamByName('pCOL_SAL_COD').Value := FCOL_SAL_COD;
        Open;
        if not IsEmpty then
        begin
          PSALARIO_DATA_ALTERACAO:= FieldByName('SALARIO_DATA_ALTERACAO').AsString; 
          PSALARIO_STATUS:= FieldByName('SALARIO_STATUS').AsString; 
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PSALARIO_VALOR:= FieldByName('SALARIO_VALOR').AsString; 
          PCOL_SAL_COD:= FieldByName('COL_SAL_COD').AsString; 
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

function TuClassFP_COLABORADOR_SALARIOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_COLABORADOR_SALARIOS SET '+
                  '  FP_COLABORADOR_SALARIOS.SALARIO_DATA_ALTERACAO = TO_DATE(:pSALARIO_DATA_ALTERACAO,''DD/MM/RR''), '+ 
                  '  FP_COLABORADOR_SALARIOS.SALARIO_STATUS = :pSALARIO_STATUS, '+ 
                  '  FP_COLABORADOR_SALARIOS.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  FP_COLABORADOR_SALARIOS.SALARIO_VALOR = :pSALARIO_VALOR '+ 
                    'WHERE '+
                  '  FP_COLABORADOR_SALARIOS.COL_SAL_COD = :pCOL_SAL_COD ';
        Parameters.ParamByName('pSALARIO_DATA_ALTERACAO').Value := FSALARIO_DATA_ALTERACAO;
        Parameters.ParamByName('pSALARIO_STATUS').Value := FSALARIO_STATUS;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pSALARIO_VALOR').Value := FSALARIO_VALOR;
        Parameters.ParamByName('pCOL_SAL_COD').Value := FCOL_SAL_COD;
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

function TuClassFP_COLABORADOR_SALARIOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from FP_COLABORADOR_SALARIOS '+
                    'WHERE '+
                  '  FP_COLABORADOR_SALARIOS.COL_SAL_COD = :pCOL_SAL_COD ';
        Parameters.ParamByName('pCOL_SAL_COD').Value := FCOL_SAL_COD;
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

function TuClassFP_COLABORADOR_SALARIOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_COLABORADOR_SALARIOS ('+
                  '  FP_COLABORADOR_SALARIOS.SALARIO_DATA_ALTERACAO, '+ 
                  '  FP_COLABORADOR_SALARIOS.SALARIO_STATUS, '+ 
                  '  FP_COLABORADOR_SALARIOS.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_SALARIOS.SALARIO_VALOR, '+ 
                  '  FP_COLABORADOR_SALARIOS.COL_SAL_COD'+ 
                  ') VALUES ('+
                  '  TO_DATE(:pSALARIO_DATA_ALTERACAO,''DD/MM/RR''), '+ 
                  '  :pSALARIO_STATUS, '+ 
                  '  :pPESSOA_COD, '+ 
                  '  :pSALARIO_VALOR, '+ 
                  '  :pCOL_SAL_COD)'; 
        // passa parametros
        Parameters.ParamByName('pSALARIO_DATA_ALTERACAO').Value := FSALARIO_DATA_ALTERACAO;
        Parameters.ParamByName('pSALARIO_STATUS').Value := FSALARIO_STATUS;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pSALARIO_VALOR').Value := FSALARIO_VALOR;
        Parameters.ParamByName('pCOL_SAL_COD').Value := FCOL_SAL_COD;
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

procedure TuClassFP_COLABORADOR_SALARIOS.SetFSALARIO_DATA_ALTERACAO(const Value: string);
begin
  FSALARIO_DATA_ALTERACAO := Value;
end; 
procedure TuClassFP_COLABORADOR_SALARIOS.SetFSALARIO_STATUS(const Value: string);
begin
  FSALARIO_STATUS := Value;
end; 
procedure TuClassFP_COLABORADOR_SALARIOS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_SALARIOS.SetFSALARIO_VALOR(const Value: string);
begin
  FSALARIO_VALOR := Value;
end; 
procedure TuClassFP_COLABORADOR_SALARIOS.SetFCOL_SAL_COD(const Value: string);
begin
  FCOL_SAL_COD := Value;
end; 

end.
