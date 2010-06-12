unit uClassSB_TIPO_FOLHA; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_TIPO_FOLHA = class 

  private 
    FTIP_FOL_COD: String; 
    FDESCRICAO: String; 
    procedure SetFTIP_FOL_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 

  public 
    {Propriedades da classe}
    property PTIP_FOL_COD: String read FTIP_FOL_COD write SetFTIP_FOL_COD; 
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

function TuClassSB_TIPO_FOLHA.Consultar(Condicao: string): TDataSource;
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
                  '  SB_TIPO_FOLHA.TIP_FOL_COD, '+ 
                  '  SB_TIPO_FOLHA.DESCRICAO '+ 
                  'FROM SB_TIPO_FOLHA '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassSB_TIPO_FOLHA.Carregar: Boolean;
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
                  '  SB_TIPO_FOLHA.TIP_FOL_COD, '+ 
                  '  SB_TIPO_FOLHA.DESCRICAO '+ 
                  'FROM SB_TIPO_FOLHA '+
                  'WHERE '+
                  '  SB_TIPO_FOLHA.TIP_FOL_COD = :pTIP_FOL_COD'; 
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
        Open;
        if not IsEmpty then
        begin
          PTIP_FOL_COD:= FieldByName('TIP_FOL_COD').AsString; 
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

function TuClassSB_TIPO_FOLHA.Editar: Boolean;
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
        SQL.Text := 'UPDATE SB_TIPO_FOLHA SET '+
                  '  SB_TIPO_FOLHA.TIP_FOL_COD = :pTIP_FOL_COD, '+ 
                  '  SB_TIPO_FOLHA.DESCRICAO = :pDESCRICAO '+ 
                    'WHERE '+
                  '  SB_TIPO_FOLHA.TIP_FOL_COD = :pTIP_FOL_COD '; 
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
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

function TuClassSB_TIPO_FOLHA.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_TIPO_FOLHA '+
                    'WHERE '+
                  '  SB_TIPO_FOLHA.TIP_FOL_COD = :pTIP_FOL_COD '; 
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
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

function TuClassSB_TIPO_FOLHA.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_TIPO_FOLHA ('+
                  '  SB_TIPO_FOLHA.TIP_FOL_COD, '+ 
                  '  SB_TIPO_FOLHA.DESCRICAO'+ 
                  ') VALUES ('+
                  '  :pTIP_FOL_COD, '+ 
                  '  :pDESCRICAO'; 
        // passa parametros
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
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

procedure TuClassSB_TIPO_FOLHA.SetFTIP_FOL_COD(const Value: string);
begin
  FTIP_FOL_COD := Value;
end; 
procedure TuClassSB_TIPO_FOLHA.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 

end;
