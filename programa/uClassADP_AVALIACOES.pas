unit uClassFP_CARGOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_CARGOS = class 

  private 
    FCARGO_COD: String; 
    FDESCRICAO: String; 
    FSALARIO_MINIMO: String; 
    FSALARIO_MAXIMO: String; 
    FSALARIO_MEDIO: String; 
    FDEPARTAMENTO_COD: String; 
    FTIP_CAR_COD: String; 
    FHORAS_TOTAIS: String; 
    procedure SetFCARGO_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    procedure SetFSALARIO_MINIMO(const Value: String); 
    procedure SetFSALARIO_MAXIMO(const Value: String); 
    procedure SetFSALARIO_MEDIO(const Value: String); 
    procedure SetFDEPARTAMENTO_COD(const Value: String); 
    procedure SetFTIP_CAR_COD(const Value: String); 
    procedure SetFHORAS_TOTAIS(const Value: String); 

  public 
    {Propriedades da classe}
    property PCARGO_COD: String read FCARGO_COD write SetFCARGO_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 
    property PSALARIO_MINIMO: String read FSALARIO_MINIMO write SetFSALARIO_MINIMO; 
    property PSALARIO_MAXIMO: String read FSALARIO_MAXIMO write SetFSALARIO_MAXIMO; 
    property PSALARIO_MEDIO: String read FSALARIO_MEDIO write SetFSALARIO_MEDIO; 
    property PDEPARTAMENTO_COD: String read FDEPARTAMENTO_COD write SetFDEPARTAMENTO_COD; 
    property PTIP_CAR_COD: String read FTIP_CAR_COD write SetFTIP_CAR_COD; 
    property PHORAS_TOTAIS: String read FHORAS_TOTAIS write SetFHORAS_TOTAIS; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassFP_CARGOS.Consultar(Condicao: string): TDataSource;
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
                  '  FP_CARGOS.CARGO_COD, '+ 
                  '  FP_CARGOS.DESCRICAO, '+ 
                  '  FP_CARGOS.SALARIO_MINIMO, '+ 
                  '  FP_CARGOS.SALARIO_MAXIMO, '+ 
                  '  FP_CARGOS.SALARIO_MEDIO, '+ 
                  '  FP_CARGOS.DEPARTAMENTO_COD, '+ 
                  '  FP_CARGOS.TIP_CAR_COD, '+ 
                  '  FP_CARGOS.HORAS_TOTAIS '+ 
                  'FROM FP_CARGOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_CARGOS.Carregar: Boolean;
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
                  '  FP_CARGOS.CARGO_COD, '+ 
                  '  FP_CARGOS.DESCRICAO, '+ 
                  '  FP_CARGOS.SALARIO_MINIMO, '+ 
                  '  FP_CARGOS.SALARIO_MAXIMO, '+ 
                  '  FP_CARGOS.SALARIO_MEDIO, '+ 
                  '  FP_CARGOS.DEPARTAMENTO_COD, '+ 
                  '  FP_CARGOS.TIP_CAR_COD, '+ 
                  '  FP_CARGOS.HORAS_TOTAIS '+ 
                  'FROM FP_CARGOS '+
                  'WHERE '+
                  '  FP_CARGOS.DEPARTAMENTO_COD = :pDEPARTAMENTO_COD AND '+ 
                  '  FP_CARGOS.CARGO_COD = :pCARGO_COD AND '+ 
                  '  FP_CARGOS.TIP_CAR_COD = :pTIP_CAR_COD'; 
        Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FDEPARTAMENTO_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pTIP_CAR_COD').Value := FTIP_CAR_COD;
        Open;
        if not IsEmpty then
        begin
          PCARGO_COD:= FieldByName('CARGO_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
          PSALARIO_MINIMO:= FieldByName('SALARIO_MINIMO').AsString; 
          PSALARIO_MAXIMO:= FieldByName('SALARIO_MAXIMO').AsString; 
          PSALARIO_MEDIO:= FieldByName('SALARIO_MEDIO').AsString; 
          PDEPARTAMENTO_COD:= FieldByName('DEPARTAMENTO_COD').AsString; 
          PTIP_CAR_COD:= FieldByName('TIP_CAR_COD').AsString; 
          PHORAS_TOTAIS:= FieldByName('HORAS_TOTAIS').AsString; 
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

function TuClassFP_CARGOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_CARGOS SET '+
                  '  FP_CARGOS.CARGO_COD = :pCARGO_COD, '+ 
                  '  FP_CARGOS.DESCRICAO = :pDESCRICAO, '+ 
                  '  FP_CARGOS.SALARIO_MINIMO = :pSALARIO_MINIMO, '+ 
                  '  FP_CARGOS.SALARIO_MAXIMO = :pSALARIO_MAXIMO, '+ 
                  '  FP_CARGOS.SALARIO_MEDIO = :pSALARIO_MEDIO, '+ 
                  '  FP_CARGOS.DEPARTAMENTO_COD = :pDEPARTAMENTO_COD, '+ 
                  '  FP_CARGOS.TIP_CAR_COD = :pTIP_CAR_COD, '+ 
                  '  FP_CARGOS.HORAS_TOTAIS = :pHORAS_TOTAIS '+ 
                    'WHERE '+
                  '  FP_CARGOS.DEPARTAMENTO_COD = :pDEPARTAMENTO_COD, '+ 
                  '  FP_CARGOS.CARGO_COD = :pCARGO_COD, '+ 
                  '  FP_CARGOS.TIP_CAR_COD = :pTIP_CAR_COD '; 
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pSALARIO_MINIMO').Value := FSALARIO_MINIMO;
        Parameters.ParamByName('pSALARIO_MAXIMO').Value := FSALARIO_MAXIMO;
        Parameters.ParamByName('pSALARIO_MEDIO').Value := FSALARIO_MEDIO;
        Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FDEPARTAMENTO_COD;
        Parameters.ParamByName('pTIP_CAR_COD').Value := FTIP_CAR_COD;
        Parameters.ParamByName('pHORAS_TOTAIS').Value := FHORAS_TOTAIS;
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

function TuClassFP_CARGOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from FP_CARGOS '+
                    'WHERE '+
                  '  FP_CARGOS.DEPARTAMENTO_COD = :pDEPARTAMENTO_COD, '+ 
                  '  FP_CARGOS.CARGO_COD = :pCARGO_COD, '+ 
                  '  FP_CARGOS.TIP_CAR_COD = :pTIP_CAR_COD '; 
        Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FDEPARTAMENTO_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pTIP_CAR_COD').Value := FTIP_CAR_COD;
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

function TuClassFP_CARGOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_CARGOS ('+
                  '  FP_CARGOS.CARGO_COD, '+ 
                  '  FP_CARGOS.DESCRICAO, '+ 
                  '  FP_CARGOS.SALARIO_MINIMO, '+ 
                  '  FP_CARGOS.SALARIO_MAXIMO, '+ 
                  '  FP_CARGOS.SALARIO_MEDIO, '+ 
                  '  FP_CARGOS.DEPARTAMENTO_COD, '+ 
                  '  FP_CARGOS.TIP_CAR_COD, '+ 
                  '  FP_CARGOS.HORAS_TOTAIS'+ 
                  ') VALUES ('+
                  '  :pCARGO_COD, '+ 
                  '  :pDESCRICAO, '+ 
                  '  :pSALARIO_MINIMO, '+ 
                  '  :pSALARIO_MAXIMO, '+ 
                  '  :pSALARIO_MEDIO, '+ 
                  '  :pDEPARTAMENTO_COD, '+ 
                  '  :pTIP_CAR_COD, '+ 
                  '  :pHORAS_TOTAIS'; 
        // passa parametros
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pSALARIO_MINIMO').Value := FSALARIO_MINIMO;
        Parameters.ParamByName('pSALARIO_MAXIMO').Value := FSALARIO_MAXIMO;
        Parameters.ParamByName('pSALARIO_MEDIO').Value := FSALARIO_MEDIO;
        Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FDEPARTAMENTO_COD;
        Parameters.ParamByName('pTIP_CAR_COD').Value := FTIP_CAR_COD;
        Parameters.ParamByName('pHORAS_TOTAIS').Value := FHORAS_TOTAIS;
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

procedure TuClassFP_CARGOS.SetFCARGO_COD(const Value: string);
begin
  FCARGO_COD := Value;
end; 
procedure TuClassFP_CARGOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 
procedure TuClassFP_CARGOS.SetFSALARIO_MINIMO(const Value: string);
begin
  FSALARIO_MINIMO := Value;
end; 
procedure TuClassFP_CARGOS.SetFSALARIO_MAXIMO(const Value: string);
begin
  FSALARIO_MAXIMO := Value;
end; 
procedure TuClassFP_CARGOS.SetFSALARIO_MEDIO(const Value: string);
begin
  FSALARIO_MEDIO := Value;
end; 
procedure TuClassFP_CARGOS.SetFDEPARTAMENTO_COD(const Value: string);
begin
  FDEPARTAMENTO_COD := Value;
end; 
procedure TuClassFP_CARGOS.SetFTIP_CAR_COD(const Value: string);
begin
  FTIP_CAR_COD := Value;
end; 
procedure TuClassFP_CARGOS.SetFHORAS_TOTAIS(const Value: string);
begin
  FHORAS_TOTAIS := Value;
end; 

end.
