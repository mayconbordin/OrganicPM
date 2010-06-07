unit uClassTD_RESULTADOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_RESULTADOS = class 

  private 
    FRESULTADO_COD: String; 
    FDESCRICAO: String; 
    FOBSERVACOES: String; 
    procedure SetFRESULTADO_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    procedure SetFOBSERVACOES(const Value: String); 

  public 
    {Propriedades da classe}
    property PRESULTADO_COD: String read FRESULTADO_COD write SetFRESULTADO_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 
    property POBSERVACOES: String read FOBSERVACOES write SetFOBSERVACOES; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_RESULTADOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_RESULTADOS.RESULTADO_COD, '+ 
                  '  TD_RESULTADOS.DESCRICAO, '+ 
                  '  TD_RESULTADOS.OBSERVACOES '+ 
                  'FROM TD_RESULTADOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_RESULTADOS.Carregar: Boolean;
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
                  '  TD_RESULTADOS.RESULTADO_COD, '+ 
                  '  TD_RESULTADOS.DESCRICAO, '+ 
                  '  TD_RESULTADOS.OBSERVACOES '+ 
                  'FROM TD_RESULTADOS '+
                  'WHERE '+
                  '  TD_RESULTADOS.RESULTADO_COD = :pRESULTADO_COD'; 
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Open;
        if not IsEmpty then
        begin
          PRESULTADO_COD:= FieldByName('RESULTADO_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
          POBSERVACOES:= FieldByName('OBSERVACOES').AsString; 
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

function TuClassTD_RESULTADOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_RESULTADOS SET '+
                  '  TD_RESULTADOS.RESULTADO_COD = :pRESULTADO_COD, '+ 
                  '  TD_RESULTADOS.DESCRICAO = :pDESCRICAO, '+ 
                  '  TD_RESULTADOS.OBSERVACOES = :pOBSERVACOES '+ 
                    'WHERE '+
                  '  TD_RESULTADOS.RESULTADO_COD = :pRESULTADO_COD '; 
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pOBSERVACOES').Value := FOBSERVACOES;
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

function TuClassTD_RESULTADOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_RESULTADOS '+
                    'WHERE '+
                  '  TD_RESULTADOS.RESULTADO_COD = :pRESULTADO_COD '; 
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

function TuClassTD_RESULTADOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_RESULTADOS ('+
                  '  TD_RESULTADOS.RESULTADO_COD, '+
                  '  TD_RESULTADOS.DESCRICAO, '+
                  '  TD_RESULTADOS.OBSERVACOES'+
                  ') VALUES ('+
                  '  :pRESULTADO_COD, '+
                  '  :pDESCRICAO, '+
                  '  :pOBSERVACOES)';
        // passa parametros
        Parameters.ParamByName('pRESULTADO_COD').Value := FRESULTADO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pOBSERVACOES').Value := FOBSERVACOES;
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

procedure TuClassTD_RESULTADOS.SetFRESULTADO_COD(const Value: string);
begin
  FRESULTADO_COD := Value;
end; 
procedure TuClassTD_RESULTADOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 
procedure TuClassTD_RESULTADOS.SetFOBSERVACOES(const Value: string);
begin
  FOBSERVACOES := Value;
end; 

end.
