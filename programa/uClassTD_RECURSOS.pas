unit uClassTD_RECURSOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_RECURSOS = class 

  private 
    FRECURSO_COD: String; 
    FDESCRICAO: String; 
    procedure SetFRECURSO_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 

  public 
    {Propriedades da classe}
    property PRECURSO_COD: String read FRECURSO_COD write SetFRECURSO_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_RECURSOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_RECURSOS.RECURSO_COD, '+ 
                  '  TD_RECURSOS.DESCRICAO '+ 
                  'FROM TD_RECURSOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_RECURSOS.Carregar: Boolean;
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
                  '  TD_RECURSOS.RECURSO_COD, '+ 
                  '  TD_RECURSOS.DESCRICAO '+ 
                  'FROM TD_RECURSOS '+
                  'WHERE '+
                  '  TD_RECURSOS.RECURSO_COD = :pRECURSO_COD'; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Open;
        if not IsEmpty then
        begin
          PRECURSO_COD:= FieldByName('RECURSO_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
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

function TuClassTD_RECURSOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_RECURSOS SET '+
                  '  TD_RECURSOS.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_RECURSOS.DESCRICAO = :pDESCRICAO '+ 
                    'WHERE '+
                  '  TD_RECURSOS.RECURSO_COD = :pRECURSO_COD '; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
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

function TuClassTD_RECURSOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_RECURSOS '+
                    'WHERE '+
                  '  TD_RECURSOS.RECURSO_COD = :pRECURSO_COD '; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
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

function TuClassTD_RECURSOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_RECURSOS ('+
                  '  TD_RECURSOS.RECURSO_COD, '+ 
                  '  TD_RECURSOS.DESCRICAO'+ 
                  ') VALUES ('+
                  '  :pRECURSO_COD, '+ 
                  '  :pDESCRICAO'; 
        // passa parametros
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
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

procedure TuClassTD_RECURSOS.SetFRECURSO_COD(const Value: string);
begin
  FRECURSO_COD := Value;
end; 
procedure TuClassTD_RECURSOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 

end;
