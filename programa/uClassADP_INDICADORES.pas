unit uClassADP_INDICADORES;

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassADP_INDICADORES = class 

  private 
    FINDICADOR_COD: String; 
    FDESCRICAO: String;
    FATRIBUTO_COD: String;
    procedure SetFINDICADOR_COD(const Value: String);
    procedure SetFDESCRICAO(const Value: String);
    procedure SetFATRIBUTO_COD(const Value:String);
  public 
    {Propriedades da classe}
    property PINDICADOR_COD: String read FINDICADOR_COD write SetFINDICADOR_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO;
    property PATRIBUTO_COD: String read FATRIBUTO_COD write SetFATRIBUTO_COD;
    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassADP_INDICADORES.Consultar(Condicao: string): TDataSource;
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
                  '  ADP_INDICADORES.INDICADOR_COD, '+ 
                  '  ADP_INDICADORES.DESCRICAO, '+
                  '  ADP_INDICADORES.ATRIBUTO_COD, '+
                  '  FP_ATRIBUTOS.DESCRICAO as DESCRICAO_CHA '+
                  'FROM ADP_INDICADORES LEFT OUTER JOIN FP_ATRIBUTOS ON '+
                  '(ADP_INDICADORES.ATRIBUTO_COD = FP_ATRIBUTOS.ATRIBUTO_COD) '+
                  Condicao+' order by ADP_INDICADORES.DESCRICAO asc';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassADP_INDICADORES.Carregar: Boolean;
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
                  '  ADP_INDICADORES.INDICADOR_COD, '+ 
                  '  ADP_INDICADORES.DESCRICAO, '+
                  '  ADP_INDICADORES.ATRIBUTO_COD '+
                  'FROM ADP_INDICADORES '+
                  'WHERE '+
                  '  ADP_INDICADORES.INDICADOR_COD = :pINDICADOR_COD'; 
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Open;
        if not IsEmpty then
        begin
          PINDICADOR_COD:= FieldByName('INDICADOR_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString;
          PATRIBUTO_COD:= FieldByName('ATRIBUTO_COD').AsString;
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

function TuClassADP_INDICADORES.Editar: Boolean;
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
        SQL.Text := 'UPDATE ADP_INDICADORES SET '+
                  '  ADP_INDICADORES.DESCRICAO = :pDESCRICAO, '+
                  '  ADP_INDICADORES.ATRIBUTO_COD = :pATRIBUTO_COD '+
                  '  WHERE '+
                  '  ADP_INDICADORES.INDICADOR_COD = :pINDICADOR_COD ';
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
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

function TuClassADP_INDICADORES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from ADP_INDICADORES '+
                    'WHERE '+
                  '  ADP_INDICADORES.INDICADOR_COD = :pINDICADOR_COD ';

        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
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

function TuClassADP_INDICADORES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO ADP_INDICADORES ('+
                  '  ADP_INDICADORES.INDICADOR_COD, '+ 
                  '  ADP_INDICADORES.DESCRICAO, '+ 
                  '  ADP_INDICADORES.ATRIBUTO_COD'+ 
                  ') VALUES ('+
                  '  :pINDICADOR_COD, '+ 
                  '  :pDESCRICAO, '+ 
                  '  :pATRIBUTO_COD)'; 
        // passa parametros
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
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

procedure TuClassADP_INDICADORES.SetFINDICADOR_COD(const Value: string);
begin
  FINDICADOR_COD := Value;
end; 
procedure TuClassADP_INDICADORES.SetFATRIBUTO_COD(const Value: String);
begin
  FATRIBUTO_COD := Value;
end;
procedure TuClassADP_INDICADORES.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 

end.
