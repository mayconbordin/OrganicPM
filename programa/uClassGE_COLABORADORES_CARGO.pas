unit uClassGE_COLABORADORES_CARGO; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassGE_COLABORADORES_CARGO = class 

  private 
    FPESSOA_COD: String; 
    FDATA_INICIAL: String; 
    FCARGO_COD: String; 
    FSTATUS: String; 
    FDATA_FINAL: String; 
    FHORAS_SEMANAIS: String; 
    FCOL_CAR_MATRICULA: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFDATA_INICIAL(const Value: String); 
    procedure SetFCARGO_COD(const Value: String); 
    procedure SetFSTATUS(const Value: String); 
    procedure SetFDATA_FINAL(const Value: String); 
    procedure SetFHORAS_SEMANAIS(const Value: String); 
    procedure SetFCOL_CAR_MATRICULA(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PDATA_INICIAL: String read FDATA_INICIAL write SetFDATA_INICIAL; 
    property PCARGO_COD: String read FCARGO_COD write SetFCARGO_COD; 
    property PSTATUS: String read FSTATUS write SetFSTATUS; 
    property PDATA_FINAL: String read FDATA_FINAL write SetFDATA_FINAL; 
    property PHORAS_SEMANAIS: String read FHORAS_SEMANAIS write SetFHORAS_SEMANAIS; 
    property PCOL_CAR_MATRICULA: String read FCOL_CAR_MATRICULA write SetFCOL_CAR_MATRICULA; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;
    function MaiorTempoServico: Boolean;

end;

implementation

uses uClassConexao;

function TuClassGE_COLABORADORES_CARGO.Consultar(Condicao: string): TDataSource;
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
      SQL.Text := 'SELECT distinct '+
                  'GE_COLABORADORES_CARGO.PESSOA_COD, '+
                  'GE_COLABORADORES_CARGO.DATA_INICIAL, '+
                  'GE_COLABORADORES_CARGO.CARGO_COD, '+
                  'GE_COLABORADORES_CARGO.STATUS, '+
                  'GE_COLABORADORES_CARGO.DATA_FINAL, '+
                  'GE_COLABORADORES_CARGO.HORAS_SEMANAIS, '+
                  'GE_COLABORADORES_CARGO.COL_CAR_MATRICULA, GE_PESSOAS.NOME, FP_CARGOS.DESCRICAO '+
                  'FROM GE_COLABORADORES_CARGO '+
                  'inner join GE_PESSOAS on (GE_COLABORADORES_CARGO.PESSOA_COD = GE_PESSOAS.PESSOA_COD) '+
                  'inner join FP_CARGOS on (GE_COLABORADORES_CARGO.CARGO_COD = FP_CARGOS.CARGO_COD) '+Condicao+' '+
                  'order by GE_PESSOAS.NOME';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;


function TuClassGE_COLABORADORES_CARGO.MaiorTempoServico: Boolean;
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
        SQL.Text := 'SELECT  CARGO_COD, DATA_INICIAL '+
                  'FROM GE_COLABORADORES_CARGO '+
                  'WHERE  rownum<=1 and  '+
                  '  GE_COLABORADORES_CARGO.PESSOA_COD = :pPESSOA_COD'+
                  ' and GE_COLABORADORES_CARGO.STATUS = ''A'' ' +
                  ' order by(GE_COLABORADORES_CARGO.DATA_INICIAL) ASC ';
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;

        Open;
        if not IsEmpty then
        begin
          PDATA_INICIAL:= FieldByName('DATA_INICIAL').AsString;
          PCARGO_COD:= FieldByName('CARGO_COD').AsString;
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





function TuClassGE_COLABORADORES_CARGO.Carregar: Boolean;
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
                  '  GE_COLABORADORES_CARGO.PESSOA_COD, '+ 
                  '  GE_COLABORADORES_CARGO.DATA_INICIAL, '+ 
                  '  GE_COLABORADORES_CARGO.CARGO_COD, '+ 
                  '  GE_COLABORADORES_CARGO.STATUS, '+ 
                  '  GE_COLABORADORES_CARGO.DATA_FINAL, '+ 
                  '  GE_COLABORADORES_CARGO.HORAS_SEMANAIS, '+ 
                  '  GE_COLABORADORES_CARGO.COL_CAR_MATRICULA '+ 
                  'FROM GE_COLABORADORES_CARGO '+
                  'WHERE '+
                  '  GE_COLABORADORES_CARGO.COL_CAR_MATRICULA = :pCOL_CAR_MATRICULA AND '+ 
                  '  GE_COLABORADORES_CARGO.CARGO_COD = :pCARGO_COD AND '+ 
                  '  GE_COLABORADORES_CARGO.PESSOA_COD = :pPESSOA_COD'; 
        Parameters.ParamByName('pCOL_CAR_MATRICULA').Value := FCOL_CAR_MATRICULA;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PDATA_INICIAL:= FieldByName('DATA_INICIAL').AsString; 
          PCARGO_COD:= FieldByName('CARGO_COD').AsString; 
          PSTATUS:= FieldByName('STATUS').AsString; 
          PDATA_FINAL:= FieldByName('DATA_FINAL').AsString; 
          PHORAS_SEMANAIS:= FieldByName('HORAS_SEMANAIS').AsString; 
          PCOL_CAR_MATRICULA:= FieldByName('COL_CAR_MATRICULA').AsString; 
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

function TuClassGE_COLABORADORES_CARGO.Editar: Boolean;
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
        SQL.Text := 'UPDATE GE_COLABORADORES_CARGO SET '+
                  '  GE_COLABORADORES_CARGO.DATA_INICIAL = TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+
                  '  GE_COLABORADORES_CARGO.STATUS = :pSTATUS, '+
                  '  GE_COLABORADORES_CARGO.DATA_FINAL = TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+
                  '  GE_COLABORADORES_CARGO.HORAS_SEMANAIS = :pHORAS_SEMANAIS, '+
                    'WHERE '+
                  '  GE_COLABORADORES_CARGO.COL_CAR_MATRICULA = :pCOL_CAR_MATRICULA, '+ 
                  '  GE_COLABORADORES_CARGO.CARGO_COD = :pCARGO_COD, '+ 
                  '  GE_COLABORADORES_CARGO.PESSOA_COD = :pPESSOA_COD '; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pSTATUS').Value := FSTATUS;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pHORAS_SEMANAIS').Value := FHORAS_SEMANAIS;
        Parameters.ParamByName('pCOL_CAR_MATRICULA').Value := FCOL_CAR_MATRICULA;
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

function TuClassGE_COLABORADORES_CARGO.Excluir: Boolean;
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
        SQL.Text := 'DELETE from GE_COLABORADORES_CARGO '+
                    'WHERE '+
                  '  GE_COLABORADORES_CARGO.COL_CAR_MATRICULA = :pCOL_CAR_MATRICULA, '+ 
                  '  GE_COLABORADORES_CARGO.CARGO_COD = :pCARGO_COD, '+ 
                  '  GE_COLABORADORES_CARGO.PESSOA_COD = :pPESSOA_COD '; 
        Parameters.ParamByName('pCOL_CAR_MATRICULA').Value := FCOL_CAR_MATRICULA;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
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

function TuClassGE_COLABORADORES_CARGO.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO GE_COLABORADORES_CARGO ('+
                  '  GE_COLABORADORES_CARGO.PESSOA_COD, '+ 
                  '  GE_COLABORADORES_CARGO.DATA_INICIAL, '+ 
                  '  GE_COLABORADORES_CARGO.CARGO_COD, '+ 
                  '  GE_COLABORADORES_CARGO.STATUS, '+ 
                  '  GE_COLABORADORES_CARGO.DATA_FINAL, '+ 
                  '  GE_COLABORADORES_CARGO.HORAS_SEMANAIS, '+ 
                  '  GE_COLABORADORES_CARGO.COL_CAR_MATRICULA'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+ 
                  '  :pCARGO_COD, '+ 
                  '  :pSTATUS, '+ 
                  '  TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+ 
                  '  :pHORAS_SEMANAIS, '+ 
                  '  :pCOL_CAR_MATRICULA)'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pSTATUS').Value := FSTATUS;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pHORAS_SEMANAIS').Value := FHORAS_SEMANAIS;
        Parameters.ParamByName('pCOL_CAR_MATRICULA').Value := FCOL_CAR_MATRICULA;
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

procedure TuClassGE_COLABORADORES_CARGO.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassGE_COLABORADORES_CARGO.SetFDATA_INICIAL(const Value: string);
begin
  FDATA_INICIAL := Value;
end; 
procedure TuClassGE_COLABORADORES_CARGO.SetFCARGO_COD(const Value: string);
begin
  FCARGO_COD := Value;
end; 
procedure TuClassGE_COLABORADORES_CARGO.SetFSTATUS(const Value: string);
begin
  FSTATUS := Value;
end; 
procedure TuClassGE_COLABORADORES_CARGO.SetFDATA_FINAL(const Value: string);
begin
  FDATA_FINAL := Value;
end; 
procedure TuClassGE_COLABORADORES_CARGO.SetFHORAS_SEMANAIS(const Value: string);
begin
  FHORAS_SEMANAIS := Value;
end; 
procedure TuClassGE_COLABORADORES_CARGO.SetFCOL_CAR_MATRICULA(const Value: string);
begin
  FCOL_CAR_MATRICULA := Value;
end; 

end.
