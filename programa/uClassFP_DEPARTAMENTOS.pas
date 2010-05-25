unit uClassFP_DEPARTAMENTOS;

interface

Uses ADODB, DB, SysUtils;

Type
  TuClassDepartamentos = class

    private
    FPDESCRICAO: string;
    FPDEPARTAMENTO_COD: integer;
    procedure SetPDEPARTAMENTO_COD(const Value: integer);
    procedure SetPDESCRICAO(const Value: string);


    public

    property PDEPARTAMENTO_COD:integer read FPDEPARTAMENTO_COD write SetPDEPARTAMENTO_COD;
    property PDESCRICAO: string read FPDESCRICAO write SetPDESCRICAO;

    function Salvar:Boolean;
    function Editar:Boolean;
    function Excluir:Boolean;
    function Carregar: Boolean;
    function Consultar(condicao:string):TDataSource;

  end;

implementation

uses uClassConexao;

{ TuClassDepartamentos }

function TuClassDepartamentos.Carregar: Boolean;
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
          SQL.Text := 'select DESCRICAO from FP_DEPARTAMENTOS '+
                      'where DEPARTAMENTO_COD = :pDEPARTAMENTO_COD';

          Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FPDEPARTAMENTO_COD;
          Open;

          if not IsEmpty then
            begin
              PDESCRICAO := FieldByName('DESCRICAO').AsString;
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

function TuClassDepartamentos.Consultar(condicao: string): TDataSource;
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
          SQL.Text := 'select DEPARTAMENTO_COD, DESCRICAO from FP_DEPARTAMENTOS '+Condicao;

          Open;
        end;

      ds.DataSet := Qry;
      Result := ds;

  except on E: Exception do
    raise Exception.Create('Ops! Ocorreu um erro na consulta: '+e.Message);
  end;
end;

function TuClassDepartamentos.Editar: Boolean;
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

          SQL.Text := 'update FP_DEPARTAMENTOS set DESCRICAO = :pDESCRICAO '+
                      'where DEPARTAMENTO_COD = :pDEPARTAMENTO_COD';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;
          Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FPDEPARTAMENTO_COD;              //Passando os parâmetros

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

function TuClassDepartamentos.Excluir: Boolean;
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
          SQL.Text := 'delete from FP_DEPARTAMENTOS where DEPARTAMENTO_COD = :pDEPARTAMENTO_COD';

          Parameters.ParamByName('pDEPARTAMENTO_COD').Value := FPDEPARTAMENTO_COD;

          ExecSQL;
          Result := True;
        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
  end;

end;

function TuClassDepartamentos.Salvar: Boolean;
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

          SQL.Text := 'insert into FP_DEPARTAMENTOS (DESCRICAO) values '+
                      '(:pDESCRICAO)';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;

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

procedure TuClassDepartamentos.SetPDEPARTAMENTO_COD(const Value: integer);
begin
  FPDEPARTAMENTO_COD := Value;
end;

procedure TuClassDepartamentos.SetPDESCRICAO(const Value: string);
begin
  FPDESCRICAO := Value;
end;

end.
