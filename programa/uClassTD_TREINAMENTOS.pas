unit uClassTD_TREINAMENTOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TREINAMENTOS = class 

  private 
    FTREINAMENTO_COD: String; 
    FDESCRICAO: String; 
    FDATA_INICIO: String; 
    FDATA_FIM: String; 
    FTURMA_COD: String; 
    FOBJETIVO_COD: String; 
    FMETODO_COD: String; 
    FINSTRUTOR_COD: String; 
    procedure SetFTREINAMENTO_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    procedure SetFDATA_INICIO(const Value: String); 
    procedure SetFDATA_FIM(const Value: String); 
    procedure SetFTURMA_COD(const Value: String); 
    procedure SetFOBJETIVO_COD(const Value: String); 
    procedure SetFMETODO_COD(const Value: String); 
    procedure SetFINSTRUTOR_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PTREINAMENTO_COD: String read FTREINAMENTO_COD write SetFTREINAMENTO_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 
    property PDATA_INICIO: String read FDATA_INICIO write SetFDATA_INICIO; 
    property PDATA_FIM: String read FDATA_FIM write SetFDATA_FIM; 
    property PTURMA_COD: String read FTURMA_COD write SetFTURMA_COD; 
    property POBJETIVO_COD: String read FOBJETIVO_COD write SetFOBJETIVO_COD; 
    property PMETODO_COD: String read FMETODO_COD write SetFMETODO_COD; 
    property PINSTRUTOR_COD: String read FINSTRUTOR_COD write SetFINSTRUTOR_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_TREINAMENTOS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TREINAMENTOS.TREINAMENTO_COD, '+ 
                  '  TD_TREINAMENTOS.DESCRICAO '+
                  'FROM TD_TREINAMENTOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TREINAMENTOS.Carregar: Boolean;
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
                  '  TD_TREINAMENTOS.TREINAMENTO_COD, '+ 
                  '  TD_TREINAMENTOS.DESCRICAO, '+ 
                  '  TD_TREINAMENTOS.DATA_INICIO, '+ 
                  '  TD_TREINAMENTOS.DATA_FIM, '+ 
                  '  TD_TREINAMENTOS.TURMA_COD, '+ 
                  '  TD_TREINAMENTOS.OBJETIVO_COD, '+ 
                  '  TD_TREINAMENTOS.METODO_COD, '+ 
                  '  TD_TREINAMENTOS.INSTRUTOR_COD '+ 
                  'FROM TD_TREINAMENTOS '+
                  'WHERE '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+ 
                  '  TD_TREINAMENTOS.METODO_COD = :pMETODO_COD AND '+ 
                  '  TD_TREINAMENTOS.TURMA_COD = :pTURMA_COD AND '+ 
                  '  TD_TREINAMENTOS.INSTRUTOR_COD = :pINSTRUTOR_COD AND '+ 
                  '  TD_TREINAMENTOS.OBJETIVO_COD = :pOBJETIVO_COD'; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Open;
        if not IsEmpty then
        begin
          PTREINAMENTO_COD:= FieldByName('TREINAMENTO_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
          PDATA_INICIO:= FieldByName('DATA_INICIO').AsString; 
          PDATA_FIM:= FieldByName('DATA_FIM').AsString; 
          PTURMA_COD:= FieldByName('TURMA_COD').AsString; 
          POBJETIVO_COD:= FieldByName('OBJETIVO_COD').AsString; 
          PMETODO_COD:= FieldByName('METODO_COD').AsString; 
          PINSTRUTOR_COD:= FieldByName('INSTRUTOR_COD').AsString; 
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

function TuClassTD_TREINAMENTOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TREINAMENTOS SET '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_TREINAMENTOS.DESCRICAO = :pDESCRICAO, '+ 
                  '  TD_TREINAMENTOS.DATA_INICIO = TO_DATE(:pDATA_INICIO,''DD/MM/RR''), '+ 
                  '  TD_TREINAMENTOS.DATA_FIM = TO_DATE(:pDATA_FIM,''DD/MM/RR''), '+ 
                  '  TD_TREINAMENTOS.TURMA_COD = :pTURMA_COD, '+ 
                  '  TD_TREINAMENTOS.OBJETIVO_COD = :pOBJETIVO_COD, '+ 
                  '  TD_TREINAMENTOS.METODO_COD = :pMETODO_COD, '+ 
                  '  TD_TREINAMENTOS.INSTRUTOR_COD = :pINSTRUTOR_COD '+ 
                    'WHERE '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_TREINAMENTOS.METODO_COD = :pMETODO_COD, '+ 
                  '  TD_TREINAMENTOS.TURMA_COD = :pTURMA_COD, '+ 
                  '  TD_TREINAMENTOS.INSTRUTOR_COD = :pINSTRUTOR_COD, '+ 
                  '  TD_TREINAMENTOS.OBJETIVO_COD = :pOBJETIVO_COD '; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pDATA_INICIO').Value := FDATA_INICIO;
        Parameters.ParamByName('pDATA_FIM').Value := FDATA_FIM;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
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

function TuClassTD_TREINAMENTOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TREINAMENTOS WHERE '+
                    'TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
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

function TuClassTD_TREINAMENTOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TREINAMENTOS ('+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD, '+
                  '  TD_TREINAMENTOS.DESCRICAO, '+
                  '  TD_TREINAMENTOS.DATA_INICIO, '+
                  '  TD_TREINAMENTOS.DATA_FIM, '+
                  '  TD_TREINAMENTOS.TURMA_COD, '+
                  '  TD_TREINAMENTOS.OBJETIVO_COD, '+
                  '  TD_TREINAMENTOS.METODO_COD, '+
                  '  TD_TREINAMENTOS.INSTRUTOR_COD'+
                  ') VALUES ('+
                  '  :pTREINAMENTO_COD, '+
                  '  :pDESCRICAO, '+
                  '  TO_DATE(:pDATA_INICIO,''DD/MM/RR''), '+
                  '  TO_DATE(:pDATA_FIM,''DD/MM/RR''), '+
                  '  :pTURMA_COD, '+
                  '  :pOBJETIVO_COD, '+
                  '  :pMETODO_COD, '+
                  '  :pINSTRUTOR_COD)';
        // passa parametros
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pDATA_INICIO').Value := FDATA_INICIO;
        Parameters.ParamByName('pDATA_FIM').Value := FDATA_FIM;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pOBJETIVO_COD').Value := FOBJETIVO_COD;
        Parameters.ParamByName('pMETODO_COD').Value := FMETODO_COD;
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
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

procedure TuClassTD_TREINAMENTOS.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFDATA_INICIO(const Value: string);
begin
  FDATA_INICIO := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFDATA_FIM(const Value: string);
begin
  FDATA_FIM := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFTURMA_COD(const Value: string);
begin
  FTURMA_COD := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFOBJETIVO_COD(const Value: string);
begin
  FOBJETIVO_COD := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFMETODO_COD(const Value: string);
begin
  FMETODO_COD := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFINSTRUTOR_COD(const Value: string);
begin
  FINSTRUTOR_COD := Value;
end;

end.
