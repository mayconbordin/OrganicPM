unit uClassFP_ATRIBUTOS_COLABORADORES;

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_ATRIBUTOS_COLABORADORES = class 

  private 
    FPESSOA_COD: String; 
    FATRIBUTO_COD: String; 
    FSTATUS: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFATRIBUTO_COD(const Value: String); 
    procedure SetFSTATUS(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PATRIBUTO_COD: String read FATRIBUTO_COD write SetFATRIBUTO_COD; 
    property PSTATUS: String read FSTATUS write SetFSTATUS; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;
    function ConsultaAtributosColaboradores(Condicao:string): TdataSource;

end;

implementation

uses uClassConexao;

function TuClassFP_ATRIBUTOS_COLABORADORES.ConsultaAtributosColaboradores(
  Condicao: string): TdataSource;
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
      SQL.Text := 'select distinct FP_ATRIBUTOS.DESCRICAO, FP_ATRIBUTOS_COLABORADORES.PESSOA_COD, FP_ATRIBUTOS.TIPO, '+
                  'FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD, FP_ATRIBUTOS_COLABORADORES.STATUS, GE_PESSOAS.NOME '+
                  'from FP_ATRIBUTOS_COLABORADORES '+
                  'inner join FP_ATRIBUTOS on (FP_ATRIBUTOS_COLABORADORES.atributo_cod = fp_atributos.atributo_cod) '+
                  'inner join GE_PESSOAS on (FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = GE_PESSOAS.PESSOA_COD) '+
                  ''+Condicao+' '+
                  'order by GE_PESSOAS.NOME';

      Open;
    end;
   ds.DataSet := Qry;
   Result := ds;

  except on E: Exception do
    raise Exception.Create('Ops! Ocorreu um erro: '+e.Message);
  end;
end;

function TuClassFP_ATRIBUTOS_COLABORADORES.Consultar(Condicao: string): TDataSource;
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
                  '  FP_ATRIBUTOS_COLABORADORES.PESSOA_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.STATUS '+ 
                  'FROM FP_ATRIBUTOS_COLABORADORES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_ATRIBUTOS_COLABORADORES.Carregar: Boolean;
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
                  '  FP_ATRIBUTOS_COLABORADORES.PESSOA_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.STATUS '+ 
                  'FROM FP_ATRIBUTOS_COLABORADORES '+
                  'WHERE '+
                  '  FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD = :pATRIBUTO_COD AND '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = :pPESSOA_COD'; 
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
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

function TuClassFP_ATRIBUTOS_COLABORADORES.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_ATRIBUTOS_COLABORADORES SET '+
                  '  FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD = :pATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.STATUS = :pSTATUS '+ 
                    'WHERE '+
                  '  FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD = :pATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = :pPESSOA_COD '; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

function TuClassFP_ATRIBUTOS_COLABORADORES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from FP_ATRIBUTOS_COLABORADORES '+
                    'WHERE '+
                  '  (FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD = :pATRIBUTO_COD) and '+
                  '  (FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = :pPESSOA_COD) '; 
        Parameters.ParamByName('pATRIBUTO_COD').Value := FATRIBUTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

function TuClassFP_ATRIBUTOS_COLABORADORES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_ATRIBUTOS_COLABORADORES ('+
                  '  FP_ATRIBUTOS_COLABORADORES.PESSOA_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.ATRIBUTO_COD, '+ 
                  '  FP_ATRIBUTOS_COLABORADORES.STATUS'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pATRIBUTO_COD, '+ 
                  '  :pSTATUS)'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

procedure TuClassFP_ATRIBUTOS_COLABORADORES.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassFP_ATRIBUTOS_COLABORADORES.SetFATRIBUTO_COD(const Value: string);
begin
  FATRIBUTO_COD := Value;
end; 
procedure TuClassFP_ATRIBUTOS_COLABORADORES.SetFSTATUS(const Value: string);
begin
  FSTATUS := Value;
end; 

end.
