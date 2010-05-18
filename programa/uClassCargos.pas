unit uClassCargos;

interface

Uses ADODB, DB, SysUtils;

Type
    TuClassCargos = class

    private
    FPSALARIO_MEDIO: string;
    FPDESCRICAO: string;
    FPSALARIO_MAXIMO: string;
    FPHORAS_TOTAIS: integer;
    FPSALARIO_MINIMO: string;
    FPDEPARTAMENTO_COD: string;
    FPTIP_CAR_COD: integer;
    FPCARGO_COD: Integer;
    procedure SetPCARGO_COD(const Value: Integer);
    procedure SetPDEPARTAMENTO_COD(const Value: string);
    procedure SetPDESCRICAO(const Value: string);
    procedure SetPHORAS_TOTAIS(const Value: integer);
    procedure SetPSALARIO_MAXIMO(const Value: string);
    procedure SetPSALARIO_MEDIO(const Value: string);
    procedure SetPSALARIO_MINIMO(const Value: string);
    procedure SetPTIP_CAR_COD(const Value: integer);

    public

    property PCARGO_COD: Integer read FPCARGO_COD write SetPCARGO_COD;
    property PDESCRICAO: string read FPDESCRICAO write SetPDESCRICAO;
    property PSALARIO_MINIMO:string read FPSALARIO_MINIMO write SetPSALARIO_MINIMO;
    property PSALARIO_MAXIMO:string read FPSALARIO_MAXIMO write SetPSALARIO_MAXIMO;
    property PSALARIO_MEDIO:string read FPSALARIO_MEDIO write SetPSALARIO_MEDIO;
    property PDEPARTAMENTO_COD:string read FPDEPARTAMENTO_COD write SetPDEPARTAMENTO_COD;
    property PTIP_CAR_COD: integer read FPTIP_CAR_COD write SetPTIP_CAR_COD;
    property PHORAS_TOTAIS: integer read FPHORAS_TOTAIS write SetPHORAS_TOTAIS;

    function Salvar:Boolean;
    function Editar: Boolean;
    function Excluir:Boolean;
    function Carregar:Boolean;
    function Consultar(condicao:string): TDataSource;
end;

implementation

uses uClassConexao;


{ TuClassCargos }

function TuClassCargos.Carregar: Boolean;
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
          SQL.Text := 'select DESCRICAO, SALARIO_MINIMO, SALARIO_MAXIMO, SALARIO_MEDIO, '+
                      'DEPARTAMENTO_COD, TIP_CAR_COD, HORAS_TOTAIS from FP_CARGOS '+
                      'where CARGO_COD = :pCARGO_COD'; 

          Parameters.ParamByName('pCARGO_COD').Value := FPCARGO_COD;
          Open;

          if not IsEmpty then
            begin
              PDESCRICAO := FieldByName('DESCRICAO').AsString;
              PSALARIO_MINIMO := FieldByName('SALARIO_MINIMO').AsString;
              PSALARIO_MAXIMO := FieldByName('SALARIO_MAXIMO').AsString;
              PSALARIO_MEDIO := FieldByName('SALARIO_MEDIO').AsString;
              PDEPARTAMENTO_COD := FieldByName('DEPARTAMENTO_COD').AsString;
              PTIP_CAR_COD := FieldByName('TIP_CAR_COD').AsInteger;
              PHORAS_TOTAIS := FieldByName('HORAS_TOTAIS').AsInteger;
              Result := True;
            end;         

        end;  
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Ops! Ocorreu um erro: '+e.Message);
    end;
  end;
  
end;

function TuClassCargos.Consultar(condicao: string): TDataSource;
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
          SQL.Text := 'select CARGO_COD, DESCRICAO, SALARIO_MINIMO, SALARIO_MAXIMO, SALARIO_MEDIO, '+
                      'DEPARTAMENTO_COD, TIP_CAR_COD, HORAS_TOTAIS from FP_CARGOS '+Condicao;

          Open;
        end;

      ds.DataSet := Qry;
      Result := ds;

  except on E: Exception do
    raise Exception.Create('Ops! Ocorreu um erro na consulta: '+e.Message);
  end;
end;

function TuClassCargos.Editar: Boolean;
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

          SQL.Text := 'update FP_CARGOS set DESCRICAO = :pDESCRICAO, SALARIO_MINIMO = :pSALARIO_MINIMO, '+
                      'SALARIO_MAXIMO = :pSALARIO_MAXIMO, SALARIO_MEDIO = :pSALARIO_MEDIO, '+
                      'DEPARTAMENTO_COD = :pDEPARTAMENTO_COD, TIP_CAR_COD = :pTIP_CAR_COD, HORAS_TOTAIS = :pHORAS_TOTAIS '+
                      'where CARGO_COD = :pCARGO_COD';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;
          Parameters.ParamByName('pSALARIO_MINIMO').Value := FPSALARIO_MINIMO;
          Parameters.ParamByName('pSALARIO_MAXIMO').Value := FPSALARIO_MAXIMO;
          Parameters.ParamByName('pSALARIO_MEDIO').Value := FPSALARIO_MEDIO;
          Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FPDEPARTAMENTO_COD;
          Parameters.ParamByName('pTIP_CAR_COD').Value := FPTIP_CAR_COD;
          Parameters.ParamByName('pHORAS_TOTAIS').Value := FPHORAS_TOTAIS;
          Parameters.ParamByName('pCARGO_COD').Value := FPCARGO_COD;

          ExecSQL;
          Result := True;

        end;
    finally
      Qry.Free;
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);
    end;
  end;
end;

function TuClassCargos.Excluir: Boolean;
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
          SQL.Text := 'delete from FP_CARGOS where CARGO_COD = :pCARGO_COD';

          Parameters.ParamByName('pCARGO_COD').Value := FPCARGO_COD;

          ExecSQL;
          Result := True;
        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
  end;
end;

function TuClassCargos.Salvar: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);   //Estanciando o objeto (criando na memória)
    try
      with Qry do
        begin
          Connection := TuClassConexao.ObtemConexao; // Passando a conexão
          Close;

          SQL.Text := 'insert into FP_CARGOS (DESCRICAO, SALARIO_MINIMO, SALARIO_MAXIMO, SALARIO_MEDIO, '+
                      'DEPARTAMENTO_COD, TIP_CAR_COD, HORAS_TOTAIS) VALUES (:pDESCRICAO, :pSALARIO_MINIMO, '+
                      ':pSALARIO_MAXIMO, :pSALARIO_MEDIO, :pDEPARTAMENTO_COD, :pTIPO_CAR_COD, :pHORAS_TOTAIS)';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;
          Parameters.ParamByName('pSALARIO_MINIMO').Value := FPSALARIO_MINIMO;              //Passando os parâmetros
          Parameters.ParamByName('pSALARIO_MAXIMO').Value := FPSALARIO_MAXIMO;
          Parameters.ParamByName('pSALARIO_MEDIO').Value := FPSALARIO_MEDIO;
          Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FPDEPARTAMENTO_COD;
          Parameters.ParamByName('pTIPO_CAR_COD').Value := FPTIP_CAR_COD;
          Parameters.ParamByName('pHORAS_TOTAIS').Value := FPHORAS_TOTAIS;

          ExecSQL;   //Executa a SQL diretamente
          Result := True; //Se não ouver nehum erro, result = true

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

procedure TuClassCargos.SetPCARGO_COD(const Value: Integer);
begin
  FPCARGO_COD := Value;
end;

procedure TuClassCargos.SetPDEPARTAMENTO_COD(const Value: string);
begin
  FPDEPARTAMENTO_COD := Value;
end;

procedure TuClassCargos.SetPDESCRICAO(const Value: string);
begin
  FPDESCRICAO := Value;
end;

procedure TuClassCargos.SetPHORAS_TOTAIS(const Value: integer);
begin
  FPHORAS_TOTAIS := Value;
end;

procedure TuClassCargos.SetPSALARIO_MAXIMO(const Value: string);
begin
  FPSALARIO_MAXIMO := Value;
end;

procedure TuClassCargos.SetPSALARIO_MEDIO(const Value: string);
begin
  FPSALARIO_MEDIO := Value;
end;

procedure TuClassCargos.SetPSALARIO_MINIMO(const Value: string);
begin
  FPSALARIO_MINIMO := Value;
end;

procedure TuClassCargos.SetPTIP_CAR_COD(const Value: integer);
begin
  FPTIP_CAR_COD := Value;
end;

end.
