unit uClassTiposCargo;

interface

Uses ADODB, DB, SysUtils;

Type
  TuClassTiposCargo = class

    private
    FPDESCRICAO: string;
    FPTIP_CAR_COD: Integer;
    procedure SetPDESCRICAO(const Value: string);
    procedure SetPTIP_CAR_COD(const Value: Integer);


    public

    property PTIP_CAR_COD: Integer read FPTIP_CAR_COD write SetPTIP_CAR_COD;
    property PDESCRICAO:string read FPDESCRICAO write SetPDESCRICAO;

    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Carregar: Boolean;
    function Consultar(condicao:string): TDataSource;

  end;

implementation

uses uClassConexao;

{ TuClassTiposCargo }

function TuClassTiposCargo.Carregar: Boolean;
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
          SQL.Text := 'select DESCRICAO from FP_TIPOS_CARGO '+
                      'where TIP_CAR_COD = :pTIP_CAR_COD';

          Parameters.ParamByName('pTIP_CAR_COD').Value := FPTIP_CAR_COD;
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

function TuClassTiposCargo.Consultar(condicao: string): TDataSource;
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
          SQL.Text := 'select TIP_CAR_COD, DESCRICAO from FP_TIPOS_CARGO '+Condicao;

          Open;
        end;

      ds.DataSet := Qry;
      Result := ds;

  except on E: Exception do
    raise Exception.Create('Ops! Ocorreu um erro na consulta: '+e.Message);
  end;

end;

function TuClassTiposCargo.Editar: Boolean;
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

          SQL.Text := 'update FP_TIPOS_CARGO set DESCRICAO = :pDESCRICAO '+
                      'where TIP_CAR_COD = :pTIP_CAR_COD';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;
          Parameters.ParamByName('pTIP_CAR_COD').Value := FPTIP_CAR_COD;              //Passando os parâmetros

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

function TuClassTiposCargo.Excluir: Boolean;
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
          SQL.Text := 'delete from FP_TIPOS_CARGO where TIP_CAR_COD = :pTIP_CAR_COD';

          Parameters.ParamByName('pTIP_CAR_COD').Value := FPTIP_CAR_COD;

          ExecSQL;
          Result := True;
        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
 end;  
end;

function TuClassTiposCargo.Salvar: Boolean;
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

          SQL.Text := 'insert into FP_TIPOS_CARGO (DESCRICAO) values '+
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

procedure TuClassTiposCargo.SetPDESCRICAO(const Value: string);
begin
  FPDESCRICAO := Value;
end;

procedure TuClassTiposCargo.SetPTIP_CAR_COD(const Value: Integer);
begin
  FPTIP_CAR_COD := Value;
end;

end.
