unit uClassADP_AVALIACAO_TIPO;

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassADP_AVALIACAO_TIPO = class 

  private
    FTIPO: String; 
    FDESCRICAO: String; 
    procedure SetFTIPO(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    function AutoIncremento():Integer;
  public 
    {Propriedades da classe}
    property PTIPO: String read FTIPO write SetFTIPO; 
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

function TuClassADP_AVALIACAO_TIPO.Consultar(Condicao: string): TDataSource;
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
                  '  ADP_AVALIACAO_TIPO.TIPO, '+ 
                  '  ADP_AVALIACAO_TIPO.DESCRICAO '+ 
                  'FROM ADP_AVALIACAO_TIPO '+Condicao+
                  ' ORDER BY DESCRICAO ASC';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassADP_AVALIACAO_TIPO.AutoIncremento: Integer;
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
          SQL.Text := 'select MAX(TIPO)+1 AUTO_INC from ADP_AVALIACAO_TIPO';

          Open;
          if not IsEmpty then
            Result := Fields[0].AsInteger
          else
            Result := 1;

        end;
    finally
      Qry.Free;
    end;   
  except on E: Exception do
    raise Exception.Create('Ops! Ocorreu um erro: '+e.Message);
  end;
end;

function TuClassADP_AVALIACAO_TIPO.Carregar: Boolean;
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
                  '  ADP_AVALIACAO_TIPO.TIPO, '+ 
                  '  ADP_AVALIACAO_TIPO.DESCRICAO '+ 
                  'FROM ADP_AVALIACAO_TIPO '+
                  'WHERE '+
                  '  ADP_AVALIACAO_TIPO.TIPO = :pTIPO'; 
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Open;
        if not IsEmpty then
        begin
          PTIPO:= FieldByName('TIPO').AsString; 
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

function TuClassADP_AVALIACAO_TIPO.Editar: Boolean;
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
        SQL.Text := 'UPDATE ADP_AVALIACAO_TIPO SET '+
                  '  ADP_AVALIACAO_TIPO.DESCRICAO = :pDESCRICAO '+ 
                    'WHERE '+
                  '  ADP_AVALIACAO_TIPO.TIPO = :pTIPO '; 
        Parameters.ParamByName('pTIPO').Value := FTIPO;
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

function TuClassADP_AVALIACAO_TIPO.Excluir: Boolean;
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
        SQL.Text := 'DELETE from ADP_AVALIACAO_TIPO '+
                    'WHERE '+
                  '  ADP_AVALIACAO_TIPO.TIPO = :pTIPO '; 
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

function TuClassADP_AVALIACAO_TIPO.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO ADP_AVALIACAO_TIPO ('+
                  '  ADP_AVALIACAO_TIPO.TIPO, '+ 
                  '  ADP_AVALIACAO_TIPO.DESCRICAO'+ 
                  ') VALUES ('+
                  '  :pTIPO, '+ 
                  '  :pDESCRICAO)'; 
        // passa parametros
        Parameters.ParamByName('pTIPO').Value := AutoIncremento;
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

procedure TuClassADP_AVALIACAO_TIPO.SetFTIPO(const Value: string);
begin
  FTIPO := Value;
end; 
procedure TuClassADP_AVALIACAO_TIPO.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 

end.
