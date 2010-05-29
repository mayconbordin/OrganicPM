unit uClassTD_OBJETIVOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_OBJETIVOS = class 

  private 
    FOBJETIVO_COD: String; 
    FDESCRICAO: String; 
    FFINALIDADE: String; 
    procedure SetFOBJETIVO_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    procedure SetFFINALIDADE(const Value: String); 

  public 
    {Propriedades da classe}
    property POBJETIVO_COD: String read FOBJETIVO_COD write SetFOBJETIVO_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 
    property PFINALIDADE: String read FFINALIDADE write SetFFINALIDADE; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_OBJETIVOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_OBJETIVOS.OBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS.DESCRICAO, '+ 
                  '  TD_OBJETIVOS.FINALIDADE '+ 
                  'FROM TD_OBJETIVOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_OBJETIVOS.Carregar: Boolean;
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
                  '  TD_OBJETIVOS.OBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS.DESCRICAO, '+ 
                  '  TD_OBJETIVOS.FINALIDADE '+ 
                  'FROM TD_OBJETIVOS '+
                  'WHERE '+
                  '  TD_OBJETIVOS.OBJETIVO_COD = :pOBJETIVO_COD'; 
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Open;
        if not IsEmpty then
        begin
          POBJETIVO_COD:= FieldByName('OBJETIVO_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
          PFINALIDADE:= FieldByName('FINALIDADE').AsString; 
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

function TuClassTD_OBJETIVOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_OBJETIVOS SET '+
                  '  TD_OBJETIVOS.OBJETIVO_COD = :pOBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS.DESCRICAO = :pDESCRICAO, '+ 
                  '  TD_OBJETIVOS.FINALIDADE = :pFINALIDADE '+ 
                    'WHERE '+
                  '  TD_OBJETIVOS.OBJETIVO_COD = :pOBJETIVO_COD '; 
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pFINALIDADE').Value := FFINALIDADE;
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

function TuClassTD_OBJETIVOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_OBJETIVOS '+
                    'WHERE '+
                  '  TD_OBJETIVOS.OBJETIVO_COD = :pOBJETIVO_COD '; 
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
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

function TuClassTD_OBJETIVOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_OBJETIVOS ('+
                  '  TD_OBJETIVOS.OBJETIVO_COD, '+ 
                  '  TD_OBJETIVOS.DESCRICAO, '+ 
                  '  TD_OBJETIVOS.FINALIDADE'+ 
                  ') VALUES ('+
                  '  :pOBJETIVO_COD, '+ 
                  '  :pDESCRICAO, '+ 
                  '  :pFINALIDADE'; 
        // passa parametros
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pFINALIDADE').Value := FFINALIDADE;
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

procedure TuClassTD_OBJETIVOS.SetFOBJETIVO_COD(const Value: string);
begin
  FOBJETIVO_COD := Value;
end; 
procedure TuClassTD_OBJETIVOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 
procedure TuClassTD_OBJETIVOS.SetFFINALIDADE(const Value: string);
begin
  FFINALIDADE := Value;
end; 

end;
