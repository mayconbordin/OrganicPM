unit uClassGE_UNIDADES_FEDERATIVAS; 

interface 

Uses ADODB, DB, SysUtils, Controls;

Type
  TuClassGE_UNIDADES_FEDERATIVAS = class 

  private 
    FUNI_FED_COD: String; 
    FNOME: String; 
    procedure SetFUNI_FED_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 

  public 
    {Propriedades da classe}
    property PUNI_FED_COD: String read FUNI_FED_COD write SetFUNI_FED_COD; 
    property PNOME: String read FNOME write SetFNOME; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassGE_UNIDADES_FEDERATIVAS.Consultar(Condicao: string): TDataSource;
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
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD, '+ 
                  '  GE_UNIDADES_FEDERATIVAS.NOME '+ 
                  'FROM GE_UNIDADES_FEDERATIVAS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassGE_UNIDADES_FEDERATIVAS.Carregar: Boolean;
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
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD, '+ 
                  '  GE_UNIDADES_FEDERATIVAS.NOME '+ 
                  'FROM GE_UNIDADES_FEDERATIVAS '+
                  'WHERE '+
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD = :pUNI_FED_COD'; 
        Parameters.ParamByName('pUNI_FED_COD').Value := FUNI_FED_COD;
        Open;
        if not IsEmpty then
        begin
          PUNI_FED_COD:= FieldByName('UNI_FED_COD').AsString; 
          PNOME:= FieldByName('NOME').AsString; 
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

function TuClassGE_UNIDADES_FEDERATIVAS.Editar: Boolean;
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
        SQL.Text := 'UPDATE GE_UNIDADES_FEDERATIVAS SET '+
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD = :pUNI_FED_COD, '+ 
                  '  GE_UNIDADES_FEDERATIVAS.NOME = :pNOME '+ 
                    'WHERE '+
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD = :pUNI_FED_COD '; 
        Parameters.ParamByName('pUNI_FED_COD').Value := FUNI_FED_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
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

function TuClassGE_UNIDADES_FEDERATIVAS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from GE_UNIDADES_FEDERATIVAS '+
                    'WHERE '+
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD = :pUNI_FED_COD '; 
        Parameters.ParamByName('pUNI_FED_COD').Value := FUNI_FED_COD;
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

function TuClassGE_UNIDADES_FEDERATIVAS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO GE_UNIDADES_FEDERATIVAS ('+
                  '  GE_UNIDADES_FEDERATIVAS.UNI_FED_COD, '+ 
                  '  GE_UNIDADES_FEDERATIVAS.NOME'+ 
                  ') VALUES ('+
                  '  :pUNI_FED_COD, '+ 
                  '  :pNOME'; 
        // passa parametros
        Parameters.ParamByName('pUNI_FED_COD').Value := FUNI_FED_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
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

procedure TuClassGE_UNIDADES_FEDERATIVAS.SetFUNI_FED_COD(const Value: string);
begin
  FUNI_FED_COD := Value;
end;
procedure TuClassGE_UNIDADES_FEDERATIVAS.SetFNOME(const Value: string);
begin
  FNOME := Value;
end;

end. 

