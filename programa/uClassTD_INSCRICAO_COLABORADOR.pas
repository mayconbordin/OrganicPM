unit uClassTD_INSCRICAO_COLABORADOR; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_INSCRICAO_COLABORADOR = class 

  private 
    FPESSOA_COD: String; 
    FTIPO: String; 
    FINSCRICAO_COD: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFTIPO(const Value: String); 
    procedure SetFINSCRICAO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PTIPO: String read FTIPO write SetFTIPO; 
    property PINSCRICAO_COD: String read FINSCRICAO_COD write SetFINSCRICAO_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_INSCRICAO_COLABORADOR.Consultar(Condicao: string): TDataSource;
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
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO, '+ 
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD '+ 
                  'FROM TD_INSCRICAO_COLABORADOR '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_INSCRICAO_COLABORADOR.Carregar: Boolean;
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
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO, '+ 
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD '+ 
                  'FROM TD_INSCRICAO_COLABORADOR '+
                  'WHERE '+
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD = :pINSCRICAO_COD AND '+ 
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD = :pPESSOA_COD AND '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO = :pTIPO'; 
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PTIPO:= FieldByName('TIPO').AsString; 
          PINSCRICAO_COD:= FieldByName('INSCRICAO_COD').AsString; 
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

function TuClassTD_INSCRICAO_COLABORADOR.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_INSCRICAO_COLABORADOR SET '+
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO = :pTIPO, '+ 
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD = :pINSCRICAO_COD '+ 
                    'WHERE '+
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD = :pINSCRICAO_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO = :pTIPO '; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
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

function TuClassTD_INSCRICAO_COLABORADOR.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_INSCRICAO_COLABORADOR '+
                    'WHERE '+
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD = :pINSCRICAO_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO = :pTIPO '; 
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
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

function TuClassTD_INSCRICAO_COLABORADOR.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_INSCRICAO_COLABORADOR ('+
                  '  TD_INSCRICAO_COLABORADOR.PESSOA_COD, '+ 
                  '  TD_INSCRICAO_COLABORADOR.TIPO, '+ 
                  '  TD_INSCRICAO_COLABORADOR.INSCRICAO_COD'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pTIPO, '+ 
                  '  :pINSCRICAO_COD'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
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

procedure TuClassTD_INSCRICAO_COLABORADOR.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassTD_INSCRICAO_COLABORADOR.SetFTIPO(const Value: string);
begin
  FTIPO := Value;
end; 
procedure TuClassTD_INSCRICAO_COLABORADOR.SetFINSCRICAO_COD(const Value: string);
begin
  FINSCRICAO_COD := Value;
end; 

end.
