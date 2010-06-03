unit uClassFP_COLABORADOR_DEPENDENTES; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_COLABORADOR_DEPENDENTES = class 

  private 
    FPESSOA_COD: String; 
    FCOL_DEP_COD: String; 
    FNOME: String; 
    FCPF: String; 
    FRG: String; 
    FESTUDANTE: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFCOL_DEP_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 
    procedure SetFCPF(const Value: String); 
    procedure SetFRG(const Value: String); 
    procedure SetFESTUDANTE(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PCOL_DEP_COD: String read FCOL_DEP_COD write SetFCOL_DEP_COD; 
    property PNOME: String read FNOME write SetFNOME; 
    property PCPF: String read FCPF write SetFCPF; 
    property PRG: String read FRG write SetFRG; 
    property PESTUDANTE: String read FESTUDANTE write SetFESTUDANTE; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassFP_COLABORADOR_DEPENDENTES.Consultar(Condicao: string): TDataSource;
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
      SQL.Text := 'SELECT  '+
                  'FP_COLABORADOR_DEPENDENTES.PESSOA_COD, '+
                  'FP_COLABORADOR_DEPENDENTES.COL_DEP_COD, '+
                  'FP_COLABORADOR_DEPENDENTES.NOME AS DEPENDENTE, '+
                  'FP_COLABORADOR_DEPENDENTES.CPF, '+
                  'FP_COLABORADOR_DEPENDENTES.RG, '+
                  'FP_COLABORADOR_DEPENDENTES.ESTUDANTE, GE_PESSOAS.NOME '+
                  'FROM FP_COLABORADOR_DEPENDENTES '+
                  'inner join GE_PESSOAS on (FP_COLABORADOR_DEPENDENTES.PESSOA_COD = GE_PESSOAS.PESSOA_COD) '+Condicao+' '+
                  'order by GE_PESSOAS.NOME';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_COLABORADOR_DEPENDENTES.Carregar: Boolean;
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
                  '  FP_COLABORADOR_DEPENDENTES.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.COL_DEP_COD, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.NOME, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.CPF, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.RG, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.ESTUDANTE '+ 
                  'FROM FP_COLABORADOR_DEPENDENTES '+
                  'WHERE '+
                  '  FP_COLABORADOR_DEPENDENTES.COL_DEP_COD = :pCOL_DEP_COD AND '; 
        Parameters.ParamByName('pCOL_DEP_COD').Value := FCOL_DEP_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PCOL_DEP_COD:= FieldByName('COL_DEP_COD').AsString; 
          PNOME:= FieldByName('NOME').AsString; 
          PCPF:= FieldByName('CPF').AsString; 
          PRG:= FieldByName('RG').AsString; 
          PESTUDANTE:= FieldByName('ESTUDANTE').AsString; 
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

function TuClassFP_COLABORADOR_DEPENDENTES.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_COLABORADOR_DEPENDENTES SET '+
                  '  FP_COLABORADOR_DEPENDENTES.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.NOME = :pNOME, '+
                  '  FP_COLABORADOR_DEPENDENTES.CPF = :pCPF, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.RG = :pRG, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.ESTUDANTE = :pESTUDANTE '+ 
                    'WHERE '+
                  '  FP_COLABORADOR_DEPENDENTES.COL_DEP_COD = :pCOL_DEP_COD ';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCOL_DEP_COD').Value := FCOL_DEP_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pCPF').Value := FCPF;
        Parameters.ParamByName('pRG').Value := FRG;
        Parameters.ParamByName('pESTUDANTE').Value := FESTUDANTE;
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

function TuClassFP_COLABORADOR_DEPENDENTES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from FP_COLABORADOR_DEPENDENTES '+
                    'WHERE '+
                  '  FP_COLABORADOR_DEPENDENTES.COL_DEP_COD = :pCOL_DEP_COD';

        Parameters.ParamByName('pCOL_DEP_COD').Value := FCOL_DEP_COD;
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

function TuClassFP_COLABORADOR_DEPENDENTES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_COLABORADOR_DEPENDENTES ('+
                  '  FP_COLABORADOR_DEPENDENTES.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.COL_DEP_COD, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.NOME, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.CPF, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.RG, '+ 
                  '  FP_COLABORADOR_DEPENDENTES.ESTUDANTE'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pCOL_DEP_COD, '+ 
                  '  :pNOME, '+ 
                  '  :pCPF, '+ 
                  '  :pRG, '+ 
                  '  :pESTUDANTE)'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCOL_DEP_COD').Value := FCOL_DEP_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pCPF').Value := FCPF;
        Parameters.ParamByName('pRG').Value := FRG;
        Parameters.ParamByName('pESTUDANTE').Value := FESTUDANTE;
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

procedure TuClassFP_COLABORADOR_DEPENDENTES.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_DEPENDENTES.SetFCOL_DEP_COD(const Value: string);
begin
  FCOL_DEP_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_DEPENDENTES.SetFNOME(const Value: string);
begin
  FNOME := Value;
end; 
procedure TuClassFP_COLABORADOR_DEPENDENTES.SetFCPF(const Value: string);
begin
  FCPF := Value;
end; 
procedure TuClassFP_COLABORADOR_DEPENDENTES.SetFRG(const Value: string);
begin
  FRG := Value;
end; 
procedure TuClassFP_COLABORADOR_DEPENDENTES.SetFESTUDANTE(const Value: string);
begin
  FESTUDANTE := Value;
end; 

end.
