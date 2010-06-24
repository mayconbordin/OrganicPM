unit uClassTD_TECNICAS_METODOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TECNICAS_METODOS = class 

  private 
    FMETODO_COD: String; 
    FTECNICA_COD: String; 
    procedure SetFMETODO_COD(const Value: String); 
    procedure SetFTECNICA_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PMETODO_COD: String read FMETODO_COD write SetFMETODO_COD; 
    property PTECNICA_COD: String read FTECNICA_COD write SetFTECNICA_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_TECNICAS_METODOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TECNICAS_METODOS.METODO_COD, '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD '+ 
                  'FROM TD_TECNICAS_METODOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TECNICAS_METODOS.Carregar: Boolean;
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
                  '  TD_TECNICAS_METODOS.METODO_COD, '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD '+ 
                  'FROM TD_TECNICAS_METODOS '+
                  'WHERE '+
                  '  TD_TECNICAS_METODOS.METODO_COD = :pMETODO_COD AND '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD = :pTECNICA_COD'; 
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
        Open;
        if not IsEmpty then
        begin
          PMETODO_COD:= FieldByName('METODO_COD').AsString; 
          PTECNICA_COD:= FieldByName('TECNICA_COD').AsString; 
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

function TuClassTD_TECNICAS_METODOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TECNICAS_METODOS SET '+
                  '  TD_TECNICAS_METODOS.METODO_COD = :pMETODO_COD, '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD = :pTECNICA_COD '+ 
                    'WHERE '+
                  '  TD_TECNICAS_METODOS.METODO_COD = :pMETODO_COD, '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD = :pTECNICA_COD '; 
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
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

function TuClassTD_TECNICAS_METODOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TECNICAS_METODOS '+
                    'WHERE '+
                  '  TD_TECNICAS_METODOS.METODO_COD = :pMETODO_COD, '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD = :pTECNICA_COD '; 
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
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

function TuClassTD_TECNICAS_METODOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TECNICAS_METODOS ('+
                  '  TD_TECNICAS_METODOS.METODO_COD, '+ 
                  '  TD_TECNICAS_METODOS.TECNICA_COD'+ 
                  ') VALUES ('+
                  '  :pMETODO_COD, '+ 
                  '  :pTECNICA_COD'; 
        // passa parametros
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
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

procedure TuClassTD_TECNICAS_METODOS.SetFMETODO_COD(const Value: string);
begin
  FMETODO_COD := Value;
end; 
procedure TuClassTD_TECNICAS_METODOS.SetFTECNICA_COD(const Value: string);
begin
  FTECNICA_COD := Value;
end; 

end.
