unit uClassFP_COLABORADOR_BENEFICIOS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_COLABORADOR_BENEFICIOS = class 

  private 
    FVALOR: String; 
    FCOL_BEN_COD: String; 
    FPESSOA_COD: String; 
    FDATA_FINAL: String; 
    FDATA_INICIAL: String; 
    FDESCRICAO: String; 
    procedure SetFVALOR(const Value: String); 
    procedure SetFCOL_BEN_COD(const Value: String); 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFDATA_FINAL(const Value: String); 
    procedure SetFDATA_INICIAL(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 

  public 
    {Propriedades da classe}
    property PVALOR: String read FVALOR write SetFVALOR; 
    property PCOL_BEN_COD: String read FCOL_BEN_COD write SetFCOL_BEN_COD; 
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PDATA_FINAL: String read FDATA_FINAL write SetFDATA_FINAL; 
    property PDATA_INICIAL: String read FDATA_INICIAL write SetFDATA_INICIAL; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassFP_COLABORADOR_BENEFICIOS.Consultar(Condicao: string): TDataSource;
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
                  '  FP_COLABORADOR_BENEFICIOS.VALOR, '+
                  '  FP_COLABORADOR_BENEFICIOS.COL_BEN_COD, '+
                  '  FP_COLABORADOR_BENEFICIOS.PESSOA_COD, '+
                  '  FP_COLABORADOR_BENEFICIOS.DATA_FINAL, '+
                  '  FP_COLABORADOR_BENEFICIOS.DATA_INICIAL, '+
                  '  FP_COLABORADOR_BENEFICIOS.DESCRICAO, GE_PESSOAS.NOME '+
                  'FROM FP_COLABORADOR_BENEFICIOS '+
                  'inner join GE_PESSOAS on (FP_COLABORADOR_BENEFICIOS.PESSOA_COD = GE_PESSOAS.PESSOA_COD)'  +Condicao+' '+
                  'order by GE_PESSOAS.PESSOA_COD';

      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_COLABORADOR_BENEFICIOS.Carregar: Boolean;
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
                  '  FP_COLABORADOR_BENEFICIOS.VALOR, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.COL_BEN_COD, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DATA_FINAL, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DATA_INICIAL, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DESCRICAO '+ 
                  'FROM FP_COLABORADOR_BENEFICIOS '+
                  'WHERE '+
                  '  FP_COLABORADOR_BENEFICIOS.COL_BEN_COD = :pCOL_BEN_COD '; 
        Parameters.ParamByName('pCOL_BEN_COD').Value := FCOL_BEN_COD;
        Open;
        if not IsEmpty then
        begin
          PVALOR:= FieldByName('VALOR').AsString; 
          PCOL_BEN_COD:= FieldByName('COL_BEN_COD').AsString; 
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PDATA_FINAL:= FieldByName('DATA_FINAL').AsString; 
          PDATA_INICIAL:= FieldByName('DATA_INICIAL').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
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

function TuClassFP_COLABORADOR_BENEFICIOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_COLABORADOR_BENEFICIOS SET '+
                  '  FP_COLABORADOR_BENEFICIOS.VALOR = :pVALOR, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.PESSOA_COD = :pPESSOA_COD, '+
                  '  FP_COLABORADOR_BENEFICIOS.DATA_FINAL = TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DATA_INICIAL = TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DESCRICAO = :pDESCRICAO '+ 
                    'WHERE '+
                  '  FP_COLABORADOR_BENEFICIOS.COL_BEN_COD = :pCOL_BEN_COD '; 
        Parameters.ParamByName('pVALOR').Value := FVALOR;
        Parameters.ParamByName('pCOL_BEN_COD').Value := FCOL_BEN_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
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

function TuClassFP_COLABORADOR_BENEFICIOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from FP_COLABORADOR_BENEFICIOS '+
                    'WHERE '+
                  '  FP_COLABORADOR_BENEFICIOS.COL_BEN_COD = :pCOL_BEN_COD';
        Parameters.ParamByName('pCOL_BEN_COD').Value := FCOL_BEN_COD;
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

function TuClassFP_COLABORADOR_BENEFICIOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_COLABORADOR_BENEFICIOS ('+
                  '  FP_COLABORADOR_BENEFICIOS.VALOR, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.COL_BEN_COD, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DATA_FINAL, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DATA_INICIAL, '+ 
                  '  FP_COLABORADOR_BENEFICIOS.DESCRICAO'+ 
                  ') VALUES ('+
                  '  :pVALOR, '+ 
                  '  :pCOL_BEN_COD, '+ 
                  '  :pPESSOA_COD, '+ 
                  '  TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+ 
                  '  TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+ 
                  '  :pDESCRICAO)'; 
        // passa parametros
        Parameters.ParamByName('pVALOR').Value := FVALOR;
        Parameters.ParamByName('pCOL_BEN_COD').Value := FCOL_BEN_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
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

procedure TuClassFP_COLABORADOR_BENEFICIOS.SetFVALOR(const Value: string);
begin
  FVALOR := Value;
end; 
procedure TuClassFP_COLABORADOR_BENEFICIOS.SetFCOL_BEN_COD(const Value: string);
begin
  FCOL_BEN_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_BENEFICIOS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_BENEFICIOS.SetFDATA_FINAL(const Value: string);
begin
  FDATA_FINAL := Value;
end; 
procedure TuClassFP_COLABORADOR_BENEFICIOS.SetFDATA_INICIAL(const Value: string);
begin
  FDATA_INICIAL := Value;
end; 
procedure TuClassFP_COLABORADOR_BENEFICIOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 

end.
