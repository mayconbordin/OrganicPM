unit uClassTD_RECURSOS_AMBIENTES; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_RECURSOS_AMBIENTES = class 

  private 
    FRECURSO_COD: String; 
    FAMBIENTE_COD: String; 
    procedure SetFRECURSO_COD(const Value: String); 
    procedure SetFAMBIENTE_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PRECURSO_COD: String read FRECURSO_COD write SetFRECURSO_COD; 
    property PAMBIENTE_COD: String read FAMBIENTE_COD write SetFAMBIENTE_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_RECURSOS_AMBIENTES.Consultar(Condicao: string): TDataSource;
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
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD, '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD '+ 
                  'FROM TD_RECURSOS_AMBIENTES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_RECURSOS_AMBIENTES.Carregar: Boolean;
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
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD, '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD '+ 
                  'FROM TD_RECURSOS_AMBIENTES '+
                  'WHERE '+
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD = :pRECURSO_COD AND '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD'; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Open;
        if not IsEmpty then
        begin
          PRECURSO_COD:= FieldByName('RECURSO_COD').AsString; 
          PAMBIENTE_COD:= FieldByName('AMBIENTE_COD').AsString; 
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

function TuClassTD_RECURSOS_AMBIENTES.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_RECURSOS_AMBIENTES SET '+
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD '+ 
                    'WHERE '+
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD '; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
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

function TuClassTD_RECURSOS_AMBIENTES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_RECURSOS_AMBIENTES '+
                    'WHERE '+
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD '; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
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

function TuClassTD_RECURSOS_AMBIENTES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_RECURSOS_AMBIENTES ('+
                  '  TD_RECURSOS_AMBIENTES.RECURSO_COD, '+ 
                  '  TD_RECURSOS_AMBIENTES.AMBIENTE_COD'+ 
                  ') VALUES ('+
                  '  :pRECURSO_COD, '+ 
                  '  :pAMBIENTE_COD'; 
        // passa parametros
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
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

procedure TuClassTD_RECURSOS_AMBIENTES.SetFRECURSO_COD(const Value: string);
begin
  FRECURSO_COD := Value;
end; 
procedure TuClassTD_RECURSOS_AMBIENTES.SetFAMBIENTE_COD(const Value: string);
begin
  FAMBIENTE_COD := Value;
end; 

end.
