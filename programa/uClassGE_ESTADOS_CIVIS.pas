unit uClassGE_ESTADOS_CIVIS; 

interface 

Uses ADODB, DB, SysUtils, Controls;

Type
  TuClassGE_ESTADOS_CIVIS = class 

  private 
    FEST_CIV_COD: String; 
    FDESCRICAO: String; 
    procedure SetFEST_CIV_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 

  public 
    {Propriedades da classe}
    property PEST_CIV_COD: String read FEST_CIV_COD write SetFEST_CIV_COD; 
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

function TuClassGE_ESTADOS_CIVIS.Consultar(Condicao: string): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil); 
    ds := TDataSource.Create(nil); 
    if Condicao <> '' then 
      Condicao := 'where('+Condicao+')'; 
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.Text := 'SELECT '+
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD, '+ 
                  '  GE_ESTADOS_CIVIS.DESCRICAO '+ 
                  'FROM GE_ESTADOS_CIVIS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassGE_ESTADOS_CIVIS.Carregar: Boolean;
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
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD, '+ 
                  '  GE_ESTADOS_CIVIS.DESCRICAO '+ 
                  'FROM GE_ESTADOS_CIVIS '+
                  'WHERE '+
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD = :pEST_CIV_COD'; 
        Parameters.ParamByName('pEST_CIV_COD').Value := FEST_CIV_COD;
        Open;
        if not IsEmpty then
        begin
          PEST_CIV_COD:= FieldByName('EST_CIV_COD').AsString; 
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

function TuClassGE_ESTADOS_CIVIS.Editar: Boolean;
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
        SQL.Text := 'UPDATE GE_ESTADOS_CIVIS SET '+
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD = :pEST_CIV_COD, '+ 
                  '  GE_ESTADOS_CIVIS.DESCRICAO = :pDESCRICAO '+ 
                    'WHERE '+
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD = :pEST_CIV_COD '; 
        Parameters.ParamByName('pEST_CIV_COD').Value := FEST_CIV_COD;
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

function TuClassGE_ESTADOS_CIVIS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from GE_ESTADOS_CIVIS '+
                    'WHERE '+
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD = :pEST_CIV_COD '; 
        Parameters.ParamByName('pEST_CIV_COD').Value := FEST_CIV_COD;
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

function TuClassGE_ESTADOS_CIVIS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO GE_ESTADOS_CIVIS ('+
                  '  GE_ESTADOS_CIVIS.EST_CIV_COD, '+ 
                  '  GE_ESTADOS_CIVIS.DESCRICAO'+ 
                  ') VALUES ('+
                  '  :pEST_CIV_COD, '+ 
                  '  :pDESCRICAO'; 
        // passa parametros
        Parameters.ParamByName('pEST_CIV_COD').Value := FEST_CIV_COD;
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

procedure TuClassGE_ESTADOS_CIVIS.SetFEST_CIV_COD(const Value: string);
begin
  FEST_CIV_COD := Value;
end;
procedure TuClassGE_ESTADOS_CIVIS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end;

end.

