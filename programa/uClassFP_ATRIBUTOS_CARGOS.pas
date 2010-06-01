unit uClassFP_ATRIBUTOS_CARGOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_ATRIBUTOS_CARGOS = class 

  private 
    FCARGO_COD: String; 
    FATRIBUTO_COD: String; 
    FSTATUS: String; 
    procedure SetFCARGO_COD(const Value: String); 
    procedure SetFATRIBUTO_COD(const Value: String); 
    procedure SetFSTATUS(const Value: String); 

  public 
    {Propriedades da classe}
    property PCARGO_COD: String read FCARGO_COD write SetFCARGO_COD; 
    property PATRIBUTO_COD: String read FATRIBUTO_COD write SetFATRIBUTO_COD; 
    property PSTATUS: String read FSTATUS write SetFSTATUS; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean; //Somente altera o Status
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;
    function ConsultarAtributoscargo(condicao:string):TdataSource;

end;

implementation

uses uClassConexao;

function TuClassFP_ATRIBUTOS_CARGOS.Consultar(Condicao: string): TDataSource;
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
                  '  FP_ATRIBUTOS_CARGOS.CARGO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.STATUS '+ 
                  'FROM FP_ATRIBUTOS_CARGOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_ATRIBUTOS_CARGOS.ConsultarAtributoscargo(
  condicao: string): TdataSource;
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
        sql.Text := 'select distinct FP_ATRIBUTOS.DESCRICAO, FP_ATRIBUTOS_CARGOS.CARGO_COD, FP_ATRIBUTOS.TIPO, '+
                    'FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD, fp_atributos_cargos.status, FP_CARGOS.DESCRICAO AS CARGO '+
                    'from FP_ATRIBUTOS_CARGOS '+
                    'inner join FP_ATRIBUTOS on (fp_atributos_cargos.atributo_cod = fp_atributos.atributo_cod) '+
                    'inner join FP_CARGOS on (FP_ATRIBUTOS_CARGOS.CARGO_COD = FP_CARGOS.CARGO_COD) '+
                    ''+condicao+' order by FP_CARGOS.DESCRICAO';
        Open;            
      end;
     ds.DataSet := Qry;
     Result := ds; 

  except on E: Exception do
    raise exception.Create('Ops! Ocorreu um erro: '+e.Message);
  end;
end;

function TuClassFP_ATRIBUTOS_CARGOS.Carregar: Boolean;
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
                  '  FP_ATRIBUTOS_CARGOS.CARGO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.STATUS '+ 
                  'FROM FP_ATRIBUTOS_CARGOS '+
                  'WHERE '+
                  '  FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD = :pATRIBUTO_COD AND '+ 
                  '  FP_ATRIBUTOS_CARGOS.CARGO_COD = :pCARGO_COD'; 
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Open;
        if not IsEmpty then
        begin
          PCARGO_COD:= FieldByName('CARGO_COD').AsString;
          PATRIBUTO_COD:= FieldByName('ATRIBUTO_COD').AsString; 
          PSTATUS:= FieldByName('STATUS').AsString; 
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

function TuClassFP_ATRIBUTOS_CARGOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_ATRIBUTOS_CARGOS SET '+
                  '  FP_ATRIBUTOS_CARGOS.CARGO_COD = :pCARGO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD = :pATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.STATUS = :pSTATUS '+ 
                    'WHERE '+
                  '  FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD = :pATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.CARGO_COD = :pCARGO_COD '; 
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
        Parameters.ParamByName('pSTATUS').Value := FSTATUS;
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

function TuClassFP_ATRIBUTOS_CARGOS.Excluir: Boolean;
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
        SQL.Text := 'delete from FP_ATRIBUTOS_CARGOS '+
                    'WHERE '+
                  '  (FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD = :pATRIBUTO_COD) and '+
                  '  (FP_ATRIBUTOS_CARGOS.CARGO_COD = :pCARGO_COD) '; 
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
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

function TuClassFP_ATRIBUTOS_CARGOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_ATRIBUTOS_CARGOS ('+
                  '  FP_ATRIBUTOS_CARGOS.CARGO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.ATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_CARGOS.STATUS'+ 
                  ') VALUES ('+
                  '  :pCARGO_COD, '+ 
                  '  :pATRIBUTO_COD, '+ 
                  '  :pSTATUS)'; 
        // passa parametros
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
        Parameters.ParamByName('pSTATUS').Value := FSTATUS;
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

procedure TuClassFP_ATRIBUTOS_CARGOS.SetFCARGO_COD(const Value: string);
begin
  FCARGO_COD := Value;
end; 
procedure TuClassFP_ATRIBUTOS_CARGOS.SetFATRIBUTO_COD(const Value: string);
begin
  FATRIBUTO_COD := Value;
end; 
procedure TuClassFP_ATRIBUTOS_CARGOS.SetFSTATUS(const Value: string);
begin
  FSTATUS := Value;
end; 

end.
