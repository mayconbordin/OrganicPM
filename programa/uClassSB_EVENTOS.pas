unit uClassSB_EVENTOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_EVENTOS = class 

  private 
    FEVENTO_COD: String; 
    FTIPO: String; 
    FDESCRICAO: String; 
    FFORMULA: String; 
    procedure SetFEVENTO_COD(const Value: String); 
    procedure SetFTIPO(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    procedure SetFFORMULA(const Value: String); 

  public 
    {Propriedades da classe}
    property PEVENTO_COD: String read FEVENTO_COD write SetFEVENTO_COD; 
    property PTIPO: String read FTIPO write SetFTIPO; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 
    property PFORMULA: String read FFORMULA write SetFFORMULA; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassSB_EVENTOS.Consultar(Condicao: string): TDataSource;
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
                  '  SB_EVENTOS.EVENTO_COD, '+ 
                  '  SB_EVENTOS.TIPO, '+ 
                  '  SB_EVENTOS.DESCRICAO, '+ 
                  '  SB_EVENTOS.FORMULA '+ 
                  'FROM SB_EVENTOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassSB_EVENTOS.Carregar: Boolean;
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
                  '  SB_EVENTOS.EVENTO_COD, '+ 
                  '  SB_EVENTOS.TIPO, '+ 
                  '  SB_EVENTOS.DESCRICAO, '+ 
                  '  SB_EVENTOS.FORMULA '+ 
                  'FROM SB_EVENTOS '+
                  'WHERE '+
                  '  SB_EVENTOS.EVENTO_COD = :pEVENTO_COD'; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Open;
        if not IsEmpty then
        begin
          PEVENTO_COD:= FieldByName('EVENTO_COD').AsString; 
          PTIPO:= FieldByName('TIPO').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
          PFORMULA:= FieldByName('FORMULA').AsString; 
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

function TuClassSB_EVENTOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE SB_EVENTOS SET '+
                  '  SB_EVENTOS.TIPO = :pTIPO, '+ 
                  '  SB_EVENTOS.DESCRICAO = :pDESCRICAO, '+ 
                  '  SB_EVENTOS.FORMULA = :pFORMULA '+ 
                    'WHERE '+
                  '  SB_EVENTOS.EVENTO_COD = :pEVENTO_COD '; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pFORMULA').Value := FFORMULA;
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

function TuClassSB_EVENTOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_EVENTOS '+
                    'WHERE '+
                  '  SB_EVENTOS.EVENTO_COD = :pEVENTO_COD '; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
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

function TuClassSB_EVENTOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_EVENTOS ('+
                  '  SB_EVENTOS.EVENTO_COD, '+ 
                  '  SB_EVENTOS.TIPO, '+ 
                  '  SB_EVENTOS.DESCRICAO, '+ 
                  '  SB_EVENTOS.FORMULA'+ 
                  ') VALUES ('+
                  '  :pEVENTO_COD, '+ 
                  '  :pTIPO, '+ 
                  '  :pDESCRICAO, '+ 
                  '  :pFORMULA'; 
        // passa parametros
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pFORMULA').Value := FFORMULA;
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

procedure TuClassSB_EVENTOS.SetFEVENTO_COD(const Value: string);
begin
  FEVENTO_COD := Value;
end; 
procedure TuClassSB_EVENTOS.SetFTIPO(const Value: string);
begin
  FTIPO := Value;
end; 
procedure TuClassSB_EVENTOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 
procedure TuClassSB_EVENTOS.SetFFORMULA(const Value: string);
begin
  FFORMULA := Value;
end; 

end.
