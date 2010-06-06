unit uClassSB_CADASTRO_FERIAS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_CADASTRO_FERIAS = class 

  private 
    FPESSOA_COD: String;
    FCAD_FER_DATA_INICIO: String;
    FCAD_FER_DATA_FIM: String;


    procedure SetFPESSOA_COD(const Value: String);
    procedure SetFCAD_FER_DATA_INICIO(const Value: String);
    procedure SetFCAD_FER_DATA_FIM(const Value: String);



  public
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD;
    property PCAD_FER_DATA_INICIO: String read FCAD_FER_DATA_INICIO write SetFCAD_FER_DATA_INICIO;
    property PCAD_FER_DATA_FIM: String read FCAD_FER_DATA_FIM write SetFCAD_FER_DATA_FIM;


    {Métodos da classe}
    function Salvar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function ConsultarFerias(Condicao: string): TDataSource;

    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassSB_CADASTRO_FERIAS.Consultar(Condicao: string): TDataSource;
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
                  '  SB_CADASTRO_FERIAS.PESSOA_COD, '+
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_INICIO, '+
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_FIM '+
                  'FROM SB_CADASTRO_FERIAS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;




function TuClassSB_CADASTRO_FERIAS.ConsultarFerias(Condicao: string): TDataSource;
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
      SQL.Text := 'select '+
                  'SB_CADASTRO_FERIAS.PESSOA_COD, '+
                  'GE_PESSOAS.NOME, '+
                  'SB_CADASTRO_FERIAS.CAD_FER_DATA_FIM, '+
                  'SB_CADASTRO_FERIAS.CAD_FER_DATA_INICIO '+
                  'from SB_CADASTRO_FERIAS '+
                  'inner join GE_PESSOAS on '+
                  '(SB_CADASTRO_FERIAS.PESSOA_COD = GE_PESSOAS.PESSOA_COD) '+
                  Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;












function TuClassSB_CADASTRO_FERIAS.Carregar: Boolean;
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
                  '  SB_CADASTRO_FERIAS.PESSOA_COD, '+ 
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_INICIO, '+ 
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_FIM '+ 
                  'FROM SB_CADASTRO_FERIAS '+
                  'WHERE '+
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_INICIO = :pCAD_FER_DATA_INICIO AND '+ 
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_FIM = :pCAD_FER_DATA_FIM AND '+ 
                  '  SB_CADASTRO_FERIAS.PESSOA_COD = :pPESSOA_COD'; 
        Parameters.ParamByName('pCAD_FER_DATA_INICIO').Value := FCAD_FER_DATA_INICIO;
        Parameters.ParamByName('pCAD_FER_DATA_FIM').Value := FCAD_FER_DATA_FIM;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PCAD_FER_DATA_INICIO:= FieldByName('CAD_FER_DATA_INICIO').AsString; 
          PCAD_FER_DATA_FIM:= FieldByName('CAD_FER_DATA_FIM').AsString; 
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


function TuClassSB_CADASTRO_FERIAS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_CADASTRO_FERIAS '+
                    'WHERE '+
                    'SB_CADASTRO_FERIAS.CAD_FER_DATA_INICIO = TO_DATE(:pCAD_FER_DATA_INICIO,''DD/MM/RR'') '+
                    'and SB_CADASTRO_FERIAS.CAD_FER_DATA_FIM = TO_DATE(:pCAD_FER_DATA_FIM,''DD/MM/RR'') '+
                  '  and SB_CADASTRO_FERIAS.PESSOA_COD = :pPESSOA_COD ';
        Parameters.ParamByName('pCAD_FER_DATA_INICIO').Value := FCAD_FER_DATA_INICIO;
        Parameters.ParamByName('pCAD_FER_DATA_FIM').Value := FCAD_FER_DATA_FIM;
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

function TuClassSB_CADASTRO_FERIAS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_CADASTRO_FERIAS ('+
                  '  SB_CADASTRO_FERIAS.PESSOA_COD, '+ 
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_INICIO, '+ 
                  '  SB_CADASTRO_FERIAS.CAD_FER_DATA_FIM'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  TO_DATE(:pCAD_FER_DATA_INICIO,''DD/MM/RR''), '+ 
                  '  TO_DATE(:pCAD_FER_DATA_FIM,''DD/MM/RR'') )'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCAD_FER_DATA_INICIO').Value := FCAD_FER_DATA_INICIO;
        Parameters.ParamByName('pCAD_FER_DATA_FIM').Value := FCAD_FER_DATA_FIM;
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





procedure TuClassSB_CADASTRO_FERIAS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassSB_CADASTRO_FERIAS.SetFCAD_FER_DATA_INICIO(const Value: string);
begin
  FCAD_FER_DATA_INICIO := Value;
end; 
procedure TuClassSB_CADASTRO_FERIAS.SetFCAD_FER_DATA_FIM(const Value: string);
begin
  FCAD_FER_DATA_FIM := Value;
end;

end.
