unit uClassAtributos;

interface

Uses ADODB, DB, SysUtils;

Type
  TuClassAtributos = class

    private
    FPDESCRICAO: string;
    FPATRIBUTO_COD: integer;
    FPTIPO: string;
    procedure SetPATRIBUTO_COD(const Value: integer);
    procedure SetPDESCRICAO(const Value: string);
    procedure SetPTIPO(const Value: string);

    public

    property PATRIBUTO_COD:integer read FPATRIBUTO_COD write SetPATRIBUTO_COD;
    property PDESCRICAO:string read FPDESCRICAO write SetPDESCRICAO;
    property PTIPO:string read FPTIPO write SetPTIPO;

    function Salvar:Boolean;
    function Editar:Boolean;
    function Excluir:Boolean;
    function Carregar:Boolean;
    function Consultar(condicao:string): TDataSource;

end;

implementation

uses uClassConexao;

{ TuClassAtributos }

function TuClassAtributos.Carregar: Boolean;
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
          SQL.Text := 'select DESCRICAO, TIPO from FP_ATRIBUTOS '+
                      'where ATRIBUTO_COD = :pATRIBUTO_COD';

          Parameters.ParamByName('pATRIBUTO_COD').Value := FPATRIBUTO_COD;
          Open;

          if not IsEmpty then
            begin
              PDESCRICAO := FieldByName('DESCRICAO').AsString;
              PTIPO := FieldByName('TIPO').AsString;
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

function TuClassAtributos.Consultar(condicao: string): TDataSource;
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
          SQL.Text := 'select ATRIBUTO_COD, DESCRICAO, TIPO from FP_ATRIBUTOS '+Condicao;

          Open;
        end;

      ds.DataSet := Qry;
      Result := ds;

  except on E: Exception do
    raise Exception.Create('Ops! Ocorreu um erro na consulta: '+e.Message);
  end;
end;

function TuClassAtributos.Editar: Boolean;
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

          SQL.Text := 'update FP_ATRIBUTOS set DESCRICAO = :pDESCRICAO, TIPO = :pTIPO '+
                      'where ATRIBUTO_COD = :pATRIBUTO_COD';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;
          Parameters.ParamByName('pTIPO').Value := FPTIPO;              //Passando os parâmetros
          Parameters.ParamByName('pATRIBUTO_COD').Value := FPATRIBUTO_COD;

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

function TuClassAtributos.Excluir: Boolean;
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
          SQL.Text := 'delete from FP_ATRIBUTOS where ATRIBUTO_COD = :pATRIBUTO_COD';

          Parameters.ParamByName('pATRIBUTO_COD').Value := FPATRIBUTO_COD;

          ExecSQL;
          Result := True;
        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
 end;
end;

function TuClassAtributos.Salvar: Boolean;
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

          SQL.Text := 'insert into FP_ATRIBUTOS (DESCRICAO, TIPO) values '+
                      '(:pDESCRICAO, :pTIPO)';


          Parameters.ParamByName('pDESCRICAO').Value := FPDESCRICAO;
          Parameters.ParamByName('pTIPO').Value := FPTIPO;

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

procedure TuClassAtributos.SetPATRIBUTO_COD(const Value: integer);
begin
  FPATRIBUTO_COD := Value;
end;

procedure TuClassAtributos.SetPDESCRICAO(const Value: string);
begin
  FPDESCRICAO := Value;
end;

procedure TuClassAtributos.SetPTIPO(const Value: string);
begin
  FPTIPO := Value;
end;

end.
